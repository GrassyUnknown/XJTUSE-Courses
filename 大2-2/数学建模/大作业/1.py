import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
plt.rcParams["font.sans-serif"]=["SimHei"]
df = pd.read_excel('data.xls')
wens=np.zeros((3,3),dtype=int)
labels=["战国","战国末","春秋早"]
for i in range(0,len(df["实验编号"])):
    if df["纹饰"][i]=="蜻蜓眼":
        j=0
    elif df["纹饰"][i]=="单色玻璃":
        j=1
    elif df["纹饰"][i]=="费昂斯":
        j=2
    if df["出产年代"][i]=="战国":
        wens[j][0]+=1
    elif df["出产年代"][i]=="战国末":
        wens[j][1]+=1
    elif df["出产年代"][i]=="春秋早":
        wens[j][2]+=1
    
plt.bar(labels,wens[0],label="蜻蜓眼")
plt.bar(labels,wens[1],bottom=wens[0],label="单色玻璃")
plt.bar(labels,wens[2],bottom=(wens[0]+wens[1]),label="费昂斯")
plt.legend()
plt.show()


types=np.zeros((3,5),dtype=int)
labelws=["战国蜻蜓眼","战国单色玻璃","战国末蜻蜓眼","战国末单色玻璃","春秋早费昂斯"]
for i in range(0,len(df["实验编号"])):
    if df["纹饰"][i]=="蜻蜓眼" and df["出产年代"][i]=="战国":
        j=0
    elif df["纹饰"][i]=="单色玻璃" and df["出产年代"][i]=="战国":
        j=1
    elif df["纹饰"][i]=="蜻蜓眼" and df["出产年代"][i]=="战国末":
        j=2
    elif df["纹饰"][i]=="单色玻璃" and df["出产年代"][i]=="战国末":
        j=3
    elif df["纹饰"][i]=="费昂斯" and df["出产年代"][i]=="春秋早":
        j=4
    if df["类型"][i]=="高钾":
        types[0][j]+=1
    elif df["类型"][i]=="铅钡":
        types[1][j]+=1
    elif df["类型"][i]=="高钠铅钡":
        types[2][j]+=1

plt.bar(labelws,types[0],label="高钾")
plt.bar(labelws,types[1],bottom=types[0],label="铅钡")
plt.bar(labelws,types[2],bottom=(types[0]+types[1]),label="高钠铅钡")
plt.legend()
plt.show()
