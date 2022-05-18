library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity secondquestion_tb is
 --
end secondquestion_tb;

architecture Behavioral of secondquestion_tb is

COMPONENT secondquestion
PORT(   CLK,A,B,C,D : IN std_logic;
        LED_out : OUT unsigned(3 downto 0);
        SEG_SEL : OUT std_logic_vector(7 downto 0);
        SEVEN_SEG : OUT std_logic_vector(6 downto 0));
END COMPONENT;

Signal CLK,A,B,C,D : std_logic := '0';
Signal LED_out : unsigned(3 downto 0) := (others => '0');
Signal SEG_SEL : std_logic_vector(7 downto 0) := "11111110";
Signal SEVEN_SEG : std_logic_vector (6 downto 0) := (others => '0');

constant clk_period : time := 10 ns;

begin
uut: secondquestion PORT MAP(
LED_out => LED_out,
SEG_SEL => SEG_SEL,
SEVEN_SEG => SEVEN_SEG,
CLK => CLK,
A => A,
B => B,
C => C,
D => D);

clock : process
begin
CLK <= NOT CLK;
wait for clk_period;
end process;

valA : process
begin
A <= NOT A;
wait for clk_period*10;
end process;

valB : process
begin
B <= NOT B;
wait for clk_period*15;
end process;

valC : process
begin
C <= NOT C;
wait for clk_period*20;
end process;

valD : process
begin
D <= NOT D;
wait for clk_period*25;
end process;

end Behavioral;
