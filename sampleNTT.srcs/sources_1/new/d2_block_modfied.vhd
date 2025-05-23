----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2025 05:46:01 PM
-- Design Name: 
-- Module Name: d1_block - d1_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.variant_pkg.all;

entity d2_block_modified is
    generic (
        q : integer := 3229;      
        mask : integer := 4095    
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           first_byte : in STD_LOGIC_VECTOR (7 downto 0);
           second_byte : in STD_LOGIC_VECTOR (7 downto 0);
           d2 : out STD_LOGIC_VECTOR (logq-1 downto 0));
end d2_block_modified;

architecture d2_arch_modified of d2_block_modified is
signal d2_sig :  STD_LOGIC_VECTOR (logq+4-1  downto 0):=(others=>'0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
          if rst='1' then
            d2_sig<= (others => '0');
          elsif en='1' then
             d2_sig <= std_logic_vector(
             (unsigned("00000000" & second_byte) or unsigned(first_byte & "00000000"))
             --and to_unsigned(mask, 12)
             );

          end if;
        end if;
   end process;
d2<=d2_sig(logq-1 downto 0);
end d2_arch_modified;