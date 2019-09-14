function y = dec2fp(x_orig, t, L, U)
    % function b = dec2fp(x, t, L, U)
    %
    % Converts the number x to a binary floating-point representation,
    % rounding to t digits, and L and U as the lower and upper bounds on
    % the exponent.

    digits = 0;
    
    x = x_orig;
    
    if x==0
        y = '+0.';
        for k = 1:t
            y = [y '0'];
        end
        y = [y 'b0'];
        return
    elseif x==Inf
        y = 'Inf';
        return
    elseif x==-Inf
        y = '-Inf';
        return
    elseif isnan(x)
        y = 'NaN';
        return
    end
    
    if x<0
        x = -x;
        bx = '-0.';
    else
        bx = '+0.';
    end
    
    if x>=1
        myexp = 0;
        while x>=1
            x = x / 2;
            myexp = myexp + 1;
        end
    else
        myexp = 1;
        while x<1
            x = x * 2;
            myexp = myexp - 1;
        end
        x = x / 2;
    end
        
    remainder = x - floor(x);
    
    for d = digits+1:t
        remainder = remainder * 2;
        if remainder>=1
            bx = [bx '1'];
            remainder = remainder - 1;
        else
            bx = [bx '0'];
        end
    end
    
    
    % Round according to the last digit
    if remainder>=0.5
        roundup = 1;
    else
        roundup = 0;
    end
    
    bx = [bx 'b' num2str(myexp)];
    
    if roundup
        delta = bx;
        delta(4:3+t-1) = '0';
        delta(3+t) = '1';
        bx_up = fpMath(bx, delta, @(z1,z2) z1+z2, t, L, U);
        bx = bx_up;
    end
    
    y = bx;
    
    if myexp>U
        y = 'overflow';
    elseif myexp<L
        y = 0.;
    end
    
    

