adj_mat = xlsread('gce traffic network weight punish.xlsx', 'B2:AO41');
[~, labels, ~] = xlsread('gce traffic network weight punish.xlsx', 'A2:A41');
adj_mat(isnan(adj_mat)) = 0;

global traffic;
traffic = zeros(numedges(G), 1);

G = graph(adj_mat, labels);
% p = plot(G, 'EdgeLabel', G.Edges.Weight, 'LineWidth', 3*G.Edges.Weight);


% simulate traffic flow

% move 10 people from room1 to room2
G = addPeople(G, 18, 19, 10);

% move 8 people from room6 to dlab
G = addPeople(G, 39, 11, 8);

G = addPeople(G, 1, 19, 5);

traffic( traffic == 0 ) = 1;

G.Edges.Weight = G.Edges.Weight .* traffic;

p = plot(G, 'EdgeLabel', G.Edges.Weight, 'LineWidth', G.Edges.Weight./8);
