import requests
import re

response = requests.get("http://se.xjtu.edu.cn")
result=response.text.encode("ISO-8859-1").decode("utf-8")
source='list\.jsp\?urltype=tree\.TreeTempUrl&wbtreeid=\d\d\d\d">(.*?)</a></li>'
data=re.findall(source, result)
print(data)
