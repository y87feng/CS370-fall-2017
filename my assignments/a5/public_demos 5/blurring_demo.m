%% Simple Fourier demos

f = imread('house.jpg');
f = double(f(:,:,1));

figure(1);
imshow(f, []);

%% Take the 2-D DFT

F = fft2(f);

figure(2);
imshow(log(abs(F)), []);

%% Set some Fourier coefficients to zero

G = F;
tau = 50;
G(tau:(end-tau+1),:) = 0;
G(:,tau:(end-tau+1)) = 0;

figure(3);
imshow(log(abs(G)), []);

%% Reconstruct the resulting image

g = ifft2(G);
figure(4);
imshow(real(g), []);



%