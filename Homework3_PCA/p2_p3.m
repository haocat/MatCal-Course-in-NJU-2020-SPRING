%problem2 保留最大的 40 个特征值对应的特征向量作为“特征脸”；显示出前 15 个“特征脸”图像。 
%得到的40个“特征脸”保存在PCA_v，“特征脸”归一化保存在PCA_vn
Numbers=240;%训练集图片数目
img_size=[112,92];%图片尺寸
img_vec_length=img_size(1)*img_size(2);%图片向量化后的向量的长度
img=zeros(img_vec_length,Numbers);%训练集的所有图片存放的矩阵
%读入240幅图片
for count =1:1:30
   for i=1:1:8
       filename=strcat('att_faces\s',int2str(count),'\',int2str(i),'.pgm');
       %img{(count-1)*10+i-1}=imread(filename);
       img_temp=imread(filename);
       %y=imshow(filename)
       img(:,8*(count-1)+i)=reshape(img_temp,img_vec_length,1);
   end
end
img_mean=mean(img,2);%所有行的均值作为列向量
img_Z=img-img_mean;
[V, D] = eig(img_Z'*img_Z);%为了加快运算速度，求低阶矩阵Z'*Z的特征值和特征向量
[D_sort,index] = sort(diag(D),'descend');%对特征值进行降序排序
V_sort = V(:,index);%对特征向量按特征值的降序进行排序
PCA_lamda=D_sort(1:40,1);%保留前40个特征值
PCA_v=img_Z*V_sort(:,1:40);%保留前40个特征值对应的特征向量作为主成分
img_toshow=imgvec2mat(PCA_v(:,1),img_size);
PCA_vn=zeros(size(PCA_v));
for i=1:1:40
    PCA_vn(:,i)=PCA_v(:,i)/norm(PCA_v(:,i));%归一化后的特征向量，为了第3问的便于进行测试集的重构
end

%打印前15张特征脸
figure(2);
for i = 1:1:15
    subplot(3,5,i);imshow(uint8(imgvec2mat(PCA_v(:,i),img_size)));
    title_name=strcat('特征脸-',int2str(i));
    title(title_name);
end



%problem3 利用得到的40张特征脸对作为20张图片的测试集进行重构，并将测试集和重构后的图片进行对比
Numbers_rct=10;%Numbers to need reconstruction
img_Need_reconstruction=zeros(img_vec_length,Numbers_rct);
for i=1:1:Numbers_rct%读入测试集图片，统一存入矩阵 img_Need_reconstruction
    if i<=10
        filename=strcat('C:\Users\haoli\OneDrive - smail.nju.edu.cn\作业\大三下\矩阵计算与应用\0428\att_faces\s',int2str(i),'\10.pgm');
        img_temp=imread(filename);
        img_Need_reconstruction(:,i)=reshape(img_temp,img_vec_length,1);
    else
      filename=strcat('C:\Users\haoli\OneDrive - smail.nju.edu.cn\作业\大三下\矩阵计算与应用\0428\att_faces\s',int2str(i+20),'\1.pgm'); 
      img_temp=imread(filename);
      img_Need_reconstruction(:,i)=reshape(img_temp,img_vec_length,1);
    end
end
%img_Recons存放利用“特征脸”重构后的图片
img_Recons=zeros(img_vec_length,Numbers_rct);
figure(3);
img_Recons=Reconstruction(PCA_vn,img_Need_reconstruction,img_mean);  
%以下是打印图片以对比
for i=1:1:Numbers_rct
    if i<=Numbers_rct/2;
        subplot(4,5,i);
        imshow(uint8(imgvec2mat(img_Need_reconstruction(:,i),img_size)));
        title_name=strcat('测试集-',int2str(i));
        title(title_name);
        subplot(4,5,i+5);
        imshow(uint8(imgvec2mat(img_Recons(:,i),img_size)));
        title_name=strcat('重建后的测试集-',int2str(i));
        title(title_name);
    else
        subplot(4,5,i+5);
        imshow(uint8(imgvec2mat(img_Need_reconstruction(:,i),img_size)));
        title_name=strcat('测试集-',int2str(i));
        title(title_name);
        subplot(4,5,i+10);
        imshow(uint8(imgvec2mat(img_Recons(:,i),img_size)));
        title_name=strcat('重建后的测试集-',int2str(i));
        title(title_name);
    end
end
    
