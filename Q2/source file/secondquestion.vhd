library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity secondquestion is
PORT(   CLK,A,B,C,D : IN STD_LOGIC;
        BIN: IN STD_LOGIC_VECTOR(3 downto 0);
        EX3 : IN unsigned(3 downto 0);
        BCD : IN integer;
        
        SEG_SEL : OUT std_logic_vector (7 downto 0) := "11111110";
        LEDs : OUT STD_LOGIC_VECTOR(6 downto 0)); -- [x,x,x,x,x,x,x] = [a,b,c,d,e,f,g]
end secondquestion;

architecture Behavioral of secondquestion is
begin

valLED : PROCESS (CLK)
BEGIN
CASE EX3 IS
    WHEN "0000" => LEDs <= "0111101"; -- EX3 = 0, LED shows d
    WHEN "0001" => LEDs <= "1001111"; -- EX3 = 1, LED shows E
    WHEN "0010" => LEDs <= "1000111"; -- EX3 = 2, LED shows F
    
    WHEN "0011" => LEDs <= "1111110"; -- EX3 = 3, LED shows 0
    WHEN "0100" => LEDs <= "0110000"; -- EX3 = 4, LED shows 1
    WHEN "0101" => LEDs <= "1101101"; -- EX3 = 5, LED shows 2
    WHEN "0110" => LEDs <= "1111001"; -- EX3 = 6, LED shows 3
    WHEN "0111" => LEDs <= "0110011"; -- EX3 = 7, LED shows 4
    WHEN "1000" => LEDs <= "1011011"; -- EX3 = 8, LED shows 5
    WHEN "1001" => LEDs <= "1011111"; -- EX3 = 9, LED shows 6
    WHEN "1010" => LEDs <= "1110000"; -- EX3 = 10(A), LED shows 7
    WHEN "1011" => LEDs <= "1111111"; -- EX3 = 11(b), LED shows 8
    WHEN "1100" => LEDs <= "1111011"; -- EX3 = 12(C), LED shows 9
    WHEN "1101" => LEDs <= "1110111"; -- EX3 = 13(d), LED shows A
    WHEN "1110" => LEDs <= "0011111"; -- EX3 = 14(E), LED shows b
    WHEN "1111" => LEDs <= "1001110"; -- EX3 = 15(F), LED shows C
    WHEN others => LEDs <= "1001001"; -- LED shows triple orizontal line (IDENTICAL) for ERROR
END CASE;
END PROCESS;

end Behavioral;