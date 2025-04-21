library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.math_real.all;

package variant_pkg is

constant n  : integer := 16;
constant q  : integer := 3329;
constant r  : integer := 512; --number of bytes from shake128
--constant r  : integer := 1024; --number of bytes from shake128
constant logr : positive := positive(ceil(log2(real(r))));
constant mask : integer := 4095; 
constant logn : positive := positive(ceil(log2(real(n))));
constant lognby2 : positive := positive(ceil(log2(real(n/2))));
constant logq : positive := positive(ceil(log2(real(q))));

end variant_pkg;
