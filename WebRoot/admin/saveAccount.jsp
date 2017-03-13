<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加客服</title>
<style type="text/css">
	*{margin:0px; font-size:12px;}
	#shuju{
		width:100%;
		border:1px solid #CDEAF9;
		margin-top:8px;
	}
	#shuju td{
		 height:22px;
		 line-height:22px;
		 padding-left:10px;
	}
	.error_style1{color:#00ff00;}
	#shuju .category{height:38px; line-height:38px; border:1px solid #CDEAF9; padding-left:30px;}
	#shuju #sub{height:25px; line-height:25px; padding-top:8px; border:1px solid #CDEAF9; padding-left:30px;}
	#shuju #sub input{width:55px; height:18px; border:0px;}
</style>
<script type="text/javascript" src="/shopping/js/validate/jquery.js"></script>
<script type="text/javascript" src="/shopping/js/public.js"></script>
<script type="text/javascript" src="/shopping/js/validate/jquery.validate.js"></script>
	 <script type="text/javascript">
  	$("document").ready(function (){
  		$("#alogin").blur(function (){
  			var alogin = $("#alogin").val();
  			var url="/shopping/account.do?status=checkLogin&alogin=" + alogin;
  			$.get(formartURL(url),null,function(result){
  				
  			});
  		});
  	});
  </script>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="/shopping/images/main/tab_05.gif">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="/shopping/images/main/tab_03.gif" width="12" height="30" /></td>
        <td>
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          	<tr>
            	<td width="46%" valign="middle">
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr>
                			<td width="5%"><div align="center"><img src="/shopping/images/main/tb.gif" width="16" height="16" /></div></td>
                			<td width="95%"><strong>你当前的位置</strong>：添加客服</td>
              			</tr>
            		</table>
                </td>
            	<td width="54%"></td>
          	</tr>
        	</table>
        </td>
        <td width="16"><img src="/shopping/images/main/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="/shopping/images/main/tab_12.gif"></td>
        <td>
        	<form action="/shopping/accountAction_saveAccount.action" method="post" id="textForm">
        	<table id="shuju" cellpadding="0" cellspacing="1">
          	<tr>
            	<td background="/shopping/images/main/bg.gif" height="30">添加客服</td>
          	</tr>
            <tr>
            	<td class="category">登陆用名：<input type="text" name="account.alogin"  id="alogin" size="20" style="margin-left:20px;" /></td>
            </tr>
             <tr>
            	<td class="category">真实姓名：<input type="text" name="account.aname"  id="aname" size="20" style="margin-left:20px;" /></td>
            </tr>
            <tr>
            	<td class="category">登陆密码：<input type="password" name="account.apass"  id="apass" size="22" style="margin-left:20px;" /></td>
            </tr>
            <tr>
            	<td class="category">重复密码：<input type="password" name="apass2"  id="apass2" size="22" style="margin-left:20px;" /></td>
            </tr>
            <tr>
            	<td class="category"><span style="float:left">权限设置：</span>
            	  <input type="radio" name="account.agrade" checked="checked" value="0" style="margin:10px 5px;float:left"/><span style="float:left">客服</span>
                  <input type="radio" name="account.agrade" value="1" style="margin:10px 5px;float:left"/><span>管理员</span>
                </td>
            </tr>
            <tr>
            	<td id="sub">
                	<input style="background-image:url(/shopping/images/admin/bt_app.gif);" type="submit" value="" />
                    <input style="background-image:url(/shopping/images/admin/bt_res.gif); margin-left:10px;" type="reset" value="" />
                </td>
            </tr>
        	</table>
            </form>
        </td>
        <td width="8" background="/shopping/images/main/tab_15.gif"></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="35" background="/shopping/images/main/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="/shopping/images/main/tab_18.gif" width="12" height="35" /></td>
        <td width="100%"></td>
        <td width="16"><img src="/shopping/images/main/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

