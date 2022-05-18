LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE IEEE.std_logic_unsigned.all;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

entity firstquestion_tb is
--  Port ( );
end firstquestion_tb;

architecture Behavioral of firstquestion_tb is
COMPONENT firstquestion
PORT ( clk_in : IN std_logic;
            F : IN std_logic;
       
       output : OUT std_logic;
    count_out : OUT std_logic_vector(1 downto 0));
END COMPONENT;

SIGNAL clk_in : std_logic := '0';
SIGNAL F : std_logic := '0';

SIGNAL output : std_logic;
SIGNAL count_out : std_logic_vector(1 downto 0);
constant clk_period : time := 10 ns;

begin
uut: firstquestion PORT MAP(
clk_in => clk_in,
F => F,
output => output,
count_out => count_out
);

clock : PROCESS
BEGIN
clk_in <= NOT clk_in;
wait for clk_period;
END PROCESS;

Fval : PROCESS
BEGIN
F <= '0';
wait for clk_period*50;
F <= '1';
wait for clk_period*50;
END PROCESS;

end Behavioral;
