function [U1,V1,Aw] = towatermark(U,S,V,W,alpha)
%TOWATERMARK �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
L=S+alpha*W;
[U1,S1,V1]=svd(L);
Aw=U*S1*V';
end

