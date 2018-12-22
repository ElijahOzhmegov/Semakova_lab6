function Subscripts = getNearbySubscripts(size, i, j)
% ======================================================================
%                                 Lab 6
% 
% Made by ElijahOzmegov@gmail.com as a part of the laboratory work
% 
% The function checks if left, up, right and down cells exist, and if  
% they do, it creates a vector of its subscripts.
% ======================================================================

Subscripts = [];

if i - 1 > 0
	Subscripts = [Subscripts sub2ind(size, i - 1, j)];
end

if i + 1 <= size(1)
	Subscripts = [Subscripts sub2ind(size, i + 1, j)];
end

if j - 1 > 0
    Subscripts = [Subscripts sub2ind(size, i, j - 1)];
end

if j + 1 <= size(2)
    Subscripts = [Subscripts sub2ind(size, i, j + 1)];
end