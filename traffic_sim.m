adj_mat = xlsread('gce traffic network weight punish.xlsx', 'B2:AO41');
adj_mat(isnan(adj_mat)) = 0;
G = graph(adj_mat);
p = plot(G, 'EdgeLabel', G.Edges.Weight, 'LineWidth', 3*G.Edges.Weight);
% [path1, d] = shortestpath(G, 29, 1);
% highlight(p, path1, 'EdgeColor', 'r');
% dist = distances(G);