// JavaScript : http://developer.apple.com/internet/webcontent/hideshow_layer.html
// Compressed : http://www.creativyst.com/Prod/3/
function getStyleObject(objectId) { if(document.getElementById && document.getElementById(objectId)) { return document.getElementById(objectId).style;} else if (document.all && document.all(objectId)) { return document.all(objectId).style;} else if (document.layers && document.layers[objectId]) { return document.layers[objectId];} else { return false;}}
function changeObjectVisibility(objectId, newVisibility) { var styleObject = getStyleObject(objectId); if(styleObject) { styleObject.visibility = newVisibility; return true;} else { return false;}}
function moveObject(objectId, newXCoordinate, newYCoordinate) { var styleObject = getStyleObject(objectId); if(styleObject) { styleObject.left = newXCoordinate; styleObject.top = newYCoordinate; return true;} else { return false;}}
var xOffset = -5; 
var yOffset = 10; 
function showPopup (targetObjectId, eventObj) { if(eventObj) { hideCurrentPopup(); eventObj.cancelBubble = true; var newXCoordinate = (eventObj.pageX)?eventObj.pageX + xOffset:eventObj.x + xOffset + ((document.body.scrollLeft)?document.body.scrollLeft:0); var newYCoordinate = (eventObj.pageY)?eventObj.pageY + yOffset:eventObj.y + yOffset + ((document.body.scrollTop)?document.body.scrollTop:0); moveObject(targetObjectId, newXCoordinate, newYCoordinate); if( changeObjectVisibility(targetObjectId, 'visible') ) { window.currentlyVisiblePopup = targetObjectId; return true;} else { return false;}} else { return false;}}
function hideCurrentPopup() { if(window.currentlyVisiblePopup) { changeObjectVisibility(window.currentlyVisiblePopup, 'hidden'); window.currentlyVisiblePopup = false;}}
document.onclick = hideCurrentPopup; 
window.onload = initializeHacks; 
function initializeHacks() { if ((navigator.appVersion.indexOf('MSIE 5') != -1) && (navigator.platform.indexOf('Mac') != -1) && getStyleObject('blankDiv')) { window.onresize = explorerMacResizeFix;} resizeBlankDiv(); createFakeEventObj();}
function createFakeEventObj() { if (!window.event) { window.event = false;}}
function resizeBlankDiv() { if ((navigator.appVersion.indexOf('MSIE 5') != -1) && (navigator.platform.indexOf('Mac') != -1) && getStyleObject('blankDiv')) { getStyleObject('blankDiv').width = document.body.clientWidth - 20; getStyleObject('blankDiv').height = document.body.clientHeight - 20;}}
function explorerMacResizeFix () { location.reload(false);}
