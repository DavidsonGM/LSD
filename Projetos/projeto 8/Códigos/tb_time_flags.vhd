-- *****************************************************
--      Testbench para simulacao Funcional do
--      Circuito: Sistema de temporização com
--  flags indicando quano o tempo atinge 5,
--  6, 20 e 60 segundos. Construido 
-- utilizando um contador módulo 100
--          clock, reset - Entradas
--          T5, T6, T20, T60 - Saídas
-- *****************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY testbench_time_flags IS END;

architecture tb_time_flags of testbench_time_flags is
    component timeFlags is port(
        clock, reset :in std_logic;
        cont_dezena, cont_unidade :out std_logic_vector(3 downto 0);
        T5, T6, T20, T60 :out std_logic); 
    end component;

    signal clk : std_logic := '0';
    signal rst : std_logic;

begin
    tf: timeFlags PORT MAP (clock => clk, reset => rst, T5 => open,
                            T6 => open, T20 => open, T60 => open,
                            cont_dezena => open, cont_unidade => open);

    clk <= not clk after 0.5 sec;
    
    estimulo: PROCESS
    begin
        rst <= '0'; wait for 80 sec;
        rst <= '1'; wait;
    end PROCESS estimulo;
end tb_time_flags;