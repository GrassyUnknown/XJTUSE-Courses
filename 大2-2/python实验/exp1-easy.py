import re
from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import pandas as pd
#声明使用Chrome
browser = webdriver.Chrome()
browser.get('http://www.51job.com')
#在搜索框输入关键词
browser.find_element(By.XPATH,'//*[@id="kwdselectid"]').send_keys('Python工程师')
#点击搜索按钮
browser.find_element(By.XPATH,'/html/body/div[3]/div/div[1]/div/button').click()
#等待浏览器与服务器交互刷新数据，否则获取不到动态信息
time.sleep(5)
#目标数据的正则表达式
p_job = 'class="jname at">(.*?)</span>'
p_salary = 'class="sal">(.*?)</span>'
#提取目标数据
job = re.findall(p_job,browser.page_source)
salary = re.findall(p_salary,browser.page_source)
#保存目标数据
data = {'岗位':job,'薪水':salary}
data = pd.DataFrame(data)
#创建Excel文件，保存目标数据
data.to_excel('岗位薪水.xlsx', index=False)
