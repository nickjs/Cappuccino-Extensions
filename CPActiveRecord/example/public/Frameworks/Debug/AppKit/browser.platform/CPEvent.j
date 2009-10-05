I;21;Foundation/CPObject.jc;13230;
CPLeftMouseDown = 1;
CPLeftMouseUp = 2;
CPRightMouseDown = 3;
CPRightMouseUp = 4;
CPMouseMoved = 5;
CPLeftMouseDragged = 6;
CPRightMouseDragged = 7;
CPMouseEntered = 8;
CPMouseExited = 9;
CPKeyDown = 10;
CPKeyUp = 11;
CPFlagsChanged = 12;
CPAppKitDefined = 13;
CPSystemDefined = 14;
CPApplicationDefined = 15;
CPPeriodic = 16;
CPCursorUpdate = 17;
CPScrollWheel = 22;
CPOtherMouseDown = 25;
CPOtherMouseUp = 26;
CPOtherMouseDragged = 27;
CPTouchStart = 28;
CPTouchMove = 29;
CPTouchEnd = 30;
CPTouchCancel = 31;
CPAlphaShiftKeyMask = 1 << 16;
CPShiftKeyMask = 1 << 17;
CPControlKeyMask = 1 << 18;
CPAlternateKeyMask = 1 << 19;
CPCommandKeyMask = 1 << 20;
CPNumericPadKeyMask = 1 << 21;
CPHelpKeyMask = 1 << 22;
CPFunctionKeyMask = 1 << 23;
CPDeviceIndependentModifierFlagsMask = 0xffff0000;
CPLeftMouseDownMask = 1 << CPLeftMouseDown;
CPLeftMouseUpMask = 1 << CPLeftMouseUp;
CPRightMouseDownMask = 1 << CPRightMouseDown;
CPRightMouseUpMask = 1 << CPRightMouseUp;
CPOtherMouseDownMask = 1 << CPOtherMouseDown;
CPOtherMouseUpMask = 1 << CPOtherMouseUp;
CPMouseMovedMask = 1 << CPMouseMoved;
CPLeftMouseDraggedMask = 1 << CPLeftMouseDragged;
CPRightMouseDraggedMask = 1 << CPRightMouseDragged;
CPOtherMouseDragged = 1 << CPOtherMouseDragged;
CPMouseEnteredMask = 1 << CPMouseEntered;
CPMouseExitedMask = 1 << CPMouseExited;
CPCursorUpdateMask = 1 << CPCursorUpdate;
CPKeyDownMask = 1 << CPKeyDown;
CPKeyUpMask = 1 << CPKeyUp;
CPFlagsChangedMask = 1 << CPFlagsChanged;
CPAppKitDefinedMask = 1 << CPAppKitDefined;
CPSystemDefinedMask = 1 << CPSystemDefined;
CPApplicationDefinedMask = 1 << CPApplicationDefined;
CPPeriodicMask = 1 << CPPeriodic;
CPScrollWheelMask = 1 << CPScrollWheel;
CPAnyEventMask = 0xffffffff;
CPDOMEventDoubleClick = "dblclick",
CPDOMEventMouseDown = "mousedown",
CPDOMEventMouseUp = "mouseup",
CPDOMEventMouseMoved = "mousemove",
CPDOMEventMouseDragged = "mousedrag",
CPDOMEventKeyUp = "keyup",
CPDOMEventKeyDown = "keydown",
CPDOMEventKeyPress = "keypress";
CPDOMEventCopy = "copy";
CPDOMEventPaste = "paste";
CPDOMEventScrollWheel = "mousewheel";
CPDOMEventTouchStart = "touchstart";
CPDOMEventTouchMove = "touchmove";
CPDOMEventTouchEnd = "touchend";
CPDOMEventTouchCancel = "touchcancel";
var _CPEventPeriodicEventPeriod = 0,
    _CPEventPeriodicEventTimer = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPEvent"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_type"), new objj_ivar("_location"), new objj_ivar("_modifierFlags"), new objj_ivar("_timestamp"), new objj_ivar("_context"), new objj_ivar("_eventNumber"), new objj_ivar("_clickCount"), new objj_ivar("_pressure"), new objj_ivar("_window"), new objj_ivar("_windowNumber"), new objj_ivar("_characters"), new objj_ivar("_isARepeat"), new objj_ivar("_keyCode"), new objj_ivar("_DOMEvent"), new objj_ivar("_deltaX"), new objj_ivar("_deltaY"), new objj_ivar("_deltaZ")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"), function $CPEvent___initMouseEventWithType_location_modifierFlags_timestamp_windowNumber_context_eventNumber_clickCount_pressure_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _type = anEventType;
        _location = CPPointCreateCopy(aPoint);
        _modifierFlags = modifierFlags;
        _timestamp = aTimestamp;
        _context = aGraphicsContext;
        _eventNumber = anEventNumber;
        _clickCount = aClickCount;
        _pressure = aPressure;
        _window = objj_msgSend(CPApp, "windowWithWindowNumber:", aWindowNumber);
    }
    return self;
}
},["id","CPEventType","CPPoint","unsigned","CPTimeInterval","int","CPGraphicsContext","int","int","float"]), new objj_method(sel_getUid("_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"), function $CPEvent___initKeyEventWithType_location_modifierFlags_timestamp_windowNumber_context_characters_charactersIgnoringModifiers_isARepeat_keyCode_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, isARepeat, code)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _type = anEventType;
        _location = CPPointCreateCopy(aPoint);
        _modifierFlags = modifierFlags;
        _timestamp = aTimestamp;
        _context = aGraphicsContext;
        _characters = characters;
        _charactersIgnoringModifiers = unmodCharacters;
        _isARepeat = isARepeat;
        _keyCode = code;
        _windowNumber = aWindowNumber;
    }
    return self;
}
},["id","CPEventType","CPPoint","unsignedint","CPTimeInterval","int","CPGraphicsContext","CPString","CPString","BOOL","unsignedshort"]), new objj_method(sel_getUid("_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"), function $CPEvent___initOtherEventWithType_location_modifierFlags_timestamp_windowNumber_context_subtype_data1_data2_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _type = anEventType;
        _location = CPPointCreateCopy(aPoint);
        _modifierFlags = modifierFlags;
        _timestamp = aTimestamp;
        _context = aGraphicsContext;
        _subtype = aSubtype;
        _data1 = aData1;
        _data2 = aData2;
    }
    return self;
}
},["id","CPEventType","CGPoint","unsigned","CPTimeInterval","int","CPGraphicsContext","short","int","int"]), new objj_method(sel_getUid("locationInWindow"), function $CPEvent__locationInWindow(self, _cmd)
{ with(self)
{
    return { x:_location.x, y:_location.y };
}
},["CGPoint"]), new objj_method(sel_getUid("modifierFlags"), function $CPEvent__modifierFlags(self, _cmd)
{ with(self)
{
    return _modifierFlags;
}
},["unsigned"]), new objj_method(sel_getUid("timestamp"), function $CPEvent__timestamp(self, _cmd)
{ with(self)
{
    return _timestamp;
}
},["CPTimeInterval"]), new objj_method(sel_getUid("type"), function $CPEvent__type(self, _cmd)
{ with(self)
{
    return _type;
}
},["CPEventType"]), new objj_method(sel_getUid("window"), function $CPEvent__window(self, _cmd)
{ with(self)
{
    if (!_window)
        _window = objj_msgSend(CPApp, "windowWithWindowNumber:", _windowNumber);
    return _window;
}
},["CPWindow"]), new objj_method(sel_getUid("windowNumber"), function $CPEvent__windowNumber(self, _cmd)
{ with(self)
{
    return _windowNumber;
}
},["int"]), new objj_method(sel_getUid("buttonNumber"), function $CPEvent__buttonNumber(self, _cmd)
{ with(self)
{
    return _buttonNumber;
}
},["int"]), new objj_method(sel_getUid("clickCount"), function $CPEvent__clickCount(self, _cmd)
{ with(self)
{
    return _clickCount;
}
},["int"]), new objj_method(sel_getUid("characters"), function $CPEvent__characters(self, _cmd)
{ with(self)
{
    return _characters;
}
},["CPString"]), new objj_method(sel_getUid("charactersIgnoringModifiers"), function $CPEvent__charactersIgnoringModifiers(self, _cmd)
{ with(self)
{
    return _charactersIgnoringModifiers;
}
},["CPString"]), new objj_method(sel_getUid("isARepeat"), function $CPEvent__isARepeat(self, _cmd)
{ with(self)
{
    return _isARepeat;
}
},["BOOL"]), new objj_method(sel_getUid("keyCode"), function $CPEvent__keyCode(self, _cmd)
{ with(self)
{
    return _keyCode;
}
},["unsignedshort"]), new objj_method(sel_getUid("pressure"), function $CPEvent__pressure(self, _cmd)
{ with(self)
{
    return _pressure;
}
},["float"]), new objj_method(sel_getUid("_DOMEvent"), function $CPEvent___DOMEvent(self, _cmd)
{ with(self)
{
    return _DOMEvent;
}
},["DOMEvent"]), new objj_method(sel_getUid("deltaX"), function $CPEvent__deltaX(self, _cmd)
{ with(self)
{
    return _deltaX;
}
},["float"]), new objj_method(sel_getUid("deltaY"), function $CPEvent__deltaY(self, _cmd)
{ with(self)
{
    return _deltaY;
}
},["float"]), new objj_method(sel_getUid("deltaZ"), function $CPEvent__deltaZ(self, _cmd)
{ with(self)
{
    return _deltaZ;
}
},["float"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"), function $CPEvent__keyEventWithType_location_modifierFlags_timestamp_windowNumber_context_characters_charactersIgnoringModifiers_isARepeat_keyCode_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, repeatKey, code)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, repeatKey, code);
}
},["CPEvent","CPEventType","CGPoint","unsignedint","CPTimeInterval","int","CPGraphicsContext","CPString","CPString","BOOL","unsignedshort"]), new objj_method(sel_getUid("mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"), function $CPEvent__mouseEventWithType_location_modifierFlags_timestamp_windowNumber_context_eventNumber_clickCount_pressure_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure);
}
},["id","CPEventType","CGPoint","unsigned","CPTimeInterval","int","CPGraphicsContext","int","int","float"]), new objj_method(sel_getUid("otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"), function $CPEvent__otherEventWithType_location_modifierFlags_timestamp_windowNumber_context_subtype_data1_data2_(self, _cmd, anEventType, aLocation, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:", anEventType, aLocation, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2);
}
},["CPEvent","CPEventType","CGPoint","unsigned","CPTimeInterval","int","CPGraphicsContext","short","int","int"]), new objj_method(sel_getUid("mouseLocation"), function $CPEvent__mouseLocation(self, _cmd)
{ with(self)
{
    var event = objj_msgSend(CPApp, "currentEvent"),
        eventWindow = objj_msgSend(event, "window");
    if (eventWindow)
        return objj_msgSend(eventWindow, "convertBaseToGlobal:", objj_msgSend(event, "locationInWindow"));
    return objj_msgSend(event, "locationInWindow");
}
},["CGPoint"]), new objj_method(sel_getUid("startPeriodicEventsAfterDelay:withPeriod:"), function $CPEvent__startPeriodicEventsAfterDelay_withPeriod_(self, _cmd, aDelay, aPeriod)
{ with(self)
{
    _CPEventPeriodicEventPeriod = aPeriod;
    _CPEventPeriodicEventTimer = window.setTimeout(function() { _CPEventPeriodicEventTimer = window.setInterval(_CPEventFirePeriodEvent, aPeriod * 1000.0); }, aDelay * 1000.0);
}
},["void","CPTimeInterval","CPTimeInterval"]), new objj_method(sel_getUid("stopPeriodicEvents"), function $CPEvent__stopPeriodicEvents(self, _cmd)
{ with(self)
{
    if (_CPEventPeriodicEventTimer === nil)
        return;
    window.clearTimeout(_CPEventPeriodicEventTimer);
    _CPEventPeriodicEventTimer = nil;
}
},["void"])]);
}
_CPEventFirePeriodEvent= function()
{
    objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:", CPPeriodic, { x:0.0, y:0.0 }, 0, 0, 0, nil, 0, 0, 0));
}
var CPEventClass = objj_msgSend(CPEvent, "class");
_CPEventFromNativeMouseEvent= function(aNativeEvent, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure)
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

