library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Declear entity

entity SEG7DEC is 

       port (
       
       D_Y: in STD_LOGIC_VECTOR (8 downto 1);
       
       LFT_LZ: out STD_LOGIC_VECTOR (7 downto 1);

       RGT_LZ: out STD_LOGIC_VECTOR (7 downto 1)
               
       );
 end SEG7DEC;
 
 
 -- Declear architecture
 
 architecture BEHAVIORAL of SEG7DEC is
       
       begin
       process (D_Y)        
         begin
         
            case D_Y(8 downto 5) is 
                              
               when "0000" => LFT_LZ <= "0000001";
               when "0001" => LFT_LZ <= "1001111"; 
               when "0010" => LFT_LZ <= "0010010";
               when "0011" => LFT_LZ <= "0000110";
               when "0100" => LFT_LZ <= "1001100";
               when "0101" => LFT_LZ <= "0100100";
               when "0110" => LFT_LZ <= "0100000";
               when "0111" => LFT_LZ <= "0001111";
               when "1000" => LFT_LZ <= "0000000";
               when "1001" => LFT_LZ <= "0001100";
               when others => LFT_LZ <= "1001000";                                                         
         
             end case;
                          
            case D_Y(4 downto 1) is 
                              
               when "0000" => RGT_LZ <= "0000001";
               when "0001" => RGT_LZ <= "1001111"; 
               when "0010" => RGT_LZ <= "0010010";
               when "0011" => RGT_LZ <= "0000110";
               when "0100" => RGT_LZ <= "1001100";
               when "0101" => RGT_LZ <= "0100100";
               when "0110" => RGT_LZ <= "0100000";
               when "0111" => RGT_LZ <= "0001111";
               when "1000" => RGT_LZ <= "0000000";
               when "1001" => RGT_LZ <= "0001100";
               when others => RGT_LZ <= "1001000";                                                         
         
             end case;             
                                   
             end process;
         
             end BEHAVIORAL;                                       
         
         
         
         
         
         
         
         
         
       
       