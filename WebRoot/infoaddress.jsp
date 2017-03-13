<%@ page language="java"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<!-- InstanceBegin template="/Templates/modo.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>

		<title>My JSP 'infoaddress.jsp' starting page</title>
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript" src="/shopping/js/jquery.js"></script>
		<script type="text/javascript" src="/shopping/js/area.js"></script>
		<script type="text/javascript">
	$(document).ready(function (){
		$("#selectp").change(function (){
			$("#a").attr("value","0");
			$("#a").html("请选择");
			$("#aa").attr("value","0");
			$("#aa").html("请选择");
		});
	});
</script>
	</head>

	<body>
		<style type="text/css">
        	#tab span,label{
				padding-left:15px;
				
			}
			  body{
 				 font-size:12px;
  			}
        </style>
		<form action="/shopping/users/lastConfirm.jsp" method="post" name="myForm">
			<table width="527" border="0" id="tab" cellpadding="0"
				cellspacing="5">
				<tr>
					<th colspan="4" style="font-size:16px; color:#00CCCC;">
						请核对您的送货地址，如有误请重新选择
					</th>
				</tr>
				<tr>
					<td>
						<label>
							所 属&nbsp; 省 份：
						</label>
					</td>
					<td>
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="122">
									<select name="selectp"
										onchange="selectcityarea('selectp','selectc','myForm');"
										id="selectp">
										<option selected value='湖南' id="aa">
											湖南--
										</option>
									</select>
								</td>
								<td width="192">
									<script language=javascript>first("selectp","selectc","myForm",0,0);</script>
									<label>
										所在城市：
									</label>
									<select name=selectc style="width:100px;" id="selectc">
										<option selected value="郴州" id="a">
											郴州
										</option>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<label>
							街 道&nbsp; 地 址：
						</label>
					</td>
					<td>
						<textarea rows="3" cols="33"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label>
							邮 政&nbsp; 编 码：
						</label>
					</td>
					<td>
						<input type="text" name="upost" id="upost" />
					</td>
				</tr>
				<tr>
					<td>
						<label>
							常 用 E-mail：
						</label>
					</td>
					<td>
						<input type="text" name="uemail" id="uemail" />
					</td>
				</tr>
				<tr>
					<td>
						<label>
							收 货 人姓名：
						</label>
					</td>
					<td>
						<input type="text" name="upost" id="upost" />
					</td>
				</tr>
				<tr>
					<td>
						<label>
							联 系&nbsp; 电 话：
						</label>
					</td>
					<td>
						<input type="text" name="upost" id="upost" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="确定" style="margin-right:30px;" />
						<input class="off" type="button" value="关闭" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
