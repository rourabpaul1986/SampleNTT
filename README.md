# SampleNTT
This project implemennts hardware of SampleNTT used in kyber and Parse SPDM3 algorithm and our modified SampleNTT
The directory maps are shown below

|Folder name | Remarks|
-----------------------
|Statistical_Tests| This file comntains two files rejection_rate_analysis_mask_4095.py and statistical_analysis_mask_4095.py. Both these files are used for statistical test of our modified SampleNTT and conventional sampleNTT and SPDM3|
-----------------------------------



```
constant n  : integer := 16;
constant q  : integer := 3329;
constant r  : integer := 512; --number of bytes from shake128
--constant r  : integer := 1024; --number of bytes from shake128
constant logr : positive := positive(ceil(log2(real(r))));
constant mask : integer := 4095; 
constant logn : positive := positive(ceil(log2(real(n))));
constant lognby2 : positive := positive(ceil(log2(real(n/2))));
constant logq : positive := positive(ceil(log2(real(q))));

```

