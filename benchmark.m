function Tasks = benchmark(index)%index=10
%BENCHMARK function
    task_size = 10;
    dim = 50;
    for task_id = 1:task_size
        switch(task_id)
            case 1
                Tasks(task_id).dim = dim;            % dimensionality of Task
                Tasks(task_id).Lb = -100*ones(1,dim); % Lower bound of Task ,有50个维度，每个维度最低值为-100
                Tasks(task_id).Ub = 100*ones(1,dim);  % Upper bound of Task
                opt1 = 0*ones(1,dim);%50个0
                %M1=eye(dim,dim);
                Tasks(task_id).fnc = @(x)Sphere(x,opt1); % function of Task
            case 2
                Tasks(task_id).dim = dim;
                Tasks(task_id).Lb = -100*ones(1,dim);
                Tasks(task_id).Ub = 100*ones(1,dim); 
                opt2 = 80*ones(1,dim);
                %M2=eye(dim,dim);
                Tasks(task_id).fnc = @(x)Sphere(x,opt2);
            case 3
                Tasks(task_id).dim = dim;
                Tasks(task_id).Lb = -100*ones(1,dim);
                Tasks(task_id).Ub = 100*ones(1,dim);
                opt3 =-80*ones(1,dim);
                %M3=eye(dim,dim);
                Tasks(task_id).fnc = @(x)Sphere(x,opt3);
            case 4
                Tasks(task_id).dim = 25;
                Tasks(task_id).Lb = -0.5*ones(1,25);
                Tasks(task_id).Ub = 0.5*ones(1,25);
                opt4 = -0.4*ones(1,25);
                M4=eye(25,25);%主对角线上的元素均为1，其余元素均为0。这里，eye(25,25) 就生成了一个大小为 25x25 的单位矩阵。
                Tasks(task_id).fnc = @(x)Weierstrass(x,M4,opt4);
            case 5
                Tasks(task_id).dim = dim;
                Tasks(task_id).Lb = -50*ones(1,dim);
                Tasks(task_id).Ub = 50*ones(1,dim);
                opt5=0*ones(1,dim);
                M5=eye(dim,dim);
                Tasks(task_id).fnc = @(x)Rosenbrockm(x,M5,opt5);
            case 6
                Tasks(task_id).dim = dim;
                Tasks(task_id).Lb = -50*ones(1,dim);
                Tasks(task_id).Ub = 50*ones(1,dim);
                opt6=40*ones(1,dim);
                M6=eye(dim,dim);
                Tasks(task_id).fnc = @(x)Ackley(x,M6,opt6);
            case 7
                Tasks(task_id).dim = dim;
                Tasks(task_id).Lb = -0.5*ones(1,dim);
                Tasks(task_id).Ub = 0.5*ones(1,dim);
                opt7=-0.4*ones(1,dim);
                M7=eye(dim,dim);
                Tasks(task_id).fnc = @(x)Weierstrass(x,M7,opt7);
            case 8
                Tasks(task_id).dim = dim;
                Tasks(task_id).Lb = -500*ones(1,dim);
                Tasks(task_id).Ub = 500*ones(1,dim);
                opt8=0*ones(1,dim);
                %opt8(1:dim/2)=-opt8(1:dim/2);
                M8=eye(dim,dim);
                Tasks(task_id).fnc = @(x)Schwefelm(x,M8,opt8);
           case 9
              Tasks(task_id).dim = dim;
               Tasks(task_id).Lb = -100*ones(1,dim);
               Tasks(task_id).Ub = 100*ones(1,dim);
               opt9=80*ones(1,dim);
               opt9(1:dim/2)=-opt9(1:dim/2);
               M9=eye(dim,dim);
               Tasks(task_id).fnc = @(x)Griewank(x,M9,opt9);
          case 10
               Tasks(task_id).dim = dim;
               Tasks(task_id).Lb = -50*ones(1,dim);
               Tasks(task_id).Ub = 50*ones(1,dim);
               opt10=-40*ones(1,dim);
               opt10(1:dim/2)=-opt10(1:dim/2);
               M10=eye(dim,dim);
               Tasks(task_id).fnc = @(x)Rastrigin(x,M10,opt10);
%                  case 11
%                 Tasks(task_id).dim = dim;            % dimensionality of Task
%                 Tasks(task_id).Lb = -100*ones(1,dim); % Lower bound of Task ,有50个维度，每个维度最低值为-100
%                 Tasks(task_id).Ub = 100*ones(1,dim);  % Upper bound of Task
%                 opt1 = 0*ones(1,dim);%50个0
%                 %M1=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt1); % function of Task
%             case 12
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -100*ones(1,dim);
%                 Tasks(task_id).Ub = 100*ones(1,dim); 
%                 opt2 = 80*ones(1,dim);
%                 %M2=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt2);
%             case 13
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -100*ones(1,dim);
%                 Tasks(task_id).Ub = 100*ones(1,dim);
%                 opt3 =-80*ones(1,dim);
%                 %M3=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt3);
%             case 14
%                 Tasks(task_id).dim = 25;
%                 Tasks(task_id).Lb = -0.5*ones(1,25);
%                 Tasks(task_id).Ub = 0.5*ones(1,25);
%                 opt4 = -0.4*ones(1,25);
%                 M4=eye(25,25);%主对角线上的元素均为1，其余元素均为0。这里，eye(25,25) 就生成了一个大小为 25x25 的单位矩阵。
%                 Tasks(task_id).fnc = @(x)Weierstrass(x,M4,opt4);
%             case 15
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -50*ones(1,dim);
%                 Tasks(task_id).Ub = 50*ones(1,dim);
%                 opt5=0*ones(1,dim);
%                 M5=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Rosenbrockm(x,M5,opt5);
%             case 16
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -50*ones(1,dim);
%                 Tasks(task_id).Ub = 50*ones(1,dim);
%                 opt6=40*ones(1,dim);
%                 M6=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Ackley(x,M6,opt6);
%             case 17
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -0.5*ones(1,dim);
%                 Tasks(task_id).Ub = 0.5*ones(1,dim);
%                 opt7=-0.4*ones(1,dim);
%                 M7=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Weierstrass(x,M7,opt7);
%             case 18
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -500*ones(1,dim);
%                 Tasks(task_id).Ub = 500*ones(1,dim);
%                 opt8=0*ones(1,dim);
%                 %opt8(1:dim/2)=-opt8(1:dim/2);
%                 M8=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Schwefelm(x,M8,opt8);
%            case 19
%               Tasks(task_id).dim = dim;
%                Tasks(task_id).Lb = -100*ones(1,dim);
%                Tasks(task_id).Ub = 100*ones(1,dim);
%                opt9=80*ones(1,dim);
%                opt9(1:dim/2)=-opt9(1:dim/2);
%                M9=eye(dim,dim);
%                Tasks(task_id).fnc = @(x)Griewank(x,M9,opt9);
%           case 20
%                Tasks(task_id).dim = dim;
%                Tasks(task_id).Lb = -50*ones(1,dim);
%                Tasks(task_id).Ub = 50*ones(1,dim);
%                opt10=-40*ones(1,dim);
%                opt10(1:dim/2)=-opt10(1:dim/2);
%                M10=eye(dim,dim);
%                Tasks(task_id).fnc = @(x)Rastrigin(x,M10,opt10); 
% 
%    case 21
%                 Tasks(task_id).dim = dim;            % dimensionality of Task
%                 Tasks(task_id).Lb = -100*ones(1,dim); % Lower bound of Task ,有50个维度，每个维度最低值为-100
%                 Tasks(task_id).Ub = 100*ones(1,dim);  % Upper bound of Task
%                 opt1 = 0*ones(1,dim);%50个0
%                 %M1=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt1); % function of Task
%             case 22
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -100*ones(1,dim);
%                 Tasks(task_id).Ub = 100*ones(1,dim); 
%                 opt2 = 80*ones(1,dim);
%                 %M2=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt2);
%             case 23
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -100*ones(1,dim);
%                 Tasks(task_id).Ub = 100*ones(1,dim);
%                 opt3 =-80*ones(1,dim);
%                 %M3=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt3);
%             case 24
%                 Tasks(task_id).dim = 25;
%                 Tasks(task_id).Lb = -0.5*ones(1,25);
%                 Tasks(task_id).Ub = 0.5*ones(1,25);
%                 opt4 = -0.4*ones(1,25);
%                 M4=eye(25,25);%主对角线上的元素均为1，其余元素均为0。这里，eye(25,25) 就生成了一个大小为 25x25 的单位矩阵。
%                 Tasks(task_id).fnc = @(x)Weierstrass(x,M4,opt4);
%             case 25
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -50*ones(1,dim);
%                 Tasks(task_id).Ub = 50*ones(1,dim);
%                 opt5=0*ones(1,dim);
%                 M5=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Rosenbrockm(x,M5,opt5);
%             case 26
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -50*ones(1,dim);
%                 Tasks(task_id).Ub = 50*ones(1,dim);
%                 opt6=40*ones(1,dim);
%                 M6=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Ackley(x,M6,opt6);
%             case 27
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -0.5*ones(1,dim);
%                 Tasks(task_id).Ub = 0.5*ones(1,dim);
%                 opt7=-0.4*ones(1,dim);
%                 M7=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Weierstrass(x,M7,opt7);
%             case 28
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -500*ones(1,dim);
%                 Tasks(task_id).Ub = 500*ones(1,dim);
%                 opt8=0*ones(1,dim);
%                 %opt8(1:dim/2)=-opt8(1:dim/2);
%                 M8=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Schwefelm(x,M8,opt8);
%            case 29
%               Tasks(task_id).dim = dim;
%                Tasks(task_id).Lb = -100*ones(1,dim);
%                Tasks(task_id).Ub = 100*ones(1,dim);
%                opt9=80*ones(1,dim);
%                opt9(1:dim/2)=-opt9(1:dim/2);
%                M9=eye(dim,dim);
%                Tasks(task_id).fnc = @(x)Griewank(x,M9,opt9);
%           case 30
%                Tasks(task_id).dim = dim;
%                Tasks(task_id).Lb = -50*ones(1,dim);
%                Tasks(task_id).Ub = 50*ones(1,dim);
%                opt10=-40*ones(1,dim);
%                opt10(1:dim/2)=-opt10(1:dim/2);
%                M10=eye(dim,dim);
%                Tasks(task_id).fnc = @(x)Rastrigin(x,M10,opt10);
% 
% 
% 
%    case 31
%                 Tasks(task_id).dim = dim;            % dimensionality of Task
%                 Tasks(task_id).Lb = -100*ones(1,dim); % Lower bound of Task ,有50个维度，每个维度最低值为-100
%                 Tasks(task_id).Ub = 100*ones(1,dim);  % Upper bound of Task
%                 opt1 = 0*ones(1,dim);%50个0
%                 %M1=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt1); % function of Task
%             case 32
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -100*ones(1,dim);
%                 Tasks(task_id).Ub = 100*ones(1,dim); 
%                 opt2 = 80*ones(1,dim);
%                 %M2=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt2);
%             case 33
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -100*ones(1,dim);
%                 Tasks(task_id).Ub = 100*ones(1,dim);
%                 opt3 =-80*ones(1,dim);
%                 %M3=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt3);
%             case 34
%                 Tasks(task_id).dim = 25;
%                 Tasks(task_id).Lb = -0.5*ones(1,25);
%                 Tasks(task_id).Ub = 0.5*ones(1,25);
%                 opt4 = -0.4*ones(1,25);
%                 M4=eye(25,25);%主对角线上的元素均为1，其余元素均为0。这里，eye(25,25) 就生成了一个大小为 25x25 的单位矩阵。
%                 Tasks(task_id).fnc = @(x)Weierstrass(x,M4,opt4);
%             case 35
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -50*ones(1,dim);
%                 Tasks(task_id).Ub = 50*ones(1,dim);
%                 opt5=0*ones(1,dim);
%                 M5=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Rosenbrockm(x,M5,opt5);
%             case 36
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -50*ones(1,dim);
%                 Tasks(task_id).Ub = 50*ones(1,dim);
%                 opt6=40*ones(1,dim);
%                 M6=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Ackley(x,M6,opt6);
%             case 37
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -0.5*ones(1,dim);
%                 Tasks(task_id).Ub = 0.5*ones(1,dim);
%                 opt7=-0.4*ones(1,dim);
%                 M7=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Weierstrass(x,M7,opt7);
%             case 38
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -500*ones(1,dim);
%                 Tasks(task_id).Ub = 500*ones(1,dim);
%                 opt8=0*ones(1,dim);
%                 %opt8(1:dim/2)=-opt8(1:dim/2);
%                 M8=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Schwefelm(x,M8,opt8);
%            case 39
%               Tasks(task_id).dim = dim;
%                Tasks(task_id).Lb = -100*ones(1,dim);
%                Tasks(task_id).Ub = 100*ones(1,dim);
%                opt9=80*ones(1,dim);
%                opt9(1:dim/2)=-opt9(1:dim/2);
%                M9=eye(dim,dim);
%                Tasks(task_id).fnc = @(x)Griewank(x,M9,opt9);
%           case 40
%                Tasks(task_id).dim = dim;
%                Tasks(task_id).Lb = -50*ones(1,dim);
%                Tasks(task_id).Ub = 50*ones(1,dim);
%                opt10=-40*ones(1,dim);
%                opt10(1:dim/2)=-opt10(1:dim/2);
%                M10=eye(dim,dim);
%                Tasks(task_id).fnc = @(x)Rastrigin(x,M10,opt10);
% 
%    case 41
%                 Tasks(task_id).dim = dim;            % dimensionality of Task
%                 Tasks(task_id).Lb = -100*ones(1,dim); % Lower bound of Task ,有50个维度，每个维度最低值为-100
%                 Tasks(task_id).Ub = 100*ones(1,dim);  % Upper bound of Task
%                 opt1 = 0*ones(1,dim);%50个0
%                 %M1=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt1); % function of Task
%             case 42
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -100*ones(1,dim);
%                 Tasks(task_id).Ub = 100*ones(1,dim); 
%                 opt2 = 80*ones(1,dim);
%                 %M2=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt2);
%             case 43
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -100*ones(1,dim);
%                 Tasks(task_id).Ub = 100*ones(1,dim);
%                 opt3 =-80*ones(1,dim);
%                 %M3=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Sphere(x,opt3);
%             case 44
%                 Tasks(task_id).dim = 25;
%                 Tasks(task_id).Lb = -0.5*ones(1,25);
%                 Tasks(task_id).Ub = 0.5*ones(1,25);
%                 opt4 = -0.4*ones(1,25);
%                 M4=eye(25,25);%主对角线上的元素均为1，其余元素均为0。这里，eye(25,25) 就生成了一个大小为 25x25 的单位矩阵。
%                 Tasks(task_id).fnc = @(x)Weierstrass(x,M4,opt4);
%             case 45
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -50*ones(1,dim);
%                 Tasks(task_id).Ub = 50*ones(1,dim);
%                 opt5=0*ones(1,dim);
%                 M5=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Rosenbrockm(x,M5,opt5);
%             case 46
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -50*ones(1,dim);
%                 Tasks(task_id).Ub = 50*ones(1,dim);
%                 opt6=40*ones(1,dim);
%                 M6=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Ackley(x,M6,opt6);
%             case 47
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -0.5*ones(1,dim);
%                 Tasks(task_id).Ub = 0.5*ones(1,dim);
%                 opt7=-0.4*ones(1,dim);
%                 M7=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Weierstrass(x,M7,opt7);
%             case 48
%                 Tasks(task_id).dim = dim;
%                 Tasks(task_id).Lb = -500*ones(1,dim);
%                 Tasks(task_id).Ub = 500*ones(1,dim);
%                 opt8=0*ones(1,dim);
%                 %opt8(1:dim/2)=-opt8(1:dim/2);
%                 M8=eye(dim,dim);
%                 Tasks(task_id).fnc = @(x)Schwefelm(x,M8,opt8);
%            case 49
%               Tasks(task_id).dim = dim;
%                Tasks(task_id).Lb = -100*ones(1,dim);
%                Tasks(task_id).Ub = 100*ones(1,dim);
%                opt9=80*ones(1,dim);
%                opt9(1:dim/2)=-opt9(1:dim/2);
%                M9=eye(dim,dim);
%                Tasks(task_id).fnc = @(x)Griewank(x,M9,opt9);
%           case 50
%                Tasks(task_id).dim = dim;
%                Tasks(task_id).Lb = -50*ones(1,dim);
%                Tasks(task_id).Ub = 50*ones(1,dim);
%                opt10=-40*ones(1,dim);
%                opt10(1:dim/2)=-opt10(1:dim/2);
%                M10=eye(dim,dim);
%                Tasks(task_id).fnc = @(x)Rastrigin(x,M10,opt10);
        end
    end
end

