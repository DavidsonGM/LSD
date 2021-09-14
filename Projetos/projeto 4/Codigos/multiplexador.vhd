-- ****************************************** 
--  Circuito: Multiplexador 4x1
--          D0  Entrada 1
--          D1  Entrada 2
--          D2  Entrada 3
--          D3  Entrada 4
--          S0  Seletor 1
--          S1  Seletor 2
--          Y   Saída
-- ******************************************
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
------------------------------------------------------

entity MULTIPLEXADOR is port (
    S              :in std_logic_vector (1 DOWNTO 0);
    D0, D1, D2, D3 :in std_logic; 
    Y              :out std_logic);
end MULTIPLEXADOR;
------------------------------------------------------

architecture mux of MULTIPLEXADOR is
begin

   Y <= (D0 and (not S(1)) and (not S(0)))
   or (D1 and (not S(1)) and S(0))
   or (D2 and S(1) and (not S(0)))
   or (D3 and S(1) and  S(0));

end mux; 
