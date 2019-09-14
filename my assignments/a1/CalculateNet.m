% function net = CalculateNet(credit, debit)
%
% Add together the credits and debits to get the net income.
%
% Input
%   credit:  An array of positive values
%   debit:   An array of negative values
%
% Output
%   net:     The result from adding up all the credits and debits
%
function net = CalculateNet(credit, debit)

    N = length(credit);

    scredit = sort(credit, 1, 'ascend');
    sdebit = -sort(abs(debit), 1, 'ascend');

    % Method A
    netA = sum(credit) + sum(debit);
    
    % Method B
    netB = sum(credit);
    for idx = 1:N
        netB = netB + sdebit(idx);
    end

    % Method C
    netC = 0;
    for idx = 1:N
        netC = netC + (scredit(idx) + sdebit(idx));
    end
    disp(netA);
    disp(netB);
    disp(netC);
    net = min([netA netB netC]);
    

