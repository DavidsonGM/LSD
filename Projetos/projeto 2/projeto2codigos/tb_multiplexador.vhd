--  Testbench para simulacao Funcional do
--  Circuito: Multiplexador 4x1
--          D0  Entrada 1
--          D1  Entrada 2
--          D2  Entrada 3
--          D3  Entrada 4
--          S0  Seletor 1
--          S1  Seletor 2
--          Y   Saída
-- ******************************************

ENTITY testbench_mux IS END;

------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
------------------------------------------------------

ARCHITECTURE tb_multiplexador OF testbench_mux IS

component MULTIPLEXADOR

port(
    S              :in std_logic_vector (1 DOWNTO 0);
    D0, D1, D2, D3 :in std_logic; 
    Y              :out std_logic);
end component;
------------------------------------------------------

signal clk1, clk2, clk3, clk4 : std_logic; 
signal tb_s : std_logic_vector (1 DOWNTO 0);

Begin

mux: MULTIPLEXADOR PORT MAP (D0 => clk1, D1 => clk2, D2 => clk3, D3 => clk4, S => tb_s, Y => open);


--Implementacao do processo de estimulo

clk_1: PROCESS
begin
    clk1 <= '0', '1' after 40 ns, '0' after 80 ns; wait for 80 ns;
end PROCESS;

clk_2: PROCESS
begin
    clk2 <= '0', '1' after 20 ns, '0' after 60 ns; wait for 80 ns;
end PROCESS;

clk_3: PROCESS
begin
    clk3 <= '0', '1' after 10 ns, '0' after 30 ns; wait for 40 ns;
end PROCESS;

clk_4: PROCESS
begin
    clk4 <= '0', '1' after 5 ns, '0' after 15 ns; wait for 20 ns;
end PROCESS;

tbs: PROCESS
begin
    tb_s <= "00", "01" after 80 ns, "11" after 160 ns, "10" after 240 ns; wait for 320 ns;
end PROCESS;

end tb_multiplexador;