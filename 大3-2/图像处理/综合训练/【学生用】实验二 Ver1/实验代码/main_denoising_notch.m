% 任务（二）：基于陷波滤波器傅里叶变换的灰度图像去噪任务
clc;clear;close all
addpath Data
addpath Utilities
%% 傅里叶变换
% 读取无噪原图像及其居中对数傅里叶谱
I = imread('06_GT.png');
frequency_I = fft2(I);
frequency_I = fftshift(frequency_I);
amplitude_I = abs(frequency_I);
logAmplitude_I = log(amplitude_I+1);

% 读取噪声图像及频率矩阵并使坐标系原点中心化
I_noisy = imread('06_noisy.png');
frequency_I_noisy = fft2(I_noisy);
frequency_I_noisy = fftshift(frequency_I_noisy);

% 噪声图像的居中对数傅里叶谱（仅用于显示）
amplitude_I_noisy = abs(frequency_I_noisy);
logAmplitude_I_noisy = log(amplitude_I_noisy+1);

%% 仅用于选取傅里叶谱的亮点坐标
figure;imshow(logAmplitude_I_noisy,[]);title('点击左键读取坐标（坐标系原点位于图像中心）')

% 交互式函数，点击鼠标左键获取图像点位坐标
mouse_track()

%% 构造滤波函数(用于NH47)
% ****************************** 请同学们在此补全函数 *************************************
% ********找到6个最佳滤波点位坐标，并把下列陷波滤波器函数参数中的“*”换成对应点位坐标********
% ************例如，找到的点位坐标为x=1,y=2，则Hk = notch_filter(I_noisy,1,2);*************
%  H1 = notch_filter(I_noisy,60,30);
%  H2 = notch_filter(I_noisy,0,60);
%  H3 = notch_filter(I_noisy,-60,30);
%  H4 = notch_filter(I_noisy,60,90);
%  H5 = notch_filter(I_noisy,-60,90);
%  H6 = notch_filter(I_noisy,0,120);
%  H = H1.*H2.*H3.*H4.*H5.*H6;

%% 构造滤波函数(用于NH06)
% ****************************** 请同学们在此补全函数 *************************************
% ********找到9个最佳滤波点位坐标，并把下列陷波滤波器函数参数中的“#”换成对应点位坐标********
% ************例如，找到的点位坐标为x=1,y=2，则Hk = notch_filter(I_noisy,1,2);*************
 H1 = notch_filter(I_noisy,-6,-38);
 H2 = notch_filter(I_noisy,-8,-78);
 H3 = notch_filter(I_noisy,-12,-118);
 H4 = notch_filter(I_noisy,-13,-158);
 H5 = notch_filter(I_noisy,14,-144);
 H6 = notch_filter(I_noisy,14,-186);
 H7 = notch_filter(I_noisy,7,-224);
 H8 = notch_filter(I_noisy,17,-102);
 H9 = notch_filter(I_noisy,23,-64);
 H = H1.*H2.*H3.*H4.*H5.*H6.*H7.*H8.*H9;

%% 傅里叶逆变换
frequency_I_denoised = frequency_I_noisy .* H;
frequency_I_denoised = ifftshift(frequency_I_denoised);
I_denoised = real(ifft2(frequency_I_denoised));

% 去噪图像的居中对数傅里叶谱（仅用于显示）
amplitude_I_denoised = abs(frequency_I_denoised);
logAmplitude_I_denoised = log(amplitude_I_denoised+1);
logAmplitude_I_denoised = fftshift(logAmplitude_I_denoised);

% 将所有图像转换为[0,255],uint8型
I_denoised = uint8(I_denoised);

%% 显示图像及幅度谱
% % 图像
% subplot(2,3,1);imshow(I_noisy);title('噪声图像');
% subplot(2,3,2);imshow(I);title('原图像');
% subplot(2,3,3);imshow(I_denoised,[]);title('去噪图像');
% 
% % 居中对数傅里叶谱
% subplot(2,3,4);imshow(logAmplitude_I_noisy,[]);title('噪声图像居中对数傅里叶谱')
% subplot(2,3,5);imshow(logAmplitude_I,[]);title('原图像居中对数傅里叶谱')
% subplot(2,3,6);imshow(logAmplitude_I_denoised,[]);title('去噪图像居中对数傅里叶谱')

%% 蒙太奇方式显示图像及其对数幅度谱
row1 = [I_noisy,I,I_denoised];
row2 = [rescale(logAmplitude_I_noisy,0,255),rescale(logAmplitude_I,0,255),rescale(logAmplitude_I_denoised,0,255)];
total = cat(1,row1,row2);
figure;imshow(total,[]);

%% 计算PSNR和SSIM
% 原图像
rmse_I_noisy = rmse(I_noisy,I);
psnr_I_noisy = psnr(I_noisy,I);
ssim_I_noisy = ssim(I_noisy,I);
fprintf('去噪前：RMSE = %.2f, PSNR = %.2f, SSIM = %.3f\n',rmse_I_noisy,psnr_I_noisy,ssim_I_noisy);

% 去噪图像
rmse_I_denoised = rmse(I_denoised,I);
psnr_I_denoised = psnr(I_denoised,I);
ssim_I_denoised = ssim(I_denoised,I);
fprintf('去噪后：RMSE = %.2f, PSNR = %.2f, SSIM = %.3f\n',rmse_I_denoised,psnr_I_denoised,ssim_I_denoised);