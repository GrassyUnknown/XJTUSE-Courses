-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Full Version"

-- DATE "09/06/2023 17:58:28"

-- 
-- Device: Altera EP4CE6E22C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	step3 IS
    PORT (
	T1 : OUT std_logic;
	RST1 : IN std_logic;
	CLK1 : IN std_logic;
	S0 : IN std_logic;
	T4 : OUT std_logic;
	T2 : OUT std_logic;
	T3 : OUT std_logic
	);
END step3;

-- Design Ports Information
-- T1	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- T4	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- T2	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- T3	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RST1	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK1	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF step3 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_T1 : std_logic;
SIGNAL ww_RST1 : std_logic;
SIGNAL ww_CLK1 : std_logic;
SIGNAL ww_S0 : std_logic;
SIGNAL ww_T4 : std_logic;
SIGNAL ww_T2 : std_logic;
SIGNAL ww_T3 : std_logic;
SIGNAL \inst5~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \T1~output_o\ : std_logic;
SIGNAL \T4~output_o\ : std_logic;
SIGNAL \T2~output_o\ : std_logic;
SIGNAL \T3~output_o\ : std_logic;
SIGNAL \S0~input_o\ : std_logic;
SIGNAL \inst1~feeder_combout\ : std_logic;
SIGNAL \RST1~input_o\ : std_logic;
SIGNAL \inst1~q\ : std_logic;
SIGNAL \inst2~feeder_combout\ : std_logic;
SIGNAL \inst2~q\ : std_logic;
SIGNAL \inst3~feeder_combout\ : std_logic;
SIGNAL \inst3~q\ : std_logic;
SIGNAL \inst4~q\ : std_logic;
SIGNAL \CLK1~input_o\ : std_logic;
SIGNAL \inst5~combout\ : std_logic;
SIGNAL \inst5~clkctrl_outclk\ : std_logic;
SIGNAL \inst8|5~0_combout\ : std_logic;
SIGNAL \inst8|5~1_combout\ : std_logic;
SIGNAL \inst~q\ : std_logic;

BEGIN

T1 <= ww_T1;
ww_RST1 <= RST1;
ww_CLK1 <= CLK1;
ww_S0 <= S0;
T4 <= ww_T4;
T2 <= ww_T2;
T3 <= ww_T3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst5~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst5~combout\);

-- Location: IOOBUF_X34_Y18_N23
\T1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst~q\,
	devoe => ww_devoe,
	o => \T1~output_o\);

-- Location: IOOBUF_X34_Y19_N16
\T4~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3~q\,
	devoe => ww_devoe,
	o => \T4~output_o\);

-- Location: IOOBUF_X34_Y17_N2
\T2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1~q\,
	devoe => ww_devoe,
	o => \T2~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\T3~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2~q\,
	devoe => ww_devoe,
	o => \T3~output_o\);

-- Location: IOIBUF_X21_Y0_N8
\S0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S0,
	o => \S0~input_o\);

-- Location: LCCOMB_X33_Y12_N26
\inst1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1~feeder_combout\ = \inst~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst~q\,
	combout => \inst1~feeder_combout\);

-- Location: IOIBUF_X16_Y0_N1
\RST1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST1,
	o => \RST1~input_o\);

-- Location: FF_X33_Y12_N27
inst1 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst5~clkctrl_outclk\,
	d => \inst1~feeder_combout\,
	clrn => \RST1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1~q\);

-- Location: LCCOMB_X33_Y12_N14
\inst2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2~feeder_combout\ = \inst1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1~q\,
	combout => \inst2~feeder_combout\);

-- Location: FF_X33_Y12_N15
inst2 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst5~clkctrl_outclk\,
	d => \inst2~feeder_combout\,
	clrn => \RST1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2~q\);

-- Location: LCCOMB_X33_Y12_N28
\inst3~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3~feeder_combout\ = \inst2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst2~q\,
	combout => \inst3~feeder_combout\);

-- Location: FF_X33_Y12_N29
inst3 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst5~clkctrl_outclk\,
	d => \inst3~feeder_combout\,
	clrn => \RST1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3~q\);

-- Location: FF_X33_Y12_N23
inst4 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst5~clkctrl_outclk\,
	asdata => \inst3~q\,
	clrn => \RST1~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4~q\);

-- Location: IOIBUF_X34_Y12_N8
\CLK1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK1,
	o => \CLK1~input_o\);

-- Location: LCCOMB_X33_Y12_N22
inst5 : cycloneive_lcell_comb
-- Equation(s):
-- \inst5~combout\ = LCELL((\CLK1~input_o\) # ((!\S0~input_o\ & \inst4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S0~input_o\,
	datac => \inst4~q\,
	datad => \CLK1~input_o\,
	combout => \inst5~combout\);

-- Location: CLKCTRL_G6
\inst5~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst5~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst5~clkctrl_outclk\);

-- Location: LCCOMB_X33_Y12_N24
\inst8|5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|5~0_combout\ = (!\inst2~q\ & (!\inst~q\ & ((\S0~input_o\) # (!\inst3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S0~input_o\,
	datab => \inst2~q\,
	datac => \inst~q\,
	datad => \inst3~q\,
	combout => \inst8|5~0_combout\);

-- Location: LCCOMB_X33_Y12_N30
\inst8|5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|5~1_combout\ = (!\inst1~q\ & \inst8|5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1~q\,
	datad => \inst8|5~0_combout\,
	combout => \inst8|5~1_combout\);

-- Location: FF_X33_Y12_N31
inst : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst5~clkctrl_outclk\,
	d => \inst8|5~1_combout\,
	clrn => \RST1~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst~q\);

ww_T1 <= \T1~output_o\;

ww_T4 <= \T4~output_o\;

ww_T2 <= \T2~output_o\;

ww_T3 <= \T3~output_o\;
END structure;


