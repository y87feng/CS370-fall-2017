% dftMatrix_demo.m

%% Create the matrix

N = 64;
M = dftMatrix(N);

disp(M)

%% Inverse DFT

iM = conj(M)/N;
disp(iM)

%% Check that they are inverses.
disp(M*iM)
