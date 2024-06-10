clear;
clc;

% 读取含雾图和原图
hazy_img = double(imread('forest.jpg'))/255;
GT_img = double(imread('forest_recovered.jpg'))/255;

hazy_img = imresize(hazy_img, 0.5);
GT_img = imresize(GT_img, 0.5);

% 直方图均衡化
tic;
hazy_img_hsi = rgb2hsi(hazy_img);
hazy_img_hsi(:,:,3) = histeq(hazy_img_hsi(:,:,3));
hazy_img_equalized = hsi2rgb(hazy_img_hsi);

% 计算均衡化后图像的评价指标
equalized_time = toc;
equalized_rmse = rmse(GT_img, hazy_img_equalized)*255;
equalized_psnr = psnr(GT_img, hazy_img_equalized);
equalized_ssim = ssim(GT_img, hazy_img_equalized);

% 直方图规定化
tic;
GT_img_hsi = rgb2hsi(GT_img);
hazy_img_hsi(:,:,3) = histeq(hazy_img_hsi(:,:,3), imhist(GT_img_hsi(:,:,3)));
hazy_img_matched = hsi2rgb(hazy_img_hsi);

% 计算规定化后图像的评价指标
matched_time = toc;
matched_rmse = rmse(GT_img, hazy_img_matched)*255;
matched_psnr = psnr(GT_img, hazy_img_matched);
matched_ssim = ssim(GT_img, hazy_img_matched);

% 暗通道先验算法
tic;
dehazed_img = dehaze(hazy_img);

% 计算暗通道先验算法去雾后图像的评价指标
dehazed_time = toc;
dehazed_rmse = rmse(GT_img, dehazed_img)*255;
dehazed_psnr = psnr(GT_img, dehazed_img);
dehazed_ssim = ssim(GT_img, dehazed_img);

% 暗通道先验算法（快速）
tic;
dehazed_fast_img = dehaze_fast(hazy_img);

% 计算暗通道先验算法（快速）去雾后图像的评价指标
dehazed_fast_time = toc;
dehazed_fast_rmse = rmse(GT_img, dehazed_fast_img)*255;
dehazed_fast_psnr = psnr(GT_img, dehazed_fast_img);
dehazed_fast_ssim = ssim(GT_img, dehazed_fast_img);

% 计算原图的评价指标
GT_rmse = rmse(GT_img, hazy_img)*255;
GT_psnr = psnr(GT_img, hazy_img);
GT_ssim = ssim(GT_img, hazy_img);

% 显示图像和直方图
figure;

% 显示原图
subplot(2,5,1);
imshow(GT_img);
title('Original Image');
subplot(2,5,6);
bar(imhist(GT_img));
title('Original Image Histogram');

% 显示含雾图像
subplot(2,5,2);
imshow(hazy_img);
title('Foggy Image');
subplot(2,5,7);
bar(imhist(hazy_img));
title('Foggy Image Histogram');

% 显示直方图均衡化后的图像
subplot(2,5,3);
imshow(hazy_img_equalized);
title('Equalized Image');
subplot(2,5,8);
bar(imhist(hazy_img_equalized));
title('Equalized Image Histogram');

% 显示直方图规定化后的图像
subplot(2,5,4);
imshow(hazy_img_matched);
title('Matched Image');
subplot(2,5,9);
bar(imhist(hazy_img_matched));
title('Matched Image Histogram');

% 显示暗通道先验算法去雾后的图像
subplot(2,5,5);
imshow(dehazed_fast_img);
title('Dehazed Image');
subplot(2,5,10);
bar(imhist(dehazed_fast_img));
title('Dehazed Image Histogram');

% 显示结果
disp('Original:');
disp(['rmse: ', num2str(GT_rmse)]);
disp(['psnr: ', num2str(GT_psnr)]);
disp(['ssim: ', num2str(GT_ssim)]);

disp('Direct Histogram Equalization:');
disp(['rmse: ', num2str(equalized_rmse)]);
disp(['psnr: ', num2str(equalized_psnr)]);
disp(['ssim: ', num2str(equalized_ssim)]);
disp(['Time: ', num2str(equalized_time), ' seconds']);

disp('Histogram Matching:');
disp(['rmse: ', num2str(matched_rmse)]);
disp(['psnr: ', num2str(matched_psnr)]);
disp(['ssim: ', num2str(matched_ssim)]);
disp(['Time: ', num2str(matched_time), ' seconds']);

disp('Dark Channel Prior:');
disp(['rmse: ', num2str(dehazed_rmse)]);
disp(['psnr: ', num2str(dehazed_psnr)]);
disp(['ssim: ', num2str(dehazed_ssim)]);
disp(['Time: ', num2str(dehazed_time), ' seconds']);

disp('Dark Channel Prior(Fast):');
disp(['rmse: ', num2str(dehazed_fast_rmse)]);
disp(['psnr: ', num2str(dehazed_fast_psnr)]);
disp(['ssim: ', num2str(dehazed_fast_ssim)]);
disp(['Time: ', num2str(dehazed_fast_time), ' seconds']);
