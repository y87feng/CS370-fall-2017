% golf_drive.m

theta = 52;     % Angle of initial velocity (degrees)
S = 40;         % Initial speed (m/s)
tspan = [0 20]; % Set start and end times for computation (seconds)
h = 0.1;        % time step 100ms

% Set up initial state
yStart = [0;0;                   % initial position (0,0)
          S*cos(theta/180*pi);   % x velocity
          S*sin(theta/180*pi)];  % y velocity


%% Call the MyOde numerical solver function

[t,y] = MyOde(@projectile, tspan, yStart, h, @projectile_events);
x = linspace(-10, 180, 300);
hills = Ground(x);
plot(x, hills, 'k-', y(:,1), y(:,2), 'ro-');
hold on

for i = 1 : 4 
    [Tstart, z] = GetSpeedV(t,y,tspan,h);
    tspan(1) = Tstart;
    [t,y] = MyOde(@projectile, tspan, z, h, @projectile_events);
    plot(x, hills, 'k-', y(:,1), y(:,2), 'ro-');
    hold on
end


plot(x, hills, 'k-', y(:,1), y(:,2), 'ro-');
axis([-10 180 -10 50]);
axis equal;
title(['\theta = ' num2str(theta) '^\circ: Golf ball landed at ' num2str(y(end,1)) 'm'], 'FontSize', 14);
xlabel('Distance (m)');
ylabel('Height (m)');
hold off

function [Tstart,z] = GetSpeedV(t,y,tspan,h)
    N = ceil( ( tspan(2) - tspan(1) ) / h );
    z = zeros(4,1);
    for i = 1 : N
        if y(i,3) == y(i + 1,3)  || y(i,4) == y(i+1,4)
            z = y(i,:).';
            Tstart = t(i);
            break;
        end
    end
    slope1 = GroundSlope(z(1));
            
    u = zeros(2,1);
    u(1) = sqrt(1 / (1 + slope1 * slope1));
    u(2) = u(1) * slope1;
    
    U = [-u(2);u(1)];
    
    v = zeros(2,1);
    v(1) = z(3);
    v(2) = z(4);
    V = 0.75*(dot(u,v) * u - dot(v,U) * U);
    z(3) = V(1);
    z(4) = V(2);
end
