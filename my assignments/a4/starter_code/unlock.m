% unlock.m script


% Display grid of 16 circles
[gx, gy] = meshgrid([0 20 40 60], [0 20 40 60]);
plot(gx(:), gy(:),'ko', 'MarkerSize',10);
hold on; % don't erase plot on next plot command


% --- YOUR CODE HERE ---

t = [0,795,1447,2172,2897];
x = [0,27,50,-4,22];
y = [-1,37,27,11,42];
n = length(t);

x_cs = spline(t,x);
y_cs = spline(t,y);

space = linspace(t(1), t(length(t)), 1000);
xx = ppval(space, x_cs);
yy = ppval(space, y_cs);
plot(xx,yy);

plot(x, y, 'o');
