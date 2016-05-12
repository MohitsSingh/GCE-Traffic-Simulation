adj_mat = xlsread('gce traffic network weight punish.xlsx', 'B2:AO41');
[~, labels, ~] = xlsread('gce traffic network weight punish.xlsx', 'A2:A41');
adj_mat(isnan(adj_mat)) = 0;

rooms = [17, 18, 35, 36, 38, 39];

global traffic;
traffic = zeros(numedges(G), factorial(length(rooms))-1);

G = graph(adj_mat, labels);
% p = plot(G, 'EdgeLabel', G.Edges.Weight, 'LineWidth', 3*G.Edges.Weight);


% optimize traffic flow


for i = 1:length(rooms)-1
    from = rooms;
    to = 
end

traffic( traffic == 0 ) = 1;

G.Edges.Weight = G.Edges.Weight .* traffic;

p = plot(G, 'EdgeLabel', G.Edges.Weight, 'LineWidth', G.Edges.Weight./8);
