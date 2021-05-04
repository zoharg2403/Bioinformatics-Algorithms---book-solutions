function [a,idx] = Bypass(a, i, L, K)
%% 
% Get next vertex in the tree as the pairing of an array and a level 
% (produces the same type of output as NextLeaf function)
% Bypass function allows us to skip the subtree rooted at vertex(a, i). 
% If we skip a vertex at level i of the tree, we can just increment a_i 
% (unless a_i=k, in which case we need to jump up in the tree).

% Input:
%       a -- current vertex
%       i -- the level on which the vertex lies
%       L -- length of a (the length of the L-mer)
%       K -- number of letters in the alphabet 
% Output:
%       a -- next vertex
%       idx -- the level of next vertex

%%

for j = i:-1:1
    if a(j) < K
        a(j) = a(j) + 1;
        idx = j;
        break
    end
    idx = 0;
end

end

