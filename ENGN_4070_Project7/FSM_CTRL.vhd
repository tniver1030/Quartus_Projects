library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity FSM_CTRL is
       port (
             CLK_Y:      in  STD_LOGIC;
             SYN_RST_LY: in  STD_LOGIC;
             ADC_INTR_LY: in STD_LOGIC;
             
             ADC_CS_LZ: out STD_LOGIC;
             ADC_RD_LZ: out STD_LOGIC;
             ADC_WR_LZ: out STD_LOGIC;
             SYN_EN_Z: out STD_LOGIC
            );
end FSM_CTRL;


architecture BEHAVIORAL of FSM_CTRL is


type STATE_TYPE is (
			ADC_READY, 
			ADC_START,
			ADC_PROGRESS,
			ADC_DONE,
			ADC_LATCH
);


signal CURRENT_STATE: STATE_TYPE := ADC_READY;
signal NEXT_STATE:    STATE_TYPE := ADC_START;


begin

P1: process (CLK_Y)
    begin
        if (rising_edge(CLK_Y)) then
            CURRENT_STATE <= NEXT_STATE;
        end if;
    end process;

P2: process (SYN_RST_LY, CURRENT_STATE, ADC_INTR_LY)
    begin
        if (SYN_RST_LY = '0') then                               
            NEXT_STATE <= ADC_READY;
        else
            case CURRENT_STATE is
                 when   ADC_READY     =>  		--ADC_READY
                      NEXT_STATE <=  ADC_START;
                 when    ADC_START    =>		--ADC_START
                      NEXT_STATE <=  ADC_PROGRESS;
                 when     ADC_PROGRESS   => 	--ADC_PROGRESS
					if(ADC_INTR_LY = '0') then
						NEXT_STATE <=  ADC_DONE;
                    else
						NEXT_STATE <= ADC_PROGRESS;
					end if;
                 when    ADC_DONE    => 		--ADC_DONE
                      NEXT_STATE <=  ADC_LATCH;
                 when    ADC_LATCH    =>		--ADC_LATCH
                      NEXT_STATE <=	 ADC_READY;
                 when others =>
                      NEXT_STATE <= ADC_READY;
            end case;
        end if;
    end process;

P3: process (CURRENT_STATE)
    begin
        case CURRENT_STATE is
             when    ADC_READY   => 
				ADC_CS_LZ <= '1';
				ADC_RD_LZ <= '1';
				ADC_WR_LZ <= '1';
             when     ADC_START   => 
				ADC_CS_LZ <= '0';
				ADC_RD_LZ <= '0';
				ADC_WR_LZ <= '0';
             when    ADC_PROGRESS    =>	
				ADC_CS_LZ <= '0';
				ADC_RD_LZ <= '0';
				ADC_WR_LZ <= '1';
             when     ADC_DONE   => 
				ADC_CS_LZ <= '0';
				ADC_RD_LZ <= '0';
				ADC_WR_LZ <= '1';
             when     ADC_LATCH   => 
				ADC_CS_LZ <= '0';
				ADC_RD_LZ <= '0';
				ADC_WR_LZ <= '1';
             when others => 
				ADC_CS_LZ <= '1';
				ADC_RD_LZ <= '1';
				ADC_WR_LZ <= '1';
        end case;
    end process;

P4: process (CLK_Y, CURRENT_STATE)
    begin
        if (falling_edge(CLK_Y)) then
            case CURRENT_STATE is
                 when    ADC_READY    =>	
					SYN_EN_Z <= '0';
                 when   ADC_START     => 
					SYN_EN_Z <= '0';
                 when   ADC_PROGRESS     => 
					SYN_EN_Z <= '0';
                 when   ADC_DONE     => 
					SYN_EN_Z <= '1';
                 when    ADC_LATCH    => 
					SYN_EN_Z <= '0';
                 when others => 
					SYN_EN_Z <= '0';
            end case;
        end if;
    end process;

end BEHAVIORAL;