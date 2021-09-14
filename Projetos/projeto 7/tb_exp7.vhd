-- *****************************************************
--  Testbench para simulacao Funcional do
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
use IEEE.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.all;
--------------------------------------------------------

entity testbench_exp7 IS END;

architecture tb_exp7 of testbench_exp7 is

    component maquinaEstados
    port (
        clock, reset : in std_logic;
        A : in std_logic_vector(1 DOWNTO 0);
        refrigerante, troco25, troco50 : out std_logic);
    end component;
--------------------------------------------------------
    signal rst : std_logic;
    signal clk : std_logic := '0';
    signal a : std_logic_vector(1 DOWNTO 0);

    Begin

    mde: maquinaEstados PORT MAP (clock => clk, reset => rst, a => A , refrigerante => open, troco25 => open, troco50 => open);
    clk <= not clk after 5 ns;

    estimulo: PROCESS
    begin
        -- Código com reset desativado

        rst <= '0';

        a <= "00"; wait for 10 ns;      -- Mantendo o estado inicial
        a <= "01"; wait for 10 ns;      -- Adicionando 25 centavos
        a <= "11"; wait for 10 ns;      -- Devolvendo 25 centavos
        a <= "01"; wait for 20 ns;      -- Adicionando 25 centavos (x2)
        a <= "11"; wait for 10 ns;      -- Devolvendo 50 centavos
        a <= "01"; wait for 30 ns;      -- Adicionando 25 centavos (x3)
        a <= "11"; wait for 10 ns;      -- Devolvendo 75 centavos
        a <= "01"; wait for 40 ns;      -- Adicionando 25 centavos (x4), Retorna um refri

        rst <= '1'; wait for 10 ns;     -- Retornando ao estado inicial
        rst <= '0';

        a <= "10"; wait for 10 ns;      -- Adicionando 50 centavos
        a <= "11"; wait for 10 ns;      -- Devolvendo 50 centavos
        a <= "10"; wait for 20 ns;      -- Adicionando 50 centavos (x2)
        a <= "01"; wait for 30 ns;      -- Adicionando 75 centavos
        a <= "10"; wait for 10 ns;      -- Adicionando 50 centavos, retorna 25 centavos e um refri

        
    end PROCESS estimulo;
end tb_exp7;