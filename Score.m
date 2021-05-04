function [score] = Score(DNA, s, l)
%% Helper function for MotifSearch:

% Input:
%       DNA -- set of DNA sequences (#sequences in 'DNA' X 1  cell)
%       s -- array of starting positions of the l-mers in each sequence in 'DNA'
%       l -- length of l-mers
% Output:
%       score -- the score of the consensus l-mer

% Example:
%       Input:
%               DNA = {'CGGGGCTATCCAGCTGGGTC';
%                      'TTTGAGGGTGCCCAATAAGGGCAACTCCAAAGCGGA';
%                      'GGATGGATCTGATGCCGT';
%                      'AAGGAAGCAACCCCAGG';
%                      'AATTTTCTAAAAAGATTATAATGTCGGTCCTTGGAACTTC';
%                      'CTGCTGTACAACTGAGATCATGCTGCATGCCATTTT';
%                      'TACATGATCTTTTGATGGCACTTGGATGA'};
%               s = [8 19 3 5 31 27 15]
%               l = 8
%       Output:
%               score = 42

%%
% Get the alignment matrix according to the starting positions:
Alignment = []; 
for i = 1:length(s)
    Alignment = [Alignment; DNA{i}(s(i):s(i)+l-1)];
end

% Get the profile matrix (4 X l matrix): 
% * each row corresponds to a nucleotide: 1-A, 2-C, 3-G, 4-T)
% * each column corresponds to a position in the l-mer (positions 1 to l)
Profile = [sum(Alignment == 'A'); sum(Alignment == 'C'); 
    sum(Alignment == 'G'); sum(Alignment == 'T')];

% Compute score;
score = sum(max(Profile));

end

