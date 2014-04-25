// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.

var TiDeploygate = require('ti.deploygate');

// open a single window
var win = Ti.UI.createWindow(
    {
	    backgroundColor:'white'
    }
);
var label = Ti.UI.createLabel(
    {
        text: 'ti.deploygate',
        width: Ti.UI.SIZE,
        height: Ti.UI.SIZE
    }
);
win.add(label);
win.open();
win.addEventListener('open', function () {
    TiDeploygate.setup("author", "key", true/* true is required user authorize*/);
});

Ti.App.addEventListener('resume', function (e) {
    var args = Ti.App.getArguments();
    if(args&&args.url){
        TiDeploygate.recieveURLScheme(args.url);
    }
});


