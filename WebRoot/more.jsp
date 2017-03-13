<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<!-- InstanceBegin template="/Templates/modo.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Gogo商场</title>
		<!-- InstanceEndEditable -->
		<link href="/shopping/css/index/index.css" rel="stylesheet"
			type="text/css" />
		<style type="text/css">
* {
	margin: 0px;
	font-size: 12px;
	color: #666666;
}

.split span a {
	margin-right: 20px;
}
</style>
		<!-- InstanceBeginEditable name="head" -->
		<style type="text/css">
* {
	margin: 0px;
	font-size: 12px;
	color: #666666;
}

.border {
	border: 1px dashed #ffffff;
}

.showBorder {
	border: 1px dashed #FF0000;
}
</style>
		<script type="text/javascript" src="/shopping/js/jquery.js">
</script>
		<script type="text/javascript" src="/shopping/js/users.js">
</script>
		<script type="text/javascript">
$("document").ready(
		function() {
			$(".show").addClass("border");
			$(".show").mouseover(function() {
				$(this).removeClass("border");
				$(this).addClass("showBorder");
			});
			$(".show").mouseout(function() {
				$(this).removeClass("showBorder");
				$(this).addClass("border");
			});
			$("#currentPage").change(
					function() {
						var currentPage = $(this).val();
						open(
								"/shopping/goodsAction_splitPage.action?currentPage="
										+ currentPage, "_self");
					});
		});
</script>
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
						<span style="color: #FF0000; font: bold"><c:choose>
								<c:when test="${sessionScope.goodnum==null}">0</c:when>
								<c:otherwise>${sessionScope.goodnum}</c:otherwise>
							</c:choose>
						</span>件商品
						<span style="margin-left: 15px;"><a
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
			<div id="mid" style="margin: 5px 0px; margin-bottom: 10px;">

				<div id="right">
					<div style="margin-bottom: 5px;">
						<img style="float: left" src="/shopping/images/show/te.jpg" />
						<div style="clear: left"></div>
					</div>
					<div class="context">
						<c:choose>
							<c:when test="${requestScope.goods==null}">
								<div
									style="text-align: center; font-size: 24px; color: #ff0000;">
									没有找到符合您所需要的商品
								</div>
							</c:when>
							<c:otherwise>
								<!-- 从这里开始，显示一个类别的信息， -->
								<div class="contextTop">
									<img style="float: left"
										src="/shopping/images/index/top-left.jpg" />
									<span
										style="float: left; font-size: 14px; font: bold; color: #D62762;">为您搜索到得商品</span>
									<img style="float: right"
										src="/shopping/images/index/top-right.jpg" />
								</div>
								<div class="contextMid">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<c:forEach items="${requestScope.goods}" var="good"
												varStatus="num">
												<c:if test="${(num.count-1)!=0 && (num.count-1)%4==0}">
										</tr>
									</table>
								</div>
								<div class="contextMid">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											</c:if>

											<td>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0" class="show">
													<tr>
														<td align="center">
															<c:forTokens items="${good.gpic}" delims="◆" var="pic"
																varStatus="num">
																<c:if test="${num.count==1}">
																	<c:set var="showpic" value="${pic}" />
																</c:if>
															</c:forTokens>
															<form action="/shopping/goodsAction_querybyGoodid.action">
																<input type="image" src="/shopping/upfile/${showpic}"
																	width="150" height="200"
																	style="border: 0px; margin: 0px; padding: 0px;" />
																<input type="hidden" name="status" value="queGoodByGid" />
																<input type="hidden" name="good.gid"
																	value="${good.gid }" />
															</form>
														</td>
														<tr>
															<td align="center">
																商品名称${good.gname }
															</td>
														</tr>
														<tr>
															<td align="center" style="text-decoration: line-through">
																市场价${good.gprice + 50}
															</td>
														</tr>
														<tr>
															<td align="center" style="font: bold; color: #FF3300">
																商场价${good.gprice}
															</td>
														</tr>
												</table>
											</td>
											</c:forEach>
										</tr>
									</table>
								</div>
								<div class="contextBot">
									<img style="float: left"
										src="/shopping/images/index/mid-left.jpg" />
									<img style="float: right"
										src="/shopping/images/index/mid-right.jpg" />
								</div>
								<div class="split">
									<table style="margin: 0px; padding: 0px;" width="100%">
										<tr>
											<td align="left">
												本次搜索的的商品数量有
												<span
													style="color: #FF0000; padding-left: 3px; padding-right: 3px;">${sessionScope.countPage}</span>
												页， 当前显示第
												<span
													style="color: #FF0000; padding-left: 3px; padding-right: 3px;">${sessionScope.currentPage
													}</span>
											</td>
											<td align="right">

												<c:url var="first" value="/good.do">
													<c:param name="status" value="queOtherPage" />
													<c:param name="currentPage" value="1" />
												</c:url>
												<a href="${first }">首页</a>

												<c:url var="back" value="good.do">
													<c:param name="status" value="queOtherPage" />
													<c:param name="currentPage"
														value="${sessionScope.currentPage-1}" />
												</c:url>
												<c:choose>
													<c:when test="${sessionScope.currentPage>1}">
														<a href="${back}">上一页</a>
													</c:when>
													<c:otherwise>
                  			上一页
                  		</c:otherwise>
												</c:choose>
												<c:url var="next" value="good.do">
													<c:param name="status" value="queOtherPage" />
													<c:param name="currentPage"
														value="${sessionScope.currentPage+1}" />
												</c:url>
												<c:choose>
													<c:when
														test="${sessionScope.currentPage<sessionScope.countPage}">
														<a href="${next}">下一页</a>
													</c:when>
													<c:otherwise>
                  			下一页
                  		</c:otherwise>
												</c:choose>
												<c:url var="last" value="good.do">
													<c:param name="status" value="queOtherPage" />
													<c:param name="currentPage"
														value="${sessionScope.countPage}" />
												</c:url>
												<a href="${last }">尾页</a> 转到第
												<select name="currentPage" id="currentPage">
													<c:forEach begin="1" end="${sessionScope.countPage}"
														var="num">
														<c:choose>
															<c:when test="${sessionScope.currentPage==num}">
																<option value="${num }" selected="selected">
																	${num }
																</option>
															</c:when>
															<c:otherwise>
																<option value="${num }">
																	${num }
																</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
												页
											</td>
										</tr>
									</table>
								</div>
							</c:otherwise>
						</c:choose>

						<!--  -->
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
