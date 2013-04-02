var pantalla = new Object(); 

// Get a reference to the body 
// -------------------------------------------------------------------- 
pantalla.getBody = function() {
    if (document.body) {
        return document.body;
    }
    if (document.getElementsByTagName) {
        var bodies = document.getElementsByTagName("BODY");
        if (bodies!=null && bodies.length>0) {
            return bodies[0];
        }
    } 
    return null; 
}; 


// Util function to default a bad number to 0 
// --------------------------------------------------------------------
pantalla.zero = function(n) {
    return (!pantalla.defined(n) || isNaN(n))?0:n;
};

// Determine if a reference is defined
pantalla.defined = function (o) {
    return (typeof(o)!="undefined");
};


// Get the width of the entire document
// --------------------------------------------------------------------
pantalla.getDocumentWidth = function() {
    var width = 0;
    var body = pantalla.getBody();
    if (document.documentElement && (!document.compatMode || document.compatMode=="CSS1Compat")) {
        var rightMargin = parseInt(CSS.get(body,'marginRight'),10) || 0;
        var leftMargin = parseInt(CSS.get(body,'marginLeft'), 10) || 0;
        width = Math.max(body.offsetWidth + leftMargin + rightMargin, document.documentElement.clientWidth);
    }
    else {
        width =  Math.max(body.clientWidth, body.scrollWidth);
    }
    if (isNaN(width) || width==0) {
        width = pantalla.zero(self.innerWidth);
    } 
    return width;
};


// Get the height of the entire document
// --------------------------------------------------------------------
pantalla.getDocumentHeight = function() {
    var body = pantalla.getBody();
    var innerHeight = (pantalla.defined(self.innerHeight) && !isNaN(self.innerHeight)) ? self.innerHeight:0;
    if (document.documentElement && (!document.compatMode || document.compatMode=="CSS1Compat")) {
        var topMargin = parseInt(CSS.get(body,'marginTop'),10) || 0;
        var bottomMargin = parseInt(CSS.get(body,'marginBottom'), 10) || 0;
        return Math.max(body.offsetHeight + topMargin + bottomMargin, document.documentElement.clientHeight, document.documentElement.scrollHeight, pantalla.zero(self.innerHeight));
    }
    return Math.max(body.scrollHeight, body.clientHeight, pantalla.zero(self.innerHeight));
};

/* ******************************************************************* */
/*   CSS FUNCTIONS                                                     */
/* ******************************************************************* */
var CSS = (function(){
  var css = {};

  // Convert an RGB string in the form "rgb (255, 255, 255)" to "#ffffff"
  css.rgb2hex = function(rgbString) {
    if (typeof(rgbString)!="string" || !pantalla.defined(rgbString.match)) { return null; }
    var result = rgbString.match(/^\s*rgb\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*/);
    if (result==null) { return rgbString; }
    var rgb = +result[1] << 16 | +result[2] << 8 | +result[3];
    var hex = "";
    var digits = "0123456789abcdef";
    while(rgb!=0) { 
      hex = digits.charAt(rgb&0xf)+hex; 
      rgb>>>=4; 
    } 
    while(hex.length<6) { hex='0'+hex; }
    return "#" + hex;
  };

  // Convert hyphen style names like border-width to camel case like borderWidth
  css.hyphen2camel = function(property) {
    if (!pantalla.defined(property) || property==null) { return null; }
    if (property.indexOf("-")<0) { return property; }
    var str = "";
    var c = null;
    var l = property.length;
    for (var i=0; i<l; i++) {
      c = property.charAt(i);
      str += (c!="-")?c:property.charAt(++i).toUpperCase();
    }
    return str;
  };
  
  // Determine if an object or class string contains a given class.
  css.hasClass = function(obj,className) {
    if (!pantalla.defined(obj) || obj==null || !RegExp) { return false; }
    var re = new RegExp("(^|\\s)" + className + "(\\s|$)");
    if (typeof(obj)=="string") {
      return re.test(obj);
    }
    else if (typeof(obj)=="object" && obj.className) {
      return re.test(obj.className);
    }
    return false;
  };
  
  // Add a class to an object
  css.addClass = function(obj,className) {
    if (typeof(obj)!="object" || obj==null || !pantalla.defined(obj.className)) { return false; }
    if (obj.className==null || obj.className=='') { 
      obj.className = className; 
      return true; 
    }
    if (css.hasClass(obj,className)) { return true; }
    obj.className = obj.className + " " + className;
    return true;
  };
  
  // Remove a class from an object
  css.removeClass = function(obj,className) {
    if (typeof(obj)!="object" || obj==null || !pantalla.defined(obj.className) || obj.className==null) { return false; }
    if (!css.hasClass(obj,className)) { return false; }
    var re = new RegExp("(^|\\s+)" + className + "(\\s+|$)");
    obj.className = obj.className.replace(re,' ');
    return true;
  };
  
  // Fully replace a class with a new one
  css.replaceClass = function(obj,className,newClassName) {
    if (typeof(obj)!="object" || obj==null || !pantalla.defined(obj.className) || obj.className==null) { return false; }
    css.removeClass(obj,className);
    css.addClass(obj,newClassName);
    return true;
  };
  
  // Get the currently-applied style of an object
  css.getStyle = function(o, property) {
    if (o==null) { return null; }
    var val = null;
    var camelProperty = css.hyphen2camel(property);
    // Handle "float" property as a special case
    if (property=="float") {
      val = css.getStyle(o,"cssFloat");
      if (val==null) { 
        val = css.getStyle(o,"styleFloat"); 
      }
    }
    else if (o.currentStyle && pantalla.defined(o.currentStyle[camelProperty])) {
      val = o.currentStyle[camelProperty];
    }
    else if (window.getComputedStyle) {
      val = window.getComputedStyle(o,null).getPropertyValue(property);
    }
    else if (o.style && pantalla.defined(o.style[camelProperty])) {
      val = o.style[camelProperty];
    }
    // For color values, make the value consistent across browsers
    // Convert rgb() colors back to hex for consistency
    if (/^\s*rgb\s*\(/.test(val)) {
      val = css.rgb2hex(val);
    }
    // Lowercase all #hex values
    if (/^#/.test(val)) {
      val = val.toLowerCase();
    }
    return val;
  };
  css.get = css.getStyle;

  // Set a style on an object
  css.setStyle = function(o, property, value) {
    if (o==null || !pantalla.defined(o.style) || !pantalla.defined(property) || property==null || !pantalla.defined(value)) { return false; }
    if (property=="float") {
      o.style["cssFloat"] = value;
      o.style["styleFloat"] = value;
    }
    else if (property=="opacity") {
      o.style['-moz-opacity'] = value;
      o.style['-khtml-opacity'] = value;
      o.style.opacity = value;
      if (pantalla.defined(o.style.filter)) {
        o.style.filter = "alpha(opacity=" + value*100 + ")";
      }
    }
    else {
      o.style[css.hyphen2camel(property)] = value;
    }
    return true;
  };
  css.set = css.setStyle;
  
  // Get a unique ID which doesn't already exist on the page
  css.uniqueIdNumber=1000;
  css.createId = function(o) {
    if (pantalla.defined(o) && o!=null && pantalla.defined(o.id) && o.id!=null && o.id!="") { 
      return o.id;
    }
    var id = null;
    while (id==null || document.getElementById(id)!=null) {
      id = "ID_"+(css.uniqueIdNumber++);
    }
    if (pantalla.defined(o) && o!=null && (!pantalla.defined(o.id)||o.id=="")) {
      o.id = id;
    }
    return id;
  };
  
  return css;
})();