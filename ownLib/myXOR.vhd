Library ieee;
USE ieee.std_logic_1164.all;

Entity myXOR is
    Port( x, y : in std_logic;
            z      : out std_logic);
End myXOR;

Architecture behave of myXOR is
Begin
    process(x,y)
    begin
        z <= x XOR y;
    end process;
end behave;