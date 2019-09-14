%% Random walk
Init_G; % Set up a graph adjacency matrix in G
N = size(G,1); % number of nodes

alpha = 0.85; % probability of teleportation to a random node is 1-alpha

visits = zeros(N,1); % counts number of visits
numSteps = 100000; % number of steps to take
j = ceil(rand * N); % start at a randomly-choosen node
for t = 1:numSteps
    visits(j) = visits(j) + 1;
    outLinks = find(G(:,j)==1);
    numOutLinks = length(outLinks);

    if (rand < alpha)
        if numOutLinks~=0
            j = outLinks( ceil(rand*numOutLinks) ); % choose outlink randomly
        else
            % teleport to a random node
            j = randi(N); % randomly choose a node
            disp('No outlinks -- teleportation');
        end
    else 
        % teleport to any random node
        j = randi(N); % randomly choose one the the nodes from 1 to N
        disp('Teleportation to any random node');
    end
end

%stem(1:N, visits);
subplot(1,3,3);
stem(1:N, visits, 'g');
ylabel('Number of Visits');
xlabel('Node');
