function [route,numExpanded] = AStarGrid(input_map, start_coords, dest_coords, drawMap)
% запуск алгоритма A* на сетке

% входные данные: 
%     input_map: логический массив, в котором свободная клетка = 0 (false), препятствие = 1 (true)
%     start_coords and dest_coords: координаты (строка, столбец) начальной и конечной клеток

% выходные данные:
%      route : одномерный массив линейных индексов всех клеток, соответствующих кратчайшему пути (пуст, если пути не существует)
%      numExpanded: общее число клеток, задействованных в поиске (конечная точка не входит в это число)

% настройка цветовой схемы для вывода карты
% 1 - white -- свободная клетка
% 2 - black -- препятствие
% 3 - red -- посещенная клетка
% 4 - blue  -- клетка из списка рассматриваемых
% 5 - green -- начальная клетка
% 6 - yellow -- конечная клетка

cmap = [1 1 1; ...
    0 0 0; ...
    1 0 0; ...
    0 0 1; ...
    0 1 0; ...
    1 1 0; ...
    0.5 0.5 0.5];

colormap(cmap);

% переменная для отображения карты на каждой итерации
drawMapEveryTime = drawMap;

[nrows, ncols] = size(input_map);

% map -- таблица текущих состояний клеток
map = zeros(nrows, ncols);

map(~input_map) = 1;     % раскраска свободных клеток
map(input_map)  = 2;     % раскраска препятствий

% линейный индекс начальной и конечной клеток
start_node = sub2ind(size(map), start_coords(1), start_coords(2));
dest_node  = sub2ind(size(map), dest_coords(1),  dest_coords(2));

map(start_node) = 5;
map(dest_node)  = 6;

parent = zeros(nrows, ncols);

% meshgrid возвращает массивы координат, подробнее -- см. help meshgrid
[X, Y] = meshgrid (1: ncols, 1: nrows);

xd = dest_coords(1);
yd = dest_coords(2);

% функция эвристики (манхэттенское расстояние)
H = abs(X - xd) + abs(Y - yd);
H = H';
% инициализация массивов "стоимости" (расстояний)
f = Inf(nrows, ncols);
g = Inf(nrows, ncols);

g(start_node) = 0;
f(start_node) = H(start_node);

% счетчик задействованных в поиске клеток
numExpanded = 0;

% главный цикл

while true
    
    % отрисовка текущей карты
    map(start_node) = 5;
    map(dest_node) = 6;
    
    % чтобы видеть изменение карты: drawMapEveryTime = true 
    if (drawMapEveryTime)
        image(1.5, 1.5, map);
        grid on;
        axis image;
        drawnow;
    end
    
    % нахождение клетки с минимальным значением f
    [min_f, current] = min(f(:));
    
    if ((current == dest_node) || isinf(min_f))
        break
    end
    
    % обновление карты
    map(current) = 3;     % раскраска текущей клетки как посещенной
    f(current) = Inf;     % удаление этой клетки из списка рассматриваемых
    
    % координаты (строка, столбец) текущей клетки
    [i, j] = ind2sub(size(f), current);
    
   % ********************************************************************* 
   % ВАШ КОД ДОЛЖЕН НАХОДИТЬСЯ ЗДЕСЬ
   % необходимо посетить каждого соседа рассматриваемой клетки и обновить значения массивов map, f, g и parent
    
    
   %*********************************************************************
    
end

%% построение пути с помощью последовательного прохождения по родителям
if (isinf(f(dest_node)))
    route = [];
else
    route = dest_node;
    
    while (parent(route(1)) ~= 0)
        route = [parent(route(1)), route];
    end

    % визуализация карты и пути
    for k = 2:length(route) - 1        
        map(route(k)) = 7;
        pause(0.1);
        image(1.5, 1.5, map);
        grid on;
        axis image;
    end
end

end
