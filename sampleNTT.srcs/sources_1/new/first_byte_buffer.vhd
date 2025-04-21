----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2025 05:25:06 PM
-- Design Name: 
-- Module Name: first_byte_buffer - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity byte_buffer is
    Port ( 
           clk  : in  std_logic;
           rst  : in  std_logic;
           en : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (7 downto 0);
           dout : out STD_LOGIC_VECTOR (7 downto 0));
end byte_buffer;

architecture Behavioral of byte_buffer is

begin

    process(clk)
        
    begin
        if rising_edge(clk) then
         if rst='1' then
            dout  <= (others => '0');
         elsif en='1' then
           dout<=din;
         end if;
        end if;    
    end process;
 
end Behavioral;
