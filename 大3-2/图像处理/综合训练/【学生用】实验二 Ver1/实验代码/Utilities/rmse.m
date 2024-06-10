function output = rmse( X, Y )
%������ͼ��ľ�����MSE��Mean Squared Error��
%   X - ԭͼX
%   Y - ��������ͼ��Y
%   output - ���MSE
[M, N, C] = size(X);
if C == 3
    X = rgb2hsi(X);
    Y = rgb2hsi(Y);
%     X_HS = X(:,:,1:2);
%     Y_HS = Y(:,:,1:2);
    X = X(:,:,3);
    Y = Y(:,:,3);   
end
output = 0;
X = double(X);
Y = double(Y);
for i = 1 : M
    for j = 1 : N
         output = output + (X(i, j) - Y(i, j))^2;
    end
end
output = sqrt(output / (M * N));

end

