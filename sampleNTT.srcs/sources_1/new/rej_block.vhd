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

entity rej_block is
    generic (
        q : integer := 3329  
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           d1 : in STD_LOGIC_VECTOR (11 downto 0);
           d2 : in STD_LOGIC_VECTOR (11 downto 0);
           co_effcient : out STD_LOGIC_VECTOR (11 downto 0);
           valid : out STD_LOGIC
           );
end rej_block;

architecture Behavioral of rej_block is
type state_type is (D1_Reject, D2_Reject);
signal state : state_type;
signal co_effcient_sig : STD_LOGIC_VECTOR (11 downto 0);
signal valid_d1, valid_d2 :  STD_LOGIC:='0';
begin

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
                   if to_integer(unsigned(d1)) < q then
                      co_effcient_sig<=d1;
                       valid_d1<='1';
                   else
                        valid_d1<='0';
                   end if;
         
                 when D2_Reject => 
                    state<=D1_Reject;
                    if to_integer(unsigned(d2)) < q then
                        co_effcient_sig<=d2;
                        valid_d2<='1';
                    else
                        valid_d2<='0';
                    end if;
                  end case;
             end if;
         end if;
    end process;
valid<=valid_d2 or valid_d1;
co_effcient<=co_effcient_sig;
end Behavioral;
