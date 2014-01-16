--VHDL Project 2

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.numeric_std.all;

entity ALARM is
	port(
		A_Y: in STD_LOGIC_VECTOR (4 downto 1);
		B_Y: in STD_LOGIC_VECTOR (4 downto 1);
		C_Y: in STD_LOGIC_VECTOR (4 downto 1);
		D_Y: in STD_LOGIC_VECTOR (4 downto 1);
		ASY_RST_Y: in STD_LOGIC;
		CLK_Y: in STD_LOGIC;
		LED_Z: out STD_LOGIC
	);
end ALARM;

architecture BEHAVIORAL of ALARM  is

signal CURRENT_STATE: STD_LOGIC := '1';--Boolean for the current state of the

begin
	process(ASY_RST_Y, CLK_Y) --Runs when inputs change
	
	variable IS_ENABLED: STD_LOGIC := '0'; --Boolean for if is currently counting
	variable COUNT: STD_LOGIC_VECTOR(8 downto 1) := X"00";
	variable MAX_COUNT: STD_LOGIC_VECTOR(8 downto 1) := X"77"; --119dec
	
	begin
	
		if(ASY_RST_Y = '0') then
			IS_ENABLED := '0';
			COUNT := X"00";
			CURRENT_STATE <= '1';
		elsif(rising_edge(CLK_Y)) then
			if(A_Y = X"9" and B_Y = X"5" and C_Y = X"1" and D_Y =X"0") then --Start at 5 seconds
			--Then timer condition has been met
				CURRENT_STATE <= NOT CURRENT_STATE;
				IS_ENABLED := '1';
			elsif(IS_ENABLED = '1' and COUNT < X"77") then
				CURRENT_STATE <= NOT CURRENT_STATE;
				COUNT := COUNT + '1';
			elsif(COUNT = MAX_COUNT) then
				IS_ENABLED := '0';
				COUNT := X"00";
				CURRENT_STATE <= '1';	
			end if;	
		end if;
		
		LED_Z <= CURRENT_STATE;
	end process;
end BEHAVIORAL;