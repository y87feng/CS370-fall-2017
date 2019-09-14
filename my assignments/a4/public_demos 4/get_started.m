
% STEP 1: Draw curve (not shown here)
imshow(imread('spade.jpg'),[]);

% Run ginput. Click on some points, then press ENTER
% when you are done.
[Sx Sy] = ginput;

hold on;
plot(Sx, Sy, 'o');
xlabel('x'); ylabel('y');
