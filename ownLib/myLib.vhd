Library ieee;
USE ieee.std_logic_1164.all;


Entity myLib is
	Port( x, y : in std_logic;
            z_and, z_or, z_xor, z_nand, z_nor, z_xnor      : out std_logic);
end myLib;

architecture behave of myLib is
component myAND
    port( x, y  : in std_logic;
            z        : out std_logic);
end component;

component myOR
    port( x, y  : in std_logic;
            z        : out std_logic);
end component;

component myXOR
    port( x, y  : in std_logic;
            z        : out std_logic);
end component;

component myNAND
    port( x, y  : in std_logic;
            z        : out std_logic);
end component;

component myNOR
    port( x, y  : in std_logic;
            z        : out std_logic);
end component;

component myXNOR
    port( x, y  : in std_logic;
            z        : out std_logic);
end component;

begin
		dut_and : myAND port map (x, y, z_and);
		dut_or : myOR port map (x, y, z_or);
		dut_xor : myXOR port map (x, y, z_xor);
		dut_nand : myNAND port map (x, y, z_nand);
		dut_nor : myNOR port map (x, y, z_nor);
		dut_xnor : myXNOR port map (x, y, z_xnor);
end behave;