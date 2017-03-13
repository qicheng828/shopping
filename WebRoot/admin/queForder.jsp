<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查询订单</title>
<link rel="stylesheet" href="/shopping/css/admin/queForder.css" type="text/css"></link>
<script type="text/javascript" src="/shopping/js/public.js"></script>
<script type="text/javascript" src="/shopping/js/validate/jquery.js"></script>
<script type="text/javascript" src="/shopping/js/validate/formValidator.js"></script>
<script type="text/javascript" src="/shopping/plugin/datepicker/WdatePicker.js"></script>
<script type="text/javascript">
	$("document").ready(function(){
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
			if(confirm("你确定要删除这个订单吗？")){
			 	var fid = $(this).attr("id");
				$(this).parent().remove();
				$(this).attr("href","/shopping/forderAction_deleteForder.action?forder.fid=" + fid);
			}
		}).mouseover(function(){
			$(this).css("cursor","hand");
		});
		$(".status").change(function (){
			var fid = $(this).attr("id");
			var sid= $(this).val();
			$.get(formartURL("/shopping/forder.do?status=updStatus&fid=" + fid +"&sid=" + sid),null,function(){
			
			});
		});
				$("#currentPage").change(
								function() {
									window.open(
											"/shopping/forderAction_splitPage.action?currentPage="
													+ $(this).val(), "_self");
								});
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)}});
		$("#csny").focus(function(){
				WdatePicker({
					skin:'whyGreen',
					oncleared:function(){$(this).blur();},
					onpicked:function(){$(this).blur();}
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
        <td width="12" height="30"><img src="/shopping/images/main/tab_03.gif" width="12" height="30" /></td>
        <td>
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          	<tr>
            	<td width="46%" valign="middle">
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr>
                			<td width="5%"><div align="center"><img src="/shopping/images/main/tb.gif" width="16" height="16" /></div></td>
                			<td width="95%"><strong>你当前的位置</strong>：查看订单</td>
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
      <tr>
        <td width="30%" background="/shopping/images/main/tab_12.gif" style="background-repeat:repeat-y"></td>
        <td width="40"><img src="/shopping/images/admin/icon_search.gif" /></td>
        <td id="que_text_center">
   	      <form action="/shopping/forderAction_queryForder.action" method="post" id="form1" name="form1">
        	   <span>订单编号：
       	       <input type="text" name="forder.fid"/>
        	   </span>
              <span>客户名称：
               <input type="text" name="forder.uname"/></span>
               <span style="padding-bottom: 10px;">订购时间： 
               <input type="text" name="forder.fdate" id="csny"  />
               <input type="submit" style="" value="搜索" id="que_submit" /></span>
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
        <td valign="top"><table id="shuju" cellpadding="0" cellspacing="1">
          <tr>
            <td width="10%" background="/shopping/images/main/bg.gif">订单编号</td>
            <td width="14%" background="/shopping/images/main/bg.gif">客户名</td>
            <td width="14%" background="/shopping/images/main/bg.gif">订购日期</td>
            <td width="10%" background="/shopping/images/main/bg.gif">订单状态</td>
            <td width="8%" background="/shopping/images/main/bg.gif">总金额</td>
            <td width="10%" background="/shopping/images/main/bg.gif">订单详情</td>
            <td width="10%" background="/shopping/images/main/bg.gif">删除</td>
          </tr>
          <!-- 显示订单信息结束 -->
          <c:if test="${requestScope.forders != null}">
          	<c:forEach items="${requestScope.forders}" var="forder">
	          	<tr>
		            <td>${forder[0].fid}</td>
		            <td>${forder[1].uname}</td>
		            <td>${forder[0].fdate}</td>
                    <td>${forder[2].status}</td>
		            <td><b>${forder[0].ftotal }</b></td>
		            <td><img src="/shopping/images/main/edt.gif" width="16" height="16" border="0" />
		            <a href="/shopping/forderAction_queryBySorder.action?sorder.forder.fid=${forder[0].fid}">详情</a></td>
		            <td><a class="del" id="${forder[0].fid}"><img src="/shopping/images/main/del.gif" width="16" height="16" />删除</a></td>
		         </tr>
         	 </c:forEach>
          </c:if>
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
        <td ><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
         	 <c:if test="${requestScope.forders==null}">&nbsp;</c:if>
          	<c:if test="${requestScope.forders!=null}">
              <td><strong>&nbsp;&nbsp;共有 ${sessionScope.pages } 页记录，当前第 ${sessionScope.currentPage }/${sessionScope.page } 页</strong></td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
               	<c:url var="first" value="/forderAction_splitPage.action">
                  		<c:param name="status" value="otherPage" />
                  		<c:param name="currentPage" value="1"/>
                  	</c:url>
                  	<c:url var="last" value="/forderAction_splitPage.action">
                  		<c:param name="status" value="otherPage" />
                  		<c:param name="currentPage" value="${sessionScope.page}" />
                  	</c:url>
                  	<c:url var="back" value="/forderAction_splitPage.action">
                  		<c:param name="status" value="otherPage" />
                  		<c:param name="currentPage" value="${sessionScope.currentPage-1}" />
                  	</c:url>
                  	<c:url var="next" value="/forderAction_splitPage.action">
                  		<c:param name="status" value="otherPage" />
                  		<c:param name="currentPage" value="${sessionScope.currentPage+1}" />
                  	</c:url>
                <tr>
                  <td width="40">
                  	<a href="${first}"><img src="/shopping/images/main/first.gif" width="37" height="15" id="first" /></a>
                  </td>
                  <td width="45">
                  	<c:choose>
                  		<c:when test="${sessionScope.currentPage==1}">
                  			<a href="${first}"><img src="/shopping/images/main/back.gif" width="43" height="15"/></a>
                  		</c:when>
                  		<c:otherwise>
                  			<a href="${back}"><img src="/shopping/images/main/back.gif" width="43" height="15" /></a>
                  		</c:otherwise>
                  	</c:choose>
                  	</td>
                  <td width="45">
                  	<c:choose>
                  		<c:when test="${sessionScope.currentPage>=sessionScope.page}">
                  			<a href="${last}"><img src="/shopping/images/main/next.gif" width="43" height="15"/></a>
                  		</c:when>
                  		<c:otherwise>
                  			<a href="${next}"><img src="/shopping/images/main/next.gif" width="43" height="15"  /></a>
                  		</c:otherwise>
                  	</c:choose>
                  </td>
                  <td width="40">
          			<a href="${last}"><img src="/shopping/images/main/last.gif" width="37" height="15" id="last" /></a></td>
                  <td width="100">转到第
                    <select name="currentPage" id="currentPage">
                    	<c:forEach begin="1" end="${sessionScope.page}" var="num">
                    		<c:choose>
                    			<c:when test="${sessionScope.currentPage==num}">
                    				<option value="${num }" selected="selected"> ${num }</option>
                    			</c:when>
                    			<c:otherwise>
                    				<option value="${num }" > ${num }</option>
                    			</c:otherwise>
                    		</c:choose>
                    	</c:forEach>
                    </select>
                    页</td>
                  <td width="40"><a class="selpage"><img src="/shopping/images/main/go.gif" width="37" height="15" id="go" /></a></td>
                </tr>
            </table></td>
            </c:if>
          </tr>
        </table></td>
        <td width="16"><img src="/shopping/images/main/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
