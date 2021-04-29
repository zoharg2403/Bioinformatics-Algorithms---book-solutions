function [R_nm] = RocksGame(n, m)
%% Play the “Rocks” game: 
% There are two piles of rocks, m in one and n in the other.e In each turn,
% one player may take either one rock (from either pile) or two rocks (one 
% from each pile). Once the rocks are taken, they are removed from play. 
% The player that takes the last rock wins the game. You make the first move.

% To find the winning strategy, construct a table (R). If Player1 can always
% win the game of n + m, then we would say R_nm = 1, but if Player1 has no 
% winning strategy against a player that always makes the right moves, we 
% would write R_nm = 0. 

% Computing R_ij:
% * Artificial initial condition: R_00 = 0
% * In games R_01, R_10, and R_11 clearly Player1 win, since in the first 
%   move, Player1 can win. => R_01 = 1, R_10 = 1, R_11 = 1.
% * In game R_02 Player1 can take only one stone => R_02 = R_20 = 0
% * In game R_12 Player1 can make three different moves that lead respectively
%   to R_11 R_20 or R_10. One of these cases, R_20, leads to a losing position
%   (R_20 = 0) for his opponent => R_12 = 1
% * In game R_22 Player1 can make three different moves that lead respectively
%   to R_21 R_12 and R_11. All of these cases leads to a wining position for 
%   his opponent => R_22 = 0
% * In game R_ij Player1 can make three different moves that lead respectively
%   to R_(i-1)(j-1), R_(i-1)j and R_(j-1)i. For R_ij to be 0, R_(i-1)(j-1),
%   R_(i-1)j and R_(j-1)i must all be 1. 
% * NOTE: R_ij and R_ji are symmetric

% Input:
%       n,m -- Integers, number of rocks in each pile.
% Output: 
%       R_nm -- if Player1 win R_nm='W', if Player1 loss R_nm='L'.
% Pseudocode:
%         1) R0,0 = 0
%         2) for i <- 1 to n
%         3)    if Ri?1,0 = 1
%         4)        Ri,0 <- 0
%         5)    else
%         6)        Ri,0 <- 1
%         7) for j <- 1 to m
%         8)    if R0,j?1 = 1
%         9)        R0,j <- 0
%        10)    else
%        11)        R0,j <- 1
%        12) for i <- 1 to n
%        13)    for j <- 1 to m
%        14)        if Ri?1,j?1 = 1 and Ri,j?1 = 1 and Ri?1,j = 1
%        15)            Ri,j <- 0
%        16)        else
%        17)            Ri,j <- 1
%        18) return Rn,m
% NOTE:      
%       simply pattern in R: if n and m are both even, the player loses.
%       But using this algorithm (chacking if n and m are both even) may be 
%       difficult to modify it for other games (for example a game in which 
%       each player can move up to three rocks at a time) 
%% Initialization:
R = zeros(n+1, m+1);
R(1, 2:2:m+1) = 1; % initialize 1st row
R(2:2:m+1, 1) = 1; % initialize 1st column
%% Compute R_ij:
for i = 2:n+1
    for j = 2:m+1
        if ~[R(i-1,j-1) R(i-1,j) R(i,j-1)]
            R(i,j) = 1;
        end
    end
end
%% Output:
if R(n+1,m+1)
    R_nm = 'W';
else 
    R_nm = 'L';
end

end

