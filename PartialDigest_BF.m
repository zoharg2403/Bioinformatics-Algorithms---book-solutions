function [X] = PartialDigest_BF(L)
%% Partial Digest Problem (BRUTE FORCE algorithm):
% Given all pairwise distances between points on a line, reconstruct the 
% positions of those points:

% * X={x_1=0,x_2,...,x_n} is a set of n points on a line segment in 
%   increasing order 
% * dX is a multiset (set that allows duplicate elements) of all pair 
%   combinations ('n choose 2') (== nchoosek(X,2)) pairwise distances between 
%   points in X: dX = {|x_j-x_i| : 1<=i<j<=n}
% * Given L, this function computes X, such that dX==L

% Input:
%       L -- The multiset of pairwise distances, containing Binomial 
%             coefficient or all pair combinations ('n choose 2'){nchoosek(X,2)}
% Output:
%       X -- A set X, of n integers, such that dX==L (x_1 = 0)

% NOTE:
%       it is not always possible to uniquely reconstruct a set X based
%       only on L, ther can be more then 1 X set possible. If thar is more 
%       then 1 X set option, the function will output all X options in a
%       matrix, each row in the output is different X option. 
 
% Exaple:
%       Input:
%           L = [2 2 3 3 4 5 6 7 8 10]
%       Output:
%           X = [0 2 4 7 10; 0 3 6 8 10]

%% BRUTE FORCE algorithm:
% Initialization:
X = [];
n = (1+sqrt(1+8*length(L))) / 2; % compute n using Binomial coefficient function 

% Get all options for X:
x_n = max(L); % x_1=0, therfore max(L)==max(X)==x_n
all_X_options = nchoosek(1:x_n-1,n-2); % without x_1=0 and x_n=M

% compute dX for each X option in 'all_X_options':
for r = 1:size(all_X_options,1)
    X_r = [0, all_X_options(r,:), x_n];
    X_r_pairs = nchoosek(X_r,2);
    dX = sort(abs(X_r_pairs(:,1)-X_r_pairs(:,2)))';
    if dX==L
        X = [X; X_r];
    end
end

if isempty(X)
    disp('No Solution');
end

end
