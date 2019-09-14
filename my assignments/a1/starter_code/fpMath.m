function b = fpMath(b1, b2, fcn, t, L, U)
    % b = fpMath(b1, b2, fcn, t, L, U)
    %
    % Performs a binary arithmetic operation.
    % b1 and b2 are the input binary strings, from F(2, t, L, U)
    % fcn is a function that takes 2 inputs, and returns a value.
    % t, L, and U specify the FPNS.
    %
    % The output is a binary string for the nearest value in F(2, t, L, U).
    %
    % For example,
    %
    %  fpMath('+0.11b2', '+0.10b1', @(z1,z2) z1-z2, 2, -5, 5)
    %
    % would perform subtraction, and return the string '+0.10b2'.
    %

    x1 = fp2dec(b1);
    x2 = fp2dec(b2);
    
    y = fcn(x1, x2);
    
    b = dec2fp(y, t, L, U);

end