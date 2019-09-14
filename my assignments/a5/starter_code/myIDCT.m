% function f = myIDCT(Fdct)
%
% Computes the 2-D Inverse Discrete Cosine Transform (IDCT) of input
% array Fdct. It uses an even extension of Fdct, along with the 2D-IDFT.
% This function is the inverse of myDCT.
%
% Input:
%  Fdct is a 2-D array of real values
%
% Output:
%  f is a real-valued array the same size as Fdct
%
function f = myIDCT(Fdct)
    
    % === Replace the code below with your code ===
    Fedct = EvenExtension(Fdct);
    fe = ifft2(Fedct);
    
    f = IEvenExtension(fe);
end
    
    
    