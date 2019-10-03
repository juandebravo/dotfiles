// https://github.com/jigish/slate/wiki
// https://github.com/jigish/dotfiles/blob/master/slate.js

S.cfga({
    "keyboardLayout": "qwerty",
    "nudgePercentOf": "windowSize",
    "resizePercentOf": "windowSize",
    "focusCheckWidthMax": 3000,
    "undoOps": ""
});

var monitorMac = "1920x1200";
var monitorTID = "1920x1080";

// Operations
var lapSkype = S.op("corner", {
  "screen": monitorMac,
  "direction": "top-left",
  "width": "screenSizeX/3",
  "height": "screenSizeY"
});

var lapMain = lapSkype.dup({"direction": "top-right",
                            "width": "2*screenSizeX/3"});

var lapMaximize = lapSkype.dup({"direction": "top-left",
                                "width": "screenSizeX"});

var lapFocusSublime = S.op("focus", {
  // only one of these is required. if both are specified it will use app.
  "app" : "Sublime Text 2"
});

// common layout hashes
var lapMainHash = {
  "operations" : [lapMain],
  "ignore-fail" : true,
  "repeat" : true
};

var skypeHash = {
  "operations" : [lapSkype, lapMain],
  "ignore-fail" : true,
  "title-order" : ["Contacts"],
  "repeat-last" : true
};

var oneMonitorLayout = S.lay("oneMonitor", {
  "Sublime Text 2" : lapMainHash,
  "iTerm" : lapMainHash,
  "Terminal" : lapMainHash,
  "Google Chrome" : lapMainHash,
  "Xcode" : lapMainHash,
  "GitX" : lapMainHash,
  "Firefox" : lapMainHash,
  "Safari" : lapMainHash,
});

S.def([monitorMac], oneMonitorLayout);

var oneMonitor = S.op("layout", {"name": oneMonitorLayout});

var twoMonitor = S.op("layout", {"name": oneMonitorLayout});

var universalLayout = function() {
  S.log("SCREEN COUNT: " + S.screenCount());
  if (S.screenCount() === 2) {
    twoMonitor.run();
  } else if (S.screenCount() === 1) {
    oneMonitor.run();
  } else {
    S.log("WTF! more than two monitors?");
  }
};

S.bnda({
  "space:ctrl,cmd" : universalLayout,
  "left:ctrl,cmd" : lapSkype,
  "right:ctrl,cmd" : lapMain,
  "s:ctrl,cmd": lapFocusSublime,
  "=:ctrl,cmd"  : lapMaximize,
});

S.log("[SLATE] -------------- Finished Loading Config --------------");

