--VHDL Project 2
--7Seg 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity INT_CLK_GEN is
	port(
		CLK_Y: in STD_LOGIC;
		SYN_RST_LY: in STD_LOGIC;
		
		ADC_CLK_Z: out STD_LOGIC;
		FSM_CLK_Z: out STD_LOGIC
	);
end INT_CLK_GEN;

architecture BEHAVIORAL of INT_CLK_GEN is

begin
	ADC_CLK:process(CLK_Y) --Runs when inputs change

	variable ADC_CNT: INTEGER range 0 to 100; --50 for full
	variable ADC_STATE: STD_LOGIC := '0';
	begin
	
	if(rising_edge(CLK_Y)) then
		if(SYN_RST_LY = '0') then
			ADC_STATE := '0';	
		elsif(ADC_CNT > 50) then
			ADC_STATE := not ADC_STATE;
			ADC_CNT := 0;
		else
			ADC_CNT := ADC_CNT + 1;			
		end if;	
		
	end if;
	
	ADC_CLK_Z <= ADC_STATE;
	
	end process;
	
	FSM_CLK:process(CLK_Y, SYN_RST_LY)
	variable FSM_CNT: INTEGER range 0 to 200; --200 for full
	variable FSM_STATE: STD_LOGIC := '0';	
	begin
	
	
	if(rising_edge(CLK_Y)) then
		if(SYN_RST_LY = '0') then
			FSM_STATE := '0';	
		elsif(FSM_CNT > 100) then
			FSM_STATE := not FSM_STATE;
			FSM_CNT := 0;
		else
			FSM_CNT := FSM_CNT + 1;			
		end if;	
		
	end if;
		
	FSM_CLK_Z <= FSM_STATE;

	end process;
	
end BEHAVIORAL;