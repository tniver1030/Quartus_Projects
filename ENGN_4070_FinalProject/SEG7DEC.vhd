--  HEX-to-7-segment decoder, active low
--  Last revised February 5, 2014 by Wai Yung


library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity SEG7DEC is
       port (
             D_Y:  in  STD_LOGIC_VECTOR (4 downto 1);
             Q_LZ: out STD_LOGIC_VECTOR (7 downto 1)
            );
end entity SEG7DEC;


--      A
--     ---  
--  F |   | B
--     ---    <- G
--  E |   | C
--     ---
--      D


architecture DATAFLOW of SEG7DEC is


begin
    with D_Y select
         Q_LZ <= "0000001" when "0000",  -- Display 0
                 "1001111" when "0001",  -- Display 1
                 "0010010" when "0010",  -- Display 2
                 "0000110" when "0011",  -- Display 3
                 "1001100" when "0100",  -- Display 4
                 "0100100" when "0101",  -- Display 5
                 "0100000" when "0110",  -- Display 6
                 "0001111" when "0111",  -- Display 7
                 "0000000" when "1000",  -- Display 8
                 "0000100" when "1001",  -- Display 9
                 "0001000" when "1010",  -- Display A
                 "1100000" when "1011",  -- Display b
                 "0110001" when "1100",  -- Display C
                 "1000010" when "1101",  -- Display d
                 "0110000" when "1110",  -- Display E
                 "0111000" when "1111",  -- Display F
                 "1111111" when others;  -- All segments are OFF

end architecture DATAFLOW;
