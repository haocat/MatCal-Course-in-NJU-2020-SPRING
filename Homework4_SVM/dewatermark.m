function Wt = dewatermark(U1,V1,P,alpha,S)
%DEWATERMARK �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[Up,Sp,Vp]=svd(P);
F=U1*Sp*V1';
Wt=(F-S)/alpha;
end

