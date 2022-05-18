library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity secondquestion_tb is
--  Port ( );
end secondquestion_tb;

architecture Behavioral of secondquestion_tb is
COMPONENT secondquestion
PORT(   CLK,A,B,C,D : IN STD_LOGIC;
        BIN : IN STD_LOGIC_VECTOR(3 downto 0);
        EX3 : IN unsigned(3 downto 0);
        BCD : IN integer;
        
        LEDs : OUT STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;

SIGNAL CLK,A,B,C,D : STD_LOGIC := '0';
SIGNAL LEDs : STD_LOGIC_VECTOR(6 downto 0) := (others=>'0');
SIGNAL BIN : STD_LOGIC_VECTOR(3 downto 0) := (others=>'0');
SIGNAL EX3 : unsigned(3 downto 0);
SIGNAL BCD : integer := 0;
constant clk_period : time := 10 ns;

begin
uut: secondquestion PORT MAP(
A => A,
B => B,
C => C,
D => D,
LEDs => LEDs,
BIN => BIN,
BCD => BCD,
EX3 => EX3,
CLK => CLK
);

clock : PROCESS
BEGIN
CLK <= NOT CLK;
wait for clk_period;
END PROCESS;

valA : PROCESS
BEGIN
A <= NOT A;
wait for clk_period*10;
END PROCESS;

valB : PROCESS
BEGIN
B <= NOT B;
wait for clk_period*20;
END PROCESS;

valC : PROCESS
BEGIN
C <= NOT C;
wait for clk_period*15;
END PROCESS;

valD : PROCESS
BEGIN
D <= NOT D;
wait for clk_period*25;
END PROCESS;

valBIN : PROCESS
BEGIN
BIN <= A & B & C & D;
wait for clk_period;
END PROCESS;

valBCD : PROCESS
BEGIN
BCD <= TO_INTEGER(unsigned(BIN));
wait for clk_period;
END PROCESS;

valEX3 : PROCESS
BEGIN
EX3 <= unsigned(BIN) + "0011";
wait for clk_period;
END PROCESS;

end Behavioral;
