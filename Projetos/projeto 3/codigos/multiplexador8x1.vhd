-- ****************************************** 
--  Circuito: Multiplexador 8x1
--          D   Vetor de Entradas
--          S   Seletor
--          Y   Saída
-- ******************************************
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
------------------------------------------------------

entity MULTIPLEXADOR8X1 is port (
    D  :in std_logic_vector (7 DOWNTO 0);
    S  :in std_logic_vector (2 DOWNTO 0); 
    Y  :out std_logic);
end MULTIPLEXADOR8X1;
------------------------------------------------------

architecture mux8x1 of MULTIPLEXADOR8X1 is
begin

   Y <= D(0) when S = "000" else
        D(1) when S = "001" else
        D(2) when S = "010" else
        D(3) when S = "011" else
        D(4) when S = "100" else
        D(5) when S = "101" else
        D(6) when S = "110" else
        D(7) when S = "111";
end mux8x1; 
