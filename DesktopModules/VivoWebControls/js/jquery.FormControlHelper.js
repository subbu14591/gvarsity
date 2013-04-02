(function($) {
    function updateAttribute(obj, attr, value) {
        if (attr == "-1") {
            $(obj).each(function() {

                $(this).removeAttr(value).removeClass("ReadOnly"); });

                // Check if we need to run disableOtherCheckbox from UserRolesSelector
                $(obj).each(function() {
                    if (this.id.indexOf("_chkUserRoles_0") != -1) {
                        $(this).disableOtherCheckbox();
                    }
                });
        }
        else {
            $(obj).each(function() { $(this).attr(attr, value).addClass("ReadOnly"); });
        } 
    }

    $.fn.ProcessReadOnly = function() {
        return this.each(function() {
            var reverse = $(this).attr("reverse");
            var direct = $(this).attr("direct");
            var arrIDs = $(this).attr("pid").split(";");
            var checkValue = $(this).attr("checkvalue");

            var isChecked = this.checked;

            if (checkValue != null) {
                isChecked = (checkValue != $(this).val());
            }

            if (reverse == "1") {
                isChecked = (!isChecked)
            }

            if (isChecked) {
                for (key in arrIDs) {
                    if (direct == "1") {
                        updateAttribute($("#" + arrIDs[key]), "-1", "readonly");
                    }
                    else {
                        updateAttribute($("#" + arrIDs[key] + " :input"), "-1", "readonly");
                    }
                }
            }
            else {
                for (key in arrIDs) {
                    if (direct == "1") {
                        updateAttribute($("#" + arrIDs[key]), "readonly", true);
                    }
                    else {
                        updateAttribute($("#" + arrIDs[key] + " :input"), "readonly", true);
                    }
                }
            }

            updateAttribute($(this), "-1", "readonly");
            if ($(this).attr("clickebind") == null) {
                $(this).click(function() { $(this).ProcessReadOnly() });
                $(this).attr("clickebind", "jQuery(this).ProcessReadOnly()")
            }
        });
    };

    $.fn.ProcessDisabled = function() {
        return this.each(function() {
            var reverse = $(this).attr("reverse");
            var direct = $(this).attr("direct");
            var arrIDs = $(this).attr("pid").split(";");
            var checkValue = $(this).attr("checkvalue");

            var isChecked = this.checked;

            if (checkValue != null) {
                isChecked = (checkValue != $(this).val());
            }

            if (reverse == "1") {
                isChecked = (!isChecked)
            }

            if (isChecked) {
                for (key in arrIDs) {
                    if (direct == "1") {
                        updateAttribute($("#" + arrIDs[key]), "-1", "disabled");
                    }
                    else {
                        updateAttribute($("#" + arrIDs[key] + " :input"), "-1", "disabled");
                    }
                }
            }
            else {
                for (key in arrIDs) {
                    if (direct == "1") {
                        updateAttribute($("#" + arrIDs[key]), "disabled", true);
                    }
                    else {
                        updateAttribute($("#" + arrIDs[key] + " :input"), "disabled", true);
                    }
                }
            }

            updateAttribute($(this), "-1", "disabled");
            if ($(this).attr("clickebind") == null) {
                $(this).click(function() { $(this).ProcessDisabled() });
                $(this).attr("clickebind", "jQuery(this).ProcessDisabled()")
            }
        });
    };

})(jQuery);