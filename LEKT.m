function [clusterModel,population]=LEKT(population , task_num , difference,D_multitask)
clusterModel = struct;
dim = length(population(1).rnvec);
K = 10;%cluster numbers，原来为10
knowledge_task_num = 1; %number of tasks involved in knowledge transfer
TempPopulation = population;
for i = 1:task_num
    clusterModel(i).Nich_mean = zeros(K , D_multitask);%修改为最大维度50
    clusterModel(i).Nich_std = zeros(K , D_multitask);
    Subpop = TempPopulation([TempPopulation.skill_factor] == i);
    SubpopRnvec = [Subpop(1:end).rnvec];
    SubpopRnvec = vec2mat(SubpopRnvec , dim);
    temp_difference = difference(i,:);
    [~,index] = sort(temp_difference);
    %--------------Generate clusters by k-means--------------------------
    for j = 1:knowledge_task_num
        Selected_population = population([population.skill_factor] == index(j));
        Selected_matrix = [Selected_population(1:end).rnvec];
        Selected_matrix = vec2mat(Selected_matrix , dim);
        SubpopRnvec = [SubpopRnvec;Selected_matrix];
    end
    [idx , ~] = kmeans(SubpopRnvec , K , 'Distance' , 'cityblock' , 'MaxIter'  , 30);
    for ii = 1:length(Subpop)
        Subpop(ii).cluster_num = idx(ii);
    end
    population([population.skill_factor] == i)= Subpop;
    %Generate mean and std for each cluster
    for k = 1:K
        k_th_clu = SubpopRnvec(find(idx==k),:);
        k_th_clu_Mean = mean(k_th_clu);
        k_th_clu_Std = std(k_th_clu);
        clusterModel(i).Nich_mean(k,:) =  k_th_clu_Mean;
        clusterModel(i).Nich_std(k,:) = k_th_clu_Std;
    end
end
end