$(document).ready(function(){
	var inputType = 0;
	$('.placeType').click(function() {
		var index = $('.placeType').index(this);
		var type = $('.placeType').eq(index).text();
		if(index>-1 && index<12){
			inputType = 1;			
		}else if(index>=12 && index<20){
			inputType = 2;
		}
		
		location.href = "/headerSearchPlace?type=" + type + "&index=" + index + "&inputType=" + inputType;
	});
	$('.searchInput').keydown(function(key) {
		inputType = 3;
				if (key.keyCode == 13) {
					if ($(this).val() == "") {
						$('#detach_div').slideUp(700);
						$("#searchAlert").slideDown(700);
						$("#searchAlert").delay(1300);
						$('#detach_div').delay(1300);
						$('#detach_div').slideDown(700);
						$("#searchAlert").slideUp(700);
						
					} else {
						var type = $(this).val();
						var index = -1;
						for (var i = 0; i < $('.placeType').length; i++) {
							if ($('.placeType').eq(i).text() == type) {
								index = i;
							}
						}
						if(index>-1 && index<12){
							inputType = 1;			
						}else if(index>=12 && index<20){
							inputType = 2;
						}
						console.log(index);
						console.log(type);
						console.log(inputType);
						location.href = "/headerSearchPlace?type=" + type
								+ "&index=" + index + "&inputType=" + inputType;
					}
				}
			});
	$('.searchIcon').click(function() {
		inputType = 3;
		console.log($(this).prev().val());
		if ($(this).prev().val() == "") {
			$('#detach_div').slideUp(700);
			$("#searchAlert").slideDown(700);
			$("#searchAlert").delay(1300);
			$('#detach_div').delay(1300);
			$('#detach_div').slideDown(700);
			$("#searchAlert").slideUp(700);
		} else {
			var type = $(this).prev().val();
			var index = -1;
			for (var i = 0; i < $('.placeType').length; i++) {
				if ($('.placeType').eq(i).text() == type) {
					index = i;
				}
			}
			if(index>-1 && index<12){
				inputType = 1;			
			}else if(index>=12 && index<20){
				inputType = 2;
			}
			location.href = "/headerSearchPlace?type=" + type + "&index=" + index + "&inputType=" + inputType;
		}
	});
});

