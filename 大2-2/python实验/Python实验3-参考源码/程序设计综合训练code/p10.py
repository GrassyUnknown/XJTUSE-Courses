from math import sin
from scipy import optimize
def f(x):  # ❶
    x0, x1, x2 = x.tolist()  # ❷
    return [
        5 * x2 + 3,
        4 * x0 * x0 - 2 * sin(x1 * x2),
        x1 * x0 - 1.5
    ]
result = optimize.fsolve(f, [1, 1, 1])  # ❸
print(result)
print(f(result))
