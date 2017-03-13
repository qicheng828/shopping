<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-

transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title>Gogo商场用户注册</title>
		<!-- InstanceEndEditable -->
		<link href="/shopping/css/index/index.css" rel="stylesheet"
			type="text/css" />
		<style type="text/css">
* {
	margin: 0px;
	font-size: 12px;
	color: #666666;
}

.error_style {
	color: #FF0000;
}

.success {
	background-image: url(/shopping/images/register/ok.gif);
	background-repeat: no-repeat;
	width: 100px;
	height: 40px;
}
</style>
		<script type="text/javascript" src="/shopping/js/area.js">
</script>
		<style type="text/css">
#register {
	padding-left: 180px;
	margin: 5px auto;
}

#register #bg {
	background-image: url(/shopping/images/register/board_bg.gif);
	background- repeat: repeat-y;
	padding: 30px 0px;
}

#register form div {
	margin: 0px 0px 30px 130px;
}

#register form div span {
	margin-left: 5px;
}

#register form div input {
	width: 130px;
}

#register form #sub {
	width: 103px;
	height: 26px;
	margin-left: 70px;
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
$("document").ready(function (){
			$("#other").click(function (){
				$("#image").attr("src","/shopping/image.jsp?" + new Date().toString());
				$("#ccode").val("");
			});
			jQuery.validator.addMethod("addressCheck",function(value,element){		

//element为当前要验证的对象
				return value=="0" ? false : true;
			},"请选择地址");
			$("#textform").validate({
				event:"blur",
				errorClass:"error_style",
				focusCleanup: true,
				errorPlacement:function (error , element){
					element.next().html(error);
				},
				success:function(span){
					$(span).removeClass("error_style");
					$(span).html("&nbsp;&nbsp;&nbsp;");
					$(span).addClass("success");
				},
				rules:{
					"users.ulogin":{
						required:true,
						rangelength:[6,12],
						//remote:formartURL("/shopping/users.do?status=checkUlogin")
					},
					"users.uname":{
						required:true,
						rangelength:[2,6]
					},
					"users.upass":{
						required:true,
						rangelength:[6,16]
					},
					upass2:{
						equalTo:"#upass"
					},
					selectp:{
						addressCheck:true
					},
					selectc:{
						addressCheck:true
					},
					ccode:{
						required:true,
						//remote:formartURL("/shopping/users.do?status=checkCcode")
					},
					"users.uemail":{
						required:true,
						email:true
					},
					"users.uphone":{
						required:true,
						mobilephone:true
					},
					"users.upost":{
						required:true,
						number:true,
						rangelength:[6,6]
					},
					"users.uaddress":{
						required:true
					}
				},
				messages:{
					"users.ulogin":{
						required:"登陆名必须填写",
						rangelength:jQuery.format("※ 输入字符长度应该在 {0} 和 {1} 之间"),
						remote:"对不起!!! 此用户名已经被占用"
					},
					"users.uname":{
						required:"※必须得填写真实姓名"
					},
					"users.upass":{
						required:"请填写密码!!!",
						rangelength:jQuery.format("密码的字符长度在{0}~{1}位之间")
					},
					upass2:{
						equalTo:"两次密码输入不一致..."
					},
					"users.uemail":{
						required:"请填写E-mail地址!!!",
						email:"请输入正确的E-mail地址"
					},
					ccode:{
						required:"必须填写验证码",
						remote:"您输入的验证码错误"
					},"users.upost":{
						required:"请填写邮政编码",
						number:"请输入数字",
						rangelength:jQuery.format("输入的字符长度应该是{0}位")
					},"users.uaddress":{
						required:"请填写您的详细地址,可更好的送货"
					}
				}
				
			});
			
			
			$("#ulogin").blur(function(){
			  //alert($(this).val());
			  $.post("checkAction.action",{"name":$(this).val()},function(data){
			    if(data=="false"){
			    alert("用户名已存在!")
			     $("#abc").css('color','red').html("用户名已存在!");
			    }
			  });
			});
		});
		
	</script>


	</head>

	<body>
		<div style="width: 980px; margin: 0px auto;">
			<div id="top">
				<div id="con">
					<span class="c" style="padding-left: 30px;"><a
						href="/shopping/index.jsp" target="_self">Gogo首页</a> </span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/showCar.jsp">我的购物车</a>
					</span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/main.jsp"
						target="_self">我的Gogo</a> </span>
					<span style="margin-left: 40px;">${sessionScope.users.ulogin}欢迎光临

						Gogo商城！</span>
					<c:if test="${sessionScope.user==null}">
						<span><strong style="color: #D369D7;"> [<a
								href="/shopping/userEnrol.jsp" style="color: #D369D7;">注册</a>/<a
								href="/shopping/usersLogin.jsp" style="color: #D369D7;">登录</a>]</strong>
						</span>
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
						<form action="/shopping/good.do" method="post" id="queFrom">
							<input id="text" type="text" name="gname" />
							<input id="submit" type="image"
								src="/shopping/images/index/top_line2_search_02.gif" />
							<input type="hidden" name="status" value="queGoodByGname" />
						</form>
					</div>
					<div id="car">
						<img style="float: left"
							src="/shopping/images/index/shop-

left.jpg" />
						<img style="float: right"
							src="/shopping/images/index/shop-right.jpg" />
						<span style="color: #000000; margin-left: 10px;">购物车：<span
							style="color: #FF0000; font: bold">0</span>件商品</span>
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
							<a href="/shopping/index.jsp"><b>首页</b>
							</a>
						</li>
						<li class="img">
							<img style="float: left;" src="/shopping/images/index/split.jpg" />
						</li>


						<c:forEach items="${applicationScope.chotCategory}" var="category">
							<li>
								<a
									href="/shopping/good.do?status=queGoodByGname&cid=${category.cid }"><b>

										${category.ctype}</b>
								</a>
							</li>
							<li class="img">
								<img style="float: left;" src="/shopping/images/index/split.jpg" />
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="register">
				<div>
					<img src="/shopping/images/register/title.gif" />
				</div>
				<div>
					<img src="/shopping/images/register/top.gif" />
				</div>
				<div id="bg">
					<form action="/shopping/usersAction_saveUsers.action" method="post"
						id="textform" name=form1>
						<div>
							<label>
								用户昵称：
							</label>
							<input type="text" name="users.ulogin" id="ulogin" />
							<span id="abc">用户名要在6~12位之间</span>
						</div>
						<div>
							<label>
								用户姓名：
							</label>
							<input type="text" name="users.uname" id="uname" />
							<span>请填写真正的姓名，方便送货</span>
						</div>
						<div>
							<label>
								用户密码：
							</label>
							<input type="password" name="users.upass" id="upass" />
							<span>密码长度 6 ~ 16 位之间</span>
						</div>
						<div>
							<label>
								确认密码：
							</label>
							<input type="password" name="upass2" id="upass2" />
							<span>重复输入以上的密码</span>
						</div>
						<div>
							<label>
								通讯电话：
							</label>
							<input type="text" name="users.uphone" id="uphone" />
							<span class="info">请填写手机号码</span>
						</div>
						<div>
							<label>
								电子邮件：
							</label>
							<input type="text" name="users.uemail" id="uemail" />
							<span>请填写正确的电子邮箱地址</span>
						</div>
						<div>
							<label>
								邮政编号：
							</label>
							<input type="text" name="users.upost" id="upost" />
							<span>有效的邮政编码为六位的数字</span>
						</div>
						<div>
							<label>
								所在省市：
							</label>
							<select name="selectp" id="selectp"
								onchange="selectcityarea

('selectp','selectc','form1');">
								<option selected value=0>
									不限--
								</option>
							</select>
							<span></span>
							<label style="margin-left: 15px;">
								市：
							</label>
							<select name="selectc" id="selectc">
								<option selected value=0>
									不限--
								</option>
							</select>
							<span
								style="background-image: (/ shopping/ images/ register/ ok.gif ); width: 20px; height: 20px;"></span>
						</div>
						<div>
							<label>
								详细地址：
							</label>
							<input type="text" name="users.uaddress" id="uaddress" />
							<span>输入您的详细地址</span>
						</div>
						<div>
							<label>
								验证编码：
							</label>
							<input type="text" name="ccode" id="ccode" maxlength="4" size="5"
								style="width: 50px; text-align: center;" />
							<span>请填写右边的验证码</span>
							<img style="margin-left: 15px;" id="image"
								src="/shopping/image.jsp" />
							<span id="other">看不清</span>
						</div>
						<script language=javascript>
first("selectp", "selectc", "form1", 0, 0);</script>
						<div style="margin-bottom: 0px;">
							<input type="image" id="sub"
								src="/shopping/images/register/m_button_02.gif" />

						</div>

					</form>
				</div>
				<div>
					<img src="/shopping/images/register/bottom.gif" />
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
						地址：郴州市苏仙区东铁营顺三条18号院(金隅中威商务花园)一号楼 109-A
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
