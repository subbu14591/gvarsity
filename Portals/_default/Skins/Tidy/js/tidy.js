$(document).ready(function () {

    // HoverIntent is used by the flyout menus. Included below just in case jQueryUI isn't loaded which also has this function
    (function ($) { $.fn.hoverIntent = function (f, g) { var cfg = { sensitivity: 7, interval: 100, timeout: 0 }; cfg = $.extend(cfg, g ? { over: f, out: g } : f); var cX, cY, pX, pY; var track = function (ev) { cX = ev.pageX; cY = ev.pageY }; var compare = function (ev, ob) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t); if ((Math.abs(pX - cX) + Math.abs(pY - cY)) < cfg.sensitivity) { $(ob).unbind("mousemove", track); ob.hoverIntent_s = 1; return cfg.over.apply(ob, [ev]) } else { pX = cX; pY = cY; ob.hoverIntent_t = setTimeout(function () { compare(ev, ob) }, cfg.interval) } }; var delay = function (ev, ob) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t); ob.hoverIntent_s = 0; return cfg.out.apply(ob, [ev]) }; var handleHover = function (e) { var ev = jQuery.extend({}, e); var ob = this; if (ob.hoverIntent_t) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t) } if (e.type == "mouseenter") { pX = ev.pageX; pY = ev.pageY; $(ob).bind("mousemove", track); if (ob.hoverIntent_s != 1) { ob.hoverIntent_t = setTimeout(function () { compare(ev, ob) }, cfg.interval) } } else { $(ob).unbind("mousemove", track); if (ob.hoverIntent_s == 1) { ob.hoverIntent_t = setTimeout(function () { delay(ev, ob) }, cfg.timeout) } } }; return this.bind('mouseenter', handleHover).bind('mouseleave', handleHover) } })(jQuery);
	
	// Mobile Menu Show and Hide
	$('#mobileMenuBtn').toggle(function() {
		$(this).css('font-weight','bold');
		$('#dnnMenu').slideDown('slow');
	}, function() {
		$(this).css('font-weight','normal');
		$('#dnnMenu').slideUp('slow');
	});
	
	// Top Horizontal Menu Functions (flyout functionality)
	function HoverOver() {
	    $(this).find(".subLevel").stop(true, true).slideDown(200);

	    // Check to make sure flyout menu will be fully visible
	    var subLevel = $(this).find(".subLevel");
	    var off = subLevel.offset();
	    if (off != null) {
	        var l = off.left;
	        var w = subLevel.width();
	        var docW = $(window).width();
	        var isEntirelyVisible = (l > 0 && (l + w) < docW);
	        var moveLeft = "-" + ((l + w + 20) - docW) + "px";
            // The flyout isn't fully visible so we move it a little more to the left
	        if (!isEntirelyVisible) {
	            subLevel.css("left", moveLeft);
	        }
	    }
    }
    function HoverOut() {
	   $(this).find(".subLevel").stop(true, true).slideUp(150);
    }

    // Configuration for hoverIntent function
    var config = {
        sensitivity: 2,
        interval: 10,
        over: HoverOver,
        timeout: 500,
        out: HoverOut
    };

    // Mouse hovers or leaves top menu item that has sub-pages
    $("#dnnMenu .topLevel > li.haschild").hoverIntent(config);

    // Mouse hovers or leaves sub-page flyout
    $(".subLevel li.haschild").hover(HoverOver, HoverOut);

    // Add viewport meta tag to <head> for mobile devices if not using <dnn:Meta> in [Skin Name].ascx file
    // $('head').append('<meta name="viewport" content="width=device-width, initial-scale=1" />');
	
});