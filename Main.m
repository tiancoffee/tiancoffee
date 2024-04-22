clear
warning off
pop=200; % population size原为5000
gen=1000; % generation
rmp=0.3; % random mating probability
% for run=1 : 3 %running times，原来为20
%     for index = 1:10%problem index
run=3;
index=10;
        Tasks = benchmark(index);
% for index=1:9
% Tasks =benchmark1(index);
data_EMaTOTKT{index}= EMaTOMKT(Tasks,pop,gen,run);
% end
%          data_EMaTOTKT{index}= EMaTOMKT(Tasks,pop,gen,run);
        
%     end
% end
save('data_EMaTOTKT','data_EMaTOTKT');