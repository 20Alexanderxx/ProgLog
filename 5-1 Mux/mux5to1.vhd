library ieee;
use ieee.std_logic_1164.all;

entity mux5to1 is
	port( y, x, w, v, u, s2, s1, s0 : in  std_logic;
		   m                      : out std_logic);
end mux5to1;

architecture behave of mux5to1 is
begin
	process(s2, s1, s0)
	begin
    if (s2='0') then
  		if (s1='0' And s0='0') then
  			m <= u;
  		elsif (s1='0' And s0='1') then
  			m <= v;
  		elsif (s1='1' And s0='0') then
  			m <= w;
  		elsif (s1='1' And s0='1') then
  			m <= x;
  		end if;
  	elsif (s2='1') then
  	  m <= y;
    end if;
	end process;	
end behave;