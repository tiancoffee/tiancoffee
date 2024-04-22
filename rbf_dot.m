function H=rbf_dot(X,Y,deg)
%Author��kailugaji
%��˹�˺���/��������� K(x, y)=exp(-d^2/sigma), d=(x-y)^2, ����X��Yά��һ��
%Deg is kernel size,��˹�˵�sigma
[N_X,~]=size(X);
[N_Y,~]=size(Y);
G = sum((X.*X),2);
H = sum((Y.*Y),2);
Q = repmat(G,1,N_Y(1));
R = repmat(H',N_X(1),1);
H = Q + R - 2*X*Y';
H=exp(-H/2/deg^2);  %N_X*N_Y
end