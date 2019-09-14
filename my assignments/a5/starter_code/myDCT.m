% function Fdct = myDCT(f)
%
% Computes the 2-D Discrete Cosine Transform of input image f.
% It uses an even extension of f, along with the 2D-DFT.
% This function is the inverse of myIDCT.
%
% Input:
%  f is a 2-D array of real values
%
% Output:
%  Fdct is a real-valued array the same size as f
%
function Fdct = myDCT(f)

    % === Replace the code below with your code ===
    
    fe = EvenExtension(f);
    DCTfe = fft2(fe);
    
    Fdct = IEvenExtension(DCTfe);
end
