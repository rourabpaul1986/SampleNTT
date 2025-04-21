library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.variant_pkg.all;
entity addr_gen is
    Port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        start : in  std_logic;
        addr  : out std_logic_vector(logr-1 downto 0)
    );
end addr_gen;

architecture Behavioral of addr_gen is
    signal addr_reg1 : std_logic_vector(logr-1 downto 0) := (others => '0');
    signal addr_reg2 : std_logic_vector(logr-1 downto 0) := (others => '0');
    signal th : std_logic_vector(logr-1 downto 0) := (others => '1');
begin

    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                addr_reg1 <= (others => '0');  -- Reset addr to 0 when start is low
            elsif start='1' then 
             --if addr_reg1 /= "1111111111" then  -- Stop incrementing at 511 (0x3FF)
             if addr_reg1 /= th then
                addr_reg1 <= addr_reg1 + 1;
                addr_reg2<=addr_reg1;
             end if;
            end if;
        end if;
    end process;

    addr <= addr_reg2;  -- Output the address

end Behavioral;
