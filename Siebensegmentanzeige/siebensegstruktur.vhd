--Strukturmodell 
library ieee; 
use ieee.std_logic_1164.all;

entity siebensegstruktur is 
port( b : in std_logic_vector(3 downto 0); -- b3 to b0 
    ltn, bin : in std_logic; 
    hex : out std_logic_vector(0 to 6)); -- hex00..hex06 
end siebensegstruktur;

architecture behavior of siebensegstruktur is
component myAND
    port( x, y  : in std_logic;
            z        : out std_logic);
end component;

component myOR
    port( x, y  : in std_logic;
            z        : out std_logic);
end component;

component myXNOR
    port( x, y  : in std_logic;
            z        : out std_logic);
end component;
signal b3_not, b2_not, b1_not, b0_not, --not in signals 
    hex00_00, hex00_01 , hex00_02, hex00_03, hex00_04, hex00_05, hex00_06 , hex00_07, hex00_08, --a
    hex01_00, hex01_01 , hex01_02, hex01_03, hex01_04, hex01_05, hex01_06 , hex01_07, 
    hex02_00, hex02_01 , hex02_02, hex02_03, hex02_04, hex02_05, 
    hex03_00, hex03_01 , hex03_02, hex03_03, hex03_04, hex03_05, hex03_06 , hex03_07, hex03_08 , hex03_09, hex03_10, --d 
    hex04_00, hex04_01 , hex04_02, hex04_03, hex04_04, hex04_05, 
    hex05_00, hex05_01 , hex05_02, hex05_03, hex05_04, hex05_05, hex05_06 , hex05_07, --f 
    hex06_00, hex06_01 , hex06_02, hex06_03, hex06_04, hex06_05, hex06_06 , hex06_07 : std_logic; --g

signal s_hex : std_logic_vector(0 to 6); -- [a, b, c, d, e, f] 

begin
    b3_not <= NOT b(3); 
    b2_not <= NOT b(2); 
    b1_not <= NOT b(1);
    b0_not <= NOT b(0); 
    
    HEX00_XNOR_00:myXNOR port map (b(2), b(3) , hex00_00); 
    HEX00_AND_00:myAND port map (hex00_00 , b1_not, hex00_01); 
    HEX00_AND_01:myAND port map (b(1), b2_not, hex00_02); 
    HEX00_AND_02:myAND port map (hex00_02 , b(3), hex00_03); 
    HEX00_OR_00 :myOR port map (hex00_01 , hex00_03, hex00_04); 
    HEX00_AND_03:myAND port map (hex00_04, b(0) , hex00_05); 
	 HEX00_AND_04: myAND port map(b0_not, b1_not, hex00_06);
	 HEX00_AND_05:myAND port map (hex00_06, b(2) , hex00_07); 
	 HEX00_AND_06:myAND port map(hex00_07, b3_not, hex00_08);
	 HEX00_OR_01 :myOR port map (hex00_05 , hex00_08, s_hex(0));
	 
    HEX01_AND_00:myAND port map (b(1) , b(3), hex01_00); 
    HEX01_AND_01:myAND port map (b(2), b1_not, hex01_01); 
    HEX01_AND_02:myAND port map (hex01_01 , b3_not, hex01_02); 
    HEX01_OR_00 :myOR port map (hex01_00 , hex01_02, hex01_03); 
    HEX01_AND_03:myAND port map (hex01_03, b(0) , hex01_04);
	 HEX01_OR_01 :myOR port map (b(1) , b(3), hex01_05); 
	 HEX01_AND_04: myAND port map(hex01_05, b(2), hex01_06);
	 HEX01_AND_05:myAND port map (hex01_06, b0_not , hex01_07);
	 HEX02_OR_02 :myOR port map (hex01_04 , hex01_07, s_hex(1));
	  
    HEX02_OR_00 :myOR port map (b0_not , b(1), hex02_00);
	 HEX02_AND_00:myAND port map (b(2) , b(3), hex02_01); 
    HEX02_AND_01:myAND port map (hex02_00, hex02_01, hex02_02); 
    HEX02_AND_02:myAND port map (b(1) , b0_not, hex02_03); 
    HEX02_AND_03:myAND port map (hex02_03, b2_not , hex02_04);
	 HEX02_AND_04: myAND port map(hex02_04, b3_not, hex02_05);
	 HEX02_OR_01 :myOR port map (hex02_02 , hex02_05, s_hex(2)); 
	 
	 HEX03_AND_00:myAND port map (b(1) , b(2), hex03_00); 
    HEX03_AND_01:myAND port map (b2_not, b1_not, hex03_01); 
    HEX03_AND_02:myAND port map (hex03_01 , b3_not, hex03_02); 
    HEX03_OR_00 :myOR port map (hex03_00 , hex03_02, hex03_03); 
    HEX03_AND_03:myAND port map (hex03_03, b(0) , hex03_04);
	 HEX03_AND_04: myAND port map(b(1), b(2), hex03_05);
	 HEX03_AND_05:myAND port map (hex03_05, b2_not , hex03_06);
	 HEX03_AND_06:myAND port map (b1_not, b3_not , hex03_07);
	 HEX03_AND_07:myAND port map (hex03_07, b(2) , hex03_08);
	 HEX03_OR_01 :myOR port map ( hex03_06 , hex03_08, hex03_09); 
	 HEX03_AND_08:myAND port map (hex03_09, b0_not , hex03_10);
	 HEX03_OR_02 :myOR port map (hex03_04 , hex03_10, s_hex(3));
	 
	 HEX04_AND_00:myAND port map (b(0) , b1_not, hex04_00); 
    HEX04_AND_01:myAND port map (hex04_00, b2_not, hex04_01); 
    HEX04_AND_02:myAND port map (b(3) , hex04_01, hex04_02); 
    HEX04_AND_03:myAND port map (b(2), b1_not , hex04_03);
	 HEX04_OR_00 :myOR port map (hex04_03 , b(0), hex04_04);
	 HEX04_AND_04: myAND port map(hex04_04, b3_not, hex04_05);
	 HEX04_OR_01 :myOR port map (hex04_02 , hex04_05, s_hex(4));
	
	 HEX05_AND_00:myAND port map (b(1) , b2_not, hex05_00); 
    HEX05_AND_01:myAND port map (hex05_00, b3_not, hex05_01);
	 HEX05_OR_00 :myOR port map (b(1) , b2_not, hex05_02); 
    HEX05_AND_02:myAND port map (hex05_02 , b3_not, hex05_03);  
    HEX05_AND_03:myAND port map (b(2), b1_not , hex05_04);
	 HEX05_AND_04: myAND port map(hex05_04, b(3), hex05_05);
	 HEX05_OR_01 :myOR port map (hex05_03 , hex05_05, hex05_06); 
	 HEX05_AND_05:myAND port map (hex05_06, b(0) , hex05_07);
	 HEX05_OR_02 :myOR port map (hex05_01 , hex05_07, s_hex(5));	
	 
	 HEX06_AND_00:myAND port map (b2_not , b1_not, hex06_00); 
    HEX06_AND_01:myAND port map (hex06_00, b3_not, hex06_01); 
    HEX06_AND_02:myAND port map (b(1) , b(0), hex06_02); 
    HEX06_AND_03:myAND port map (hex06_02, b3_not , hex06_03); 
	 HEX06_AND_04: myAND port map(b0_not, b1_not, hex06_04);
	 HEX06_AND_05:myAND port map (hex06_04, b(3) , hex06_05);
	 HEX06_OR_00 :myOR port map (hex06_05 , hex06_03, hex06_06); 
	 HEX06_AND_06:myAND port map(hex06_06, b(2), hex06_07);
	 HEX06_OR_01 :myOR port map (hex06_01 , hex06_07, s_hex(6));
	 
	 p1: process	 (ltn, bin, s_hex)
	 begin
		if (ltn = '1' and bin = '0') then
			hex <= s_hex;
		elsif(ltn = '0' and bin = '1') then
			hex <= "0000000";
		elsif(ltn = '0' and bin = '0') then
			hex <= "1111111";
		else
			hex <= "1111111";
		end if;
	end process p1;


end behavior;