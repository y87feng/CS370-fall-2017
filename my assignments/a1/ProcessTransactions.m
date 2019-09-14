%% Get a set of transactions (10,000 of each)

[credit, debit] = ReceiveTransactions();


%% Call the function that computes the net income

calc_net = CalculateNet(credit, debit);

disp(['Net income: ' num2str(calc_net)])

