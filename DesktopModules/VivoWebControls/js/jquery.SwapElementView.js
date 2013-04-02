(function($) {
    $.fn.HideElements = function(arrIDs) {
        for (key in arrIDs) { $("#" + arrIDs[key]).hide(); }
    };
    $.fn.ShowElements = function(arrIDs) {
        for (key in arrIDs) { $("#" + arrIDs[key]).show(); }
    };
    $.fn.SwapElementView = function() {
        if ($(this).attr("ViewValue") == $(this).val() || eval($(this).attr("ViewExpression"))) { // Show
            if ($(this).attr("ViewElement")) $.fn.ShowElements($(this).attr("ViewElement").split(";"));
            if ($(this).attr("HideElement")) $.fn.HideElements($(this).attr("HideElement").split(";"));
        }
        else if ($(this).attr("ViewValue") == "direct") { // Show Direct
            if ($(this).attr("HideElement")) $.fn.HideElements($(this).attr("HideElement").split(";"));
            $.fn.ShowElements($(this).val().split(";"));
        }
        else { // Hide  
            if ($(this).attr("HideElement")) $.fn.ShowElements($(this).attr("HideElement").split(";"));
            if ($(this).attr("ViewElement")) $.fn.HideElements($(this).attr("ViewElement").split(";"));
        }
    };
    $(document).ready(function() {
        $("[SwapElementView]").each(function() {
            if ($(this).attr("SwapElementView") != "") {
                $(this).bind($(this).attr("SwapElementView"), function() {
                    $(this).SwapElementView();
                });
                $(this).SwapElementView();
            }
        });
    });
})(jQuery);