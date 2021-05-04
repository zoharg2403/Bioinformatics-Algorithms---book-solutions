function [bestWord,bestDistance] = MedianSearch_BF(DNA,l)
%% Median String Problem (BRUTE FORCE algorithm):
% Given a set of DNA sequences, find a median string.
% The median string for 'DNA' is defined as the string that minimizes 
% TotalDistance(DNA,string).
% * This function uses 'TotalDistance' and 'NextLeaf' functions

% Input:
%       DNA -- set of DNA sequences (#sequences in 'DNA' X 1  cell)
%       l -- length of l-mers
% Output:
%       bestMotif -- set of starting positions s (corresponding to each of 
%                    the DNA sequences), which will have the highest score
%                    (conmputed by using Score 'function')
%       bestScore -- the score of bestMotif (conmputed by using Score 
%                    'function')

% Example:
%       Input:
%             DNA = {'ATCCAGCT'; 'GGGCAACT'; 'ATGGATCT'; 'AAGCAACC'; 
%                 'TTGGAACT'; 'ATGCCATT'; 'ATGGCACT'};
%             l = 8
%       Output:
%           bestDistance = 14
%           bestWord = 'ATGCAACT'

% NOTE: 
%       In the example, bestWord is the consensus string

%%
WordNum = ones(1,l);
bestWord(WordNum == 1) = 'A';
bestDistance = TotalDistance(DNA,bestWord);

% for each l-mer from 'A...A' to 'T...T':
while 1
    WordNum = NextLeaf(WordNum, l, 4); % get next word
    if WordNum == ones(1,l)
        break
    end
    word = char(replace(join(string(WordNum)),{'1'; '2'; '3'; '4'},{'A'; 'C'; 'G'; 'T'}));
    word = word(~isspace(word));
    dH = TotalDistance(DNA,word);
    if dH < bestDistance
        bestDistance = dH;
        bestWord = word;
    end
end

end

