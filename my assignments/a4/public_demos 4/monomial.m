% Monomial Interpolation

% Demonstrates monomial interpolation, and its problems.

% Here are our data points
% The apostrophe (') is the transpose operator, so the vectors
% x and y below are actually column vectors.
demo = 1;
if demo==1
    N = 5;
    x = linspace(0,5,N);
    y = rand(N,1);
elseif demo==2
    x = (1:10)';
    %x(5) = 5.75; % change from 5 to 5.9
    y = [zeros(5,1) ; ones(5,1)];
end

figure(1);
plot(x,y,'o');
axis([x(1) x(end) -1 2]);

%% Compute the monomial interpolant
n = length(x);  % get number of points

V = vander(x);  % Create Vandermonde matrix
                % type "help vander" for more info

c = V \ y;  % Solve the system

%% From here down, it's just plotting the polynomial.

% Create a bunch of x-values
xx = linspace(x(1),x(n),100)';

% Get last n cols of vander(xx)
VV = vander(xx);
VV = VV(:,(100-n+1):100);
yy = VV * c;  % eval polynomial at new x-values

% Plot original pts, and polynomial
figure(1);
plot(x,y,'o', xx,yy);
title('Monomial Interpolation');

%% But doesn't it look better just joining the dots?
hold on;
plot(x,y, 'r--');
hold off;
