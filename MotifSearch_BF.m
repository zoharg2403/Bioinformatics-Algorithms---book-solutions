function [bestMotif, bestScore] = MotifSearch_BF(DNA, l)
%% Motif Finding problem (BRUTE FORCE algorithm):
% Given a set of DNA sequences, find a set of l-mers, one from each 
% sequence, that maximizes the consensus score.
% * This function uses 'Score' function 

% Input:
%       DNA -- set of DNA sequences (#sequences in 'DNA' X 1  cell)
%       l -- length of l-mers
% Output:
%       bestMotif -- set of starting positions s (corresponding to each of 
%                    the DNA sequences), which will have the highest score
%                    (conmputed by using Score 'function')
%       bestScore -- the score of bestMotif (conmputed by using Score 
%                    'function')

% NOTE:
%       If ther is more then one bestMotif with bestScore, bestMotif will
%       be a matrix: each row is a different bestMotif that has the same
%       Score.

% Example:
%       Input:
%           DNA = {'ATCCAGCT';
%                  'GGGCAACT';
%                  'ATGGATCT';
%                  'AAGGAAGCAACCCCAGG';
%                  'AATTTTCTAAAAAGATTATAATGTCGGTCCTTGGAACTTC';
%                  'CTGCTGTACAACTGAGATCATGCTGCATGCCATTTT';
%                  'TACATGATCTTTTGATGGCACTTGGATGA'};
%           l = 8
%       Output:
%            bestMotif = [1 1 1 5 31 6 15;
%                         1 1 1 5 31 27 15]

%% 
% Initialization:
bestScore = 0;
bestMotif = [];

% loop for each (s_1,...,s_t) from (1,...,1) to (n?l+1,..., n?l+1):

% Initialize s and n:
% starting positions of the l-mer in each sequences in 'DNA'
s = ones(1, size(DNA,1));
% last l-mer starting position possible for each sequences in 'DNA'
n = cellfun(@(c) length(c)-l+1,DNA)';

while 1
    % if s is better then bestMotif, update bestMotif:
	if Score(DNA, s, l) > bestScore
        bestScore = Score(DNA, s, l);
        bestMotif = s;
    elseif Score(DNA, s, l) == bestScore
        bestMotif = [bestMotif; s];
	end
    % move to next s positions:
    for i = size(DNA,1):-1:1
        if s(i) < n(i)
            s(i) = s(i) + 1;
            break
        end
        s(i) = 1;
    end
    % ending the loop: when all starting positions are checked, the next s
    % will be set to [1...1] which is how we can tell that we finished 
    % getting all s possible
    if s == ones(1, size(DNA,1))
        break
    end
end
    
end

