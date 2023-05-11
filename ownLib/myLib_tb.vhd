Library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

Entity myLib_tb is
end myLib_tb;

architecture testbench of myLib_tb is
component myLib
    Port( x, y : in std_logic;
            z_and, z_or, z_xor, z_nand, z_nor, z_xnor      : out std_logic);
end component;

signal x_s, y_s, z_sand, z_sor, z_sxor, z_snand, z_snor, z_sxnor : std_logic;
begin
dut : myLib
port map (x_s, y_s, z_sand, z_sor, z_sxor, z_snand, z_snor, z_sxnor);
process
begin
    x_s <= '0'; y_s <= '0';
    wait for 1ns;
    x_s <= '0'; y_s <= '1';
    wait for 1ns;
    x_s <= '1'; y_s <= '0';
    wait for 1ns;
    x_s <= '1'; y_s <= '1';
	 wait for 1ns;
    wait;
end process;
end testbench;