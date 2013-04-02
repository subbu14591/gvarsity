jQuery(document).ready(function () {
    jQuery.initVivoButtons();
});

jQuery.initVivoButtons = function () {
    if (jQuery().button) {

        jQuery(".vivobutton").button();

        jQuery(".vivobutton").each(function () {
            if (jQuery(this).attr("icon")) {
                jQuery(this).button({ icons: { primary: jQuery(this).attr("icon")} });
            }
            if (jQuery(this).attr("icon2")) {
                jQuery(this).button({ icons: { secondary: jQuery(this).attr("icon2")} });
            }
            if (jQuery(this).attr("notext")) {
                jQuery(this).button({ text: false });
            }
        });
        jQuery(".vivobutton_set").buttonset();

    }  
}