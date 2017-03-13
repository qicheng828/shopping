<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="/shopping/plugin/uploadify/css/default.css" rel="stylesheet" type="text/css" />
	<link href="/shopping/plugin/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/shopping/js/jquery.js"></script>
	<style type="text/css">
	*{margin:0px; font-size:12px;}
	#save_text{
		margin-left:120px;
	}
	#save_text td{
		 height:30px;
		 line-height:30px;
	}
	#save_text td #save_text_submit,#save_text_reset{
		border:none;
		background-color:#1963BC;
		color:#FFFFFF;
	}
	#save_text td .text2{
		width:500px;
	}
	#save_text td .text{
		width:150px;
	}
	.bg1{background-color:#ffffff}
	.bg{background-color:#c1ebff}    
</style>
  </head>
  
 
<body bgcolor="#E8F6FF">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="/shopping/images/main/tab_05.gif" >
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
                			<td width="95%"><strong>你当前的位置</strong>：更新商品</td>
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
      <tr>
        <td width="8" background="/shopping/images/main/tab_12.gif"></td>
        <td>
     		<form action="/shopping/goodsAction_updateGoods.action" method="post" enctype="multipart/form-data">
        	<table border="0" cellpadding="0" cellspacing="0" id="save_text">
              <tr>
                    <td>商品名称：</td>
                    <td><input type="text" class="text" id="text" name="good.gname" value="${param.gname }"/></td>
                    <td></td>
                </tr>  
                <tr>
                    <td>商品类型：</td>
                    <td>
                      <select name="good.category.cid">
                      <c:forEach items="${sessionScope.category}" var="category">
                      		<c:choose>
                      			<c:when test="${category.cid==param.cid}">
                      				<option value="${category.cid}" selected="selected">${category.ctype}</option>
                      			</c:when>
                      			<c:otherwise>
                      				<option value="${category.cid}">${category.ctype}</option>
                      			</c:otherwise>
                      		</c:choose>
                      </c:forEach>
                      </select></td>
                     <td></td>
                </tr>
                <tr>
                    <td>商品售价：</td>
                    <td><input type="text" name="good.gprice" class="text" value="${param.gprice }"/></td>
                     <td></td>
                </tr>
                <tr>
                <td>商品图片:</td>
				<td><input type="file" name="image" value="${param.gpic}"/></td>
				<td><img src="/shopping/upfile/${param.gpic}" /></td>
                </tr>
                <tr>
                    <td>加入推荐：</td>
                    <td>
                        <c:choose>
                        	<c:when test="${param.giscommend==true}">
                        		<input type="radio" name="good.giscommend" checked="checked" value="true"/>推荐
                        		<input type="radio" name="good.giscommend" value="false" />不推荐
                        	</c:when>
                        	<c:otherwise>
                        		<input type="radio" name="good.giscommend" value="true"/>推荐
                        		<input type="radio" name="good.giscommend" checked="checked" value="false" />不推荐
                        	</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                 <tr>
                    <td>是否有效：</td>
                    <td>
                    	<c:choose>
                        	<c:when test="${param.gisopen==true}">
                        		<input type="radio" name="good.gisopen" checked="checked" value="true"/>上架
                       			<input type="radio" name="good.gisopen" value="false" />下架
                        	</c:when>
                        	<c:otherwise>
                        		<input type="radio" name="good.gisopen"  value="true"/>上架
                       			<input type="radio" name="good.gisopen" checked="checked" value="false" />下架
                        	</c:otherwise>
                        </c:choose>
                        
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td valign="top">商品简单描述：</td>
                    <td colspan="2" style="height:80px"><textarea name="good.gremark" cols="40" rows="4">${param.gremark }</textarea></td>
                </tr>
                <tr>
                    <td valign="top">商品详细描述：</td>
                    <td colspan="2"><textarea name="good.gxremark" cols="40" rows="8">${param.gxremark }</textarea></td>
                </tr>
                <tr>
                    <td  colspan="3" align="center" id="save_text_td1">
                        <input type="submit" id="save_text_submit" value="确定"/>
                        <input type="reset" id="save_text_reset" value="重置"/>
                        <input type="hidden" name="good.gid" value="${param.gid}" />
                        <input type="hidden" name="good.gdate" value="${param.gdate}" />
                        <input type="hidden" name="good.gpic" value="${param.gpic}" />     
                    </td>
                </tr>
            </table>        
        	</form>
        </td>
        <td width="8" background="/shopping/images/main/tab_15.gif"></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="35" background="/shopping/images/main/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="/shopping/images/main/tab_18.gif" width="12" height="35" /></td>
        <td>&nbsp;</td>
        <td width="16"><img src="/shopping/images/main/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>