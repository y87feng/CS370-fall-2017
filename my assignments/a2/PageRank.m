% function [p, iters] = PageRank(G, alpha)
%
% Computes the Google Page-rank for the network in the adjacency matrix G.
%
% Input
%   G is an adjacency matrix, G(i,j) = 1 iff node j projects to node i
%   alpha is a scalar between 0 and 1
%
% Output
%   p is a probability vector containing the Page-rank of each node
%   iters is the number of iterations used to achieve a tolerance of 1e-8
%
function [p, iters] = PageRank(G, alpha)
    R = size(G,1);  % number of nodes
    P = sparse(R,R);
    
    for j=1:R
        num = 0;
        for i=1:R
            if G(i,j) ~= 0
                num = num + G(i,j);
            end
        end
        if num == 0
            num = R;
        end
        for i = 1:R
            if G(i,j) ~= 0
                P(i,j) = G(i,j) / num;
            end
            if num == R 
                P(i,j) = 1/ R;
            end
        end
    end
    p = ones(R,1)*1/R;
    E = ones(R,1);
    Et = ones(1,R);
    iters = 0;
    while 1
        iters = iters + 1;
        inter = (alpha * P + (1-alpha) * 1/R * E * Et)* p;
        difference = 0;
        for i=1:R
            diff = inter(i) - p(i);
            difference = max(difference,diff);
        end
        if difference <= 1e-8
            break
        end
        p = inter;
    end
end
    
