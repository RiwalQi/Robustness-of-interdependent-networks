function A=Creat_ER_network(n,d)% n is the size d is average degree
d=d/2;
A=zeros(1);
A=sparse(A);
A(n,n)=0;
for i=1:n*d
    i=ceil(rand*n);
    j=ceil(rand*n);
    A(i,j)=1;
    A(j,i)=1;
end
for i=1:n
    A(i,i)=0;
end