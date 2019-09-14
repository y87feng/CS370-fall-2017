%
% function S = EvaluateMySpline(x, pwc, xvals)
%
% Input:
%
%   x is a vector of x-values for the spline nodes, in
%   increasing order
%
%   xvals is a vector of x-values where you want to evaluate
%     the cubic spline.  These should also be in increasing order.
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
%     p_k(x) = a(k)*(x(k+1)-xvals(m))^3/(6*hk) +
%              a(k+1)*(xvals(m)-x(k))^3/(6*hk) +
%              b(k)*(x(k+1)-xvals(m)) + c(k)*(xvals(m)-x(k));
%
%   where hk = x(k+1) - x(k).
%
% Output:
%
%   S is a vector the same size as xvals holding the value of
%     the spline corresponding to the given x-values in xvals.
%
function S = EvaluateMySpline(x, pwc, xvals)

    n = length(x);
    
    a = pwc.a;
    b = pwc.b;
    c = pwc.c;
    
    if length(a)~=n
        disp(['ERROR: Array "a" must have length ' num2str(n)]);
    elseif length(b)~=n-1
        disp(['ERROR: Array "b" must have length ' num2str(n-1)]);
    elseif length(c)~=n-1
        disp(['ERROR: Array "c" must have length ' num2str(n-1)]);
    end
    
    S = zeros(size(xvals)); % Pre-allocate output array (faster)
    
    k = 1; % this is the current polynomial piece
    hk = x(k+1) - x(k);
   
    for m = 1:length(xvals)
        
        % As long as the next x-value is not on the current piece
        while xvals(m)>x(k+1)
            % Go to next piece
            k = k + 1;
            hk = x(k+1) - x(k);
        end
        
        S(m) = a(k)*(x(k+1)-xvals(m))^3/(6*hk) + ...
               a(k+1)*(xvals(m)-x(k))^3/(6*hk) + ...
               b(k)*(x(k+1)-xvals(m)) + c(k)*(xvals(m)-x(k));
    end
    
    
    
    