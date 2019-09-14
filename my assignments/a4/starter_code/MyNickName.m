x1 = [446.2966,441.2783,372.6942, 300.7645];
y1 = [-461.3517, -625.2844,-713.9419,-633.6483];


x2 = [543.0000,543.0000,591.0000 ,645.0000,652.0000,656.0000,674.0000];
y2 = [-604.0000,-654.0000, -688.0000,-642.0000,-603.0000,-663.0000,-672.0000];

x3 = [806.0000,793.0000,797.0000,839.0000, 865.0000];
y3 = [-500.0000,-599.0000,-676.0000,-669.0000,-637.0000];

x4 = [1015,1003,1025,1057,1070,1070,1036,995,1003];
y4 = [-548,-633,-636,-605,-537,-741,-781,-750,-703];

[x_cs, y_cs, t] = ParametricSpline(x1, y1);
space = linspace(t(1), t(length(t)), 1000);
xx = ppval(space, x_cs);
yy = ppval(space, y_cs);
plot(xx,yy); axis equal;
hold on;
plot(x1, y1, 'o');

[x_cs, y_cs, t] = ParametricSpline(x2, y2);
space = linspace(t(1), t(length(t)), 1000);
xx = ppval(space, x_cs);
yy = ppval(space, y_cs);
plot(xx,yy); axis equal;
hold on;
plot(x2, y2, 'o');

[x_cs, y_cs, t] = ParametricSpline(x3, y3);
space = linspace(t(1), t(length(t)), 1000);
xx = ppval(space, x_cs);
yy = ppval(space, y_cs);
plot(xx,yy); axis equal;
hold on;
plot(x3, y3, 'o');

[x_cs, y_cs, t] = ParametricSpline(x4, y4);
space = linspace(t(1), t(length(t)), 1000);
xx = ppval(space, x_cs);
yy = ppval(space, y_cs);
plot(xx,yy); axis equal;
hold on;
plot(x4, y4, 'o');
hold off