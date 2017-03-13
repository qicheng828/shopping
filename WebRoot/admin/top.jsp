<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    
    <link href="<%=request.getContextPath()%>/css/top/top-menu.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/top/Clock.js" type=text/javascript></script>

<style type=text/css>
	#menu #nav{
		width:600px;
		margin:0px auto;
		margin-right:250px;
		padding-bottom:0px;
		padding-top:1px;
	}
	
	#menu #nav ul {
		list-style:none;
		margin-top:27px;
		margin-bottom:0px;
	}
	#menu #nav ul li {
		float: right; 
		height:25px; 
		line-height: 2.1em; 
		text-align: center;
	}
	#menu .inactive { 
		background-image:url(/shopping/images/top/nav_bg_inactive2.png) !important;
		margin-left: 8px; 
		margin-right:8px;
		margin-bottom:0px;
	}
	#nav ul li a{
		display:block;
		float:left;
		width:82px; 
		color:#1F385C;
		text-decoration:none;
	}
	#nav ul li a:hover{
		color:#ff0000;
		text-decoration:underline;
	}
	#nav ul li a img {
		border:0px;
		margin:5px;
		margin-right:0px;
		float:left;
	}
</style>
</head>

<body style="background-image:url(/shopping/images/top/bg.gif); margin: 0px; background-repeat: repeat-x">
	  <div id="logo">
   		 <div id="top">
    		<A href="/shopping/admin/aindex.jsp" target="_parent">返回首页</A> 
    		<IMG src="/shopping/images/top/menu_seprator.gif" align="absMiddle" /> 
    		<A href="javascript:window.parent.close();">退出系统</A> 
   		</div>
    	<div id="menu">
        	<div id="nav">
    			<ul>
        			<li class="inactive"><a href="/shopping/admin/queUsers.jsp" target="main"><img src="/shopping/images/top/user.jpg"/>会员信息</a></li>
            		<li class="inactive"><a href="/shopping/admin/queForder.jsp" target="main"><img src="/shopping/images/top/dingdan.jpg"/>订单管理</a></li>
            		<li class="inactive"><a href="/shopping/admin/queGood.jsp" target="main"><img src="/shopping/images/top/good.jpg"/>商品信息</a></li>
            		<li class="inactive"><a href="/shopping/admin/main.jsp" target="main"><img src="/shopping/images/top/home.gif"/>系统首页</a></li>
        		</ul>
    		</div>
        </div>
    	<div id="bot">
       		<table cellSpacing=0 cellPadding=0 width="100%">
            	<tr>
               	  <td width="35%">
              			<div>
              				<img src="/shopping/images/top/nav_pre.gif" align="absMiddle">
              				<span style="margin:0px 5px;">欢迎登陆Gogo网上商城</span> 
                			<span style="margin:0px 5px;">${sessionScope.account.alogin }</span>
                			<span style="margin:0px 5px;">[
							<c:choose>
								<c:when test="${sessionScope.account.agrade==1}">超级</c:when>
								<c:otherwise>
									普通
								</c:otherwise>
							</c:choose>
								管理员]</span>光临 
              			</div>
           		  </td>
          		  <td width="65%" align="right">
            			<span style="PADDING-RIGHT:50px">
                			<span id="clock"></span>
                		</span>
           		  </td>
                </tr>
            </table>
    	</div>
  </div>
  <script type=text/javascript>
    var clock = new Clock();
    clock.display(document.getElementById("clock"));
  </script>
</body>
</html>
