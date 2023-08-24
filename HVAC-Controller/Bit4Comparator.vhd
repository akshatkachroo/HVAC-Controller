library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Bit4Comparator is port (
	
	INPUTA               : in std_logic_vector (3 downto 0);
	INPUTB               : in std_logic_vector (3 downto 0);
	lessThan_output      : out std_logic;
	equal_output         : out std_logic;
	greaterThan_output   : out std_logic
	
); 
end Bit4Comparator;

architecture Behavioral of Bit4Comparator is

component BitComparator  port (
	INPUT1               : in std_logic;
	INPUT2               : in std_logic;
   lessThan_output      : out std_logic;
	equal_output         : out std_logic;
	greaterThan_output   : out std_logic
); 
end component BitComparator;



signal LT    : std_logic_vector (3 downto 0);
signal ET    : std_logic_vector (3 downto 0);
signal GT    : std_logic_vector (3 downto 0);

begin

INST1: BitComparator port map (INPUTA(0), INPUTB(0), LT(0), ET(0), GT(0));
INST2: BitComparator port map (INPUTA(1), INPUTB(1), LT(1), ET(1), GT(1));
INST3: BitComparator port map (INPUTA(2), INPUTB(2), LT(2), ET(2), GT(2));
INST4: BitComparator port map (INPUTA(3), INPUTB(3), LT(3), ET(3), GT(3));

lessThan_output <= LT(0) OR (ET(0) AND LT(1)) OR (ET(0) AND ET(1) AND LT(2)) OR (ET(0) AND ET(1) AND ET(2) AND LT(3)); 
equal_output <= ET(3) AND ET(2) AND ET(1) AND ET(0);
greaterThan_output <= GT(0) OR (ET(0) AND GT(1)) OR (ET(0) AND ET(1) AND GT(2)) OR (ET(0) AND ET(1) AND ET(2) AND GT(3));

end architecture Behavioral; 
