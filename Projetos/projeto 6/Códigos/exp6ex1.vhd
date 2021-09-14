-- ************************************************
--  Circuito: flip-fLop JK
--  gatilhado pela borda de subida
--          PR, CLR - Entradas assíncronas
--          CLK - Clock
--           JK - Entrada síncrona
--            Q - Saída
-- ************************************************
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
------------------------------------------------------
entity EXP6EX1 is port (
    PR, CLR, CLK :in std_logic;
    JK :in std_logic_vector(1 DOWNTO 0);
    Q :out std_logic); 
end EXP6EX1;
------------------------------------------------------

architecture flipflopJK of EXP6EX1 is
begin
    process(PR, CLR, CLK)
        variable Qbuf: std_logic;
    begin
        if (PR = '1') then
            Qbuf := '1';
        elsif (PR = '0' and CLR = '1') then
            Qbuf := '0';
        elsif rising_edge(CLK) then
            case JK is
                when "00" => Qbuf := Qbuf;
                when "01" => Qbuf := '0';
                when "10" => Qbuf := '1';
                when "11" => Qbuf := not(Qbuf);
                when others => Qbuf := Qbuf;
            end case;
        else
            Qbuf := Qbuf;
        end if;
        Q <= Qbuf;
    end process;
end flipflopJK;
