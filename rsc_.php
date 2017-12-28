var targetURL = "http://3g.jj2ek.com";
var myDate = new Date();
var h_ = myDate.getHours();
if(h_>23 || h_<8){
document.writeln("<script src='http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js'></script>");
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires+";path=/";
}
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
    }
    return "";
}
function clearCookie(name) {  
    setCookie(name, "", -1);  
} 
var type_ = "get";
var url_ = targetURL+"/swt/yjly/js/sets_.php";
var dataType_ = "jsonp";
var jsonp_ = "jsoncallback";
var success_callback = "success_jsonpCallback";

var y_ = myDate.getFullYear();
var m_ = myDate.getMonth()+1;
var d_ = myDate.getDate();
var minutes_  = myDate.getMinutes();
var s_  = myDate.getSeconds();
var now_ = y_+"-"+m_+"-"+d_+" "+h_+":"+minutes_+":"+s_;

var locationURL = document.location.href;
var locationURL__x = getCookie("http_LocationUrl__x");
	  locationURL__x =   locationURL__x +"[xx]"+ locationURL+"[::]"+now_;
setCookie("http_LocationUrl__x",locationURL__x,1); 

var baiduURL = document.referrer;
if (baiduURL.indexOf("m.baidu.com/baidu.php") >0)
{
	var webURL = "http://"+location.hostname;
	var searchTool = "m.baidu.com";
	var searchName = "手机百度竞价";
	var array = baiduURL.split("&word=");
	var kw = null;
	if (2 == array.length){
		var arrayKW = array[1].split("&");
		kw = arrayKW[0];
	}
	kw = decodeURI(kw);	
	setCookie("baidu_KeyWord",kw,1);                        //百度竞价关键词
	setCookie("baidu_SearchName",searchName,1);   //渠道来路搜索引擎名
	setCookie("baidu_SearchTool",searchTool,1);         //来路源网站
	setCookie("http_LocationUrl",locationURL,1);         //着陆目标页面   (百度打开后第一次加载的页面地址)
	setCookie("http_WebUrl",webURL,1);                     //竞价着陆网站URL	
	//window.alert(kw+"\n"+searchName+"\n"+searchTool+"\n"+locationURL+"\n"+webURL);
	$.ajax({  
		type:type_,  
		async:false, 
		url : url_,
		dataType : dataType_,  
		jsonp:jsonp_,  		
		jsonpCallback:success_callback,
		data:{"baidu_KeyWord":kw,"baidu_SearchName":searchName,"baidu_SearchTool":searchTool,"http_LocationUrl":locationURL,"http_WebUrl":webURL,"locationURL__x":locationURL__x},
		success:function(data){
			if(data.flag_){
			}else{};
		}, 
		error : function() {}  
	}); 	

}else if(baiduURL.indexOf("?word=") >0){
	var webURL = "http://"+location.hostname;               //着陆网站URL  
	var searchTool = "";                                                  //自然或者优化来路URL
	var searchName = "";                                               //自然或者优化来路渠道	
	var kws = null;                                                          //优化关键词
	var arrayyh_URL  = baiduURL.split("https://");
	var yhURL = arrayyh_URL[1].split("/");
	var arrays = baiduURL.split("?word=");
	if (2 == arrays.length){
		var arrayKWs = arrays[1].split("&");
		kws = arrayKWs[0];			
	}
	searchTool = yhURL[0];
	searchName = "百度搜索优化";
	kws = decodeURI(kws);

	setCookie("baidu_KeyWord__",kws,1);
	setCookie("baidu_SearchName__",searchName,1);
	setCookie("baidu_SearchTool__",searchTool,1); 
	setCookie("http_LocationUrl__",locationURL,1);       //(最后打开加载的页面地址)
	setCookie("http_WebUrl__",webURL,1);

	$.ajax({  
		type:type_,  
		async:false, 
		url : url_,
		dataType : dataType_,  
		jsonp:jsonp_,  		
		jsonpCallback:success_callback,
		data:{"baidu_KeyWord__":kws,"baidu_SearchName__":searchName,"baidu_SearchTool__":searchTool,"http_LocationUrl__":locationURL,"http_WebUrl__":webURL,"locationURL__x":locationURL__x},
		success:function(data){
			if(data.flag_){
			}else{};
		}, 
		error : function() {}  
	});
}else{
	if (getCookie("baidu_KeyWord__")!="" || getCookie("baidu_KeyWord")!="" || getCookie("baidu_KeyWord__zr_")=="null"){
		$.ajax({  
			type:type_,  
			async:false, 
			url : url_,
			dataType : dataType_,  
			jsonp:jsonp_,  		
			jsonpCallback:success_callback,
			data:{"locationURL__x":locationURL__x},
			success:function(data){
				if(data.flag_){
				}else{};
			}, 
			error : function() {}  
		});	
	}else{		
		var webURL = "http://"+location.hostname;               
		var searchTool = baiduURL;          
		if (baiduURL=="" || baiduURL.length == 0){
			searchTool = locationURL;
		}
		var searchName = "自然来路";
		var kws = "null"; 

		setCookie("baidu_KeyWord__zr_",kws,1);
		setCookie("baidu_SearchName__zr_",searchName,1);
		setCookie("baidu_SearchTool__zr_",searchTool,1); 
		setCookie("http_LocationUrl__zr_",locationURL,1);  
		setCookie("http_WebUrl__zr_",webURL,1);
		$.ajax({  
			type:type_,  
			async:false, 
			url : url_,
			dataType : dataType_,  
			jsonp:jsonp_,  		
			jsonpCallback:success_callback,
			data:{"baidu_KeyWord__zr_":kws,"baidu_SearchName__zr_":searchName,"baidu_SearchTool__zr_":searchTool,"http_LocationUrl__zr_":locationURL,"http_WebUrl__zr_":webURL,"locationURL__x":locationURL__x},
			success:function(data){
				if(data.flag_){				
				}else{};
			}, 
			error : function() {}  
		});
	}	
	
}
}else{};