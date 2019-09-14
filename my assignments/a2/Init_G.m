%% Make initial graph from Lecture Note
clear G;
G = sparse(11,11);

G(6,1) = 1; 
G(3,2) = 1;
G(5,2) = 1;
G(6,2) = 1;
G(7,3) = 1; % consider changing G(7,3) to G(7,1) = 1 
G(10,3) = 1;
G(11,3) = 1;
G(3,4) = 1;
G(6,4) = 1;
G(3,5) = 1; % change to 0 for terminal branch (cycle)
G(7,5) = 1; % change to 0 for terminal branch (cycle)
G(8,5) = 1;
G(2,6) = 1;
G(3,6) = 1;
G(5,7) = 1;
G(10,7) = 1;
G(9,8) = 1;
G(7,9) = 1; % Try changing from 1 to 0 (making 9 terminal)
            % or, change G(7,9) to G(5,9) for terminal branch (cycle)
G(3,10) = 1;
G(11,10) = 1;
G(4,11) = 1;
