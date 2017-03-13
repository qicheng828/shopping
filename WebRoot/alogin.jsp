<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


<link rel="stylesheet" href="css/login/login.css" type="text/css"></link>
</head>
<body>
    <div id="login">
	     <div id="top">
		      <div id="top_left"><img src="<%=request.getContextPath()%>/images/login/login_03.gif" /></div>
			  <div id="top_center"></div>
		 </div>
		 <div id="center">
		      <div id="center_left"></div>
			  <div id="center_middle">
              <form action="/shopping/accountAction_AccoutLogin.action" method="post">
			       <div >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用 户 
			         <input type="text" name="account.alogin"/><br /><br />
			       </div>
				   <div >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 密   码 
				     <input type="password" name="account.apass"/><br /><br />
				   </div>
				   <span>${error}</span>
                   <div >&nbsp;&nbsp; &nbsp; &nbsp; 权   限 
				     <select name="account.agrade">
				     	<option value="0">客服</option>
				     	<option value="1" selected="selected">管理员</option>
				     </select>
				   </div>&nbsp; 
				   <br /><div id="btn"><input type="submit" value="登录" /><input type="reset" value="清空" /></div>
			  </form>
			  </div>
			  <div id="center_right"></div>		 
		 </div>
		 <div id="down">
		      <div id="down_left">
			      <div id="inf">
                       <span class="inf_text">版本信息</span>
					   <span class="copyright">管理信息系统 2015 v1.0</span>
			      </div>
			  </div>
			  <div id="down_center"></div>		 
		 </div>

	</div>
</body>
</html>
