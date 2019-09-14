%% SVD Image Compression
% An image can be represented as a matrix, and approximated
% using a rank-reduced version of the matrix.  This is all
% made easy using the SVD.  Here's how.

%% Read in the image
A = imread('statue.jpg');
A = double( A(:,:,1) ); % convert to double graylevel
imshow(A,[]); % display it
height = size(A,1);
width = size(A,2);
disp(['Image size is ' num2str(height) 'x' num2str(width)]);
disp(['Image stored using ' num2str(width*height) ' values']);

%% Compute SVD
[U, S, V] = svd(A,0);

%% Reconsruct a rank-k approximation to A
% Make a copy of S with only  k of the largest singular values
k = 5;
Ak = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
imshow(Ak,[])
disp(['Compressed image stored using ' num2str(k*(width+height)) ' values']);
disp([num2str(k*(width+height)/width/height*100) '% of original']);

%% k = 20
k = 20;
Ak = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
imshow(Ak,[])
disp(['Compressed image stored using ' num2str(k*(width+height)) ' values']);
disp([num2str(k*(width+height)/width/height*100) '% of original']);

%% k = 50
k = 50;
Ak = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
imshow(Ak,[])
disp(['Compressed image stored using ' num2str(k*(width+height)) ' values']);
disp([num2str(k*(width+height)/width/height*100) '% of original']);
