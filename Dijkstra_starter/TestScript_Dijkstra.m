%% ??????????? ?????
map = false(10);

% ?????????? ???????????
map (3, 1:3) = true;
map (3:6, 1) = true;
map (5, 2:3) = true;
map (4, 3) = true;

map (3, 6) = true;
map (5, 6) = true;
map (4:6, 5) = true;
map (4:6, 7) = true;

map (8, 1:3) = true;
map (8:10, 2) = true;

map (8:10, 5) = true;
map (9, 6) = true;
map (8:10, 7) = true;

start_coords = [6, 2];
dest_coords  = [8, 9];

%%
[route, numExpanded] = DijkstraGrid(map, start_coords, dest_coords, true);
