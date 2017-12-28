
<!-- PHP服务端 -->
<?php 
$ua = strtolower($_SERVER['HTTP_USER_AGENT']); 
$uachar = "/(symbianos|android|Mac OS|ucweb|blackberry)/i"; 
if($ua != "" && preg_match($uachar, $ua))
{ 
	echo "window.location.href = 'http://waitui.erddz.com';"; 
	exit(); 
} 
?>


<!-- JS客户端 -->
<script type="text/javascript">
if(/AppleWebKit.*mobile/i.test(navigator.userAgent) || (/MIDP|SymbianOS|NOKIA|SAMSUNG|LG|NEC|TCL|Alcatel|BIRD|DBTEL|Dopod|PHILIPS|HAIER|LENOVO|MOT-|Nokia|SonyEricsson|SIE-|Amoi|ZTE/.test(navigator.userAgent))){
    if(window.location.href.indexOf("?mobile")<0){
        try{
            if(/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)){
                window.location.href="http://waitui.erddz.com";
            }
        }catch(e){}
    }
}
</script>