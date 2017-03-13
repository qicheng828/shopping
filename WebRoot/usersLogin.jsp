<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<!-- InstanceBegin template="/Templates/modo.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>用户登录</title>
		<!-- InstanceEndEditable -->
		<link href="/shopping/css/index/index.css" rel="stylesheet"
			type="text/css" />
		<link href="/shopping/css/login/ulogin.css" rel="stylesheet"
			type="text/css" />
		<style type="text/css">
* {
	margin: 0px;
	font-size: 12px;
	color: #666666;
}
</style>
		<script type="text/javascript" src="/shopping/js/validate/jquery.js">
</script>
		<script type="text/javascript" src="/shopping/js/public.js">
</script>
		<script type="text/javascript"
			src="/shopping/js/validate/jquery.validate.js">
</script>
		<script type="text/javascript">
$(document).ready(function(){
   		$(".text1").focus(function (){
   			$("#info").hide();
   		});
   		$("#myform").validate({
   			rules:{
   				"users.ulogin":{
   					required:true,
   					rangelength:[6,12]
   				},
   				"users.upass":{
   					required:true,
   					rangelength:[6,12]
   				},
   				ccode:{
   					required:true,
   					remote:formartURL("/shopping/users.do?status=checkCcode)
   				}
   			},
   			messages{
   				"users.ulogin":{
   					required:"用户名不能空",
   					rangelength:jQuery.format("用户名长度在{0}-{1}")
   				},
   				"users.upass":{
   					required:"密码不能为空",
   					rangelength:jQuery.format("密码长度在{0}-{1}")
   				}
   			}
   		});
   });
　　function changeimg() 
　　{ 
	　　var myimg = document.getElementById("code"); 
	　　now = new Date(); 
	   $(".text1").html("");
	   $("#ccode").val("");
	　　myimg.src="/shopping/image.jsp?code="+now.getTime(); 
　　}
</script>
		<!-- InstanceBeginEditable name="head" -->
		<!-- InstanceEndEditable -->
	</head>

	<body>
		<div style="width: 980px; margin: 0px auto;">
			<div id="top">
				<div id="con">
					<span class="c" style="padding-left: 30px;"><a
						href="/shopping/index.jsp">Gogo首页</a>
					</span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/showCar.jsp">购物车</a>
					</span>
					<span>|</span>
					<span class="c"> <c:choose>
							<c:when test="${sessionScope.users==null}">
								<a href="/shopping/usersLogin.jsp">你好,当前是游客</a>
							</c:when>
							<c:otherwise>
								<a href="/shopping/users/main.jsp">我的购物车</a>
							</c:otherwise>
						</c:choose> </span>
					<span style="margin-left: 40px;"> <strong
						style="color: #D369D7; padding: 0px 10px;">${sessionScope.users.ulogin}</strong>欢迎光临Gogo商城！
					</span>
					<span> <strong style="color: #D369D7;"> <c:if
								test="${sessionScope.users==null}">
            			[<a href="/shopping/userEnrol.jsp"
									style="color: #D369D7;">注册</a>/<a
									href="/shopping/userLogin.jsp" style="color: #D369D7;">登录</a>]
            		</c:if> </strong> </span>
				</div>
				<h1 style="float: left; margin-top: 17px;">
					<a href="http://www.xiaoqikeji.com">小企科技旗下产品</a>
				</h1>
				<div id="logo">
					<img style="float: left;" src="/shopping/images/index/logo.jpg"
						width="220" height="80" />
					<div id="beat">
						<img style="float: left"
							src="/shopping/images/index/top_line2_search_01.gif" />
						<form action="/shopping/goodAction_queGoodByGname.action"
							method="post" id="queFrom">
							<input id="text" type="text" name="gname" />
							<input id="submit" type="image"
								src="/shopping/images/index/top_line2_search_02.gif" />
							<input type="hidden" name="status" value="queGoodByGname" />
						</form>
					</div>
					<div id="car">
						<img style="float: left"
							src="/shopping/images/index/shop-left.jpg" />
						<img style="float: right"
							src="/shopping/images/index/shop-right.jpg" />
						<span style="color: #000000; margin-left: 10px;">购物车：<span
							style="color: #FF0000; font: bold"> <c:choose>
									<c:when test="${sessionScope.gnumber==null}">0</c:when>
									<c:otherwise>${sessionScope.gnumber}</c:otherwise>
								</c:choose>
						</span>件商品</span><span style="margin-left: 15px;"><a
							href="/shopping/users/showCar.jsp" style="color: #FF0000;">去结算>></a>
						</span>
					</div>
				</div>
				<div id="menu">
					<img style="float: left" src="/shopping/images/index/menu-l.gif" />
					<img style="float: right" src="/shopping/images/index/menu-r.gif" />
					<ul>
						<li>
							<a href="/shopping/index.jsp"><b>首页</b> </a>
						</li>

						<li class="img">
							<img style="float: left;" src="/shopping/images/index/split.jpg" />
						</li>
						<c:forEach items="${applicationScope.goodlist}" var="list"
							begin="3" end="7">
							<li>
								<a
									href="/shopping/TypeAction_LookType.action?id=${list[0][1].cid}"
									class="c"><b>${list[0][1].ctype}</b> </a>
							</li>
							<li class="img">
								<img style="float: left;" src="/shopping/images/index/split.jpg" />
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<!-- InstanceBeginEditable name="EditRegion3" -->
			<div style="margin-bottom: 10px; border-bottom: 1px solid #D5D5D5">
				<div>
					<h1
						style="font-size: 14px; color: #000000; margin-top: 10px; background-image: url(/shopping/images/car/top-bg.jpg); height: 36px;">
						<img style="float: left" src="/shopping/images/car/top-left.jpg" />
						<b
							style="float: left; font-size: 14px; color: #000000; margin-top: 12px;">用户登录</b>
						<img style="float: right" src="/shopping/images/car/top-right.jpg" />
					</h1>
				</div>
				<div
					style="border-left: 1px solid #D5D5D5; border-right: 1px solid #D5D5D5">
					<div id="login">
						<div id="left">
							<form action="/shopping/usersAction_getUserss.action"
								method="post">
								<div>
									<div id="left_top">
										您现在使用的是新版登录页面，如果在使用中遇到问题，请
										<a href="/shopping/userLogin.jsp">返回旧版</a>
									</div>
								</div>
								<div class="bo">
									<label>
										用户账号：
									</label>
									<input type="text" class="text1" id="ulogin"
										name="users.ulogin" />
									<span></span>
								</div>
								<div class="bo">
									<label>
										用户密码：
									</label>
									<input type="password" class="text1" id="upass"
										name="users.upass" />
									<span id="info" style="color: #ff0000">${error}</span>
								</div>
								<div class="bo">
									<label style="margin-left: 7px; padding-top: 8px;">
										验证码：
									</label>
									<input type="text" class="text1" style="width: 60px;"
										name="ccode" id="ccode" />
									<img border=0 src="/shopping/image.jsp" id="code" />
									<a href="javascript:changeimg()" style="color: #0066CC;">看不清，换一张
									</a>

								</div>
								<div>
									<input type="submit" id="userLogin"
										style="background: url('/shopping/images/login/login.jpg');"
										value="" />
								</div>
							</form>
						</div>
						<div id="center"></div>
						<div id="right">
							<b>还不是Gogo商城用户？</b>
							<p>
								现在免费注册成为Gogo商城用户，便能立刻享受便宜而又放心的购物乐趣！
							</p>
							<a href="/shopping/userEnrol.jsp" style="margin-left: 60px;"><img
									style="border: none" src="/shopping/images/login/login_zc.jpg" />
							</a>
						</div>
						<div style="clear: both"></div>
					</div>
				</div>
			</div>
			<!-- InstanceEndEditable -->
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
					<p style="color: #CC3300">
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