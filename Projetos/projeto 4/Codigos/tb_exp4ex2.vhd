-- ********************************************************
--  Testbench para simulacao Funcional do
--  Circuito: Entidade com 7 bits de entrada 
--  usando 1 multiplexador 8x1 e um 
--  decodificador 4x16 como componentes
--  A, B, C e D serão as entradas do decodificador 
--  e E, F e G atuarão como seletores para o multiplexador
--          A  Entrada 1 (Bit mais significativo)
--          B  Entrada 2
--          C  Entrada 3
--          D  Entrada 4
--          E  Seletor 1 (Bit mais significativo)
--          F  Seletor 2
--          G  Seletor 3
--          S  Saída 
--          S = (F⋅G + A⋅B⋅C⋅D⋅(~E)⋅(~F)⋅G +
--              (~A)⋅(~B)⋅(~C)⋅(~D)⋅(~E)⋅(~F)⋅G + 
--              A⋅(~B)⋅C⋅E⋅F⋅(~G) + (~A)⋅B⋅C⋅D⋅(~E)⋅F⋅(~G) + 
--              A⋅B⋅C⋅D⋅E⋅(~F)⋅(~G) + A⋅(~B)⋅(~C)⋅D⋅E⋅(~F)⋅(~G))
-- ********************************************************
------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.numeric_std.ALL;
------------------------------------------------------

ENTITY testbench_exp4ex2 IS END;

ARCHITECTURE tb_exp4ex2 OF testbench_exp4ex2 IS

component EXP4EX2

port (
    A, B, C, D, E, F, G :in  std_logic; 
    S                   :out std_logic);
end component;
------------------------------------------------------

signal entrada : std_logic_vector (6 DOWNTO 0); 

Begin

mux: EXP4EX2 PORT MAP (E => entrada(6), F => entrada(5), G => entrada(4), A => entrada(3), B => entrada(2), C => entrada(1), D => entrada(0), S => open);

estimulo: PROCESS

begin
    for i in 0 to 127 loop
        entrada <= std_logic_vector(to_unsigned(i, 7));
        wait for 5 ns;
    end loop;
end PROCESS estimulo;

end tb_exp4ex2;