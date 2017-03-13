<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<title>Gogo商场经典首页</title>

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

#apDiv1 {
	position: absolute;
	left: 90px;
	top: 155px;
	width: 200px;
	height: 370px;
	z-index: 1;
	background-color: #fff;
}

#apDiv3 {
	position: absolute;
	left: 908px;
	top: 158px;
	width: 125px;
	height: 356px;
	z-index: 1;
	background-color: #fff;
}
</style>
		<script type="text/javascript" src="/shopping/js/public.js">
</script>
		<script type="text/javascript" src="/shopping/js/jquery.js">
</script>
		<script type="text/javascript" src="/shopping/js/users.js">
</script>
		<script type="text/javascript">
var curr = 1;
$("document").ready(function() {
	$(".log").hide();
	$("#1").show();
	$("#b1").removeClass("over");
	$(".show").addClass("border");
	$(".show").mouseover(function() {
		$(this).removeClass("border");
		$(this).addClass("showBorder");
	});
	$(".show").mouseout(function() {
		$(this).removeClass("showBorder");
		$(this).addClass("border");
	});
	setTimeout(init, 5000);
	$("#btn span").click(function() {
		curr = $(this).html();
		$(".log").hide();
		$("#" + $(this).html()).show();
	});
	$(".num").mousemove(function() {
		curr = $(this).html();
		$(".log").hide();
		$("#" + $(this).html()).show();
		$(".num").removeClass("over");
		$(this).addClass("over");
	});
});
function init() {
	curr++;
	if (curr > 4) {
		curr = 4;
	}
	$(".log").hide();
	$("#" + curr).show();
	$(".num").removeClass("over");
	$("#b" + curr).addClass("over");
	if (curr == 4) {
		curr = 0;
	}
	setTimeout(init, 5000);
}
</script>
		<!-- InstanceEndEditable -->
	</head>

	<body>
		<div style="width: 90%; margin: 0px auto;">
		<!--  
			<div id="apDiv1">
				<table style="width: 200px; height: 370px;" align="center">
					<tr>
						<td colspan="4"><strong style="font-size: 16px;">时尚服装</strong></td>  
					</tr>
					<tr>
						<td>最新</td>
						<td>最热</td> 
						<td>裙子</td> 
						<td>特卖</td>   
					</tr>
					<tr>
						<td colspan="4"><strong style="font-size: 16px;">精品女鞋</strong></td>  
					</tr>
					<tr>
						<td>帆布鞋</td>
						<td>高跟鞋</td> 
						<td>夏季热卖</td> 
						<td>最新</td>   
					</tr>
					<tr>
						<td colspan="4"><strong style="font-size: 16px;">最美饰品</strong></td>  
					</tr>
					<tr>
						<td>耳环</td>
						<td>手镯</td> 
						<td>今日热卖</td> 
						<td>最新</td>   
					</tr>
					<tr>
						<td colspan="4"><strong style="font-size: 16px;">潮流化妆</strong></td>  
					</tr>
					<tr>
						<td>品牌化妆</td>
						<td>今日热卖</td> 
						<td>最新</td> 
						<td>推荐</td>   
					</tr>
					<tr>
						<td colspan="4"><strong style="font-size: 16px;">超萌毛绒</strong></td>  
					</tr>
					<tr>
						<td>史酷比</td>
						<td>大型</td> 
						<td>小型</td> 
						<td>最热</td>   
					</tr>
				</table>
			</div>
			-->
			<div id="apDiv3">
				<a href="#"><img src="/shopping/images/flash/10.jpg" alt="" />
				</a>
				<a href="#"><img src="/shopping/images/flash/11.jpg" alt="" />
				</a>
			</div>

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
				<!--  
					<a href="http://www.xiaoqikeji.com">小企科技旗下产品</a>
					-->
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
			<div id="mid" style="margin: 5px 0px;">
				<div id="rights">




					<div style="margin-bottom: 5px; border: 1px;">

						<img style="margin-right: 4px;" class="log" width="100%"
							height="370" id="1" src="/shopping/images/flash/1.jpg" />
						<img style="margin-right: 4px;" class="log" width="100%"
							height="370" id="2" src="/shopping/images/flash/2.jpg" />
						<img style="margin-right: 4px;" class="log" width="100%"
							height="370" id="3" src="/shopping/images/flash/3.jpg" />
						<img style="margin-right: 4px;" class="log" width="100%"
							height="370" id="4" src="/shopping/images/flash/4.jpg" />
						<div />






						<c:forEach items="${applicationScope.goodlist}" var="list" end="3">
							<div class="context">
								<div>
									<P>
										&nbsp
									</P>
									<span><a href="#"><strong
											style="font-size: 24px; color: #000">${list[0][1].ctype}</strong>
									</a>
									</span>
									<span style="float: right;"><a href="#"><strong
											style="font-size: 13px; color: #999">点击查询所有${list[0][1].ctype}</strong>
									</a>
									</span>
									<hr />
									<P>
										&nbsp
									</P>
								</div>
								<div class="contextMid">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">

										<tr>
											<c:forEach items="${list}" var="goodss" end="3">
												<c:url value="/detailGood.jsp" var="goods">
													<c:param name="gid" value="${goodss[0].gid}"></c:param>
													<c:param name="gname" value="${goodss[0].gname}"></c:param>
													<c:param name="gprice" value="${goodss[0].gprice}"></c:param>
													<c:param name="gpic" value="${goodss[0].gpic}"></c:param>
													<c:param name="ctype" value="${list[0][1].ctype}"></c:param>
													<c:param name="gremark" value="${goodss[0].gremark}"></c:param>
													<c:param name="gxremark" value="${goodss[0].gxremark}"></c:param>
												</c:url>
												<!-- 一个商品的显示  循环5次 -->
												<td>
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0" class="show">
														<tr>
															<td>
																<a href="${goods}"><img
																		src="/shopping/upfile/${goodss[0].gpic}" height="50"
																		,width="500" /> </a>
															</td>
														</tr>
														<tr>
															<td align="center">
																${goodss[0].gname }
															</td>
														</tr>
														<tr>
															<td align="center" style="text-decoration: line-through">
																市场价${goodss[0].gprice + 50}
															</td>
														</tr>
														<tr>
															<td align="center" style="font: bold; color: #FF3300">
																市场价${goodss[0].gprice}
															</td>
														</tr>
													</table>
												</td>


											</c:forEach>
										</tr>

									</table>

								</div>
							</div>
						</c:forEach>
						<div class="contextBot">
							<img style="float: left"
								src="/shopping/images/index/mid-left.jpg" />
							<img style="float: right"
								src="/shopping/images/index/mid-right.jpg" />
						</div>
						<!-- 到这里一个类别的结束 -->
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

