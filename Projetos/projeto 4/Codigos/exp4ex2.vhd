-- ********************************************************
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
-----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
----------------------------------------------------------

entity EXP4EX2 is port (
    A, B, C, D, E, F, G :in  std_logic; 
    S                   :out std_logic);
end EXP4EX2;

architecture ex2 of EXP4EX2 is 

    component DECODIFICADOR4X16 is
    port (
        A  :in  std_logic_vector (3  DOWNTO 0);
        Y  :out std_logic_vector (15 DOWNTO 0));
    end component;

    component MULTIPLEXADOR8X1 is
    port (
    D  :in std_logic_vector (7 DOWNTO 0);
    S  :in std_logic_vector (2 DOWNTO 0); 
    Y  :out std_logic);
    end component;
    
    signal Y_signal : std_logic_vector (15 DOWNTO 0);
    signal D_signal : std_logic_vector (7  DOWNTO 0);
    signal Y015, Y915, Y1011 : std_logic;

    Begin
    dec: DECODIFICADOR4X16 PORT MAP (A(3) => A, A(2) => B, A(1) => C, A(0) => D, Y => Y_signal);

    Y015  <= Y_signal(0)  or Y_signal(15);
    Y915  <= Y_signal(9)  or Y_signal(15);
    Y1011 <= Y_signal(10) or Y_signal(11);
    
    D_signal(0) <= '0';
    D_signal(1) <= Y015;
    D_signal(2) <= '0';
    D_signal(3) <= '1';
    D_signal(4) <= Y915;
    D_signal(5) <= '0'; 
    D_signal(6) <= Y1011;
    D_signal(7) <= '1';
                
    mux: MULTIPLEXADOR8X1 PORT MAP (D => D_signal, S(2) => E, S(1) => F, S(0) => G, Y => S);
end ex2;