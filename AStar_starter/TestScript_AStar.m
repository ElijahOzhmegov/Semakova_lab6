%% определение карты
map = false(10);

% добавление препятствия
map (1:5, 6) = true;

start_coords = [6, 2];
dest_coords  = [8, 9];

%%
[route, numExpanded] = AStarGrid(map, start_coords, dest_coords, true);
