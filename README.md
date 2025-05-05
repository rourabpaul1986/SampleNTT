# SampleNTT
This project implemennts hardware of SampleNTT used in kyber and Parse SPDM3 algorithm and our modified SampleNTT
The directory maps are shown below

|Folder name | Remarks|
|----------|-------------|
| Statistical_Tests | This folder contains two Python files: `rejection_rate_analysis_mask_4095.py` and `statistical_analysis_mask_4095.py`. Both files are used for the statistical analysis of our Modified SampleNTT, the conventional SampleNTT, and SPDM3. |
| sampleNTT.srcs | This folder contains the VHDL files for the Modified SampleNTT, the conventional SampleNTT, and SPDM3. |
| SampleNTT/sampleNTT.srcs/sources_1/new/ntt_sampler_modified_top.vhd | Our proposed Modified SampleNTT. |
| SampleNTT/sampleNTT.srcs/sources_1/new/ntt_sampler_top.vhd | Conventional SampleNTT as used in Kyber ([FIPS 202](https://nvlpubs.nist.gov/nistpubs/fips/nist.fips.202.pdf)). |
| SampleNTT/sampleNTT.srcs/sources_1/new/spdm3.vhd | [SPDM3 implementation](https://ieeexplore.ieee.org/document/10379070). |



Kyber Paremeters Taken for the sampleNTTs
```
n  = 256;
q  = 3329;
r  = 512; --number of bytes from shake128

```

