f = zeros(12,12);
k = 1;
for i = 1:12
    for j = 1:12
        f(i,j) = k;
        k = k + 1;
    end
end