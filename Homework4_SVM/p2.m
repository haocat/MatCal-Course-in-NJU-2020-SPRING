clear all;
img_ori=double(imread('lena.bmp'));
img_watermark=double(imread('cameraman.tif'));
[U,S ,V]=svd(img_ori);
%分别以强度0.1，0.5嵌入水印
[U_1,V_1,img_1]=towatermark(U,S,V,img_watermark,0.1);
[U_5,V_5,img_5]=towatermark(U,S,V,img_watermark,0.5);
%检测水印
Wt_1=dewatermark(U_1,V_1,img_1,0.1,S);
Wt_5=dewatermark(U_5,V_5,img_1,0.5,S);

figure(1);
subplot(2,3,1);imshow(uint8(img_ori));title('original photo');
subplot(2,3,4);imshow(uint8(img_watermark));title('watermark');
subplot(2,3,2);imshow(uint8(img_1));title('0.1 watermarked photo ');
subplot(2,3,3);imshow(uint8(img_5));title('0.5 watermarked photo ');
subplot(2,3,5);imshow(uint8(Wt_1));title('0.1 detected watermark  ');
subplot(2,3,6);imshow(uint8(Wt_5));title('0.5 detected watermark  ');




