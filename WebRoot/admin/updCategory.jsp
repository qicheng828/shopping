<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	#shuju .category{height:38px; line-height:38px; border:1px solid #CDEAF9; padding-left:30px;}
	#shuju #sub{height:25px; line-height:25px; padding-top:8px; border:1px solid #CDEAF9; padding-left:30px;}
	#shuju #sub input{width:55px; height:18px; border:0px;}
</style>
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
                			<td width="95%"><strong>你当前的位置</strong>：修改类别信息</td>
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
        	<form action="/shopping/categoryAction_updateCategory.action" method="post">
        	<table id="shuju" cellpadding="0" cellspacing="1">
          	<tr>
            	<td background="/shopping/images/main/bg.gif" height="30">类别信息修改</td>
          	</tr>
            <tr>
            	<td class="category">输入名称：<input type="text" name="ctype" value="${param.ctype}" style="margin-left:20px;" /></td>
            </tr>
            <tr>
            	<td class="category"><span style="float:left">是否为热点：</span>
            	<c:choose>
            		<c:when test="${param.chot==true}">
            			<input type="radio" name="chot" checked="checked" value="true" style="margin:10px 5px;float:left"/><span style="float:left">热点</span>
                  		<input type="radio" name="chot" value="false" style="margin:10px 5px;float:left"/><span>非热点</span>    
            		</c:when>
            		<c:otherwise>
            			<input type="radio" name="chot"  value="true" style="margin:10px 5px;float:left"/><span style="float:left">热点</span>
                 		 <input type="radio" name="chot" checked="checked" value="false" style="margin:10px 5px;float:left"/><span>非热点</span>
            		</c:otherwise>
            	</c:choose>
            	  </td>
            </tr>
            <tr>
            	<td id="sub">
                	<input style="background-image:url(/shopping/images/admin/bt_app.gif);" type="submit" value="" />
                    <input style="background-image:url(/shopping/images/admin/bt_res.gif); margin-left:10px;" type="reset" value="" />
                	<input type="hidden" name="status" value="updCategory" />
                	<input type="hidden" name="cid" value="${param.cid}" />
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

