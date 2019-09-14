
% image_compression.m

f = imread('./house.jpg');
f = double(f(:,:,1));

T = 25;


%% Display the reconstructed compressed images
figure(1);

D = 3;
G = myJPEGCompress(f, T, D);
fc = myJPEGDecompress(G, T, D);
subplot(2,2,1);  % top-left in a 2x2 grid of images
imshow(fc, [0 255]);
title(['Compression Ratio = ' num2str((T/D)^2) ':1']);

% ==== Complete the script below ====
D = 5;
G = myJPEGCompress(f, T, D);
fc = myJPEGDecompress(G, T, D);
subplot(2,2,2);  % top-right
imshow(fc, [0 255]);
title(['Compression Ratio = ' num2str((T/D)^2) ':1']);


D = 8;
G = myJPEGCompress(f, T, D);
fc = myJPEGDecompress(G, T, D);
subplot(2,2,3);  % bottom-left
imshow(fc, [0 255]);
title(['Compression Ratio = ' num2str((T/D)^2) ':1']);

D = 11;
G = myJPEGCompress(f, T, D);
fc = myJPEGDecompress(G, T, D);
subplot(2,2,4);  % bottom-right
imshow(fc, [0 255]);
title(['Compression Ratio = ' num2str((T/D)^2) ':1']);