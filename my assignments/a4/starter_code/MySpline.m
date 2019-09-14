
%
% function pwc = MySpline(x, y)
%
% Input:
%
%   x and y are vectors (same size) of x-values and y-values,
%   corresponding to points in the xy plane.  The x-values
%   must be in increasing order.
%
% Output:
%
%   pwc is a "piecewise-cubic" Matlab structure containing 3
%   arrays, a, b, and c.  You access them using
%     >> pwc.a(5) = ...
%   a, b and c are vectors of parameters corresponding to the
%   alternate form of the cubic polynomial (see class notes).
%   Note that "a" is indexed starting at 1, so a_0 from the class
%   notes refers to a(1), etc.  The vectors "b" and "c" are
%   indexed the same as in the class notes.
%
%   Hence...
%     a(1) = a_0
%     a(2) = a_1          b(1) = b_1        c(1) = c_1
%          :                   :                 :
%     a(n) = a_(n-1)    b(n-1) = b_(n-1)  c(n-1) = c_(n-1)
%
%   The polynomial piece is evaluated using
%
%     p_k(x) = a(k)*(x(k+1)-xvals(m))^3/(6*hk) + ...
%              a(k+1)*(xvals(m)-x(k))^3/(6*hk) + ...
%              b(k)*(x(k+1)-xvals(m)) + c(k)*(xvals(m)-x(k));
%
%   where hk = x(k+1) - x(k).  See the function
%
%     EvaluateMySpline
%
%   for more details.
%
%
function pwc = MySpline(x, y)

    n = length(x);
    pwc.a = zeros(n,1);
    pwc.b = zeros(n-1,1);
    pwc.c = zeros(n-1,1);
    
    % Your code here
    
    pwc.a(1) = 0;
    pwc.a(n) = 0;
    
    n2 = length(x) - 2;
    M = zeros(n2);
    y2 = zeros(n2,1);
    
    M(1,1) = ((x(2) - x(1)) + (x(3)-x(2))) / 3;
    M(1,2) = (x(3) - x(2)) / 6;
    for i = 1 : n2
        h1 = x(i+1) - x(i);
        h2 = x(i+2) - x(i+1);
        if i ~= 1 && i~= n2 
            M(i,i) = (h1+h2)/3;
            M(i,i-1) = h1/6;
            M(i,i+1) = h2 / 6;
        end
        y2(i) = (y(i+2) - y(i+1)) / h2 - (y(i+1) - y(i)) / h1; 
    end
    M(n2,n2-1) = (x(n2+1) - x(n2)) / 6;
    M(n2,n2) = ((x(n2+2) - x(n2+1)) + (x(n2+1) - x(n2))) / 3;
    a = M \ y2;
    
    a = [0; a; 0];
    pwc.a = a;
    for i = 1 : n - 1
            hi = x(i+1) - x(i);
            pwc.b(i) = y(i) / hi - pwc.a(i) * hi / 6;
            pwc.c(i) =  - pwc.a(i+1) * hi / 6 + y(i+1) / hi;
    end
end
