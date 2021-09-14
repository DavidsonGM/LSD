-- ************************************************
--  Circuito: Registrador de deslocamento
--  bidirecional de 4 bits
--          RST, LOAD - Entradas assíncronas
--          CLK - Clock
--          D, DIR, L e R - Entradas síncronas
--          Q - Saída
-- ************************************************
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------------------------------
entity EXP6EX2 is port (
    CLK, RST, LOAD, DIR, L, R : in std_logic;
    D : in std_logic_vector(3 DOWNTO 0);
    Q : out std_logic_vector(3 DOWNTO 0));
end EXP6EX2;
------------------------------------------------------
architecture registradorDeslocamento of EXP6EX2 is

    signal currentState, nextState : std_logic_vector(3 DOWNTO 0);

begin

    sync_proc: process(CLK)
    begin
        if rising_edge(CLK) then
            currentState <= nextState;
        end if;
    end process sync_proc;

    
    comb_proc: process(currentState, RST, LOAD, DIR, D, L, R)
    begin
        if (RST = '1') then
            nextState <= "0000";
        elsif (LOAD = '1') then
            nextState <= D;
        elsif (DIR = '0') then
            nextState <= currentState(2) & currentState(1) & currentState(0) & L;
        elsif (DIR = '1') then
            nextState <= R & currentState(3) & currentState(2) & currentState(1);
        else nextState <= currentstate;
        end if;
    end process;
    Q <= currentState;
end registradorDeslocamento;
