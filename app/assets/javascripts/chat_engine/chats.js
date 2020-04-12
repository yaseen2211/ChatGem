// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
	if (window.history && window.history.pushState) {
	    $(window).on('popstate', function() {
	      location.reload(true)
	    });
	}
});
