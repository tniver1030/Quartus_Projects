library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity LTM_FSM_MCU is
       port (
             CLK_Y:     in  STD_LOGIC; -- 100kHz
             REQ_EXT: 	in 	STD_LOGIC;
             ADC_DIN: 	in	STD_LOGIC;
             ADC_RST:	in	STD_LOGIC;
             PEN_IRQ:	in 	STD_LOGIC;
             ADC_BUSY:	in	STD_LOGIC;
             
             OUT_X:		out STD_LOGIC_VECTOR (12 downto 1);
             OUT_Y:		out STD_LOGIC_VECTOR (12 downto 1);
             ADC_SCEN: 	out STD_LOGIC;
             ADC_CLK: 	out STD_LOGIC;
             ADC_DOUT: 	out STD_LOGIC;
             READY_IRQ:	out STD_LOGIC
             
            );
end LTM_FSM_MCU;


architecture BEHAVIORAL of LTM_FSM_MCU is


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

signal IN_X:	std_logic_vector(12 downto 1);
signal IN_Y:	std_logic_vector(12 downto 1);

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
			when	IDLE 	=>
				if(REQ_EXT = '1') then
					NEXT_STATE <= REC;
				else --equals 0
					NEXT_STATE <= IDLE;
				end if;
			when	REC	 	=>
				if(REQ_EXT = '1') then
					NEXT_STATE <= REC;
				else --equals 0
					NEXT_STATE <= START;
				end if;
			when	START 	=>	
				NEXT_STATE <= C_SSX;
			when	C_SSX 	=>
				NEXT_STATE <= CXS_0;
			when	CXS_0  	=>
				NEXT_STATE <= CXS_1;
			when	CXS_1 	=>
				NEXT_STATE <= CXS_2;
			when	CXS_2  	=>
				NEXT_STATE <= CXS_3;
			when	CXS_3  	=>		
				NEXT_STATE <= CXS_4;
			when	CXS_4  	=>
				NEXT_STATE <= CXS_5;
			when	CXS_5 	=>		
				NEXT_STATE <= CXS_6;
			when	CXS_6  	=>
				NEXT_STATE <= CXS_7;
			when	CXS_7  	=>				
				NEXT_STATE <= CXS_8;
			when	CXS_8  	=>
				NEXT_STATE <= CXS_9;
			when	CXS_9 	=>			
				NEXT_STATE <= CXS_10;
			when	CXS_10  =>
				NEXT_STATE <= CXS_11;
			when	CXS_11  =>				
				NEXT_STATE <= CXS_12;
			when	CXS_12  =>
				NEXT_STATE <= CXS_13;
			when	CXS_13 	=>				
				NEXT_STATE <= CXS_14;
			when	CXS_14  =>
				NEXT_STATE <= CXS_15;
			when	CXS_15  =>				
				NEXT_STATE <= CX1_0;
			when	CX1_0  	=>  
				NEXT_STATE <= CX1_1;
			when	CX1_1 	=>				
				NEXT_STATE <= CX1_2;
			when	CX1_2  	=>  
				NEXT_STATE <= CX1_3;
			when	CX1_3  	=>				
				NEXT_STATE <= CX1_4;
			when	CX1_4  	=>  
				NEXT_STATE <= CX1_5;
			when	CX1_5 	=>				
				NEXT_STATE <= CX1_6;
			when	CX1_6  	=>  
				NEXT_STATE <= CX1_7;
			when	CX1_7  	=>				
				NEXT_STATE <= CX1_8;
			when	CX1_8  	=>  
				NEXT_STATE <= CX1_9;
			when	CX1_9 	=>				
				NEXT_STATE <= CX1_10;
			when	CX1_10  =>  
				NEXT_STATE <= CX1_11;
			when	CX1_11  =>				
				NEXT_STATE <= CX1_12;
			when	CX1_12  =>  
				NEXT_STATE <= CX1_13;
			when	CX1_13 	=>				
				NEXT_STATE <= CX1_14;
			when	CX1_14  =>  
				NEXT_STATE <= CX1_15;
			when	CX1_15  =>	
				NEXT_STATE <= CX2_0;
			when	CX2_0  	=>  
				NEXT_STATE <= CX2_1;
			when	CX2_1 	=>				
				NEXT_STATE <= CX2_2;
			when	CX2_2  	=>  
				NEXT_STATE <= CX2_3;
			when	CX2_3  	=>				
				NEXT_STATE <= CX2_4;
			when	CX2_4  	=> 
				NEXT_STATE <= CX2_5;
			when	CX2_5 	=>				
				NEXT_STATE <= CX2_6;
			when	CX2_6  	=>  
				NEXT_STATE <= CX2_7;
			when	CX2_7  	=>				
				NEXT_STATE <= CX2_8;
			when	CX2_8  	=> 
				NEXT_STATE <= CX2_9;
			when	CX2_9 	=>				
				NEXT_STATE <= CX2_10;
			when	CX2_10  =>  
				NEXT_STATE <= CX2_11;
			when	CX2_11  =>				
				NEXT_STATE <= CX2_12;
			when	CX2_12  =>  
				NEXT_STATE <= CX2_13;
			when	CX2_13 	=>				
				NEXT_STATE <= CX2_14;
			when	CX2_14  =>
				NEXT_STATE <= CXS_15;
			when	CX2_15  =>	
				NEXT_STATE <= WAIT1;
			when	WAIT1 	=>
				NEXT_STATE <= WAIT2;
			when 	WAIT2 	=>
				NEXT_STATE <= WAIT3;
			when 	WAIT3	=>
				NEXT_STATE <= C_SSY;
			when	C_SSY	=>		--start Y
				NEXT_STATE <= CYS_0;
			when	CYS_0  	=>
				NEXT_STATE <= CYS_1;
			when	CYS_1 	=>	
				NEXT_STATE <= CYS_2;
			when	CYS_2  	=>	
				NEXT_STATE <= CYS_3;
			when	CYS_3  	=>	
				NEXT_STATE <= CYS_4;
			when	CYS_4  	=>	
				NEXT_STATE <= CYS_5;
			when	CYS_5 	=>	
				NEXT_STATE <= CYS_6;
			when	CYS_6  	=>	
				NEXT_STATE <= CYS_7;
			when	CYS_7  	=>	
				NEXT_STATE <= CYS_8;
			when	CYS_8  	=>	
				NEXT_STATE <= CYS_9;
			when	CYS_9 	=>	
				NEXT_STATE <= CYS_10;
			when	CYS_10  =>	
				NEXT_STATE <= CYS_11;
			when	CYS_11  =>	
				NEXT_STATE <= CYS_12;
			when	CYS_12  =>	
				NEXT_STATE <= CYS_13;
			when	CYS_13 	=>	
				NEXT_STATE <= CYS_14;
			when	CYS_14  =>		
				NEXT_STATE <= CYS_15;
			when	CYS_15  => 		
				NEXT_STATE <= CY1_0;
			when	CY1_0  	=>		
				NEXT_STATE <= CY1_1;
			when	CY1_1 	=> 		
				NEXT_STATE <= CY1_2;
			when	CY1_2  	=>		
				NEXT_STATE <= CY1_3;
			when	CY1_3  	=> 		
				NEXT_STATE <= CY1_4;
			when	CY1_4  	=>		
				NEXT_STATE <= CY1_5;
			when	CY1_5 	=> 		
				NEXT_STATE <= CY1_6;
			when	CY1_6  	=>		
				NEXT_STATE <= CY1_7;
			when	CY1_7  	=> 		
				NEXT_STATE <= CY1_8;
			when	CY1_8  	=>		
				NEXT_STATE <= CY1_9;
			when	CY1_9 	=> 		
				NEXT_STATE <= CY1_10;
			when	CY1_10  =>		
				NEXT_STATE <= CY1_11;
			when	CY1_11  => 		
				NEXT_STATE <= CY1_12;
			when	CY1_12  =>		
				NEXT_STATE <= CY1_13;
			when	CY1_13 	=> 		
				NEXT_STATE <= CY1_14;
			when	CY1_14  =>	
				NEXT_STATE <= CY1_15;
			when	CY1_15  => 
				NEXT_STATE <= CY2_0;
			when	CY2_0  	=>		
				NEXT_STATE <= CY2_1;
			when	CY2_1 	=> 	
				NEXT_STATE <= CY2_2;
			when	CY2_2  	=>		
				NEXT_STATE <= CY2_3;
			when	CY2_3  	=> 	
				NEXT_STATE <= CY2_4;
			when	CY2_4  	=>		
				NEXT_STATE <= CY2_5;
			when	CY2_5 	=>		
				NEXT_STATE <= CY2_6;
			when	CY2_6  	=>	
				NEXT_STATE <= CY2_7;
			when	CY2_7  	=>	
				NEXT_STATE <= CY2_8;
			when	CY2_8  	=>	
				NEXT_STATE <= CY2_9;
			when	CY2_9 	=> 		
				NEXT_STATE <= CY2_10;
			when	CY2_10  =>		
				NEXT_STATE <= CY2_11;
			when	CY2_11  => 	
				NEXT_STATE <= CY2_12;
			when	CY2_12  =>	
				NEXT_STATE <= CY2_13;
			when	CY2_13 	=>	
				NEXT_STATE <= CYS_14;
			when	CY2_14  =>
				NEXT_STATE <= CYS_15;
			when	CY2_15  =>
				NEXT_STATE <= READYWAIT;
			when	READYWAIT	=>
				NEXT_STATE <= READYPULSE;
			when READYPULSE	=> 
				NEXT_STATE <= FINISH;
			when FINISH		=>
				NEXT_STATE <= IDLE;
				
		end case;   
	end process;

--DECLARE OUTPUTS
STATE_OUTPUTS: process (CURRENT_STATE)
    begin
        case CURRENT_STATE is
         			when	IDLE 	=>
				ADC_SCEN	<= '0';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	REC	 	=>
				ADC_SCEN	<= '0';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	START 	=>				
				ADC_SCEN	<= '0';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	C_SSX 	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '1';--1
				READY_IRQ 	<= '1';
			when	CXS_0  	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1';
				READY_IRQ 	<= '1';
			when	CXS_1 	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';--0
				READY_IRQ 	<= '1';
			when	CXS_2  	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';--EVEN FOLLOW PREV
				READY_IRQ 	<= '1';
			when	CXS_3  	=>		
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';--0
				READY_IRQ 	<= '1';
			when	CXS_4  	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CXS_5 	=>		
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '1';--1
				READY_IRQ 	<= '1';
			when	CXS_6  	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1'; 
				READY_IRQ 	<= '1';
			when	CXS_7  	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';--0
				READY_IRQ 	<= '1';
			when	CXS_8  	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CXS_9 	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '1';--1
				READY_IRQ 	<= '1';
			when	CXS_10  =>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1';
				READY_IRQ 	<= '1';
			when	CXS_11  =>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '1';--1
				READY_IRQ 	<= '1';
			when	CXS_12  =>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1';
				READY_IRQ 	<= '1';
			when	CXS_13 	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '1';--1
				READY_IRQ 	<= '1';
			when	CXS_14  =>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1';
				READY_IRQ 	<= '1';
			when	CXS_15  =>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0'; --0 from now on
				READY_IRQ 	<= '1';
			when	CX1_0  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX1_1 	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(12) 	<= ADC_DIN;
			when	CX1_2  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX1_3  	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(11) 	<= ADC_DIN;
			when	CX1_4  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX1_5 	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(10) 	<= ADC_DIN;
			when	CX1_6  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX1_7  	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(9) 	<= ADC_DIN;
			when	CX1_8  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX1_9 	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(8) 	<= ADC_DIN;
			when	CX1_10  =>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX1_11  =>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(7) 	<= ADC_DIN;
			when	CX1_12  =>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX1_13 	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(6) 	<= ADC_DIN;
			when	CX1_14  =>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX1_15  =>	
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(5) 	<= ADC_DIN;
			when	CX2_0  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX2_1 	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(4) 	<= ADC_DIN;
			when	CX2_2  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX2_3  	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(3) 	<= ADC_DIN;
			when	CX2_4  	=> 
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX2_5 	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(2) 	<= ADC_DIN;
			when	CX2_6  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX2_7  	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_X(1) 	<= ADC_DIN;
			when	CX2_8  	=> 
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX2_9 	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX2_10  =>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1'; 
			when	CX2_11  =>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX2_12  =>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX2_13 	=>				
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX2_14  =>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CX2_15  =>	
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	WAIT1 	=>
				ADC_SCEN	<= '0';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				OUT_X		<= IN_X;
			when 	WAIT2 	=>
				ADC_SCEN	<= '0';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when 	WAIT3	=>
				ADC_SCEN	<= '0';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	C_SSY	=>   --start Y
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '1';--1
				READY_IRQ 	<= '1';
			when	CYS_0  	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1';
				READY_IRQ 	<= '1';
			when	CYS_1 	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '1';--1
				READY_IRQ 	<= '1';
			when	CYS_2  	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CYS_3  	=>		
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';--0
				READY_IRQ 	<= '1';
			when	CYS_4  	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CYS_5 	=>		
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '1';--1
				READY_IRQ 	<= '1';
			when	CYS_6  	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1'; 
				READY_IRQ 	<= '1';
			when	CYS_7  	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';--0
				READY_IRQ 	<= '1';
			when	CYS_8  	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CYS_9 	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '1';--1
				READY_IRQ 	<= '1';
			when	CYS_10  =>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1';
				READY_IRQ 	<= '1';
			when	CYS_11  =>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '1';--1
				READY_IRQ 	<= '1';
			when	CYS_12  =>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1';
				READY_IRQ 	<= '1';
			when	CYS_13 	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '1';--1
				READY_IRQ 	<= '1';
			when	CYS_14  =>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1';
				READY_IRQ 	<= '1';
			when	CYS_15  =>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0'; --0
				READY_IRQ 	<= '1';
			when	CY1_0  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY1_1 	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(12)    <= ADC_DIN;
			when	CY1_2  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY1_3  	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(11)    <= ADC_DIN;
			when	CY1_4  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY1_5 	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(10)    <= ADC_DIN;
			when	CY1_6  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY1_7  	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(9)    <= ADC_DIN;
			when	CY1_8  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY1_9 	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(8)    <= ADC_DIN;
			when	CY1_10  =>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY1_11  =>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(7)    <= ADC_DIN;
			when	CY1_12  =>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY1_13 	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(6)    <= ADC_DIN;
			when	CY1_14  =>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY1_15  =>	
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(5)    <= ADC_DIN;
			when	CY2_0  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY2_1 	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(4)    <= ADC_DIN;
			when	CY2_2  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY2_3  	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(3)    <= ADC_DIN;
			when	CY2_4  	=> 
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY2_5 	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(2)    <= ADC_DIN;
			when	CY2_6  	=>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY2_7  	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
				IN_Y(1)    <= ADC_DIN;
			when	CY2_8  	=> 
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY2_9 	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY2_10  =>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1'; 
			when	CY2_11  =>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY2_12  =>  
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY2_13 	=>			
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY2_14  =>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	CY2_15  =>	
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '0';
				ADC_DOUT 	<= '0';
				READY_IRQ 	<= '1';
			when	READYWAIT	=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1';
				READY_IRQ 	<= '1';
				OUT_Y		<= IN_Y;
			when 	READYPULSE	=> 
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1';
				READY_IRQ 	<= '1';
			when 	FINISH		=>
				ADC_SCEN	<= '1';
				ADC_CLK 	<= '1';
				ADC_DOUT 	<= '1';
				READY_IRQ 	<= '1';
        end case;
    end process;
    



end BEHAVIORAL;