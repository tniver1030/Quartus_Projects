--  ENGN4070 Hardware Organization & Design
--  2008 Spring CE
--  Design Assignment#8 Demonstration
--  Copyright 2004, 2005, 2006, 2007, 2008 Wai Yung


--  Unit Description
--  1.   This unit clocks down input clock by 1024.


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity CLK_DOWN is
       port (
             CLK_Y: in  STD_LOGIC;
             Q_Z:   out STD_LOGIC
            );
end entity CLK_DOWN;


architecture BEHAVIORAL of CLK_DOWN is


begin
--  Clock Down
--
P1: process (CLK_Y)

    variable CURRENT_CNT: STD_LOGIC_VECTOR (10 downto 1);

    begin
        if (rising_edge(CLK_Y)) then
            CURRENT_CNT := CURRENT_CNT + '1';
        end if;

        Q_Z <= CURRENT_CNT (10);

    end process;

end architecture BEHAVIORAL;