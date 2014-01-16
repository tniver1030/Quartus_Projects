--VHDL Implementation of a synchronous up counter that counts to 9
--Used for a digital time clock

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity UP_CNT_TO_NINE is
	--generic (OUTDATA_WIDTH: NATURAL := 4);
	port(
		CLK_Y: in STD_LOGIC;
		ASY_RST_Y: in STD_LOGIC;
		ENABLE_Y: in STD_LOGIC;
		ENABLEOUT_Z: out STD_LOGIC;
		DECVAL_Z: out STD_LOGIC_VECTOR (4 downto 1)	
	);
end UP_CNT_TO_NINE;


architecture BEHAVIORAL of UP_CNT_TO_NINE is
	--Global Variables HERE
	

begin
	--Local Variables HERE
	P1:process(CLK_Y, ASY_RST_Y)
	
	variable COUNT: STD_LOGIC_VECTOR (4 downto 1); --Used to keep track of outputs
	variable EN: STD_LOGIC;
	variable COUNT2: STD_LOGIC := '0';
	
	begin
	if (ASY_RST_Y = '0') then --RESET
		COUNT:= X"0";
		EN := '0';
	elsif(rising_edge(CLK_Y) and ENABLE_Y = '1') then  --GO to next number TODO CLOCK EDGE
		if(COUNT = X"9")then
		COUNT := X"F";
		end if;
		COUNT := COUNT + '1';	
		if(COUNT = X"9")then
			EN := '1';
			COUNT2:='1';
		elsif(COUNT2 = '1') then
			EN := '0';
		else
			EN := '0';
		end if;
	else	--Do nothing if no enable or reset
		null;
	end if;
	
	DECVAL_Z <= COUNT;
	ENABLEOUT_Z <= EN;

	end process;
end BEHAVIORAL;
