(function($) {
    $(document).ready(function(){
        $('div[tooltip*="RatingControl"]').each(function(){
            var _tooltip = $('#' + $(this).attr('tooltip'));
            var _content = '';
                        
            if (_tooltip != null){
                content = _tooltip.html();
            }
            
            $(this).qtip({
                content: content, 
                position: {corner: {target: 'topRight',tooltip:'bottomLeft'}},
                style:{border:{width: 5,radius: 10}, textAlign: 'center', name:'blue',padding: '7px 7px',width: {max: 250,min: 100},tip: true}
            });

        });
    });
})(jQuery);