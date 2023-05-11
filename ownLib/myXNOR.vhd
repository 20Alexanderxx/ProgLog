Library ieee;
USE ieee.std_logic_1164.all;

Entity myXNOR is
    Port( x, y : in std_logic;
            z      : out std_logic);
End myXNOR;

Architecture behave of myXNOR is
Begin
    process(x,y)
    begin
        z <= x XNOR y;
    end process;
end behave;