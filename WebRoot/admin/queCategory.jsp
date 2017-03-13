<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@page import="java.util.List"%>
<%@page import="dong.shopping.pojo.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<style type="text/css">
	*{margin:0px; font-size:12px;}
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
	#shuju td a{color:#000000; text-decoration:none;}
	.bg1{background-color:#ffffff}
	.bg{background-color:#c1ebff}
</style>
<script type="text/javascript" src="/shopping/js/public.js"></script>
<script type="text/javascript" src="/shopping/js/jquery.js"></script>
<script type="text/javascript"> 
    
	var  highlightcolor='#c1ebff';
	var  clickcolor='#51b2f6';
	$("document").ready(function(){
		$("#shuju td").addClass("bg1");
		$("#shuju td").mouseover(function(){
			$(this).removeClass("bg1");
			$(this).parent().children().addClass("bg");
		}).mouseout(function(){
			$(this).parent().children().removeClass('bg');
			$(this).parent().children().addClass("bg1");
		});
		$(".del").click(function(){
			if(confirm("你确定要删除这个类别吗？")){
				var cid = $(this).attr("id");
				$(this).parent().parent().remove();
				$(this).attr("href",formartURL("/shopping/categoryAction_deleteCategory.action?cid=" + cid));
				
			}
		}).mouseover(function(){
			$(this).css("cursor","hand");
		});
		$(".load").hide();
		$(".chot").click(function (){
			var temp = this;
			var check=$(this).attr("checked");
			var cid = $(this).parent().parent().attr("id");
			
			$(this).hide();
			$(this).parent().children(".load").attr("src","/shopping/images/admin/zoomloader.gif");
			$(this).parent().children(".load").show();
			$.get(formartURL("/shopping/categoryAction_updateChot.action?cid=" + cid +"&chot=" + check),null,function (){
				setTimeout(function(){
					$(temp).show();
					$(temp).parent().children(".load").hide();
					$(this).parent().children(".load").removeAttr("src");
				},2000);
			});
		});
	});
</script>
<%
	
 %>
</head>

<body onload=""> 
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
                			<td width="95%"><strong>你当前的位置</strong>：商品类别查询</td>
              			</tr>
            		</table>
                </td>
            	<td width="54%">&nbsp;</td>
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
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
     	
      <tr>
        <td width="8" background="/shopping/images/main/tab_12.gif">&nbsp;</td>
        <td>
        <table id="shuju" cellpadding="0" cellspacing="1">
        
          <tr>
            <td width="6%" background="/shopping/images/main/bg.gif">序号 </td>
            <td width="26%" background="/shopping/images/main/bg.gif">名称</td>
            <td width="17%" background="/shopping/images/main/bg.gif">热点</td>
            <td width="18%" background="/shopping/images/main/bg.gif">编辑</td>
            <td width="18%" background="/shopping/images/main/bg.gif">删除</td>
          </tr>
         
          
          <c:forEach items="${sessionScope.category}" var="category">
          	<tr id="${category.cid }">
	            <td>${category.cid}</td>
	            <td>${category.ctype }</td>
	            <td>
	            	<c:choose>
	            		<c:when test="${category.chot==true}">
	            			<input type="checkbox" name="chot" class="chot" checked="checked" />
	            		</c:when>
	            		<c:otherwise>
	            			<input type="checkbox" name="chot" class="chot"  />
	            		</c:otherwise>
	            	</c:choose>
	            	<img class="load" />
	            </td>
	            <td><img src="/shopping/images/main/edt.gif" width="16" height="16" />
	            <c:url var="url" value="/admin/updCategory.jsp">
	            	<c:param name="ctype" value="${category.ctype}" />
	            	<c:param name="chot" value="${category.chot}" />
	            	<c:param name="cid" value="${category.cid}" />
	            </c:url>
	            <a href="${url}" target="_self">编辑</a></td>
	            <td><a class="del"  id="${category.cid}"><img src="/shopping/images/main/del.gif" width="16" height="16" />删除</a></td>
          	</tr>
          </c:forEach>
         
          <!-- 显示商品类别的信息 结束 -->
        </table>
        </td>
        <td width="8" background="/shopping/images/main/tab_15.gif">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="35" background="/shopping/images/main/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="/shopping/images/main/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>&nbsp;
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">   
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="/shopping/images/main/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
