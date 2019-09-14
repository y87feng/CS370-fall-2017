function M = dftMatrix(N)

    W = exp(2i*pi/N);
    
    M = zeros(N,N);
    
    for n = 0:(N-1)
        for k = 0:(N-1)
            
            M(k+1,n+1) = W^(-n*k);
            
        end
    end
    
    