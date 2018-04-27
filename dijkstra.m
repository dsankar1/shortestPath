function P = dijkstra(G, s, t)
    dist(1, 1:numnodes(G)) = Inf;
    dist(s) = 0;
    prev = zeros(1, numnodes(G));
    Q = zeros(1, numnodes(G));
    for i=1:length(Q)
        Q(i) = i;
    end
    while ~isempty(Q)
        i = getMin(Q, dist);
        u = Q(i);
        Q(i) = [];
        vs = neighbors(G, u);
        for i=1:length(vs)
            v = vs(i);
            if ismember(v, Q)
                alt = dist(u) + G.Edges.Weight(findedge(G, u, v));
                if alt < dist(v)
                    dist(v) = alt;
                    prev(v) = u;
                end
            end
        end
    end
    P = zeros(1, numnodes(G));
    index = 1;
    P(index) = t;
    while prev(t) ~= 0
        index = index + 1;
        P(index) = prev(t);
        t = prev(t);
    end
    P = P(1:index);
    P = fliplr(P);
end

function u = getMin(Q, dist)
    u = 1;
    for i=2:length(Q)
        if dist(Q(i)) < dist(Q(u))
            u = i;
        end
    end
end