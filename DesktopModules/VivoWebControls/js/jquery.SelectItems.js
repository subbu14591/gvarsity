(function($) {
    $.fn.SelectAll = function() {
        return this.each(function() {
            var aInputs = $(":input[type='checkbox'][id*='" + $(this).parent().attr('container') + "'][id*='chkSelectOne']");
            var i;
            var chkAll = $(this);
            for (i = 0; i < aInputs.length; i++) {
                if (this.id != aInputs[i].id) {
                    aInputs[i].checked = this.checked;
                    $(aInputs[i]).attr("cAid", this.id);
                    $(aInputs[i]).attr("cPid", $(this).parent().attr('container'));
                    $(aInputs[i]).click(function() {

                        if (this.checked == false) {
                            $("#" + $(this).attr("cAid")).attr("checked", false);
                        }
                        else {
                            var aS = $(":input[type='checkbox'][id*='" + $(this).attr("cPid") + "'][id*='chkSelectOne']:checked");
                            var aA = $(":input[type='checkbox'][id*='" + $(this).attr("cPid") + "'][id*='chkSelectOne']");
                            $("#" + $(this).attr("cAid")).attr("checked", aS.length === aA.length);
                        }

                    });
                }
            }

        });
    };

    $(document).ready(function() {
        $(":input[type='checkbox'][id*='chkSelectAll']").each(function(i, e) {

            $(e).click(function() { $(this).SelectAll() });

            if ($(e).attr("NotOnLoad") == null) {
                $(this).SelectAll();
            }
            
            if ($(":input[type='checkbox'][id*='" + $(e).parent().attr('container') + "'][id*='chkSelectOne']").length == 0) {
                $(e).css('visibility', 'hidden');
            }
        });
    });

})(jQuery);