# SampleNTT
This project implemennts hardware of SampleNTT used in kyber and Parse SPDM3 algorithm and our modified SampleNTT
The directory maps are shown below

|Folder name | Remarks|
|----------|-------------|
|Statistical_Tests| This file comntains two files rejection_rate_analysis_mask_4095.py and statistical_analysis_mask_4095.py. Both these files are used for statistical test of our modified SampleNTT and conventional sampleNTT and SPDM3|
 | sampleNTT.srcs|This file comntains vhdl files of  modified SampleNTT and conventional sampleNTT and SPDM3|
 |SampleNTT/sampleNTT.srcs/sources_1/new/ntt_sampler_modfied_top.vhd|Our proposed modified sampleNTT|
 |SampleNTT/sampleNTT.srcs/sources_1/new/ntt_sampler_top.vhd|Conventional sampleNTT used in Kyber|
  |SampleNTT/sampleNTT.srcs/sources_1/new/spdm3.vhd|[SPDM3](https://ieeexplore.ieee.org/document/10379070)|


Kyber Paremeters Taken for the sampleNTTs
```
n  = 256;
q  = 3329;
r  = 512; --number of bytes from shake128

```

