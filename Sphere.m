function obj = Sphere(var,opt)%  opt= 0*ones(1,dim);%50��0
%Sphere function
%   - var: design variable vector
%   - opt: shift vector
    D = length(var);
    %M=eye(D,D);
    %[NN,~] = size(var);
    var = (var - opt);
    obj=var*var';%var��һ������
end