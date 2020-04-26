%problem2 �������� 40 ������ֵ��Ӧ������������Ϊ��������������ʾ��ǰ 15 ������������ͼ�� 
%�õ���40������������������PCA_v��������������һ��������PCA_vn
Numbers=240;%ѵ����ͼƬ��Ŀ
img_size=[112,92];%ͼƬ�ߴ�
img_vec_length=img_size(1)*img_size(2);%ͼƬ��������������ĳ���
img=zeros(img_vec_length,Numbers);%ѵ����������ͼƬ��ŵľ���
%����240��ͼƬ
for count =1:1:30
   for i=1:1:8
       filename=strcat('att_faces\s',int2str(count),'\',int2str(i),'.pgm');
       %img{(count-1)*10+i-1}=imread(filename);
       img_temp=imread(filename);
       %y=imshow(filename)
       img(:,8*(count-1)+i)=reshape(img_temp,img_vec_length,1);
   end
end
img_mean=mean(img,2);%�����еľ�ֵ��Ϊ������
img_Z=img-img_mean;
[V, D] = eig(img_Z'*img_Z);%Ϊ�˼ӿ������ٶȣ���ͽ׾���Z'*Z������ֵ����������
[D_sort,index] = sort(diag(D),'descend');%������ֵ���н�������
V_sort = V(:,index);%����������������ֵ�Ľ����������
PCA_lamda=D_sort(1:40,1);%����ǰ40������ֵ
PCA_v=img_Z*V_sort(:,1:40);%����ǰ40������ֵ��Ӧ������������Ϊ���ɷ�
img_toshow=imgvec2mat(PCA_v(:,1),img_size);
PCA_vn=zeros(size(PCA_v));
for i=1:1:40
    PCA_vn(:,i)=PCA_v(:,i)/norm(PCA_v(:,i));%��һ���������������Ϊ�˵�3�ʵı��ڽ��в��Լ����ع�
end

%��ӡǰ15��������
figure(2);
for i = 1:1:15
    subplot(3,5,i);imshow(uint8(imgvec2mat(PCA_v(:,i),img_size)));
    title_name=strcat('������-',int2str(i));
    title(title_name);
end



%problem3 ���õõ���40������������Ϊ20��ͼƬ�Ĳ��Լ������ع����������Լ����ع����ͼƬ���жԱ�
Numbers_rct=10;%Numbers to need reconstruction
img_Need_reconstruction=zeros(img_vec_length,Numbers_rct);
for i=1:1:Numbers_rct%������Լ�ͼƬ��ͳһ������� img_Need_reconstruction
    if i<=10
        filename=strcat('C:\Users\haoli\OneDrive - smail.nju.edu.cn\��ҵ\������\���������Ӧ��\0428\att_faces\s',int2str(i),'\10.pgm');
        img_temp=imread(filename);
        img_Need_reconstruction(:,i)=reshape(img_temp,img_vec_length,1);
    else
      filename=strcat('C:\Users\haoli\OneDrive - smail.nju.edu.cn\��ҵ\������\���������Ӧ��\0428\att_faces\s',int2str(i+20),'\1.pgm'); 
      img_temp=imread(filename);
      img_Need_reconstruction(:,i)=reshape(img_temp,img_vec_length,1);
    end
end
%img_Recons������á����������ع����ͼƬ
img_Recons=zeros(img_vec_length,Numbers_rct);
figure(3);
img_Recons=Reconstruction(PCA_vn,img_Need_reconstruction,img_mean);  
%�����Ǵ�ӡͼƬ�ԶԱ�
for i=1:1:Numbers_rct
    if i<=Numbers_rct/2;
        subplot(4,5,i);
        imshow(uint8(imgvec2mat(img_Need_reconstruction(:,i),img_size)));
        title_name=strcat('���Լ�-',int2str(i));
        title(title_name);
        subplot(4,5,i+5);
        imshow(uint8(imgvec2mat(img_Recons(:,i),img_size)));
        title_name=strcat('�ؽ���Ĳ��Լ�-',int2str(i));
        title(title_name);
    else
        subplot(4,5,i+5);
        imshow(uint8(imgvec2mat(img_Need_reconstruction(:,i),img_size)));
        title_name=strcat('���Լ�-',int2str(i));
        title(title_name);
        subplot(4,5,i+10);
        imshow(uint8(imgvec2mat(img_Recons(:,i),img_size)));
        title_name=strcat('�ؽ���Ĳ��Լ�-',int2str(i));
        title(title_name);
    end
end
    
