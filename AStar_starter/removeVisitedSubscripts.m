function newSubscripts = removeVisitedSubscripts(map, Subscripts)
% ======================================================================
%                                 Lab 6
% 
% Made by ElijahOzmegov@gmail.com as a part of the laboratory work
% 
% The function checks if nearby subscripts were already visited and 
% then remove if it was
% ======================================================================
notVisited    = 1;
isDestination = 6;

neighbours = map(Subscripts);

newSubscripts = [Subscripts(neighbours==notVisited), ...
                 Subscripts(neighbours==isDestination)];