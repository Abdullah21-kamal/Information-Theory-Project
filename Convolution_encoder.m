function [output_code] = Convolution_encoder(entered_bits,generator_polynomial1,generator_polynomial2,generator_polynomial3,size_of_bits)
length_g1=length(generator_polynomial1);
length_g2=length(generator_polynomial2);
length_g3=length(generator_polynomial3);
% it is required to set constraint length K = 3
K=3; 
% to check if we still have bits in the stream of entered bits
if(size_of_bits<=length(entered_bits))
    ZerosAdded=mod(length(entered_bits),size_of_bits);
    entered_bits=[entered_bits zeros(1,ZerosAdded)];
    for i=1:length(entered_bits)/size_of_bits
        if(length_g1==length_g2 && length_g2==length_g3) 
            % to enssure that generator polynomials result in the
            % constraint length specified
            
            %finding outputs based on contributes of each input and
            %oversampling it by K=3
            stream=entered_bits((i-1)*size_of_bits+1:i*size_of_bits);
            element=Oversampling(conv(stream,generator_polynomial1),K);
            element1=Oversampling(conv(stream,generator_polynomial2),K);% conv is used to multiply polynomials 
            element2=Oversampling(conv(stream,generator_polynomial3),K);
            L=length(element);
            % shiftting the 2nd output by 1 to rearrange the decoded stream
            element1=[element1(L) element1(1:L-1)];

            % shiftting the 3rd output by 2 to rearrange the decoded stream
            element2=[element2(L:-1:L-1) element2(1:L-2)];
            
            % concatenate elements to form the final codeword 
            output_code((i-1)*L+1:i*L)=element+element1+element2;
        end
    end
    output_code(output_code==2)=0;
end
end

