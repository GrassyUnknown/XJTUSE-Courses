% 请同学们参照附件一，完成main.m, im2jpeg.m和jpeg2im.m三个函数的编程
clear;
clc;
I = imread('Dusk.bmp');

maxPSNR = 0;
maxiPSNR = 0;
maxSSIM = 0;
maxiSSIM = 0;
i=1.65;
    I_g = rgb2gray(I);
    J = im2jpeg(I_g, i);
    I_rec = jpeg2im(J);
    CR = imratio(I_g, J.huffman.code);
    PSNR = psnr(I_rec, I_g, 255);
    SSIM = ssim(I_rec, I_g);
imshow(I_rec);
%     if(PSNR>maxPSNR)
%         maxPSNR=PSNR;
%         maxiPSNR = i;
%     end
%     if(SSIM>maxSSIM)
%         maxSSIM=SSIM;
%         maxiSSIM = i;
%     end
% end

fprintf('%d Bytes.PSNR is %.4f ,SSIM is %.4f, CR is %.4f when i = %.3f\n', J.huffman.size(1),PSNR ,SSIM , CR,i);