library ieee;
use ieee.std_logic_1164.all;

-- divide 50MHz clock to 1 Hz (1 per second)
entity dt_clkdiv is
	port( reset, clk_in : in std_logic;
         clk_out       : out std_logic);
end  dt_clkdiv;

architecture behavior of dt_clkdiv is

	signal count : integer :=1;
	signal clk_intern : std_logic :='0';

begin
	
	process(reset, clk_in)
	begin
		if (reset =  '1') then
			count <= 1; 
		elsif(rising_edge(clk_in)) then
			count <=count+1;
			if(count = 6) then
			--if(count = 1000000) then
			--if(count = 25000000) then
				clk_intern <= not clk_intern;
				count <= 1;
			end if;
		end if;
	end process;
	
	clk_out <= clk_intern;
	
end  behavior;