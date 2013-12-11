--VHDL Project 2
--Lookup Table

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity LOOKUP_TABLE_CONV is
	port (
		INP_Y: in STD_LOGIC_VECTOR (8 downto 1);
		OUT_Z: out STD_LOGIC_VECTOR (8 downto 1)
	);
end LOOKUP_TABLE_CONV;

architecture BEHAVIORAL of LOOKUP_TABLE_CONV is
begin
	process (INP_Y) -- runs when iny changes
	begin
		
		case INP_Y is
			when "01000100" => OUT_Z <= "00000000";--00   
			when "01000101" => OUT_Z <= "00000001";--01   
			when "01000110" => OUT_Z <= "00000010";--02   
			when "01000111" => OUT_Z <= "00000011";--03   
			when "01001000" => OUT_Z <= "00000100";--04   
			when "01001001" => OUT_Z <= "00000101";--05   
			when "01001010" => OUT_Z <= "00000110";--06   
			when "01001011" => OUT_Z <= "00000111";--07   
			when "01001100" => OUT_Z <= "00001000";--08   
			when "01001101" => OUT_Z <= "00001001";--09   
			when "01001110" => OUT_Z <= "00010000";--10   
			when "01001111" => OUT_Z <= "00010001";--11   
			when "01010000" => OUT_Z <= "00010010";--12   
			when "01010001" => OUT_Z <= "00010011";--13   
			when "01010010" => OUT_Z <= "00010100";--14   
			when "01010011" => OUT_Z <= "00010101";--15   
			when "01010101" => OUT_Z <= "00010110";--16   
			when "01010110" => OUT_Z <= "00010111";--17   
			when "01010111" => OUT_Z <= "00011000";--18   
			when "01011000" => OUT_Z <= "00011001";--19   
			when "01011001" => OUT_Z <= "00100000";--20   
			when "01011010" => OUT_Z <= "00100001";--21   
			when "01011011" => OUT_Z <= "00100010";--22   
			when "01011100" => OUT_Z <= "00100011";--23   
			when "01011101" => OUT_Z <= "00100100";--24   
			when "01011110" => OUT_Z <= "00100101";--25   
			when "01011111" => OUT_Z <= "00100110";--26   
			when "01100000" => OUT_Z <= "00100111";--27   
			when "01100001" => OUT_Z <= "00101000";--28   
			when "01100011" => OUT_Z <= "00101001";--29   
			when "01100100" => OUT_Z <= "00110000";--30   
			when "01100101" => OUT_Z <= "00110001";--31   
			when "01100110" => OUT_Z <= "00110010";--32  
			when "01100111" => OUT_Z <= "00110011";--33  
			when "01101000" => OUT_Z <= "00110100";--34
			when "01101001" => OUT_Z <= "00110101";--35
			when "01101010" => OUT_Z <= "00110110";--36
			when "01101011" => OUT_Z <= "00110111";--37
			when "01101100" => OUT_Z <= "00111000";--38
			when "01101101" => OUT_Z <= "00111001";--39
			when "01101111" => OUT_Z <= "01000000";--40
			when "01110000" => OUT_Z <= "01000001";--41
			when "01110001" => OUT_Z <= "01000010";--42
			when "01110010" => OUT_Z <= "01000011";--43
			when "01110011" => OUT_Z <= "01000100";--44
			when "01110100" => OUT_Z <= "01000101";--45
			when "01110101" => OUT_Z <= "01000110";--46
			when "01110110" => OUT_Z <= "01000111";--47
			when "01110111" => OUT_Z <= "01001000";--48
			when "01111000" => OUT_Z <= "01001001";--49
			when "01111010" => OUT_Z <= "01010000";--50
			when "01111011" => OUT_Z <= "01010001";--51
			when "01111100" => OUT_Z <= "01010010";--52
			when "01111101" => OUT_Z <= "01010011";--53
			when "01111110" => OUT_Z <= "01010100";--54
			when "01111111" => OUT_Z <= "01010101";--55
			when "10000000" => OUT_Z <= "01010110";--56
			when "10000001" => OUT_Z <= "01010111";--57
			when "10000010" => OUT_Z <= "01011000";--58
			when "10000100" => OUT_Z <= "01011001";--59
			when "10000101" => OUT_Z <= "01100000";--60
			when "10000110" => OUT_Z <= "01100001";--61
			when "10000111" => OUT_Z <= "01100010";--62
			when "10001000" => OUT_Z <= "01100011";--63
			when "10001001" => OUT_Z <= "01100100";--64
			when "10001010" => OUT_Z <= "01100101";--65
			when "10001011" => OUT_Z <= "01100110";--66
			when "10001101" => OUT_Z <= "01100111";--67
			when "10001110" => OUT_Z <= "01101000";--68
			when "10001111" => OUT_Z <= "01101001";--69
			when "10010000" => OUT_Z <= "01110000";--70
			when "10010001" => OUT_Z <= "01110001";--71
			when "10010010" => OUT_Z <= "01110010";--72
			when "10010011" => OUT_Z <= "01110011";--73
			when "10010100" => OUT_Z <= "01110100";--74
			when "10010110" => OUT_Z <= "01110101";--75
			when "10010111" => OUT_Z <= "01110110";--76
			when "10011000" => OUT_Z <= "01110111";--77
			when "10011001" => OUT_Z <= "01111000";--78
			when "10011010" => OUT_Z <= "01111001";--79
			when "10011011" => OUT_Z <= "10000000";--80
			when "10011100" => OUT_Z <= "10000001";--81
			when "10011110" => OUT_Z <= "10000010";--82
			when "10011111" => OUT_Z <= "10000011";--83
			when "10100000" => OUT_Z <= "10000100";--84
			when "10100001" => OUT_Z <= "10000101";--85
			when "10100010" => OUT_Z <= "10000110";--86
			when "10100011" => OUT_Z <= "10000111";--87
			when "10100100" => OUT_Z <= "10001000";--88
			when "10100101" => OUT_Z <= "10001001";--89
			when "10100111" => OUT_Z <= "10010000";--90
			when "10101000" => OUT_Z <= "10010001";--91
			when "10101001" => OUT_Z <= "10010010";--92
			when "10101010" => OUT_Z <= "10010011";--93
			when "10101011" => OUT_Z <= "10010100";--94
			when "10101100" => OUT_Z <= "10010101";--95
			when "10101101" => OUT_Z <= "10010110";--96
			when "10101111" => OUT_Z <= "10010111";--97
			when "10110000" => OUT_Z <= "10011000";--98
			when "10110001" => OUT_Z <= "10011001";--99
			when others => OUT_Z <= "11111111";
		end case;
		
	end process;
end BEHAVIORAL;