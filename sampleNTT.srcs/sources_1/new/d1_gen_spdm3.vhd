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


entity d1_gen_spdm3 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           first_byte : in STD_LOGIC_VECTOR (7 downto 0);
           second_byte : in STD_LOGIC_VECTOR (7 downto 0);
           d1 : out STD_LOGIC_VECTOR (logq-1 downto 0));
end d1_gen_spdm3;

architecture d1_gen_spdm3_arch of d1_gen_spdm3 is
signal d1_sig :  STD_LOGIC_VECTOR (11 downto 0):=(others=>'0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
          if rst='1' then
            d1_sig<= (others => '0');
          elsif en='1' then
            d1_sig <= std_logic_vector(
             (unsigned(first_byte & "0000") + unsigned("00000000" & second_byte(7 downto 4)))
             );

          end if;
        end if;
   end process;
d1<=d1_sig;
end d1_gen_spdm3_arch;
