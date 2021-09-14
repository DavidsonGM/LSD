-- *****************************************************
--      Testbench para simulacao Funcional do
--      Circuito: Cruzamento com dois sinais de trânsito,
-- construido utilizando uma máquina de estados com
-- os estados possíveis combinados desses sinais
--          sensorA, sensorB - Entradas que indicam
-- se está passando carro ou não em cada sinal
--          chave - Entrada que indica se os
-- semáforos devem estar ativos ou não
--          clock - Sinal de clock
--          semaforoA, semaforoB - Saídas de 3 bits
-- indicando o estado atual dos semáforos, sendo
-- 100, 010 e 001 para vermelho, amarelo e verde,
-- respectivamente
--          cont_dezena, cont_unidade - Saída
-- indicando a contagem do tempo
-- *****************************************************
library IEEE;
use IEEE.std_logic_1164.ALL;
--------------------------------------------------------
entity cruzamento is port(
    sensorA, sensorB, chave, clock :in std_logic;
    semaforoA, semaforoB :out std_logic_vector(2 DOWNTO 0);
    cont_dezena, cont_unidade :out std_logic_vector(3 DOWNTO 0)); 
end cruzamento;
--------------------------------------------------------
architecture cruzamento_arch of cruzamento is
    component maqestados is port(
        sensorA, sensorB, chave, clock :in std_logic;
        semaforoA, semaforoB :out std_logic_vector(2 DOWNTO 0);
        cont_dezena, cont_unidade :out std_logic_vector(3 DOWNTO 0);
        resetcounter :out std_logic);
    end component;

    signal rst : std_logic;

begin

    mqest: maqestados PORT MAP (sensorA, sensorB, chave, clock, semaforoA,
                                semaforoB, cont_dezena, cont_unidade, rst);

end cruzamento_arch;   
    