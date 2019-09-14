%% Compression of a 1D signal demo

%% First we'll read in some data
img = imread('pd.jpg');
f = double(img(128,:,1));
N = length(f); t = 1:N;
plot(t,f); title('Original signal');

%% Calculate the Discrete Fourier Transform
F = fft(f);
plot(abs(F)); title('DFT of signal');
xlabel('Freq. Index'); ylabel('Modulus');

%% Calculate the Discrete Fourier Transform
F = fft(f);
plot(t-ceil((N+1)/2),fftshift(abs(F))); title('DFT of signal');
xlabel('Freq. Index'); ylabel('Modulus');

%% Set most of the (high frequency) coefficients to zero
T = 15; % keep indices -T through T
G = F;
G((1+T):(end-T+1)) = 0;
plot(t-ceil((N+1)/2),fftshift(abs(G))); title('DFT of compressed signal');
xlabel('Freq. Index'); ylabel('Modulus');

%% Reconstruct the approximation to the signal using the Inverse DFT
g = ifft(G);
plot(t,f, 'b', 'LineWidth', 1);
hold on;
plot(t,real(g),'r','LineWidth',2); title('Reconstruction of compressed signal');
xlabel('Spatial Index'); hold off;

%% Now let's try removing the smaller Fourier coefficients
mask = (abs(F)>0.06994e04); % create a mask
sum(mask(:)) % How many elements are in the mask

%% Apply the mask to our Fourier coefficients
G = mask .* F;
plot(t-ceil((N+1)/2),fftshift(abs(G))); title('DFT of compressed signal');
xlabel('Freq. Index'); ylabel('Modulus');

%% And reconstruct
g = ifft(G);
plot(t,f, t,real(g),'r'); title('Reconstruction of compressed signal');
xlabel('Spatial Index');
