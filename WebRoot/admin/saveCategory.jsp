<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@page import="java.util.List"%>
<%@page import="dong.shopping.pojo.Category"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>保存类别</title>
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
	.error_style1{color:#FF0000;}
	#shuju .category{height:38px; line-height:38px; border:1px solid #CDEAF9; padding-left:30px;}
	#shuju #sub{height:25px; line-height:25px; padding-top:8px; border:1px solid #CDEAF9; padding-left:30px;}
	#shuju #sub input{width:55px; height:18px; border:0px;}
</style>
<script type="text/javascript" src="/shopping/js/validate/jquery.js"></script>
<script type="text/javascript" src="/shopping/js/public.js"></script>
<script type="text/javascript" src="/shopping/js/validate/jquery.validate.js"></script>
	<script type="text/javascript">
$(document)
	.ready
	(
	function(){
	$("#ctype").blur(function(){
	var ctype=$("#ctype").val();
	$.post("/shopping/categoryAction_CheckCtype.action",{"category.ctype":ctype},function(data){
	if(data=="true")
	document.getElementById("ctypeInfo").innerHTML="<font color='red'>已占用</font>";
	else
    document.getElementById("ctypeInfo").innerHTML="<font color='red'>未占用</font>";
	},"text/html");
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
                			<td width="95%"><strong>你当前的位置</strong>：添加商品类别</td>
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
        	<form action="/shopping/categoryAction_saveCategory.action" method="post" id="textForm">
        	<table id="shuju" cellpadding="0" cellspacing="1">
          	<tr>
            	<td background="/shopping/images/main/bg.gif" height="30">添加商品的类别</td>
          	</tr>
            <tr>
            	<td class="category">输入名称：<input type="text" name="ctype"  id="ctype" style="margin-left:20px;" />
            	 <span id="ctypeInfo"></span><br/>
            	</td>
            </tr>
            <tr>
            	<td class="category"><span style="float:left">是否为热点：</span>
            	  <input type="radio" name="chot" checked="checked" value="true" style="margin:10px 5px;float:left"/><span style="float:left">热点</span>
                  <input type="radio" name="chot" value="false" style="margin:10px 5px;float:left"/><span>非热点</span>
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

