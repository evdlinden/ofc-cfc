// only SWFObject static mode supports transparency
swfobject.registerObject("exampleChart", "9.0.0", "expressInstall.swf");  

var refreshTime = 3000;
var refreshDisabled = true;
var loadNextTimer = '';

function loadJSON(coldBoxEventName,chartElementId)
{
	// reload
	clearTimeout(loadNextTimer);
	
	// needed for refresh and buttons
	currentColdBoxEventName = coldBoxEventName;
	
	// call coldbox proxy
	$.get('coldboxproxy.cfc?method=process&returnFormat=json&event=' + coldBoxEventName, loadJSONSuccess);
}

function loadJSONSuccess(data)
{
	// refresh
	if(!refreshDisabled){
		loadNextTimer = setTimeout("loadJSON(currentColdBoxEventName)", refreshTime);			
	}
	
	// load chart
	swfobject.getObjectById('exampleChart').load(data);
	// display JSON result data in text box
	document.getElementById('JSONResultData').value = data; 
}
function setRefreshTime(time){
	refreshTime = time;
	// disabled?
	if(time == 0) {
		refreshDisabled = true;
		clearTimeout(loadNextTimer);
		loadNextTimer = '';
	} else {
		refreshDisabled = false;
		loadJSON(currentColdBoxEventName);
	}
}
