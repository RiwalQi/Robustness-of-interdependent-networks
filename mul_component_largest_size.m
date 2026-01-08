%求解多层网络的最大平行联通片
function Ms_max=mul_component_largest_size(graph1,graph2)
[graph1,~] = runCascades(graph1,graph2);
Ms_max=component_largest_size_new(graph1);