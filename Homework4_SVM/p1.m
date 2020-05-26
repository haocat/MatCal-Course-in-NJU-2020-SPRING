img=double(imread('lena.bmp'));
img_size=size(img);
[U,S ,V]=svd(img);
%��ѹ���ȼ��㱣��������ֵ����
compression_ratio=1.5;
numbers=uint8(img_size(1)^2/(compression_ratio*(2*img_size(1)+1)));
fprintf('\n��ѹ����Ϊ%4.2fʱ������������ֵ����Ϊ%d',compression_ratio,numbers);
img_tar=U(:,1:numbers)*S(1:numbers,1:numbers)*(V(:,1:numbers))';
%img-img_tar;
figure(1);
subplot(1,2,1);
imshow(uint8(img));
title('original photo')
subplot(1,2,2);
imshow(uint8(img_tar));
title('compressed photo using SVM');
%���� MSE �������PSNR��ֵ-��ֵ�����

a=reshape (img,img_size(1)*img_size(2),1);
b=reshape (img_tar,img_size(1)*img_size(2),1);
MSE=(norm(a-b,2))^2/(img_size(1)*img_size(2));
PSNR=20*log10(255/sqrt(MSE));
fprintf('\nMSE= %8.4f\nPSNR=%8.4f',MSE,PSNR);
