%c:/Users/DW/Deskykop/Abdullah Kamal Muhammad
%working on a string 'word' to complete encoding and calculations then
%merge it with the read code
% the word we need to find the entropy for: 
word = 'ABABABABABACADABACADABACADABACAD';
% we need to count the occurence of a letter in a the original word
s =[];
% we use unique function to get only the unigue letters 
s= unique(word, 'stable');
% we want to get the probability of each letter
P = [] 
for i = 1 :length(s)
    P(i) = (count(word,s(i))/ length(word));
    % probability = the number of occurence / the number of all letters
end
disp('-------------------------')
disp('the number of bits/symbols required to construct a fixed length code is');
disp(' ')
disp(ceil(log2(length(s))));
disp('-------------------------')

%avg constant length
avg_constant_length = ceil(log2(length(s)));
disp('the average code length: ')
disp(avg_constant_length)
disp('----------------------')
% compute entropy
h = sum(P .* (-log2(P)));

% The efficiency of the constant length code.
efficiency_before_huffman = h/avg_constant_length;
disp('the efficiency before huffman')
disp(efficiency_before_huffman)
disp('----------------------')
% each row corresponds to the probability in P

c = cell(length(P), 1); % codes are represent as numerical vectors for bits

% A symbol is used to represent dummy "fused" probabilities as well
% Using the indices from sort ensures that the code cell array (i)
% correspons to the input P(i)
[P, indices] = sort(P, 'descend');
symbols = struct('probability', num2cell(P), 'indices', num2cell(indices));
% P = sort(P, 'descend');
% symbols = struct('probability', num2cell(P), 'indices', num2cell(1:length(P)));

while length(symbols) > 1
    % select the two lowest probabilities and add them
    % O(n) insert worst case vs log(n) binary search...
    last = symbols(end);
    preLast = symbols(end-1);
    % Build the code words by prepending bits
    c(last.indices) = cellfun(@(x)[0 x], c(last.indices), 'UniformOutput', false);
    c(preLast.indices) = cellfun(@(x)[1 x], c(preLast.indices), 'UniformOutput', false);
    % Insert dummy symbol representing combined probability of the two
    % lowest probabilities
    probSum = last.probability + preLast.probability;
    newSymbol = struct('probability', probSum, 'indices', [last.indices preLast.indices]);
    pos = find([symbols.probability] < probSum, 1);
    % insert dummy symbol and remove the two symbols which belong to it
    symbols = [symbols(1:pos-1) newSymbol symbols(pos:end-2)];
end
%assert(length(symbols) == 1 && abs(symbols(1).probability - 1) < 10e-6, "Probability of tree root must add up to 100%");
% compute average codeword length
w = sum(cellfun('length', c) .* P(:));
%disp(c) 
%disp(s)
%disp(P)
disp('The Entropy = :')
disp(h)
disp('-------------------')
%disp(symbols)
%disp(length(P))
%disp(c(2))


%added
legend = cell(size(c));
for n = 1:length(c)
    
end
%added

%new_array_encoding = []
for i = 1: length(c)
    disp('the unique symbol is')
    disp(' ')
    disp(s(i));
    disp(' ')
    disp('its code will be')
    disp(' ')
    disp(c{i});
    disp('_________________________________')
end
%disp(length(new_array))
%array(1,:) = fieldnames(c);
%cellplot(c)


%ENCODING
new_array_encoding = [];
for q = 1: length(word) 
    for a = 1:length(s)
        if word(q) == s(a)
            new_array_encoding = [new_array_encoding c{a}];
        end
    end
end
disp('The encoded symbols is')
disp(new_array_encoding) % the encoded SYMBOLS
disp('________________________________')
% the avg code length after Huffman:
disp(' ')


%avg_Huffman_length = sum(P .* (length(P)));
disp('the average code length: ')

disp('----------------------')


%DECODING
copy_new_array_encoding = new_array_encoding;
new_array_decoding = [];
for q = 1: length(new_array_encoding) 
    for a = 1:length(c)
        if new_array_encoding(q) == c{a}
            new_array_decoding = [new_array_decoding s(a)];
            %disp(c{a})
            
        else
            if q < length(word)
                %new_array_encoding = [new_array_encoding(q) new_array_encoding(q+1)]
            end
        end
    end
end
%new_array_decoding