library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.variant_pkg.all;

entity ntt_sampler_tb is
end ntt_sampler_tb;

architecture tb of ntt_sampler_tb is


    -- Signals
    signal clk   : STD_LOGIC := '0';
    signal rst   : STD_LOGIC := '0';
    signal start : STD_LOGIC := '0';
    signal co_effcient : STD_LOGIC_VECTOR (11 downto 0);
    signal valid  : STD_LOGIC;

    -- Clock Period (e.g., 10 ns = 100 MHz clock)
    constant CLK_PERIOD : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    --uut: entity work.ntt_sampler_top --for original kyber
    uut: entity work.ntt_sampler_modified_top --for modified kyber
        port map (
            clk   => clk,
            rst   => rst,
            start => start,
            co_effcient=>co_effcient,
            valid  => valid
        );

    -- Clock Generation
            clk_master: process
            begin            
              clk <='0';
            wait for CLK_PERIOD/2;
              clk <='1';
            wait for CLK_PERIOD/2;
          end process;

    -- Stimulus Process
    stim_process: process
    begin
        rst<='1';
        start<='0';
        wait for 20 ns;  -- Initial delay
        rst<='0';
        wait for 20 ns;  -- Initial delay
        start <= '1';  -- Activate start
        --wait for 5000 ns;   -- Wait to observe response


        wait;  -- Stop simulation
    end process;

end tb;