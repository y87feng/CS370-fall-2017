%
%function [t, y] = MyOde(f, tspan, y0, h, event)
%
% Numerically solves the initial value problem
%
%    dy(t)/dt = f(t,y)
%        y(0) = y0
%
% using the Modified Euler time-stepping method.
%
% Input
%   f       handle to a Matlab dynamics function with calling sequence
%              dydt = f(t, y)
%   tspan   1x2 vector giving the start and end times, [start end]
%   y0      initial state of the system (as a column vector)
%   h       the time step to use (this is not adaptive time stepping)
%   events  handle to a Matlab event function with calling sequence
%              val = events(t, y)
%           The computation stops as soon as a negative value is
%           returned by the event function.
%
% Output
%   t       column-vector holding time stamps
%   y       holds one state vector per row (corresponding
%           to the time stamps)
%
%   Notes:
%       - t and y have the same number of rows.
%
%       - The first element of t should be tspan(1), and the first
%         row of y should be the initial state, y0.
%
%       - If the computation was stopped by the triggering of an event,
%         then the last row of t and y should correspond to the
%         time that linear interpolation indicates for the zero-crossing
%         of the event-function.
%
function [t, y] = MyOde(f, tspan, y0, h, event)

    N = ceil( ( tspan(2) - tspan(1) ) / h ); % max number of time steps
   
    m = length(y0); % Number of state variables
    
    % Initialize output arrays
    t = zeros(N,1);
    y = zeros(N,m);
    
    % To use the function handle stored in f, simply use
    %   f(time, state)
    % where time is a scalar, and state is a column-vector.
    % Similarly, you can call the event function using
    %   event(time, state)
    
    % *** YOUR CODE HERE ***
    for i = 1 : N
        t(i) = tspan(1) + (i-1) * h;
        if i == 1
            y(i,:) = y0.';
        else
            f1 =  f(t(i-1),y(i-1,:).');
            yE = y(i-1,:).' + h * f1;
            f2 = f(t(i),yE);
            y(i,:) = y(i-1,:) + h * ((f1 + f2).' / 2);
        end
        if event(t(i),y(i,:)) < 0
            
            slope = (y(i,2) - y(i-1,2)) / (y(i,1) - y(i-1,1));
            y(i,1) = y(i - 1,1) - event(t(i - 1),y(i - 1,:)) / slope;
            y(i,2) = Ground(y(i,1));
            deltat = (y(i,1) - y(i - 1,1)) / y(i - 1,3);
            
            t(i) = t(i-1) + deltat;
            f1 =  f(t(i-1),y(i-1,:).');
            yE = y(i-1,:).' + deltat * f1;
            f2 = f(t(i),yE);
            y(i,3) = y(i-1,3) + deltat * ((f1(3) + f2(3)) / 2);
            y(i,4) = y(i-1,4) + deltat * ((f1(4) + f2(4)) / 2);
            
            for l = i + 1 : N
                y(l,:) = y(l-1,:);
            end
            break;
        end
    end
end


    
    
    