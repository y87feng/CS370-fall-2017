% function f = IEvenExtension(fe)
%
% Reverses the action of an even extension.
%
% Input:
%   fe is a 2D array, assumed to contain an even extension
%
% Output:
%   f is the sub-array that was used to generate the extension
%
% If fe has dimensions KxL, then f has dimensions
%    ceil((K+1)/2) x ceil((L+1)/2)
% For example, if fe is 8x6, then f is 5x4.
%
% IEvenExtension is the inverse of EvenExtension, so that
%    IEvenExtension(EvenExtension(f)) == f
% for any matrix f.
%
function f = IEvenExtension(fe)
    e_dims = size(fe);
    dims = ceil((e_dims+1)/2);
    f = fe(1:dims(1),1:dims(2));