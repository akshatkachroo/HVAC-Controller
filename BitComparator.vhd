library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity BitComparator is port (
	
	INPUT1               : in std_logic;
	INPUT2               : in std_logic;
	lessThan_output      : out std_logic;
	equal_output         : out std_logic;
	greaterThan_output   : out std_logic
); 
	end BitComparator;

architecture Behavioral of BitComparator is

begin

lessThan_output <= NOT ((NOT INPUT1) OR (INPUT1 AND INPUT2));
equal_output <= INPUT1 XNOR INPUT2;
greaterThan_output <= INPUT1 AND (NOT INPUT2);

end architecture Behavioral; 
