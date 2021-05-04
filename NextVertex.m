function [a, idx] = NextVertex(a, i, L, K)
%% 
% Get next vertex in the tree as the pairing of an array and a level.
% Input:
%       a -- current vertex
%       i -- the level on which the vertex lies
%       L -- length of a (the length of the L-mer)
%       K -- number of letters in the alphabet 
% Output:
%       a -- next vertex
%       idx -- the level of next vertex

%%

if i < L
    a(i+1) = 1;
    idx = i+1;
else
    for j = L:-1:1
        if a(j) < K
            a(j) = a(j) + 1;
            idx = j;
            break
        end
        idx = 0;
    end
end

end

