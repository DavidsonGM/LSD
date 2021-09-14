-- ********************************************************
--  Testbench para simulacao Funcional do
--  Circuito: Somador de 4 palavras 
--  usando 4 somadores completos
--          A,B   Vetores de Entrada
--            S   Vetor de Saída 
-- ********************************************************
-----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.numeric_std.ALL;
-----------------------------------------------------------

ENTITY testbench_exp5_ex1 IS END;

ARCHITECTURE tb_exp5_ex1 OF testbench_exp5_ex1 IS

component EXP5_EX1

port (
    A, B :in  std_logic_vector(3 DOWNTO 0);
    S    :out std_logic_vector(4 DOWNTO 0));
end component;
-----------------------------------------------------------

signal aa, bb : std_logic_vector (3 DOWNTO 0); 

Begin

som: EXP5_EX1 PORT MAP (A => aa, B => bb, S => open);

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

end tb_exp5_ex1;