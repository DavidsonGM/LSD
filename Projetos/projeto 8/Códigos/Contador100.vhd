-- *****************************************************
--  Circuito: Contador módulo 100 construído
--  com 2 contadores módulo 10 cascateados
--          CLOCK, RESET,
--      LOW_ENABLE, LOAD - Entradas
--      dezload, uniload -  Vetores de Entrada
--  da dezena e da unidade
--          cont_dezena, cont_unidade - Vetores   
--  de saída(dígitos da contagem)
--  da dezena e da unidade 
-- *****************************************************
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.ALL;
--------------------------------------------------------
entity contador100 is port(
    CLOCK, RESET, LOW_ENABLE, LOAD :in std_logic;
    dezload, uniload :in std_logic_vector(3 DOWNTO 0);
    cont_dezena, cont_unidade :out std_logic_vector(3 DOWNTO 0));
end contador100;
--------------------------------------------------------
architecture ex1 of contador100 is
    component contador10 is port(
        clock, reset, low_enable, low_RCI, load :in std_logic;
        D :in std_logic_vector(3 DOWNTO 0);
        Q :out std_logic_vector(3 DOWNTO 0);
        low_RCO :out std_logic);
    end component;

    signal rci_aux : std_logic;
begin
    contU: contador10 PORT MAP (clock => CLOCK, reset => RESET, low_enable => LOW_ENABLE, low_RCI => '0',
                                load => LOAD, D => uniload, Q => cont_unidade, low_RCO => rci_aux);
    contD: contador10 PORT MAP (clock => CLOCK, reset => RESET, low_enable => LOW_ENABLE, low_RCI => rci_aux,
                                load => LOAD, D => dezload, Q => cont_dezena, low_RCO => open);
end ex1;