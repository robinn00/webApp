# -*- coding: utf-8 -*-
import Image
import ImageEnhance
import ImageFilter
import sys
from pytesser import *
from PIL import Image as iim


from selenium import webdriver
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.remote import command
import urllib



# 二值化
threshold = 140
table = []
for i in range(256):
    if i < threshold:
        table.append(0)
    else:
        table.append(1)

#由于都是数字
#对于识别成字母的 采用该表进行修正

'''
rep={'O':'0',
    'I':'1','L':'1',
    'Z':'2',
    'S':'8'
    };
'''

rep = {'0': 'O', '1': 'I', '1': 'L', '2': 'Z', '8': 'S','?': 'R','.':'L','(':'C'}

def  getverify1(name):
    #打开图片
    im = Image.open(name)
    #转化到亮度
    imgry = im.convert('L')
    imgry.save('g'+name)
    #二值化
    out = imgry.point(table,'1')
    out.save('b'+name)
    #识别
    text = image_to_string(out)
    #识别对吗
    text = text.strip()
    text = text.lstrip()
    text = text.rstrip()
    text = text.upper()
    text = text.replace(' ', '')
    text = text.replace('`', '')


    for r in rep:
        text = text.replace(r,rep[r])

    print text
    return text

if __name__ == '__main__':
    wd = webdriver.Firefox()
    urls = "http://3g.xianerke.com/dede/login.php"
    wd.get(urls)
    path = "vdimgck.jpg"
    try:
        while 1:
            wd.maximize_window()
            email = WebDriverWait(wd,timeout=10).until(EC.presence_of_element_located((By.NAME,'userid')),message='loading timeout')
            email.send_keys("admin")
            passwd = WebDriverWait(wd,timeout=10).until(EC.presence_of_element_located((By.NAME,'pwd')),message='loading timeout')
            passwd.send_keys("admin1234567890")

            vdimgsrcObj = wd.find_element_by_id("vdimgck")
            if vdimgsrcObj:
                wd.save_screenshot(path)
                location_ = vdimgsrcObj.location
                size_ = vdimgsrcObj.size
                im = Image.open(path)
                left = location_['x']
                top = location_['y']
                right = location_['x'] + size_['width']
                bottom = location_['y'] + size_['height']

                im = im.crop((int(left), int(top), int(right), int(bottom)))
                im.save(path)
                vdimg = WebDriverWait(wd,timeout=10).until(EC.presence_of_element_located((By.NAME,'validate')),message='loading timeout')
                vdimg.send_keys(getverify1(path))
            else:
                pass
            wd.find_element_by_name("sm1").click()

    except NoSuchElementException as e:
        wd.find_element_by_name("sm1").click()
        print e.message
