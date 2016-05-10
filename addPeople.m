function G = addPeople(G, node1, node2, num_people)
%ADDPEOPLE Adds population traffic to graph object
path = shortestpath(G, node1, node2);
for i = 1:length(path)-1
    ind = findedge(G, path(i), path(i+1));
    G.Edges.Weight(ind) = G.Edges.Weight(ind) * num_people;
end

end

