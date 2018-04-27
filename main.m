w = randi([1 10], 13, 1);
s = [1 1 2 3 3 4 4 6 6 7 8 7 5];
t = [2 3 4 4 5 5 6 1 8 1 3 2 8];
G = graph(s, t, w);
G.Edges
plot(G, 'EdgeLabel', G.Edges.Weight)
MatlabPath = shortestpath(G, 7, 8)
Dijkstra = dijkstra(G, 7, 8)
FloydWarshall = floydwarshall(G, 7, 8)