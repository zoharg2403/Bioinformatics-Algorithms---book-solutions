function [Smallest, Largest] = MinMaxValue(NumList)
%% Problem 2.1:
% Write an algorithm that, given a list of n numbers, returns the largest 
% and smallest numbers in the list. Estimate the running time of the algorithm.
% Can you design an algorithm that performs only 3*floor(n/2) comparisons to find the
% smallest and largest numbers in the list?
%% Function description: 
% Input:
%       NumList -- list of numbers
% Output:
%       Smallest -- The smallest number in the list
%       Largest -- The largest number in the list
% Exaple:
%       Input:
%           NumList = [65 38 80 52 34 90 83 97 58 54]
%       Output:
%           Smallest = 34
%           Largest = 97     
%% 
% Initialization:
if length(NumList) == 1 % Edge case: length(NumList)==1
	Smallest = NumList(1);
	Largest = NumList(1);
else
	if NumList(1) < NumList(2) % comparing the first pair of numbers
        Smallest = NumList(1);
        Largest = NumList(2);
    else
        Smallest = NumList(2);
        Largest = NumList(1);
	end
end

% comparing the rest of the numbers in NumList:
for i = 3:2:length(NumList)-1
    if NumList(i) > NumList(i+1) % comparing pairs of numbers
        if NumList(i+1) < Smallest
            Smallest = NumList(i+1);
        end 
        if NumList(i) > Largest
            Largest = NumList(i);
        end
    else                         % NumList(i) <= NumList(i+1)
        if NumList(i) < Smallest
            Smallest = NumList(i);
        end 
        if NumList(i+1) > Largest
            Largest = NumList(i+1);
        end
    end
end

% Edge case: length(NumList) is odd
if mod(length(NumList), 2) 
    if NumList(end) > Largest
        Largest = NumList(end);
    elseif NumList(end) < Smallest
        Smallest = NumList(end);
    end
end
       
end