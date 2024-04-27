function [result] = Oversampling(bits,n)
result=zeros(1,length(bits)*n);
j=1;
for i=1:3:3*length(bits)
    result(i)=bits(j);
    j=j+1;
end

