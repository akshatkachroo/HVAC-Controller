library ieee;
use ieee.std_logic_1164.all;

entity Energy_Monitor is port(
	AGTB, AEQB, ALTB															: in	std_logic; -- A is current, B is desired
	vacation_mode, MC_test_mode, window_open, door_open			: in  std_logic;
	furnace, at_temp, AC, blower, window, door, vacation			: out std_logic;
	increase, decrease, run													: out std_logic
	
);
end Energy_Monitor;

architecture monitor of Energy_Monitor is

begin

Energy_monitor: process(AGTB, AEQB, ALTB, window_open, door_open, MC_test_mode) is
begin
		decrease, increase, run, AC, furnace, at_temp, blower <= '0';
		
		if (AEQB = '1') then
			if (window_open = '1' OR door_open = '1' OR MC_test_mode = '1') then
				run <= '0';
			elsif
				at_temp <= '1';
				blower <' '0';
			end if;
			
		end if;
				
		if (ALTB = '1') then
				AC <= '1';
				run <= '1';
				decrease <= '1';
				
		end if;
				
		if (AGTB = '1') then
				furnace <= '1';
				run <= '1';
				increase <= '1';
				
		end if;
		
		if ((AGTB ='1' OR ALTB = '1') AND (MC_test_mode = '0' AND window_open = '0' AND door_open = '0')) then 
			blower <= '1';
			
		END IF;
		
		door 		<= door_open;
		window 	<= window_open;
		vacation <= vacation_mode;
		
		end process;
end monitor;
		
		
		
				
				
		
	