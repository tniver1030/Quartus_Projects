library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
 
 
entity TRAFFICLIGHT_FSM is 
 port ( 
	CLK_Y: in STD_LOGIC; 
	SYN_RST_Y: in STD_LOGIC; 
	TIMER_DONE_Y: in STD_LOGIC; 
	GREEN_Z: out STD_LOGIC; 
	RED_Z: out STD_LOGIC; 
	YELLOW_Z: out STD_LOGIC; 
	EN_TIMER_Z: out STD_LOGIC; 
	RST_TIMER_Z: out STD_LOGIC 
 ); 
end TRAFFICLIGHT_FSM; 
 
 
architecture BEHAVIORAL of TRAFFICLIGHT_FSM is 
 
type STATE_TYPE is (GREEN, RED, YELLOW_G2R, YELLOW_R2G, BLINKING_RED, BLINK_TRANSITION); 
 
signal CURRENT_STATE: STATE_TYPE := RED; 
signal NEXT_STATE: STATE_TYPE := YELLOW_R2G; 
signal RED_STATE: STD_LOGIC := '1';
 
begin 
-- Next State Transitions 
-- 
P1: process (CLK_Y) 
 begin 
	if (rising_edge(CLK_Y)) then 
		if (SYN_RST_Y = '1') then 
			RED_STATE <= not RED_STATE;
			CURRENT_STATE <= BLINKING_RED; 
		else 
			RED_STATE <= '1';
			CURRENT_STATE <= NEXT_STATE; 
		end if; 
	else 
		null; 
	end if; 
 end process; 
 -- Next State Evaluations 
-- 
P2: process (CURRENT_STATE, TIMER_DONE_Y) 
 begin 
	case CURRENT_STATE is  
	when GREEN => 
		if (TIMER_DONE_Y = '1') then 
			NEXT_STATE <= YELLOW_G2R; 
		else 
			NEXT_STATE <= GREEN; 
		end if; 
 
	when RED => 
		if (TIMER_DONE_Y = '1') then 
			NEXT_STATE <= YELLOW_R2G; 
		else 
			NEXT_STATE <= RED; 
		end if; 
 
	when YELLOW_G2R => 
		NEXT_STATE <= RED; 
 
	when YELLOW_R2G => 
		NEXT_STATE <= GREEN; 
		
	when BLINKING_RED =>
		NEXT_STATE <= BLINK_TRANSITION;
		
	when BLINK_TRANSITION =>
		NEXT_STATE <= GREEN;
	end case; 
 end process; 
 
 
-- Traffic-light FSM Controller Light Outputs 
-- 
P3: process (CURRENT_STATE) 
 begin 
	case CURRENT_STATE is 
	when GREEN => 
		GREEN_Z <= '1'; 
		RED_Z <= '0'; 
		YELLOW_Z <= '0'; 
 
	when RED => 
		GREEN_Z <= '0'; 
		RED_Z <= '1'; 
		YELLOW_Z <= '0'; 
 
	when YELLOW_G2R => 
		GREEN_Z <= '0'; 
		RED_Z <= '0'; 
		YELLOW_Z <= '1'; 
 
	when YELLOW_R2G => 
		GREEN_Z <= '0'; 
		RED_Z <= '0'; 
		YELLOW_Z <= '1';
		
	when BLINKING_RED =>
		GREEN_Z <= '0';
		YELLOW_Z <= '0';
		RED_Z <= RED_STATE;
		
	when BLINK_TRANSITION =>
		GREEN_Z <= '0';
		YELLOW_Z <= '0';
		RED_Z <= RED_STATE;

 end case; 
 end process; 
 -- Traffic-light FSM Controller Linked-FSM Outputs 
-- 
P4: process (CURRENT_STATE) 
	begin 
		case CURRENT_STATE is 
			when GREEN => 
				EN_TIMER_Z <= '1'; 
				RST_TIMER_Z <= '0'; 
 
			when RED => 
				EN_TIMER_Z <= '1'; 
				RST_TIMER_Z <= '0'; 
 
			when YELLOW_G2R => 
				EN_TIMER_Z <= '0'; 
				RST_TIMER_Z <= '1'; 
 
			when YELLOW_R2G => 
				EN_TIMER_Z <= '0'; 
				RST_TIMER_Z <= '1'; 
			when BLINKING_RED =>
				EN_TIMER_Z <= '0';
				RST_TIMER_Z <= '1';
			when BLINK_TRANSITION =>
				EN_TIMER_Z <= '0';
				RST_TIMER_Z <= '0';
		end case; 
	end process; 
 
end BEHAVIORAL; 

 