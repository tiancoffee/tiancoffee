function [population,EvBestFitness]= EMaTOMKT(Tasks,pop,gen,run)
%% initialization

for u3=1:run
no_of_tasks=length(Tasks);
D=zeros(1,no_of_tasks);
for i=1:no_of_tasks
    D(i)=Tasks(i).dim;
end
D_multitask=max(D);
subpop = pop/no_of_tasks;
EvBestFitness = zeros(no_of_tasks,gen);    % best fitness found
skill_factor = 1;
count =1;
for t = 1:no_of_tasks%均匀的给任务分配粒子数量
    for i = 1 : pop/no_of_tasks
        population(count) = Chromosome();
        child(count) = Chromosome();
        population(count) = initialize(population(count),D_multitask);
        population(count).skill_factor=skill_factor;
        [population(count)] = evaluate(population(count),Tasks);
        count = count+1;
    end
    skill_factor = skill_factor+1;
end
%Elite selection
for i = 1:no_of_tasks
    temp_pop = population((i-1)*subpop+1 : i*subpop);
    factorial_cost = [temp_pop.factorial_costs];
    [xxx,y]=sort(factorial_cost);
    temp_pop=temp_pop(y);
    for j=1:subpop
        temp_pop(j).factorial_ranks=j;
    end
    bestobj(i)=temp_pop(1).factorial_costs;
    EvBestFitness(i,1)=bestobj(i);
    population((i-1)*subpop+1 : i*subpop) = temp_pop;
end

initPro=0.9; %initial value of amp
mu = 2;     % Index of Simulated Binary Crossover (tunable)
mum = 5;    % Index of polynomial mutation
generation=2;
tFun(1,:) = bestobj;



while generation <= gen
    count=1;
    if generation < 4
        amp(1:no_of_tasks) = initPro;
    else
        temp1 = tFun(generation - 2,:) - tFun(generation - 1,:);
        temp2 = tFun(generation - 3,:) - tFun(generation - 2,:);
        amp = temp1 ./ (temp1+temp2);
        amp(isnan(amp)) = initPro;
    end
    %% calculate MMD among tasks
    difference=inf.*ones(no_of_tasks);
    sigma = 1;
    for count1 = 1:no_of_tasks-1
        T1 = population((count1-1)*subpop + 1: count1*subpop);
        rnvec_T1 = [T1.rnvec];
        rnvec_T1 = reshape(rnvec_T1 , [D_multitask,length(rnvec_T1)/D_multitask]);
        for count2 = count1+1:no_of_tasks
            if count2==count1
                continue;
            end
            T2 = population((count2-1)*subpop + 1: count2*subpop);
            rnvec_T2 = [T2.rnvec];
            rnvec_T2 = reshape(rnvec_T2 , [D_multitask,length(rnvec_T2)/D_multitask]);
            difference(count1,count2) = my_mmd(rnvec_T1, rnvec_T2, sigma);
            difference(count2,count1) = difference(count1,count2);
        end
    end
    
    %% clustering in LEKT strategy
    [clusterModel , population] = LEKT(population , no_of_tasks , difference,D_multitask);
    
    %% Create offspring population
    for i = 1:no_of_tasks
        StartIndex = (i-1) * subpop+1;%the index of the first individual of task i in the whole population
        EndIndex = i*subpop;%the index of the last individual of task i in the whole population
        for j=1:subpop/2
            if rand(1) < amp(i)%self evolution
                u = rand(1,D_multitask);
                cf = zeros(1,D_multitask);
                cf(u<=0.5)=(2*u(u<=0.5)).^(1/(mu+1));
                cf(u>0.5)=(2*(1-u(u>0.5))).^(-1/(mu+1));
                p2=randi([StartIndex , EndIndex],1);
                child(count) = crossover(child(count),population(StartIndex+j-1),population(p2),cf);
                child(count+1) = crossover(child(count+1),population(p2),population(StartIndex+j-1),cf);
                child(count)=mutate(child(count),child(count),D_multitask,mum);
                child(count+1)=mutate(child(count+1),child(count+1),D_multitask,mum);
            else%knowledge transfer
                [child(count).rnvec, child(count+1).rnvec] = Evolve.LocalEDA(clusterModel , i , population(StartIndex+j-1).cluster_num);
            end
            child(count).skill_factor=i;
            child(count+1).skill_factor=i;
            [child(count)] = evaluate(child(count),Tasks);
            [child(count+1)] = evaluate(child(count+1),Tasks);
            count = count + 2;
        end
    end
     %% combine Population and Offspring
    interpopulation(1:pop) =population;
    interpopulation(pop+1:2*pop) = child;
    %% elite selection
    for i = 1:no_of_tasks
        temppopulation = interpopulation([interpopulation.skill_factor]==i);
        factorial_cost = [temppopulation.factorial_costs];
        [xxx,y]=sort(factorial_cost);
        temppopulation=temppopulation(y);
        for j=1:length(temppopulation)
            temppopulation(j).factorial_ranks=j;
            temppopulation(j).scalar_fitness = 1/j;
        end
        if temppopulation(1).factorial_costs<=bestobj(i)
            bestobj(i)=temppopulation(1).factorial_costs;
        end
        population((i-1)*subpop + 1: i*subpop) = temppopulation(1:subpop);
        EvBestFitness(i,generation)=bestobj(i);
    end
    tFun(generation,:) = bestobj;
    disp(['EMaTOTKT Generation = ', num2str(generation), ' best factorial costs = ', num2str(bestobj)]);
    generation = generation + 1;


    
end
for j = 1:no_of_tasks
        BestFitness(u3,j)=bestobj(j);%记录每次迭代结束后任务最优结果
end

 %记录每个任务迭代过程中的均值和方差
   

end



BestFitness

  for i = 1:no_of_tasks
        disp([ 'Task_',num2str(i),': Mean Fitness = ',num2str(mean(BestFitness(:,i),1)),' Std = ',num2str(std(BestFitness(:,i),1))]);
  end





end