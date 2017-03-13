<%@ page language="java"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>修改会员信息</title>
<style type="text/css">
* {
	margin:0px;
	font-size:12px;
}
#shuju {
	width:50%;
	border:0px;
	border:1px solid #b5d6e6;
	margin:30px 0px;
}
#shuju td {
	height:35px;
	text-align:center;
	line-height:35px;
	background-color:#E8F6FF;
	border-bottom:1px solid #b5d6e6;
	border-right:1px solid #b5d6e6;
}
.sub{
	margin-left:15px;
	width:60px;
	height:20px;
	background-color: #1862BB;
	font-size:12px;
	color:#FFFFFF;
	border:none;
}
</style>
<script type="text/javascript" src="/shopping/js/area.js"></script>
</head>
<body bgcolor="#E8F6FF">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="/shopping/images/main/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="12" height="30"><img src="/shopping/images/main/tab_03.gif" width="12" height="30" /></td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="5%"><div align="center"><img src="/shopping/images/main/tb.gif" width="16" height="16" /></div></td>
                      <td width="95%"><strong>你当前的位置</strong>：修改会员信息</td>
                    </tr>
                  </table></td>
                <td width="54%"></td>
              </tr>
            </table></td>
          <td width="16"><img src="/shopping/images/main/tab_07.gif" width="16" height="30" /></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="8" background="/shopping/images/main/tab_12.gif">&nbsp;</td>
          <td align="center">
         <form action="/shopping/users.do" method="post"  name=form1>
          <table align="center" cellpadding="0" cellspacing="0" id="shuju">
              <tr>
                <td colspan="2"><b>基本资料</b></td>
              </tr>
              <tr>
                <td>登录账号：</td>
                <td><input type="text" name="ulogin" value="${param.ulogin }" /></td>
              </tr>
              <tr>
                <td>真实姓名：</td>
                <td><input type="text" name="uname" value="${param.uname }" /></td>
              </tr>
              <tr>
                <td>电子邮箱：</td>
                <td><input type="text" name="uemail" value="${param.uemail }" /></td>
              </tr>
              <tr>
                <td>邮政编码：</td>
                <td><input type="text" name="upost" value="${param.upost }" /></td>
              </tr>
              <tr>
                <td>联系电话：</td>
                <td><input type="text" name="uphone" value="${param.uphone }" /></td>
              </tr>
              <tr>
                <td>省份：</td>
                <td>
                 <c:forTokens items="${param.uaddress}" delims="-" var="select" varStatus="num">
	            	<c:if test="${num.count==1}"><c:set value="${select}" var="selectp" /></c:if>
	            	<c:if test="${num.count==2}"><c:set value="${select}" var="selectc" /></c:if>
	            	<c:if test="${num.count==3}"><c:set value="${select}" var="selecta" /></c:if>
	            </c:forTokens>
                <select name="selectp" id="selectp" style="width:130px;height:20px;"
								onchange="selectcityarea('selectp','selectc','form1');">
								<option selected value=${selectp }>
									${selectp}
								</option>
				</select>
				<script language=javascript>first("selectp","selectc","form1",'${selectp }','${selectc }');</script>
				</td>
              </tr>
              <tr>
                <td>城市：</td>
                <td><select name="selectc" id="selectc" style="width:130px;height:20px;">
								<option selected value=${selectc }>
									${selectc }
								</option>
							</select></td>
              </tr>
              <tr>
                <td>联系地址：</td>
                <td><input type="text" name="uaddress" value="${selecta }" /></td>
              </tr>
              <tr>
                <td colspan="2">
                	<input class="sub" type="submit" value="确认修改" />
                    <input class="sub" type="reset" value="重新填写" />
                </td>
              </tr>
            </table>
            </form>
            </td>
          <td width="8" background="/shopping/images/main/tab_15.gif"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="35" background="/shopping/images/main/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="12" height="35"><img src="/shopping/images/main/tab_18.gif" width="12" height="35" /></td>
          <td width="100%"></td>
          <td width="16"><img src="/shopping/images/main/tab_20.gif" width="16" height="35" /></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
