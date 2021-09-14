-- ********************************************************
--  Testbench para simulacao Funcional do
--  Circuito: Entidade com 3 bits de entrada 
--  usando 2 multiplexadores 4x1 como componentes
--          A  Entrada 1
--          B  Entrada 2
--          C  Entrada 3
--          X  Saída 1 (X = (~A)⋅B⋅C + A⋅(~B)⋅(~C) + A⋅B)
--          Y  Saída 2 (Y = (~A)⋅(~B) + (~A)⋅B⋅(~C) + A⋅B⋅C)  
-- ********************************************************
------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
------------------------------------------------------

ENTITY testbench_exp4ex1 IS END;

ARCHITECTURE tb_exp4ex1 OF testbench_exp4ex1 IS

component EXP4EX1

port (
    A, B, C :in  std_logic; 
    X, Y    :out std_logic);
end component;
------------------------------------------------------

signal aa, bb, cc : std_logic; 

Begin

mux: EXP4EX1 PORT MAP (A => aa, B => bb, C => cc, X => open, Y => open);

estimulo: PROCESS

begin

    aa <= '0'; bb <= '0'; cc <= '0'; wait for 5 ns;
    cc <= '1'; wait for 5 ns;
    bb <= '1'; cc <= '0'; wait for 5 ns;
    cc <= '1'; wait for 5 ns;
    aa <= '1'; bb <= '0'; cc <= '0'; wait for 5 ns;
    cc <= '1'; wait for 5 ns;
    bb <= '1'; cc <= '0'; wait for 5 ns;
    cc <= '1'; wait for 5 ns;

end PROCESS estimulo;

end tb_exp4ex1;