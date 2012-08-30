// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {

	$('tr').on("hover", function(){
		$('a.red-links', this).toggleClass('invisible');
	});
});
