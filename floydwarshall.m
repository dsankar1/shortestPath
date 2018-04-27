function P = floydwarshall(G, s, t)
    V = numnodes(G);
    dist(1:V, 1:V) = Inf;
    next = zeros(V, V);
    for i=1:V
        for j=1:V
            if i ~= j
                e = findedge(G,i,j);
                if e ~= 0
                    dist(i,j) = G.Edges.Weight(e);
                    next(i,j) = j;
                end
            end
        end
    end
    for i=1:V
        for j=1:V
            for k=1:V
                if dist(i,j) > dist(i,k) + dist(k,j)
                    dist(i,j) = dist(i,k) + dist(k,j);
                    next(i,j) = next(i,k);
                end
            end
        end
    end
    if next(s,t) == 0
        P = [];
        return
    end
    P = zeros(1, numnodes(G));
    index = 1;
    P(index) = s;
    while s ~= t
        index = index + 1;
        s = next(s, t);
        P(index) = s;
    end
    P = P(1:index);
end