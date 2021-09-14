-- ****************************************** 
--  Circuito: Contador módulo 10 
--          Clock, reset,
--  low_enable, low_RCI, load - Entradas
--          D   Vetor de Entrada
--          Q   Vetor de Saída
--          low_RCO - Ripple carry out 
--  ativo em nível baixo, usado para
--  cascatear contadores de módulo 10
-- ******************************************
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.ALL;
--------------------------------------------------------
entity contador10 is port(
    clock, reset, low_enable, low_RCI, load :in std_logic;
    D :in std_logic_vector(3 DOWNTO 0);
    Q :out std_logic_vector(3 DOWNTO 0);
    low_RCO :out std_logic);
end contador10;
--------------------------------------------------------

architecture contador10_arch of contador10 is
    type estado is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, ST8, ST9);
    signal currentState, nextState, loadState : estado;

begin
    with D select
        loadState <= ST0 when "0000",
                     ST1 when "0001",
                     ST2 when "0010",
                     ST3 when "0011",
                     ST4 when "0100",
                     ST5 when "0101",
                     ST6 when "0110",
                     ST7 when "0111",
                     ST8 when "1000",
                     ST9 when "1001",
                     ST0 when others;

    sync_proc: process (clock)
    begin
        if rising_edge(clock) then
            currentState <= nextState;
        end if;
    end process sync_proc;

    comb_proc: process (currentState, reset, low_enable, low_RCI, load, loadState)
    begin
        case currentState is

            when ST0 =>
                Q <= "0000";
                low_RCO <= '1';
                if (reset = '1') then nextState <= ST0;
                elsif (load = '1') then nextState <= loadState;
                elsif ((low_enable = '0') and (low_RCI = '0')) then nextState <= ST1;
                else nextState <= ST0;
                end if;

            when ST1 =>
                Q <= "0001";
                low_RCO <= '1';
                if (reset = '1') then nextState <= ST0;
                elsif (load = '1') then nextState <= loadState;
                elsif ((low_enable = '0') and (low_RCI = '0')) then nextState <= ST2;
                else nextState <= ST1;
                end if;

            when ST2 =>
                Q <= "0010";
                low_RCO <= '1';
                if (reset = '1') then nextState <= ST0;
                elsif (load = '1') then nextState <= loadState;
                elsif ((low_enable = '0') and (low_RCI = '0')) then nextState <= ST3;
                else nextState <= ST2;
                end if;

            when ST3 =>
                Q <= "0011";
                low_RCO <= '1';
                if (reset = '1') then nextState <= ST0;
                elsif (load = '1') then nextState <= loadState;
                elsif ((low_enable = '0') and (low_RCI = '0')) then nextState <= ST4;
                else nextState <= ST3;
                end if;

            when ST4 =>
                Q <= "0100";
                low_RCO <= '1';
                if (reset = '1') then nextState <= ST0;
                elsif (load = '1') then nextState <= loadState;
                elsif ((low_enable = '0') and (low_RCI = '0')) then nextState <= ST5;
                else nextState <= ST4;
                end if;

            when ST5 =>
                Q <= "0101";
                low_RCO <= '1';
                if (reset = '1') then nextState <= ST0;
                elsif ( load = '1') then nextState <= loadState;
                elsif ((low_enable = '0') and (low_RCI = '0')) then nextState <= ST6;
                else nextState <= ST5;
                end if;

            when ST6 =>
                Q <= "0110";
                low_RCO <= '1';
                if (reset = '1') then nextState <= ST0;
                elsif (load = '1') then nextState <= loadState;
                elsif ((low_enable = '0') and (low_RCI = '0')) then nextState <= ST7;
                else nextState <= ST6;
                end if;

            when ST7 =>
                Q <= "0111";
                low_RCO <= '1';
                if (reset = '1') then nextState <= ST0;
                elsif (load = '1') then nextState <= loadState;
                elsif ((low_enable = '0') and (low_RCI = '0')) then nextState <= ST8;
                else nextState <= ST7;
                end if;

            when ST8 =>
                Q <= "1000";
                low_RCO <= '1';
                if (reset = '1') then nextState <= ST0;
                elsif (load = '1') then nextState <= loadState;
                elsif ((low_enable = '0') and (low_RCI = '0')) then nextState <= ST9;
                else nextState <= ST8;
                end if;

            when ST9 =>
                Q <= "1001";
                low_RCO <= '0';
                if (reset = '1') then nextState <= ST0;
                elsif (load = '1') then nextState <= loadState;
                elsif ((low_enable = '0') and (low_RCI = '0')) then nextState <= ST0;
                else nextState <= ST9;
                end if;

            when others =>
                Q <= "0000";
                low_RCO <= '1';
                if (reset = '1') then nextState <= ST0;
                elsif (load = '1') then nextState <= loadState;
                elsif ((low_enable = '0') and (low_RCI = '0')) then nextState <= ST1;
                else nextState <= ST0;
                end if;

        end case;
    end process comb_proc;
end contador10_arch;
