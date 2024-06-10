net = alexnet;% 加载预训练的AlexNet模型
cam = webcam;% 创建webcam对象，以调用摄像头

% 循环执行图片分类
while true
    img = snapshot(cam); % 从webcam获取当前帧
    imgPreprocessed = imresize(img, [227 227]);% 对图像进行预处理以符合AlexNet的输入要求
    label = classify(net, imgPreprocessed);% 使用AlexNet进行分类
    % 显示结果
    image(img);
    title(char(label));
    drawnow;
end