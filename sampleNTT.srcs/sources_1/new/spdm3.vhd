----------------------------------------------------------------------------------
-- Company: Personal
-- Engineer: Dr. Rourab Paul
-- 
-- Create Date: 02/19/2025 06:49:49 PM
-- Design Name: 
-- Module Name: rej_block - Behavioral
-- Project Name: 
-- Target Devices: xc7a100tcsg324
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
use work.variant_pkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spdm3 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           start : in STD_LOGIC;
           co_effcient : out STD_LOGIC_VECTOR (logq-1 downto 0);
           valid : out STD_LOGIC);
end spdm3;

architecture spdm3_arch of spdm3 is
signal addr  : std_logic_vector(8 downto 0);
signal bytes : STD_LOGIC_VECTOR (7 downto 0);
signal first_byte_en, second_byte_en, third_byte_en : STD_LOGIC;
signal d1_en, d2_en, rej_en : STD_LOGIC;
--signal valid : STD_LOGIC;
signal first_byte, second_byte, third_byte : STD_LOGIC_VECTOR (7 downto 0);
signal d1, d2 : STD_LOGIC_VECTOR (logq-1 downto 0);
component SeedMem512 is
port(
 clk  : in  std_logic;
 a   : in  std_logic_vector(logr-1 downto 0);
 spo   : out std_logic_vector(7 downto 0)

);
end component;
begin
    addr_DUT: entity work.addr_gen
        port map (
        clk   =>clk,
        rst   =>rst,
        start =>start,
        addr  =>addr
        );
              
    SEED_BRAM_DUT : SeedMem512 
     port map (   
        clk   =>clk,
        a =>addr,
        spo  =>bytes
        );   
        
        
     mod_two_DUT: entity work.mod_two
        port map (
        clk   =>clk,
        rst   =>rst,
        start =>start,
        addr  =>addr,
        first_byte_en =>first_byte_en,
        second_byte_en => second_byte_en,
        d1_en => d1_en,
        d2_en => d2_en,
        rej_en=>rej_en
        );    


     first_byte_DUT: entity work.byte_buffer
        port map (
        clk   =>clk,
        rst   =>rst,
        en =>first_byte_en,
        din  =>bytes,
        dout =>first_byte
        ); 
        
       second_byte_DUT: entity work.byte_buffer
        port map (
        clk   =>clk,
        rst   =>rst,
        en =>second_byte_en,
        din  =>bytes,
        dout =>second_byte
        );      

--     third_byte_DUT: entity work.byte_buffer
--        port map (
--        clk   =>clk,
--        rst   =>rst,
--        en =>third_byte_en,
--        din  =>bytes,
--        dout =>third_byte
--        ); 
        
--       D1D2_DUT: entity work.d1d2_gen
--       generic map (
--            q => q,
--            mask => mask
--        )
--        port map (
--        clk   =>clk,
--        rst   =>rst,
--        en =>rej_en,
--        first_byte =>first_byte,
--        second_byte =>second_byte,
--        co_effcient =>co_effcient,
--        valid => valid
--        );   
  
         D1_DUT: entity work.d1_gen_spdm3
        port map (
        clk   =>clk,
        rst   =>rst,
        en =>d1_en,
        first_byte =>first_byte,
        second_byte =>second_byte,
        d1 =>d1
        );       
        
       D2_DUT: entity work.d2_gen_spdm3
        port map (
        clk   =>clk,
        rst   =>rst,
        en =>d2_en,
        first_byte =>first_byte,
        second_byte =>second_byte,
        d2 =>d2
        );  
        
                
       rejection_DUT: entity work.rej_block_modified
        port map (
        clk   =>clk,
        rst   =>rst,
        en =>rej_en,
        d1 =>d1,
        d2 =>d2,
        co_effcient=>co_effcient,
        valid=>valid
        ); 
--co_effcient<=d2 xor d1;
end spdm3_arch;
