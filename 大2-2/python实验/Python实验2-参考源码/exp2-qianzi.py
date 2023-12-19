import cv2

#读取工程文件下的图片，也可使用绝对路径，cv2读取的是BGR格式
img = cv2.imread('qianzi.jpg')
#BGR转灰度图
img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#二值化，调整thresh值（125）直到获得较好结果
ret, img1 = cv2.threshold(img, 125, 255, cv2.THRESH_BINARY)
img4 = cv2.imwrite('qianzi-binary.jpg', img1)
#转为BGRA，带透明度的四通道
img2 = cv2.cvtColor(img1, cv2.COLOR_GRAY2BGRA)
#图片shape属性是tuple类型，元组
print(img2.shape)
#遍历所有像素，白色像素（255）的透明度设置为透明（0）
for i in range(img2.shape[0]):
    for j in range(img2.shape[1]):
        if img2[i, j][0] == 255:
            img2[i, j][3] = 0
#保存为新图片
img3 = cv2.imwrite('qianzi-binary.png', img2)

