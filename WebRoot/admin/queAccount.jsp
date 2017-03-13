<%@ page contentType="text/html; charset=utf-8" language="java" %>
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
			if(confirm("你确定要删除这个客服吗？")){
				var aid = $(this).attr("id");
				$(this).attr("href",formartURL("/shopping/account.do?status=delAccount&aid=" + aid));
				$(this).parent().remove();
			}
		}).mouseover(function(){
			$(this).css("cursor","hand");
		});
	});
</script>

</head>

<body>
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
                			<td width="95%"><strong>你当前的位置</strong>：客服信息查询</td>
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
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
     	
      <tr height="400">
        <td width="8" background="/shopping/images/main/tab_12.gif">&nbsp;</td>
        <td valign="top">
        <table id="shuju" cellpadding="0" cellspacing="1">
        
          <tr>
            <td width="8%" background="/shopping/images/main/bg.gif">序号</td>
            <td width="20%" background="/shopping/images/main/bg.gif">登陆用名</td>
            <td width="20%" background="/shopping/images/main/bg.gif">真实姓名</td>
            <td width="18%" background="/shopping/images/main/bg.gif">权限</td>
            <td width="18%" background="/shopping/images/main/bg.gif">编辑</td>
            <td width="18%" background="/shopping/images/main/bg.gif">删除</td>
          </tr>
          <!-- 这里将循环显示商品类别的信息 -->
          <c:forEach items="${requestScope.accounts}" var="account">
          	<tr>
	            <td>${account.aid }</td>
	            <td>${account.alogin }</td>
	            <td>
	            	${account.aname }
	            </td>
	            <td>
		            	<c:choose>
		            		<c:when test="${account.agrade==0}">
		            			<span>客服</span>
		            		</c:when>
		            		<c:otherwise>
		            			<span>管理员</span>
		            		</c:otherwise>
		            	</c:choose>
	            </td>
	            <td><img src="/shopping/images/main/edt.gif" width="16" height="16" />
	            <c:url var="url" value="/admin/updAccount.jsp">
	            	<c:param name="aid" value="${account.aid}" />
	            	<c:param name="aname" value="${account.aname}" />
	            	<c:param name="alogin" value="${account.alogin}" />
	            	<c:param name="agrade" value="${account.agrade}" />
				</c:url>
	            <a href="${url}" target="_self">编辑</a></td>
	            <td>
	            <c:url var="delete" value="/shopping/accountAction_delAccount.action">
	            <c:param name="account.aid" value="${account.aid}"></c:param>
	            </c:url>
	            <a href="${delete}"><img src="/shopping/images/main/del.gif" width="16" height="16" />删除</a></td>
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
          <tr>
          	<td>&nbsp;</td>
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
