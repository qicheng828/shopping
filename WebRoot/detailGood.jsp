<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<!-- InstanceBegin template="/Templates/modo.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Gogo商场商品展示</title>
		<!-- InstanceEndEditable -->
		<link href="/shopping/css/index/index.css" rel="stylesheet"
			type="text/css" />
		<style type="text/css">
* {
	margin: 0px;
	font-size: 12px;
	color: #666666;
}
</style>
		<!-- InstanceBeginEditable name="head" -->
		<link href="/shopping/css/index/detailGood.css" rel="stylesheet"
			type="text/css" />
		<link rel="stylesheet" type="text/css"
			href="/shopping/css/index/jqzoom.css" />
		<script type="text/javascript" src="/shopping/js/jquery.js">
</script>
		<script type="text/javascript" src="/shopping/js/users.js">
</script>
		<script type="text/javascript"
			src="/shopping/js/detailGood/jQuery-1.3.2.js">
</script>
		<script type="text/javascript"
			src="/shopping/js/detailGood/jCarouselLite_1.0.1.min.js">
</script>
		<script type="text/javascript"
			src="/shopping/js/detailGood/jquery.mousewheel.js">
</script>
		<script type="text/javascript"
			src="/shopping/js/detailGood/jquery.magnify-1.0.2.js">
</script>
		<script type="text/javascript"
			src="/shopping/js/detailGood/jquery.jqzoom1.0.2.js">
</script>
		<script type="text/javascript"
			src="/shopping/js/detailGood/jquery.jcarousel.js">
</script>
		<script type="text/javascript">
$(document).ready(function() {
	$("#micpic").jcarousel( {
		initCallback : mycarousel_initCallback
	});
	$(".jqzoom").jqueryzoom( {
		xzoom : 300,
		yzoom : 300,
		bigpicWidth : 700,
		bigpicHeight : 700,
		smallWidth : 400,
		smallHeight : 460,
		offset : 5,
		position : "right",
		preload : 1,
		lens : 1
	});
	$("#micpic").jCarouselLite( {
		btnPrev : ".btnleft",
		btnNext : ".btnright",
		visible : 4,
		speed : 500,
		vertical : true,//向上滚动
		circular : false
	//不循环滚动
			auto:800,				//自动滚动
			scroll:2   			//滚动替换两张图
			vertical:true  		//竖列展示
			easing:"bounceout",	//有缓冲效果,需要jquery.easing.1.1.js文件			
			mouseWheel:true			//支持鼠标滚动切换图片,需要jquery.mousewheel.js文件
			});
	$("#micpic ul li").mouseover(function() {
		$('#slidePic ul li,.hover').removeClass('hover');
		$(this).addClass('hover');
	})
	$(".btnleft,.btnright").mouseover(function() {
		$(this).css("cursor", "hand");
	});
});};
	
</script>
	</head>

	<body>
		<div style="width: 90%; margin: 0px auto;">
			<div id="top">
				<div id="con">
					<span class="c" style="padding-left: 30px;"><a
						href="/shopping/index.jsp">Gogo首页</a>
					</span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/showCar.jsp">我的购物车</a>
					</span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/main.jsp">我的Gogo</a>
					</span>
					<span style="margin-left: 40px;">${sessionScope.users.ulogin
						}欢迎光临Gogo商城！</span>
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
					<img style="float: left;" src="/shopping/images/index/logo.jpg"
						width="220" height="80" />
					<div id="beat">
						<img style="float: left"
							src="/shopping/images/index/top_line2_search_01.gif" />
						<form action="/shopping/goodsAction_querybyGoodname.action"
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
						<span style="color: #000000; margin-left: 10px;">购物车:</span>
						<span style="color: #FF0000; font: bold" id="goodnum"> <c:choose>
								<c:when test="${sessionScope.goodnum==null}">0</c:when>
								<c:otherwise>${sessionScope.goodnum}</c:otherwise>
							</c:choose> </span><span> 件商品</span>
						<span style="margin-left: 15px;"><a
							href="/shopping/users/showCar.jsp" style="color: #FF0000;">去结算!</a>
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
			<div style="margin: 8px auto; width: 100%;">
				<div id="drop">
					<div id="dropMid">
						<!-- 商品的图片列表 -->
						<div id="imglist" style="margin: 0px auto;">
							<span><img src="/shopping/images/detailGood/arr1.jpg"
									class="btnleft" />
							</span>
							<div>
								<ul class="jcarousel-skin-tango">
									<li>
										<img src="/shopping/upfile/${param.gpic}" id="${param.gpic}"
											width="75" height="78" />
									</li>
								</ul>
							</div>
							<span><img src="/shopping/images/detailGood/arr2.jpg"
									class="btnright" />
							</span>
						</div>
						<!-- 商品的图片列表结束 -->

					</div>

				</div>
				<div
					style="width: 150px; height: 480px; background-color: #EEF7FE; float: right;">
					<img src="/shopping/upfile/008.jpg" alt="最新女装"
						style="width: 150px; height: 125px;" />
					<ul style="list-style: none;">
						<li>
							最新连衣女装
						</li>
						<li>
							<span style="font-size: 12px; color: red;">市场价：56.0</span>
						</li>
					</ul>
					<img src="/shopping/upfile/010.jpg" alt="最新女装"
						style="width: 150px; height: 125px; padding-top: 3px;" />
					<ul style="list-style: none;">
						<li>
							超级女装
						</li>
						<li>
							<span style="font-size: 12px; color: red;">市场价：72.0</span>
						</li>
					</ul>
					<img src="/shopping/upfile/009.jpg" alt="最新女装"
						style="width: 150px; height: 125px; padding-top: 3px;" />
					<ul style="list-style: none;">
						<li>
							超级女装
						</li>
						<li>
							<span style="font-size: 12px; color: red;">市场价：84.0</span>
						</li>
					</ul>
				</div>
				<div id="show">
					<div id="showMid">
						<!-- 商品大图的显示 -->
						<div id="picshow">
							<div id="BigImage" class="jqzoom" style="border: 1px solid #ccc;">
								<img id="middleImage" src="/shopping/upfile/${param.gpic}"
									longdesc="/shopping/upfile/${param.gpic}" width="370"
									height="510" />
							</div>
						</div>
						<!-- 商品大图的显示结束 -->
						<!-- 商品的详细信息 -->
						<div id="goodinfo">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="2" class="title">
										<strong style="color: #FF0000; font-size: 18px;">我的需求我的美..尽在Gogo</strong>
									</td>
								</tr>
								<tr>
									<td class="index">
										商品编号：
									</td>
									<td class="info">
										${param.gid }
									</td>
								</tr>
								<tr>
									<td class="index">
										所属类别：
									</td>
									<td class="info">
										${param.ctype }
									</td>
								</tr>
								<tr>
									<td class="index">
										商品品牌：
									</td>
									<td class="info">
										${param.gname}
									</td>
								</tr>
								<tr>
									<td class="index" style="border-bottom: 1px dashed #CC0000">
										计量单位：
									</td>
									<td class="info" style="border-bottom: 1px dashed #cc0000">
										件
									</td>
								</tr>
								<tr>
									<td class="index">
										市场价格：
									</td>
									<td class="info" style="text-decoration: line-through">
										￥${param.gprice + 50}
									</td>
								</tr>
								<tr>
									<td class="index">
										为你节省：
									</td>
									<td class="info">
										￥ 50
									</td>
								</tr>
								<tr>
									<td class="index" style="color: #CC0000;">
										商场售价：
									</td>
									<td class="info"
										style="color: #CC0000; font-size: 18px; font: bold">
										￥${param.gprice}
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<c:url var="url" value="/forderAction_addSorder.action">
											<c:param name="sorder.gname" value="${param.gname}" />
											<c:param name="sorder.good.gid" value="${param.gid}" />
											<c:param name="sorder.gnumber" value="1" />
											<c:param name="sorder.gprice" value="${param.gprice}" />
										</c:url>
										<a href="${url}"><img border="0"
												src="/shopping/images/detailGood/btn_cart.gif" />
										</a>
									</td>
								</tr>
							</table>
						</div>
						<!-- 商品详细信息结束 -->
						<div style="clear: both; height: 15px;"></div>
					</div>
				</div>
				<!-- 商品的描述 -->
				<div style="height: 20px; clear: both;"></div>
				<div id="detail">
					<div id="detailMid">
						<h1>
							产品描述：
						</h1>
						<p>
							${param.gremark}
						</p>
						<h1>
							详细信息：
						</h1>
						<p>
							${param.gxremark}
						</p>
					</div>
				</div>
				<!-- 商品详细描述结束 -->
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
						<a href="index.html">Gogo</a> 2014-2015, All Rights Reserved
					</p>
					<p>
						地址：武汉市黄陂区华中企业城5号研发大楼
					</p>
					<p>
						Tel: (027) 63165989 Fax: (027) 62658785
						Email:chen_songyang@sina.com 鄂ICP证090719号
					</p>
					<p>
						本网站隶属于小企科技旗下网站
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
