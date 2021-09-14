-- *****************************************************
--      Circuito: Máquina de estados feita para
--  implementar um cruzamento com dois sinais de trânsito,
-- construido utilizando um componente timeFlags que
-- indica quando passaram 5, 6, 20 e 60 segundos
--          sensorA, sensorB - Entradas que indicam
-- se está passando carro ou não em cada sinal
--          chave - Entrada que indica se os
-- semáforos devem estar ativos ou não
--          clock - Sinal de clock
--          semaforoA, semaforoB - Saídas de 3 bits
-- indicando o estado atual dos semáforos, sendo
-- 100, 010 e 001 para vermelho, amarelo e verde,
-- respectivamente
--          cont_dezena, cont_unidade - Saída
-- indicando a contagem do tempo
--          resetcounter - Saída indicando quando
-- a contagem do tempo foi resetada
-- *****************************************************

library IEEE;
use IEEE.std_logic_1164.ALL;
--------------------------------------------------------
entity maqestados is port(
    sensorA, sensorB, chave, clock :in std_logic;
    semaforoA, semaforoB :out std_logic_vector(2 DOWNTO 0);
    cont_dezena, cont_unidade :out std_logic_vector(3 DOWNTO 0);
    resetcounter :out std_logic);
end maqestados;
--------------------------------------------------------

architecture maqestados_arch of maqestados is
    component timeFlags is port(
        clock, reset :in std_logic;
        T5, T6, T20, T60 :out std_logic;
        cont_dezena, cont_unidade :out std_logic_vector(3 DOWNTO 0)); 
    end component; 

    type estado is (RR1, RG, RY, RR2, GR, YR, YY, NN);
    signal currentState, nextState : estado;
    signal rst, T5_signal, T6_signal, T20_signal, T60_signal : std_logic;
begin
    tflag: timeFlags PORT MAP (clock => clock, reset => rst, cont_dezena => cont_dezena, cont_unidade => cont_unidade,
                                T5 => T5_signal, T6 => T6_signal, T20 => T20_signal, T60 => T60_signal);
    resetcounter <= rst;

    sync_proc: process(clock)
    begin
        if rising_edge(clock) then
            currentState <= nextState;
        end if;
    end process sync_proc;

    comb_proc: process(currentState, T5_signal, T6_signal, T20_signal, T60_signal, sensorA, sensorB, chave)
    begin
        case currentState is

            when RR1 =>
                semaforoA <= "100"; semaforoB <= "100";
                if chave = '0' then nextState <= YY; rst <= '1';
                elsif (T5_signal = '1') then nextState <= RG; rst <= '1';
                else nextState <= RR1; rst <= '0';
                end if;
            
            when RG =>
                semaforoA <= "100"; semaforoB <= "001";
                if chave = '0' then nextState <= YY; rst <= '1';
                elsif (T20_signal = '1' and sensorA = '1' and sensorB = '0') or (T60_signal = '1') then
                    nextState <= RY; rst <= '1';
                else
                    nextState <= RG; rst <= '0';
                end if;
            
            when RY => 
                semaforoA <= "100"; semaforoB <= "010";
                if chave = '0' then nextState <= YY; rst <= '1';
                elsif (T6_signal = '1') then nextState <= RR2; rst <= '1';
                else nextState <= RY; rst <= '0';
                end if;
            
            when RR2 =>
                semaforoA <= "100"; semaforoB <= "100";
                if chave = '0' then nextState <= YY; rst <= '1';
                elsif (T5_signal = '1') then nextState <= GR; rst <= '1';
                else nextState <= RR2; rst <= '0';
                end if;

            when GR =>
                semaforoA <= "001"; semaforoB <= "100";
                if chave = '0' then nextState <= YY; rst <= '1';
                elsif (T20_signal = '1' and sensorA = '0' and sensorB = '1') or (T60_signal = '1') then
                    nextState <= YR; rst <= '1';
                else
                    nextState <= GR; rst <= '0';
                end if;

            when YR => 
                semaforoA <= "010"; semaforoB <= "100";
                if chave = '0' then nextState <= YY; rst <= '1';
                elsif (T6_signal = '1') then nextState <= RR1; rst <= '1';
                else nextState <= YR; rst <= '0';
                end if;

            when YY =>
                if chave = '1' then nextState <= GR; rst <= '1';
                else
                    semaforoA <= "010"; semaforoB <= "010";
                    nextState <= NN; rst <= '1';
                end if;
            
            when NN =>
                if chave = '1' then nextState <= GR; rst <= '1';
                else        
                    semaforoA <= "000"; semaforoB <= "000";
                    nextState <= YY; rst <= '1';
                end if;

        end case;
    end process comb_proc;
end architecture maqestados_arch;
                