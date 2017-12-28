#! /usr/bin/python
# _*_ coding:utf-8 _*_
from win32com import client as wc 
import cgi, cgitb 
import os


print "Content-type:text/html"
print

form = cgi.FieldStorage() 
# 获取数据
wordFilepath = form.getvalue('url')
wordFilepath = "/kindeditor/attached/file/20160722/20160722180117861786.doc"
docfilename = wordFilepath.split("/")
docfilename = docfilename[len(docfilename)-1]
filename_prex = docfilename.split(".")
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BASE_DIR = BASE_DIR.replace("\\", "/")
wordFilepath = BASE_DIR+wordFilepath

targetname = filename_prex[0]+".html"
targethtmlfile = BASE_DIR+"/ms/word2html/"+targetname


word = wc.Dispatch('Word.Application') 
doc = word.Documents.Open(wordFilepath) 
doc.SaveAs(targethtmlfile, 8) 
doc.Close()
#word.Quit()

print(wordFilepath+"<br>==<br>"+BASE_DIR+str(docfilename)+"<br>"+targethtmlfile)