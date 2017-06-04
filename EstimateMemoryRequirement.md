# Dataset memory requirement estimation

2075259 rows * 9 columns * 8 Bytes / 2^20 = 142.5 MB

Some overhead should be expected, and some of the entries may require more than 8 bytes, but it's a decent estimate.

Even if we use a factor of three for the memory requirement all modern computers should have plenty available memory to load the complete dataset.
