-- Testbench für Grundgatter
library ieee;
use ieee.std_logic_1164.all;

library work; -- Die work-Bibliothek ist die Standardbibliothek für die aktuellen Dateien
use work.gatter.all; -- Die use-Anweisung importiert alle Entities und Packages aus der Datei gatter.vhd

entity gatter_tb is
end entity gatter_tb;

architecture test of gatter_tb is
  -- Komponentendeklarationen für die Gatter
  component NOT_Gate is
    port (A : in bit; Y : out bit);
  end component;
  
  component AND_Gate is
    port (A, B : in bit; Y : out bit);
  end component;
  
  component NAND_Gate is
    port (A, B : in bit; Y : out bit);
  end component;
  
  component OR_Gate is
    port (A, B : in bit; Y : out bit);
  end component;
  
  component NOR_Gate is
    port (A, B : in bit; Y : out bit);
  end component;
  
  component XOR_Gate is
    port (A, B : in bit; Y : out bit);
  end component;
  
  component XNOR_Gate is
    port (A, B : in bit; Y : out bit);
  end component;
  
  -- Signale für die Eingänge und Ausgänge der Gatter
  signal A, B : bit := '0';
  signal NOT_Y, AND_Y, NAND_Y, OR_Y, NOR_Y, XOR_Y, XNOR_Y : bit;
begin
  -- Instanziierung der Gatter
  U1: NOT_Gate port map (A => A, Y => NOT_Y);
  U2: AND_Gate port map (A => A, B => B, Y => AND_Y);
  U3: NAND_Gate port map (A => A, B => B, Y => NAND_Y);
  U4: OR_Gate port map (A => A, B => B, Y => OR_Y);
  U5: NOR_Gate port map (A => A, B => B, Y => NOR_Y);
  U6: XOR_Gate port map (A => A, B => B, Y => XOR_Y);
  U7: XNOR_Gate port map (A => A, B => B, Y => XNOR_Y);
  
  -- Prozess zur Erzeugung der Testvektoren
  process
    type vector_array is array (0 to 3) of bit_vector(1 downto 0); -- Typ für die Eingangsvektoren
    constant inputs : vector_array := ("00", "01", "10", "11"); -- Konstante für die Eingangsvektoren
    type result_array is array (0 to 3) of bit; -- Typ für die Ausgangsvektoren
    constant NOT_results : result_array := ('1', '0', '0', '1'); -- Konstante für die erwarteten Ergebnisse des NOT-Gatters
    constant AND_results : result_array := ('0', '0', '0', '1'); -- Konstante für die erwarteten Ergebnisse des AND-Gatters
    constant NAND_results : result_array := ('1', '1', '1', '0'); -- Konstante für die erwarteten Ergebnisse des NAND-Gatters
    constant OR_results : result_array := ('0', '1', '1', '1'); -- Konstante für die erwarteten Ergebnisse des OR-Gatters
    constant NOR_results : result_array := ('1', '0', '0', '0'); -- Konstante für die erwarteten Ergebnisse des NOR-Gatters
    constant XOR_results : result_array := ('0', '1', '1', '0'); -- Konstante für die erwarteten Ergebnisse des XOR-Gatters
    constant XNOR_results : result_array := ('1', '0', '0', '1'); -- Konstante für die erwarteten Ergebnisse des XNOR-Gatters
    
    variable i : integer range 0 to inputs'length - 1; -- Variable für den Index der Testvektoren
    
procedure check_result(signal actual : in bit; expected : in bit; gate_name : in string) is -- Prozedur zur Überprüfung der Ausgänge der Gatter mit den erwarteten Werten
begin
  if actual /= expected then -- Wenn der tatsächliche Wert nicht dem erwarteten Wert entspricht,
    report "Fehler: " & gate_name & "-Gatter liefert falsches Ergebnis." severity error; -- dann melde einen Fehler mit dem Namen des Gatters
  end if;
end procedure;

-- Prozess zur Erzeugung der Testvektoren
  process
    -- Typ- und Konstantendeklarationen wie oben
    variable i : integer range 0 to inputs'length - 1; -- Variable für den Index der Testvektoren
    
  begin
    for i in inputs'range loop -- Für jeden Testvektor
      A <= inputs(i)(0); -- Setze den ersten Eingang des Gatters auf den ersten Bit des Testvektors
      B <= inputs(i)(1); -- Setze den zweiten Eingang des Gatters auf den zweiten Bit des Testvektors
      wait for 10 ns; -- Warte 10 ns, damit sich die Ausgänge stabilisieren
      
      -- Rufe die Prozedur check_result für jedes Gatter auf und gebe die tatsächlichen und erwarteten Ausgänge sowie den Namen des Gatters an
      check_result(NOT_Y, NOT_results(i), "NOT");
      check_result(AND_Y, AND_results(i), "AND");
      check_result(NAND_Y, NAND_results(i), "NAND");
      check_result(OR_Y, OR_results(i), "OR");
      check_result(NOR_Y, NOR_results(i), "NOR");
      check_result(XOR_Y, XOR_results(i), "XOR");
      check_result(XNOR_Y, XNOR_results(i), "XNOR");
    end loop;
    
    wait; -- Beende den Prozess
  end process;