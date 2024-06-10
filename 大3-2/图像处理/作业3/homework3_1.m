clear;
clc;
img = imread('lena.bmp');
% 计算灰度图像中每个像素值的频率
numPixels = numel(img);
[uniqueSymbols, ~, symbolCounts] = unique(img);
symbolCounts = accumarray(symbolCounts, 1);
symbolProbabilities = symbolCounts / numPixels;
% 构建霍夫曼树和霍夫曼编码
huffmanTree = buildHuffmanTree(uniqueSymbols, symbolProbabilities);
huffmanCodes = generateHuffmanCodes(huffmanTree, uniqueSymbols);
% 这是因为huffmanCodes实际上是symbol和code构成的二维数组，且以code为顺序升序
huffmanCodes = sortrows(huffmanCodes, 1);

fprintf('Symbol  Probability     Huffman Code\n');
for i = 1:numel(uniqueSymbols)
    fprintf('%d\t\t%f\t\t%s\n', huffmanCodes{i,1},symbolProbabilities(i), huffmanCodes{i,2});
end

% 平均长度
averageLength = sum(symbolProbabilities .* cellfun(@length, huffmanCodes));
fprintf('Average Length: %f\n',averageLength(2));
% 压缩比值
compressionRatio = 8 / averageLength(2); 
fprintf('Compression Ratio:%f\n ',compressionRatio);

% 构建霍夫曼树
function huffmanTree = buildHuffmanTree(symbols, probabilities)
    numSymbols = numel(symbols);
    leafNodes = cell(numSymbols, 1);
    for i = 1:numSymbols
        leafNodes{i} = struct('symbol', symbols(i), 'probability', probabilities(i));
    end
    while numel(leafNodes) > 1
        % 按概率升序排序叶子节点
        [~, sortedIndices] = sort(cellfun(@(x) x.probability, leafNodes));
        sortedLeafNodes = leafNodes(sortedIndices);
        % 取最小概率的两个节点，合并为一个新节点
        newNode = struct('left', sortedLeafNodes{1}, 'right', sortedLeafNodes{2}, 'symbol', [],...
                         'probability', sortedLeafNodes{1}.probability + sortedLeafNodes{2}.probability);              
        % 从叶子节点列表中移除被合并的节点
        leafNodes = sortedLeafNodes(3:end);
        % 将新节点添加到叶子节点列表
        leafNodes{end+1} = newNode;
    end
    huffmanTree = leafNodes{1};
end


% 生成霍夫曼编码
function codes = generateHuffmanCodes(tree, symbols, prefix)
    if nargin < 3
        prefix = '';
    end
    if ~isempty(tree.symbol) % 叶子
        index = find(strcmp(symbols, tree.symbol)); % 找到符号在列表中的索引
        codes = {tree.symbol, prefix}; % 以符号为键值对应编码
    else % 非叶子
        leftCodes = generateHuffmanCodes(tree.left, symbols, [prefix '0']);
        rightCodes = generateHuffmanCodes(tree.right, symbols, [prefix '1']);
        codes = [leftCodes; rightCodes];
    end
end



