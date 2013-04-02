(function($) { // hide the namespace

function jWick()
{
	this._nextId = 0; // Next ID for a wick instance
	this._inst = []; // List of instances indexed by ID
	this._curInst = null; // The current instance in use
	this._wickWindowShowing = false;
	this._wickDiv = $('<div id="wickDiv"></div>');
}
$.extend(jWick.prototype, {
	/* Class name added to elements to indicate already configured with a wick. */
	markerClassName: 'hasWick',

	/* Register a new instance - with custom settings. */
	_register: function(inst) {
		var id = this._nextId++;
		this._inst[id] = inst;
		return id;
	},

	/* Retrieve a particular instance based on its ID. */
	_getInst: function(id) {
		return this._inst[id] || id;
	},
	
	/* Handle keystrokes. */
	_doKeyDown: function(e) {
        var inst = $.jwick._getInst(this._colId);
		if ($.jwick._wickWindowShowing) {
			switch (e.keyCode) {
				case 9: 
				    // hide on tab out
				    $.jwick.hideWickWindow();
                    break; 

				case 27: 
				    // hide on escape
				    $.jwick.hideWickWindow();
					break;
            }
		}
		else if (e.keyCode == 40) { // display the time picker on down arrow key
			$.jwick.showFor(this);
		}
	},

/* Handle keystrokes. */
	_resetSample: function(e) {
        var inst = $.jwick._getInst(this._colId);
		inst._sampleSpan.css('background-color', inst._input.value);
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
		
		if ($.jwick._lastInput == input) { return; }
		if ($.jwick._wickWindowShowing) { return; }
		
		var inst = $.jwick._getInst(input._colId);
		
		$.jwick.hideWickWindow();
		$.jwick._lastInput = input;
		
		if (!$.jwick._pos) { // position below input
			$.jwick._pos = $.jwick._findPos(input);
			$.jwick._pos[1] += input.offsetHeight; // add the height			
		}
		
		var isFixed = false;
		$(input).parents().each(function() {
			isFixed |= $(this).css('position') == 'fixed';
		});
		
		if (isFixed && $.browser.opera) { // correction for Opera when fixed and scrolled
			$.jwick._pos[0] -= document.documentElement.scrollLeft;
			$.jwick._pos[1] -= document.documentElement.scrollTop;
		}
	
	    inst._colorPickerDiv.css('position', ($.blockUI ? 'static' : (isFixed ? 'fixed' : 'absolute'))).css('left', $.colorPicker._pos[0] + 'px').css('top', $.colorPicker._pos[1]+1 + 'px');
	
		$.jwick._pos = null;
		$.jwick._showWickWindow(inst);

		return this;
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
		if (!$.jwick._curInst)
		{
			return;
		}
		var target = $(event.target);		
				
		if ((target.parents("#wickDiv").length == 0) && $.jwick._colorpickerShowing && !($.blockUI))
		{
		    if (target.text() != $.jwick._curInst._wickDiv.text())
		        $.jwick.hideColorPicker();
		}
	},

    /* Hide the time picker from view.
	   @param  speed  string - the speed at which to close the wick
	   @return void */
	hideWickWindow: function(s) {
		var inst = this._curInst;
		if (!inst) {
			return;
		}		
 
		if (this._wickWindowShowing)
		{
			this._wickWindowShowing = false;
			this._lastInput = null;
			
			this._wickDiv.css('position', 'absolute').css('left', '0px').css('top', '-1000px');
			
			if ($.blockUI)
			{
				$.unblockUI();
				$('body').append(this._wickDiv);
			}
        
            this._curInst = null;        			
		}
	},

	/* Attach the time picker to an input field. */
	_connectWick: function(target, inst) {
		var input = $(target);
		if (this._hasClass(input, this.markerClassName)) { return; }
		
		$(input).attr('autocomplete', 'OFF'); // Disable browser autocomplete		
		inst._input = $(input);	
								
		input.focus(this.showFor);
		
		input.addClass(this.markerClassName).keydown(this._doKeyDown);
		input[0]._colId = inst._id;		
	},
	
	
	/* Construct and display the time picker. */
	_showWickWindow: function(id) {
		var inst = this._getInst(id);
		this._updateWick(inst);
		
        inst._wickDiv.css('width', inst._startTime != null ? '10em' : '6em');
		
		inst._wickDiv.show('fast');
		if (inst._input[0].type != 'hidden')
        {
		    inst._input[0].focus();
        }
		
		this._curInst = inst;
		this._wickWindowShowing = true;
	},

	/* Generate the time picker content. */
	_updateWick: function(inst) {
		inst._wickDiv.empty().append(inst._generateWick());
		if (inst._input && inst._input[0].type != 'hidden')
		{
			inst._input[0].focus();
        }
    } 
	
});

/* Individualised settings for wick functionality applied to one or more related inputs.
   Instances are managed and manipulated through the jWick manager. */
function jWickInstance()
{
	this._id = $.jwick._register(this);
	this._input = null;
	this._wickDiv = $.jwick._wickDiv;
}

$.extend(jWickInstance.prototype, {
	/* Get a setting value, defaulting if necessary. */
	_get: function(name) {
		return (this._settings[name] != null ? this._settings[name] : $.jwick._defaults[name]);
	},
	
    _getValue: function () {
        if (this._input && this._input[0].type != 'hidden' && this._input[0].value != "")
		{
			return this._input[0].value;
        }
        return null;
    },
	
	_setValue: function (sel) {
        // Update input field
        if (this._input && this._input[0].type != 'hidden')
		{
		    this._input[0].value = $.attr(sel,'title');
			$(this._input[0]).change();
        }
        
        // Hide
        $.jwick.hideWickWindow();
    },
   	
	/* Generate the HTML for the current state of the time picker. */
	_generateWick: function() {       
	    var html = "<table border='1px' cellspacing='0' cellpadding='0'>";
		
		html += "</table>";    
        return html
	}
	
});


/* Attach the time picker to a jQuery selection.
   @param  settings  object - the new settings to use for this time picker instance (anonymous)
   @return jQuery object - for chaining further calls */
$.fn.attachWick = function() {
	return this.each(function() {
		var nodeName = this.nodeName.toLowerCase();
		if (nodeName == 'input')
		{
			var inst = new jWickInstance();
			$.jwick._connectWick(this, inst);
		} 		
	});
};

/* Initialise the time picker. */
$(document).ready(function() {
	$.jwick = new jWick(); // singleton instance
	$(document.body).append($.jwick._wickDiv).mousedown($.jwick._checkExternalClick);
});

})(jQuery);