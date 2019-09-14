% Simple Fourier Demonstration

%% Convolution
% We will convolve an image with two implulses.

%% Let's create an image with 2 impulses.
f = zeros(256,256);
f(5,1) = 1;
%f(20,100) = 2;
figure(1);
imshow(f,[]);

%% Read in an image to play with
g = imread('pd.jpg');
g = double( g(:,:,1) ); % converts to floating-pt graylevel
figure(2), imshow(g, []), title('MRI');

%% And convolve
F = fft2(f);  % 2D-DFT of f
G = fft2(g);  % 2D-DFT of g
H = F .* G;   % element-wise multiplication
h = ifft2(H); % inverse 2D-DFT of H

figure(3), imshow(real(h), []), title('Convolution Image');

%% This is a good way to view Fourier coefficients

figure(4);
imshow( fftshift( log(abs(G)) ), []);






