import re
from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import pandas as pd
browser = webdriver.Chrome()
browser.get('http://www.51job.com')
browser.find_element(By.XPATH,'//*[@id="kwdselectid" ]' ).send_keys('Python工程师')#在搜索框输入
browser.find_element(By.XPATH,'/html/body/div[3]/div/div[1]/div/button' ).click()#点击搜索
time.sleep(5)#等待网页完成搜索
p_job = 'class="jname at">(.*?)</span>'#寻找职位的正则表达式
p_salary = 'class="sal">(.*?)</span>'#寻找薪水的正则表达式
p_company = 'class="cname at">(.*?)</a>'#寻找单位名称的正则表达式
p_type='class="dc at">(.*?)</p>'#寻找单位类型的正则表达式
job = re.findall(p_job , browser.page_source)#找到职位数据
salary = re.findall(p_salary, browser.page_source)#找到薪水数据
company = re.findall(p_company, browser.page_source)#找到单位名称
type = re.findall(p_type, browser.page_source)#找到单位类型
for i in range(0,20):
    browser.find_element(By.CLASS_NAME,'btn-next').click()#点击下一页
    time.sleep(5)#等待加载
    job += re.findall(p_job , browser.page_source)
    salary += re.findall(p_salary, browser.page_source)
    company += re.findall(p_company, browser.page_source)
    type += re.findall(p_type, browser.page_source)
data = {'岗位':job,'薪水':salary,'单位名称':company,'单位类型':type}
data = pd.DataFrame(data)#将data转换为dataframe类型
data.to_excel('岗位薪水.xlsx' , index=False)#利用to_excel函数输出excel文件
