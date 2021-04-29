function [coins] = ChangeProblem(M,currency)
%% Change Problem:
% Convert some amount of money into the fewest number of coins.
% Input:
%       M -- An amount of money (float / integer)
%       currency -- List of coins available (list of floats / integers)
% Output:
%       coins -- Shortest list of coins whose values add to M (list of floats / integers)
% Pseudocode:
%       1) while M > 0
%       2) c -> Largest coin that is smaller than (or equal to) M
%       3) add c to 'coins'
%       4) update M: M -> M-c
% Example:
%       Input:
%               M = 176.7;
%               currency  = [200, 100, 50, 20, 10, 5, 2, 1, 0.5, 0.1]
%       Output:
%               coins = [100.0000 50.0000 20.0000 5.0000 1.0000 0.5000 0.1000 0.1000]
% NOTE:
%       M is rounded to one number after the decimal point

%% 
coins = [];
while M > 0
    c = max(currency(currency <= M)); % get max value coin that is <= M 
    coins = [coins, c];
    M = round(M - c, 1);
end 

end

