<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>小企商城后台管理</title>
<style type="text/css"> 
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.navPoint { 
	color: white; cursor: hand;
	font-family: Webdings; 
	font-size: 9pt 
} 
-->
</style>
<script type="text/javascript" src="/shopping/js/admin/left.js"> </script>
<script type="text/javascript" src="/shopping/js/admin/aindex.js"> </script>
 
</head>
 
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
 	<td colspan="5" height="118px">
    	<iframe height="100%" width="100%" src="<%=request.getContextPath()%>/admin/top.jsp"  frameborder="0" scrolling="no">
			浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
    </td>
  </tr>
  <tr>
  	<td width="3" id="frmTitle" style="width:3px; background:#0a5c8e;">&nbsp;</td>
    <td width="200px" id="frmTitle0" align="center" valign="top" bgcolor="#0A5C8E">
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
      		<tr>
        		<td height="8" style=" line-height:8px;">
	   				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
             			<tr>
               				<td width="14"><img src="/shopping/images/center/main_24.gif" width="14" height="8"></td>
               				<td background="/shopping/images/center/main_26.gif" style="line-height:8px;">&nbsp;</td>
              				<td width="7"><img src="/shopping/images/center/main_25.gif" width="7" height="8"></td>
            			</tr>
          			</table>
        		</td>
      		</tr>
      		<tr>
        		<td>
	   				<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
              			<tr>
                			<td>
		   						<iframe name="I1" height="100%" width="100%" src="<%=request.getContextPath()%>/admin/left.jsp" frameborder="0" scrolling="no"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
	        				</td>
            			</tr>
          			</table>
				</td>
      		</tr>
      		<tr>
        		<td height="12" style="line-height:12px;">
	   				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
             			<tr>
               				<td width="14" height="12"><img src="/shopping/images/center/main_46.gif" width="14" height="12"></td>
               				<td background="/shopping/images/center/main_48.gif" style="line-height:12px;">&nbsp;</td>
               				<td width="7"><img src="/shopping/images/center/main_47.gif" width="7" height="12"></td>
             			</tr>
           			</table>
				</td>
      		</tr>
    	</table>
    </td>
    <td width="7" bgcolor="#0A5C8E" valign="middle" onClick="onoff()">
    	<SPAN class="navPoint" id="switchPoint" title="关闭左栏">
        <img src="/shopping/images/center/main_41.gif" width="7" height="54" id="img1">
        </SPAN>
    </td>
    
    <td align="center" valign="top">
   		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
      		<tr>
        		<td height="8" style=" line-height:8px;">
	   				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
             			<tr>
               				<td width="14"><img src="/shopping/images/center/main_24.gif" width="14" height="8"></td>
               				<td background="/shopping/images/center/main_26.gif" style="line-height:8px;">&nbsp;</td>
              				<td width="7"><img src="/shopping/images/center/main_25.gif" width="7" height="8"></td>
            			</tr>
          			</table>
        		</td>
      		</tr>
      		<tr>
        		<td>
	   				<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
              			<tr>
                			<td><iframe name="main" height="100%" width="100%" src="<%=request.getContextPath()%>/admin/main.jsp" frameborder="0"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
            			</tr>
          			</table>
			  </td>
      		</tr>
      		<tr>
        		<td height="12" style="line-height:12px;">
	   				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
             			<tr>
               				<td width="14" height="12"><img src="/shopping/images/center/main_46.gif" width="14" height="12"></td>
               				<td background="/shopping/images/center/main_48.gif" style="line-height:12px;">&nbsp;</td>
               				<td width="7"><img src="/shopping/images/center/main_47.gif" width="7" height="12"></td>
             			</tr>
           			</table>
				</td>
      		</tr>
    	</table>
	</td>
    <td width="3" style="width:3px; background:#0a5c8e;">&nbsp;</td>
  </tr>
</table>
</body>
</html>