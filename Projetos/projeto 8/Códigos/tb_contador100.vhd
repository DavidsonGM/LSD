-- *****************************************************
--  Testbench para simulacao Funcional do
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY testbench_contador100 IS END;

architecture tb_contador100 of testbench_contador100 is
    component contador100 is port(
        CLOCK, RESET, LOW_ENABLE, LOAD :in std_logic;
        dezload, uniload :in std_logic_vector(3 DOWNTO 0);
        cont_dezena, cont_unidade :out std_logic_vector(3 DOWNTO 0));
    end component;

    signal clk : std_logic := '0';
    signal rst, en, ld : std_logic;
    signal un, dz : std_logic_vector(3 DOWNTO 0);

begin
    cont: contador100 PORT MAP (CLOCK => clk, RESET => rst, LOW_ENABLE => en, LOAD => ld, uniload => un, dezload => dz, cont_dezena => open, cont_unidade => open);

    clk <= not clk after 5 ns;

    estimulo: PROCESS
    begin
        rst <= '0'; en <= '0'; ld <= '0'; un <= "0111"; dz <= "0101"; wait for 10 ns;
        ld <= '1'; wait for 10 ns;              -- Carregando
        ld <= '0'; rst <= '1'; wait for 10 ns;  -- Resetando
        un <= "0000"; dz <= "0000"; rst <= '0';


        for i in 0 to 8 loop
            un <= "0000";
            for j in 0 to 8 loop
                un <= un + 1;
                wait for 10 ns;
            end loop;
            if (i = 5) then en <= '1';      -- Desativando o enable em um 
            else en <= '0';                 -- intervalo arbitrário para 
            end if;                         -- mostrar que a contagem parou
            un <= "0000";
            dz <= dz + 1;
            wait for 10 ns;
        end loop;
    end PROCESS estimulo;
end tb_contador100;
