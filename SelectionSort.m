function [a] = SelectionSort(a)
%% Sorting Problem: Sort a list of integers
% In the 1st iteration find the smallest number in a and move it to the 1st
% position in a. In the 2nd iteration find the smallest number in (a2...an)
% and move it to the 2nd position in a. ... In the ith iteration find the
% smallest number in (ai...an) and move it to the ith position in a.
% number ot iteration is equal to the number of integers in a (length(a)).
% Input: 
%       a -- A list of integers a = (a1, a2,...,an)
% Output:
%       b -- Sorted list of integers b = (b1, b2,...,bn) (reordering of 
%            integers from a such that b1<b2<b3<...<bn
% Pseudocode:
%       1) for i <- 1 to n-1
%       2)      ai_idx <- smallest element index among (ai...an) (using IndexOfMin function)
%       3)      swap ai and aj
%       4)return a

%%
for i = 1:length(a)-1
    ai_idx = IndexOfMin(a, i, length(a));
    a = [a(1:i-1) a(ai_idx) a(logical([zeros(1,i-1), (i:length(a) ~= ai_idx)]))];
end

end

