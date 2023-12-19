import numpy as np
import pylab as pl
from scipy import linalg


# 用广义特征向量计算的拟合椭圆
def ellipse(p, x, y):
    a, b, c, d, e, f = p
    return a * x ** 2 + b * x * y + c * y ** 2 + d * x + e * y + f


if __name__ == '__main__':
    np.random.seed(142)
    t = np.random.uniform(0, 2 * np.pi, 60)

    alpha = 0.4
    a = 0.5
    b = 1.0
    x = 1.0 + a * np.cos(t) * np.cos(alpha) - b * np.sin(t) * np.sin(alpha)
    y = 1.0 + a * np.cos(t) * np.sin(alpha) - b * np.sin(t) * np.cos(alpha)
    x += np.random.normal(0, 0.05, size=len(x))
    y += np.random.normal(0, 0.05, size=len(y))

    D = np.c_[x ** 2, x * y, y ** 2, x, y, np.ones_like(x)]
    A = np.dot(D.T, D)
    C = np.zeros((6, 6))
    C[[0, 1, 2], [2, 1, 0]] = 2, -1, 2
    evalues, evectors = linalg.eig(A, C)  # ❶
    evectors = np.real(evectors)
    err = np.mean(np.dot(D, evectors) ** 2, 0)  # ❷
    p = evectors[:, np.argmin(err)]  # ❸
    print(p)

    X, Y = np.mgrid[0:2:100j, 0:2:100j]
    Z = ellipse(p, X, Y)
    pl.plot(x, y, "ro", alpha=0.5)
    pl.contour(X, Y, Z, levels=[0])
    pl.show()
