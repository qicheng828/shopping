$(document).ready(function (){
		
		$("#selectp").change(function (){
			$("#index").html("--请选择--");
			$("#index").attr("value","0");
			$("#default").html("--请选择--");
			$("#default").attr("value",0);
		});
	
		jQuery.validator.addMethod("addressCheck",function(value,element){		//element为当前要验证的对象
				return value=="0" ? false : true;
		},"请选择地址");
		$("#myform").validate({
				event:"blur",
				errorClass:"error_style",
				focusCleanup: true,
				rules:{
					uname:{
						required:true,
						rangelength:[2,6]
					},
					uemail:{
						required:true,
						email:true
					},
					uphone:{
						required:true,
						mobilephone:true
					},
					selectc:{
						addressCheck:true
					},
					selectp:{
						addressCheck:true
					},
					upost:{
						required:true,
						number:true,
						rangelength:[6,6]
					},
					uaddress:{
						required:true
					}
				},
				messages:{
					uname:{
						required:"※必须得填写真实姓名"
					},
					uemail:{
						required:"请填写E-mail地址!!!",
						email:"请输入正确的E-mail地址"
					},
					upost:{
						required:"请填写邮政编码",
						number:"请输入数字",
						rangelength:"输入的字符长度应该是6位"
					},uaddress:{
						required:"请填写您的详细地址"
					}
				}
		});
	});