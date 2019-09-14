% Parametric Curves Demo

t = 0:0.01:1;
s = t;
%s = -(t.^4); % Try this one!
x = cos(2*pi*s); % \ Circle
y = sin(2*pi*s); % /

N = length(t);

figure(1);

for n = 1:N
    subplot(2,2,1); % top-left
    plot(x,y, x(n),y(n),'o'); axis equal;
    a = axis;
    xlabel('x'); ylabel('y');
    
    subplot(2,2,2); % top-right
    plot(t,y, t(n),y(n),'o');
    %axis([s(1) s(end) a(3) a(4)]); % Scale axis to match other plot
    xlabel('t'); ylabel('y');
    
    subplot(2,2,3); % bottom-left
    plot(x,t, x(n),t(n),'o');
    %axis([a(1) a(2) s(1) s(end)]);
    xlabel('x'); ylabel('t');
    
    pause(0.02);
end