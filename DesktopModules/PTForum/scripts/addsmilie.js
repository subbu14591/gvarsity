// This function inserts a smilie into the editor area as an IMG tag
function addSmilie(objectId, SmilieToAdd) {

	// FreeTextBox
	if (window.FTB_API) {
		FTB_API[objectId].InsertHtml('<img src='+SmilieToAdd+'>');
		FTB_API[objectId].Focus();
	}
	
	// FCKEditor
	else if (window.FCKeditorAPI) {
		var oEditor = FCKeditorAPI.GetInstance(objectId) ;
		var oImg = oEditor.CreateElement('IMG') ;
		oImg.src = SmilieToAdd ;
	}
	
	// Plain Textbox
	else {
		document.forms["Form"].namedItem(objectId).value += '<img src='+SmilieToAdd+'>';
	}
}
