Library ieee;
USE ieee.std_logic_1164.all;

Entity myNOR is
    Port( x, y : in std_logic;
            z      : out std_logic);
End myNOR;

Architecture behave of myNOR is
Begin
    process(x,y)
    begin
        z <= NOT (x OR y);
    end process;
end behave;