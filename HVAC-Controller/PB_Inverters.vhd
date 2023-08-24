library ieee;
use ieee.std_logic_1164.all;

-- this entity takes in all of the buttons from the board and inverts to active high

ENTITY PB_Inverters IS
	PORT
	(
		pb_n	:	IN std_logic_vector(3 downto 0); -- all of the button inputs on the FPGA board
		pb		:	OUT std_logic_vector(3 downto 0) -- outputs values which hold the inverted button values
	);
	
end PB_Inverters;

architecture gates of PB_Inverters is


begin

	pb <= not(pb_n); -- inverts all of the input values
	
end gates;