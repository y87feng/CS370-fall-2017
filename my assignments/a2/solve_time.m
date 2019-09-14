%
% solve_time.m
%
% Solve NxN systems using 2 methods, for various sizes of N.

Ns = 10:1:200;
M = 20;

% Store the timing results here
t_method1 = zeros(size(Ns));
t_method2 = zeros(size(Ns));

idx = 1;

% Loop over N-values (for both methods)
% Generate random A and B

for N = Ns
    % Generate random matrices
    A = rand(N);
    B = rand(N,M);
    X = zeros(size(B)); % allocate space for X
    
    
    % === Method 1 ===
    tic;
    
    % *** YOUR CODE HERE ***
    for i = 1 : M
        X(:,i) = A\B(:,i);
    end
    % Solve the M vector systems individually using \
    
    t_method1(idx) = toc;  % [1] Use tic and toc
    
    
    % === Method 2 ===
    tic;
    
    % *** YOUR CODE HERE ***
    [L,U,P] = lu(A);
    I = L*U;
    for i = 1 : M
        Y = P*B(:,i);
        X(:,i) = I\Y;
    end
    % Compute LU factorization, then use it to solve each of the M vector
    % systems.
    
    t_method2(idx) = toc;
    
    
    idx = idx + 1;
    
end


%% Plot

% Plot both lines on one axis.
% Be sure to label your plot.

plot(t_method1);
hold on
plot(t_method2);
xlabel('size');
ylabel('times');

