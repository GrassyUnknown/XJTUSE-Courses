clc;clear;close all

% 读取数据集，将子文件夹名称作为类别名称
digitData = imageDatastore('MNIST','IncludeSubfolders',true,'LabelSource','foldernames');

% 检视每个类别的样本数量
countlabels = digitData.countEachLabel

% 按0.75/0.25的比例划分训练集和测试集
trainingNumFiles = 750;
[trainDigitData,testDigitData] = splitEachLabel(digitData,trainingNumFiles,"randomized");

%% 在这里搭建你的网络 %%
layers = [
    imageInputLayer([28 28 1]);
    convolution2dLayer(5,6)
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(5,16)
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    fullyConnectedLayer(540)
    reluLayer
    fullyConnectedLayer(190)
    reluLayer
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

%% 在这里设置你的网络参数 %%
options = trainingOptions( ...
    "sgdm", ...     % Stachastic Gradient Descent Method，随机梯度下降法，最常见的神经网络优化算法之一
    'MaxEpochs',10, ...     % 每遍历完一次训练数据集的时间为一个epoch
    'MiniBatchSize',128, ...    
    'InitialLearnRate',0.001, ...   % 影响网络收敛的重要参数
    'ExecutionEnvironment','gpu', ...  % 参数选择：(1) cpu - 单CPU计算; (2) parallel - 多CPU并行计算; (3) gpu - 单GPU计算
    'Plots','training-progress');

%% 训练和测试网络
% 训练
myNet = trainNetwork(trainDigitData,layers,options);

% 测试
predictedLabels = classify(myNet,testDigitData);

% 计算识别率
valLabels = testDigitData.Labels;
accuracy = sum(predictedLabels==valLabels)/numel(predictedLabels)