<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Gogo购物网</title>
<style type="text/css">
	body{ background: #fff; color: #333;font:9pt/200% Verdana;}
	a{text-decoration: none;color:#333333}
	a:hover{text-decoration: underline;}
	img{border:0;}
</style>
<script language='javascript' type='text/javascript'> 
	var secs=5; //倒计时的秒数 
	function Load(){  
		for(var i=secs;i>=0;i--) 
		{ 
			window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000); 
		} 
	} 
	function doUpdate(num) { 
		document.getElementById('ShowDiv').innerHTML = '将在'+ num +'秒后自动跳转' ; 
		if(num == 0) { 
			window.parent.location="${requestScope.url}"; 
			} 
		} 
</script> 
</head>
<body onLoad="Load()">
<center>
<div style="padding:15px 60px;border:1px solid #c7e1ef;background:#dff6ff ; text-align:center; margin:20% auto auto; width:55%">
信息管理系统信息提示<br/>
<font color="red">${requestScope.info}</font>
<div id="ShowDiv"></div> 
<a href="${requestScope.url}" target="_parent">如果您的浏览器没有自动跳转,请点击这里</a></div>
</center>
</body></html>