function remove(){
		if(confirm("您确定要将购物车中的商品清空吗？")){
			$.get(formartURL("/shopping/forderAction_ToFtotal.action"),null,function (){
				$("#nocar").show();
				$("#showCar").hide();
				$("#goodnum").html("0");
			});
		}
	}
	$("document").ready(function(){
		if($("#goodnum").attr("class")>0)
		{
			$("#nocar").hide();
		}
		else{
			$("#showCar").hide();
		}
		$(".del span").click(function(){
			if(confirm("你确定要删除这个商品吗？")){
				var gid=$(this).parent().parent().attr("id");
				$.get(formartURL("/shopping/forderAction_deleteSorder.action?sorder.good.gid=" + gid),null,function (data){
						$("#" + gid).remove();
						var temp=data.split("-");
						result=temp[0];
						$("#goodnum").html(temp[1]);
						if(temp[1]<1){
							$("#showCar").hide();
							$("#nocar").show();
						}
						if(result.indexOf(".")>0){
						result = result.substring(0,(result.indexOf(".")+3));
					}
					$("#ftotal").html("商品总价:￥" + result);
				});
			}
		}).mouseover(function(){
			$(this).css("cursor","hand");
			$(this).addClass("fontOnHover");
		}).mouseout(function(){
			$(this).removeClass("fontOnHover");
		});
		$(".cut").click(function(){
			var curren=parseInt($(this).parent().children(".gnumber").attr("id"));
			var gnumber = parseInt($(this).attr("id"));
			if(curren-1<=0 && gnumber<0){
				alert("商品数量不能少于1");
				$(this).parent().children(".gnumber").val(curren);
			}else{
				$(this).parent().children(".gnumber").val(curren+gnumber);
				$(this).parent().children(".gnumber").attr("id",curren+gnumber)
				var gid=$(this).parent().parent().attr("id");
				var gprice=$(this).parent().prev().html();
				var xiaoj = (gprice*(curren+gnumber)).toString();
				var rs="";
				if(xiaoj.indexOf(".")>0) 
				{
					rs = xiaoj.substring(0, (xiaoj.indexOf(".")+3));
				}else{
					rs = xiaoj + ".0";
				}
				$(this).parent().next().html(rs);
				$.get(formartURL("/shopping/forderAction_updateSorder.action?sorder.good.gid=" + gid +"&sorder.gnumber=" + (curren+gnumber) ),null,function (data){
					var temp=data.split("-");
					result=temp[0];
					$("#goodnum").html(temp[1]);
					if(result.indexOf(".")>0){
						result = result.substring(0,(result.indexOf(".")+3));
					}
					$("#ftotal").html("商品总价:￥" + result);
				});
			}
		}).mouseover(function(){
			$(this).css("cursor","hand");
			$(this).addClass("fontOnHover");
		}).mouseout(function(){
			$(this).removeClass("fontOnHover");
		});
		$("#showCar input").change(function change(){
			var gnumber = $(this).val();
			var id=$(this).attr("id");
			var exp = new RegExp(/^\d+$/);
			var gid=$(this).parent().parent().attr("id");
			if(!exp.exec(gnumber) || $(this).attr("value")<=0){
				alert("请输入购物的数量，只能是整数并且大于0");
				$(this).attr("value",id);
			}else{
				var number=$(this).attr("value");
				$(this).attr("id",number);
				var gprice=$(this).parent().prev().html();
				var xiaoj = (gprice*number).toString();
				var end=xiaoj.length;
				var rs ="";
				if(xiaoj.indexOf(".")>0){
					end=(xiaoj.indexOf(".")+3);
				    rs = xiaoj.substring(0, end);
				}else{
					rs = xiaoj + ".0";
				}
				$(this).parent().next().html(rs);
				$.get(formartURL("/shopping/forderAction_updateSorder.action?sorder.good.gid="+ gid +"&sorder.gnumber=" + number),null,function (data){
					var temp=data.split("-");
					$("#goodnum").html(temp[1]);
					result=temp[0];
					if(result.indexOf(".")>0){
						result = result.substring(0,(result.indexOf(".")+3));
					}
					$("#ftotal").html("商品总价:￥" + result);
				});
			}
		});
	});