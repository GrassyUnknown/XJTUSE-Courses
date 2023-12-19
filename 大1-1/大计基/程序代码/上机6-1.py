daylist=[31,28,31,30,31,30,31,31,30,31,30,31]
def isLeap(n):#判断是不是闰年
    if n%4==0:
        if n%100==0:
            if n%400==0:
                return 1
            return 0
        return 1
    return 0
def Ready(n):#判断输入的内容是否有效；返回数据、更新daylist
    if len(n)!=3:
        return 0
    else:
        for i in range(0,3):
            if not n[i].isdigit():
                return 0
        year=int(n[0])
        month=int(n[1])
        day=int(n[2])
        if isLeap(year)==1:
            daylist[1]=29
        if year>9999 or month>12 or day>daylist[month-1] or year*month*day==0:
            return 0
        return [year,month,day]

inlist=input('输入日期，如2021-1-1\n').split('-')
list=Ready(inlist)
if list==0:
    print('输入无效')
else:
    sumday=0
    for i in range(0,list[1]-1):
        sumday+=daylist[i]
    sumday+=list[2]
    print('这是',list[0],'年的第',sumday,'天')


