<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title>Gogo商场用户注册</title>
		<!-- InstanceEndEditable -->
		<link href="/shopping/css/index/index.css" rel="stylesheet"
			type="text/css" />
		<style type="text/css">
	* {
		margin:0px;
		font-size:12px;
		color:#666666;
	}
	<style type="text/css">
    #register{padding-left:180px; margin:5px auto;}
	#register h1{ padding:50px 0px 10px 0px;margin-left:5px; color:#FF0000; font-size:24px;}
	#register p{margin:20px 200px;}
</style>
	<script type="text/javascript">
	var sec=5;
	setInterval("castTime()",1000);
	function castTime(){
		document.getElementById("showTime").innerHTML=sec-- + "秒";
		if(sec<0){
			window.open("/shopping/index.jsp","_self");
		}
	}
</script>
	</head>

	<body>
		<div style="width:980px; margin:0px auto;">
			<div id="top">
				<div id="con">
					<span class="c" style="padding-left:30px;"><a
						href="/shopping/index.jsp" target="_self">Gogo首页</a> </span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/showCar.jsp">我的购物车</a>
							</span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/main.jsp"
						target="_self">我的Gogo</a> </span>
					<span style="margin-left:40px;">${sessionScope.users.ulogin}欢迎光临Gogo商城！</span>
					<c:if test="${sessionScope.user==null}">
						<span><strong style="color:#D369D7;"> [<a
								href="/shopping/userEnrol.jsp" style="color:#D369D7;">注册</a>/<a
								href="/shopping/usersLogin.jsp" style="color:#D369D7;">登录</a>]</strong> </span>
					</c:if>
				</div>
				<div id="logo">
					<img style="float:left;" src="/shopping/images/index/logo.jpg"
						width="220" height="80" />
					<div id="beat">
						<img style="float:left"
							src="/shopping/images/index/top_line2_search_01.gif" />
						<form action="/shopping/good.do" method="post" id="queFrom">
		                    <input id="text" type="text" name="gname" />
		                    <input id="submit" type="image" src="/shopping/images/index/top_line2_search_02.gif" />
		                    <input type="hidden" name="status" value="queGoodByGname"/>
		              	</form>
					</div>
					<div id="car">
						<img style="float:left" src="/shopping/images/index/shop-left.jpg" />
						<img style="float:right"
							src="/shopping/images/index/shop-right.jpg" />
						<span style="color:#000000; margin-left:10px;">购物车：<span
							style="color:#FF0000; font:bold">0</span>件商品</span>
						<span style="margin-left:15px;"><a
							href="/shopping/users/showCar.jsp" style="color:#FF0000;">去结算>></a>
						</span>
					</div>
				</div>
					<div id="menu">
      		<img style="float:left" src="/shopping/images/index/menu-l.gif" />
        	<img style="float:right" src="/shopping/images/index/menu-r.gif" />
            <ul>
       		  	<li><a href="/shopping/index.jsp"><b>首页</b></a></li>
               	<li class="img"><img style="float:left;" src="/shopping/images/index/split.jpg" /></li>            	
            	<c:forEach items="${applicationScope.chotCategory}"  var="category">
            		<li><a href="/shopping/good.do?status=queGoodByGname&cid=${category.cid }"><b>${category.ctype}</b></a></li>
                    <li class="img"><img style="float:left;" src="/shopping/images/index/split.jpg" /></li>
            	</c:forEach>
        	</ul>
    	</div>
			</div>
			<div id="register" style="text-align: center;">
    	<div>
        	<h1>恭喜您注册成功</h1>
            <p><span>您的登录名是：<font style="color:#ff0000; font-size:14px;">${requestScope.ulogin}</font> </span><span style="margin-left:18px;">(请记好您的登录名，以防造成不必要的麻烦)</span></p>
            <p style="margin-left:200px; margin-bottom:50px;">
            	页面将在<span id="showTime" style="color:#FF0000;margin:0px 3px;">5秒</span>后自动跳转到<a href="/shopping/index.jsp" style="color:#0066FF">Gogo首页</a>
            </p>
        </div>
  	</div>
			<div id="bot">
				<div id="we">
					<a href="#">关于我们</a> –
					<a href="#">帮助中心</a> –
					<a href="#">配送方式</a> –
					<a href="#">支付方式</a> –
					<a href="#">客服中心</a> –
					<a href="#">友情链接</a> –
					<a href="#">诚聘英才</a> –
					<a href="#">产品招商</a> –
					<a href="#">送礼指南</a> –
					<a href="#">网站地图</a>
				</div>
				<div id="info">
					<p>
						Copyright ©
						<a href="index.html">Gogo</a> 2010-2012, All Rights Reserved
					</p>
					<p>
						地址：郴州市苏仙区东铁营顺三条18号院(金隅中威商务花园)一号楼109-A
					</p>
					<p>
						Tel: (0735) 888888 Fax: (0735) 8888888 Email:ghost675340058.com
						湘ICP证090719号
					</p>
					<p>
						本网站隶属于郴州清华IT--Ghost制作
					</p>
					<hr />
					<p style="color:#CC3300">
						Gogo商城与国内知名支付平台合作,确保您的交易安全!
					</p>
					<img src="/shopping/images/index/boot_01.jpg" />
					<img src="/shopping/images/index/boot_02.jpg" />
					<img src="/shopping/images/index/boot_03.jpg" />
					<img src="/shopping/images/index/boot_04.jpg" />
					<img src="/shopping/images/index/logo123x40.jpg" />
				</div>
			</div>
		</div>
	</body>
	<!-- InstanceEnd -->
</html>
