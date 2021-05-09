function [dX] = Xmultiset(X)
%% Problem 4.1:
% Write an algorithm that, given a set X, calculates the multiset dX.

% * If X={x_1=0,x_2,x_3,...,x_n} is a set of n points on a line segment in  
%   increasing order, then dX denotes the multiset (set that allows duplicate
%   elements) of all 'n choose 2' pairwise distances between points in X: 
%   dX = {x_j - x_i : 1 <= i < j <= n}

%% Function description: 
% Input:
%       X -- list of numbers in increasing order
% Output:
%       dX -- the multisetof all 'n choose 2' pairwise distances between 
%             elements in X  -> dX = {x_j - x_i : 1 <= i < j <= n}
% Exaple:
%       Input:
%           X = [0 2 4 7 10]
%       Output:
%           dX = [2 2 3 3 4 5 6 7 8 10]

%% 
all_pairs = nchoosek(X,2);
dX = sort(abs(all_pairs(:,2)-all_pairs(:,1)))';

end

