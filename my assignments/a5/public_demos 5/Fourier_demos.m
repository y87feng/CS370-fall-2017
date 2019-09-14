%% Fourier Theory Demonstrations
% CS 473 / CM 473 / CS 673

%% What do Fourier basis functions look like in 2D?

F = zeros(256);
F(4,1) = 1;
F(1,5) = -1;
F(14,37) = 1;
F(7,2) = -2;
f = ifft2(F);
figure(1);
subplot(1,2,1), imshow(F, []);
subplot(1,2,2), imshow(real(f), []);

%% Convolution
% We will convolve a circle with two implulses.

%% First, let's create a circle.
[x,y] = meshgrid(-128:127, -128:127);
d = x.^2 + y.^2;
circle = (d<20);
circle = fftshift(circle); % centre circle at (1,1)
figure(2)
subplot(1,3,1), imshow(circle, []), title('Original Circle');

%% And now an image with 2 impulses.
f = zeros(256,256);
f(50,100) = 1;
f(50,105) = 3;
f(68, 102) = 4;
subplot(1,3,2), imshow(f,[]);

%% And convolve
g = ifft2( fft2(f) .* fft2(circle) );
subplot(1,3,3), imshow(real(g), []), title('Circle convolved with 2 spikes');


%% Read in an image to play with
f = imread('pd.jpg');
f = double( f(:,:,1) ); % converts to floating-pt
F = ifftshift( fft2( fftshift(f) ) );
figure(2), imshow(f, []), title('Original image');

%% Registration using Correlation Coefficient
f = imread('pd.jpg');
f = double( f(:,:,1) ); % converts to floating-pt
true_shift = [29 15]; %round(rand(1,2)*30);
g = circshift(f, true_shift);

imshow(f+g, []);

%% Compute CC
H = fft2(g) .* conj(fft2(f));
h = real( ifft2(H) );
imshow(real(h), []);

%% Shift f by the location of the max, minus [1 1]
f2 = circshift(f, true_shift);
imshow(f2, []);

%% Difference image... should be blank
imshow(abs(g-f2), []);

%% Scaling
% Image scaling can be done by padding and cropping the image/frequency
% domains.  We will blow up our image by a factor of 2 by zero-padding the
% frequency domain.  This effectively makes the sample spacing in the freq.
% domain twice as high (since the FOV is assumed to be fixed).
G = padarray(F, [128 128], 'both');
g = ifftshift( ifft2( fftshift(G) ) );
g = g(128:(end-127),128:(end-127)); % remove the padding we added before
imshow(g,[]);


%% Fourier Shift Theorem
% Let's translate an image by manipulating its Fourier Transform.

% We'll re-use x from the convolution demo.
d = 100; % This is our desired shift
ramp = exp(-2*pi*1i*x*d/256);

G = ramp .* F;
g = ifftshift( ifft2( fftshift(G) ) );

figure(2), imshow(real(g),[]), title(['Shifted by ' num2str(d) ' pixels']);


%% Rotation
% We will rotate an image by rotating its Fourier Transform.

theta = 30;
G = imrotate(F, theta, 'bicubic', 'crop');
g = ifftshift( ifft2( fftshift(G) ) );
figure(1), imshow(real(g), []), title(['Rotated by ' num2str(theta) ' degrees']);


%% Fourier Projection Theorem
% Let's project vertically onto the x-axis
fsum = sum(f); % by default, "sum" does column sums

% I happen to know that in a 256x256 image, the centre pixel is at index
% (129,129).
Frow129 = F(129,:); % extract 129th row
f2 = ifftshift( ifft( fftshift(Frow129) ) ); % 1D FFT

% Plot them both. We'll shift up the blue curve so that we can see both
% curves.
figure(1), plot(0:255,fsum,'r-', 0:255,real(f2)+5e2,'b-');
title('fsum and f2');




