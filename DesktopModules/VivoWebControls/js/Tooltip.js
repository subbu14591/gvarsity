//
// DotNetNuke -  http://www.dotnetnuke.com
// Copyright (c) 2002-2005
// by Shaun Walker ( sales@perpetualmotion.ca ) of Perpetual Motion Interactive Systems Inc. ( http://www.perpetualmotion.ca )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
// to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions 
// of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.
//

document.write("<div id=\"ttip\" class=\"Eventtooltip\" style=\"display:none;position:absolute;max-width:200px;\"><\/div>");

xBump=yBump=10;
MSIE=document.all;
NS6=document.getElementById&&!document.all;

if(MSIE||NS6)
{
	ttipObj=document.all?document.all["ttip"]:document.getElementById?document.getElementById("ttip"):"";
}

function MSIEBodyReturn()
{
	return(document.compatMode&&document.compatMode!="BackCompat")?document.documentElement:document.body;
}

function ShowTip(ttipText)
{
	ttipObj.innerHTML=ttipText;
	ttipObj.style.display="block";	
	return false;
}

function MoveTip(e)
{
	xPos=(NS6)?e.pageX:event.x+MSIEBodyReturn().scrollLeft;
	yPos=(NS6)?e.pageY:event.y+MSIEBodyReturn().scrollTop;
	lEdge=(xBump<0)?xBump*(-1):-1000;
	rEdge=MSIE&&!window.opera?MSIEBodyReturn().clientWidth-event.clientX-xBump:window.innerWidth-e.clientX-xBump-20;
	bEdge=MSIE&&!window.opera?MSIEBodyReturn().clientHeight-event.clientY-yBump:window.innerHeight-e.clientY-yBump-20;
	if(rEdge<ttipObj.offsetWidth)
	{
		ttipObj.style.left=MSIE?MSIEBodyReturn().scrollLeft+event.clientX-ttipObj.offsetWidth+"px":window.pageXOffset+e.clientX-ttipObj.offsetWidth+"px";
	}
	else if(xPos<lEdge)
	{
		ttipObj.style.left=xBump+"px";
	}
	else
	{
		ttipObj.style.left=xPos+xBump+"px";
	}
	if(bEdge<ttipObj.offsetHeight)
	{
		ttipObj.style.top=MSIE?MSIEBodyReturn().scrollTop+event.clientY-ttipObj.offsetHeight-yBump+"px":window.pageYOffset+e.clientY-ttipObj.offsetHeight-yBump+"px";
	}
	else
	{
		ttipObj.style.top=yPos+yBump+"px";
	}
}

function HideTip(){
	if(MSIE||NS6)
	{
		ttipObj.style.display="none";
		ttipObj.innerText="";
	}
}

document.onmousemove=MoveTip;