<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>订单详情</title>
<style type="text/css">
	*{margin:0px; font-size:12px;}
	#shuju{
		width:90%;
		border:0px;
		border:1px solid #92B7D0;
		background-color:#b5d6e6;
	}
	#shuju td{
		 height:28px;
		 text-align:center;
		 line-height:28px;
		 background-color:#E8F6FF;
		 border-right:1px solid #92B7D0;
		 border-bottom:1px solid #92B7D0;
	}
	#que_text_center span{
		display:block;
		width:310px;
		border:1px solid #92B7D0;
		border-bottom:0px;
		padding-top:8px;
		padding:8px 10px;
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
</style>

</head>

<body bgcolor="#E8F6FF">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="/shopping/images/main/tab_05.gif">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="/shopping/images/main/tab_03.gif" width="12" height="30" /></td>
        <td>
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          	<tr>
            	<td width="46%" valign="middle">
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr>
                			<td width="5%"><div align="center"><img src="/shopping/images/main/tb.gif" width="16" height="16" /></div></td>
                			<td width="95%"><strong>你当前的位置</strong>：订单详情</td>
              			</tr>
            		</table>
                </td>
            	<td width="54%"></td>
          	</tr>
        	</table>
        </td>
        <td width="16"><img src="/shopping/images/main/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td>
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <c:forEach items="${requestScope.sorders}" var="sorder">
      <tr>
        <td width="30%" background="/shopping/images/main/tab_12.gif" style="background-repeat:repeat-y"></td>
        <td width="30"></td>
        <td id="que_text_center">
         
        	   <span>订单编号:${sorder[1].fid}</span>
               <span>客户名称:${sorder[1].uname}</span>
               <span>订购时间:${sorder[1].fdate}</span>
               <span style="border:1px solid #92B7D0;">订单状态:${sorder[1].status.status}</span> 

        </td>
        <td width="8" background="/shopping/images/main/tab_15.gif"></td>
      </tr>
     </c:forEach>
    </table>
    </td>
  </tr>
  <tr>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
     
      <tr>
        <td width="8" background="/shopping/images/main/tab_12.gif"></td>
        <td><table align="center" cellpadding="0" cellspacing="0" id="shuju" style="margin-bottom:30px;">
          <tr>
            <td colspan="5" style="background-color:#ffffFF">订单购物清单</td>
          </tr>
          <tr>
            <td width="20%">商品编号</td>
            <td width="20%">商品名称</td>
            <td width="20%">购买数量</td>
            <td width="20%">商品价格</td>
            <td width="20%">总价</td>
          </tr>
          <!-- 这里循环显示订单中商品的信息 -->
         <c:forEach items="${requestScope.sorders}" var="sorder">
          <tr>
            <td>${sorder[0].good.gid}</td>
            <td>${sorder[0].gname}</td>
            <td>${sorder[0].gnumber}</td>
            <td>${sorder[0].gprice}</td>
            <td><font color="#FF0000"><b>${sorder[0].gprice*sorder[0].gnumber}</b></font></td>
          </tr>
          </c:forEach>
          <!-- 到这里结束 -->
             <c:forEach items="${requestScope.sorders}" var="sorder">
          <tr>
            <td colspan="5" style="text-align:left; padding-left:10px; background-color:#ffffFF">送货地址：<span style="color:#ff0000">${sorder[1].uaddress}</span></td>
          </tr>
          <tr>
            <td colspan="5" style="text-align:left; padding-left:10px;">
            	<span>收货人姓名：${sorder[1].uname}<span style="color:#ff0000"></span></span>
            	<span style="margin:0px 10px;">联系电话：${sorder[1].uphone}<span style="color:#ff0000"></span></span>
            	<span style="margin:0px 10px;">邮政编码：${sorder[1].upost}<span style="color:#ff0000"></span></span>
            </td>
          </tr>
          <tr>
            <td colspan="5" style="text-align:left; padding-left:10px; background-color:#ffffFF">下单时间：<span style="color:#ff0000">${sorder[1].fdate}</span></td>
          </tr>
          <tr>
            <td colspan="5" style="text-align:left; padding-left:10px;">客户要求：<span style="color:#ff0000">${sorder[1].fremark}</span></td>
          </tr>
     </c:forEach> 
        </table></td>
        <td width="8" background="/shopping/images/main/tab_15.gif"></td>
      </tr>
     
    </table>
    
    </td>
  </tr>
  <tr>
    <td height="35" background="/shopping/images/main/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="/shopping/images/main/tab_18.gif" width="12" height="35" /></td>
        <td width="100%"></td>
        <td width="16"><img src="/shopping/images/main/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</body>
</html>
