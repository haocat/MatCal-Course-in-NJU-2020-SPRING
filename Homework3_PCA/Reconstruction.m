%�����ؽ�����
%����PCA_vn����һ����������������
%�������img_Needcond�����ؽ��Ĳ��Լ�ͼƬ��һ��ͼƬ��Ϊһ������������ϳɾ���
%����������img_mean��ѵ�����ľ�ֵ
%�������img_Recons���ؽ����ͼƬ
%�㷨�μ��μ�����9�ܵ�1�� - ��������ƻ�������������5   ��13ҳ��
%ע���μ��и����Ķ��ڵ���ͼƬ���ع������³���ʵ�ֵ��ǶԶ��Ų��Լ�ͼƬ���ع�
function img_Recons=Reconstruction(PCA_vn,img_Needcond,img_mean)   
    mat_size=size(img_Needcond);
    img_Recons=zeros(mat_size);
    img_Z=img_Needcond-img_mean;
    img_Y=(PCA_vn'*img_Z);
    img_Recons=PCA_vn*img_Y+img_mean;

    

