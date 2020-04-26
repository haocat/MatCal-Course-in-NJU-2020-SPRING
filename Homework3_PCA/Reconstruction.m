%人脸重建函数
%输入PCA_vn：归一化的特征向量矩阵
%输入矩阵img_Needcond：待重建的测试及图片（一张图片作为一个列向量，组合成矩阵）
%输入列向量img_mean：训练集的均值
%输出矩阵img_Recons：重建后的图片
%算法参见课件《第9周第1课 - 矩阵的相似化简与特征分析5   第13页》
%注：课件中给出的对于单张图片的重构，以下程序实现的是对多张测试集图片的重构
function img_Recons=Reconstruction(PCA_vn,img_Needcond,img_mean)   
    mat_size=size(img_Needcond);
    img_Recons=zeros(mat_size);
    img_Z=img_Needcond-img_mean;
    img_Y=(PCA_vn'*img_Z);
    img_Recons=PCA_vn*img_Y+img_mean;

    

