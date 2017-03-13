	$("document").ready(function (){
		$("input[type='password']").val("");
		$("#textForm").submit(function (){
			var upass =$("#upass").val();
			var newpass = $("#newpass").val();
			var newpass2= $("#newpass2").val();
			if(upass.length<6 || upass>12){
				$("#upassError").html("<font color='#FF0000'> 您输入的密码长度应该在6~12位之间</font>");
				return false;
			}
			if(newpass.length<6 || newpass.length>12){
				  $("#newpassError").html("<font color='#00FF00'> 您输入的密码长度应该在6~12位之间</font>");
				  return false;
			}
			if(newpass2!=newpass){
				$("#newpass2Error").html("<font color='#00FF00'>两次密码输入不一致，您重新输入</font>");
				return false;
			}
			return true;
		});
	});