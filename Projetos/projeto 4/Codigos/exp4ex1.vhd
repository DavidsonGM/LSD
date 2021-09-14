-- ********************************************************
--  Circuito: Entidade com 3 bits de entrada 
--  usando 2 multiplexadores 4x1 como componentes
--          A  Entrada 1
--          B  Entrada 2
--          C  Entrada 3
--          X  Saída 1 (X = (~A)⋅B⋅C + A⋅(~B)⋅(~C) + A⋅B)
--          Y  Saída 2 (Y = (~A)⋅(~B) + (~A)⋅B⋅(~C) + A⋅B⋅C)  
-- ********************************************************
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
------------------------------------------------------

entity EXP4EX1 is port (
    A, B, C :in  std_logic; 
    X, Y    :out std_logic);
end EXP4EX1;

architecture ex1 of EXP4EX1 is 

    component MULTIPLEXADOR is
    port (
        S              :in std_logic_vector (1 DOWNTO 0);
        D0, D1, D2, D3 :in std_logic; 
        Y              :out std_logic);
    end component;

    signal not_c : std_logic;

    Begin
    not_C <= not C;
    Mux1: MULTIPLEXADOR PORT MAP (D3 => '1', D2 => not_C, D1 => C, D0 => '0', S(1) => A, S(0) => B, Y => X);
    Mux2: MULTIPLEXADOR PORT MAP (D3 => C, D2 => '0', D1 => not_C, D0 => '1', S(1) => A, S(0) => B, Y => Y);
end ex1;