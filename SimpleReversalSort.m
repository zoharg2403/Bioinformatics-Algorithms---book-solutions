function [Reversals] = SimpleReversalSort(perm)
%% Sorting by Reversals Problem (GREEDY algorithm):
% Given a permutation, find a series of reversals that transforms it into 
% the identity permutation.

% Input:
%       perm -- Permutation of the numbers 1:length(perm) 
%               (permutation of [1 2 3 ... length(perm)])
% Output:
%       Reversals -- A series of reversals transforming perm into the 
%                    identity permutation [1 2 3 ... length(perm)]

% Pseudocode:
% This algorithm sorts a permutation by repeatedly moving its i-th element 
% to the i-th position (increasing the prefix in each iteration):
%       1) for i <- 1 to n-1
%       2)      j <- position of element in perm (perm(j) = i)
%       3)      if j ~= i
%       4)          perm <- perm*r(i,j)  % see NOTE below for information
%       5)          Reversals <- add r(i,j)
%       6)      if perm is the identity permutation
%       7)          end

% Example:
%       Input:                           Output:
%            perm = [1 2 3 6 4 5];             Reversals = [1 2 3 6 4 5; 
%                                                           1 2 3 4 6 5;
%                                                           1 2 3 4 5 6];
%       Input:                           Output:
%            perm = [6 1 2 3 4 5];             Reversals = [6 1 2 3 4 5; 
%                                                           1 6 2 3 4 5;
%                                                           1 2 6 3 4 5;
%                                                           1 2 3 6 4 5;
%                                                           1 2 3 4 6 5;
%                                                           1 2 3 4 5 6];

% NOTE:
% * Reversal means reeversing the order of sequences blocks:
%   In effect, Reversal r(i,j) turnd permutation p: 
%      p = p_1, p_2,...,p_i-1, p_i, p_i+1,...,p_j-1, p_j, p_j+1,...,p_n
%   Into:
%      p*r(i,j) = p_1,p_2,...,p_i-1, p_j, p_j-1,...,p_i+1, p_i, p_j+1,...,p_n
%   For example:
%       p = 1 2 4 3 7 5 6  -->  p*r(3,6) = 1 2 5 7 3 4 6
% * This algorithm does not guarantee the smallest number of reversals.

%% 
n = length(perm);
IdentityPerm = 1:n;
Reversals = [perm];

for i = 1:n-1
    j = find (perm == i);  % position of element i in perm
    if i ~= j
        perm(j) = [];
        perm = [perm(1:i-1) i perm(i:end)];
        Reversals = [Reversals; perm];
    end
    if perm == IdentityPerm
        break
    end
end
        
end

