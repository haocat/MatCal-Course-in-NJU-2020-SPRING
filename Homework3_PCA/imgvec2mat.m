%ͼ������תΪ����ĺ���
%����������img_vec��ͼ�����������ʽ
%����img_size��ͼƬ�ĳߴ�  [��������]
%���img_mat��ͼ��ľ�����ʽ 
%ע�⣺�����double��ʽ�ľ����޷�ֱ�ӱ���ӡ����ӡǰ��ؼ���uint����ǿ������ת����������
function img_mat=imgvec2mat(img_vec,img_size)
    img_mat=reshape(img_vec',img_size(1),img_size(2));
    
