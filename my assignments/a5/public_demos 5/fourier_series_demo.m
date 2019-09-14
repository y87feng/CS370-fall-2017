%% Fourier Series Demonstration

%#############################
%
%  RUN IT AND PRESS ANY BUTTON
%
%#############################

%% Create a step function
f = [ones(1,64) zeros(1,64)];
figure(1); plot([f f]);
axis([1 256 -0.5 1.5]);  % Set axis limits manually
title('Step Function');

%% DFT of f
F = fft(f);
figure(2); plot(log(abs(F)+1));
title('Modulus of Fourier Coefficients');

%% Reconstruct f using more and more Fourier coefficients
figure(2);
for m = 1:8:(length(f)/2+1)
    
    G = F; % Copy Fourier coefficients
    G((m+1):(end-m)) = 0; % Set all but the first m to 0
    g = ifft(G); % inverst DFT
    
    %figure;
    plot(real([g g]));
    axis([1 256 -0.5 1.5]);  % Set axis limits manually
    title([num2str(min(2*m,length(f))) ' coefficients']); % add title
    drawnow;
    %pause(1/m+0.5); % pause for 1/m seconds
    pause
end


%% Draw some of the contibuting trig functions

figure(3); hold on;
for m = 1:1:10
    
    G = zeros(size(F));
    G(m) = F(m); % Set all but the first m to 0
    g = ifft(G); % inverst DFT
    
    %figure;
    plot(real([g g]), 'Color', 0.75*[1 1 1]);
    axis([1 256 -0.5 1.5]);  % Set axis limits manually
end
plot([f f]);
hold off;
