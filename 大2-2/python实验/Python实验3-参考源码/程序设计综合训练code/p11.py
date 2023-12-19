import numpy as np
from scipy import optimize
from matplotlib.patches import Rectangle
import pylab as pl

X = np.array([8.19, 2.72, 6.39, 8.71, 4.7, 2.66, 3.78])
Y = np.array([7.01, 2.78, 6.47, 6.71, 4.1, 4.23, 4.05])

def residuals(p):  # ❶
    "计算以p为参数的直线和原始数据之间的误差"
    k, b = p
    return Y - (k * X + b)

def S(k, b):
    "计算直线y=k*x+b和原始数据X、Y的误差的平方和"
    error = np.zeros(k.shape)
    for x, y in zip(X, Y):
        error += (y - (k * x + b)) ** 2
    return error


if __name__ == '__main__':
    # leastsq使得residuals()的输出数组的平方和最小，参数的初始值为[1,0]
    r = optimize.leastsq(residuals, [1, 0])  # ❷
    k, b = r[0]
    print("k =", k, "b =", b)

    # %figonly=最小化正方形面积之和（左），误差曲面（右）
    scale_k = 1.0
    scale_b = 10.0
    scale_error = 1000.0

    ks, bs = np.mgrid[k - scale_k:k + scale_k:40j, b - scale_b:b + scale_b:40j]
    error = S(ks, bs) / scale_error

    fig = pl.figure(figsize=(12, 5))

    ax1 = pl.subplot(121)

    ax1.plot(X, Y, "o")
    X0 = np.linspace(2, 10, 3)
    Y0 = k * X0 + b
    ax1.plot(X0, Y0)

    for x, y in zip(X, Y):
        y2 = k * x + b
        rect = Rectangle((x, y), abs(y - y2), y2 - y, facecolor="red", alpha=0.2)
        ax1.add_patch(rect)

    ax1.set_aspect("equal")

    ax2 = fig.add_subplot(122, projection='3d')

    ax2.plot_surface(
        ks, bs / scale_b, error, rstride=3, cstride=3, cmap="jet", alpha=0.5)
    ax2.scatter([k], [b / scale_b], [S(k, b) / scale_error], c="r", s=20)
    ax2.set_xlabel("$k$")
    ax2.set_ylabel("$b$")
    ax2.set_zlabel("$error$")
    pl.show()
