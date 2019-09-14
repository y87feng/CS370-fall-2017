% Revisit the monomial interpolation case,
% but using splines.
n = 10;
x = (1:n); % + 110;
y = [zeros(1,5) ones(1,5)];
%y(end) = 0;
%x(5) = 5.999;

figure(1);
plot(x,y,'o');
axis([x(1) x(end) -1 2]);

y_cs = spline(x, y); % Clamped to 0

xx = linspace(x(1),x(n),500)';

yy = ppval(y_cs, xx);

hold on;
plot(xx, yy, 'r');
hold off;


%% Another set of samples

x = [3 4 6 7 9 11] + 100; % unevenly spaced
n = length(x);
y = rand(1,n); % whatever

figure(1);
plot(x,y,'o');
%axis([x(1) x(end) -1 2]);

%% Create and draw the spline

y_cs = spline(x, [1 y 0]); % Clamped
%y_cs = csape(x, [0 y 0], 'second'); 
%y_cs = csape(x, [y], 'not-a-knot'); 

xx = linspace(x(1),x(n),100)';

yy = ppval(y_cs, xx);

hold on;
plot(xx, yy, 'color', rand(1,3));
hold off;




%