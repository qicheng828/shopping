<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<title>Gogo超萌毛绒</title>

		<link href="/shopping/css/index/index.css" rel="stylesheet"
			type="text/css" />

		<style type="text/css">
* {
	margin: 0px;
	font-size: 12px;
	color: #666666;
}

a img {
	border: 0px;
}

.border {
	border: 1px dashed #ffffff;
}

.showBorder {
	border: 1px dashed #FF0000;
}

#btn span {
	font-size: 13px;
	padding-right: 3px;
	border-right: 1px solid #FFFFFF;
	display: block;
	float: left;
	width: 24px;
	height: 18px;
	text-align: center;
}

#btn {
	background-color: #FFFF00;
}

.over {
	background-color: #FF0000;
}

.infoList {
	width: 100%;
	padding-left: 0px;
	padding-right: 0px;
}

.infoList li {
	padding-left: 0px;
	padding-right: 0px;
	width: 259px;
	float: left;
	padding: 0 19px 20px 0;
	background: #fff;
}

.infoList li .img,.infoList li .img img {
	height: 360px;
	width: 260px;
	float: left;
}

.infoList li .img img:hover {
	height: 360px;
	width: 260px;
	float: left;
	opacity: 0.7
}

.infoList li .title {
	height: 30px;
	width: 260px;
	float: left;
	text-align: left;
	line-height: 36px;
	color: #333;
}

.infoList li span {
	height: 20px;
	width: 260px;
	float: left;
	text-align: left;
	line-height: 20px;
	font-size: 12px;
	color: #f00;
}
</style>
		<script type="text/javascript" src="/shopping/js/public.js">
</script>
		<script type="text/javascript" src="/shopping/js/jquery.js">
</script>
		<script type="text/javascript" src="/shopping/js/users.js">
</script>
		<!-- InstanceEndEditable -->
	</head>

	<body>
		<div style="width: 90%; margin: 0px auto; position: relative;">



			<div id="top">
				<div id="con">
					<span class="c" style="padding-left: 30px;"><a
						href="/shopping/index.jsp">Gogo首页</a> </span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/showCar.jsp">我的购物车</a>
					</span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/main.jsp">我的物品</a>
					</span>
					<span style="margin-left: 40px;"><font color="#00ff00"><span>${sessionScope.users.uname}</span>
					</font>欢迎光临Gogo商城！</span>
					<c:if test="${sessionScope.users==null}">
						<span><strong style="color: #D369D7;"> [<a
								href="/shopping/userEnrol.jsp" style="color: #D369D7;">注册</a>/<a
								href="/shopping/usersLogin.jsp" style="color: #D369D7;">登录</a>]</strong>
						</span>
					</c:if>
					<c:if test="${sessionScope.users!=null}">
						<span style="margin-left: 40px;"> <input type="button"
								value="退出" style="color: #D369D7;" class="dd" /> </span>
					</c:if>
				</div>
				<h1 style="float: left; margin-top: 17px;">
					<a href="http://www.xiaoqikeji.com">小企科技旗下产品</a>
				</h1>
				<div id="logo">
					<img style="float: left;" src="/shopping/images/index/logo.jpg" />




					<div id="beat">
						<img style="float: left"
							src="/shopping/images/index/top_line2_search_01.gif" />
						<form action="/shopping/goodsAction_querybyGoodname.action"
							method="post" id="queFrom">
							<input id="text" type="text" name="good.gname" />
							<input id="submit" type="image"
								src="/shopping/images/index/top_line2_search_02.gif" />
						</form>
					</div>
					<div id="car">
						<img style="float: left"
							src="/shopping/images/index/shop-left.jpg" />
						<img style="float: right"
							src="/shopping/images/index/shop-right.jpg" />

						<span style="color: #000000; margin-left: 10px;">购物车:</span>
						<span style="color: #FF0000; font: bold" id="goodnum"> <c:choose>
								<c:when test="${sessionScope.goodnum==null}">0</c:when>
								<c:otherwise>${sessionScope.goodnum}</c:otherwise>
							</c:choose> </span> 件商品
						<span style="margin-left: 15px;"><a
							href="/shopping/users/showCar.jsp" style="color: #FF0000;">去结算</a>
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
						<c:forEach items="${applicationScope.goodlist}" var="list" begin="3" end="7">
							<li>
								<a href="/shopping/TypeAction_LookType.action?id=${list[0][1].cid}" class="c"><b>${list[0][1].ctype}</b> </a>
							</li>
							<li class="img">
								<img style="float: left;" src="/shopping/images/index/split.jpg" />
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<!-- InstanceBeginEditable name="EditRegion3" -->
			<div id="mid" style="margin: 5px 0px;">
				<div id="rights">



					<!--  //这里是商品分类  -->


					<div
						style="width: 100%; height: 300px; background-color: #fff; border: 1px #999 solid;">
						这里头是商品分类
					</div>






					<div class="context">
						<div>
							<P>
								&nbsp
							</P>
							<span><a href="#"><strong
									style="font-size: 24px; color: #000">超萌毛绒</strong> </a> </span>
							<span style="float: right;"><a href="#"><strong
									style="font-size: 13px; color: #999">最佳毛绒玩具，尽在Gogo商城</strong> </a> </span>
							<hr />
							<P>
								&nbsp
							</P>
						</div>
						<div class="contextMid">
							<ul class="infoList" style="list-style-type: none;">
								<c:forEach items="${sessionScope.goodlist}" var="goodss">
									<c:url value="/detailGood.jsp" var="goods">
										<c:param name="gid" value="${goodss.gid}"></c:param>
										<c:param name="gname" value="${goodss.gname}"></c:param>
										<c:param name="gprice" value="${goodss.gprice}"></c:param>
										<c:param name="gpic" value="maorong/${goodss.gpic}"></c:param>
										<c:param name="ctype" value="${goodss.category.ctype}"></c:param>
										<c:param name="gremark" value="${goodss.gremark}"></c:param>
										<c:param name="gxremark" value="${goodss.gxremark}"></c:param>
									</c:url>

									<li>
										<a href="${goods}" title="点击查看" class="img"><img
												src="/shopping/upfile/maorong/${goodss.gpic}" width="1188"
												height="592" /> </a>
										<a href="${goods}" class="title" title="查看">${goodss.gname}</a>
										<span class="info"> 价格：${goodss.gprice} </span>
									</li>
								</c:forEach>

							</ul>


						</div>
					</div>

					<div class="contextBot">
						<img style="float: left" src="/shopping/images/index/mid-left.jpg" />
						<img style="float: right"
							src="/shopping/images/index/mid-right.jpg" />
					</div>

				</div>
			</div>
		</div>






	</body>
	<!-- InstanceEnd -->
</html>

