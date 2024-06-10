close all
clear
clc

% 读取原图像lena.bmp和有噪声图像lena_noise.bmp
lena = imread('lena.bmp');
lena_noise = imread('lena_noise.bmp');

% 计算原图像的傅里叶变换
F_lena = fft2(double(lena));
F_lena_shifted = fftshift(F_lena);
% 取对数变换
log_F_lena = log(1 + abs(F_lena_shifted));

% 计算有噪声图像的傅里叶变换
F_lena_noise = fft2(double(lena_noise));
F_lena_noise_shifted = fftshift(F_lena_noise);
% 取对数变换
log_F_lena_noise = log(1 + abs(F_lena_noise_shifted));

% 定义带通滤波器
[M, N] = size(lena);
cutoff_frequency_low = 75; % 低频截止频率
cutoff_frequency_high = 85; % 高频截止频率
bandpass_filter = zeros(M, N);
centerX = ceil(N / 2);
centerY = ceil(M / 2);
for i = 1:M
    for j = 1:N
        distance = sqrt((i - centerX)^2 + (j - centerY)^2);
        if distance <= cutoff_frequency_low || distance >= cutoff_frequency_high
            bandpass_filter(i, j) = 1;
        end
    end
end

% 将滤波器与傅里叶谱相乘
F_lena_noise_filtered = F_lena_noise_shifted .* bandpass_filter;

% 进行傅里叶反变换
filtered_lena_noise = ifft2(ifftshift(F_lena_noise_filtered));
filtered_lena_noise = real(filtered_lena_noise);

figure;
% 原图及有噪声图像的傅里叶谱图像
subplot(2, 2, 1);
imshow(lena);
title('原始 Lena 图像');

subplot(2, 2, 2);
imshow(log_F_lena, []);
title('原始 Lena 图像的傅里叶谱');

subplot(2, 2, 3);
imshow(lena_noise);
title('带噪声 Lena 图像');

subplot(2, 2, 4);
imshow(log_F_lena_noise, []);
title('带噪声 Lena 图像的傅里叶谱');

figure;
% 绘制频率域滤波器 H
subplot(1, 2, 1);
imshow(bandpass_filter, []);
title('频率域滤波器 H');

% 绘制 H*F
subplot(1, 2, 2);
imshow(log(1 + abs(F_lena_noise_filtered)), []);
title('H * F');

figure;
% 滤波后的图像
subplot(1, 3, 1);
imshow(filtered_lena_noise, []);
title('滤波后 Lena 图像');

subplot(1, 3, 2);
imshow(lena);
title('原始 Lena 图像');

subplot(1, 3, 3);
imshow(lena_noise);
title('带噪声 Lena 图像');
