% function f = myJPEGDecompress(G, T, D)
%
% Input
%    G is the compressed encoding, a 2D array of real numbers
%    T is the tile size for reassembling the decompressed image
%    D is the size of the blocks of Fourier coefficients that were
%      kept when the image was compressed
%      (Bigger values of D result in less loss, but less compression)
%
% Output
%    f is the decompressed, reconstructed image
%
% Example: If G is 48x48, then
%
%    f = myJPEGDecompress(G, 10, 4);
%
% would return an array (f) of size 120x120.
%
function f = myJPEGDecompress(G, T, D)

    % === Replace the code below with your code ===
    [h,w] = size(G);
    f = zeros(h/D*T,w/D*T);
  
    for i = 1 : h/D
        for j = 1 : w/D
            Tn = G((i-1)*D+1:i*D,(j-1)*D+1:j*D);
            f((i-1) * T + 1 : (i-1) * T + D,(j-1)*T+1:(j-1)*T+D) = Tn(1:D,1:D);
            fT = f((i-1)*T+1:i*T,(j-1)*T+1:j*T);
            IDCT = idct2(fT);
            f((i-1)*T+1:i*T,(j-1)*T+1:j*T) = IDCT;
        end
    end
    
