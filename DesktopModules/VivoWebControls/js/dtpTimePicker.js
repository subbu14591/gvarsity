(function($) { // hide the namespace

function timePicker() {
	this._nextId = 0; // Next ID for a time picker instance
	this._inst = []; // List of instances indexed by ID
	this._curInst = null; // The current instance in use
	this._disabledInputs = []; // List of time picker inputs that have been disabled
	this._timepickerShowing = false; // True if the popup picker is showing , false if not
	this._timepickerOver = false; // True if mouse is over time picker , false if not
	this._amDesignator = 'AM';
	this._pmDesignator = 'PM';
	this._separator = ':';
	this._timeFormat = 'hh:mm tt';
	this._show24Hours = false;
	this._defaults = { // Global defaults for all the time picker instances
		startTime: new Date(0, 0, 0, 0, 0, 0), // Used when field is blank: actual date,
		endTime: new Date(0, 0, 0, 23, 30, 0), // Used when field is blank: actual date,
		stepMinutes: 30 // Number of minutes to step back/forward
	};
	this._timePickerDiv = $('<div id="dtpTimePickerDiv"></div>');
}
$.extend(timePicker.prototype, {
	/* Class name added to elements to indicate already configured with a time picker. */
	markerClassName: 'hasTimePicker',

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

	/* Override the default settings for all instances of the time picker. 
	   @param  settings  object - the new settings to use as defaults (anonymous object)
	   @return the manager object */
	setDefaults: function(settings) {
		extendRemove(this._defaults, settings || {});
		return this;
	},

	/* Handle keystrokes. */
	_doKeyDown: function(e) {
        var inst = $.timePicker._getInst(this._tpId);
		if ($.timePicker._timepickerShowing) {
			switch (e.keyCode) {
				case 9: 
				    // hide on tab out
				    $.timePicker.hideTimePicker();
                    break; 
	
				case 13: 
				     // select the value on enter
				    var sel = $("ul>li.selected", inst._timePickerDiv)[0];
                    inst._setTimeValue(sel);
                    return false;
					break;
	
				case 27: 
				    // hide on escape
				    $.timePicker.hideTimePicker();
					break; 
	
				case 38: 
				    // Move up
				    var $selected = $("ul>li.selected", inst._timePickerDiv);
                    var prev = $selected.prev().addClass("selected")[0];
                    if (prev)
                    {
                        $selected.removeClass("selected");
                        inst._timePickerDiv[0].scrollTop = prev.offsetTop;
                    }
                    return false;
                    break;
	
				case 40: if (e.ctrlKey) $.datepicker._adjustDate(inst, +7, 'D');
				    // Move down
					var $selected = $("ul>li.selected", inst._timePickerDiv);
                    var next = $selected.length ? $selected.next().addClass("selected")[0] : $("li:first").addClass("selected")[0];
                    if (next)
                    {
                        $selected.removeClass("selected");
                        inst._timePickerDiv[0].scrollTop = next.offsetTop;
                    }
                    return false;
                    break;
			}
		}
		else if (e.keyCode == 40) { // display the time picker on down arrow key
			$.timePicker.showFor(this);
		}
	},
	
    /* Does this element have a particular class? */
	_hasClass: function(element, className) {
		var classes = element.attr('class');
		return (classes && classes.indexOf(className) > -1);
	},

    /* Pop-up the time picker for a given input field.
	   @param  control  element - the input field attached to the time picker or
	                    string - the ID or other jQuery selector of the input field or
	                    object - jQuery object for input field
	   @return the manager object */
	showFor: function(control) {
		control = (control.jquery ? control[0] :
			(typeof control == 'string' ? $(control)[0] : control));
		var input = (control.nodeName && control.nodeName.toLowerCase() == 'input' ? control : this);
		
		if ($.timePicker._lastInput == input) { return; }
		if ($.timePicker._timepickerShowing) { return; }
		
		var inst = $.timePicker._getInst(input._tpId);
		extendRemove(inst._settings, {});
		
		$.timePicker.hideTimePicker();
		$.timePicker._lastInput = input;
		
		if ($.timePicker._isValidTime(input.value) == null) { input.value = inst._lastValidValue; }
		
		if (!$.timePicker._pos) { // position below input
			$.timePicker._pos = $.timePicker._findPos(input);
			$.timePicker._pos[1] += input.offsetHeight; // add the height			
		}
		
		var isFixed = false;
		$(input).parents().each(function() {
			isFixed |= $(this).css('position') == 'fixed';
		});
		
		if (isFixed && $.browser.opera) { // correction for Opera when fixed and scrolled
			$.timePicker._pos[0] -= document.documentElement.scrollLeft;
			$.timePicker._pos[1] -= document.documentElement.scrollTop;
		}
				
		inst._timePickerDiv.css('position', ($.blockUI ? 'static' : (isFixed ? 'fixed' : 'absolute'))).css('left', $.timePicker._pos[0] + 'px').css('top', $.timePicker._pos[1]+1 + 'px');
		
		$.timePicker._pos = null;
		$.timePicker._showTimePicker(inst);

		return this;
	},

	validateValue: function(control) {
		control = (control.jquery ? control[0] : (typeof control == 'string' ? $(control)[0] : control));
		var input = (control.nodeName && control.nodeName.toLowerCase() == 'input' ? control : this);
		
		var inst = $.timePicker._getInst(input._tpId);
		if ($.timePicker._isValidTime(input.value) != null) { inst._lastValidValue = input.value; }
	    else { input.value = inst._lastValidValue; }
	},
	
    _isValidTime: function(val) {
         var re = new RegExp(/[0-9]+:[0-9]+ [aApP]+[mM]+$/);
         return val.match(re);
    },

    /* Find an object's position on the screen. */
	_findPos: function(obj) {
		while (obj && (obj.type == 'hidden' || obj.nodeType != 1)) {
			obj = obj.nextSibling;
		}
		var curleft = curtop = 0;
		if (obj && obj.offsetParent) {
			curleft = obj.offsetLeft;
			curtop = obj.offsetTop;
			while (obj = obj.offsetParent) {
				var origcurleft = curleft;
				curleft += obj.offsetLeft;
				if (curleft < 0) {
					curleft = origcurleft;
				}
				curtop += obj.offsetTop;
			}
		}
		return [curleft,curtop];
	},
	
	/* Close time picker if clicked elsewhere. */
	_checkExternalClick: function(event) {
		if (!$.timePicker._curInst)
		{
			return;
		}
		var target = $(event.target);		
				
		if ((target.parents("#dtpTimePickerDiv").length == 0) && $.timePicker._timepickerShowing && !($.blockUI))
		{
		    if (target.text() != $.timePicker._curInst._timePickerDiv.text())
		        $.timePicker.hideTimePicker();
		}
	},

    /* Hide the time picker from view.
	   @param  speed  string - the speed at which to close the time picker
	   @return void */
	hideTimePicker: function(s) {
		var inst = this._curInst;
		if (!inst) {
			return;
		}		
 
		if (this._timepickerShowing)
		{
			this._timepickerShowing = false;
			this._lastInput = null;
			
			this._timePickerDiv.css('position', 'absolute').css('left', '0px').css('top', '-1000px');
			
			if ($.blockUI)
			{
				$.unblockUI();
				$('body').append(this._timePickerDiv);
			}
        
            this._curInst = null;        			
		}		
	},

	/* Attach the time picker to an input field. */
	_connectTimePicker: function(target, inst) {
		var input = $(target);
		if (this._hasClass(input, this.markerClassName)) { return; }
		
		$(input).attr('autocomplete', 'OFF'); // Disable browser autocomplete		
		inst._input = $(input);	
		
		input.focus(this.showFor);
		input.blur(this.validateValue);
		
		input.addClass(this.markerClassName).keydown(this._doKeyDown);
		input[0]._tpId = inst._id;
	},
	
	
	/* Construct and display the time picker. */
	_showTimePicker: function(id) {
		var inst = this._getInst(id);
		this._updateTimePicker(inst);
		
        inst._timePickerDiv.css('width', inst._startTime != null ? '10em' : '6em');
		
		inst._timePickerDiv.show('fast');
		if (inst._input[0].type != 'hidden')
        {
		    inst._input[0].focus();
        }
		
		this._curInst = inst;
		this._timepickerShowing = true;
	},

	/* Generate the time picker content. */
	_updateTimePicker: function(inst) {
		inst._timePickerDiv.empty().append(inst._generateTimePicker());
		if (inst._input && inst._input[0].type != 'hidden')
		{
			inst._input[0].focus();
			
			// Mouse events
			inst._timePickerDiv.mousedown(function() {$.timePicker._timepickerOver = true;}).mouseup(function() {$.timePicker._timepickerOver = false;});;
			
            $("li", inst._timePickerDiv).unbind().mouseover(function() {
                $("li.selected", inst._timePickerDiv).removeClass("selected");  // TODO: only needs to run once.
                $(this).addClass("selected");
                }).mousedown(function() {
                    $.timePicker._timepickerOver = true;
                    }).click(function() {
                        inst._setTimeValue(this);
                        $.timePicker._timepickerOver = false;
                    });
                }	
            
            if (inst._input[0].value != "")
            {
                var $matchedTime = $("li:contains(" + inst._input[0].value + ")", inst._timePickerDiv);
                if ($matchedTime.length)
                {
                    $matchedTime.addClass("selected");
                    inst._timePickerDiv[0].scrollTop = $matchedTime[0].offsetTop;
                }
            }
    } 
	
});

/* Individualised settings for time picker functionality applied to one or more related inputs.
   Instances are managed and manipulated through the TimePicker manager. */
function TimePickerInstance(settings)
{
	this._id = $.timePicker._register(this);
	this._input = null; // The attached input field
	this._timePickerDiv = $.timePicker._timePickerDiv;
    this._durationReference = null;
    this._lastValidValue = '';
	// customise the object - uses manager defaults if not overridden
	this._settings = extendRemove({}, settings || {}); // clone	
}

$.extend(TimePickerInstance.prototype, {
	/* Get a setting value, defaulting if necessary. */
	_get: function(name) {
		return (this._settings[name] != null ? this._settings[name] : $.timePicker._defaults[name]);
	},
	
    _getTimeValue: function () {
        if (this._input && this._input[0].type != 'hidden' && this._input[0].value != "")
		{
			return this._timeStringToDate(this._input[0].value);
        }
        return null;
    },
	
	_setTimeValue: function (sel) {
        // Update input field
        if (this._input && this._input[0].type != 'hidden')
		{
			this._input[0].value = $(sel).text().replace(/\(.*?\)/,"");
			$(this._input[0]).change();
        }
        
        // Hide picker
        $.timePicker.hideTimePicker();
    },
   	
	/* Generate the HTML for the current state of the time picker. */
	_generateTimePicker: function() {
		var startTime = this._get('startTime');
		var endTime = this._get('endTime');
		var stepMinutes = this._get('stepMinutes');
		
		var times = [];
        var time = new Date(startTime); // Create a new date object.
        
        while(time <= endTime)
        {
          times[times.length] = this._formatTime(time);
          time = new Date(time.setMinutes(time.getMinutes() + stepMinutes));
        }
        
        // Build the list.
        var html = ('<ul>');
        for(var i = 0; i < times.length; i++) {
            html += ("<li>" + times[i] + "</li>");
        }
        html += ('</ul>');
        
        return html;
	},
	
    _formatTime: function (time) {
        var h = time.getHours();
        var hours = ($.timePicker._show24Hours) ? h : (((h + 11) % 12) + 1);
        var minutes = time.getMinutes();
        
        var time = $.timePicker._timeFormat;
        time = time.replace ('hh', this._padZero(hours));
        time = time.replace ('h', hours);
        time = time.replace ('mm', this._padZero(minutes));
        time = time.replace ('m', minutes);
        time = time.replace ('tt', this._getDesignator(h));
        time = time.replace ('t', this._getDesignator(h));
        
        if (this._durationReference != null) { time = time + this._getDuration(time); }
                
        return time;
    },
    
    _padZero: function(x) {
        return ((x <= 9) ? ("0" + x) : x);  
    },
    
    _getDesignator: function(x) {
        return ($.timePicker._show24Hours) ? '' : ((x < 12) ? $.timePicker._amDesignator : $.timePicker._pmDesignator);
    }, 
  
    _timeStringToDate: function (input) {
        if (input)
        {
            var array = input.split($.timePicker._separator);
            var hours = parseFloat(array[0]);
            var minutes = parseFloat(array[1]);
            var time = new Date(0, 0, 0, hours, minutes, 0);
            return this._normaliseTime(time);
        }
        return null;
    },
  
    /* Normalise time object to a common date. */
	_normaliseTime: function (time) {
		time.setFullYear(2001);
		time.setMonth(0);
		time.setDate(0);
		return time;
	},
	
    _getDuration: function (end) {
        // get time span between two dates in milliseconds
        var span = (end - this._startTime);
        
        if (span <= 0) return "";
        
        // get number of hours
        var h = Math.floor(span / 3600000);
        span = span - (h * 3600000);

        // get number of minutes
        var m = Math.floor(span / 60000);

        var duration = "";
        if (h > 0 && m > 0)
        {
            duration = ((end - this._startTime)/3600000).toString() + " hrs";
        }
        
        if (h > 0 && m == 0)
        {
            duration = h.toString() + " hr";
            if (h > 1)
                duration = duration + "s";
        }
        
        if (h == 0 && m > 0)
        {
            duration = m.toString() + " mins";
        }
        
        if (h == 0 && m == 0)
        {
            duration = "0 min";
        }
        
        return " (" + duration + ")";
    }
	
});


/* jQuery extend now ignores nulls! */
function extendRemove(target, props) {
	$.extend(target, props);
	for (var name in props) {
		if (props[name] == null) {
			target[name] = null;
		}
	}
	return target;
};


/* Attach the time picker to a jQuery selection.
   @param  settings  object - the new settings to use for this time picker instance (anonymous)
   @return jQuery object - for chaining further calls */
$.fn.attachTimePicker = function(settings) {
	return this.each(function() {
		var nodeName = this.nodeName.toLowerCase();
		if (nodeName == 'input')
		{
			var inst = new TimePickerInstance(settings);
			$.timePicker._connectTimePicker(this, inst);
		} 		
	});
};

/* Set the dates for a jQuery selection.
   @param  value     Date - the new date
   @return jQuery object - for chaining further calls */
$.fn.setValue = function(value) {
	return this.each(function() {
		var inst = $.timePicker._getInst(this._tpId);
		if (inst) { inst._setTimeValue(value); }
	});
};

/* Set the dates for a jQuery selection.
   @param  value     Date - the new date
   @return jQuery object - for chaining further calls */
$.fn.setDurationReference = function(value) {
	return this.each(function() {
        var inst = $.timePicker._getInst(this._tpId);
	    if (inst != null) { inst._durationReference = new Date(0, 0, 0, value.getHours(), value.getMinutes(), 0) ; }	    
	});
};

/* Get the date(s) for the first entry in a jQuery selection.
   @return Date - the current date or
           Date[2] - the current dates for a range*/
$.fn.getValue = function() {
	var inst = (this.length > 0 ? $.timePicker._getInst(this[0]._tpId) : null);
	return (inst ? inst._getTimeValue() : null);
};

/* Initialise the time picker. */
$(document).ready(function() {
	$.timePicker = new timePicker(); // singleton instance
	$(document.body).append($.timePicker._timePickerDiv).mousedown($.timePicker._checkExternalClick);
});

})(jQuery);