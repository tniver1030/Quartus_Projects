library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity CONV is
       port (
            IN_X:     	in  STD_LOGIC_VECTOR (12 downto 1); -- 100kHz
            IN_Y: 		in 	STD_LOGIC_VECTOR (12 downto 1);

             
            OUT_X1:		out STD_LOGIC_VECTOR (5 downto 1);
            OUT_X2:		out STD_LOGIC_VECTOR (5 downto 1);
            OUT_X3:		out STD_LOGIC_VECTOR (5 downto 1);
            OUT_Y1:		out STD_LOGIC_VECTOR (5 downto 1);
            OUT_Y2:		out STD_LOGIC_VECTOR (5 downto 1);
			OUT_Y3:		out STD_LOGIC_VECTOR (5 downto 1)

             
            );
end CONV;


architecture BEHAVIORAL of CONV is

begin

P1:process(IN_X, IN_Y)
	begin
	
	OUT_X1(5) <= '1';
	OUT_X2(5) <= '1';
	OUT_X3(5) <= '1';
	OUT_Y1(5) <= '1';
	OUT_Y2(5) <= '1';
	OUT_Y3(5) <= '1';
	
	OUT_X1(4 downto 1) <= IN_X(12 downto 9);
	OUT_X2(4 downto 1) <= IN_X(8 downto 5);
	OUT_X3(4 downto 1) <= IN_X(4 downto 1);
	OUT_Y1(4 downto 1) <= IN_Y(12 downto 9);
	OUT_Y2(4 downto 1) <= IN_Y(8 downto 5);
	OUT_Y3(4 downto 1) <= IN_Y(8 downto 5);
	
	
	end process;
end BEHAVIORAL;