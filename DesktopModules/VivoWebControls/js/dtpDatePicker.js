(function($) { // hide the namespace

function datePicker() {
	this._nextId = 0; // Next ID for a date picker instance
	this._inst = []; // List of instances indexed by ID
	this._curInst = null; // The current instance in use
	this._disabledInputs = []; // List of date picker inputs that have been disabled
	this._datepickerShowing = false; // True if the popup picker is showing , false if not
	this._datepickerOver = false; // True if mouse is over date picker , false if not
	this._clearText = 'Clear'; // Display text for clear button
	this._todayText = 'Today'; // Display text for today
    this.selectedMonth = new Date().getMonth(); // 0-11
    this.selectedYear = new Date().getFullYear(); // 4-digit year
    this.selectedDay = new Date().getDate();
    this._lastInput = null;
	this._monthNames = 'January,February,March,April,May,June,July,August,September,October,November,December', // Names of months for drop-down and formatting
	this._dayNames = 'S,M,T,W,T,F,S', // For formatting
	this._dateFormat = 'M/dd/yyyy', // See format options on parseDate
	this._firstDayOfWeek = 0;
	this._datePickerDiv = $('<div id="dtpDatePickerDiv"></div>');
}
$.extend(datePicker.prototype, {
	/* Class name added to elements to indicate already configured with a date picker. */
	markerClassName: 'hasDatePicker',

	/* Register a new date picker instance - with custom settings. */
	_register: function(inst) {
		var id = this._nextId++;
		this._inst[id] = inst;
		return id;
	},

	/* Retrieve a particular date picker instance based on its ID. */
	_getInst: function(id) {
		return this._inst[id] || id;
	},

	/* Override the default settings for all instances of the date picker. 
	   @param  settings  object - the new settings to use as defaults (anonymous object)
	   @return the manager object */
	setDefaults: function(settings) {
		extendRemove(this._defaults, settings || {});
		return this;
	},

	/* Handle keystrokes. */
	_doKeyDown: function(e) {
		if ($.datePicker._datepickerShowing)
		{
			switch (e.keyCode) {
				case 9: 
				    // hide on tab out
				    $.datePicker.hideDatePicker();
                    break; 
	
				case 27: 
				    // hide on escape
				    $.datePicker.hideDatePicker();
					break; 
			}
		}
		else if (e.keyCode == 40)
		{ // display the date picker on down arrow key
			$.datePicker.showFor(this);
		}
	},

    /* Does this element have a particular class? */
	_hasClass: function(element, className) {
		var classes = element.attr('class');
		return (classes && classes.indexOf(className) > -1);
	},

    /* Pop-up the date picker for a given input field.
	   @param  control  element - the input field attached to the date picker or
	                    string - the ID or other jQuery selector of the input field or
	                    object - jQuery object for input field
	   @return the manager object */
	showFor: function(control) {
		control = (control.jquery ? control[0] : (typeof control == 'string' ? $(control)[0] : control));
		var input = (control.nodeName && control.nodeName.toLowerCase() == 'input' ? control : this);
		if ($.datePicker._lastInput == input) { // already here
			return;
		}
		
		if ($.datePicker._datepickerShowing) { return; }
		
		var inst = $.datePicker._getInst(input._dpId);
	
		$.datePicker.hideDatePicker();
		$.datePicker._lastInput = input;
		
		if ($.datePicker._getDateFromFormat(input.value,$.datePicker._dateFormat) == 0)
	    {
	        input.value = inst._lastValidValue;	        
	    }
	    else
	    {
	        inst._lastValidValue = input.value;
	    }
		
		if (!$.datePicker._pos) {
		    // position below input
			$.datePicker._pos = $.datePicker._findPos(input);
			$.datePicker._pos[1] += input.offsetHeight;
		}

		var isFixed = false;
		$(input).parents().each(function() {
			isFixed |= $(this).css('position') == 'fixed';
		});
		
		if (isFixed && $.browser.opera) { // correction for Opera when fixed and scrolled
			$.datePicker._pos[0] -= document.documentElement.scrollLeft;
			$.datePicker._pos[1] -= document.documentElement.scrollTop;
		}
				
		inst._datePickerDiv.css('position', ($.blockUI ? 'static' : (isFixed ? 'fixed' : 'absolute'))).css('left', $.datePicker._pos[0] + 'px').css('top', $.datePicker._pos[1] + 'px');
		
		$.datePicker._pos = null;
		$.datePicker._showDatePicker(inst);

		return this;
	},
	
	validateValue: function(control) {
		control = (control.jquery ? control[0] : (typeof control == 'string' ? $(control)[0] : control));
		var input = (control.nodeName && control.nodeName.toLowerCase() == 'input' ? control : this);
		var inst = $.datePicker._getInst(input._dpId);		
	
	    if ($.datePicker._getDateFromFormat(input.value,$.datePicker._dateFormat) == 0)
	    {
	        input.value = inst._lastValidValue;	        
	    }	    
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
	
	/* Close date picker if clicked elsewhere. */
	_checkExternalClick: function(event) {
		if (!$.datePicker._curInst)
		{
			return;
		}
		var target = $(event.target);		
				
		if ((target.parents("#dtpDatePickerDiv").length == 0) && $.datePicker._datepickerShowing && !($.blockUI))
		{
		    if (target.text() != $.datePicker._curInst._datePickerDiv.text())
		        $.datePicker.hideDatePicker();
		}
	},

    /* Hide the date picker from view. */
	hideDatePicker: function() {
		var inst = this._curInst;
		if (!inst) { return; }		
 
		if (this._datepickerShowing)
		{
			this._datepickerShowing = false;
			this._lastInput = null;
			
			this._datePickerDiv.css('position', 'absolute').css('left', '0px').css('top', '-1000px');
			
			if ($.blockUI)
			{
				$.unblockUI();
				$('body').append(this._datePickerDiv);
			}
        
            this._curInst = null;        			
		}		
	},

	/* Attach the date picker to an input field. */
	_connectDatePicker: function(target, inst) {
		var input = $(target);
		if (this._hasClass(input, this.markerClassName)){ return; }
		
		input.focus(this.showFor);
		input.blur(this.validateValue);
		
		$(input).attr('autocomplete', 'off'); // Disable browser autocomplete		
		inst._input = $(input);	
				
		input.addClass(this.markerClassName).keydown(this._doKeyDown);
		input[0]._dpId = inst._id;
	},	
	
	

	/* Construct and display the date picker. */
	_showDatePicker: function(id) {
		var inst = this._getInst(id);
		this._updateDatePicker(inst);
		this._curInst = inst;
		
		inst._datePickerDiv.show('fast');
					
		if (inst._input[0].type != 'hidden')
        {
		    inst._input[0].focus();
        }	
		this._datepickerShowing = true;
	},

	/* Generate the date picker content. */
	_updateDatePicker: function(inst) {
		inst._datePickerDiv.empty().append(inst._generateDatePicker())
		if (inst._input && inst._input[0].type != 'hidden')
		{
			inst._input[0].focus();
        }                
    },
    
    /* Re-Generate the date picker content. */
	_navigateDatePicker: function(id, dateStr) {
		var inst = this._getInst(id);
		var dtValue = new Date();
        if (dateStr != null && dateStr != "")
        {
            dtValue = this._getDateFromFormat(dateStr,$.datePicker._dateFormat);
        }
        if (dtValue.toString() == "Invalid Date")
        {
            dtValue = new Date();
        }        
        inst._datePickerDiv.empty().append(inst._generateDatePicker(dtValue));
    },
	
    /* Erase the input field and hide the date picker. */
	_clearDate: function(id) {
		this._selectDate(id, '');
	},

	/* Update the input field with the selected date. */
	_selectDate: function(id, dateStr) {
		var inst = this._getInst(id);
        if (inst._input && inst._input[0].type != 'hidden')
		{
			inst._input[0].value = dateStr;
			inst._lastValidValue = dateStr;
			$(inst._input[0]).change();
        }
        $.datePicker.hideDatePicker();
	},
    
    _padZero: function padZero(num) {
        return ((num <= 9) ? ("0" + num) : num);
    },

    _getDateFromFormat: function (val,format) {
        val=val+"";
        format=format+"";
        var i_val=0;
        var i_format=0;
	    var c="";
	    var token="";
	    var x,y;
	    var now=new Date();
	    var year=now.getYear();
	    var month=now.getMonth()+1;
	    var date=1;
	    
	    var _isInteger = function(val) {
	        var digits="1234567890";
	        for (var i=0; i < val.length; i++) { if (digits.indexOf(val.charAt(i))==-1) { return false; } }
	        return true;
        };
        
        var _getInt = function(str,i,minlength,maxlength) {
            for (var x=maxlength; x>=minlength; x--)
            {
                var token=str.substring(i,i+x);
                if (token.length < minlength) { return null; }
                if (_isInteger(token)) { return token; }
            }
            return null;
        };

	    while (i_format < format.length)
	    {
		    // Get next token from format string
		    c=format.charAt(i_format);
		    token="";
		    while ((format.charAt(i_format)==c) && (i_format < format.length))
		    {
			    token += format.charAt(i_format++);
			}
		    // Extract contents of value based on format token
		    if (token=="yyyy" || token=="yy" || token=="y")
		    {
			    if (token=="yyyy") { x=4;y=4; }
			    if (token=="yy")   { x=2;y=2; }
			    if (token=="y")    { x=2;y=4; }
			    year=_getInt(val,i_val,x,y);
			    if (year==null) { return 0; }
			    i_val += year.length;
			    if (year.length==2)
			    {
				    if (year > 70) { year=1900+(year-0); }
				    else { year=2000+(year-0); }
				}
			}
		    else if (token=="MM" || token=="M" || token=="mm" || token=="m")
		    {
			    month = _getInt(val,i_val,token.length,2);
			    if ((month==null) || (month<1) || (month>12)) { return 0; }
			    i_val += month.length;
            }
		    else if (token=="dd"||token=="d")
		    {
			    date=_getInt(val,i_val,token.length,2);
			    if(date==null||(date<1)||(date>31)){return 0;}
			    i_val+=date.length;
            }
		    else
		    {
			    if (val.substring(i_val,i_val+token.length)!=token) {return 0;}
			    else {i_val+=token.length;}
			}
		}
	
	    // If there are any trailing characters left in the value, it doesn't match
	    if (i_val != val.length) { return 0; }
	
	    // Is date valid for month?
	    if (month==2)
	    {		
		    // Check for leap year
		    if ( ( (year%4==0)&&(year%100 != 0) ) || (year%400==0) )
		    { // leap year
			    if (date > 29){ return 0; }
		    }
		    else
		    {
		        if (date > 28) { return 0; }
            }
		}
	    
	    if ((month==4)||(month==6)||(month==9)||(month==11))
	    {
		    if (date > 30) { return 0; }
		}
	    
	    var newdate=new Date(year,month-1,date);
	    return newdate;
    }
    
});

/* Individualised settings for date picker functionality applied to one or more related inputs.
   Instances are managed and manipulated through the DatePicker manager. */
function DatePickerInstance(settings)
{
	this._id = $.datePicker._register(this);
	this._input = null; // The attached input field
	this._lastValidValue = '';
	this._datePickerDiv = $.datePicker._datePickerDiv;

	// customise the date picker object - uses manager defaults if not overridden
	this._settings = extendRemove({}, settings || {}); // clone
}

$.extend(DatePickerInstance.prototype, {
    _getDateValue: function() {
        var dtValue = new Date();
         // Update input field
        if (this._input && this._input[0].type != 'hidden' && this._input[0].value != "")
		{
		   dtValue = $.datePicker._getDateFromFormat(this._input[0].value,$.datePicker._dateFormat); 		   
        }
        
        if (dtValue.toString() == "Invalid Date") { dtValue = new Date(); }
        
        return dtValue
    },
	
	/* Generate the HTML for the current state of the date picker. */
	_generateDatePicker: function(firstDay) {
		// Get start date
		if (firstDay == null)
		{
		    var tmpDate  = this._getDateValue();
		    firstDay = new Date(tmpDate.getFullYear(), tmpDate.getMonth(), 1, 0, 0, 0);
        }
		
		var html = '';
        var lastDate = 0;
	    var dtToday = new Date();
	    var thisMonth = firstDay.getMonth();
	    var thisYear = firstDay.getFullYear();
	    var nPrevMonth = (thisMonth == 0 ) ? 11 : (thisMonth - 1);
	    var nNextMonth = (thisMonth == 11 ) ? 0 : (thisMonth + 1);
	    var nPrevMonthYear = (nPrevMonth == 11) ? (thisYear - 1): thisYear;
	    var nNextMonthYear = (nNextMonth == 0) ? (thisYear + 1): thisYear;
	    var sToday = this._formatDate(1, dtToday.getMonth()+1, dtToday.getFullYear());
	    var sPrevMonth = this._formatDate(1, nPrevMonth+1, nPrevMonthYear);
	    var sNextMonth = this._formatDate(1, nNextMonth+1, nNextMonthYear);
	    var sPrevYear1 = this._formatDate(1, 1, (thisYear - 1));
	    var sNextYear1 = this._formatDate(1, 1, (thisYear + 1));
 	    var tmpDate = new Date( sNextMonth );
    	
	    tmpDate = new Date( tmpDate.valueOf() - 1001 );
	    lastDate = tmpDate.getDate();
	    
	    var monthNames = $.datePicker._monthNames.split(",");
		var dayNames = $.datePicker._dayNames.split(",");
	    
	    var cellAttribs = "align=\"center\" class=\"day\""
	    var cellAttribs2 = "align=\"center\""
	    var clearAnchor = "<input type=button value=\"" + ($.datePicker._clearText == '' ? 'Clear' : $.datePicker._clearText) + "\" onClick=\"jQuery.datePicker._clearDate(" + this._id + ");\" >";            
	    
	    var linkAttribs = "onmouseover=\"this.className='linkHover';\" onmouseout=\"this.className='link';\"";
	    var todayAnchor = "<span class=\"link\" " + linkAttribs + " onClick=\"jQuery.datePicker._navigateDatePicker(" + this._id + ",'" + sToday + "');\">" + $.datePicker._todayText + "</span>";
	    var prevMonthAnchor = "<span class='link' " + linkAttribs + " onClick=\"jQuery.datePicker._navigateDatePicker(" + this._id + ",'" + sPrevMonth + "');\">" + monthNames[nPrevMonth] + "</span>";
	    var nextMonthAnchor = "<span class='link' " + linkAttribs + " onClick=\"jQuery.datePicker._navigateDatePicker(" + this._id + ",'" + sNextMonth + "');\">" + monthNames[nNextMonth] + "</span>";
	    var prevYear1Anchor = "<span class='link' " + linkAttribs + " onClick=\"jQuery.datePicker._navigateDatePicker(" + this._id + ",'" + sPrevYear1 + "');\">" + (thisYear-1) + "</span>";
	    var nextYear1Anchor = "<span class='link' " + linkAttribs + " onClick=\"jQuery.datePicker._navigateDatePicker(" + this._id + ",'" + sNextYear1 + "');\">" + (thisYear+1) + "</span>";
    		
	    html += ("<TABLE id='dtpDatePickerDivNav1' border=\"0\" cellspacing=\"0\" callpadding=\"0\"><TR><TD>&nbsp</TD>");
	    html += ("<TD class='cellPrevYear' " + cellAttribs2 + ">" + prevYear1Anchor + "</TD>");
	    html += ("<TD class='cellTodayNav' " + cellAttribs2 + ">" + todayAnchor + "</TD>");
	    html += ("<TD class='cellNextYear' " + cellAttribs2 + ">" + nextYear1Anchor + "</TD>");
	    html += ("<TD>&nbsp</TD></TR></TABLE>");
	    
	    html += ("<TABLE id='dtpDatePickerDivNav2' border=\"0\" cellspacing=\"0\" callpadding=\"0\"><TR>");          
	    html += ("<TD class='cellPrevMonth' " + cellAttribs2 + ">" + prevMonthAnchor + "</TD>");
	    html += ("<TD class='cellTitle' nowrap>&nbsp;&nbsp;" + monthNames[thisMonth] + ", " + thisYear + "&nbsp;&nbsp;</TD>");
	    html += ("<TD class='cellNextMonth' " +cellAttribs2 + ">" + nextMonthAnchor + "</TD>");
	    html += ("</TR></TABLE>");
	           
	    html += ("<TABLE id=\"dtpDatePickerDivCalendar\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" );
	    html += ("<TR class=\"daysName\">");
	    
	    var nFirstDayWeek = $.datePicker._firstDayOfWeek;
	    var xday = 0;
	    for (xday = 0; xday < 7; xday++)
	    {
		    html += ("<TD align=\"center\">" + dayNames[(xday + nFirstDayWeek)%7] + "</TD>");
	    };
	    html += ("</TR>");
	    
	    var calDay = 0;
	    var monthDate = 1;
	    var weekDay = firstDay.getDay();
	    var dateToday = new Date();
	    var dateSelected = this._getDateValue();
	    do
	    {
	        html += ("<TR>");
		    for (calDay = 0; calDay < 7; calDay++ )
		    {
		        if(((weekDay + 7 - nFirstDayWeek)%7 != calDay) || (monthDate > lastDate))
			    {
				    html += ("<TD>&nbsp;</TD>");
				    continue;
			    }
			    else
			    {
                    if (dateSelected.getDate() == monthDate && dateSelected.getMonth() == thisMonth && dateSelected.getFullYear() == thisYear)
				    {
				        html += ("<TD class='cellSelected' " + cellAttribs + "><a class=\"monthDay\" onClick=\"jQuery.datePicker._selectDate(" + this._id + ",'" + this._formatDate(monthDate,thisMonth+1,thisYear) + "');\">" + monthDate + "</a></TD>");
				    }
			        else if (dateToday.getDate() == monthDate && dateToday.getMonth() == thisMonth && dateToday.getFullYear() == thisYear)
			        {			        
				        html += ("<TD class='cellToday' " + cellAttribs + "><a class=\"monthDay\" onClick=\"jQuery.datePicker._selectDate(" + this._id + ",'" + this._formatDate(monthDate,thisMonth+1,thisYear) + "');\">" + monthDate + "</a></TD>");
				    }				  
				    else
				    {
				        html += ("<TD " + cellAttribs + "><a class=\"monthDay\" onClick=\"jQuery.datePicker._selectDate(" + this._id + ",'" + this._formatDate(monthDate,thisMonth+1,thisYear) + "');\">" + monthDate + "</a></TD>");
				    }
				    weekDay++;
				    monthDate++;
			    }
		    }
		    weekDay = nFirstDayWeek;
		    html += ("</TR>");
	    } while( monthDate <= lastDate );
    	
    	html += ("<TR><TD align='center' class='cellClear' colspan='" + 7 + "'>" + clearAnchor + "</TD></TR>");
	    
	    html += ("</TABLE>");
	    
	    this.selectedMonth = thisMonth;
        this.selectedYear = thisYear;
     
	    return html;
	},
	
    _formatDate: function (d, m, y) {
        var fmtDate = $.datePicker._dateFormat;
        fmtDate = fmtDate.replace ('dd', $.datePicker._padZero(d))
        fmtDate = fmtDate.replace ('d', d)
        fmtDate = fmtDate.replace ('MM', $.datePicker._padZero(m))
        fmtDate = fmtDate.replace ('M', m)
        fmtDate = fmtDate.replace ('mm', $.datePicker._padZero(m))
        fmtDate = fmtDate.replace ('m', m)
        fmtDate = fmtDate.replace ('yyyy', y)
        fmtDate = fmtDate.replace ('yy', $.datePicker._padZero(y%100))
        return fmtDate;
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


/* Attach the date picker to a jQuery selection.
   @param  settings  object - the new settings to use for this date picker instance (anonymous)
   @return jQuery object - for chaining further calls */
$.fn.attachDatePicker = function(settings) {
	return this.each(function() {
		// check for settings on the control itself - in namespace 'date:'
		var nodeName = this.nodeName.toLowerCase();
		if (nodeName == 'input')
		{
			var inst = new DatePickerInstance(settings);
			$.datePicker._connectDatePicker(this, inst);
		} 		
	});
};

/* Set the dates for a jQuery selection.
   @param  value     Date - the new date
   @return jQuery object - for chaining further calls */
$.fn.setValue = function(value) {
	return this.each(function() {
		var inst = $.datePicker._getInst(this._dpId);
		if (inst) { inst._setTimeValue(value); }
	});
};

/* Get the date(s) for the first entry in a jQuery selection.
   @return Date - the current date or
           Date[2] - the current dates for a range*/
$.fn.getValue = function() {
	var inst = (this.length > 0 ? $.datePicker._getInst(this[0]._dpId) : null);
	if (inst._input && inst._input[0].value != "")
	{
	    return (inst ? inst._getDateValue() : null);
    }
    else
    {
        return null;
    }	
};

/* Initialise the date picker. */
$(document).ready(function() {
	$.datePicker = new datePicker(); // singleton instance
	$(document.body).append($.datePicker._datePickerDiv).mousedown($.datePicker._checkExternalClick);
});

})(jQuery);