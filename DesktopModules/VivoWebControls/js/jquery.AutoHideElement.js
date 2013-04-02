(function($){  
    $(document).ready(function() {
	    $("[autohide]").each(function() {
	        if (!isNaN($(this).attr("autohide"))) {
                eval("setTimeout(function() {jQuery('#" + this.id + "').hide();}, " + parseInt($(this).attr('autohide')) * 1000 + ");");               
	        }
        });
    }); 
})(jQuery);