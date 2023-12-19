a=int(input("请输入一个三位整数"))
b=int(a/100)
c=int((a-100*b)/10)
d=a-100*b-10*c
print("反序整数为",100*d+10*c+b)
