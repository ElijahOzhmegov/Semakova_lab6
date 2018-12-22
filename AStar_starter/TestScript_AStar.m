%% ??????????? ?????
map = false(20);

% ?????????? ???????????
for i=1:10
    u = randi(20);
    d = randi(20);
    
    l = randi(20);
    r = randi(20);
    
    map (u:d, l) = true;
    map (d, l:r) = true;
end
% map (16, 15:19) = true;
% map (17, 19) = true;
% map (15:20, 15) = true;

dest_coords = [4, 2];
start_coords  = [18, 19];

[route, numExpanded] = AStarGrid(map, start_coords, dest_coords, true);


% map = false(100);
% 
% % ?????????? ???????????
% map (7:9, 5) = true;
% map (7, 5:9) = true;
% 
% start_coords = [6, 2];
% dest_coords  = [90, 90];
% 
% [route, numExpanded] = AStarGrid(map, start_coords, dest_coords, true);