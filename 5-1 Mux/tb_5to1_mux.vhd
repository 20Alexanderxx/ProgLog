Library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity tb_5to1_mux is
end tb_5to1_mux;

architecture test of tb_5to1_mux is

signal u_s, v_s, w_s, x_s, y_s : std_logic := '0';
signal s0_s, s1_s, s2_s : std_logic := '0';
signal m_s : std_logic;

component mux5to1 is
	port( y, x, w, v, u, s2, s1, s0 : in  std_logic;
				m                      : out std_logic);
end component;

begin

dut: mux5to1 
port map(y_s, x_s, w_s, v_s, u_s, s2_s, s1_s, s0_s, m_s);

process
begin
    -- loop through all possible combinations of inputs
    for i in 0 to 31 loop
        -- assign the inputs based on the binary representation of i
        u_s <= std_logic(to_unsigned(i, 5)(4));
        v_s <= std_logic(to_unsigned(i, 5)(3));
        w_s <= std_logic(to_unsigned(i, 5)(2));
        x_s <= std_logic(to_unsigned(i, 5)(1));
        y_s <= std_logic(to_unsigned(i, 5)(0));
        -- loop through all possible combinations of selectors
        for j in 0 to 7 loop
            -- assign the selectors based on the binary representation of j
            s0_s <= std_logic(to_unsigned(j, 3)(2));
            s1_s <= std_logic(to_unsigned(j, 3)(1));
            s2_s <= std_logic(to_unsigned(j, 3)(0));
            -- wait for some time to observe the output
            wait for 10 ns;
        end loop;
    end loop;
    -- stop the simulation
    wait;
end process;

end test;