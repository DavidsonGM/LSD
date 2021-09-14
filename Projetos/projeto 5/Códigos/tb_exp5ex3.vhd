-- ********************************************************
--  Testbench para ser usado no Top Module dos
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
-- ********************************************************
-----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.numeric_std.ALL;
-----------------------------------------------------------

ENTITY testbench_exp5ex3 IS 
port (S_dut, S_gm: in  STD_LOGIC_VECTOR(4 DOWNTO 0);
      A, B       : out STD_LOGIC_VECTOR(3 DOWNTO 0));
END testbench_exp5ex3;


-----------------------------------------------------------
ARCHITECTURE tb_exp5ex3 OF testbench_exp5ex3 IS

Begin


estimulo: PROCESS
begin
    report "Iniciando teste..." severity NOTE;

    for i in 0 to 15 loop
        A <= std_logic_vector(to_unsigned(i, 4));
        for j in 0 to 15 loop
            B <= std_logic_vector(to_unsigned(j, 4));
            wait for 500 ns;
            assert (S_gm = S_dut) report "Falhou" severity ERROR;
        end loop;
    end loop;

    report "Teste finalizado!" severity NOTE;

    wait;

end PROCESS estimulo;

end tb_exp5ex3;