<!--#include file="../Conn.asp" -->
<!--#include file="../inc/sql.asp" -->
<!--#include file="../inc/function.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>文章页标题提取程序</title>
	<script src="js/jquery-1.10.2.min.js"></script>
</head>
<body oncontextmenu='return false'>
<script type="text/javascript" src="js/zDrag.js"></script>
<script type="text/javascript" src="js/zDialog.js"></script>
<script language="jscript" runat="server">
function bs2str(bs,ch){
    var re=''; 
    with(new ActiveXObject("adodb.stream")){
        type = 1,open(),Write(bs);
        Position = 0,Type = 2;
        Charset=ch,re=ReadText();
        Close()
    }
    return re;
}
//titReg=/<div class="art_conenttitle">([\s\S]*?)<\/div>/i;
var titReg=/[^>]+(?=<\/title)/i;
titReg=/<div class="art_conenttitle">([\s\S]*?)<\/div>/i;   //默认不选的情况下为长沙3g.kzdz120.com手机站
var kwReg=/<meta.+?name\s*=\s*['"]?(keywords|description)\b.+?content\s*=\s*(['"])([^\2]+?)\2/ig;  
var chReg=/Charset=([^;]+)/i;
function getInfo(url,radio_val){
    var xh = new ActiveXObject("Microsoft.XMLHttp"),ch,text,re={},ms; 
	//try { 
		with(xh) open("GET", url, false),send();

		 ch=chReg.test(xh.getResponseHeader("Content-Type"))?RegExp.$1:'utf-8';
		text=/utf-8/i.test(ch)? bs2str(xh.responseBody,ch):xh.responseText;

		
		if (radio_val == "cs_3g")	//长沙3G站
		{
			if (url.indexOf("wap.tyek120.com")!=-1)	{
				titReg=/<h2 class="art_tit">([\s\S]*?)<br\/>/i;
			}else if (url.indexOf("3g.kzdz120.com")!=-1){				
				titReg=/<div class="art_conenttitle">([\s\S]*?)<\/div>/i;
				titReg=/<h2  style="line-height: 44px;" >([\s\S]*?)<\/h2>/i;
			}else if (url.indexOf("3g.kcbz120.com")!=-1){
				titReg=/<div class="art_conenttitle">([\s\S]*?)<\/div>/i;
			}
			re.title=text.match(titReg);		
		}
		else if (radio_val == "cs_pc")  //长沙PC站
		{
			if (url.indexOf("www.kzdz120.com")!=-1 || url.indexOf("www.tyek120.com")!=-1)
			{
				titReg=/<h3>([\s\S]*?)<\/h3>/i;			
			}else if (url.indexOf("www.kcbz120.com")!=-1)
			{
				titReg=/<h1>([\s\S]*?)<\/h1>/i;
			}
			re.title=text.match(titReg);		
		}
		else if(radio_val == "jj_pc") //锦江PC站
		{
			if (url.indexOf("www.jj2ek.com")!=-1)
			{
				titReg=/<span style="width: 100%;color: #158064; font-size: 26px;"><b>([\s\S]*?)<\/b><\/span>/i;			
			}else if (url.indexOf("dd.jj2120.com")!=-1)
			{
				titReg=/<h4>([\s\S]*?)<\/h4>/i;
			}
			re.title=text.match(titReg);
		}
		else if(radio_val == "jj_3g") //锦江3G站
		{
			if (url.indexOf("3g.jj2ek.com")!=-1)
			{
				titReg=/<p style="float: left; width:100%;font-size: 20px;"><b>([\s\S]*?)<\/b>/i;		
				titReg=/<h1 class="wH1">([\s\S]*?)<\/h1>/i;		
			}else if (url.indexOf("8g.jj2ek.com")!=-1 || url.indexOf("5g.jj2120.com")!=-1)
			{
				titReg=/<h3>([\s\S]*?)<\/h3>/i;
			}
			re.title=text.match(titReg);
		}
		else if(radio_val == "heb_3g") //哈尔滨3G站
		{
			if (url.indexOf("3g.hebdyyy.org.cn")!=-1 || url.indexOf("3g.hebsdyyyek.org.cn")!=-1 || url.indexOf("3g.hebsdyyy120.org.cn")!=-1 || url.indexOf("3g.dyyyek.org.cn")!=-1 || url.indexOf("3g.hebek120.org.cn")!=-1)
			{
				titReg=/<h2 class="art_tit">([\s\S]*?)<br\/>/i;
			}
			re.title=text.match(titReg);
		}
		else if(radio_val == "heb_pc") //哈尔滨PC站
		{
			if (url.indexOf("www.hebek120.org.cn")!=-1 || url.indexOf("www.dyyyek.org.cn")!=-1 || url.indexOf("www.hebsdyyy120.org.cn")!=-1 || url.indexOf("www.hebsdyyyek.org.cn")!=-1 || url.indexOf("www.hebdyyy.org.cn")!=-1)
			{
				titReg=/<div class="arc_cont">([\s\S]*?)<h3>/i;
				titReg=/<div class="article_left1Main">([\s\S]*?)<h2><span>/i;
				titReg=/<div class="art_title">([\s\S]*?)<\/div>/i;
				
			}
			//else if (url.indexOf("www.hljek120.com")!=-1 || url.indexOf("www.hebek120.com")!=-1)
			//{
				//titReg=/<div class="article_left1Main">([\s\S]*?)<h2><span>/i;
			//}
			re.title=text.match(titReg);
		}
		else
		{
			re.title=text.match(titReg);   
		}

		while (ms = kwReg.exec(text))re[ms[1].toLowerCase()]=ms[3];
		for(var k in re)re[k]=re[k]||'';
		re.html=text
		return re;
	/*
	} 
	catch (e) { 
		re.title= "BOM";		
		return re;
	} 
	finally { 	
		return re;
	}    
	*/
   
}
</script>

<script type="text/javascript">
function closewin()
{	
	parentDialog.close();	
}
</script>
<style type="text/css">
body{
	font-size:10pt;
	font-family:'微软雅黑';
	overflow:auto;
	overflow-x:hidden;
}
td{
	border:1px solid #ccc;
	font-family:'微软雅黑';
	cursor:pointer;
}
div.radioputcls{
	line-height:28px;
	cursor:pointer;
	font-size:12pt;	
	font-family:'微软雅黑';
	border:0px solid red;
}
div.radioputcls input{
	font-family:'微软雅黑';
	cursor:pointer;
	width:16px;
	height:16px;
}
</style>


<%
On Error Resume Next		
Dim ExcelFile,nowstr,date_array
nowstr = now()
date_array = Split(nowstr," ")
nowstr = Replace(date_array(0),"/","_")
ExcelFile="Excel_"&nowstr&".xls" 
%>
<center><h1 style="font-family:'微软雅黑';">&Otilde;输入文章页URL列表&Otilde;</h1></center>
<form action="gj_url.asp?id=xx" id="urlsform" name="urlsform" method="post" style="width:100%;text-align:center;">
	<textarea  name="urls" style="background-color:#eee;width:100%;height:250px;visible:auto;font-family:'微软雅黑';font-size:12pt;cursor:pointer;" onfocus="this.style.backgroundColor='#fff';" onblur="this.style.backgroundColor='#eee';"><%=request("urls")%></textarea><br><br>
	<div class="radioputcls">	
		<input type="radio" name="targetweb" value="cs_3g" <%If request("targetweb")="cs_3g" Then Response.write("checked") End if%>/>长沙3G站&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="targetweb" value="cs_pc" <%If request("targetweb")="cs_pc" Then Response.write("checked") End if%>/>长沙PC站
	</div>
	<div  class="radioputcls">
		<input type="radio" name="targetweb" value="jj_3g" <%If request("targetweb")="jj_3g" Then Response.write("checked") End if%>/>锦江3G站&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="targetweb" value="jj_pc" <%If request("targetweb")="jj_pc" Then Response.write("checked") End if%>/>锦江PC站
	</div>
	<div  class="radioputcls">
		<input type="radio" name="targetweb" value="sh_3g" <%If request("targetweb")="sh_3g" Then Response.write("checked") End if%>/>上海3G站&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="targetweb" value="sh_pc" <%If request("targetweb")="sh_pc" Then Response.write("checked") End if%>/>上海PC站
	</div>

	<div  class="radioputcls">
		<input type="radio" name="targetweb" value="heb_3g" <%If request("targetweb")="heb_3g" Then Response.write("checked") End if%>/>哈尔滨3G&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="targetweb" value="heb_pc" <%If request("targetweb")="heb_pc" Then Response.write("checked") End if%>/>哈尔滨PC
	</div>
	
	<br>
	<input type="submit" id="submit_btn" name="submit" value="开始提取" style="width:18%;height:50px;text-align:center;font-family:'微软雅黑';font-size:18pt;cursor:pointer;"/>
	&nbsp;&nbsp;
	<input type="button" id="daosubmit" name="daosubmit" value="导出Excel" style="width:18%;height:50px;text-align:center;font-family:'微软雅黑';font-size:18pt;cursor:pointer;display:none;" onclick="window.location.href='<%=ExcelFile%>';this.style.display='none';document.getElementById('span_noti').style.display='none';"/>
	<br><br>
	<span style="color:red;font-size:10pt;display:none;" id="span_noti">&sect; 导出Excel表格中的数据将自动过滤死链接及无效链接 &sect;</span>
</form>
<br>

<div id="forlogin">
  <table id="tab_list" width="100%" border="0" align="center" cellpadding="1" cellspacing="0" bordercolor="#eeeeee">
	<tr>
	  <td colspan="2" bgcolor="#eeeeee" style="text-align:center;border:none;height:5px;"></td>
	</tr>	
	<tr style="height:40px;">
	  <td bgcolor="#eeeeee" style="font-family:'微软雅黑';font-weight:bold;font-size:12pt;">文章页URL</td>
	  <td bgcolor="#eeeeee" style="font-family:'微软雅黑';font-weight:bold;font-size:12pt;">文章标题</td>
	</tr>
	<%		
		Dim idx,urls,arrayx,ix,url_,radio_val
		idx = request("id")
		urls = request("urls")
		radio_val = request("targetweb")
		If idx="xx" And urls<>"" Then
			Response.write("<script>document.getElementById('daosubmit').style.display='';document.getElementById('span_noti').style.display='';</script>")
			'生成EXCEL
			Dim Createtablesql,fpath,tbname			
			Createtablesql="CREATE TABLE Sheet1 (文章页URL Text,文章标题 Text)"
			
			set fso=Server.CreateObject ("Scripting.FileSystemObject")
			fpath=Server.MapPath(ExcelFile)       
			if fso.FileExists(fpath) then
			whichfile=Server.MapPath(ExcelFile)
			Set fs = CreateObject("Scripting.FileSystemObject")
			Set thisfile = fs.GetFile(whichfile)
			thisfile.delete true
			end if         		   
			Dim Driver,DBPath
			Set conne = Server.CreateObject("ADODB.Connection")
			Driver = "Driver={Microsoft Excel Driver (*.xls)};Readonly=0;"
			DBPath = "DBQ=" & Server.MapPath(ExcelFile) 
			conne.Open Driver & DBPath
			conne.Execute(Createtablesql)	
			'生成EXCEL

			arrayx = Split(urls,".html")	
			For ix=0 To UBound(arrayx) Step 1
				url_ = arrayx(ix)
				If Len(Trim(url_))>0  Then					
					set  info=getInfo(url_&".html",radio_val)
					Dim titles,array					
					titles = delhtml(Info.title)
					titles = clearhtml(titles)
					titles = replace(titles," ","")
					array = Split(titles,",")
					%>
					<tr onmouseover="this.style.backgroundColor='#eee';" onmouseout="this.style.backgroundColor='';" height="35px">
					<td><%=url_&".html"%></td>
					<td>
					<%=array(1)%>
					<%
						If Len(info.title)<>0 Then			
							Insertintosql="INSERT INTO Sheet1(文章页URL, 文章标题) values ('"&url_&".html"&"', '"&Trim(array(1))&"')"
							conne.Execute(Insertintosql)
						End if
					%>
					</td>
					</tr>
					<%			
					
				End if		
				
			next		
		End if		
	%>
	
  </table>
</div>


	<script type="text/html" id="alertHTML">
		<div id="overlaydiv">
			<div id="alertdiv">
				<!--<a id="toptitle">{title}</a>-->
				<img src="images/loading.gif"/>
				<a id="tipsinfo">{tips}</a>
				<!--<a id="tipsbutton">{buttons}</a>-->
			</div>
		</div>
	</script>
	
	<style type="text/css">
	div#overlaydiv{
		background-color: black;
		/* IE8 */
		-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=80)";
		/* IE8 */
		background-color: rgba(0, 0, 0, 0.4);
		position: fixed;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		display: none;
		z-index: 10000; 

	}
	
	div#alertdiv{
		background-color: white;
		font-family: '微软雅黑', Arial, sans-serif;
		display:none;
		width:300px;
		height:150px;
		border:1px solid #ddd;
		background-color:#eee;
		position:absolute;
		top:0px;
		left:0px;
		z-index:999999;
		text-align:center;
		padding:0 auto;

		width:324px;
		height:60px;
		border: 3px solid #95B8E7; 
	}
	a#toptitle{
		width:300px;
		height:30px;
		font-size:12pt;
		font-weight:bold;
		color:black;
		background:white;
		text-align:center;
		display:table-cell;
		vertical-align:middle;	
		cursor:pointer;
	}
	
	a#tipsinfo{
		width:300px;
		height:80px;
		text-align:center;
		display:block;
		vertical-align:middle;
		font-family: '微软雅黑', Arial, sans-serif;
		font-size:12pt;	
		line-height:80px;

		width:324px;
		height:40px;
		line-height:40px;
	}
	a#tipsbutton{
		margin:0 auto;
		width:100px;
		height:25px;
		font-size:12pt;
		font-family: '微软雅黑', Arial, sans-serif;
		background-color:#ddd;
		border:1px solid #888;
		display:block;
		cursor:pointer;
	}
	</style>

	<script type="text/javascript">
	$(document).ready(function(){
		window["centertips"] = $("#alertHTML").html();
		$("#alertHTML").remove();
		var Cninfos = {
			ok:"确定",
			cancel:"取消",
			tips:"提示"
		};
		
		var buttonboxs = {
			ok:"Ok",
			cancel:"Cancel",
			okcancel:"OkCancel"
		};	
		
		var icoboxs = {
			warning:"warning",
			tip:"tip",
			error:"error"
		};
		
		var posfn =  function(){
			$("#alertdiv").css({
				position:'absolute',
				left: ($(window).width() - $('#alertdiv').outerWidth())/2, 
				top: ($(window).height() - $('#alertdiv').outerHeight())/2 + $(document).scrollTop() 
			});		
		};
		
		
		var RAlert = function(tips_msg,tips_title,buttonStr,icostr){
			RA(tips_msg,tips_title,buttonStr,icostr);
		};
		
		window.alert = RAlert;		
		var RA = function(tips_msg,tips_title,buttonStr,icostr){
			if(!tips_title){
				tips_title = Cninfos.tips;
			}
			window["centertips"] = window["centertips"].replace("{title}",tips_title).replace("{tips}",tips_msg).replace("{buttons}",Cninfos.ok);
			//window["centertips"] = window["centertips"].replace("{tips}",tips_msg);
			//window["centertips"] = window["centertips"].replace("{buttons}",Cninfos.ok);
			
			$(window.document.body).append(window["centertips"]);
			posfn();
			
			$("#tipsbutton").click(function(){
				$("#overlaydiv").hide();
			});
			
			$("#overlaydiv").show();
			$("#alertdiv").show();
		};
		
		
		$("#submit_btn").click(function(){
			if (document.urlsform.urls.value!="" || document.urlsform.urls.value.length != 0)
			{
				alert("数据正在抓取中......请稍等!","提示",buttonboxs.ok,icoboxs.warning);
			}
			
		});
		
		
	});	
	</script>	



</body>
</html>