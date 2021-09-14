library IEEE;
use IEE.STD_LOGIC_1164.ALL;

entity registradorDeslocamento is port (
    CLK, RST, LOAD, DIR, L, R : in std_logic;
    D : in std_logic_vector(3 DOWNTO 0);
    Q : out std_logic_vector(3 DOWNTO 0));
end registradorDeslocamento;

architecture registradorDeslocamento_arch of registradorDeslocamento is

    signal currentState, nextState : std_logic_vector(3 DOWNTO 0);

begin

    sync_proc: process(CLK)
    begin
        if rising_edge(CLK) then
            currentState <= nextState;
        end if;
    end process sync_proc;

    
    comb_proc: process(currentState, RST, LOAD, DIR)
    begin
        if (RST = '1') then
            nextState <= '0000';
        elsif (LOAD = '1') then
            nextState <= D;
        else
            if (DIR = '0') 
            