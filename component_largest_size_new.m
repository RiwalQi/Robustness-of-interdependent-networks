%相对于其他版本，本版本运用了conncomp命令
function S_max=component_largest_size_new(G)
% G = graph([1 1 4],[2 3 5],[1 1 1],6);
% A=G;
if(isempty(G))
    S_max=0;
else
%Tarjan算法求最大连通片
A= graph(G);
[~,binsizes] = conncomp(A);
S_max=max(binsizes);
end
    