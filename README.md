# Project Summary

## Phase 1: Source Coding with Huffman Encoding

In Phase 1 of the project, we focused on source coding using Huffman encoding, a widely used technique in information theory for lossless data compression. The main objectives were to analyze the source text, compute symbol probabilities, calculate entropy, design fixed-length codes, implement Huffman encoding and decoding algorithms, and evaluate the efficiency of the resulting code.

Symbol Probabilities and Entropy Calculation: We began by reading the provided text file in MATLAB and computing the approximate probabilities of 33 English characters, including lowercase letters, punctuation marks, and space. Based on these probabilities, we calculated the entropy of the source text.
Fixed-Length Code Construction: Next, we determined the number of bits/symbols required to construct a fixed-length code and assessed its efficiency.
Huffman Encoding and Decoding: We implemented the Huffman encoding and decoding algorithms in MATLAB. The Huffman encoder function converted characters from the source text into a binary stream using variable-length codes. We then decoded the binary stream back into characters, ensuring it matched the original text file.
Efficiency Evaluation: The efficiency of the Huffman code was evaluated by comparing the compressed file size with the original file size and calculating the compression ratio.
Phase 2: Channel Coding with Convolutional Coding

## Phase 2 focused on channel coding using rate 1/3 convolutional coding to mitigate errors introduced by a noisy channel. The key tasks included designing a convolutional encoder, adding AWGN noise to transmitted data, implementing a hard decision Viterbi decoder, and evaluating the Bit Error Rate (BER) performance.

1- Convolutional Encoder Design: We designed a rate 1/3 convolutional encoder with a constraint length of 𝐾 = 3, selecting appropriate generator polynomials.
2- Encoder and Decoder Implementation: Software code was developed to implement the convolutional encoder and hard decision Viterbi decoder without using built-in MATLAB functions.
3- Performance Evaluation: BER versus SNR curves were plotted to compare the performance of the communication system with and without convolutional coding. Integration of Phase 2 with Phase 1 enabled an end-to-end communication system, allowing for seamless data transmission and error correction.
4- Error Analysis: The received text files were compared with transmitted files at various SNR values, highlighting errors introduced during transmission and demonstrating the effectiveness of channel coding in error correction.
