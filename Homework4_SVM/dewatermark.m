function Wt = dewatermark(U1,V1,P,alpha,S)
%DEWATERMARK 此处显示有关此函数的摘要
%   此处显示详细说明
[Up,Sp,Vp]=svd(P);
F=U1*Sp*V1';
Wt=(F-S)/alpha;
end

