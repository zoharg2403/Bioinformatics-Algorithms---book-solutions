function [idx] = IndexOfMin(array, first, last)
%% returns the index of the smallest element between positions first and last
% Input:
%       array -- List of numbers
%       first, last -- indicate the first and last positions in a in which
%                      we search for the smallest number
% output:
%       idx -- the index of the smallest number between positions first and last
% Pseudocode
%       1) idx <- first
%       2) for k <- first + 1 to last
%       3)      if array_k < array_idx
%       4)              idx <- k
%       5) return idx
% NOTE: 
%       If the smallest element appear more then once, idx will be the
%       first appearance of the smallest element.

%%
idx = first;
for k = first+1:last
    if array(k) < array(idx)
        idx = k;
    end
end
end
