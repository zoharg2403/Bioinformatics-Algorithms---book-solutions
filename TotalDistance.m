function [distance] = TotalDistance(DNA,pattern)
%% Helper function for MedianSearch_BF:
% Hamming distance between 2 l-mers is defined as the number of positions
% that differ in the two strings, for example: 
%                   A T T G T C
%                   : x : x : :    => Hamming distance = 2
%                   A C T C T C
% This function calculating the total Hamming distance (between more then 
% 2 l-mers): minimum possible total Hamming distance between a given string
% and any set of starting positions in the DNA.

% Input:
%       DNA -- set of DNA sequences (#sequences in 'DNA' X 1  cell)
%       pattern -- l-mer we want to calculate the total Hamming distance to
% Output:
%       distance -- total Hamming distance of pattern

% Example:
%       Input:
%           DNA = {'GGGCAACT'; 'ATGGATCT'; 'AAGCAACC';
%                  'TTGGAACT'; 'ATGCCATT'; 'ATGGCACT'};
%           pattern = 'ATCCAGCT'
%       Output:
%           distance = 19

%% 

l = length(pattern);
distance = 0;
dH = Inf;

for i = 1:size(DNA,1) % for each sequence in DNA
    for j = 1:length(DNA{i})-l+1 % for each l-mer in DNA{i}
        % choos minimal Hamming distance possible (best l-mer match to 'pattern')
        if dH > sum(pattern~=DNA{i}(j:j+l-1)) 
            dH = sum(pattern~=DNA{i}(j:j+l-1));
        end
    end
    distance = distance + dH;
    dH = Inf;
end
            
end

