$(function()
{

	if (!window['console'])
	{
		window.console = {};
		window.console.log = function(){};
	}
		
	/*
	define a new language named "custom"
	*/

	jc.dateRangePickerLanguages['custom'] = 
	{
		'selected': 'Choosed:',
		'days': '일',
		'apply': 'Close',
		'week-1' : '월',
		'week-2' : '화',
		'week-3' : '수',
		'week-4' : '목',
		'week-5' : '금',
		'week-6' : '토',
		'week-7' : '일',
		'month-name': ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		'shortcuts' : 'Shortcuts',
		'past': 'Past',
		'7days' : '7일',
		'14days' : '14일',
		'30days' : '30일',
		'previous' : 'Previous',
		'prev-week' : 'Week',
		'prev-month' : 'Month',
		'prev-quarter' : 'Quarter',
		'prev-year' : 'Year',
		'less-than' : 'Date range should longer than %d days',
		'more-than' : 'Date range should less than %d days',
		'default-more' : 'Please select a date range longer than %d days',
		'default-less' : 'Please select a date range less than %d days',
		'default-range' : 'Please select a date range between %d and %d days',
		'default-default': 'This is costom language'
	};
	
	jc('#date-range13').dateRangePicker(
	{
		autoClose: true,
		singleDate : true,
		showShortcuts: false
	});
	
	jc('#date-range23').dateRangePicker(
	{
		singleMonth: true,
		showShortcuts: false,
		showTopbar: false
	});
});
