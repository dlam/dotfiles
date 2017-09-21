var pushedWinRects = {};

var pushTopRight = slate.operation("corner", {
  "direction": "top-right",
  "width": "screenSizeX/2",
  "height": "screenSizeY/2"
});

var pushBottomRight = slate.operation("corner", {
  "direction": "bottom-right",
  "width": "screenSizeX/2",
  "height": "screenSizeY/2"
});

var pushTopLeft = slate.operation('corner', {
  "direction": "top-left",
  "width": "screenSizeX/2",
  "height": "screenSizeY/2"
});

var pushBottomLeft = slate.operation('corner', {
  "direction": "bottom-left",
  "width": "screenSizeX/2",
  "height": "screenSizeY/2"
});

var pushRight = slate.operation("push", {
  "direction": "right",
  "style": "bar-resize:screenSizeX/2"
});
 
var pushLeft = slate.operation("push", {
  "direction": "left",
  "style": "bar-resize:screenSizeX/2"
});

var pushTop = slate.operation("push", {
  "direction": "top",
  "style": "bar-resize:screenSizeY/2"
});

var pushBottom = slate.operation("push", {
  "direction": "bottom",
  "style": "bar-resize:screenSizeY/2"
});

var throwNextLeft = slate.operation("throw", {
  "x": "screenOriginX+(screenSizeX)/2",
  "y": "screenOriginY",
  "width": "screenSizeX/2",
  "height": "screenSizeY",
  "screen": "next"
});
 
var throwNextRight = slate.operation("throw", {
  "width": "screenSizeX/2",
  "height": "screenSizeY",
  "screen": "previous"
});
 
var fullscreen = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var throwNext = function(win) {
  if (!win) {
    return;
  }
  var winRect = win.rect();
  var screen = win.screen().visibleRect();
 
  var newX = (winRect.x - screen.x)/screen.width+"*screenSizeX+screenOriginX";
  var newY = (winRect.y - screen.y)/screen.height+"*screenSizeY+screenOriginY";
  var newWidth = winRect.width/screen.width+"*screenSizeX";
  var newHeight = winRect.height/screen.height+"*screenSizeY";
  var throwNext = slate.operation("throw", {
    "x": newX,
    "y": newY,
    "width": newWidth,
    "height": newHeight,
    "screen": "next"
  });
  win.doOperation(throwNext);
};

var pushedLeft = function(win) {
  if (!win) {
    return false;
  }
  var winRect = win.rect();
  var screen = win.screen().visibleRect();

  return (win.pid() in pushedWinRects &&
      winRect.x < screen.x + (screen.width / 2) &&
      winRect.x === pushedWinRects[win.pid()].x &&
      winRect.y === pushedWinRects[win.pid()].y &&
      winRect.height === pushedWinRects[win.pid()].height &&
      winRect.width === pushedWinRects[win.pid()].width
    );
};

var pushedRight = function(win) {
  if (!win) {
    return false;
  }
  var winRect = win.rect();
  var screen = win.screen().visibleRect();
  
  return (win.pid() in pushedWinRects &&
      winRect.x >= screen.x + (screen.width / 2) &&
      winRect.x === pushedWinRects[win.pid()].x &&
      winRect.y === pushedWinRects[win.pid()].y &&
      winRect.height === pushedWinRects[win.pid()].height &&
      winRect.width === pushedWinRects[win.pid()].width
    );
};

//////////////////////
// Fullscreen
//////////////////////

slate.bind("f:ctrl,cmd", function(win) {
  if (!win) {
    return;
  }

  win.doOperation(fullscreen);
});

////////////////////////
// Half-screen & throws
////////////////////////

slate.bind("left:ctrl,cmd", function(win) {
  if (!win) {
    return;
  }
  if (pushedLeft(win)) {
    win.doOperation(throwNextLeft);
    pushedWinRects[win.pid()] = win.rect();
} else {
    win.doOperation(pushLeft);
    pushedWinRects[win.pid()] = win.rect();
  }
});

slate.bind("right:ctrl,cmd", function(win) {
  if (!win) {
    return;
  }

  if (pushedRight(win)) {
    win.doOperation(throwNextRight);
    pushedWinRects[win.pid()] = win.rect();
  } else {
    win.doOperation(pushRight);
    pushedWinRects[win.pid()] = win.rect();
  }
});

slate.bind("up:ctrl,cmd", function(win) {
  if (!win) {
    return;
  }

  win.doOperation(pushTop);
});

slate.bind("down:ctrl,cmd", function(win) {
  if (!win) {
    return;
  }
  win.doOperation(pushBottom);
});

//////////////
// Corners
//////////////

slate.bind("right:ctrl,alt,cmd", function(win) {
  if (!win) {
    return;
  }

  win.doOperation(pushTopRight);
});

slate.bind("down:ctrl,alt,cmd", function(win) {
  if (!win) {
    return;
  }

  win.doOperation(pushBottomRight);
});

slate.bind("up:ctrl,alt,cmd", function(win) {
  if (!win) {
    return;
  }

  win.doOperation(pushTopLeft);
});

slate.bind("left:ctrl,alt,cmd", function(win) {
  if (!win) {
    return;
  }

  win.doOperation(pushBottomLeft);
});
