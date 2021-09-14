-- *****************************************************
--  Top Module para comparar as saídas dos
--  Circuitos: 
--  1. Somador de 4 palavras usando 4
--  somadores completos(Device Under Test);
--  2. Somador de 4 palavras usando o operador
--  '+' da biblioteca std_logic_arith (Golden Model)
--
--
--          A,B   Vetores de Entrada
--          S_dut Saída do circuito 1
--          S_gm  Saída do circuito 2
-- *****************************************************
------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
------------------------------------------------------
entity EXP5EX3TM is
end EXP5EX3TM;
------------------------------------------------------

architecture ex3 of EXP5EX3TM is

    component EXP5_EX1 is port (
    A, B :in  std_logic_vector(3 DOWNTO 0);
    S    :out std_logic_vector(4 DOWNTO 0));
    end component;

    component EXP5EX2 is port (
        A, B :in  std_logic_vector(3 DOWNTO 0);
        S    :out std_logic_vector(4 DOWNTO 0));
    end component;

    component testbench_exp5ex3 is port (
        S_dut, S_gm :in  STD_LOGIC_VECTOR(4 DOWNTO 0);
        A, B        :out STD_LOGIC_VECTOR(3 DOWNTO 0));
    end component;

    signal A, B        : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal S_dut, S_gm : STD_LOGIC_VECTOR(4 DOWNTO 0);

    begin
        U0: EXP5_EX1 PORT MAP(A, B, S_dut);
        U1: EXP5EX2  PORT MAP(A, B, S_gm);
        U2: TESTBENCH_EXP5EX3 PORT MAP(S_dut, S_gm, A, B);
end ex3; 
