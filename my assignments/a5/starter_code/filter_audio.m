%% filter_audio.m

%Load some audio
blah = importdata('recording.wav');
f = blah.data;        % Rename the variables to our liking
Omega = blah.fs;      % Sampling rate (samples per second, or Hz)
clear blah;           % We don't need this anymore

% Derive some useful variables
N = length(f);             % Number of samples
L = N / Omega;             % Clip duration in seconds
t = ( 0:(N-1) )' * L/N;    % Time axis labels
% array of frequencies correspongding to the Fourier coefficients
omega = ifftshift( (-N/2):(N/2 - 1) )' / L;

% Plot time domain signal f
figure(1);
plot(t,f); title('Sound');
xlabel('Time (seconds)');
ylabel('Amplitude');


%% Listen to the sound

% If you are running Matlab locally, you can play the sound using
%   sound(f, Omega);
% You can also save a wav file and download and listen to it.


%% === YOUR CODE HERE ===

%% (a)
figure(2);
F = fft(f);
plot(omega,abs(F));
xlabel('Freq. Index'); title('DFT of signal');
ylabel('Modulus');

%% (b)
figure(3);
G = F;
T = 10000; % keep indices -T through T
G((1+T):(end-T+1)) = 0;
plot(omega,abs(G)); title('DFT of compressed signal');
xlabel('Freq. Index');
ylabel('Modulus');

%% (c)
figure(4);
newf = ifft(G);
plot(t,newf); title('Sound');
xlabel('Time (seconds)');
ylabel('Amplitude');

audiowrite('sound_file.wav', real(newf), Omega);
%% (d)
"Robert, he dead, I killed them."