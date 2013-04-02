jQuery(document).ready(function() {
    jQuery.reloadBoardChange();
});

function UIdx_[TEMPLATE]_Save(e) {

    var el = jQuery(e);
    
    var itemId = el.find('.RepinWindow').attr('itemId');
    var boardId = el.find('.Content [{]id*="ddlBoards"[}]').val();
    var description = el.find('.Content [{]id*="txtTitle"[}]').val();
    var newboard = el.find('.Content [{]id*="txtNewBoard"[}]').val(); 
      
    jQuery.ajax({ type: "POST",
        url: "[WEBSERVICEPATH]SaveUserIndex",
        data: "{'userId':" + [USERID] + ", 'boardId': '" + boardId + "', 'indexId': " + itemId + ", 'description': '" + description + "','newBoard':'" + newboard + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, textStatus) {

            if (boardId == -1) {
                
                jQuery(el.find('.RepinWindowMsgBoardTitle')).html(newboard);

                // Update existing boards
                var obj = data;
                if (data.d) { obj = data.d };
                var aIds = obj.split('-');
                if (aIds[1]) {

                    jQuery(".RepinWindow .Content .boardlist").each(function(index) {                        
                        //jQuery('<option value="' + aIds[1] + '">' + newboard + '</option>').insertBefore(jQuery(this).find('.Content [{]id*="ddlBoards"[}] option:selected'));
                        jQuery(this).prepend('<option value="' + aIds[1] + '">' + newboard + '</option>');
                    });

                    el.find('.Content [{]id*="ddlBoards"[}]').val(aIds[1]);

                }

            }
            else {

                jQuery(el.find('.RepinWindowMsgBoardTitle')).html(el.find('.Content [{]id*="ddlBoards"[}] option:selected').text());

            }

            jQuery(el.find('.RepinWindowMsg')).dialog({
		        bgiframe: true,
		        autoOpen: true,
		        width: 440,
		        height: 170,
		        modal: true,
		        resizable: false,
		        buttons: {'Close': function() { jQuery(this).dialog('close'); }}
            });
            
        }
    });
    
    return false;
}

jQuery.reloadBoardChange = function() {
    jQuery(".RepinWindow .Content .boardlist").each(function(index) {
        
        if (jQuery(this).val() == -1) {
            jQuery(this).parent().find(".newboard").show();
        }
        else {
            jQuery(this).parent().find(".newboard").hide();
        }

        jQuery(this).change(function(e){
            if (jQuery(this).val() == -1) {
                jQuery(this).parent().find(".newboard").show();
            }
            else {
                jQuery(this).parent().find(".newboard").hide();
            }
        });

    });
}