library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity secondquestion is
PORT( CLK,A,B,C,D : IN std_logic;
          LED_out : OUT unsigned(3 downto 0);
          SEG_SEL : OUT std_logic_vector (7 downto 0) := "11111110";
        SEVEN_SEG : OUT std_logic_vector(6 downto 0));
end secondquestion;

architecture Behavioral of secondquestion is
Signal BIN : unsigned(3 downto 0);
Signal EX3 : unsigned(3 downto 0);

begin

q2 : process(CLK)
BEGIN
BIN <= A & B & C & D;
LED_out <= BIN;
EX3 <= unsigned(BIN) + "11";

LED_out <= EX3;
CASE EX3 IS  
    WHEN "0000"  => SEVEN_SEG <= "1000010"; -- EX3 = 0, LED shows d
    WHEN "0001"  => SEVEN_SEG <= "0110000"; -- EX3 = 1, LED shows E
    WHEN "0010"  => SEVEN_SEG <= "0111000"; -- EX3 = 2, LED shows F
    
    WHEN "0011" => SEVEN_SEG <= "0000001"; -- EX3 = 3, LED shows 0
    WHEN "0100" => SEVEN_SEG <= "1001111"; -- EX3 = 4, LED shows 1
    WHEN "0101" => SEVEN_SEG <= "0010010"; -- EX3 = 5, LED shows 2
    WHEN "0110" => SEVEN_SEG <= "0000110"; -- EX3 = 6, LED shows 3
    WHEN "0111" => SEVEN_SEG <= "1001100"; -- EX3 = 7, LED shows 4
    WHEN "1000" => SEVEN_SEG <= "0100100"; -- EX3 = 8, LED shows 5
    WHEN "1001" => SEVEN_SEG <= "0100000"; -- EX3 = 9, LED shows 6
    WHEN "1010" => SEVEN_SEG <= "0001111"; -- EX3 = 10(A), LED shows 7
    WHEN "1011" => SEVEN_SEG <= "0000000"; -- EX3 = 11(b), LED shows 8
    WHEN "1100" => SEVEN_SEG <= "0000100"; -- EX3 = 12(C), LED shows 9
    WHEN "1101"  => SEVEN_SEG <= "0001000"; -- EX3 = 13(d), LED shows A
    WHEN "1110"  => SEVEN_SEG <= "1100000"; -- EX3 = 14(E), LED shows b
    WHEN "1111"  => SEVEN_SEG <= "0110001"; -- EX3 = 15(F), LED shows C
    WHEN others => SEVEN_SEG <= "1001001"; -- LED shows ? (IDENTICAL) for ERROR
END CASE;

end process;

end Behavioral;
