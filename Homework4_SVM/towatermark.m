function [U1,V1,Aw] = towatermark(U,S,V,W,alpha)
%TOWATERMARK 此处显示有关此函数的摘要
%   此处显示详细说明
L=S+alpha*W;
[U1,S1,V1]=svd(L);
Aw=U*S1*V';
end

