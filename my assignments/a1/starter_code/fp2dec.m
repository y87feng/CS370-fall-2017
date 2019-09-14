function x = fp2dec(B)
    % function x = fp2dec(B)
    %
    % Converts the string B to a decimal value (double-precision).
    % Examples:
    % fp2dec('+0.11000b1')  ->  1.5
    % fp2dec('-0.10101b-2') -> -0.164062500000000
    % fp2dec('-0.101b5')    -> -20
    
    x = 0;
    