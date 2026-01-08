%仿真计算真实网络中基于截断度K_xing值攻击的临界移除比例
%按照节点id顺序attack_seq攻击节点直至网络崩溃，并记录S和fc
%fs指的是仿真求解的移除比例向量，一般为0:0.01:1
%使用四种抽样方法估计和攻击
function S = attack_rand_sam(G1,G2,rate_w)
N=length(G1);

d_all1 = sum(G1,1);
d_all2 = sum(G2,1);
id_all1 = 1:N;
id_all2 = 1:N;
Sampling_nodes1=randperm(N,round(N*rate_w));
Sampling_nodes2=randperm(N,round(N*rate_w));
degree_sampling1 = d_all1(Sampling_nodes1);
degree_sampling2 = d_all2(Sampling_nodes2);
id_black1 = id_all1;
id_black1(Sampling_nodes1)=[];
id_black2 = id_all2;
id_black2(Sampling_nodes2)=[];
id_degree_white1 = [Sampling_nodes1; degree_sampling1]';
rank_degree_white1 = sortrows(id_degree_white1,-2);
id_degree_white2 = [Sampling_nodes2; degree_sampling2]';
rank_degree_white2 = sortrows(id_degree_white2,-2);
b1=randperm(length(id_black1));
rand_random_black1 = id_black1(b1);
b2=randperm(length(id_black2));
rand_random_black2 = id_black2(b2);
attack_seq1 = [rank_degree_white1(:,1)' rand_random_black1];
attack_seq2 = [rank_degree_white2(:,1)' rand_random_black2];
S=Attack_Sfc_mul(attack_seq1,attack_seq2,G1,G2);

end



