LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY testbench_maqestados IS END;

architecture tb_maqestados of testbench_maqestados is
    component maqestados is port (
        sensorA, sensorB, chave, clock, T5, T6, T20, T60 :in std_logic;
        semaforoA, semaforoB :out std_logic_vector(2 DOWNTO 0);
        resetcounter :out std_logic);
    end component;

    component timeFlags is port(
        clock, reset :in std_logic;
        cont_dezena, cont_unidade :out std_logic_vector(3 downto 0);
        T5, T6, T20, T60 :out std_logic); 
    end component; 

    signal clk : std_logic := '0';
    signal rst, T_5, T_6, T_20, T_60, sensor_A, sensor_B : std_logic;

    begin
        tflag: timeFlags PORT MAP (clock => clk, reset => rst,
                                    T5 => T_5, T6 => T_6, T20 => T_20, T60 => T_60);

        mqest: maqestados PORT MAP (clock => clk, chave => rst, T5 => T_5, T6 => T_6, T20 => T_20,
                                    T60 => T_60, sensorA => sensor_A, sensorB => sensor_B,
                                    semaforoA => open, semaforoB => open, resetcounter => open);

    clk <= not clk after 0.5 sec;

    estimulo: PROCESS

    begin
        rst <= '1'; sensor_A <= '0'; sensor_B <= '0';wait;

    end PROCESS estimulo;
end tb_maqestados;