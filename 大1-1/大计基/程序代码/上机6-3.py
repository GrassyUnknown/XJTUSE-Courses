height=float(input('输入身高'))
weight=float(input('输入体重'))
BMI=round(weight/(height)**2,1)
print('BMI',BMI,end=' ')
if BMI>=28:
    print('肥胖')
if 24<=BMI<=27.9:
    print('偏胖')
if 18.5<=BMI<=23.9:
    print('正常')
if BMI<18.5:
    print('偏瘦')
