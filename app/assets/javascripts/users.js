// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {

	
	$("td.links").hide();
	$("tr").live("hover",
	  function () {
	    // $(this).("td.links").show();
	    // $(this).children.show();
	    // $(this).next.show();
	    $(this).find("td.links").show();
	    // console.log($(this).find("td.links"));
	     // $(this).append($("<span> ***</span>"));
	  }
	  // function() {
	  // 	// $(this).find("td.links").hide();
	  // }
	);

	$("tr").live("hover",
		function(){
		// $(this).fadeOut(100);
		$(this).find("td.links").fadeIn(500);
		$(this).find("td.links").fadeOut(200);

		$(this).fadeIn(150);
		// $("td.links").fadeOut(100);
	});
});
