% t Time 
% y(:,1) processes of A
% y(:,2) processes of B
% y(:,3) processes of T
% Start at the time of death
deadtime = 11.5;
endtime = 22.43;
[t,y] = ode45(@accumulator,[deadtime, endtime],[1;1;37.5]);
plot(t,y(:,3));
xlabel('Time (t)');
ylabel('Temperature (C)');


% Ambient Temperature 
function [Temperature] = ambient_T(t)
    hours = rem(t,24);
    if (hours > 7.5) && (hours <= 19) 
        Temperature = 22;
    elseif hours > 19 && hours <= 21 
        Temperature = 22 - (hours - 19)/(21 - 19) * (22-16);
    elseif hours > 7 && hours <= 7.5 
        Temperature = 16 + (hours - 7)/(7.5-7) * (22-16);
    else
        Temperature = 16;
    end
end

% First derivative of z
function [dzdt] = accumulator(t,z)

    dzdt = zeros(3,1);
    if z(3) >= 29 && z(3) <= 45
        dzdt(1) = 0.0008*((z(3) - 29)^2)*(1 - exp(0.08*(z(3) - 45)))*z(1)*(50-z(1));
    else 
        dzdt(1) = 0;
    end
    
    if z(3) >= 17 && z(3) <= 27
        dzdt(2) = 0.001*((z(3) - 17)^2)*(1 - exp(0.05*(z(3) - 27)))*z(2)*(50-z(2));
    else
        dzdt(2) = 0;
    end
    
    dzdt(3) = -0.2 * (z(3) - ambient_T(t)) + (z(1) + z(2)) / 100;
end