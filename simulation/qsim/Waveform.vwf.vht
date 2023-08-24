-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "06/30/2023 09:57:12"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          LogicalStep_Lab3_top
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY LogicalStep_Lab3_top_vhd_vec_tst IS
END LogicalStep_Lab3_top_vhd_vec_tst;
ARCHITECTURE LogicalStep_Lab3_top_arch OF LogicalStep_Lab3_top_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clkin_50 : STD_LOGIC;
SIGNAL leds : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL pb_n : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL seg7_char1 : STD_LOGIC;
SIGNAL seg7_char2 : STD_LOGIC;
SIGNAL seg7_data : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL sw : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT LogicalStep_Lab3_top
	PORT (
	clkin_50 : IN STD_LOGIC;
	leds : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	pb_n : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	seg7_char1 : BUFFER STD_LOGIC;
	seg7_char2 : BUFFER STD_LOGIC;
	seg7_data : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	sw : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : LogicalStep_Lab3_top
	PORT MAP (
-- list connections between master ports and signals
	clkin_50 => clkin_50,
	leds => leds,
	pb_n => pb_n,
	seg7_char1 => seg7_char1,
	seg7_char2 => seg7_char2,
	seg7_data => seg7_data,
	sw => sw
	);

-- clkin_50
t_prcs_clkin_50: PROCESS
BEGIN
LOOP
	clkin_50 <= '0';
	WAIT FOR 20000 ps;
	clkin_50 <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clkin_50;

-- pb_n[0]
t_prcs_pb_n_0: PROCESS
BEGIN
	pb_n(0) <= '0';
	WAIT FOR 80000 ps;
	pb_n(0) <= '1';
WAIT;
END PROCESS t_prcs_pb_n_0;

-- sw[0]
t_prcs_sw_0: PROCESS
BEGIN
	sw(0) <= '1';
	WAIT FOR 20000 ps;
	FOR i IN 1 TO 5
	LOOP
		sw(0) <= '0';
		WAIT FOR 20000 ps;
		sw(0) <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	sw(0) <= '0';
	WAIT FOR 200000 ps;
	sw(0) <= '1';
	WAIT FOR 160000 ps;
	sw(0) <= '0';
WAIT;
END PROCESS t_prcs_sw_0;

-- sw[1]
t_prcs_sw_1: PROCESS
BEGIN
	sw(1) <= '1';
	WAIT FOR 20000 ps;
	FOR i IN 1 TO 15
	LOOP
		sw(1) <= '0';
		WAIT FOR 20000 ps;
		sw(1) <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	sw(1) <= '0';
	WAIT FOR 140000 ps;
	sw(1) <= '1';
	WAIT FOR 20000 ps;
	FOR i IN 1 TO 5
	LOOP
		sw(1) <= '0';
		WAIT FOR 20000 ps;
		sw(1) <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	sw(1) <= '0';
WAIT;
END PROCESS t_prcs_sw_1;
END LogicalStep_Lab3_top_arch;
