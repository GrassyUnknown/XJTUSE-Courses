#Selenium模块是一个自动化测试工具，能够驱动浏览器模拟人的操作，如单击、键盘输入等。
from selenium import webdriver
from selenium.webdriver.common.by import By
import re
import pandas as pd
import time

#从获取的网页源代码中提取目标数据
def extract_data(html_code):
    #目标数据的正则表达式
    p_job = 'class="jname at">(.*?)</span>'
    p_salary = 'class="sal">(.*?)</span>'
    p_needs_city =  'class="info">.*?class="d at">.*?>(.*?)</span>'
    p_needs_exp =   'class="info">.*?class="d at">.*?>.*?</span>.*?</span>.*?>(.*?)</span>'
    p_needs_xueli = 'class="info">.*?class="d at">.*?>.*?</span>.*?</span>.*?</span>.*?</span>.*?>(.*?)</span>'
    p_link = 'class="er">.*?href="(.*?)"'
    p_company = 'class="er">.*?title="(.*?)".*?</a>'

    #利用findall()函数提取目标数据
    job = re.findall(p_job, html_code, re.S)
    salary = re.findall(p_salary, html_code, re.S)
    needs_city = re.findall(p_needs_city, html_code, re.S)
    needs_exp = re.findall(p_needs_exp, html_code, re.S)
    needs_xueli = re.findall(p_needs_xueli, html_code, re.S)
    link = re.findall(p_link, html_code, re.S)
    company = re.findall(p_company, html_code, re.S)

    #将几个目标数据列表转换为一个字典
    data_dt = {'职位名称': job, '月薪': salary, '岗位城市': needs_city, '要求经验': needs_exp, '要求学历': needs_xueli, '职位申请链接': link, '公司名称': company}
    #用上面的字典创建一个DataFrame
    return pd.DataFrame(data_dt)
def get_pages(keyword, city, start, end):
    # 声明要模拟的浏览器是Chrome,并启用无界面浏览模式
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument("--disable-blink-features=AutomationControlled")
    browser = webdriver.Chrome(options=chrome_options)
    browser.maximize_window()

    # 通过get()函数控制浏览器发起请求，访问网址,获取源码
    url = 'https://www.51job.com/'
    browser.get(url)
    #模拟人操作浏览器，输入搜索关键词，点击搜索按钮
    browser.find_element(By.XPATH, '//*[@id="kwdselectid"]').clear()
    browser.find_element(By.XPATH, '//*[@id="kwdselectid"]').send_keys(keyword)
    browser.find_element(By.XPATH, '/html/body/div[3]/div/div[1]/div/button').click()

    time.sleep(10)
    all_data = pd.DataFrame()
    for page in range(start, end + 1):
        # 模拟人操作浏览器，输入搜索关键词，点击搜索按钮
        browser.find_element(By.XPATH, '//*[@id="jump_page"]').clear()
        browser.find_element(By.XPATH, '//*[@id="jump_page"]').send_keys(page)
        browser.find_element(By.XPATH, '//*[@id="app"]/div/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div/span[3]').click()
        # 等待浏览器与服务器交互刷新数据，否则获取不到动态信息
        time.sleep(10)
        #将提取的目标数据添加到DataFrame中
        all_data = all_data._append(extract_data(browser.page_source))

    browser.quit()

    #将DataFrame保存为Excel
    all_data.to_excel('职位.xlsx', index=False)

get_pages('python','西安', 1, 3)
