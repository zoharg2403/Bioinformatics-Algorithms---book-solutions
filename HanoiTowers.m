function HanoiTowers(n, fromPeg, toPeg)
%% Output a list of moves that solves the Towers of Hanoi.
% The Towers of Hanoi puzzle consists of three pegs, which we label from 
% left to right as 1, 2, and 3, and a number of disks of decreasing radius, 
% each with a hole in the center. The disks are initially stacked on the left 
% peg (1) so that smaller disks are on top of larger ones. The game is played
% by moving one disk at a time between pegs. You are only allowed to place 
% smaller disks on top of larger ones, and any disk may go onto an empty peg.
% The puzzle is solved when all of the disks have been moved from peg 1 to 
% peg 3.
%
% Input:
%       n -- Number of disks (integer)
%       fromPeg, toPeg -- refer to the three different pegs so that 
%                         fromPeg = 1 and toPeg = 3 moves n disks from the
%                         first peg to the third peg (peg 1 to 3).
% Output:
%       A sequence of moves that will solve the n-disk Towers of Hanoi puzzle.
% Recursive Algorithm Pseudocode:
%       1) if n = 1
%       2)      output "Move disk from peg 'fromPeg' to peg 'toPeg'"
%       3) else
%       4)      unusedPeg <- 6-fromPeg-toPeg
%       5)      HanoiTowers(n-1, fromPeg, toPeg)
%       6)      output "Move disk from peg 'fromPeg' to peg 'toPeg'"
%       7)      HanoiTowers(n-1, unusedPeg, toPeg)
%       8) end
% NOTEs: 
%       * unusedPeg variable represents which of the three pegs can serve as 
%         a temporary destination for the first n?1 disks.
%       * Always: fromPeg + unusedPeg + toPeg = 6 (1+2+3), so unusedPeg can
%         be computed as 6-fromPeg-toPeg

%%
if n == 1
    fprintf("Move disk from peg %d to peg %d \n", fromPeg, toPeg);
else
    unusedPeg = 6 - fromPeg - toPeg;
    HanoiTowers(n-1, fromPeg, unusedPeg);
    fprintf("Move disk from peg %d to peg %d \n", fromPeg, toPeg);
    HanoiTowers(n-1, unusedPeg, toPeg);
end
end

