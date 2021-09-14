-- ************************************************
--  Testbench para simulacao Funcional do
--  Circuito: Registrador de deslocamento
--  bidirecional de 4 bits
--          RST, LOAD - Entradas assíncronas
--          CLK - Clock
--          D, DIR, L e R - Entradas síncronas
--          Q - Saída
-- ************************************************
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.all;
------------------------------------------------------

entity testbench_exp6ex2 IS END;

architecture tb_exp6ex2 of testbench_exp6ex2 is

    component EXP6EX2

    port (
        CLK, RST, LOAD, DIR, L, R : in std_logic;
        D : in std_logic_vector(3 DOWNTO 0);
        Q : out std_logic_vector(3 DOWNTO 0));
    end component;
------------------------------------------------------
    signal load, rst : std_logic;
    signal clk : std_logic := '0';
    signal d : std_logic_vector(3 DOWNTO 0);
    signal DIR_L_R : std_logic_vector(2 DOWNTO 0); 

    Begin

    rgd: EXP6EX2 PORT MAP (LOAD => load, RST => rst, DIR => DIR_L_R(2), L => DIR_L_R(1), R => DIR_L_R(0), CLK => clk, D => d, Q => open);
    clk <= not clk after 5 ns;

    estimulo: PROCESS
    begin
        -- Código com D fixado em um valor qualquer


        d <= "1010";

        rst <= '1'; load <= '0';
        for j in 0 to 7 loop
            DIR_L_R <= std_logic_vector(to_unsigned(j, 3));
                wait for 10 ns;
        end loop;
        
        load <= '1';
        for j in 0 to 7 loop
            DIR_L_R <= std_logic_vector(to_unsigned(j, 3));
                wait for 10 ns;
        end loop;

        rst <= '0';
        for j in 0 to 7 loop
            DIR_L_R <= std_logic_vector(to_unsigned(j, 3));
                wait for 10 ns;
        end loop;

        load <= '0';
        for j in 0 to 7 loop
            DIR_L_R <= std_logic_vector(to_unsigned(j, 3));
                wait for 10 ns;
        end loop;
    end PROCESS estimulo;
end tb_exp6ex2;
        
        
        
        -- Código com todas as possibilidades


        -- rst <= '1'; load <= '0';
        -- for j in 0 to 7 loop
        --     DIR_L_R <= std_logic_vector(to_unsigned(j, 3));
        --     for i in 0 to 15 loop
        --         d <= std_logic_vector(to_unsigned(i, 4));
        --         wait for 10 ns;
        --     end loop;
        -- end loop;

        -- load <= '1';
        -- for j in 0 to 7 loop
        --     DIR_L_R <= std_logic_vector(to_unsigned(j, 3));
        --     for i in 0 to 15 loop
        --         d <= std_logic_vector(to_unsigned(i, 4));
        --         wait for 10 ns;
        --     end loop;
        -- end loop;

        -- rst <= '0';
        -- for j in 0 to 7 loop
        --     DIR_L_R <= std_logic_vector(to_unsigned(j, 3));
        --     for i in 0 to 15 loop
        --         d <= std_logic_vector(to_unsigned(i, 4));
        --         wait for 10 ns;
        --     end loop;
        -- end loop;

        -- load <= '0';
        -- for j in 0 to 7 loop
        --     DIR_L_R <= std_logic_vector(to_unsigned(j, 3));
        --     for i in 0 to 15 loop
        --         d <= std_logic_vector(to_unsigned(i, 4));
        --         wait for 10 ns;
        --     end loop;
        -- end loop;
--     end PROCESS estimulo;

-- end tb_exp6ex2;
