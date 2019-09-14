
% PCA example

y1 = [4 2 3]';
y2 = [-1 1 0]';
y1 = y1 / norm(y1);
y2 = y2 / norm(y2);

n_points = 500;

A = zeros(3,n_points);

for n = 1:n_points
    A(:,n) = randn*2*y1 + randn*y2 + randn(3,1)/4;
end

plot3(A(1,:),A(2,:),A(3,:),'r.');

disp('Hit ENTER to continue');
pause;

k = 2;

[U S V] = svd(A,0);
Uk = U(:,1:k);
Sk = S(1:k,1:k);
Vk = V(:,1:k);
Ak = Uk * Sk * Vk';
hold on;
plot3(Ak(1,:),Ak(2,:),Ak(3,:),'b.');
hold off;

disp('Hit ENTER to continue');
pause;

C = U' * A;
plot(C(1,:),C(2,:),'.')
axis equal;
