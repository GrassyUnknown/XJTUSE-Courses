clear;

% 读取原始图像
original = imread('001.png');

% 计算原始图像直方图
original_hist = imhist(original);

% 计算原图像的CDF
num_pixels = numel(original);
original_cdf = cumsum(original_hist) / numel(original);

% 直方图均衡
equalized = uint8(255 * original_cdf(original + 1));

% 显示均衡化后的图像及其直方图
figure;
subplot(2, 2, 1); imshow(original); title('Original Image');
subplot(2, 2, 2); bar(imhist(original)); title('Original Histogram');

subplot(2, 2, 3); imshow(equalized); title('Equalized Image');
subplot(2, 2, 4); bar(imhist(equalized)); title('Equalized Histogram');
