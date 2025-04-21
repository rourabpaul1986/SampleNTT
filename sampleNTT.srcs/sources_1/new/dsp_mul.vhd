----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2025 09:47:27 AM
-- Design Name: 
-- Module Name: dsp_mul - dsp_mul
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

entity dsp_mul is
    generic (
        q : integer := 3229;      
        mask : integer := 4095    
    );
    Port ( rst : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           c : out STD_LOGIC_VECTOR (12 downto 0));
end dsp_mul;

architecture dsp_mul_arch of dsp_mul is
signal co_effcient_sig : STD_LOGIC_VECTOR (31 downto 0);

begin

co_effcient_sig<=std_logic_vector(unsigned((("00000000" & a) or (b & "00000000")) and std_logic_vector(to_unsigned(mask, 16))) * to_unsigned(q,16)) when rst='0' else    
                 (others=>'0') ;
              
c<=co_effcient_sig(12 downto 0) when rst='0' else
                 (others=>'0');

end dsp_mul_arch;
