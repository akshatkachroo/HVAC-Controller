library ieee;
use ieee.std_logic_1164.all;


entity LogicalStep_Lab3_top is port (
	clkin_50		: in 	std_logic;
	pb_n			: in	std_logic_vector(3 downto 0);
 	sw   			: in  std_logic_vector(7 downto 0); 	
	
	----------------------------------------------------
--	HVAC_temp : out std_logic_vector(3 downto 0); -- used for simulations only. Comment out for FPGA download compiles.
	----------------------------------------------------
	
   leds			: out std_logic_vector(7 downto 0);
   seg7_data 	: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  : out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  : out	std_logic				    		-- seg7 digit2 selector
	
); 
end LogicalStep_Lab3_top;

architecture design of LogicalStep_Lab3_top is
--
-- Provided Project Components Used
------------------------------------------------------------------- 

component SevenSegment  port (
   hex	   :  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
   sevenseg :  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
); 
end component SevenSegment;

component segment7_mux port (
          clk        : in  std_logic := '0';
			 DIN2 		: in  std_logic_vector(6 downto 0);	
			 DIN1 		: in  std_logic_vector(6 downto 0);
			 DOUT			: out	std_logic_vector(6 downto 0);
			 DIG2			: out	std_logic;
			 DIG1			: out	std_logic
        );
end component segment7_mux;

--	
--component Tester port (
-- MC_TESTMODE				: in  std_logic;
-- I1EQI2,I1GTI2,I1LTI2	: in	std_logic;
--	input1					: in  std_logic_vector(3 downto 0);
--	input2					: in  std_logic_vector(3 downto 0);
--	TEST_PASS  				: out	std_logic							 
--	); 
--	end component;
----	
--component HVAC 	port (
--	HVAC_SIM					: in boolean;
--	clk						: in std_logic; 
--	run		   			: in std_logic;
--	increase, decrease	: in std_logic;
--	temp						: out std_logic_vector (3 downto 0)
--	);
--end component;
------------------------------------------------------------------
-- Add any Other Components here
------------------------------------------------------------------

component Bit4Comparator  port (

   INPUTA               : in std_logic_vector (3 downto 0);
	INPUTB               : in std_logic_vector (3 downto 0);
	lessThan_output      : out std_logic;
	equal_output         : out std_logic;
	greaterThan_output   : out std_logic
	
); 
end component Bit4Comparator;

component PB_inverters port (
	pb_n	:	IN std_logic_vector(3 downto 0); 
	pb		:	OUT std_logic_vector(3 downto 0)
);
end component PB_inverters;

component temp_mux port (
	desired_temp, vacation_temp			: in std_logic_vector(3 downto 0);	
	vacation_mode								: in std_logic;						
	mux_temp										: out std_logic_vector(3 downto 0) 
);
end component temp_mux;

component HVAC port (
	HVAC_SIM					: in boolean;
	clk						: in std_logic;
	run						: in std_logic;
	increase, decrease	: in std_logic;
	temp						: out std_logic_vector (3 downto 0)
);
end component HVAC;

component Energy_Monitor port (
	AGTB, AEQB, ALTB															: in	std_logic; -- A is current, B is desired
	vacation_mode, MC_test_mode, window_open, door_open			: in  std_logic;
	furnace, at_temp, AC, blower, window, door, vacation			: out std_logic;
	increase, decrease, run													: out std_logic
);
end component Energy_Monitor;

component Tester port (
	MC_TESTMODE				: in  std_logic;
   I1EQI2,I1GTI2,I1LTI2	: in	std_logic;
	input1					: in  std_logic_vector(3 downto 0);
	input2					: in  std_logic_vector(3 downto 0);
	TEST_PASS  				: out	std_logic	
);
end component Tester;

------------------------------------------------------------------	
-- Create any additional internal signals to be used
------------------------------------------------------------------	
constant HVAC_SIM : boolean := FALSE; -- set to FALSE when compiling for FPGA download to LogicalStep board 
                                      -- or TRUE for doing simulations with the HVAC Component
------------------------------------------------------------------	

-- global clock
signal clk_in					: std_logic;
signal hex_A, hex_B 			: std_logic_vector(3 downto 0);
signal hexA_7seg, hexB_7seg: std_logic_vector(6 downto 0);

signal pb 						: std_logic_vector (3 downto 0);
signal mux_temp 				: std_logic_vector (3 downto 0);
signal AGTB, AEQB, ALTB		: std_logic;
signal run						: std_logic;
signal increase				: std_logic;
signal decrease				: std_logic;
signal current_temp			: std_logic_vector (3 downto 0);

------------------------------------------------------------------- 
begin -- Here the circuit begins

clk_in <= clkin_50;	--hook up the clock input

-- temp inputs hook-up to internal busses.
hex_A <= sw(3 downto 0);
hex_B <= sw(7 downto 4);

inst1: sevensegment port map (mux_temp, hexA_7seg);
inst2: sevensegment port map (current_temp, hexB_7seg);
inst3: segment7_mux port map (clk_in, hexA_7seg, hexB_7seg, seg7_data, seg7_char2, seg7_char1);
inst4: Bit4Comparator port map (mux_temp, hex_B, AGTB, AEQB, ALTB);
inst5: PB_inverters port map (pb_n, pb);
inst6: temp_mux port map (hex_A, hex_B, pb(3), mux_temp);
inst7: HVAC port map (clkin_50, run, increase, decrease, current_temp); 
inst8: Energy_Monitor port map (AGTB, AEQB, ALTB, pb(3), pb(2), pb(1), pb(0), leds(0), leds(1), leds(2), leds(3), leds(4), leds(5), leds(6), leds(7), decrease, increase, run);
inst9: Tester port map (pb(2), AGTB, AEQB, ALTB, hex_A, current_temp);
		
end design;

