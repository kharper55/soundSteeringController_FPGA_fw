--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Sun Apr 21 22:09:27 2024
--Host        : kharp running 64-bit major release  (build 9200)
--Command     : generate_target msys_wrapper.bd
--Design      : msys_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity msys_wrapper is
  port (
    cs : out STD_LOGIC;
    esp32_miso : out STD_LOGIC;
    esp32_mosi : in STD_LOGIC;
    esp32_sck : in STD_LOGIC;
    esp32_ss : in STD_LOGIC;
    ext_rst_esp : in STD_LOGIC;
    extra_io : out STD_LOGIC_VECTOR ( 2 downto 0 );
    heartbeat_led : out STD_LOGIC;
    i2s_scl : in STD_LOGIC;
    i2s_sda : in STD_LOGIC;
    i2s_ws : in STD_LOGIC;
    iic_main_scl_io : inout STD_LOGIC;
    iic_main_sda_io : inout STD_LOGIC;
    pwm_buff_en : out STD_LOGIC;
    pwm_fan : out STD_LOGIC;
    pwm_out : out STD_LOGIC_VECTOR ( 1 to 64 );
    reset : in STD_LOGIC;
    scl : out STD_LOGIC;
    sdi : out STD_LOGIC;
    sdoa : in STD_LOGIC;
    sdob : in STD_LOGIC;
    spi_flash_io0_io : inout STD_LOGIC;
    spi_flash_io1_io : inout STD_LOGIC;
    spi_flash_io2_io : inout STD_LOGIC;
    spi_flash_io3_io : inout STD_LOGIC;
    spi_flash_ss_io : inout STD_LOGIC;
    sys_clock : in STD_LOGIC;
    tx_active_led : out STD_LOGIC;
    uart_rxd : in STD_LOGIC;
    uart_txd : out STD_LOGIC
  );
end msys_wrapper;

architecture STRUCTURE of msys_wrapper is
  component msys is
  port (
    iic_main_scl_i : in STD_LOGIC;
    iic_main_scl_o : out STD_LOGIC;
    iic_main_scl_t : out STD_LOGIC;
    iic_main_sda_i : in STD_LOGIC;
    iic_main_sda_o : out STD_LOGIC;
    iic_main_sda_t : out STD_LOGIC;
    spi_flash_io0_i : in STD_LOGIC;
    spi_flash_io0_o : out STD_LOGIC;
    spi_flash_io0_t : out STD_LOGIC;
    spi_flash_io1_i : in STD_LOGIC;
    spi_flash_io1_o : out STD_LOGIC;
    spi_flash_io1_t : out STD_LOGIC;
    spi_flash_io2_i : in STD_LOGIC;
    spi_flash_io2_o : out STD_LOGIC;
    spi_flash_io2_t : out STD_LOGIC;
    spi_flash_io3_i : in STD_LOGIC;
    spi_flash_io3_o : out STD_LOGIC;
    spi_flash_io3_t : out STD_LOGIC;
    spi_flash_ss_i : in STD_LOGIC;
    spi_flash_ss_o : out STD_LOGIC;
    spi_flash_ss_t : out STD_LOGIC;
    uart_rxd : in STD_LOGIC;
    uart_txd : out STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    sdoa : in STD_LOGIC;
    sdob : in STD_LOGIC;
    cs : out STD_LOGIC;
    scl : out STD_LOGIC;
    sdi : out STD_LOGIC;
    tx_active_led : out STD_LOGIC;
    i2s_ws : in STD_LOGIC;
    i2s_sda : in STD_LOGIC;
    i2s_scl : in STD_LOGIC;
    esp32_mosi : in STD_LOGIC;
    esp32_miso : out STD_LOGIC;
    esp32_sck : in STD_LOGIC;
    esp32_ss : in STD_LOGIC;
    pwm_out : out STD_LOGIC_VECTOR ( 1 to 64 );
    pwm_buff_en : out STD_LOGIC;
    heartbeat_led : out STD_LOGIC;
    ext_rst_esp : in STD_LOGIC;
    pwm_fan : out STD_LOGIC;
    extra_io : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component msys;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal iic_main_scl_i : STD_LOGIC;
  signal iic_main_scl_o : STD_LOGIC;
  signal iic_main_scl_t : STD_LOGIC;
  signal iic_main_sda_i : STD_LOGIC;
  signal iic_main_sda_o : STD_LOGIC;
  signal iic_main_sda_t : STD_LOGIC;
  signal spi_flash_io0_i : STD_LOGIC;
  signal spi_flash_io0_o : STD_LOGIC;
  signal spi_flash_io0_t : STD_LOGIC;
  signal spi_flash_io1_i : STD_LOGIC;
  signal spi_flash_io1_o : STD_LOGIC;
  signal spi_flash_io1_t : STD_LOGIC;
  signal spi_flash_io2_i : STD_LOGIC;
  signal spi_flash_io2_o : STD_LOGIC;
  signal spi_flash_io2_t : STD_LOGIC;
  signal spi_flash_io3_i : STD_LOGIC;
  signal spi_flash_io3_o : STD_LOGIC;
  signal spi_flash_io3_t : STD_LOGIC;
  signal spi_flash_ss_i : STD_LOGIC;
  signal spi_flash_ss_o : STD_LOGIC;
  signal spi_flash_ss_t : STD_LOGIC;
begin
iic_main_scl_iobuf: component IOBUF
     port map (
      I => iic_main_scl_o,
      IO => iic_main_scl_io,
      O => iic_main_scl_i,
      T => iic_main_scl_t
    );
iic_main_sda_iobuf: component IOBUF
     port map (
      I => iic_main_sda_o,
      IO => iic_main_sda_io,
      O => iic_main_sda_i,
      T => iic_main_sda_t
    );
msys_i: component msys
     port map (
      cs => cs,
      esp32_miso => esp32_miso,
      esp32_mosi => esp32_mosi,
      esp32_sck => esp32_sck,
      esp32_ss => esp32_ss,
      ext_rst_esp => ext_rst_esp,
      extra_io(2 downto 0) => extra_io(2 downto 0),
      heartbeat_led => heartbeat_led,
      i2s_scl => i2s_scl,
      i2s_sda => i2s_sda,
      i2s_ws => i2s_ws,
      iic_main_scl_i => iic_main_scl_i,
      iic_main_scl_o => iic_main_scl_o,
      iic_main_scl_t => iic_main_scl_t,
      iic_main_sda_i => iic_main_sda_i,
      iic_main_sda_o => iic_main_sda_o,
      iic_main_sda_t => iic_main_sda_t,
      pwm_buff_en => pwm_buff_en,
      pwm_fan => pwm_fan,
      pwm_out(1 to 64) => pwm_out(1 to 64),
      reset => reset,
      scl => scl,
      sdi => sdi,
      sdoa => sdoa,
      sdob => sdob,
      spi_flash_io0_i => spi_flash_io0_i,
      spi_flash_io0_o => spi_flash_io0_o,
      spi_flash_io0_t => spi_flash_io0_t,
      spi_flash_io1_i => spi_flash_io1_i,
      spi_flash_io1_o => spi_flash_io1_o,
      spi_flash_io1_t => spi_flash_io1_t,
      spi_flash_io2_i => spi_flash_io2_i,
      spi_flash_io2_o => spi_flash_io2_o,
      spi_flash_io2_t => spi_flash_io2_t,
      spi_flash_io3_i => spi_flash_io3_i,
      spi_flash_io3_o => spi_flash_io3_o,
      spi_flash_io3_t => spi_flash_io3_t,
      spi_flash_ss_i => spi_flash_ss_i,
      spi_flash_ss_o => spi_flash_ss_o,
      spi_flash_ss_t => spi_flash_ss_t,
      sys_clock => sys_clock,
      tx_active_led => tx_active_led,
      uart_rxd => uart_rxd,
      uart_txd => uart_txd
    );
spi_flash_io0_iobuf: component IOBUF
     port map (
      I => spi_flash_io0_o,
      IO => spi_flash_io0_io,
      O => spi_flash_io0_i,
      T => spi_flash_io0_t
    );
spi_flash_io1_iobuf: component IOBUF
     port map (
      I => spi_flash_io1_o,
      IO => spi_flash_io1_io,
      O => spi_flash_io1_i,
      T => spi_flash_io1_t
    );
spi_flash_io2_iobuf: component IOBUF
     port map (
      I => spi_flash_io2_o,
      IO => spi_flash_io2_io,
      O => spi_flash_io2_i,
      T => spi_flash_io2_t
    );
spi_flash_io3_iobuf: component IOBUF
     port map (
      I => spi_flash_io3_o,
      IO => spi_flash_io3_io,
      O => spi_flash_io3_i,
      T => spi_flash_io3_t
    );
spi_flash_ss_iobuf: component IOBUF
     port map (
      I => spi_flash_ss_o,
      IO => spi_flash_ss_io,
      O => spi_flash_ss_i,
      T => spi_flash_ss_t
    );
end STRUCTURE;
