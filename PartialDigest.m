function [X] = PartialDigest(L)
%% Partial Digest Problem (Another algorithm):
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
%       only on L, ther can be more then 1 X set possible.
 
% Exaple:
%       Input:
%           L = [2 2 3 3 4 5 6 7 8 10]
%       Output:
%           X = [0 2 4 7 10] 

%%
% Initialization:
L_origin = L; % keep the original input as L_origin
n = (1+sqrt(1+8*length(L))) / 2; % compute n using Binomial coefficient function
X = [0 max(L)]; % initialize X: x_1=0, x_n=M (x_1=0, therfore max(L)==max(X)==x_n)
% Remove x_n from L (if width appears more then once in L, remove only one appearance):
x_n_idx = find(L==X(end));
L(x_n_idx(1)) = [];

% loop over the rest of L:
while ~isempty(L)
    for iter = 1:n-2
        width = max(L);
        x_i_options = [width, X(end)-width];
        x_i = x_i_options(randi(length(x_i_options))); % choose 1 option from x_i_options 
        % Remove |X-x_i| from L:
        del_elem = unique(abs(X-x_i));
        for e = 1:length(del_elem)
            width_idx = find(L==del_elem(e));
            if ~isempty(width_idx)
                L(width_idx(1)) = [];
            end
        end
        % Update X: add x_i to X (in increasing order)
        X = sort([X, x_i]);
    end
	if ~isempty(L)
        % initialize the while loop
        L = L_origin;
        X = [0 max(L)];
        x_n_idx = find(L==X(end));
        L(x_n_idx(1)) = [];
    end
end

end