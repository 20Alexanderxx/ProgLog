Library ieee;
USE ieee.std_logic_1164.all;

Entity myOR is
    Port( x, y : in std_logic;
            z      : out std_logic);
End myOR;

Architecture behave of myOR is
Begin
    process(x,y)
    begin
        z <= x OR y;
    end process;
end behave;