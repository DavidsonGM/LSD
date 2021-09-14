--  Testbench para simulacao Funcional do
--  Circuito: Decodificador 4x16
--          A   Entrada
--          Y   Saída
-- ******************************************

ENTITY testbench_dec4x16 IS END;

------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
use ieee.std_logic_signed.ALL;
------------------------------------------------------

ARCHITECTURE tb_decodificador4x16 OF testbench_dec4x16 IS

component DECODIFICADOR4X16

port(
    A  :in  std_logic_vector (3  DOWNTO 0);
    Y  :out std_logic_vector (15 DOWNTO 0));
end component;
------------------------------------------------------

signal A : std_logic_vector (3  DOWNTO 0);
signal Y : std_logic_vector (15 DOWNTO 0);

Begin

dec: DECODIFICADOR4x16 PORT MAP (A => A, Y => Y);

--Implementacao do processo de estimulo

A <= "0000"             , "0001" after 5  ns, "0010" after 10 ns, "0011" after 15 ns,
     "0100" after 20 ns, "0101" after 25 ns, "0110" after 30 ns, "0111" after 35 ns,
     "1000" after 40 ns, "1001" after 45 ns, "1010" after 50 ns, "1011" after 55 ns,
     "1100" after 60 ns, "1101" after 65 ns, "1110" after 70 ns, "1111" after 75 ns; 

end tb_decodificador4x16;