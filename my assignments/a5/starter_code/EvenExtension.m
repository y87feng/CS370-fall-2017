% function fe = EvenExtension(f)
%
% Performs an even extension on the array f.
%
% Input:
%   f is a 2D array
%
% Output:
%   fe is the even extension of f
%
% If f has dimensions NxM, then fe has dimensions
%    (2*N-2)x(2*M-2)
% and fe(n,j)=fe(2*N-n,j) for k=2,...,N
% and fe(n,j)=fe(n,2*M-j) for j=2,...,M
%
% For example, if f is 5x4, then fe has dimensions 8x6.
%
% IEvenExtension is the inverse of EvenExtension, so that
%    IEvenExtension(EvenExtension(f)) == f
% for any matrix f.
%
function fe = EvenExtension(f)
    fe = [f fliplr(f(:,2:end-1))];
    fe = [fe ; flipud(fe(2:end-1,:))];

    % An alternative even extension
    %fe = [f fliplr(f(:,2:end))];
    %fe = [fe ; flipud(fe(2:end,:))];

    
