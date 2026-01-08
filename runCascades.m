% RUNCASCADES.M
function [next1,next2] = runCascades ( graph1 , graph2 )
d = 1 ; % Any non-zero will do
next1 = graph1 ;
next2 = graph2 ;
while d~=0
    [n1,n2,d1]=cascadesparse(next1,next2);%一次正级联失效
    [next2,next1,d2]=cascadesparse(n2,n1);%一次反级联失效
    d=d1+d2; %Indicates if edges have been removed.
end

end
