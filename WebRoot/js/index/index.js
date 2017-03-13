	var curr = 1;
	$("document").ready(function() {
		$(".log").hide();
		$("#1").show();
		$("#b1").removeClass("over");
		$(".show").addClass("border");
		$(".show").mouseover(function() {
			$(this).removeClass("border");
			$(this).addClass("showBorder");
		});
		$(".show").mouseout(function() {
			$(this).removeClass("showBorder");
			$(this).addClass("border");
		});
		setTimeout(init, 5000);
		$("#btn span").click(function() {
			curr = $(this).html();
			$(".log").hide();
			$("#" + $(this).html()).show();
		});
		$(".num").mousemove(function() {
			curr = $(this).html();
			$(".log").hide();
			$("#" + $(this).html()).show();
			$(".num").removeClass("over");
			$(this).addClass("over");
		});
	});
	function init() {
		curr++;
		if (curr > 4) {
			curr = 4;
		}
		$(".log").hide();
		$("#" + curr).show();
		$(".num").removeClass("over");
		$("#b" + curr).addClass("over");
		if (curr == 4) {
			curr = 0;
		}
		setTimeout(init, 5000);
	}