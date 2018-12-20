function newSubscripts = removeVisitedSubscripts(map, Subscripts)
% ======================================================================
%                                 Lab 6
% 
% Made by ElijahOzmegov@gmail.com as a part of the laboratory work
% 
% The function checks if nearby subscripts were already visited and 
% then remove if it was
% ======================================================================
notVisited = 1;
isDestination = 6;

vec = map(Subscripts);

newSubscripts = [Subscripts(vec==notVisited); ...
                 Subscripts(vec==isDestination)] ;
% well, I thought it would be much bigger