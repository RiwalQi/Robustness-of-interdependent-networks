n=10000;
q=0.5;
average_k=4;
a=[0,0.2,0.6,1];
num_exp=10;
tic
for j=1:length(a)
    parfor i=1:num_exp
        i
        G1{i,j}=Creat_ER_network(n,average_k);
        G2{i,j}=Creat_ER_network(n,average_k);
        [G1{i,j},G2{i,j}] = degree_positive_id_alpha(G1{i,j},G2{i,j},q)
        comp_final{i,j} = attack_rand_sam(G1{i,j},G2{i,j},a(j));
        G1{i,j}=[];
        G2{i,j}=[];
    end
end
toc
for j=1:length(a)
    comp_aver{j}=zeros(length(comp_final{1,j}),1);
    for i=1:num_exp
        comp_aver{j}=comp_aver{j}+comp_final{i,j};
    end
    comp_aver{j}=comp_aver{j}/num_exp;
end


save exp_er_correlated.mat
plot(0:0.01:1,comp_aver{4},'-o')

hold on
plot(0:0.01:1,comp_aver{3},'-s')
hold on
plot(0:0.01:1,comp_aver{2},'-p')
hold on
plot(0:0.01:1,comp_aver{1},'-^')
xlim([0 0.6])
legend('1-\alpha=0','1-\alpha=0.4','1-\alpha=0.8','1-\alpha=1','Location','northeast')