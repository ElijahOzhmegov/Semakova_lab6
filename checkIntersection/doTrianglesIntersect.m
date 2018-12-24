function answer = doTrianglesIntersect(P1, P2)
% ======================================================================
%                                 Lab 6
% 
% Made by ElijahOzmegov@gmail.com as a part of the laboratory work
% 
% The function checks if triangles intersects, if they do, then it 
% returns true, otherwise false
% ======================================================================

answer = false;

P1_x = P1(:,1).';
P1_y = P1(:,2).';

P2_x = P2(:,1).';
P2_y = P2(:,2).';

plot([P1_x P1_x(1)], [P1_y P1_y(1)]), grid on, hold on;
plot([P2_x P2_x(1)], [P2_y P2_y(1)]), grid on;

% poly1 = polyshape(P1_x, P1_y);
% poly2 = polyshape(P2_x, P2_y);
% 
% polyout = intersect(poly1,poly2);
% too easy, isn't it?

syms k b x

eqn_1_1 = [k*P1_x(1) + b == P1_y(1), k*P1_x(2) + b == P1_y(2)];
eqn_1_2 = [k*P1_x(2) + b == P1_y(2), k*P1_x(3) + b == P1_y(3)];
eqn_1_3 = [k*P1_x(3) + b == P1_y(3), k*P1_x(1) + b == P1_y(1)];

eqn_2_1 = [k*P2_x(1) + b == P2_y(1), k*P2_x(2) + b == P2_y(2)];
eqn_2_2 = [k*P2_x(2) + b == P2_y(2), k*P2_x(3) + b == P2_y(3)];
eqn_2_3 = [k*P2_x(3) + b == P2_y(3), k*P2_x(1) + b == P2_y(1)];

[k1(1), b1(1)] = solve(eqn_1_1, k, b);
[k1(2), b1(2)] = solve(eqn_1_2, k, b);
[k1(3), b1(3)] = solve(eqn_1_3, k, b);

[k2(1), b2(1)] = solve(eqn_2_1, k, b);
[k2(2), b2(2)] = solve(eqn_2_2, k, b);
[k2(3), b2(3)] = solve(eqn_2_3, k, b);

order = [2 3 1];

for i=1:3
    g = k1(i)*x + b1(i);
    
    x1_lim = [P1_x(i) P1_x(order(i))];
    x1_l = min(x1_lim);
    x1_r = max(x1_lim);
    
    for j=1:3
        f = k2(j)*x + b2(j);
        val_x = solve(g == f, x);
        val_x = double(val_x);
        
        x2_lim = [P2_x(j) P2_x(order(j))];
        x2_l = min(x2_lim);
        x2_r = max(x2_lim);
        
        if (val_x <= x1_r) && (val_x >= x1_l) && ...
           (val_x <= x2_r) && (val_x >= x2_l)
            answer = true;
            break;
        end     
    end
end