----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2025 06:49:49 PM
-- Design Name: 
-- Module Name: rej_block - Behavioral
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

entity d1d2_gen is
    generic (
        q : integer := 3229;      
        mask : integer := 4095    
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           first_byte : in STD_LOGIC_VECTOR (7 downto 0);
           second_byte : in STD_LOGIC_VECTOR (7 downto 0);
           co_effcient : out STD_LOGIC_VECTOR (12 downto 0);
           valid : out STD_LOGIC
           );
end d1d2_gen;

architecture d1d2_gen_arch of d1d2_gen is
type state_type is (D1_Reject, D2_Reject);
signal state : state_type;
signal co_effcient_sig : STD_LOGIC_VECTOR (31 downto 0);
signal valid_d1d2 :  STD_LOGIC:='0';
signal a : STD_LOGIC_VECTOR (7 downto 0);
signal b : STD_LOGIC_VECTOR (7 downto 0);
signal c : STD_LOGIC_VECTOR (12 downto 0);
signal rst_dsp_mul : STD_LOGIC;

begin
rst_dsp_mul<=not en;

     dsp_mul_DUT: entity work.dsp_mul
            generic map (
            q => q,
            mask => mask
        )
        port map (
        rst=>rst_dsp_mul,
        a   =>a,
        b   =>b,
        c   =>c
        ); 

    process(clk)
        variable addr_int : integer;
    begin
      
         if rst='1' then
           co_effcient_sig<=(others => '0');
  
         elsif en='1' then
            if rising_edge(clk) then
              state<=D1_Reject;
               case state is
                 when D1_Reject =>  
                   state<=D2_Reject;      

                      --co_effcient_sig<="00000"&first_byte;
                      --co_effcient_sig<=std_logic_vector(unsigned((("00000000" & first_byte) or (second_byte & "00000000")) and std_logic_vector(to_unsigned(mask, 16))) * to_unsigned(q,16));
                     a<=first_byte;
                     b<=second_byte;
                      valid_d1d2<='1';
                 when D2_Reject => 
                    state<=D1_Reject;
                    --co_effcient_sig<="00000"&second_byte;
                    --co_effcient_sig<=std_logic_vector(unsigned((("00000000" & second_byte) or (first_byte & "00000000")) and std_logic_vector(to_unsigned(mask, 16))) * to_unsigned(q,16));
                     b<=first_byte;
                     a<=second_byte;
                  end case;
             end if;
         end if;
    end process;
valid<=valid_d1d2;
--co_effcient<=co_effcient_sig(12 downto 0);
co_effcient<=c;

end d1d2_gen_arch;
