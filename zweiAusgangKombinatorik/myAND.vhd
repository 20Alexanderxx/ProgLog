Library ieee;
USE ieee.std_logic_1164.all;

Entity myAND is
    Port( x, y : in std_logic;
            z      : out std_logic);
End myAND;

Architecture behave of myAND is
Begin
    process(x,y)
    begin
        z <= x AND y;
    end process;
end behave;