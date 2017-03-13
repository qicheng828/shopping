<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>衣拉克购物商城</title>
<link href="/shopping/css/index/left.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/shopping/js/jquery.js"></script>
<script type="text/javascript" src="/shopping/js/left/left.js"></script>
</head>
<body>
<div>
	<div>
    	<h1 class="type"><a>商品类别管理</a></h1>
        <div class="menu" id="first">
        	<div><img src="/shopping/images/left/menu_topline.gif"/></div>
        	<ul>
            	<li><a href="/shopping/admin/saveCategory.jsp" target="main">添加类别</a></li>
                <li><a href="/shopping/looktype.action" target="main">查询/修改类别</a></li>
          </ul>
        </div>
    </div>
    <div>
    	<h1 class="type"><a>商品管理</a></h1>
        <div class="menu">
        	<div><img src="/shopping/images/left/menu_topline.gif" /></div>
            <ul>
            	<li><a href="/shopping/admin/saveGood.jsp" target="main">添加商品</a></li>
                <li><a href="/shopping/admin/queGood.jsp" target="main">查询/修改商品</a></li>
            </ul>
        </div>
    </div>
    <div>
    	<h1 class="type"><a>订单管理</a></h1>
        <div class="menu">
        	<div><img src="/shopping/images/left/menu_topline.gif" /></div>
            <ul>
            	<li><a href="/shopping/admin/queForder.jsp" target="main">详单查询/修改</a></li>
            </ul>
        </div>
    </div>
    <div>
    	<h1 class="type"><a>会员管理</a></h1>
        <div class="menu">
        	<div><img src="/shopping/images/left/menu_topline.gif" /></div>
            <ul>
            	<li><a href="/shopping/admin/queUsers.jsp" target="main">会员查询/修改</a></li>
            </ul>
        </div>
    </div>
	<c:if test="${sessionScope.account.agrade==1}">
	<div>
    	<h1 class="type"><a>管理员管理</a></h1>
        <div class="menu">
        	<div><img src="/shopping/images/left/menu_topline.gif" /></div>
            <ul>
            	<li><a href="/shopping/admin/saveAccount.jsp" target="main">添加管理员</a></li>
                <li><a href="/shopping/admin/queAccount.jsp" target="main">查询/修改管理员</a></li>
            </ul>
        </div>
    </div>
	
	
	</c:if>
</div>
</body>
</html>

