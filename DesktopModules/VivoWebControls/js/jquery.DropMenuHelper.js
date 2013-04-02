(function($) {
    $.extend($.fn, {
        dropMenuHelper: function(o, callback) {
            if (o.menu == undefined) return false;
            if (o.inSpeed == undefined) o.inSpeed = 150;
            if (o.outSpeed == undefined) o.outSpeed = 75;
            if (o.inSpeed == 0) o.inSpeed = -1;
            if (o.outSpeed == 0) o.outSpeed = -1;
            o.menuConfigured = false;
            o.menuTop = 0;
            o.menuLeft = 0;
            $(this).each(function() {
                var el = $(this);
                var menu = $('#' + o.menu);
                $(menu).click(function() {
                    $(menu).fadeOut(o.outSpeed);
                })
                $(document.body).mousedown(function(e) {
                    var target = $(e.target);
                    if ((target.parents('#' + o.menu).length == 0) && !($.blockUI)) {
                        if (target.text() != $(menu).text()) $(menu).hide()
                    }
                });
                $(menu).css({
                    position: 'absolute',
                    display: 'none'
                });
                $(this).click(function() {
                
                    if ($(el).hasClass('disabled')) return false;
                    if (!o.menuConfigured) {
                        var offset = $(el).offset();
                        offset.top += $(el).height();
                        var isFixed = false;
                        $(o).parents().each(function() {
                            isFixed |= $(this).css('position') == 'fixed';
                        });
                        if (isFixed && $.browser.opera) {
                            offset.left -= document.documentElement.scrollLeft;
                            offset.top -= document.documentElement.scrollTop;
                        }
                        o.menuTop = offset.top;
                        o.menuLeft = offset.left;
                        o.menuConfigured = true;
                    }
                    
                    $(document).unbind('click');
                    
                    $(menu).css({ top: o.menuTop, left: o.menuLeft }).fadeIn(o.inSpeed);
                    
                    return false;
                });
            });
            return $(this);
        },
        destroyDropMenu: function() {
            $(this).each(function() {
                $(this).unbind('click')
            });
            return ($(this));
        }
    });
})(jQuery);