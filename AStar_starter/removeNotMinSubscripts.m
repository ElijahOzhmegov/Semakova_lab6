function newSubscripts = removeNotMinSubscripts(g, H, Subscripts)
% ======================================================================
%                                 Lab 6
% 
% Made by ElijahOzmegov@gmail.com as a part of the laboratory work
% 
% The function sums of g(Subscripts) and H(Subscripts) and removes those 
% that bigger than min their sum 
% ======================================================================

partF = g(Subscripts) + H(Subscripts);
minF  = min(partF);

newSubscripts = Subscripts(partF==minF);