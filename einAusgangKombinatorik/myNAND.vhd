Library ieee;
USE ieee.std_logic_1164.all;

Entity myNAND is
    Port( x, y : in std_logic;
            z      : out std_logic);
End myNAND;

Architecture behave of myNAND is
Begin
    process(x,y)
    begin
        z <= NOT (x AND y);
    end process;
end behave;