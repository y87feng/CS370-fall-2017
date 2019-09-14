function b = randfp(t, L, U)
    % function b = randfp(t, L, U)
    %
    % Generate a random normalized binary floating-point number with
    % t digits, and an exponent in the range [L,U]. For example,
    %
    %   b = randfp(5, -4, 4)
    %
    % might yield
    %
    %   b = '-0.10111b-2'
    %
    % or
    %
    %   b = '+0.11100b4'
    %
    % Note that the output is a string, and that the first character is
    % always either a '+' or '-'. The number after the 'b' is
    % the exponent for the base 2, although the exponent itself is
    % represented in base-10. For example,
    %
    %   b = '+0.11100b4'
    %
    % represents the number 0.11100 x 2^4.
    %
    
    % ==== Replace the code below ====
    m = randi([0,1], 1,t+1);
    
    for d = 1 : t + 1
        if d == 1
            if m(1,d) == 0
                b = '-0.';
            else 
                b = '+0.';
            end
        elseif d == 2
            b = [b num2str(1)];
        else
            b = [b num2str(m(1,d))];
        end
    end
    
    r = randi([L,U], 1,1);
    
    b = [b 'b' num2str(r(1,1))];
    
    

