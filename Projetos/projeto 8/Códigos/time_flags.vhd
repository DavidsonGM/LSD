-- *****************************************************
--      Circuito: Sistema de temporização com
--  flags indicando quano o tempo atinge 5,
--  6, 20 e 60 segundos. Construido 
-- utilizando um contador módulo 100
--          clock, reset - Entradas
--          T5, T6, T20, T60 - Saídas
-- *****************************************************
library IEEE;
use IEEE.std_logic_1164.ALL;
--------------------------------------------------------
entity timeFlags is port(
    clock, reset :in std_logic;
    cont_dezena, cont_unidade :out std_logic_vector(3 downto 0);
    T5, T6, T20, T60 :out std_logic); 
end timeFlags;
--------------------------------------------------------

architecture timeFlags_arch of timeFlags is
    component contador100 is port(
        CLOCK, RESET, LOW_ENABLE, LOAD :in std_logic;
        dezload, uniload :in std_logic_vector(3 DOWNTO 0);
        cont_dezena, cont_unidade :out std_logic_vector(3 DOWNTO 0));
    end component;

    signal dz_aux, un_aux : std_logic_vector(3 DOWNTO 0);
    signal A : std_logic_vector(7 DOWNTO 0);
begin
    tflag: contador100 PORT MAP (CLOCK => clock, RESET => reset, LOW_ENABLE => '0',
                                LOAD => '0', dezload => "0000", uniload => "0000",
                                cont_dezena => dz_aux, cont_unidade => un_aux);
    cont_dezena <= dz_aux; cont_unidade <= un_aux;

    A <= dz_aux & un_aux;
    T5 <= '1' when (A >= x"05") else '0';
    T6 <= '1' when (A >= x"06") else '0';
    T20 <= '1' when (A >= x"20") else '0';
    T60 <= '1' when (A >= x"60") else '0';
end timeFlags_arch;