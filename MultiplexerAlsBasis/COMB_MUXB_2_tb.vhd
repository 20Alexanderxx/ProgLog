Library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity COMB_MUXB_2_tb is
end COMB_MUXB_2_tb;

architecture testbench of COMB_MUXB_2_tb is
component COMB_MUXB_2
	port(x, y, z, v	:	in std_logic;
			f, g				:	out std_logic);
end component;

signal x_s, y_s, z_s, v_s, f_s, g_s : std_logic;
begin
dut: COMB_MUXB_2
port map (x_s, y_s, z_s, v_s, f_s, g_s);
process
begin
	x_s <= '0'; y_s <= '0'; z_s <= '0'; v_s <= '0';
	wait for 1ns;
	x_s <= '0'; y_s <= '0'; z_s <= '0'; v_s <= '1';
	wait for 1ns;
	x_s <= '0'; y_s <= '0'; z_s <= '1'; v_s <= '0';
	wait for 1ns;
	x_s <= '0'; y_s <= '0'; z_s <= '1'; v_s <= '1';
	wait for 1ns;
	x_s <= '0'; y_s <= '1'; z_s <= '0'; v_s <= '0';
	wait for 1ns;
	x_s <= '0'; y_s <= '1'; z_s <= '0'; v_s <= '1';
	wait for 1ns;
	x_s <= '0'; y_s <= '1'; z_s <= '1'; v_s <= '0';
	wait for 1ns;
	x_s <= '0'; y_s <= '1'; z_s <= '1'; v_s <= '1';
	wait for 1ns;
	x_s <= '1'; y_s <= '0'; z_s <= '0'; v_s <= '0';
	wait for 1ns;
	x_s <= '1'; y_s <= '0'; z_s <= '0'; v_s <= '1';
	wait for 1ns;
	x_s <= '1'; y_s <= '0'; z_s <= '1'; v_s <= '0';
	wait for 1ns;
	x_s <= '1'; y_s <= '0'; z_s <= '1'; v_s <= '1';
	wait for 1ns;
	x_s <= '1'; y_s <= '1'; z_s <= '0'; v_s <= '0';
	wait for 1ns;
	x_s <= '1'; y_s <= '1'; z_s <= '0'; v_s <= '1';
	wait for 1ns;
	x_s <= '1'; y_s <= '1'; z_s <= '1'; v_s <= '0';
	wait for 1ns;
	x_s <= '1'; y_s <= '1'; z_s <= '1'; v_s <= '1';
	wait for 1ns;
	wait;
end process;
end testbench;