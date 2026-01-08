% CASCADESPARSE.M
function [newg1, newg2, noDel]=cascadesparse(graph1,graph2)
comps = get_components(graph1);
n=size(graph1,1);
[is,js,elems]=find(graph2);%找出2中的非零元素，并储存行、列以及值，此处elems应为全为1的向量
mask=comps(is)==comps(js);
newis=is(mask);
newjs=js(mask);
newelems = elems(mask);
dels= length(is)-length(newis);%移除掉的边的数量
newg2=sparse(newis,newjs,newelems,n,n);
newg1=graph1;
noDel=dels;
end