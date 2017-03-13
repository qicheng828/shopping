<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>


		<title>My JSP 'queUsers.jsp' starting page</title>

		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
	*{margin:0px; font-size:12px;}
	a img{border:0px;}
	#shuju{
		width:100%;
		border:0px;
		background-color:#b5d6e6;
	}
	#shuju td{
		 height:22px;
		 text-align:center;
		 line-height:22px;
	}
	#shuju td a{color:#FF0000; text-decoration:underline}
	#que_text_center span{
		display:block;
		width:305px;
		padding-top:8px;
	}
	#que_text_center span #que_submit{
		margin-left:15px;
		width:40px;
		height:20px;
		background-color: #1862BB;
		font-size:12px;
		color:#FFFFFF;
		border:none;
	}
	.bg1{background-color:#E8F6FF}
	.bg{background-color:#ffffff}
	.click{background-color:#ccffff}
</style>
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/plugin/pagination/pagination.css"></link>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/public.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/plugin/pagination/jquery.pagination.js"></script>
		<script type="text/javascript">
				var forderstr="";
				var uid =0;
				var currentPage =1;
				var obj = null;
				var countPage =0;
		 function getjsion(){
			$.getJSON(formartURL("/shopping/forder.do?status=queForderByUid&currentPage="+currentPage+"&uid=" + uid),null,function (forders){
							var str="";
							for(var i=0;i<forders.length;i++){
								 str=str +   "<tr>";
								 str=str +   "<td>" + forders[i].fid + "</td>";
								 str=str +   "<td>" + forders[i].ftotal + "</td>";
								 str=str +   "<td>" + forders[i].uname + "</td>";
								 str=str +   "<td>" + forders[i].uphone + "</td>";
								 str=str +   "<td>" + forders[i].uemail + "</td>";
								 str=str +   "<td>" + forders[i].upost + "</td>";
								 str=str +   "<td>" + forders[i].uaddress + "</td>";
								 str=str +  "</tr>";
							}
							forderstr=str;
							var str="<table width='100%' style='background-color:#95CCE5;' cellspacing='1' cellspacing='0' cellpadding='0'>";
					         str=str + "<tr>";
					         str=str +  "<td width='10%' background='/shopping/images/main/bg.gif'>" + "订单编号" + "</td>";
					         str=str +   "<td width='10%' background='/shopping/images/main/bg.gif'>" + "购物总价" + "</td>";
					         str=str +   "<td width='10%' background='/shopping/images/main/bg.gif'>" + "收货人姓名" + "</td>";
					         str=str +   "<td  width='15%' background='/shopping/images/main/bg.gif'>" + "收货人电话" + "</td>";
					         str=str +   "<td width='15%'  background='/shopping/images/main/bg.gif'>" + "E-mail地址" + "</td>";
					         str=str +   "<td width='10%'  background='/shopping/images/main/bg.gif'>" + "邮政编码" + "</td>";
					         str=str +   "<td width='40%' background='/shopping/images/main/bg.gif'>" + "送货地址" + "</td>";
					         str=str +   "</tr>";
						     str = str + forderstr;
							 str=str +"</table>";
							 $(obj).parent().parent().next().next().show();
						     $(".sorder").children().html(str);
						     $(obj).parent().parent().next().show();
						});
					
		}
		
		$("document").ready(function (){
		
				$("#shuju td").addClass("bg1");
				$("#shuju td").mouseover(function(){
					$(this).removeClass("bg1");
					$(this).parent().children().addClass("bg");
				}).mouseout(function(){
					$(this).parent().children().removeClass('bg');
					$(this).parent().children().addClass("bg1");
				}).click(function(){
					$("#shuju td,.click").removeClass("click");
					$(this).parent().children().addClass("click");
				});
				$(".del").click(function(){
					if(confirm("删除用户会将用户所有的订单删除，您是否要删除此用户?")){
						var uid = $(this).attr("id");
						$(this).parent().parent().remove();
						$(this).attr("href",formartURL("/shopping/users.do?status=delUsers&uid=" + uid));
					}
				}).mouseover(function(){
					$(this).css("cursor","hand");
				});
				$(".split").hide();
				$(".sorder").hide();
				$(".selectPage").change(function (){
					currentPage = $(this).attr("value");
					getjsion();
				});
				$(".asplit").click(function (){
					var sel = $(this).attr("id");
					switch(sel){
						case "1":
							if(currentPage==1){
								return;
							}
							currentPage=1;
							
							break;
						case "2":
							if(currentPage>1){
								currentPage=currentPage-1;
							}else{
								return;
							}
							break;
						case "3":
							if((currentPage+1)>countPage){
								return;
							}
							currentPage =currentPage +1;
							break;
						case "4": 
							if(currentPage==countPage){
								return;
							}
							currentPage =currentPage+1;
							break;
					}
					getjsion();
				});
				$(".showforder").click(function (){
					obj = this;
					$(".sorder").hide();
					$(".split").hide();
					if(uid == $(this).attr("id")){
						uid=0;
					}else{
						uid = $(this).attr("id");
						forderstr="";
					$.get(formartURL("/shopping/forder.do?status=countByUid&uid=" + uid),null,function (count){
						if(count>0){
							 var option ="";
							 countPage =count;
							 for(var i=0;i<count;i++){
							 	if((i+1)==currentPage){
							 	   option = option + "<option value='" +(i+1)+ "' selected='selected' >" + (i+1) + "</option>" 
							 	}else{
								   option = option + "<option value='" +(i+1)+ "' >" + (i+1) + "</option>" 
								}
							 }
							 $(".page").html(count);
							 $(".currentpage").html(currentPage);
							 $(".selectPage").html(option);
						}else{
							 countpage=0;
						}
					});
					$.getJSON(formartURL("/shopping/forder.do?status=queForderByUid&currentPage=1&uid=" + uid),null,function (forders){
							var str="";
						if(forders!=null){
							for(var i=0;i<forders.length;i++){
								 str=str +   "<tr>";
								 str=str +   "<td>" + forders[i].fid + "</td>";
								 str=str +   "<td>" + forders[i].ftotal + "</td>";
								 str=str +   "<td>" + forders[i].uname + "</td>";
								 str=str +   "<td>" + forders[i].uphone + "</td>";
								 str=str +   "<td>" + forders[i].uemail + "</td>";
								 str=str +   "<td>" + forders[i].upost + "</td>";
								 str=str +   "<td>" + forders[i].uaddress + "</td>";
								 str=str +  "</tr>";
							}
							forderstr=str;
							var str="<table width='100%' style='background-color:#95CCE5;' cellspacing='1' cellspacing='0' cellpadding='0'>";
					         str=str + "<tr>";
					         str=str +  "<td width='10%' background='/shopping/images/main/bg.gif'>" + "订单编号" + "</td>";
					         str=str +   "<td width='10%' background='/shopping/images/main/bg.gif'>" + "购物总价" + "</td>";
					         str=str +   "<td width='10%' background='/shopping/images/main/bg.gif'>" + "收货人姓名" + "</td>";
					         str=str +   "<td  width='15%' background='/shopping/images/main/bg.gif'>" + "收货人电话" + "</td>";
					         str=str +   "<td width='15%'  background='/shopping/images/main/bg.gif'>" + "E-mail地址" + "</td>";
					         str=str +   "<td width='10%'  background='/shopping/images/main/bg.gif'>" + "邮政编码" + "</td>";
					         str=str +   "<td width='40%' background='/shopping/images/main/bg.gif'>" + "送货地址" + "</td>";
					         str=str +   "</tr>";
						     str = str + forderstr;
							 str=str +"</table>";
							 $(obj).parent().parent().next().next().show();
							
						}else{
							 str="<span>此用户目前还没有任何订购记录</span>";
						}
						     $(".sorder").children().html(str);
						     $(obj).parent().parent().next().show();
						});
					}
					
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
														<strong>你当前的位置</strong>：查看会员
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
								style="background-repeat:repeat-y"></td>
							<td width="40">
								<img src="/shopping/images/admin/icon_search.gif" />
							</td>
							<td id="que_text_center">
								<form action="/shopping/usersAction_queryUser.action" method="post">
									<span>会员名称： <input type="text" name="users.ulogin" /> </span>
									<span>联系电话： <input type="text" name="users.uphone" /> </span>
									<span style="padding-bottom:10px;">电子邮箱： <input
											type="text" name="users.uemail" /> 
											<input type="submit" value="搜索" id="que_submit" /> </span>
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
											会员名称
										</td>
										<td width="8%" background="/shopping/images/main/bg.gif">
											真实姓名
										</td>
										<td width="11%" background="/shopping/images/main/bg.gif">
											联系电话
										</td>
										<td width="17%" background="/shopping/images/main/bg.gif">
											电子邮箱
										</td>
										<td width="14%" background="/shopping/images/main/bg.gif">
											通讯地址
										</td>
										<td width="8%" background="/shopping/images/main/bg.gif">
											邮政编码
										</td>
										<td width="10%" background="/shopping/images/main/bg.gif">
											历史订单
										</td>
										<td width="5%" background="/shopping/images/main/bg.gif">
											删除
										</td>
									</tr>
									<c:forEach items="${requestScope.usersList}" var="users">
										<tr>
											<td>
												${users.ulogin }
											</td>
											<td>
												${users.uname }
											</td>
											<td>
												${users.uphone }
											</td>
											<td>
												${users.uemail }
											</td>
											<td>
												${users.uaddress }
											</td>
											<td>
												${users.upost }
											</td>
											<td>
												<span class="showforder" id="${users.uid}">查看订单</span>
											</td>
										
											<td>
												<a class="del" id="${users.uid}">删除</a>
											</td>
										</tr>
										<tr class="sorder">
											<td colspan="9"></td>
										</tr>
										<tr class="split">
											<td height="35" background="/shopping/images/main/tab_19.gif" colspan="9" >
											<table width="100%" border="0" cellspacing="0" cellpadding="0" style='background-color:#ee55ff;'>
												<tr>
												 <td align="left">共有 <span class="page"></span> 页记录，当前第 <span class="currentpage"></span> / <span class="page"></span> 页</td>
												 <td><table border="0" align="right" cellpadding="0" cellspacing="0"><tr>
												 <td width="40"><img src="/shopping/images/main/first.gif" width="37" height="15" id="1" class="asplit" /></td>
												 <td width="45"><img src="/shopping/images/main/back.gif" width="43" height="15" id="2" class="asplit" /></td>
												 <td width="45"><img src="/shopping/images/main/next.gif" width="43" height="15" id="3" class="asplit" /></td>
												 <td width="40"><img src="/shopping/images/main/last.gif" width="37" height="15" id="4" class="asplit" /></td>
												 <td width="100">
												  显示第<select class="selectPage">
												 		
												 	</select>页
												 </td>
												 <td width="40"></td>
												</tr></table></tr>
											</table>
											</td>
										</tr>
									</c:forEach>
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
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<c:if test="${requestScope.usersList==null}">
											<td>
												&nbsp;
											</td>
										</c:if>
										<c:if test="${requestScope.usersList!=null}">
											<td>
												<strong>&nbsp;&nbsp;共有 ${sessionScope.countPage }
													条记录，当前第 ${sessionScope.currentPage
													}/${sessionScope.countPage } 页</strong>
											</td>
											<td>
												<table border="0" align="right" cellpadding="0"
													cellspacing="0">
													<tr>
														<td width="40">
															<c:url var="first" value="/users.do">
																<c:param name="status" value="otherPage" />
																<c:param name="currentPage" value="1" />
															</c:url>
															<a href="${first }"><img
																	src="/shopping/images/main/first.gif" width="37"
																	height="15" id="first" /> </a>
														</td>
														<td width="45">
															<c:url var="back" value="users.do">
																<c:param name="status" value="otherPage" />
																<c:param name="currentPage"
																	value="${sessionScope.currentPage-1}" />
															</c:url>
															<c:choose>
																<c:when test="${sessionScope.currentPage>1}">
																	<a href="${back}"><img
																			src="/shopping/images/main/back.gif" width="43"
																			height="15" id="back" /> </a>
																</c:when>
																<c:otherwise>
																	<img src="/shopping/images/main/back.gif" width="43"
																		height="15" id="back" />
																</c:otherwise>
															</c:choose>
														</td>
														<td width="45">
															<c:url var="next" value="users.do">
																<c:param name="status" value="otherPage" />
																<c:param name="currentPage"
																	value="${sessionScope.currentPage+1}" />
															</c:url>
															<c:choose>
																<c:when
																	test="${sessionScope.currentPage<sessionScope.countPage}">
																	<a href="${next}"><img
																			src="/shopping/images/main/next.gif" width="43"
																			height="15" id="next" /> </a>
																</c:when>
																<c:otherwise>
																	<img src="/shopping/images/main/next.gif" width="43"
																		height="15" id="next" />
																</c:otherwise>
															</c:choose>

														</td>
														<td width="40">
															<c:url var="last" value="users.do">
																<c:param name="status" value="otherPage" />
																<c:param name="currentPage"
																	value="${sessionScope.countPage}" />
															</c:url>
															<a href="${last }"><img
																	src="/shopping/images/main/last.gif" width="37"
																	height="15" id="last" /> </a>
														</td>
														<td width="100">
															转到第
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
														<td width="40">
															<a class="selpage"><img
																	src="/shopping/images/main/go.gif" width="37"
																	height="15" id="go" /> </a>
														</td>
													</tr>
												</table>
											</td>
										</c:if>
									</tr>
								</table>
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