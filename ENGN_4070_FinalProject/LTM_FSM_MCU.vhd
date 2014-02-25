library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity LTM_FSM_MCU is
       port (
             CLK_Y:     in  STD_LOGIC; -- 100kHz
             REQ_EXT: 	in 	STD_LOGIC;
             ADC_DIN: 	in STD_LOGIC;
             
             ADC_SCEN: 	out STD_LOGIC;
             ADC_CLK: 	out STD_LOGIC;
             ADC_DOUT: 	out STD_LOGIC;
             READY_IRQ:	out STD_LOGIC
             
            );
end LTM_FSM_MCU;


architecture BEHAVIORAL of LTM_FSM_MCUis


type STATE_TYPE is (
	IDLE,
	REC,
	START,
	C_SSX,
	CXS_0,
	CXS_1,
	CXS_2,
	CXS_3,
	CXS_4,
	CXS_5,
	CXS_6,
	CXS_7,
	CXS_8,
	CXS_9,
	CXS_10,
	CXS_11,
	CXS_12,
	CXS_13,
	CXS_14,
	CXS_15,
	CX1_0,
	CX1_1,
	CX1_2,
	CX1_3,
	CX1_4,
	CX1_5,
	CX1_6,
	CX1_7,
	CX1_8,
	CX1_9,
	CX1_10,
	CX1_11,
	CX1_12,
	CX1_13,
	CX1_14,
	CX1_15,
	CX2_0,
	CX2_1,
	CX2_2,
	CX2_3,
	CX2_4,
	CX2_5,
	CX2_6,
	CX2_7,
	CX2_8,
	CX2_9,
	CX2_10,
	CX2_11,
	CX2_12,
	CX2_13,
	CX2_14,
	CX2_15,
	WAIT1,
	WAIT2,
	WAIT3,	
	C_SSY,
	CYS_0,
	CYS_1,
	CYS_2,
	CYS_3,
	CYS_4,
	CYS_5,
	CYS_6,
	CYS_7,
	CYS_8,
	CYS_9,
	CYS_10,
	CYS_11,
	CYS_12,
	CYS_13,
	CYS_14,
	CYS_15,
	CY1_0,
	CY1_1,
	CY1_2,
	CY1_3,
	CY1_4,
	CY1_5,
	CY1_6,
	CY1_7,
	CY1_8,
	CY1_9,
	CY1_10,
	CY1_11,
	CY1_12,
	CY1_13,
	CY1_14,
	CY1_15,
	CY2_0,
	CY2_1,
	CY2_2,
	CY2_3,
	CY2_4,
	CY2_5,
	CY2_6,
	CY2_7,
	CY2_8,
	CY2_9,
	CY2_10,
	CY2_11,
	CY2_12,
	CY2_13,
	CY2_14,
	CY2_15,
	READYWAIT,
	READYPULSE,
	FINISH
	
	);

signal XVALUE;
signal YVALUE;

signal CURRENT_STATE: 	STATE_TYPE := IDLE;
signal NEXT_STATE:    	STATE_TYPE := IDLE;

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
	
    begin
        case CURRENT_STATE is
			when	LISTEN =>
				
			when	EXTEND =>
				
		end case;   
	end process;

--DECLARE OUTPUTS
STATE_OUTPUTS: process (CURRENT_STATE)
    begin
        case CURRENT_STATE is
             when      => 

             when        => 
				
        end case;
    end process;
    
 P4: process (CLK_Y, CURRENT_STATE)
    begin
        if (falling_edge(CLK_Y)) then
            
        end if;
    end process;


end BEHAVIORAL;