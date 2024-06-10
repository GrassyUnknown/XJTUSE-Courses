% 读取图像
I = imread('regiongrowing.bmp');

% 显示原始图像
figure;
subplot(2, 3, 1);
imshow(I);
title('Original Image');

% 设置种子点
seed1 = [125, 100]; % 前景种子点
seed2 = [200, 200]; % 背景种子点

% 定义阈值
threshold = 20;
subplot(2, 3, 4);
% 基于第一个种子点的区域增长
segmented1 = myRegionGrowing(I, seed1, threshold);

% 显示第一个种子点的区域增长效果图
subplot(2, 3, 2);
imshow(segmented1);
title('Segmentation with Seed 1');

subplot(2, 3, 5);
% 基于第二个种子点的区域增长
segmented2 = myRegionGrowing(I, seed2, threshold);

% 显示第二个种子点的区域增长效果图
subplot(2, 3, 3);
imshow(segmented2);
title('Segmentation with Seed 2');


function segmented = myRegionGrowing(I, seed, threshold)
    % 初始化输出图像
    segmented = zeros(size(I));
    [rows, cols] = size(I);
    
    % 访问标记数组，标记已经添加到区域中的像素
    visited = false(size(I));
    
    % 队列用于存储待处理的像素坐标
    queue = zeros(rows*cols, 2);
    queueSize = 0;
    
    % 添加种子点到队列中
    queueSize = queueSize + 1;
    queue(queueSize, :) = seed;
    
    % 区域增长过程
    while queueSize > 0
        % 从队列中取出当前像素的坐标
        currentPixel = queue(queueSize, :);
        queueSize = queueSize - 1;
        x = currentPixel(1);
        y = currentPixel(2);
        
        % 检查当前像素是否已经访问过
        if visited(x, y)
            continue;
        end
        
        % 标记当前像素为已访问
        visited(x, y) = true;
        
        % 将当前像素添加到分割结果中
        segmented(x, y) = 1;
        
        % 检查当前像素的相邻像素
        for dx = -1:1
            for dy = -1:1
                % 计算相邻像素的坐标
                nx = x + dx;
                ny = y + dy;
                
                % 检查相邻像素是否在图像范围内
                if nx < 1 || nx > rows || ny < 1 || ny > cols
                    continue;
                end
                
                % 检查相邻像素是否已经访问过
                if visited(nx, ny)
                    continue;
                end
                
                % 计算当前像素与相邻像素的灰度差
                diff = abs(int32(I(nx, ny)) - int32(I(x, y)));
                
                % 如果灰度差小于阈值，则将相邻像素添加到队列中
                if diff <= threshold
                    queueSize = queueSize + 1;
                    queue(queueSize, :) = [nx, ny];
                end
            end
        end
        
        % 每经过一定数量的迭代后，显示中间效果图
        if mod(queueSize, 100) == 0
            imshow(segmented);
            drawnow;
        end
    end
end