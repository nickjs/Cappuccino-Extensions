I;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.ji;12;CPPlatform.ji;18;CPPlatformWindow.jc;38877;
var DoubleClick = "dblclick",
    MouseDown = "mousedown",
    MouseUp = "mouseup",
    MouseMove = "mousemove",
    MouseDrag = "mousedrag",
    KeyUp = "keyup",
    KeyDown = "keydown",
    KeyPress = "keypress",
    Copy = "copy",
    Paste = "paste",
    Resize = "resize",
    ScrollWheel = "mousewheel",
    TouchStart = "touchstart",
    TouchMove = "touchmove",
    TouchEnd = "touchend",
    TouchCancel = "touchcancel";
var ExcludedDOMElements = [];
ExcludedDOMElements["INPUT"] = YES;
ExcludedDOMElements["SELECT"] = YES;
ExcludedDOMElements["TEXTAREA"] = YES;
ExcludedDOMElements["OPTION"] = YES;
var CPDOMEventGetClickCount,
    CPDOMEventStop,
    StopDOMEventPropagation;
var KeyCodesToPrevent = {},
    CharacterKeysToPrevent = {},
    KeyCodesWithoutKeyPressEvents = { '8':1, '9':1, '16':1, '37':1, '38':1, '39':1, '40':1, '46':1, '33':1, '34':1 };
var CTRL_KEY_CODE = 17;
var supportsNativeDragAndDrop = objj_msgSend(CPPlatform, "supportsDragAndDrop");
{
var the_class = objj_getClass("CPPlatformWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPPlatformWindow\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_init"), function $CPPlatformWindow___init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _DOMWindow = window;
        _contentRect = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        _windowLevels = [];
        _windowLayers = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(self, "registerDOMWindow");
        objj_msgSend(self, "updateFromNativeContentRect");
        _charCodes = {};
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("nativeContentRect"), function $CPPlatformWindow__nativeContentRect(self, _cmd)
{ with(self)
{
    if (!_DOMWindow)
        return objj_msgSend(self, "contentRect");
    if (_DOMWindow.cpFrame)
        return _DOMWindow.cpFrame();
    var contentRect = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    if (window.screenTop)
        contentRect.origin = { x:_DOMWindow.screenLeft, y:_DOMWindow.screenTop };
    else if (window.screenX)
        contentRect.origin = { x:_DOMWindow.screenX, y:_DOMWindow.screenY };
    if (_DOMWindow.innerWidth)
        contentRect.size = { width:_DOMWindow.innerWidth, height:_DOMWindow.innerHeight };
    else if (document.documentElement && document.documentElement.clientWidth)
        contentRect.size = { width:_DOMWindow.document.documentElement.clientWidth, height:_DOMWindow.document.documentElement.clientHeight };
    else
        contentRect.size = { width:_DOMWindow.document.body.clientWidth, height:_DOMWindow.document.body.clientHeight };
    return contentRect;
}
},["CGRect"]), new objj_method(sel_getUid("updateNativeContentRect"), function $CPPlatformWindow__updateNativeContentRect(self, _cmd)
{ with(self)
{
    if (!_DOMWindow)
        return;
    if (typeof _DOMWindow["cpSetFrame"] === "function")
        return _DOMWindow.cpSetFrame(objj_msgSend(self, "contentRect"));
    var origin = objj_msgSend(self, "contentRect").origin,
        nativeOrigin = objj_msgSend(self, "nativeContentRect").origin;
    if (origin.x !== nativeOrigin.x || origin.y !== nativeOrigin.y)
    {
        _DOMWindow.moveBy(origin.x - nativeOrigin.x, origin.y - nativeOrigin.y);
    }
    var size = objj_msgSend(self, "contentRect").size,
        nativeSize = objj_msgSend(self, "nativeContentRect").size;
    if (size.width !== nativeSize.width || size.height !== nativeSize.height)
    {
        _DOMWindow.resizeBy(size.width - nativeSize.width, size.height - nativeSize.height);
    }
}
},["void"]), new objj_method(sel_getUid("orderBack:"), function $CPPlatformWindow__orderBack_(self, _cmd, aSender)
{ with(self)
{
    if (_DOMWindow)
        _DOMWindow.blur();
}
},["void","id"]), new objj_method(sel_getUid("registerDOMWindow"), function $CPPlatformWindow__registerDOMWindow(self, _cmd)
{ with(self)
{
    var theDocument = _DOMWindow.document;
    _DOMBodyElement = theDocument.getElementsByTagName("body")[0];
    if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        _DOMBodyElement.style["-khtml-user-select"] = "none";
    _DOMBodyElement.webkitTouchCallout = "none";
    _DOMFocusElement = theDocument.createElement("input");
    _DOMFocusElement.style.position = "absolute";
    _DOMFocusElement.style.zIndex = "-1000";
    _DOMFocusElement.style.opacity = "0";
    _DOMFocusElement.style.filter = "alpha(opacity=0)";
    _DOMBodyElement.appendChild(_DOMFocusElement);
    _DOMPasteboardElement = theDocument.createElement("input");
    _DOMPasteboardElement.style.position = "absolute";
    _DOMPasteboardElement.style.top = "-10000px";
    _DOMPasteboardElement.style.zIndex = "99";
    _DOMBodyElement.appendChild(_DOMPasteboardElement);
    _DOMPasteboardElement.blur();
    var theClass = objj_msgSend(self, "class"),
        dragEventImplementation = class_getMethodImplementation(theClass, sel_getUid("dragEvent:")),
        dragEventCallback = function (anEvent) { dragEventImplementation(self, nil, anEvent); },
        resizeEventSelector = sel_getUid("resizeEvent:"),
        resizeEventImplementation = class_getMethodImplementation(theClass, resizeEventSelector),
        resizeEventCallback = function (anEvent) { resizeEventImplementation(self, nil, anEvent); },
        keyEventSelector = sel_getUid("keyEvent:"),
        keyEventImplementation = class_getMethodImplementation(theClass, keyEventSelector),
        keyEventCallback = function (anEvent) { keyEventImplementation(self, nil, anEvent); },
        mouseEventSelector = sel_getUid("mouseEvent:"),
        mouseEventImplementation = class_getMethodImplementation(theClass, mouseEventSelector),
        mouseEventCallback = function (anEvent) { mouseEventImplementation(self, nil, anEvent); },
        scrollEventSelector = sel_getUid("scrollEvent:"),
        scrollEventImplementation = class_getMethodImplementation(theClass, scrollEventSelector),
        scrollEventCallback = function (anEvent) { scrollEventImplementation(self, nil, anEvent); },
        touchEventSelector = sel_getUid("touchEvent:"),
        touchEventImplementation = class_getMethodImplementation(theClass, touchEventSelector),
        touchEventCallback = function (anEvent) { touchEventImplementation(self, nil, anEvent); };
    if (theDocument.addEventListener)
    {
        if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        {
            theDocument.addEventListener("dragstart", dragEventCallback, NO);
            theDocument.addEventListener("drag", dragEventCallback, NO);
            theDocument.addEventListener("dragend", dragEventCallback, NO);
            theDocument.addEventListener("dragover", dragEventCallback, NO);
            theDocument.addEventListener("dragleave", dragEventCallback, NO);
            theDocument.addEventListener("drop", dragEventCallback, NO);
        }
        theDocument.addEventListener("mouseup", mouseEventCallback, NO);
        theDocument.addEventListener("mousedown", mouseEventCallback, NO);
        theDocument.addEventListener("mousemove", mouseEventCallback, NO);
        theDocument.addEventListener("keyup", keyEventCallback, NO);
        theDocument.addEventListener("keydown", keyEventCallback, NO);
        theDocument.addEventListener("keypress", keyEventCallback, NO);
        theDocument.addEventListener("touchstart", touchEventCallback, NO);
        theDocument.addEventListener("touchend", touchEventCallback, NO);
        theDocument.addEventListener("touchmove", touchEventCallback, NO);
        theDocument.addEventListener("touchcancel", touchEventCallback, NO);
        _DOMWindow.addEventListener("DOMMouseScroll", scrollEventCallback, NO);
        _DOMWindow.addEventListener("mousewheel", scrollEventCallback, NO);
        _DOMWindow.addEventListener("resize", resizeEventCallback, NO);
        _DOMWindow.addEventListener("unload", function()
        {
            objj_msgSend(self, "updateFromNativeContentRect");
            theDocument.removeEventListener("mouseup", mouseEventCallback, NO);
            theDocument.removeEventListener("mousedown", mouseEventCallback, NO);
            theDocument.removeEventListener("mousemove", mouseEventCallback, NO);
            theDocument.removeEventListener("keyup", keyEventCallback, NO);
            theDocument.removeEventListener("keydown", keyEventCallback, NO);
            theDocument.removeEventListener("keypress", keyEventCallback, NO);
            theDocument.removeEventListener("touchstart", touchEventCallback, NO);
            theDocument.removeEventListener("touchend", touchEventCallback, NO);
            theDocument.removeEventListener("touchmove", touchEventCallback, NO);
            _DOMWindow.removeEventListener("resize", resizeEventCallback, NO);
            _DOMWindow.removeEventListener("DOMMouseScroll", scrollEventCallback, NO);
            _DOMWindow.removeEventListener("mousewheel", scrollEventCallback, NO);
            self._DOMWindow = nil;
        }, NO);
    }
    else
    {
        theDocument.attachEvent("onmouseup", mouseEventCallback);
        theDocument.attachEvent("onmousedown", mouseEventCallback);
        theDocument.attachEvent("onmousemove", mouseEventCallback);
        theDocument.attachEvent("ondblclick", mouseEventCallback);
        theDocument.attachEvent("onkeyup", keyEventCallback);
        theDocument.attachEvent("onkeydown", keyEventCallback);
        theDocument.attachEvent("onkeypress", keyEventCallback);
        _DOMWindow.attachEvent("onresize", resizeEventCallback);
        _DOMWindow.onmousewheel = scrollEventCallback;
        theDocument.onmousewheel = scrollEventCallback;
        theDocument.body.ondrag = function () { return NO; };
        theDocument.body.onselectstart = function () { return _DOMWindow.event.srcElement === _DOMPasteboardElement; };
        _DOMWindow.attachEvent("onbeforeunload", function()
        {
            objj_msgSend(self, "updateFromNativeContentRect");
            theDocument.removeEvent("onmouseup", mouseEventCallback);
            theDocument.removeEvent("onmousedown", mouseEventCallback);
            theDocument.removeEvent("onmousemove", mouseEventCallback);
            theDocument.removeEvent("ondblclick", mouseEventCallback);
            theDocument.removeEvent("onkeyup", keyEventCallback);
            theDocument.removeEvent("onkeydown", keyEventCallback);
            theDocument.removeEvent("onkeypress", keyEventCallback);
            _DOMWindow.removeEvent("onresize", resizeEventCallback);
            _DOMWindow.onmousewheel = NULL;
            theDocument.onmousewheel = NULL;
            theDocument.body.ondrag = NULL;
            theDocument.body.onselectstart = NULL;
            self._DOMWindow = nil;
        }, NO);
    }
}
},["void"]), new objj_method(sel_getUid("orderFront:"), function $CPPlatformWindow__orderFront_(self, _cmd, aSender)
{ with(self)
{
    if (_DOMWindow)
        return _DOMWindow.focus();
    _DOMWindow = window.open("", "_blank", "menubar=no,location=no,resizable=yes,scrollbars=no,status=no,left=" + (_contentRect.origin.x) + ",top=" + (_contentRect.origin.y) + ",width=" + (_contentRect.size.width) + ",height=" + (_contentRect.size.height));
    _DOMWindow.document.write("<html><head></head><body style = 'background-color:transparent;'></body></html>");
    _DOMWindow.document.close();
    if (!objj_msgSend(CPPlatform, "isBrowser"))
    {
        _DOMWindow.cpSetLevel(_level);
        _DOMWindow.cpSetHasShadow(_hasShadow);
    }
    objj_msgSend(self, "registerDOMWindow");
}
},["void","id"]), new objj_method(sel_getUid("orderOut:"), function $CPPlatformWindow__orderOut_(self, _cmd, aSender)
{ with(self)
{
    if (!_DOMWindow)
        return;
    _DOMWindow.close();
}
},["void","id"]), new objj_method(sel_getUid("dragEvent:"), function $CPPlatformWindow__dragEvent_(self, _cmd, aDOMEvent)
{ with(self)
{
    var type = aDOMEvent.type,
        dragServer = objj_msgSend(CPDragServer, "sharedDragServer"),
        location = { x:aDOMEvent.clientX, y:aDOMEvent.clientY },
        pasteboard = objj_msgSend(_CPDOMDataTransferPasteboard, "DOMDataTransferPasteboard");
    objj_msgSend(pasteboard, "_setDataTransfer:", aDOMEvent.dataTransfer);
    if (aDOMEvent.type === "dragstart")
    {
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
        objj_msgSend(pasteboard, "_setPasteboard:", objj_msgSend(dragServer, "draggingPasteboard"));
        var draggedWindow = objj_msgSend(dragServer, "draggedWindow"),
            draggedWindowFrame = objj_msgSend(draggedWindow, "frame"),
            DOMDragElement = draggedWindow._DOMElement;
        DOMDragElement.style.left = -(draggedWindowFrame.size.width) + "px";
        DOMDragElement.style.top = -(draggedWindowFrame.size.height) + "px";
        document.getElementsByTagName("body")[0].appendChild(DOMDragElement);
        var draggingOffset = objj_msgSend(dragServer, "draggingOffset");
        aDOMEvent.dataTransfer.setDragImage(DOMDragElement, draggingOffset.width, draggingOffset.height);
        objj_msgSend(dragServer, "draggingStartedInPlatformWindow:globalLocation:", self, objj_msgSend(CPPlatform, "isBrowser") ? location : { x:aDOMEvent.screenX, y:aDOMEvent.screenY });
    }
    else if (type === "drag")
        objj_msgSend(dragServer, "draggingSourceUpdatedWithGlobalLocation:", objj_msgSend(CPPlatform, "isBrowser") ? location : { x:aDOMEvent.screenX, y:aDOMEvent.screenY });
    else if (type === "dragover" || type === "dragleave")
    {
        if (aDOMEvent.preventDefault)
            aDOMEvent.preventDefault();
        var dropEffect = "none",
            dragOperation = objj_msgSend(dragServer, "draggingUpdatedInPlatformWindow:location:", self, location);
        if (dragOperation === CPDragOperationMove || dragOperation === CPDragOperationGeneric || dragOperation === CPDragOperationPrivate)
            dropEffect = "move";
        else if (dragOperation === CPDragOperationCopy)
            dropEffect = "copy";
        else if (dragOperation === CPDragOperationLink)
            dropEffect = "link";
        aDOMEvent.dataTransfer.dropEffect = dropEffect;
    }
    else if (type === "dragend")
        objj_msgSend(dragServer, "draggingEndedInPlatformWindow:globalLocation:", self, objj_msgSend(CPPlatform, "isBrowser") ? location : { x:aDOMEvent.screenX, y:aDOMEvent.screenY });
    else
    {
        objj_msgSend(dragServer, "performDragOperationInPlatformWindow:", self);
        if (aDOMEvent.preventDefault)
            aDOMEvent.preventDefault();
        if (aDOMEvent.stopPropagation)
            aDOMEvent.stopPropagation();
    }
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
},["void","DOMEvent"]), new objj_method(sel_getUid("keyEvent:"), function $CPPlatformWindow__keyEvent_(self, _cmd, aDOMEvent)
{ with(self)
{
    var event,
        timestamp = aDOMEvent.timeStamp ? aDOMEvent.timeStamp : new Date(),
        sourceElement = (aDOMEvent.target || aDOMEvent.srcElement),
        windowNumber = objj_msgSend(objj_msgSend(CPApp, "keyWindow"), "windowNumber"),
        modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) |
                        (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) |
                        (aDOMEvent.altKey ? CPAlternateKeyMask : 0) |
                        (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
    if (ExcludedDOMElements[sourceElement.tagName] && sourceElement != _DOMFocusElement && sourceElement != _DOMPasteboardElement)
        return;
    StopDOMEventPropagation = !(modifierFlags & (CPControlKeyMask | CPCommandKeyMask)) ||
                              CharacterKeysToPrevent[String.fromCharCode(aDOMEvent.keyCode || aDOMEvent.charCode).toLowerCase()] ||
                              KeyCodesToPrevent[aDOMEvent.keyCode];
    var isNativePasteEvent = NO,
        isNativeCopyOrCutEvent = NO;
    switch (aDOMEvent.type)
    {
        case "keydown":
                            _keyCode = aDOMEvent.keyCode;
                            var characters = String.fromCharCode(_keyCode).toLowerCase();
                            if (characters == "v" && (modifierFlags & CPPlatformActionKeyMask))
                            {
                                _DOMPasteboardElement.select();
                                _DOMPasteboardElement.value = "";
                                isNativePasteEvent = YES;
                            }
                            else if ((characters == "c" || characters == "x") && (modifierFlags & CPPlatformActionKeyMask))
                                isNativeCopyOrCutEvent = YES;
                            else if (!CPFeatureIsCompatible(CPJavascriptRemedialKeySupport))
                                return;
                            else if (!KeyCodesWithoutKeyPressEvents[_keyCode] && (_keyCode == CTRL_KEY_CODE || !(modifierFlags & CPControlKeyMask)))
                                return;
        case "keypress":
                            if ((aDOMEvent.target || aDOMEvent.srcElement) == _DOMPasteboardElement)
                                return;
                            var keyCode = _keyCode,
                                charCode = aDOMEvent.keyCode || aDOMEvent.charCode,
                                isARepeat = (_charCodes[keyCode] != nil);
                            _charCodes[keyCode] = charCode;
                            var characters = String.fromCharCode(charCode),
                                charactersIgnoringModifiers = characters.toLowerCase();
                            event = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyDown, location, modifierFlags, timestamp, windowNumber, nil, characters, charactersIgnoringModifiers, isARepeat, keyCode);
                            if (isNativePasteEvent)
                            {
                                _pasteboardKeyDownEvent = event;
                                window.setNativeTimeout(function () { objj_msgSend(self, "_checkPasteboardElement") }, 0);
                                return;
                            }
                            break;
        case "keyup": var keyCode = aDOMEvent.keyCode,
                                charCode = _charCodes[keyCode];
                            _charCodes[keyCode] = nil;
                            var characters = String.fromCharCode(charCode),
                                charactersIgnoringModifiers = characters.toLowerCase();
                            if (!(modifierFlags & CPShiftKeyMask))
                                characters = charactersIgnoringModifiers;
                            event = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyUp, location, modifierFlags,  timestamp, windowNumber, nil, characters, charactersIgnoringModifiers, NO, keyCode);
                            break;
    }
    if (event)
    {
        event._DOMEvent = aDOMEvent;
        objj_msgSend(CPApp, "sendEvent:", event);
        if (isNativeCopyOrCutEvent)
        {
            var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard"),
                types = objj_msgSend(pasteboard, "types");
            if (types.length)
            {
                if (objj_msgSend(types, "indexOfObjectIdenticalTo:", CPStringPboardType) != CPNotFound)
                    _DOMPasteboardElement.value = objj_msgSend(pasteboard, "stringForType:", CPStringPboardType);
                else
                    _DOMPasteboardElement.value = objj_msgSend(pasteboard, "_generateStateUID");
                _DOMPasteboardElement.select();
                window.setNativeTimeout(function() { objj_msgSend(self, "_clearPasteboardElement"); }, 0);
            }
            return;
        }
    }
    if (StopDOMEventPropagation)
        CPDOMEventStop(aDOMEvent, self);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
},["void","DOMEvent"]), new objj_method(sel_getUid("scrollEvent:"), function $CPPlatformWindow__scrollEvent_(self, _cmd, aDOMEvent)
{ with(self)
{
    if(!aDOMEvent)
        aDOMEvent = window.event;
    if (CPFeatureIsCompatible(CPJavaScriptMouseWheelValues_8_15))
    {
        var x = 0.0,
            y = 0.0,
            element = aDOMEvent.target;
        while (element.nodeType !== 1)
            element = element.parentNode;
        if (element.offsetParent)
        {
            do
            {
                x += element.offsetLeft;
                y += element.offsetTop;
            } while (element = element.offsetParent);
        }
        var location = { x:(x + ((aDOMEvent.clientX - 8) / 15)), y:(y + ((aDOMEvent.clientY - 8) / 15)) };
    }
    else
        var location = { x:aDOMEvent.clientX, y:aDOMEvent.clientY };
    var deltaX = 0.0,
        deltaY = 0.0,
        windowNumber = 0,
        timestamp = aDOMEvent.timeStamp ? aDOMEvent.timeStamp : new Date(),
        modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) |
                        (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) |
                        (aDOMEvent.altKey ? CPAlternateKeyMask : 0) |
                        (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
    StopDOMEventPropagation = YES;
    var theWindow = objj_msgSend(self, "hitTest:", location);
    if (!theWindow)
        return;
    var windowNumber = objj_msgSend(theWindow, "windowNumber");
    location = objj_msgSend(theWindow, "convertBridgeToBase:", location);
    if(typeof aDOMEvent.wheelDeltaX != "undefined")
    {
        deltaX = aDOMEvent.wheelDeltaX / 120.0;
        deltaY = aDOMEvent.wheelDeltaY / 120.0;
    }
    else if (aDOMEvent.wheelDelta)
        deltaY = aDOMEvent.wheelDelta / 120.0;
    else if (aDOMEvent.detail)
        deltaY = -aDOMEvent.detail / 3.0;
    else
        return;
    if(!CPFeatureIsCompatible(CPJavaScriptNegativeMouseWheelValues))
    {
        deltaX = -deltaX;
        deltaY = -deltaY;
    }
    var event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPScrollWheel, location, modifierFlags, timestamp, windowNumber, nil, -1, 1, 0 );
    event._DOMEvent = aDOMEvent;
    event._deltaX = deltaX;
    event._deltaY = deltaY;
    objj_msgSend(CPApp, "sendEvent:", event);
    if (StopDOMEventPropagation)
        CPDOMEventStop(aDOMEvent, self);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
},["void","DOMEvent"]), new objj_method(sel_getUid("resizeEvent:"), function $CPPlatformWindow__resizeEvent_(self, _cmd, aDOMEvent)
{ with(self)
{
    var oldSize = objj_msgSend(self, "contentRect").size;
    objj_msgSend(self, "updateFromNativeContentRect");
    var levels = _windowLevels,
        layers = _windowLayers,
        levelCount = levels.length;
    while (levelCount--)
    {
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount--)
            objj_msgSend(windows[windowCount], "resizeWithOldPlatformWindowSize:", oldSize);
    }
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
},["void","DOMEvent"]), new objj_method(sel_getUid("touchEvent:"), function $CPPlatformWindow__touchEvent_(self, _cmd, aDOMEvent)
{ with(self)
{
    if (aDOMEvent.touches && (aDOMEvent.touches.length == 1 || (aDOMEvent.touches.length == 0 && aDOMEvent.changedTouches.length == 1)))
    {
        var newEvent = {};
        switch(aDOMEvent.type)
        {
            case CPDOMEventTouchStart: newEvent.type = CPDOMEventMouseDown;
                                        break;
            case CPDOMEventTouchEnd: newEvent.type = CPDOMEventMouseUp;
                                        break;
            case CPDOMEventTouchMove: newEvent.type = CPDOMEventMouseMoved;
                                        break;
            case CPDOMEventTouchCancel: newEvent.type = CPDOMEventMouseUp;
                                        break;
        }
        var touch = aDOMEvent.touches.length ? aDOMEvent.touches[0] : aDOMEvent.changedTouches[0];
        newEvent.clientX = touch.clientX;
        newEvent.clientY = touch.clientY;
        newEvent.timestamp = aDOMEvent.timestamp;
        newEvent.target = aDOMEvent.target;
        newEvent.shiftKey = newEvent.ctrlKey = newEvent.altKey = newEvent.metaKey = false;
        newEvent.preventDefault = function(){if(aDOMEvent.preventDefault) aDOMEvent.preventDefault()};
        newEvent.stopPropagation = function(){if(aDOMEvent.stopPropagation) aDOMEvent.stopPropagation()};
        objj_msgSend(self, "_bridgeMouseEvent:", newEvent);
        return;
    }
    else
    {
        if (aDOMEvent.preventDefault)
            aDOMEvent.preventDefault();
        if (aDOMEvent.stopPropagation)
            aDOMEvent.stopPropagation();
    }
}
},["void","DOMEvent"]), new objj_method(sel_getUid("mouseEvent:"), function $CPPlatformWindow__mouseEvent_(self, _cmd, aDOMEvent)
{ with(self)
{
    var type = _overriddenEventType || aDOMEvent.type;
    if (type === "dblclick")
    {
        _overriddenEventType = CPDOMEventMouseDown;
        objj_msgSend(self, "_bridgeMouseEvent:", aDOMEvent);
        _overriddenEventType = CPDOMEventMouseUp;
        objj_msgSend(self, "_bridgeMouseEvent:", aDOMEvent);
        _overriddenEventType = nil;
        return;
    }
    var event,
        location = { x:aDOMEvent.clientX, y:aDOMEvent.clientY },
        timestamp = aDOMEvent.timeStamp ? aDOMEvent.timeStamp : new Date(),
        sourceElement = (aDOMEvent.target || aDOMEvent.srcElement),
        windowNumber = 0,
        modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) |
                        (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) |
                        (aDOMEvent.altKey ? CPAlternateKeyMask : 0) |
                        (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
    StopDOMEventPropagation = YES;
    if (_mouseDownWindow)
        windowNumber = objj_msgSend(_mouseDownWindow, "windowNumber");
    else
    {
        var theWindow = objj_msgSend(self, "hitTest:", location);
        if ((aDOMEvent.type === CPDOMEventMouseDown) && theWindow)
            _mouseDownWindow = theWindow;
        windowNumber = objj_msgSend(theWindow, "windowNumber");
    }
    if (windowNumber)
        location = objj_msgSend(CPApp._windows[windowNumber], "convertPlatformWindowToBase:", location);
    if (type === "mouseup")
    {
        if(_mouseIsDown)
        {
            event = _CPEventFromNativeMouseEvent(aDOMEvent, CPLeftMouseUp, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseUp, timestamp, location), 0);
            _mouseIsDown = NO;
            _lastMouseUp = event;
            _mouseDownWindow = nil;
        }
        if(_DOMEventMode)
        {
            _DOMEventMode = NO;
            return;
        }
    }
    else if (type === "mousedown")
    {
        if (ExcludedDOMElements[sourceElement.tagName] && sourceElement != _DOMFocusElement)
        {
            if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
            {
                _DOMBodyElement.setAttribute("draggable", "false");
                _DOMBodyElement.style["-khtml-user-drag"] = "none";
            }
            _DOMEventMode = YES;
            _mouseIsDown = YES;
            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown, timestamp, location), 0));
            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseUp, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown, timestamp, location), 0));
            return;
        }
        else if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        {
            _DOMBodyElement.setAttribute("draggable", "true");
            _DOMBodyElement.style["-khtml-user-drag"] = "element";
        }
        event = _CPEventFromNativeMouseEvent(aDOMEvent, CPLeftMouseDown, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown, timestamp, location), 0);
        _mouseIsDown = YES;
        _lastMouseDown = event;
    }
    else
    {
        if (_DOMEventMode)
            return;
        event = _CPEventFromNativeMouseEvent(aDOMEvent, _mouseIsDown ? CPLeftMouseDragged : CPMouseMoved, location, modifierFlags, timestamp, windowNumber, nil, -1, 1, 0);
    }
    var isDragging = objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "isDragging");
    if (event && (!isDragging || !supportsNativeDragAndDrop))
    {
        event._DOMEvent = aDOMEvent;
        objj_msgSend(CPApp, "sendEvent:", event);
    }
    if (StopDOMEventPropagation && (!supportsNativeDragAndDrop || type !== "mousedown" && !isDragging))
        CPDOMEventStop(aDOMEvent, self);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
},["void","DOMEvent"]), new objj_method(sel_getUid("layerAtLevel:create:"), function $CPPlatformWindow__layerAtLevel_create_(self, _cmd, aLevel, aFlag)
{ with(self)
{
    var layer = objj_msgSend(_windowLayers, "objectForKey:", aLevel);
    if (!layer && aFlag)
    {
        layer = objj_msgSend(objj_msgSend(CPDOMWindowLayer, "alloc"), "initWithLevel:", aLevel);
        objj_msgSend(_windowLayers, "setObject:forKey:", layer, aLevel);
        var low = 0,
            high = _windowLevels.length - 1,
            middle;
        while (low <= high)
        {
            middle = FLOOR((low + high) / 2);
            if (_windowLevels[middle] > aLevel)
                high = middle - 1;
            else
                low = middle + 1;
        }
        objj_msgSend(_windowLevels, "insertObject:atIndex:", aLevel, _windowLevels[middle] > aLevel ? middle : middle + 1);
        layer._DOMElement.style.zIndex = aLevel;
        _DOMBodyElement.appendChild(layer._DOMElement);
    }
    return layer;
}
},["CPDOMWindowLayer","int","BOOL"]), new objj_method(sel_getUid("order:window:relativeTo:"), function $CPPlatformWindow__order_window_relativeTo_(self, _cmd, aPlace, aWindow, otherWindow)
{ with(self)
{
    var layer = objj_msgSend(self, "layerAtLevel:create:", objj_msgSend(aWindow, "level"), aPlace != CPWindowOut);
    if (aPlace == CPWindowOut)
        return objj_msgSend(layer, "removeWindow:", aWindow);
    objj_msgSend(layer, "insertWindow:atIndex:", aWindow, (otherWindow ? (aPlace == CPWindowAbove ? otherWindow._index + 1 : otherWindow._index) : CPNotFound));
}
},["void","CPWindowOrderingMode","CPWindow","CPWindow"]), new objj_method(sel_getUid("_dragHitTest:pasteboard:"), function $CPPlatformWindow___dragHitTest_pasteboard_(self, _cmd, aPoint, aPasteboard)
{ with(self)
{
    var levels = _windowLevels,
        layers = _windowLayers,
        levelCount = levels.length;
    while (levelCount--)
    {
        if (levels[levelCount] >= CPDraggingWindowLevel)
            continue;
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount--)
        {
            var theWindow = windows[windowCount];
            if (objj_msgSend(theWindow, "_sharesChromeWithPlatformWindow"))
                return objj_msgSend(theWindow, "_dragHitTest:pasteboard:", aPoint, aPasteboard);
            if (objj_msgSend(theWindow, "containsPoint:", aPoint))
                return objj_msgSend(theWindow, "_dragHitTest:pasteboard:", aPoint, aPasteboard);
        }
    }
    return nil;
}
},["id","CPPoint","CPPasteboard"]), new objj_method(sel_getUid("_propagateCurrentDOMEvent:"), function $CPPlatformWindow___propagateCurrentDOMEvent_(self, _cmd, aFlag)
{ with(self)
{
    StopDOMEventPropagation = !aFlag;
}
},["void","BOOL"]), new objj_method(sel_getUid("hitTest:"), function $CPPlatformWindow__hitTest_(self, _cmd, location)
{ with(self)
{if (self._only) return self._only;
    var levels = _windowLevels,
        layers = _windowLayers,
        levelCount = levels.length,
        theWindow = nil;
    while (levelCount-- && !theWindow)
    {
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount-- && !theWindow)
        {
            var candidateWindow = windows[windowCount];
            if (!candidateWindow._ignoresMouseEvents && objj_msgSend(candidateWindow, "containsPoint:", location))
                theWindow = candidateWindow;
        }
    }
    return theWindow;
}
},["CPWindow","CPPoint"]), new objj_method(sel_getUid("_checkPasteboardElement"), function $CPPlatformWindow___checkPasteboardElement(self, _cmd)
{ with(self)
{
    var value = _DOMPasteboardElement.value;
    if (objj_msgSend(value, "length"))
    {
        var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard");
        if (objj_msgSend(pasteboard, "_stateUID") != value)
        {
            objj_msgSend(pasteboard, "declareTypes:owner:", [CPStringPboardType], self);
            objj_msgSend(pasteboard, "setString:forType:", value, CPStringPboardType);
        }
    }
    objj_msgSend(self, "_clearPasteboardElement");
    objj_msgSend(CPApp, "sendEvent:", _pasteboardKeyDownEvent);
    _pasteboardKeyDownEvent = nil;
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
},["void"]), new objj_method(sel_getUid("_clearPasteboardElement"), function $CPPlatformWindow___clearPasteboardElement(self, _cmd)
{ with(self)
{
    _DOMPasteboardElement.value = "";
    _DOMPasteboardElement.blur();
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"), function $CPPlatformWindow__preventCharacterKeysFromPropagating_(self, _cmd, characters)
{ with(self)
{
    for(var i=characters.length; i>0; i--)
        CharacterKeysToPrevent[""+characters[i-1].toLowerCase()] = YES;
}
},["void","CPArray"]), new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"), function $CPPlatformWindow__preventCharacterKeyFromPropagating_(self, _cmd, character)
{ with(self)
{
    CharacterKeysToPrevent[character.toLowerCase()] = YES;
}
},["void","CPString"]), new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"), function $CPPlatformWindow__clearCharacterKeysToPreventFromPropagating(self, _cmd)
{ with(self)
{
    CharacterKeysToPrevent = {};
}
},["void"]), new objj_method(sel_getUid("preventKeyCodesFromPropagating:"), function $CPPlatformWindow__preventKeyCodesFromPropagating_(self, _cmd, keyCodes)
{ with(self)
{
    for(var i=keyCodes.length; i>0; i--)
        KeyCodesToPrevent[keyCodes[i-1]] = YES;
}
},["void","CPArray"]), new objj_method(sel_getUid("preventKeyCodeFromPropagating:"), function $CPPlatformWindow__preventKeyCodeFromPropagating_(self, _cmd, keyCode)
{ with(self)
{
    KeyCodesToPrevent[keyCode] = YES;
}
},["void","CPString"]), new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"), function $CPPlatformWindow__clearKeyCodesToPreventFromPropagating(self, _cmd)
{ with(self)
{
    KeyCodesToPrevent = {};
}
},["void"])]);
}
var CPEventClass = objj_msgSend(CPEvent, "class");
var _CPEventFromNativeMouseEvent = function(aNativeEvent, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure)
{
    aNativeEvent.isa = CPEventClass;
    aNativeEvent._type = anEventType;
    aNativeEvent._location = aPoint;
    aNativeEvent._modifierFlags = modifierFlags;
    aNativeEvent._timestamp = aTimestamp;
    aNativeEvent._windowNumber = aWindowNumber;
    aNativeEvent._window = nil;
    aNativeEvent._context = aGraphicsContext;
    aNativeEvent._eventNumber = anEventNumber;
    aNativeEvent._clickCount = aClickCount;
    aNativeEvent._pressure = aPressure;
    return aNativeEvent;
}
var CLICK_SPACE_DELTA = 5.0,
    CLICK_TIME_DELTA = (typeof document != "undefined" && document.addEventListener) ? 350.0 : 1000.0;
var CPDOMEventGetClickCount = function(aComparisonEvent, aTimestamp, aLocation)
{
    if (!aComparisonEvent)
        return 1;
    var comparisonLocation = objj_msgSend(aComparisonEvent, "locationInWindow");
    return (aTimestamp - objj_msgSend(aComparisonEvent, "timestamp") < CLICK_TIME_DELTA &&
        ABS(comparisonLocation.x - aLocation.x) < CLICK_SPACE_DELTA &&
        ABS(comparisonLocation.y - aLocation.y) < CLICK_SPACE_DELTA) ? objj_msgSend(aComparisonEvent, "clickCount") + 1 : 1;
}
var CPDOMEventStop = function(aDOMEvent, aPlatformWindow)
{
    aDOMEvent.cancelBubble = true;
    aDOMEvent.returnValue = false;
    if (aDOMEvent.preventDefault)
        aDOMEvent.preventDefault();
    if (aDOMEvent.stopPropagation)
        aDOMEvent.stopPropagation();
    if (aDOMEvent.type === CPDOMEventMouseDown)
    {
        aPlatformWindow._DOMFocusElement.focus();
        aPlatformWindow._DOMFocusElement.blur();
    }
}
CPWindowObjectList= function()
{
    var platformWindow = objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"),
        levels = platformWindow._windowLevels,
        layers = platformWindow._windowLayers,
        levelCount = levels.length,
        windowObjects = [];
    while (levelCount--)
    {
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount--)
            windowObjects.push(windows[windowCount]);
    }
    return windowObjects;
}
CPWindowList= function()
{
    var platformWindow = objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"),
        levels = platformWindow._windowLevels,
        layers = platformWindow._windowLayers,
        levelCount = levels.length,
        windowNumbers = [];
    while (levelCount--)
    {
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount--)
            windowNumbers.push(objj_msgSend(windows[windowCount], "windowNumber"));
    }
    return windowNumbers;
}

