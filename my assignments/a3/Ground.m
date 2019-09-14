% function e = Ground(d)
%
% Returns the ground height at horizontal distance d from the golf tee.
%
function e = Ground(d)
    e = 2*(cos(d/4) - 1);
    