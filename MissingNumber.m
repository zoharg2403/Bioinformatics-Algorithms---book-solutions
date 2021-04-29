function [MissNum] = MissingNumber(NumList)
%% Problem 2.4:
% You are given an unsorted list of n?1 distinct integers from the range 1 
% to n. Write a linear-time algorithm to find the missing integer.
%% Function description: 
% Input:
%       NumList -- list of n-1 distinct integers from the range 1:n
% Output:
%       MissNum -- the missing integer in NumList
% Exaple:
%       Input:
%           NumList = [4,2,5,1];
%       Output:
%           MissNum = 3;
% NOTE: 
%       * You can generate inputs using:
%               NumList = randperm(n,n-1);
%       * If n is very large, you may get an overflow problem and the
%         algorithm needs to be changed
%% 
n = max(NumList);
MissNum = sum(1:n) - sum(NumList);
% Edge case -- The missing number is n:
% The input NumList include n-1 integers from the range 1:n. If NumList 
% includes all integers 1:n-1, and the missing number is n, then max(NumList)
% will actually give n-1 and not n, and sum(1:n)-sum(NumList)==0 
if MissNum == 0
    MissNum = n+1;
end
end

