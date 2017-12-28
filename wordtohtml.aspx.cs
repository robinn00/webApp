using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Word = Microsoft.Office.Interop.Word;

public partial class wordtohtml : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string relativePath = Request.QueryString["FilePath"]; //相对路径 ，从跳转页面得到文件相对路径。
        if (relativePath == "" || relativePath == null) return;
        string serverPath = Server.MapPath(relativePath);  //相对转服务器对应路径
        string html = null;
        if (serverPath.IndexOf(".docx") > -1)
        {
            html  = serverPath.Replace(".docx", ".html");
        } else if (serverPath.IndexOf(".doc") > -1)
        {
            html = serverPath.Replace(".doc", ".html");
        }        

        if (!File.Exists(@html)) //html页面不存在,把word转换成html
        {
            string filename = wtoh_fn(serverPath);
            if (filename.IndexOf(".dhtml") > -1)
            {

                //filename = filename.Replace("\\\\", "\\");
                string[] array = filename.Split('\\');
                string filename_ = array[array.Length - 1];
                string[] prex = filename_.Split('.');               

                string[] docxFilepath = filename.Split('.');
                string targetFilepaths = docxFilepath[0] + ".html";
                System.IO.File.Move(filename, targetFilepaths);
            }
           
            /*
            string destFileName = "";

            if (System.IO.File.Exists(filename))
            {
                System.IO.FileInfo file = new System.IO.FileInfo(filename);
                file.MoveTo(destFileName);
            }
            if (System.IO.Directory.Exists(srcFolderPath))
            {
                System.IO.DirectoryInfo folder = new System.IO.DirectoryInfo(srcFolderPath);
                folder.MoveTo(destFolderPath);
            }
            */


            //StreamReader fread = new StreamReader(filename, System.Text.Encoding.GetEncoding("gb2312"));
            //string ss = fread.ReadToEnd();
            //Response.Write(ss); //直接写字符串到网页会发现，文字可显示，图片、表格无法显示。因此在后面重跳转到html文件页面。
            //fread.Close();
            //fread.Dispose();
        }

        if (relativePath.IndexOf(".docx") > -1)
        {
            html = relativePath.Replace(".docx", ".html");
        }
        else if (relativePath.IndexOf(".doc") > -1)
        {
            html = relativePath.Replace(".doc", ".html");
        }

        
        //html文件也存储在同样的路径下，
        //只需要改了原路径的后缀即可得到html文件路径
        Response.Redirect(html);
        return;

    }


    private string wtoh_fn(object wordFileName)
    {
        //在此处放置用户代码以初始化页面 
        Word.Application word = new Word.Application();
        Type wordType = word.GetType();
        Word.Documents docs = word.Documents;
        //打开文件 
        Type docsType = docs.GetType();
        Word.Document doc = (Word.Document)docsType.InvokeMember("Open", System.Reflection.BindingFlags.InvokeMethod, null, docs, new Object[] { wordFileName, true, true });
        //转换格式，另存为 
        Type docType = doc.GetType();
        string wordSaveFileName = wordFileName.ToString();
        string strSaveFileName = wordSaveFileName.Substring(0, wordSaveFileName.Length - 3) + "html";
    
        object saveFileName = (object)strSaveFileName;
        docType.InvokeMember("SaveAs", System.Reflection.BindingFlags.InvokeMethod, null, doc, new object[] { saveFileName, Word.WdSaveFormat.wdFormatFilteredHTML });
        docType.InvokeMember("Close", System.Reflection.BindingFlags.InvokeMethod, null, doc, null);
        //退出 Word 
        wordType.InvokeMember("Quit", System.Reflection.BindingFlags.InvokeMethod, null, word, null);
        return saveFileName.ToString();
    }
}