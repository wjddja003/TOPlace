$(document).ready(function(){
	$('.placeType').click(function() {
		var index = $('.placeType').index(this);
		var type = $('.placeType').eq(index).text();
		location.href = "/headerSearchPlace?type=" + type + "&index=" + index;
	});
	$('.searchInput').keydown(function(key) {
				if (key.keyCode == 13) {
					if ($(this).val() == "") {
						$("#searchAlert").slideDown(700);
						$("#searchAlert").delay(1300);
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
			$("#searchAlert").slideDown(700);
			$("#searchAlert").delay(1300);
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
