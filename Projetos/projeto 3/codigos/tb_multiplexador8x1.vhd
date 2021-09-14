--  Testbench para simulacao Funcional do
--  Circuito: Multiplexador 8x1
--          D   Vetor de Entradas
--          S   Seletor
--          Y   Saída
-- ******************************************

ENTITY testbench_mux8x1 IS END;

------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.numeric_std.ALL;
------------------------------------------------------

ARCHITECTURE tb_multiplexador8x1 OF testbench_mux8x1 IS

component MULTIPLEXADOR8X1

port(
    S :in std_logic_vector (2 DOWNTO 0);
    D :in std_logic_vector (7 DOWNTO 0); 
    Y :out std_logic);
end component;
------------------------------------------------------

signal clk  : std_logic_vector (7 DOWNTO 0); 
signal tb_s : std_logic_vector (2 DOWNTO 0);

Begin

mux: MULTIPLEXADOR8X1 PORT MAP (D => clk, S => tb_s, Y => open);


--Implementacao do processo de estimulo

clock: PROCESS
begin
    for i in 0 to 255 loop
        clk <= std_logic_vector(to_unsigned(i, 8));
        wait for 1 ns;
    end loop;
end process;


tbs: PROCESS
begin
    tb_s <= "000"              , "001" after 256  ns, "010" after 512  ns, "011" after 768  ns,
            "100" after 1024 ns, "101" after 1280 ns, "110" after 1536 ns, "111" after 1792 ns; 
            wait for 2048 ns;
end PROCESS;

end tb_multiplexador8x1;