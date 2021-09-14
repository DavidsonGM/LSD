-- *****************************************************
--      Circuito: Cruzamento com dois sinais de trânsito,
-- construido utilizando uma máquina de estados com
-- os estados possíveis combinados desses sinais
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
-- *****************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY testbench_cruzamento IS END;

architecture tb_cruzamento of testbench_cruzamento is
    component cruzamento is port(
        sensorA, sensorB, chave, clock :in std_logic;
        semaforoA, semaforoB :out std_logic_vector(2 DOWNTO 0);
        cont_dezena, cont_unidade :out std_logic_vector(3 DOWNTO 0)); 
    end component;

    signal clk : std_logic := '1';
    signal key, sensor_A, sensor_B : std_logic;

begin
    cruz: cruzamento PORT MAP (clock => clk, chave => key, sensorA => sensor_A,
                               sensorB => sensor_B, semaforoA => open, semaforoB => open,
                               cont_dezena => open, cont_unidade => open);

    clk <= not clk after 0.5 sec;

    estimulo: PROCESS
    begin                                                              --   Setando o sensor B para 1 e o A para 0
        key <= '0'; sensor_A <= '0'; sensor_B <= '1'; wait for 9.5 sec;  -- para mostrar tanto a mudança com 20s e com 60s.
        key <= '1'; wait for 10 sec;                                   --   Ligando os semáforos.
        key <= '0'; wait for 10 sec;                                   --   Desligando os semáforos temporariamente.
        key <= '1'; wait;                                              --   Religando os semáforos.
    end PROCESS estimulo;
end tb_cruzamento;
