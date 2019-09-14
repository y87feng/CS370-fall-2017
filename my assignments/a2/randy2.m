%% Random walk
Init_G; % Set up a graph adjacency matrix in G
N = size(G,1); % number of nodes

visits = zeros(N,1); % counts number of visits
numSteps = 100000; % number of steps to take
j = ceil(rand * N); % start at a randomly-choosen node
for t = 1:numSteps
    visits(j) = visits(j) + 1;
    outLinks = find(G(:,j)==1);
    numOutLinks = length(outLinks);
    
    if numOutLinks~=0
        j = outLinks( ceil(rand*numOutLinks) ); % choose outlink randomly
    else
        % teleport to a random node
        j = randi(N); % randomly choose a node
        disp('No outlinks -- teleportation');
    end
end

subplot(1,3,2);
stem(1:N, visits);
ylabel('Number of Visits');
xlabel('Node');
    