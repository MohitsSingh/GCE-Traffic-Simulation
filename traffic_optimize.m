adj_mat = xlsread('gce traffic network weight punish.xlsx', 'B2:AO41');
[~, labels, ~] = xlsread('gce traffic network weight punish.xlsx', 'A2:A41');
adj_mat(isnan(adj_mat)) = 0;

rooms = [17, 18, 35, 36, 38, 39];

G = graph(adj_mat, labels);

global traffic;
traffic = zeros(numedges(G), 1);

combinations = nchoosek(rooms, 3);

scores = zeros(size(combinations, 1), 1);

for i = 1:size(combinations, 1)
    paths = combinations(i, :);
    
    new_graph = G;
    
    new_graph = addPeople(new_graph, paths(1), paths(2), 10);
    new_graph = addPeople(new_graph, paths(2), paths(3), 10);
    new_graph = addPeople(new_graph, paths(3), paths(1), 10);
    
    new_graph.Edges.Weight = new_graph.Edges.Weight .* traffic;
    
%     W = new_graph.Edges.Weight( new_graph.Edges.Weight > 3 );

    score = sum(new_graph.Edges.Weight);
    scores(i) = score;
    
    % reset traffic
    traffic = zeros(numedges(G), 1);
end

traffic( traffic == 0 ) = 1;

p = plot(G, 'EdgeLabel', G.Edges.Weight, 'LineWidth', G.Edges.Weight./8);
