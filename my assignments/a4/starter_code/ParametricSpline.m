% function [x_cs, y_cs, t] = ParametricSpline(Sx,Sy)
%
%   Takes an array of x- and y-values, and returns a parametric
%   cubic spline in the form of two piecewise-cubic data structures
%   (one for the x-component and one for the y-component), as well as
%   the corresponding parameter values.
%
%   Input:
%    Sx   array of x-values
%    Sy   array of y-values
%
%   Output:
%    x_cs piecewise-cubic data structure for x-component
%    y_cs piecewise-cubic data structure for x-component
%    t    parameter values for spline knots
%
%    Note: See the help for MySpline for a description of the
%          piecewise-cubic data structure.
%
function [x_cs, y_cs, t] = ParametricSpline(Sx,Sy)

    N = length(Sx); % How many points?
    t = zeros(1,N);
    
    for i = 2 : N
        t(i) = t(i-1) + sqrt((Sx(i)-Sx(i-1))^2 +(Sy(i) - Sy(i-1))^2);
    end
    
    x_cs = spline(t,Sx);
    y_cs = spline(t, Sy);
    
