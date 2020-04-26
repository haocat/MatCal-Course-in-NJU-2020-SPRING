%图像向量转为矩阵的函数
%输入列向量img_vec：图像的列向量形式
%输入img_size：图片的尺寸  [横向，纵向]
%输出img_mat：图像的矩阵形式 
%注意：输出是double形式的矩阵，无法直接被打印，打印前务必加上uint进行强制类型转换！！！！
function img_mat=imgvec2mat(img_vec,img_size)
    img_mat=reshape(img_vec',img_size(1),img_size(2));
    
