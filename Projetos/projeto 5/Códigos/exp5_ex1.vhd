-- ****************************************** 
--  Circuito: Somador de 4 palavras 
--  usando 4 somadores completos
--          A,B   Vetores de Entrada
--            S   Vetor de Saída
-- ******************************************
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
------------------------------------------------------
entity EXP5_EX1 is port (
    A, B :in  std_logic_vector(3 DOWNTO 0);
    S    :out std_logic_vector(4 DOWNTO 0));
end EXP5_EX1;
------------------------------------------------------

architecture ex1 of EXP5_EX1 is

    component SOMADOR_COMPLETO is 
    port (
    A    :in std_logic; 
    B    :in std_logic;
    Cin  :in std_logic;
    S    :out std_logic;
    Cout :out std_logic );
end component;

signal Cout_aux : std_logic_vector(2 DOWNTO 0);

begin
    som1: SOMADOR_COMPLETO PORT MAP (Cin =>         '0', A => A(0), B => B(0), S => S(0), Cout => Cout_aux(0));
    som2: SOMADOR_COMPLETO PORT MAP (Cin => Cout_aux(0), A => A(1), B => B(1), S => S(1), Cout => Cout_aux(1));
    som3: SOMADOR_COMPLETO PORT MAP (Cin => Cout_aux(1), A => A(2), B => B(2), S => S(2), Cout => Cout_aux(2));
    som4: SOMADOR_COMPLETO PORT MAP (Cin => Cout_aux(2), A => A(3), B => B(3), S => S(3), Cout => S(4));
end ex1; 
