--Verhaltensmodell 
library ieee; 
use ieee.std_logic_1164.all; 

entity bcd is 
port( b : in std_logic_vector(3 downto 0); -- b3 to b0 
    ltn, bin : in std_logic; 
    hex : out std_logic_vector(0 to 6)); -- hex00..hex06 
end bcd; 
 
 architecture behavior of bcd is 
 begin 
 
    pl: process ( ltn, bin, b ) 
    begin 
        if ( ltn = '1' and bin = '0' ) then 
            case b is 
                --segmente abcdefg 
                when "0000"=> hex <="0000001"; -- 0 
                when "0001"=> hex <="1001111"; -- 1 
                when "0010"=> hex <="0010010"; -- 2 
                when "0011"=> hex <="0000110"; -- 3 
                when "0100"=> hex <="1001100"; -- 4 
                when "0101"=> hex <="0100100"; -- 5 
                when "0110"=> hex <="0100000"; -- 6 
                when "0111"=> hex <="0001111"; -- 7 
                when "1000"=> hex <="0000000"; -- 8 
                when "1001"=> hex <="0000100"; -- 9
                when others=> hex <="1111111"; -- should off
            end case; 
        elsif ( ltn = '0' and bin = '1' ) then 
            hex <= "0000000"; 
        elsif ( ltn = '0' and bin = '0' ) then 
            hex <= "1111111"; 
        else 
            -- dummy 
            hex <= "1111111"; 
        end if; 
    end process pl; 
 
 end behavior; 