-- ************************************************
--  Circuito: Somador de 4 palavras usando o
--  operador '+' da biblioteca std_logic_arith
--          A,B   Vetores de Entrada
--            S   Vetor de Saída
-- ************************************************
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
------------------------------------------------------
entity EXP5EX2 is port (
    A, B :in  std_logic_vector(3 DOWNTO 0);
    S    :out std_logic_vector(4 DOWNTO 0));
end EXP5EX2;
------------------------------------------------------

architecture ex1 of EXP5EX2 is

begin
    S <= ('0' & unsigned(A)) + ('0' &  unsigned(B));
end ex1; 
