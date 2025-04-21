library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Required for integer conversion
use work.variant_pkg.all;
entity mod_three is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           start : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (logr-1 downto 0); -- 10-bit address
           first_byte_en : out STD_LOGIC;
           second_byte_en : out STD_LOGIC;
           third_byte_en : out STD_LOGIC;
           d1_en : out STD_LOGIC;
           d2_en : out STD_LOGIC;
           rej_en :  out STD_LOGIC
           );
end mod_three;

architecture Behavioral of mod_three is
signal d1_en1, d2_en1, d1_en2, d2_en2, rej_en1 : STD_LOGIC;
begin
    process(clk)
        variable addr_int : integer;
    begin
        if rising_edge(clk) then
         if rst='1' then
            first_byte_en  <= '0';
            second_byte_en <= '0';
            third_byte_en  <= '0'; 
            d1_en1<='0';
            d2_en1<='0'; 
            rej_en1<='0';   
         elsif start='1' then
            -- Convert addr (STD_LOGIC_VECTOR) to integer
            addr_int := to_integer(unsigned(addr)) MOD 3;
            d1_en2<=d1_en1;
            d2_en2<=d2_en1;
            rej_en1<=d1_en2 or d2_en2;
            -- Assign outputs based on MOD 3 result
            case addr_int is
                when 0 =>
                    first_byte_en  <= '1';
                    second_byte_en <= '0';
                    third_byte_en  <= '0';
                    d1_en1<='0';
                    d2_en1<='0';  
                when 1 =>
                    first_byte_en  <= '0';
                    second_byte_en <= '1';
                    third_byte_en  <= '0';
                    d1_en1<='1';
                    d2_en1<='0';  
                when 2 =>
                    first_byte_en  <= '0';
                    second_byte_en <= '0';
                    third_byte_en  <= '1';
                    d1_en1<='0';
                    d2_en1<='1';  
                when others =>
                    first_byte_en  <= '0';
                    second_byte_en <= '0';
                    third_byte_en  <= '0';  
                    d1_en1<='0';
                    d2_en1<='0';  
            end case;
         end if;
        end if;
    end process;
            d1_en<=d1_en2;
            d2_en<=d2_en2;
            rej_en<=rej_en1;
end Behavioral;
