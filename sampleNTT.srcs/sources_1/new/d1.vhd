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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity d1_block is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           first_byte : in STD_LOGIC_VECTOR (7 downto 0);
           second_byte : in STD_LOGIC_VECTOR (7 downto 0);
           d1 : out STD_LOGIC_VECTOR (11 downto 0));
end d1_block;

architecture d1_arch of d1_block is
signal d1_sig :  STD_LOGIC_VECTOR (11 downto 0):=(others=>'0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
          if rst='1' then
            d1_sig<= (others => '0');
          elsif en='1' then
            d1_sig<=std_logic_vector(unsigned( second_byte(3 downto 0)& "00000000") + unsigned("0000" & first_byte));
          end if;
        end if;
   end process;
d1<=d1_sig;
end d1_arch;
