library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity CLK_GEN is
       port (
             UP2_XTAL_Y: in  STD_LOGIC;
             CLK_1HZ:    out STD_LOGIC
            );
end CLK_GEN;


architecture BEHAVIORAL of CLK_GEN is


constant CLK_1HZ_HALF_PERIOD: INTEGER := 1258749;--9;
constant CLK_1HZ_RESET_VALUE: INTEGER := 0;

constant RST_FSM_LVA: STD_LOGIC := '0';


signal CLK_1HZ_BFR:     STD_LOGIC;
signal CLK_1HZ_CNT_BFR: INTEGER range CLK_1HZ_RESET_VALUE to CLK_1HZ_HALF_PERIOD;


begin
--  1 Hz Clock Generation
--
P1: process (UP2_XTAL_Y, CLK_1HZ_BFR)
    begin
        if (rising_edge(UP2_XTAL_Y)) then
            if (CLK_1HZ_CNT_BFR = CLK_1HZ_HALF_PERIOD) then
                CLK_1HZ_BFR     <= not (CLK_1HZ_BFR);
                CLK_1HZ_CNT_BFR <= CLK_1HZ_RESET_VALUE;
            else
                CLK_1HZ_BFR     <= CLK_1HZ_BFR;
                CLK_1HZ_CNT_BFR <= CLK_1HZ_CNT_BFR + 1;
            end if;
        end if;
    end process;

    CLK_1HZ <= CLK_1HZ_BFR;

end BEHAVIORAL;