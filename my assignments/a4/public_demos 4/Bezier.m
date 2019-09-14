
function b = Bezier(i,N,t)

    b = nchoosek(N,i) * t.^i .* (1-t).^(N-i);