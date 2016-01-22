function getEventTriggerId(e) {
	var triggerId;
	if (navigator.userAgent.indexOf("Chrome")!= -1) {
        if(e) {
            triggerId = e.relatedTarget.id;
        }
	} else if (navigator.userAgent.indexOf("Firefox")!= -1){
        if(e) {
            triggerId = e.explicitOriginalTarget.id;
        }
    } else {
        triggerId = document.activeElement.id;
	}
	
	return triggerId; 
}