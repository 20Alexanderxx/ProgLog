-- testbench ----------------------------------------------------
Library ieee;
Use ieee.std_logic_1164.all;

Entity tb_template is                 -- keine / leere Schnittstelle
End tb_template;

Architecture behave of tb_template is
Component kombinatorik
	PORT(	x, y	: IN  std_logic_vector(7 downto 0);
			s		: IN std_logic;
		   red	: OUT std_logic_vector(15 downto 0); 
			green	: OUT std_logic_vector(7 downto 0));
End Component;

Signal s_x, s_y, s_m2	: std_logic_vector(7 downto 0);         -- Input  Stimuli -Signale					  
Signal s_s 					: std_logic;
Signal s_m1					: std_logic_vector(15 downto 0);

Begin
	dut: kombinatorik            -- Instantiieren des Device Under Test
	Port Map (s_x, s_y, s_s, s_m1, s_m2);
		
	Process
		Begin
			s_s <= '0';
			s_x <= "00000000";
			s_y <= "11111111";
		Wait for 10 ns;
			s_x <= "00001111";
			s_y <= "11110000";
		Wait for 10 ns;
			s_s <= '1';
			s_x <= "00000000";
			s_y <= "11111111";
		Wait for 10 ns;
			s_x <= "00001111";
			s_y <= "11110000";
		Wait;
	End Process;
		
End behave;