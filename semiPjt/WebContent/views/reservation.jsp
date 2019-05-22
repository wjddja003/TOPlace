<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Date Picker Demo</title>
<link rel="stylesheet" href="/Calendar/daterangepicker.css" />
<script src="../Calendar/jquery-1.11.2.min.js"></script>
<script src="../Calendar/moment.min.js"></script>
<script src="../Calendar/jquery.daterangepicker.js"></script>
<script src="../Calendar/demo.js"></script>
<style>
#wrapper {
	width: 800px;
	margin: 0 auto;
	color: #333;
	font-family: Tahoma;
	line-height: 1.5;
	font-size: 14px;
}

.demo {
	margin: 30px 0;
}

.date-picker-wrapper .month-wrapper table .day.lalala {
	background-color: orange;
}

.options {
	display: none;
	border-left: 6px solid #8ae;
	padding: 10px;
	font-size: 12px;
	line-height: 1.4;
	background-color: #eee;
	border-radius: 4px;
}

.date-picker-wrapper.date-range-picker19 .day.first-date-selected {
	background-color: red !important;
}

.date-picker-wrapper.date-range-picker19 .day.last-date-selected {
	background-color: orange !important;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div class="demo">
			Single Month Mode: <input id="date-range23" size="30" value="">
		</div>
	</div>
		<script>
	$(function()
	{
		$('a.show-option').click(function(evt)
		{
			evt.preventDefault();
			$(this).siblings('.options').slideToggle();
		});
	})
	</script>
</body>
</html>
