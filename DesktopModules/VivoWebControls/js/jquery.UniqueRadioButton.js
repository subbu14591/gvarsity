(function($){  
    $.fn.UniqueRadioButton = function() {  
        return this.each(function() {
            var aInputs = $(":input[type='radio'][groupname='" + $(this).attr("groupname") + "']")
            var i;
            for (i=0; i<aInputs.length; i++){  
                if (this.id != aInputs[i].id){
                    aInputs[i].checked = false;                    
                }
            }
   
        });  
    };

$(document).ready(function() {
var aInputs = $(":input[type='radio'][groupname]");
	var i;
    for (i=0; i<aInputs.length; i++){
        $(aInputs[i]).click(function(){ $(this).UniqueRadioButton()});
    }
});
    
})(jQuery);