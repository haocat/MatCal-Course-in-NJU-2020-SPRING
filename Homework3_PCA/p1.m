Numbers=300;
img_size=[112,92];%图像的尺寸
img_vec_length=img_size(1)*img_size(2);%图像列向量化后的向量的长度
img=zeros(img_vec_length,Numbers);%img多张图片构成的矩阵
%读入300幅图片
for count =1:1:30
   for i=1:1:10
       filename=strcat('att_faces\s',int2str(count),'\',int2str(i),'.pgm');
       %img{(count-1)*10+i-1}=imread(filename);
       img_temp=imread(filename);
       %y=imshow(filename)
       img(:,10*(count-1)+i)=reshape(img_temp,img_vec_length,1);
   end
end


%problem1给出“均值脸”
sum=zeros(img_vec_length,1);
for count =1:1:300
    sum=sum+img(:,count);
end
img_vec_average=sum/Numbers;
img_average=imgvec2mat(img_vec_average,img_size)
figure(1);
imshow(uint8(img_average));
title('平均脸');



