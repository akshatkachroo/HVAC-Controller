library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity U_D_Bin_Counter8bit is port 
	(
			
			CLK					: in std_logic ;
			RESET 				: in std_logic ;
			CLK_EN				: in std_logic ;
			UP1_DOWN0			: in std_logic ; 
			COUNTER_BITS		: out std_logic_vector(7 downto 0)
	);
end Entity; 

	ARCHITECTURE one OF U_D_Bin_Counter8bit IS
	
	Signal ud_bin_counter	: UNSIGNED(7 downto 0);
	
BEGIN

process (CLK) is 
begin 
	if (rising_edge(CLK)) then
	
		if (RESET = '1') then
			ud_bin_counter <= "00000000";
			
		elsif((CLK_EN = '1') ) then
		
			IF(UP1_DOWN0 = '1') then
				ud_bin_counter <= (ud_bin_counter + 1);
				
			ELSE
			
				ud_bin_counter <= (ud_bin_counter -1); 
			end if;
		
		end if;
		
	end if;
	
	COUNTER_BITS <= std_logic_vector(ud_bin_counter);

end process;

end; 