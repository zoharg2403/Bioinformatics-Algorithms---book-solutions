function [a] = AllLeaves(L, K)
%% 
% This function uses NextLeaf function to output all the L-mers possible
% with K letters alphabet

% Input:
%       L -- length of a (the length of the L-mer)
%       K -- number of letters in the alphabet 
%            * K=4 -> correspondence: 1=A, 2=C, 3=G, 4=T
% Output:
%       a -- All L-mers with K letters alphabet

% Example:
%       Input:
%           L = 3
%           K = 2
%       Output:
%            a = [ 1 1 1
%                  1 1 2
%                  1 2 1
%                  1 2 2
%                  2 1 1
%                  2 1 2
%                  2 2 1
%                  2 2 2 ]

%%
a = ones(1, L); % initialize a

while 1
    next_a = NextLeaf(a(end, :), L, K); 
    if next_a == ones(1, L); 
        % NextLeaf wraps around: when a=[K...K], NextLeaf(a, L, K)=[1...1],
        % which is how we can tell that we finished getting all L-mers possible
        break
    else
        a = [a; next_a];% add next leaf to a
    end
end

end

