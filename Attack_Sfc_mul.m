%按照节点id顺序attack_seq攻击节点直至网络崩溃，并记录S和fc
function [percolation_S]= Attack_Sfc_mul(attack_seq1,attack_seq2,G1,G2)
N=length(G1);
if N>100000
    num = floor(0.01*N);
elseif N>1000
    num = floor(0.01*N);
else
    num=1;
end
percolation_S=zeros(floor(N/num)+1,1);
Sfc=mul_component_largest_size(G1,G2)/N;
percolation_S(1) = Sfc;
for i=1:floor(N/num)
    i;
    id=(i-1)*num+1:1:i*num;
    node_remove1=attack_seq1(id);
    node_remove2=attack_seq2(id);
    G1(node_remove1,:)=0;
    G1(:,node_remove1)=0;
    G2(node_remove2,:)=0;
    G2(:,node_remove2)=0;
    percolation_S(i+1)=mul_component_largest_size(G1,G2)/N;
end