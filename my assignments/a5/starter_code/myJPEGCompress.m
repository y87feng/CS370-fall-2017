% function G = myJPEGCompress(f, T, D)
%
% Input
%    f is the input image, a 2D array of real numbers
%    T is the tile size to break the input image into
%    D is the size of the block of Fourier coefficients to keep
%      (Bigger values of D result in less loss, but less compression)
%
% Output
%    G is the compressed encoding of the image
%
% Example: If f is 120x120, then
%
%    G = myJPEGCompress(f, 10, 4);
%
% would return an array (G) of size 48x48.
%
function G = myJPEGCompress(f, T, D)
	[h,w] = size(f);  % returns the width and height of f
    
    G = zeros(h/T*D,w/T*D);
    % === Replace the code below with your code ===
    for i = 1 : h/T
        for j = 1 : w/T
            Tn = f((i-1)*T+1:i*T,(j-1)*T+1:j*T);
            TDCT = dct2(Tn);
            G((i-1) * D + 1 : i * D,(j-1)*D+1:j*D) = TDCT(1:D,1:D);
        end
    end
    
