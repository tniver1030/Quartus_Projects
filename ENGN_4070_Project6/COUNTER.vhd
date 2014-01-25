 
library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_ARITH.all; 
use IEEE.STD_LOGIC_UNSIGNED.all; 
 
entity BEHAVIORAL_EX19B is 
 port ( 
 CLK_Y: in STD_LOGIC; 
 SYN_EN_Y: in STD_LOGIC; 
 SYN_RST_Y: in STD_LOGIC; 
 TIMER_DONE_Z: out STD_LOGIC; 
 Q_Z: out STD_LOGIC_VECTOR (2 downto 1) 
 ); 
end BEHAVIORAL_EX19B; 
 
architecture BEHAVIORAL of BEHAVIORAL_EX19B is 
 
begin 
-- Next State Transitions 
-- Next State Evaluations 
-- 
P1: process (CLK_Y) 
 
 variable CURRENT_CNT: INTEGER range 0 to 2; 
 
 begin 
	if (rising_edge(CLK_Y)) then 
		if (SYN_RST_Y = '1') then 
			CURRENT_CNT := 0; 
		else 
			if (SYN_EN_Y = '1') then 
				CURRENT_CNT := CURRENT_CNT + 1; 
				if (CURRENT_CNT = 2) then 
					TIMER_DONE_Z <= '1';
				elsif (CURRENT_CNT > 2) then
					CURRENT_CNT := 0;
					TIMER_DONE_Z <= '0';
				else 
					TIMER_DONE_Z <= '0'; 
				end if; 
			else 
				null; 
			end if; 
		end if; 
	else 
		null; 
	end if; 
 
 Q_Z <= conv_std_logic_vector(CURRENT_CNT, 2); 
 
 end process; 
end BEHAVIORAL; 
