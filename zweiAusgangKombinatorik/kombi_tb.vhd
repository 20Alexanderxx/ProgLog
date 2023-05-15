Library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity kombi_tb is
end kombi_tb;

architecture testbench of kombi_tb is
component kombi2
	port(x, y, z	:	in std_logic;
			f, g				:	out std_logic);
end component;

signal x_s, y_s, z_s, g_s, f_s : std_logic;
begin
dut: kombi2
port map (x_s, y_s, z_s, f_s, g_s);
process
begin
	x_s <= '0'; y_s <= '0'; z_s <= '0';
	wait for 1ns;
	x_s <= '0'; y_s <= '0'; z_s <= '1';
	wait for 1ns;
	x_s <= '0'; y_s <= '1'; z_s <= '0';
	wait for 1ns;
	x_s <= '0'; y_s <= '1'; z_s <= '1';
	wait for 1ns;
	x_s <= '1'; y_s <= '0'; z_s <= '0';
	wait for 1ns;
	x_s <= '1'; y_s <= '0'; z_s <= '1';
	wait for 1ns;
	x_s <= '1'; y_s <= '1'; z_s <= '0';
	wait for 1ns;
	x_s <= '1'; y_s <= '1'; z_s <= '1';
	wait for 1ns;
	wait;
end process;
end testbench;