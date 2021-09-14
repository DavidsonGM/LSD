-- *****************************************************
--  Circuito: Máquina de estado síncrona do tipo
--  Moore para controlar uma máquina de refrigerantes
--          clock, reset - Entradas assíncronas
--          A - Entrada síncrona
--          STinit, ST25, ST50, ST75, ST100
--      ST125, D25, D50, D75 - Possíveis
--      estados que a máquina pode assumir
--          refrigerante, troco25, troco50 - Possíveis 
--      saídas da máquina
-- *****************************************************
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.ALL;
--------------------------------------------------------
entity maquinaEstados is port(
    A : in std_logic_vector(1 DOWNTO 0);
    clock, reset : in std_logic;
    -- Y : out std_logic_vector(2 DOWNTO 0));
    refrigerante, troco25, troco50 : out std_logic);
end maquinaEstados;
--------------------------------------------------------
architecture maquinaEstados_arch of maquinaEstados is


    type estado is (STinit, ST25, ST50, ST75, ST100, ST125, D25, D50, D75);

    signal currentState, nextState : estado;
    signal Y : std_logic_vector(2 DOWNTO 0);

begin

    sync_proc: process (clock, reset)
    begin
        if (reset = '1') then
            currentState <= STinit;
        elsif rising_edge(clock) then
            currentState <= nextState;
        end if;
    end process sync_proc;

    comb_proc: process(currentState, A)
    begin
        case currentState is
            when STinit => Y <= "000";
                case A is
                    when "01" => nextState <= ST25;
                    when "10" => nextState <= ST50;
                    when others => nextState <= STinit;
                end case;
            when ST25 => Y <= "000";
                case A is
                    when "00" => nextState <= ST25;
                    when "01" => nextState <= ST50;
                    when "10" => nextState <= ST75;
                    when others => nextState <= D25;
                end case;
            when ST50 => Y <= "000";
                case A is
                    when "00" => nextState <= ST50;
                    when "01" => nextState <= ST75;
                    when "10" => nextState <= ST100;
                    when others => nextState <= D50;
                end case;
            when ST75 => Y <= "000";
                case A is
                    when "00" => nextState <= ST75;
                    when "01" => nextState <= ST100;
                    when "10" => nextState <= ST125;
                    when others => nextState <= D75;
                end case;
            when ST100 => Y <= "100";
                case A is
                    when "01" => nextState <= ST25;
                    when "10" => nextState <= ST50;
                    when others => nextState <= STinit;
                end case;
            when ST125 => Y <= "110";
                case A is
                    when "01" => nextState <= ST25;
                    when "10" => nextState <= ST50;
                    when others => nextState <= STinit;
                end case;
            when D25 => Y <= "010";
                case A is
                    when "01" => nextState <= ST25;
                    when "10" => nextState <= ST50;
                    when others => nextState <= STinit;
                end case;
            when D50 => Y <= "001";
                case A is
                    when "01" => nextState <= ST25;
                    when "10" => nextState <= ST50;
                    when others => nextState <= STinit;
                end case;
            when D75 => Y <= "011";
                case A is
                    when "01" => nextState <= ST25;
                    when "10" => nextState <= ST50;
                    when others => nextState <= STinit;
                end case;
            when others =>
                Y <= "000";
                nextState <= STinit;
        end case;
    end process comb_proc;
    refrigerante <= Y(2);
    troco25 <= Y(1);
    troco50 <= Y(0);
end maquinaEstados_arch;                        