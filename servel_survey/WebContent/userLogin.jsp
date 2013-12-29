<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>用户登录</title>
<link href="images/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="Js/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		$('.captcha').focus(function(){
			$('.yzm-box').show();
			});
			
		$('.captcha').focusout(function(){
			$('.yzm-box').hide();
			});
		})
		function sub(){
			var email = jQuery("#txtEmail").val();
			jQuery("#email\\.info").html("");
			if(email == ""){//非空检查
			    jQuery("#email\\.info").html("邮箱不能为空");
		    	return false;
		    }
	    	if(jQuery("#password").val()==""){
	    		  jQuery("#password\\.info").html("密码不能为空");
	    		  return false;
		   }
	    	jQuery("#ctl00").submit(); 
		}
</script>

</head>

<body>
<div id="message-box"> 用户名或密码错误！ </div>
<div id="wrap">
	
	<div id="header"> </div>
   		 <div id="content-wrap">
    	<div class="space"> </div>
		   	<form name="from1" action="servlet/UserManage.do?op=userLogin" method="post" id="ctl00" >
		   	  <div class="content">
		   	  <input name="reg" type="hidden" id="reg" class="text_input" value="1"/>
			        <div class="field"><label>账　户：</label><input class="username" name="email" value="" type="text" /></div>
					<div class="field"><label>密　码：</label><input class="password" name="password" value="" type="password" /><br /></div>
			        <div class="field"><br />
			        <div class="yzm-box"> </div>
      		</div>
      <div class="btn"><input name="" type="submit" class="login-btn" value="" id="ctl00" onclick="return sub();"/></div>
      </div></form>
    </div>
    <div id="footer"> </div>
</div>
</body>
</html>


 