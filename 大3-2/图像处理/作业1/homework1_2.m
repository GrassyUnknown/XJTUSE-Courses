clear;

% 读取原图像和匹配图像
original = imread('original.bmp');
reference = imread('reference.jpg');

% 计算原图像和匹配图像的直方图
original_hist = imhist(original);
reference_hist = imhist(reference);

% 计算原图像和匹配图像的CDF
original_cdf = cumsum(original_hist) / numel(original);
reference_cdf = cumsum(reference_hist) / numel(reference);

matched_image = zeros(size(original));

% 直方图匹配
for intensity = 0:255
    % 找到原图像的当前灰度级对应的累积分布函数值
    original_cdf_value = original_cdf(intensity + 1);
    
    % 在参考图像的累积分布函数中找到最接近的值
    [~, index] = min(abs(reference_cdf - original_cdf_value));
    
    % 使用找到的匹配灰度级进行匹配
    matched_image(original == intensity) = index - 1;
end

matched_image = uint8(matched_image);

% 绘制图像及其各自直方图
figure;
subplot(2, 3, 1); imshow(original); title('Original Image');
subplot(2, 3, 2); imshow(reference); title('Reference Image');
subplot(2, 3, 3); imshow(matched_image); title('Matched Image');

subplot(2, 3, 4); bar(imhist(original)); title('Original Histogram');
subplot(2, 3, 5); bar(imhist(reference)); title('Reference Histogram');
subplot(2, 3, 6); bar(imhist(matched_image)); title('Matched Histogram');
