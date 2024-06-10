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

-- DATE "11/14/2023 09:48:08"

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

ENTITY 	uA_reg IS
    PORT (
	q : OUT std_logic_vector(6 DOWNTO 1);
	S : IN std_logic_vector(6 DOWNTO 1);
	CLR : IN std_logic;
	d : IN std_logic_vector(6 DOWNTO 1);
	clk : IN std_logic
	);
END uA_reg;

-- Design Ports Information
-- q[6]	=>  Location: PIN_73,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[5]	=>  Location: PIN_76,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[4]	=>  Location: PIN_71,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[3]	=>  Location: PIN_72,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[2]	=>  Location: PIN_68,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[1]	=>  Location: PIN_69,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[6]	=>  Location: PIN_83,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLR	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[5]	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[4]	=>  Location: PIN_74,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[3]	=>  Location: PIN_70,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[2]	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[1]	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[6]	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[5]	=>  Location: PIN_67,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[4]	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[3]	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[2]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[1]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF uA_reg IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_q : std_logic_vector(6 DOWNTO 1);
SIGNAL ww_S : std_logic_vector(6 DOWNTO 1);
SIGNAL ww_CLR : std_logic;
SIGNAL ww_d : std_logic_vector(6 DOWNTO 1);
SIGNAL ww_clk : std_logic;
SIGNAL \q[6]~output_o\ : std_logic;
SIGNAL \q[5]~output_o\ : std_logic;
SIGNAL \q[4]~output_o\ : std_logic;
SIGNAL \q[3]~output_o\ : std_logic;
SIGNAL \q[2]~output_o\ : std_logic;
SIGNAL \q[1]~output_o\ : std_logic;
SIGNAL \S[6]~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \CLR~input_o\ : std_logic;
SIGNAL \inst3~1_combout\ : std_logic;
SIGNAL \d[6]~input_o\ : std_logic;
SIGNAL \inst3~3_combout\ : std_logic;
SIGNAL \inst3~0_combout\ : std_logic;
SIGNAL \inst3~_emulated_q\ : std_logic;
SIGNAL \inst3~2_combout\ : std_logic;
SIGNAL \S[5]~input_o\ : std_logic;
SIGNAL \inst4~1_combout\ : std_logic;
SIGNAL \d[5]~input_o\ : std_logic;
SIGNAL \inst4~3_combout\ : std_logic;
SIGNAL \inst4~0_combout\ : std_logic;
SIGNAL \inst4~_emulated_q\ : std_logic;
SIGNAL \inst4~2_combout\ : std_logic;
SIGNAL \S[4]~input_o\ : std_logic;
SIGNAL \inst5~1_combout\ : std_logic;
SIGNAL \d[4]~input_o\ : std_logic;
SIGNAL \inst5~3_combout\ : std_logic;
SIGNAL \inst5~0_combout\ : std_logic;
SIGNAL \inst5~_emulated_q\ : std_logic;
SIGNAL \inst5~2_combout\ : std_logic;
SIGNAL \S[3]~input_o\ : std_logic;
SIGNAL \inst2~1_combout\ : std_logic;
SIGNAL \d[3]~input_o\ : std_logic;
SIGNAL \inst2~3_combout\ : std_logic;
SIGNAL \inst2~0_combout\ : std_logic;
SIGNAL \inst2~_emulated_q\ : std_logic;
SIGNAL \inst2~2_combout\ : std_logic;
SIGNAL \S[2]~input_o\ : std_logic;
SIGNAL \inst1~1_combout\ : std_logic;
SIGNAL \d[2]~input_o\ : std_logic;
SIGNAL \inst1~3_combout\ : std_logic;
SIGNAL \inst1~0_combout\ : std_logic;
SIGNAL \inst1~_emulated_q\ : std_logic;
SIGNAL \inst1~2_combout\ : std_logic;
SIGNAL \S[1]~input_o\ : std_logic;
SIGNAL \inst~1_combout\ : std_logic;
SIGNAL \d[1]~input_o\ : std_logic;
SIGNAL \inst~3_combout\ : std_logic;
SIGNAL \inst~0_combout\ : std_logic;
SIGNAL \inst~_emulated_q\ : std_logic;
SIGNAL \inst~2_combout\ : std_logic;
SIGNAL \ALT_INV_inst~0_combout\ : std_logic;
SIGNAL \ALT_INV_inst1~0_combout\ : std_logic;
SIGNAL \ALT_INV_inst2~0_combout\ : std_logic;
SIGNAL \ALT_INV_inst5~0_combout\ : std_logic;
SIGNAL \ALT_INV_inst4~0_combout\ : std_logic;
SIGNAL \ALT_INV_inst3~0_combout\ : std_logic;

BEGIN

q <= ww_q;
ww_S <= S;
ww_CLR <= CLR;
ww_d <= d;
ww_clk <= clk;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_inst~0_combout\ <= NOT \inst~0_combout\;
\ALT_INV_inst1~0_combout\ <= NOT \inst1~0_combout\;
\ALT_INV_inst2~0_combout\ <= NOT \inst2~0_combout\;
\ALT_INV_inst5~0_combout\ <= NOT \inst5~0_combout\;
\ALT_INV_inst4~0_combout\ <= NOT \inst4~0_combout\;
\ALT_INV_inst3~0_combout\ <= NOT \inst3~0_combout\;

-- Location: IOOBUF_X34_Y2_N23
\q[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3~2_combout\,
	devoe => ww_devoe,
	o => \q[6]~output_o\);

-- Location: IOOBUF_X34_Y4_N23
\q[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4~2_combout\,
	devoe => ww_devoe,
	o => \q[5]~output_o\);

-- Location: IOOBUF_X32_Y0_N16
\q[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5~2_combout\,
	devoe => ww_devoe,
	o => \q[4]~output_o\);

-- Location: IOOBUF_X32_Y0_N9
\q[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2~2_combout\,
	devoe => ww_devoe,
	o => \q[3]~output_o\);

-- Location: IOOBUF_X30_Y0_N9
\q[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1~2_combout\,
	devoe => ww_devoe,
	o => \q[2]~output_o\);

-- Location: IOOBUF_X30_Y0_N2
\q[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst~2_combout\,
	devoe => ww_devoe,
	o => \q[1]~output_o\);

-- Location: IOIBUF_X34_Y9_N22
\S[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S(6),
	o => \S[6]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X21_Y0_N8
\CLR~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLR,
	o => \CLR~input_o\);

-- Location: LCCOMB_X19_Y1_N30
\inst3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3~1_combout\ = (!\CLR~input_o\ & ((\inst3~1_combout\) # (!\S[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CLR~input_o\,
	datac => \inst3~1_combout\,
	datad => \S[6]~input_o\,
	combout => \inst3~1_combout\);

-- Location: IOIBUF_X34_Y3_N22
\d[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(6),
	o => \d[6]~input_o\);

-- Location: LCCOMB_X19_Y1_N8
\inst3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3~3_combout\ = \inst3~1_combout\ $ (\d[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3~1_combout\,
	datac => \d[6]~input_o\,
	combout => \inst3~3_combout\);

-- Location: LCCOMB_X19_Y1_N22
\inst3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3~0_combout\ = (\CLR~input_o\) # (!\S[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CLR~input_o\,
	datad => \S[6]~input_o\,
	combout => \inst3~0_combout\);

-- Location: FF_X19_Y1_N9
\inst3~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \inst3~3_combout\,
	clrn => \ALT_INV_inst3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3~_emulated_q\);

-- Location: LCCOMB_X19_Y1_N18
\inst3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3~2_combout\ = (!\CLR~input_o\ & ((\inst3~_emulated_q\ $ (\inst3~1_combout\)) # (!\S[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S[6]~input_o\,
	datab => \inst3~_emulated_q\,
	datac => \inst3~1_combout\,
	datad => \CLR~input_o\,
	combout => \inst3~2_combout\);

-- Location: IOIBUF_X34_Y4_N15
\S[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S(5),
	o => \S[5]~input_o\);

-- Location: LCCOMB_X19_Y1_N16
\inst4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~1_combout\ = (!\CLR~input_o\ & ((\inst4~1_combout\) # (!\S[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S[5]~input_o\,
	datab => \CLR~input_o\,
	datad => \inst4~1_combout\,
	combout => \inst4~1_combout\);

-- Location: IOIBUF_X30_Y0_N22
\d[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(5),
	o => \d[5]~input_o\);

-- Location: LCCOMB_X24_Y1_N8
\inst4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~3_combout\ = \inst4~1_combout\ $ (\d[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst4~1_combout\,
	datad => \d[5]~input_o\,
	combout => \inst4~3_combout\);

-- Location: LCCOMB_X19_Y1_N24
\inst4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~0_combout\ = (\CLR~input_o\) # (!\S[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CLR~input_o\,
	datad => \S[5]~input_o\,
	combout => \inst4~0_combout\);

-- Location: FF_X24_Y1_N9
\inst4~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \inst4~3_combout\,
	clrn => \ALT_INV_inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4~_emulated_q\);

-- Location: LCCOMB_X19_Y1_N28
\inst4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~2_combout\ = (!\CLR~input_o\ & ((\inst4~_emulated_q\ $ (\inst4~1_combout\)) # (!\S[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S[5]~input_o\,
	datab => \CLR~input_o\,
	datac => \inst4~_emulated_q\,
	datad => \inst4~1_combout\,
	combout => \inst4~2_combout\);

-- Location: IOIBUF_X34_Y2_N15
\S[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S(4),
	o => \S[4]~input_o\);

-- Location: LCCOMB_X19_Y1_N10
\inst5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5~1_combout\ = (!\CLR~input_o\ & ((\inst5~1_combout\) # (!\S[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CLR~input_o\,
	datac => \S[4]~input_o\,
	datad => \inst5~1_combout\,
	combout => \inst5~1_combout\);

-- Location: IOIBUF_X28_Y0_N1
\d[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(4),
	o => \d[4]~input_o\);

-- Location: LCCOMB_X19_Y2_N24
\inst5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5~3_combout\ = \inst5~1_combout\ $ (\d[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst5~1_combout\,
	datad => \d[4]~input_o\,
	combout => \inst5~3_combout\);

-- Location: LCCOMB_X24_Y1_N14
\inst5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5~0_combout\ = (\CLR~input_o\) # (!\S[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S[4]~input_o\,
	datac => \CLR~input_o\,
	combout => \inst5~0_combout\);

-- Location: FF_X19_Y2_N25
\inst5~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \inst5~3_combout\,
	clrn => \ALT_INV_inst5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5~_emulated_q\);

-- Location: LCCOMB_X19_Y1_N14
\inst5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5~2_combout\ = (!\CLR~input_o\ & ((\inst5~1_combout\ $ (\inst5~_emulated_q\)) # (!\S[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5~1_combout\,
	datab => \inst5~_emulated_q\,
	datac => \S[4]~input_o\,
	datad => \CLR~input_o\,
	combout => \inst5~2_combout\);

-- Location: IOIBUF_X32_Y0_N22
\S[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S(3),
	o => \S[3]~input_o\);

-- Location: LCCOMB_X19_Y1_N12
\inst2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2~1_combout\ = (!\CLR~input_o\ & ((\inst2~1_combout\) # (!\S[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CLR~input_o\,
	datac => \S[3]~input_o\,
	datad => \inst2~1_combout\,
	combout => \inst2~1_combout\);

-- Location: IOIBUF_X25_Y0_N1
\d[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(3),
	o => \d[3]~input_o\);

-- Location: LCCOMB_X19_Y2_N10
\inst2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2~3_combout\ = \inst2~1_combout\ $ (\d[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2~1_combout\,
	datad => \d[3]~input_o\,
	combout => \inst2~3_combout\);

-- Location: LCCOMB_X19_Y1_N2
\inst2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2~0_combout\ = (\CLR~input_o\) # (!\S[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \S[3]~input_o\,
	datad => \CLR~input_o\,
	combout => \inst2~0_combout\);

-- Location: FF_X19_Y2_N11
\inst2~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \inst2~3_combout\,
	clrn => \ALT_INV_inst2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2~_emulated_q\);

-- Location: LCCOMB_X19_Y1_N0
\inst2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2~2_combout\ = (!\CLR~input_o\ & ((\inst2~1_combout\ $ (\inst2~_emulated_q\)) # (!\S[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2~1_combout\,
	datab => \inst2~_emulated_q\,
	datac => \S[3]~input_o\,
	datad => \CLR~input_o\,
	combout => \inst2~2_combout\);

-- Location: IOIBUF_X28_Y0_N22
\S[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S(2),
	o => \S[2]~input_o\);

-- Location: LCCOMB_X19_Y1_N6
\inst1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1~1_combout\ = (!\CLR~input_o\ & ((\inst1~1_combout\) # (!\S[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CLR~input_o\,
	datac => \S[2]~input_o\,
	datad => \inst1~1_combout\,
	combout => \inst1~1_combout\);

-- Location: IOIBUF_X18_Y0_N15
\d[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(2),
	o => \d[2]~input_o\);

-- Location: LCCOMB_X19_Y1_N26
\inst1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1~3_combout\ = \inst1~1_combout\ $ (\d[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1~1_combout\,
	datac => \d[2]~input_o\,
	combout => \inst1~3_combout\);

-- Location: LCCOMB_X19_Y1_N20
\inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1~0_combout\ = (\CLR~input_o\) # (!\S[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CLR~input_o\,
	datac => \S[2]~input_o\,
	combout => \inst1~0_combout\);

-- Location: FF_X19_Y1_N27
\inst1~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \inst1~3_combout\,
	clrn => \ALT_INV_inst1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1~_emulated_q\);

-- Location: LCCOMB_X19_Y1_N4
\inst1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1~2_combout\ = (!\CLR~input_o\ & ((\inst1~_emulated_q\ $ (\inst1~1_combout\)) # (!\S[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1~_emulated_q\,
	datab => \CLR~input_o\,
	datac => \S[2]~input_o\,
	datad => \inst1~1_combout\,
	combout => \inst1~2_combout\);

-- Location: IOIBUF_X23_Y0_N8
\S[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S(1),
	o => \S[1]~input_o\);

-- Location: LCCOMB_X24_Y1_N10
\inst~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst~1_combout\ = (!\CLR~input_o\ & ((\inst~1_combout\) # (!\S[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \S[1]~input_o\,
	datac => \CLR~input_o\,
	datad => \inst~1_combout\,
	combout => \inst~1_combout\);

-- Location: IOIBUF_X16_Y0_N8
\d[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(1),
	o => \d[1]~input_o\);

-- Location: LCCOMB_X24_Y1_N2
\inst~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst~3_combout\ = \inst~1_combout\ $ (\d[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst~1_combout\,
	datad => \d[1]~input_o\,
	combout => \inst~3_combout\);

-- Location: LCCOMB_X24_Y1_N0
\inst~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst~0_combout\ = (\CLR~input_o\) # (!\S[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \S[1]~input_o\,
	datac => \CLR~input_o\,
	combout => \inst~0_combout\);

-- Location: FF_X24_Y1_N3
\inst~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \inst~3_combout\,
	clrn => \ALT_INV_inst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst~_emulated_q\);

-- Location: LCCOMB_X24_Y1_N28
\inst~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst~2_combout\ = (!\CLR~input_o\ & ((\inst~1_combout\ $ (\inst~_emulated_q\)) # (!\S[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst~1_combout\,
	datab => \S[1]~input_o\,
	datac => \CLR~input_o\,
	datad => \inst~_emulated_q\,
	combout => \inst~2_combout\);

ww_q(6) <= \q[6]~output_o\;

ww_q(5) <= \q[5]~output_o\;

ww_q(4) <= \q[4]~output_o\;

ww_q(3) <= \q[3]~output_o\;

ww_q(2) <= \q[2]~output_o\;

ww_q(1) <= \q[1]~output_o\;
END structure;


