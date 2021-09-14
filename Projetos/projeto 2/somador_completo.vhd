--Cabeçalho contendo uma breve descricao do dispositivo modelado (Comentario opcional)

-- ****************************************** 
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

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;

--Entity (Entidade)
--pinos de entrada e saída

entity SOMADOR_COMPLETO is port (
    A    :in std_logic; 
    B    :in std_logic;
    Cin  :in std_logic;
    S    :out std_logic;
    Cout :out std_logic );
end SOMADOR_COMPLETO;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture rtl of SOMADOR_COMPLETO is
begin

    S <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);

end rtl; 