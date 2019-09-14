%% Signal Processing Demo 1
clear all;

% Load squeeling pig sound
%[f freq nbits] = wavread('pig.wav');

%% Load Handel's Hallelujah Chorus
load handel;
f = y;
freq = Fs;
clear y Fs;

N = length(f);
L = N / freq;  % Clip duration in seconds
t = ( 0:(N-1) )' * L/N;  % Time axis labels
omega = ( 0:(N-1) )' / L;  % Frequency axis labels
shifted_omega = omega - floor(N/2)/L; % put 0 in middle of axis


%% Choose a frequency threshold
tau = 1200;  % Threshold frequency

%% Compute the DFT
F = fftshift( fft(f) );

%% Extract the high frequencies (above tau)
mask = abs(shifted_omega)>=tau;
F_highpass = F .* mask;

%% Extract the low frequencies (below tau)
F_lowpass = F .* (1-mask);

%% Plot the frequency decomposition
figure(2);
subplot(3,1,1); plot(shifted_omega, abs(F)); title('Original');
subplot(3,1,2); plot(shifted_omega, abs(F_lowpass)); title('Low-Pass');
subplot(3,1,3); plot(shifted_omega, abs(F_highpass)); title('High-Pass');

%% Reconstruct the low-pass and high-pass signals
f_lowpass = ifft(ifftshift(F_lowpass));
f_highpass = ifft(ifftshift(F_highpass));

%% Play the sounds
% To hear them, download and play the files
%   oroginal.au
%   lowpass.au
%   highpass.au
sound(f, freq);
%auwrite(f, freq, 'original.au');

%% Lowpass
sound(real(f_lowpass), freq);
%auwrite(f_lowpass, freq, 'lowpass.au');

%% Highpass
sound(real(f_highpass), freq);
%auwrite(f_highpass, freq, 'highpass.au');

%% Shift some voices to different frequencies
Fshift = F;
% Freq range to shift (Hz)
tau1 = 50; tau2 = 1200;
shift_Hz = 400; % Hz
shift = round(shift_Hz * L);

% Shift positive frequencies
idx = find((shifted_omega>=tau1)&(shifted_omega<=tau2));
Fshift(idx+shift) = F(idx);

% Shift negative frequencies
idx = find((shifted_omega<=-tau1)&(shifted_omega>=-tau2));
Fshift(idx-shift) = F(idx);

% Plot
subplot(2,1,1), plot(shifted_omega, abs(F));
subplot(2,1,2), plot(shifted_omega,abs(Fshift))
f_shift = ifft(ifftshift(Fshift));

%% Play hideous sound
sound(real(f_shift), freq);
%auwrite(f_shift, freq, 'shift.au');
