%% Random walk
Init_G; % Set up a graph adjacency matrix in G
N = size(G,1); % number of nodes
visits = zeros(N,1); % counts number of visits

numSteps = 100000; % number of steps to take
j = ceil(rand * N); % start at a randomly-choosen node

for t = 1:numSteps
    visits(j) = visits(j) + 1; % increment counter for node j
    outLinks = find(G(:,j)==1); % list outgoing links for node j
    numOutLinks = length(outLinks);
    
    if numOutLinks~=0
        j = outLinks( ceil(rand*numOutLinks) ); % choose one randomly
    end
end

subplot(1,2,1);
stem(1:N, visits, 'r');
ylabel('Number of Visits');
xlabel('Node');