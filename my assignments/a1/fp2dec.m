function x = fp2dec(B)
    % function x = fp2dec(B)
    %
    % Converts the string B to a decimal value (double-precision).
    % Examples:
    % fp2dec('+0.11000b1')  ->  1.5
    % fp2dec('-0.10101b-2') -> -0.164062500000000
    % fp2dec('-0.101b5')    -> -20
    l = strfind(B,'b');
    expo = 0;
    decimal = 0.0;
    sum = 0.0;
    
    for i = 4:l - 1
        expo = expo + 1;
        decimal = str2num(B(i));
        for d = 1:expo
            decimal = decimal / 2;
        end
        sum = sum + decimal;
    end
    expopart = str2num(B(l+1:end));
    
    if expopart >= 0
        for i = 1:expopart
            sum = sum * 2;
        end
    else  
        for i = 1:-expopart
            sum = sum / 2;
        end
    end
    
    if B(1) == '+'
        x = sum;
    else
        x = -sum;
    end
    
    
   