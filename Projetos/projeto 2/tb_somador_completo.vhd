--Cabecalho contendo uma breve descricao do dispositivo modelado (comentario opcional)


-- ****************************************** 
--  Testbench para simulacao Funcional do
--  Circuito 1: Porta OU EXCLUSIVO (XOR) de tres entradas: 
--                A    Entrada 1
--                B    Entrada 2
--                Cin  Entrada 3
--                S    Saida
--  Circuito 2: Soma de produtos de 3 entradas:
--                A    Entrada 1
--                B    Entrada 2
--                Cin  Entrada 3
--                Cout Saida
-- ******************************************

--ENTITY (Entidade)
--somador_tb  uma entidade sem pinos de entrada e saida

ENTITY somador_tb IS END;

-- Testbench para somador_completo.vhd
-- Validacao assincrona

--Package (Pacote)
--constantes e bibliotecas

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;

ARCHITECTURE tb_somador_completo OF somador_tb IS

-- Declaracao do componente somador_completo, referente a  sua arquitetura descrita no arquivo somador_completo.vhd

component SOMADOR_COMPLETO

port(
    A, B, Cin :in  std_logic; 
    S, Cout   :out std_logic
);
end component;

--Sinais auxiliares para a interconexÃ£o ao
--processo de estimulo

signal A : std_logic; 
signal B   : std_logic;
signal Cin : std_logic;

--Instancia do componente somador_completo e interconexao do componente ao processo
--de estimulo

Begin

somador: SOMADOR_COMPLETO PORT MAP (A => A, B => B, Cin => Cin, S => open, Cout => open);


--Implementacao do processo de estimulo

estimulo: PROCESS

begin

wait for 5 ns; A    <= '0'; B  <= '0'; Cin  <= '0';
wait for 5 ns; Cin  <= '1';
wait for 5 ns; B    <= '1'; 
wait for 5 ns; Cin  <= '0';
wait for 5 ns; A    <= '1';
wait for 5 ns; B    <= '0';
wait for 5 ns; Cin  <= '1';
wait for 5 ns; B    <= '1';
wait;
 
end PROCESS estimulo;
 
end tb_somador_completo;
