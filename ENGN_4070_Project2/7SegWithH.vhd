--VHDL Project 2
--7Seg 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SEVEN_SEG_WITH_DISP is
	port(
		D_Y: in STD_LOGIC_VECTOR (4 downto 1);
		O_Y: out STD_LOGIC_VECTOR(8 downto 1)	
	);
end SEVEN_SEG_WITH_DISP;

architecture BEHAVIORAL of SEVEN_SEG_WITH_DISP is

begin
	process(D_Y) --Runs when inputs change
	begin
		case D_Y is				--ABCDEFGDec
		
			when "0000" => O_Y <= "00000011"; -- 0
			when "0001" => O_Y <= "10011111"; -- 1
			when "0010" => O_Y <= "00100101"; -- 2
			when "0011" => O_Y <= "00001101"; -- 3
			when "0100" => O_Y <= "10011001"; -- 4
			when "0101" => O_Y <= "01001001"; -- 5
			when "0110" => O_Y <= "11000001"; -- 6
			when "0111" => O_Y <= "00011111"; -- 7
			when "1000" => O_Y <= "00000001"; -- 8
			when "1001" => O_Y <= "00011001"; -- 9
			when others => O_Y <= "10010001"; -- H
			
		end case;
	end process;


end BEHAVIORAL;