<%@ page language="java"  pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户登录</title>
<link href="/shopping/css/index/login.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div id="login">
	
	     <div id="top">
		      <div id="top_left"><img src="/shopping/images/login/user.gif" /></div>
			  <div id="top_center" style="background-image:url(/shopping/images/login/userLogin.jpg);"></div>
		 </div>
		 
		 <div id="center">
		      <div id="center_left"><img src="/shopping/images/login/login_09.jpg" /></div>
			  <div id="center_middle">
              <form action="/shopping/usersAction_getUserss.action" method="post">
			       <div id="user">用 户
			         <input type="text" name="users.ulogin" />
			       </div>
				   <div id="password">密   码
				     <input type="password" name="users.upass" />
				   </div>
                   <div id="warn"><img src="/shopping/images/login/tip.gif" />请勿非法登陆！</div>
				   <div id="btn"><input type="submit" value="登录" /><input type="reset" value="清空" /></div>
			  </form>
			  </div>
			  <div id="center_right"></div>		 
		 </div>
		 <div id="down">
		      <div id="down_left">
			  </div>
			  <div id="down_center"></div>		 
		 </div>

	</div>
</body>
</html>
