function ratingControl() {
	this._nextId = 0; // Next ID for a time picker instance
	this._inst = []; // List of instances indexed by ID
	this._curInst = null; // The current instance in use
}

jQuery.extend(ratingControl.prototype, {
	/* Class name added to elements to indicate already configured with a rating control. */
	markerClassName: 'hasRatingControl',

	/* Register a new time picker instance - with custom settings. */
	_register: function(inst) {
		var id = this._nextId++;
		this._inst[id] = inst;
		return id;
	},

	/* Retrieve a particular time picker instance based on its ID. */
	_getInst: function(id) {
		return this._inst[id] || id;
	},
	
    /* Does this element have a particular class? */
	_hasClass: function(element, className) {
		var classes = element.attr('class');
		return (classes && classes.indexOf(className) > -1);
	},
	
    /* Attach the control to element. */
	_connectRating: function(target, inst) {
		var ratingControlDiv = jQuery(target);
		if (this._hasClass(ratingControlDiv, this.markerClassName)) { return; }
		
		inst._ratingControlDiv = jQuery(ratingControlDiv);
		
		inst._settings.increment = (inst._settings.increment < .75) ? .5 : 1;
    
        var s = 0;
	    for(var i= 0; i <= inst._settings.maxvalue ; i++) {
            if (i == 0) {
                if(inst._settings.showcancel == 1) {
                    var div = '<div class="cancel"><a href="#0" title="Cancel Rating">Cancel Rating</a></div>';
                    inst._ratingControlDiv.empty().append(div);
                }
            }
            else {
                var div = jQuery('<div class="star"></div>').append('<a href="#'+i+'" title="Give it '+i+'/'+inst._settings.maxvalue+'">'+i+'</a>').appendTo(inst._ratingControlDiv);
                if (inst._settings.increment == .5) {
                    if (s%2) {div.addClass('star-left');}
                    else {div.addClass('star-right');}
                }
            }    
            i=i-1+inst._settings.increment;
            s++;
        }	
        
        // star buttons
        var stars = ratingControlDiv.children('.star');
        stars.mouseover(function(){event.drain();event.fill(this);})
        stars.mouseout(function(){event.drain();event.reset();})
        stars.focus(function(){event.drain();event.fill(this);})
        stars.blur(function(){event.drain();event.reset();});

        stars.click(function() {
            if(inst._settings.cancel == true) {
                inst._settings.curvalue = (stars.index(this) * inst._settings.increment) + inst._settings.increment;
                //jQuery.post(container.url, {"rating": jQuery(this).children('a')[0].href.split('#')[1] });
                return false;
            }
            else if (inst._settings.maxvalue == 1) {
                inst._settings.curvalue = (inst._settings.curvalue == 0) ? 1 : 0;
                jQuery(this).toggleClass('on');
                //jQuery.post(container.url, {"rating": jQuery(this).children('a')[0].href.split('#')[1]});
                return false;
            }
            return true;
        });
        
        // cancel button
        var cancel = ratingControlDiv.children('.cancel');
        if(cancel) {
            cancel.mouseover(function(){event.drain();jQuery(this).addClass('on');}).mouseout(function(){event.reset();jQuery(this).removeClass('on');}).focus(function(){event.drain();jQuery(this).addClass('on');}).blur(function(){event.reset();jQuery(this).removeClass('on');});
              
            // click events.
            cancel.click(function() {
                event.drain();
                inst._settings.curvalue = 0;
                //jQuery.post(container.url, {"rating": jQuery(this).children('a')[0].href.split('#')[1] });
                return false;
            });
        }
        
        var event = {
            fill: function(el) { // fill to the current mouse position.
                var index = stars.index(el) + 1;
                stars.children('a').css('width', '100%').end().slice(0,index).addClass('hover').end();
            },
            drain: function() { // drain all the stars.
                stars.filter('.on').removeClass('on').end().filter('.hover').removeClass('hover').end();
            },
            reset: function() { // Reset the stars to the default index.
	            stars.slice(0,inst._settings.curvalue / inst._settings.increment).addClass('on').end();
            }
        };
        	
        event.reset();
    }
	
});

/* Individualised settings for the control. */
function ratingControlInstance(options) {
	this._id = jQuery.ratingControl._register(this);
	this._ratingControlDiv = jQuery(this);
	this._settings = {
	    increment : 1, // value to increment by
	    maxvalue : 5,   // max number of stars
	    curvalue : 0,    // number of selected stars
	    showcancel : 1,
	    readonly: 0
    };
    if (options) { jQuery.extend(this._settings, options); };
}

jQuery.extend(ratingControlInstance.prototype, {
	/* Get a setting value, defaulting if necessary. */
    _getValue: function () {
        alert(this._settings.curvalue);
        return this._settings.curvalue;
    },
	
	_setValue: function (val) {        
	    
    }
});

/* Attach the control to a jQuery selection. */
jQuery.fn.attachRatingControl = function(options) {
	return this.each(function() {
	    var inst = new ratingControlInstance(options);
	    jQuery.ratingControl._connectRating(this, inst);
    });
};

/* Initialise the rating control. */
jQuery.ratingControl = new ratingControl(); // singleton instance