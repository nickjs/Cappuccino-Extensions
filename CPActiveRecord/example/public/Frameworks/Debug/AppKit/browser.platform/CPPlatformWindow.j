I;21;Foundation/CPObject.jc;5682;





var PrimaryPlatformWindow = NULL;

{var the_class = objj_allocateClassPair(CPObject, "CPPlatformWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentRect"), new objj_ivar("_level"), new objj_ivar("_hasShadow"), new objj_ivar("_DOMWindow"), new objj_ivar("_DOMBodyElement"), new objj_ivar("_DOMFocusElement"), new objj_ivar("_windowLevels"), new objj_ivar("_windowLayers"), new objj_ivar("_mouseIsDown"), new objj_ivar("_mouseDownWindow"), new objj_ivar("_lastMouseUp"), new objj_ivar("_lastMouseDown"), new objj_ivar("_charCodes"), new objj_ivar("_keyCode"), new objj_ivar("_DOMEventMode"), new objj_ivar("_DOMPasteboardElement"), new objj_ivar("_pasteboardKeyDownEvent"), new objj_ivar("_overriddenEventType")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:"), function $CPPlatformWindow__initWithContentRect_(self, _cmd, aRect)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _contentRect = { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } };


        _windowLevels = [];
        _windowLayers = objj_msgSend(CPDictionary, "dictionary");

        _charCodes = {};

    }

    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("init"), function $CPPlatformWindow__init(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithContentRect:", { origin: { x:0.0, y:0.0 }, size: { width:400.0, height:500.0 } });
}
},["id"]), new objj_method(sel_getUid("contentRect"), function $CPPlatformWindow__contentRect(self, _cmd)
{ with(self)
{
    return { origin: { x:_contentRect.origin.x, y:_contentRect.origin.y }, size: { width:_contentRect.size.width, height:_contentRect.size.height } };
}
},["CGRect"]), new objj_method(sel_getUid("contentBounds"), function $CPPlatformWindow__contentBounds(self, _cmd)
{ with(self)
{
    var contentBounds = objj_msgSend(self, "contentRect");

    contentBounds.origin = { x:0.0, y:0.0 };

    return contentBounds;
}
},["CGRect"]), new objj_method(sel_getUid("visibleFrame"), function $CPPlatformWindow__visibleFrame(self, _cmd)
{ with(self)
{
    var frame = objj_msgSend(self, "contentBounds");

    frame.origin = CGPointMakeZero();

    if (objj_msgSend(CPMenu, "menuBarVisible"))
    {
        var menuBarHeight = objj_msgSend(objj_msgSend(CPApp, "mainMenu"), "menuBarHeight");

        frame.origin.y += menuBarHeight;
        frame.size.height -= menuBarHeight;
    }

    return frame;
}
},["CGRect"]), new objj_method(sel_getUid("usableContentFrame"), function $CPPlatformWindow__usableContentFrame(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "visibleFrame");
}
},["void"]), new objj_method(sel_getUid("setContentRect:"), function $CPPlatformWindow__setContentRect_(self, _cmd, aRect)
{ with(self)
{
    if (!aRect || ((_contentRect.origin.x == aRect.origin.x && _contentRect.origin.y == aRect.origin.y) && (_contentRect.size.width == aRect.size.width && _contentRect.size.height == aRect.size.height)))
        return;

    _contentRect = { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } };

    objj_msgSend(self, "updateNativeContentRect");
}
},["void","CGRect"]), new objj_method(sel_getUid("updateFromNativeContentRect"), function $CPPlatformWindow__updateFromNativeContentRect(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setContentRect:", objj_msgSend(self, "nativeContentRect"));
}
},["void"]), new objj_method(sel_getUid("convertBaseToScreen:"), function $CPPlatformWindow__convertBaseToScreen_(self, _cmd, aPoint)
{ with(self)
{
    var contentRect = objj_msgSend(self, "contentRect");

    return { x:aPoint.x + (contentRect.origin.x), y:aPoint.y + (contentRect.origin.y) };
}
},["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertScreenToBase:"), function $CPPlatformWindow__convertScreenToBase_(self, _cmd, aPoint)
{ with(self)
{
    var contentRect = objj_msgSend(self, "contentRect");

    return { x:aPoint.x - (contentRect.origin.x), y:aPoint.y - (contentRect.origin.y) };
}
},["CGPoint","CGPoint"]), new objj_method(sel_getUid("isVisible"), function $CPPlatformWindow__isVisible(self, _cmd)
{ with(self)
{

    return _DOMWindow !== NULL;



}
},["BOOL"]), new objj_method(sel_getUid("setLevel:"), function $CPPlatformWindow__setLevel_(self, _cmd, aLevel)
{ with(self)
{
    _level = aLevel;


    if (_DOMWindow && _DOMWindow.cpSetLevel)
        _DOMWindow.cpSetLevel(aLevel);

}
},["void","CPInteger"]), new objj_method(sel_getUid("setHasShadow:"), function $CPPlatformWindow__setHasShadow_(self, _cmd, shouldHaveShadow)
{ with(self)
{
    _hasShadow = shouldHaveShadow;


    if (_DOMWindow && _DOMWindow.cpSetHasShadow)
        _DOMWindow.cpSetHasShadow(shouldHaveShadow);

}
},["void","BOOL"]), new objj_method(sel_getUid("supportsFullPlatformWindows"), function $CPPlatformWindow__supportsFullPlatformWindows(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPPlatform, "isBrowser");
}
},["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("primaryPlatformWindow"), function $CPPlatformWindow__primaryPlatformWindow(self, _cmd)
{ with(self)
{
    return PrimaryPlatformWindow;
}
},["CPPlatformWindow"]), new objj_method(sel_getUid("setPrimaryPlatformWindow:"), function $CPPlatformWindow__setPrimaryPlatformWindow_(self, _cmd, aPlatformWindow)
{ with(self)
{
    PrimaryPlatformWindow = aPlatformWindow;
}
},["void","CPPlatformWindow"])]);
}


i;22;CPPlatformWindow+DOM.j