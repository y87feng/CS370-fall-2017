% Lagrange interpolation demo
% This code is quite yucky, so just run it.

% Data points - feel free to change these, but
% keep it at 5 points.
x = [1 3 4 5 6];
y = [-3 6 3 2 5];

% Create an array of 100 x-values in the range x(1) to x(5)
xx = linspace(x(1), x(5), 100);

N = (xx-x(2)).*(xx-x(3)).*(xx-x(4)).*(xx-x(5)); %Numerator
D = (x(1)-x(2)).*(x(1)-x(3)).*(x(1)-x(4)).*(x(1)-x(5)); %Denominator
L1 = N / D;

N = (xx-x(1)).*(xx-x(3)).*(xx-x(4)).*(xx-x(5));
D = (x(2)-x(1)).*(x(2)-x(3)).*(x(2)-x(4)).*(x(2)-x(5));
L2 = N / D;

N = (xx-x(1)).*(xx-x(2)).*(xx-x(4)).*(xx-x(5));
D = (x(3)-x(1)).*(x(3)-x(2)).*(x(3)-x(4)).*(x(3)-x(5));
L3 = N / D;

N = (xx-x(1)).*(xx-x(2)).*(xx-x(3)).*(xx-x(5));
D = (x(4)-x(1)).*(x(4)-x(2)).*(x(4)-x(3)).*(x(4)-x(5));
L4 = N / D;

N = (xx-x(1)).*(xx-x(2)).*(xx-x(3)).*(xx-x(4));
D = (x(5)-x(1)).*(x(5)-x(2)).*(x(5)-x(3)).*(x(5)-x(4));
L5 = N / D;

% This is just to plot an x-axis
xa = [x(1) x(5)]; ya = [0 0];

figure(1)
%                     polynomial     points    x-axis
subplot(5,1,1); plot(xx,y(1)*L1,'-', x,y,'o', xa,ya,'k-'); ylabel('L_1(x)');
title('Lagrange Basis Functions');
subplot(5,1,2); plot(xx,y(2)*L2,'-a', x,y,'o', xa,ya,'k-'); ylabel('L_2(x)');
subplot(5,1,3); plot(xx,y(3)*L3,'-', x,y,'o', xa,ya,'k-'); ylabel('L_3(x)');
subplot(5,1,4); plot(xx,y(4)*L4,'-', x,y,'o', xa,ya,'k-'); ylabel('L_4(x)');
subplot(5,1,5); plot(xx,y(5)*L5,'-', x,y,'o', xa,ya,'k-'); ylabel('L_5(x)');

figure(2)
L = y(1)*L1 + y(2)*L2 + y(3)*L3 + y(4)*L4 + y(5)*L5;
plot(xx,L,'-', x,y,'o');
title('Interpolating Polynomial');
