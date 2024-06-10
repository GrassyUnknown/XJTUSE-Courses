% 请同学们在此编程，完成任务（一）：基于低通滤波器傅里叶变换的灰度图像去噪任务
clc; clear; close all;

original = imread('15_GT.png');
noisy = imread('15_noisy.png');

F_original = fftshift(fft2(double(original))); 
F_noisy = fftshift(fft2(double(noisy)));

% 计算和展示中心化对数傅里叶谱
log_F_original = log(abs(F_original)+1); 
log_F_noisy = log(abs(F_noisy)+1); 


D0 = 150; 
[M, N] = size(original);
lp_filter = ones(M, N);
for i = 1:M
    for j = 1:N
        distance = max(abs((i-M/2)),abs((j-N/2)));
        if distance > D0
            lp_filter(i, j) = 0;
        end
    end
end

F_filtered = F_noisy.*lp_filter;
filtered = uint8(abs(ifft2(ifftshift(F_filtered)))); 
log_F_filtered = log(abs(F_filtered)+1); 

% 计算SSIM RMSE PSNR
ssim_o = ssim(noisy, original);
rmse_o = rmse(noisy, original);
psnr_o = psnr(noisy, original);
ssim_fft = ssim(filtered, original);
rmse_fft = rmse(filtered, original);
psnr_fft = psnr(filtered, original);

% 展示图像和对应的中心化对数傅里叶谱
logAmplitude_I_noisy = mat2gray(log_F_noisy);
logAmplitude_I = mat2gray(log_F_original);
logAmplitude_I_denoised = mat2gray(log_F_filtered);

I_noisy = mat2gray(noisy);
I = mat2gray(original);
I_denoised = mat2gray(filtered);

% 按照蒙太奇方式进行展示
row1 = [I_noisy, I, I_denoised];
row2 = [logAmplitude_I_noisy, logAmplitude_I, logAmplitude_I_denoised];
total = cat(1, row1, row2);
figure; imshow(total,[]);

fprintf('SSIM: %.4f\nRMSE: %.4f\nPSNR: %.4f\n',ssim_o,rmse_o,psnr_o);
fprintf('SSIM: %.4f\nRMSE: %.4f\nPSNR: %.4f\n',ssim_fft,rmse_fft,psnr_fft);