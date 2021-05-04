function [a] = NextLeaf(a, L, K)
%%
% Jump from an L-mer a=(a_1,a_2,...,a_L) to the next L-mer in the progression

% Input:
%       a -- current L-mer
%       L -- length of a (the length of the L-mer)
%       K -- number of letters in the alphabet 
%            * K=4 -> correspondence: 1=A, 2=C, 3=G, 4=T
% Output:
%       a -- Next L-mer

% Exaple:
%       Input:                  Input:                  Input:
%           a = [1 1 1]             a = [1 1 2]             a = [1 2 1]
%           L = 3          ->       L = 3          ->       L = 3
%           K = 2                   K = 2                   K = 2
%       Output:                 Output:                 Output:
%           a = [1 1 2]             a = [1 2 1]             a = [1 2 2]

% NOTE:
%       When all entries in a are K (a = [K ... K]), the algorithm wraps 
%       around and returns [1...1]. which is one way we can tell that we 
%       are finished examining all L-mers possible. 

%%

for i = L:-1:1
    if a(i) < K
        a(i) = a(i) + 1;
        break 
    end
    a(i) = 1;
end

end

