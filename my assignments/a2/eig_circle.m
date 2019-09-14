
N = 360;
S = zeros(2,N);

for idx = 1:N
    S(:,idx) = [cosd(idx) ; sind(idx)];
end

figure(1);
plot(S(1,:), S(2,:), '.');
axis equal;

A = 2*rand(2,2)-1;
%A = A'+A;

AS = A * S;

hold on;
plot(AS(1,:), AS(2,:), 'r.');
%hold off;
%

[u,s,v] = svd(A);

plot([0,s(1,1)*u(1,1)], [0,s(1,1)*u(2,1)], 'r');
plot([0,v(1,1)], [0,v(2,1)], 'b');

plot([0,s(2,2)*u(1,2)], [0,s(2,2)*u(2,2)], 'r--');
plot([0,v(1,2)], [0,v(2,2)], 'b--');




hold off;