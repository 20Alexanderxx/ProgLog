-- NOT-Gatter
entity NOT_Gate is
  port (A : in bit; Y : out bit);
end NOT_Gate;

architecture Behavioral of NOT_Gate is
begin
  Y <= not A;
end Behavioral;

-- AND-Gatter
entity AND_Gate is
  port (A, B : in bit; Y : out bit);
end AND_Gate;

architecture Behavioral of AND_Gate is
begin
  Y <= A and B;
end Behavioral;

-- NAND-Gatter
entity NAND_Gate is
  port (A, B : in bit; Y : out bit);
end NAND_Gate;

architecture Behavioral of NAND_Gate is
begin
  Y <= not (A and B);
end Behavioral;

-- OR-Gatter
entity OR_Gate is
  port (A, B : in bit; Y : out bit);
end OR_Gate;

architecture Behavioral of OR_Gate is
begin
  Y <= A or B;
end Behavioral;

-- NOR-Gatter
entity NOR_Gate is
  port (A, B : in bit; Y : out bit);
end NOR_Gate;

architecture Behavioral of NOR_Gate is
begin
  Y <= not (A or B);
end Behavioral;

-- XOR-Gatter
entity XOR_Gate is
  port (A, B : in bit; Y : out bit);
end XOR_Gate;

architecture Behavioral of XOR_Gate is
begin
  Y <= A xor B;
end Behavioral;

-- XNOR-Gatter
entity XNOR_Gate is
  port (A, B : in bit; Y : out bit);
end XNOR_Gate;

architecture Behavioral of XNOR_Gate is
begin
  Y <= A xnor B;
end Behavioral;