﻿(function ($) {

    $.fn.textboxWatermark = function (settings) {
        var defaults = {
            className: 'watermarkText',
            text: this.val()
        };
        settings = $.extend({}, defaults, settings);
        if ($(this).val().length == 0 || $(this).val() === settings.text) {
            $(this).addClass(settings.className);
            $(this).val(settings.text);
            $(this).attr('watermarkText', settings.text);
        }
        this.focus(function () {
            $(this).removeWatermark({
                className: settings.className,
                text: settings.text
            });
        });
        this.blur(function () {
            if ($(this).attr('watermarkText') === $(this).val() || $(this).val() == "") {
                $(this).addWatermark({
                    className: settings.className,
                    text: $(this).attr('watermarkText')
                });
            }
        });
        var id = this.attr("id");
        this.parents("form:first").submit(function () {
            $("#" + id).removeWatermark({
                className: settings.className,
                text: settings.text
            });
        });
    };

    $.fn.addWatermark = function (settings) {
        var defaults = {
            className: 'watermarkText',
            text: this.val()
        };
        settings = $.extend({}, defaults, settings);
        this.addClass(settings.className);
        this.val(settings.text);
        this.attr('watermarkText', settings.text);
        this.attr("WatermarkSet", '1');
    };

    $.fn.removeWatermark = function (settings) {
        var defaults = {
            className: 'watermarkText',
            text: settings.text
        };
        settings = $.extend({}, defaults, settings);
        if (this.hasClass(settings.className)) {
            this.removeClass(settings.className);
            this.val("");
        }
    }

})(jQuery);