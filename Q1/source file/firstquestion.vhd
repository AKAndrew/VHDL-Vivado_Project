LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE IEEE.std_logic_unsigned.all;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

entity firstquestion is
port (  clk_in    : in STD_LOGIC;
		F         : in STD_LOGIC;
		
		count_out : out STD_LOGIC_VECTOR (1 downto 0);
		output    : out STD_LOGIC);
end firstquestion;

architecture Behavioral of firstquestion is

signal countertemp : std_logic_vector(1 downto 0) := "00";

begin
q1_output : process (clk_in)
begin
if (F = '0' AND countertemp = 2) OR (F='1' AND countertemp = 3) OR F'event then
    output <= '0';
    countertemp <= "00";
else
    if countertemp = 0 then
        if clk_in='1' then
            output <= '1';
            countertemp <= countertemp + 1;
        end if;
    else
        countertemp <= countertemp + 1;
    end if;
end if;
count_out <= countertemp;    
end process;
end Behavioral;