<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>


		<title>My JSP 'queGood.jsp' starting page</title>

		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
* {
	margin: 0px;
	font-size: 12px;
}

a img {
	border: 0px;
}

#shuju {
	width: 100%;
	border: 0px;
	background-color: #b5d6e6;
}

#shuju td {
	height: 22px;
	text-align: center;
	line-height: 22px;
}

#que_text_center span {
	display: block;
	width: 305px;
	padding-top: 8px;
}

#que_text_center span #que_submit {
	margin-left: 15px;
	width: 40px;
	height: 20px;
	background-color: #1862BB;
	font-size: 12px;
	color: #FFFFFF;
	border: none;
}

#shuju td a {
	color: #000000;
	text-decoration: none;
}

.bg1 {
	background-color: #E8F6FF
}

.bg {
	background-color: #ffffff
}

.click {
	background-color: #ccffff
}
</style>
		<script type="text/javascript" src="/shopping/js/public.js"></script>
		<script type="text/javascript" src="/shopping/js/jquery.js"></script>
		<script type="text/javascript">
	$("document")
			.ready(
					function() {
						$(".load").hide();
						$("#shuju td").addClass("bg1");
						$("#shuju td").mouseover(function() {
							$(this).removeClass("bg1");
							$(this).parent().children().addClass("bg");
						}).mouseout(function() {
							$(this).parent().children().removeClass('bg');
							$(this).parent().children().addClass("bg1");
						}).click(function() {
							$("#shuju td,.click").removeClass("click");
							$(this).parent().children().addClass("click");
						});
						$("#currentPage").change(
								function() {
									window.open(
											"/shopping/goodsAction_splitPage.action?currentPage="
													+ $(this).val(), "_self");
								});
						$(".del").click(
								function() {
									if (confirm("你确定要删除这个商品吗？")) {
										var gid = $(this).parent().attr("id");
										var gpic = $(this).attr("id");
										$(this).children("a").attr(
												"href",
												"/shopping/goodsAction_deleteGoods.action?good.gid="
														+ gid);
										$(this).parent().remove();
									}
								}).mouseover(function() {
							$(this).css("cursor", "hand");
						});

						// 事件处理
						$(".gisopen")
								.click(
										function() {
											var temp = this;
											var check = $(this).attr("checked");
											var gid = $(this).parent().parent()
													.attr("id");
											$(this).hide();
											$(this)
													.parent()
													.children(".load")
													.attr("src",
															"/shopping/images/admin/zoomloader.gif");
											$(this).parent().children(".load")
													.show();
											$
													.get(
															formartURL("/shopping/goodsAction_updateGisopen.action?good.gid="
																	+ gid
																	+ "&good.gisopen="
																	+ check),
															null,
															function() {
																setTimeout(
																		function() {
																			$(
																					temp)
																					.show();
																			$(
																					temp)
																					.parent()
																					.children(
																							".load")
																					.hide();
																			$(
																					this)
																					.parent()
																					.children(
																							".load")
																					.removeAttr(
																							"src");
																		}, 2000);
															});
										});
						$(".giscommend")
								.click(
										function() {
											var temp = this;
											var check = $(this).attr("checked");
											var gid = $(this).parent().parent()
													.attr("id");
											$(this).hide();
											$(this)
													.parent()
													.children(".load")
													.attr("src",
															"/shopping/images/admin/zoomloader.gif");
											$(this).parent().children(".load")
													.show();
											$
													.get(
															formartURL("/shopping/goodsAction_updateGiscommend.action?good.gid="
																	+ gid
																	+ "&good.giscommend="
																	+ check),
															null,
															function() {
																setTimeout(
																		function() {
																			$(
																					temp)
																					.show();
																			$(
																					temp)
																					.parent()
																					.children(
																							".load")
																					.hide();
																			$(
																					this)
																					.parent()
																					.children(
																							".load")
																					.removeAttr(
																							"src");
																		}, 2000);
															});
										});
					});
</script>

	</head>

	<body bgcolor="#E8F6FF">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" background="/shopping/images/main/tab_05.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30">
								<img src="/shopping/images/main/tab_03.gif" width="12"
									height="30" />
							</td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="46%" valign="middle">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="5%">
														<div align="center">
															<img src="/shopping/images/main/tb.gif" width="16"
																height="16" />
														</div>
													</td>
													<td width="95%">
														<strong>你当前的位置</strong>：查看商品
													</td>
												</tr>
											</table>
										</td>
										<td width="54%"></td>
									</tr>
								</table>
							</td>
							<td width="16">
								<img src="/shopping/images/main/tab_07.gif" width="16"
									height="30" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="30%" background="/shopping/images/main/tab_12.gif"
								style="background-repeat: repeat-y"></td>
							<td width="40">
								<img src="/shopping/images/admin/icon_search.gif" />
							</td>
							<td id="que_text_center">
								<form action="/shopping/goodsAction_queryGoods.action"
									method="post">
									<span>商品编号：<input type="text" name="good.gid" value="0" />
									</span>
									<span>商品名称：<input type="text" name="good.gname" />
									</span>
									<span style="padding-bottom: 10px;">商品类型：<select
											name="good.category.cid">
											<option value="">
												--请选择--
											</option>
											<c:forEach items="${sessionScope.category}"
												var="category">
												<c:choose>
													<c:when test="${sessionScope.cid==category.cid}">
														<option value="${category.cid}" selected="selected">
															${category.ctype}
														</option>
													</c:when>
													<c:otherwise>
														<option value="${category.cid}">
															${category.ctype}
														</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
										<input style="" type="submit" value="搜索" id="que_submit" />
									</span>
								</form>
							</td>
							<td width="8" background="/shopping/images/main/tab_15.gif"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr height="300px;">
							<td width="8" background="/shopping/images/main/tab_12.gif"></td>
							<td valign="top">
								<table id="shuju" cellpadding="0" cellspacing="1">
									<tr>
										<td width="8%" background="/shopping/images/main/bg.gif">
											商品编号
										</td>
										<td width="14%" background="/shopping/images/main/bg.gif">
											商品名
										</td>
										<td width="14%" background="/shopping/images/main/bg.gif">
											商品类别
										</td>
										<td width="8%" background="/shopping/images/main/bg.gif">
											售价
										</td>
										<td width="8%" background="/shopping/images/main/bg.gif">
											上架
										</td>
										<td width="8%" background="/shopping/images/main/bg.gif">
											推荐
										</td>
										<td width="10%" background="/shopping/images/main/bg.gif">
											编辑
										</td>
										<td width="10%" background="/shopping/images/main/bg.gif">
											删除
										</td>
									</tr>
									<c:if test="${requestScope.goods != null}">
										<c:forEach items="${requestScope.goods}" var="good">
											<tr id="${good[0].gid}">
												<td>
													${good[0].gid }
												</td>
												<td>
													${good[0].gname }
												</td>
												<td>
													${good[1].ctype }
												</td>
												<td>
													${good[0].gprice }
												</td>
												<td>
													<c:choose>
														<c:when test="${good[0].gisopen == true}">
															<input type="checkbox" name="good.gisopen"
																checked="checked" class="gisopen" />
														</c:when>
														<c:otherwise>
															<input type="checkbox" name="good.gisopen"
																class="gisopen" />
														</c:otherwise>
													</c:choose>
													<img class="load" />
												</td>
												<td>
													<c:choose>
														<c:when test="${good[0].giscommend == true}">
															<input type="checkbox" name="good.giscommend"
																checked="checked" class="giscommend" />
														</c:when>
														<c:otherwise>
															<input type="checkbox" name="good.giscommend"
																class="giscommend" />
														</c:otherwise>
													</c:choose>
													<img class="load" />
												</td>
												<td>
													<img src="/shopping/images/main/edt.gif" width="16"
														height="16" style="float: left; padding-left: 30px;" />
													<form action="/shopping/admin/updGood.jsp"
														style="float: left;" method="post">
														<input type="hidden" name="gid" value="${good[0].gid}" />
														<input type="hidden" name="gname" value="${good[0].gname}" />
														<input type="hidden" name="gpic" value="${good[0].gpic}" />
														<input type="hidden" name="gprice"
															value="${good[0].gprice}" />
														<input type="hidden" name="gremark"
															value="${good[0].gremark}" />
														<input type="hidden" name="gxremark"
															value="${good[0].gxremark}" />
														<input type="hidden" name="gdate" value="${good[0].gdate}" />
														<input type="hidden" name="gisopen"
															value="${good[0].gisopen}" />
														<input type="hidden" name="giscommend"
															value="${good[0].giscommend}" />
														<input type="hidden" name="cid" value="${good[1].cid}" />
														<input type="submit" class="submit" value="编辑"
															style="padding: 0px; margin: 0px; border: 0px;" />
													</form>
												</td>
												<td class="del"">
													<a><img src="/shopping/images/main/del.gif" width="16"
															height="16" />删除</a>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</table>
							</td>
							<td width="8" background="/shopping/images/main/tab_15.gif"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="35" background="/shopping/images/main/tab_19.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35">
								<img src="/shopping/images/main/tab_18.gif" width="12"
									height="35" />
							</td>
							<td>
								<c:if test="${requestScope.goods == null}">&nbsp;</c:if>
								<c:if test="${requestScope.goods != null}">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>

											<td>
												<strong>&nbsp;&nbsp;共有 ${sessionScope.pages} 条记录，当前第
													${sessionScope.currentPage }/${sessionScope.page} 页</strong>
											</td>
											<td>
												<table border="0" align="right" cellpadding="0"
													cellspacing="0">
													<tr>
														<td width="40">
															<c:url var="first" value="/goodsAction_splitPage.action">
																<c:param name="status" value="otherPage" />
																<c:param name="currentPage" value="1" />
															</c:url>
															<a href="${first}"><img
																	src="/shopping/images/main/first.gif" width="37"
																	height="15" id="first" />
															</a>
														</td>
														<td width="45">
															<c:url var="back" value="/goodsAction_splitPage.action">
																<c:param name="status" value="otherPage" />
																<c:param name="currentPage"
																	value="${sessionScope.currentPage-1}" />
															</c:url>
															<c:choose>
																<c:when test="${sessionScope.currentPage==1}">
																	<a href="${first}"><img
																			src="/shopping/images/main/back.gif" width="43"
																			height="15" />
																	</a>
																</c:when>
																<c:otherwise>
																	<a href="${back}"><img
																			src="/shopping/images/main/back.gif" width="43"
																			height="15" id="back" />
																	</a>
																</c:otherwise>
															</c:choose>
														</td>
														<td width="45">
															<c:url var="next" value="/goodsAction_splitPage.action">
																<c:param name="status" value="otherPage" />
																<c:param name="currentPage"
																	value="${sessionScope.currentPage+1}" />
															</c:url>
															<c:url var="last" value="/goodsAction_splitPage.action">
																<c:param name="status" value="otherPage" />
																<c:param name="currentPage" value="${sessionScope.page}" />
															</c:url>
															<c:choose>
																<c:when
																	test="${sessionScope.currentPage>=sessionScope.page}">
																	<a href="${last}"><img
																			src="/shopping/images/main/next.gif" width="43"
																			height="15" />
																	</a>
																</c:when>
																<c:otherwise>
																	<a href="${next}"><img
																			src="/shopping/images/main/next.gif" width="43"
																			height="15" id="next" />
																	</a>
																</c:otherwise>
															</c:choose>

														</td>
														<td width="40">
															<a href="${last}"><img
																	src="/shopping/images/main/last.gif" width="37"
																	height="15" id="last" />
															</a>
														</td>
														<td width="100">
															转到第
															<select id="currentPage">
																<c:forEach begin="1" end="${sessionScope.page}"
																	var="num">
																	<c:choose>
																		<c:when test="${sessionScope.currentPage==num}">
																			<option value="${num}" selected="selected">
																				${num }
																			</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${num}">
																				${num }
																			</option>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</select>
															页
														</td>
														<td width="40">
															<a id="currentPage""><img
																	src="/shopping/images/main/go.gif" width="37"
																	height="15" id="go" />
															</a>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</c:if>
							</td>
							<td width="16">
								<img src="/shopping/images/main/tab_20.gif" width="16"
									height="35" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
