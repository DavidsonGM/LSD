-- ************************************************
--  Testbench para simulacao Funcional do
--  Circuito: flip-fLop JK
--  gatilhado pela borda de subida
--          PR, CLR - Entradas assíncronas
--          CLK - Clock
--           JK - Entrada síncrona
--            Q - Saída
-- ************************************************
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.all;
------------------------------------------------------

entity testbench_exp6ex1 IS END;

architecture tb_exp6ex1 of testbench_exp6ex1 is

    component EXP6EX1

    port (
        PR, CLR, CLK :in std_logic;
        JK :in std_logic_vector(1 DOWNTO 0);
        Q :out std_logic);
    end component;
------------------------------------------------------
    signal pr, clr: std_logic;
    signal clk : std_logic := '0';
    signal jk : std_logic_vector(1 DOWNTO 0);

    Begin

    flp: EXP6EX1 PORT MAP (PR => pr, CLR => clr, CLK => clk, JK => jk, Q => open);
    clk <= not clk after 5 ns;

    estimulo: PROCESS
    begin
        pr <= '0'; clr <= '1';
        for i in 0 to 3 loop
            jk <= std_logic_vector(to_unsigned(i, 2));
            wait for 10 ns;
        end loop;

        pr <= '1';
        for i in 0 to 3 loop
            jk <= std_logic_vector(to_unsigned(i, 2));
            wait for 10 ns;
        end loop;

        clr <= '0';
        for i in 0 to 3 loop
            jk <= std_logic_vector(to_unsigned(i, 2));
            wait for 10 ns;
        end loop;

        pr <= '0';
        for i in 0 to 3 loop
            jk <= std_logic_vector(to_unsigned(i, 2));
            wait for 10 ns;
        end loop;
        
    end PROCESS estimulo;

end tb_exp6ex1;
