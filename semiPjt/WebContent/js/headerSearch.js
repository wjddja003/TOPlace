$(document).ready(function(){
	$('.placeType').click(function() {
		var index = $('.placeType').index(this);
		var type = $('.placeType').eq(index).text();
		location.href = "/headerSearchPlace?type=" + type + "&index=" + index;
	});
	$('.searchInput').keydown(function(key) {
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
						var index = 0;
						for (var i = 0; i < $('.placeType').length; i++) {
							if ($('.placeType').eq(i).text() == type) {
								index = i;
							}
						}
						location.href = "/headerSearchPlace?type=" + type
								+ "&index=" + index;
					}
				}
			});
	$('.searchIcon').click(function() {
		if ($(".searchInput").val() == "") {
			$('#detach_div').slideUp(700);
			$("#searchAlert").slideDown(700);
			$("#searchAlert").delay(1300);
			$('#detach_div').delay(1300);
			$('#detach_div').slideDown(700);
			$("#searchAlert").slideUp(700);
		} else {
			var type = $(".searchInput").val();
			var index = 0;
			for (var i = 0; i < $('.placeType').length; i++) {
				if ($('.placeType').eq(i).text() == type) {
					index = i;
				}
			}
			location.href = "/headerSearchPlace?type=" + type + "&index=" + index;
		}
	});
});
