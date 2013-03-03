function myFlashIntro (_src,_width,_height,_bgcolor,_divID,_xml) {	
	if (window.document.getElementById(_divID)) {		
	window.document.getElementById(_divID).innerHTML=AC_FL_RunContentDiv( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width',_width,'height',_height,'src',_src,'quality','high','pluginspage','http://www.macromedia.com/go/getflashplayer','movie',_src,'flashvars','xmladress='+_xml, 'bgcolor',_bgcolor,'allowScriptAccess','sameDomain','scale','noborder'); //end AC code								
	} else  {
		alert("Div '"+_divID+"' not found ");
	}
}
