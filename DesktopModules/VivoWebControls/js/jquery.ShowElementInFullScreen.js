(function($) {
    $.fn.ShowElementInFullScreen = function() {
        return this.each(function() {
        $(this).parents().each(function(i) { $(this).removeAttr('style'); $(this).removeAttr('class'); $(this).siblings().hide() });
        });
    };

})(jQuery);