-- ********************************************************
--  Testbench para simulacao Funcional do
--  Circuito: Somador de 4 palavras usando o
--  operador '+' da biblioteca std_logic_arith
--          A,B   Vetores de Entrada
--            S   Vetor de Saída
-- ********************************************************
-----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.numeric_std.ALL;
-----------------------------------------------------------

ENTITY testbench_exp5ex2 IS END;

ARCHITECTURE tb_exp5ex2 OF testbench_exp5ex2 IS

component EXP5EX2

port (
    A, B :in  std_logic_vector(3 DOWNTO 0);
    S    :out std_logic_vector(4 DOWNTO 0));
end component;
-----------------------------------------------------------

signal aa, bb : std_logic_vector (3 DOWNTO 0); 

Begin

som: EXP5EX2 PORT MAP (A => aa, B => bb, S => open);

estimulo: PROCESS

begin
    for i in 0 to 15 loop
        aa <= std_logic_vector(to_unsigned(i, 4));
        for j in 0 to 15 loop
            bb <= std_logic_vector(to_unsigned(j, 4));
            wait for 5 ns;
        end loop;
    end loop;
end PROCESS estimulo;

end tb_exp5ex2;