(function($) {
    $.fn.disableOtherCheckbox = function() {
        return this.each(function() {
            if (this.disabled == true) { return }
            var aInputs = $(":input[type='checkbox'][id*='" + this.id.replace('chkUserRoles_0', 'chkUserRoles_') + "']");
            var i;
            for (i = 0; i < aInputs.length; i++) {
                if (this.id != aInputs[i].id) {
                    if (this.checked == true) {
                        $(aInputs[i]).attr("oldchecked", aInputs[i].checked);
                        aInputs[i].checked = true;
                        aInputs[i].disabled = true;
                    }
                    else {
                        aInputs[i].disabled = false;
                        if ($(aInputs[i]).attr("oldchecked")) {
                            aInputs[i].checked = ($(aInputs[i]).attr("oldchecked") == "true");
                        }                        
                    }
                }
            }
        });
    };

    $.fn.ursDoReadyState = function() {
        var aInputs = $(":input[type='checkbox'][id*='_chkUserRoles_0']");
        var i;
        for (i = 0; i < aInputs.length; i++) {
            $(aInputs[i]).click(function() { $(this).disableOtherCheckbox() });
            $(aInputs[i]).disableOtherCheckbox();
        }
    };

    $(document).ready(function() {
        $.fn.ursDoReadyState();
    });

})(jQuery);