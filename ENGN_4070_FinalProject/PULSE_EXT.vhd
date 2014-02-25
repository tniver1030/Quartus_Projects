library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity PULSE_EXT is
       port (
             CLK_Y:      	in  STD_LOGIC;
             START_Y: 		in  STD_LOGIC;
             EXTPULSE_Z: 	out STD_LOGIC
             
            );
end PULSE_EXT;


architecture BEHAVIORAL of PULSE_EXT is


type STATE_TYPE is (
				LISTEN, 
				EXTEND
);

signal CURRENT_STATE: 	STATE_TYPE := LISTEN;
signal NEXT_STATE:    	STATE_TYPE := LISTEN;

--THIS TAKES IN A 50MHz Clock

begin



UPDATE: process (CLK_Y)
    begin
        if (rising_edge(CLK_Y)) then
            CURRENT_STATE <= NEXT_STATE;
        end if;
    end process;


--DECLARE STATES
STATE_TABLE: process (CURRENT_STATE)

	variable COUNT: INTEGER range 0 to 100 := 0;
	
    begin
        case CURRENT_STATE is
			when	LISTEN =>
				if(START_Y = '1') then
					NEXT_STATE <= EXTEND;
				else
					NEXT_STATE <= LISTEN;
				end if;
			when	EXTEND =>
				if(COUNT < 100) then
					COUNT := COUNT + 1;
					NEXT_STATE <= EXTEND;
				elsif(COUNT = 100) then
					COUNT := 0;
					NEXT_STATE <= LISTEN;			
				end if;
		end case;   
	end process;

--DECLARE OUTPUTS
STATE_OUTPUTS: process (CURRENT_STATE)
    begin
        case CURRENT_STATE is
             when    LISTEN   => 
				EXTPULSE_Z <= '0';
             when     EXTEND   => 
				EXTPULSE_Z <= '1';
        end case;
    end process;


end BEHAVIORAL;