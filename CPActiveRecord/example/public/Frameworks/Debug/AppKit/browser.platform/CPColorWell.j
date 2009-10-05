I;21;Foundation/CPString.ji;8;CPView.ji;9;CPColor.ji;14;CPColorPanel.jc;8270;
var _CPColorWellDidBecomeExclusiveNotification = "_CPColorWellDidBecomeExclusiveNotification";
{var the_class = objj_allocateClassPair(CPControl, "CPColorWell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_active"), new objj_ivar("_bordered"), new objj_ivar("_color"), new objj_ivar("_wellView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPColorWell__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _active = NO;
        _bordered = YES;
        _color = objj_msgSend(CPColor, "whiteColor");
        objj_msgSend(self, "drawBezelWithHighlight:", NO);
        objj_msgSend(self, "drawWellInside:", CGRectInset(objj_msgSend(self, "bounds"), 3.0, 3.0));
        objj_msgSend(self, "_registerForNotifications");
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("_registerForNotifications"), function $CPColorWell___registerForNotifications(self, _cmd)
{ with(self)
{
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("colorWellDidBecomeExclusive:"), _CPColorWellDidBecomeExclusiveNotification, nil);
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("colorPanelWillClose:"), CPWindowWillCloseNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
}
},["void"]), new objj_method(sel_getUid("isBordered"), function $CPColorWell__isBordered(self, _cmd)
{ with(self)
{
    return _bordered;
}
},["BOOL"]), new objj_method(sel_getUid("setBordered:"), function $CPColorWell__setBordered_(self, _cmd, bordered)
{ with(self)
{
    if (_bordered == bordered)
        return;
    _bordered = bordered;
    objj_msgSend(self, "drawWellInside:", CGRectInset(objj_msgSend(self, "bounds"), 3.0, 3.0));
}
},["void","BOOL"]), new objj_method(sel_getUid("color"), function $CPColorWell__color(self, _cmd)
{ with(self)
{
    return _color;
}
},["CPColor"]), new objj_method(sel_getUid("setColor:"), function $CPColorWell__setColor_(self, _cmd, aColor)
{ with(self)
{
    if (_color == aColor)
        return;
    _color = aColor;
    objj_msgSend(self, "drawWellInside:", CGRectInset(objj_msgSend(self, "bounds"), 3.0, 3.0));
}
},["void","CPColor"]), new objj_method(sel_getUid("takeColorFrom:"), function $CPColorWell__takeColorFrom_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "setColor:", objj_msgSend(aSender, "color"));
}
},["void","id"]), new objj_method(sel_getUid("activate:"), function $CPColorWell__activate_(self, _cmd, shouldBeExclusive)
{ with(self)
{
    if (shouldBeExclusive)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", _CPColorWellDidBecomeExclusiveNotification, self);
    if (objj_msgSend(self, "isActive"))
        return;
    _active = YES;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("colorPanelDidChangeColor:"), CPColorPanelColorDidChangeNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
}
},["void","BOOL"]), new objj_method(sel_getUid("deactivate"), function $CPColorWell__deactivate(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "isActive"))
        return;
    _active = NO;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPColorPanelColorDidChangeNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
}
},["void"]), new objj_method(sel_getUid("isActive"), function $CPColorWell__isActive(self, _cmd)
{ with(self)
{
    return _active;
}
},["BOOL"]), new objj_method(sel_getUid("drawBezelWithHighlight:"), function $CPColorWell__drawBezelWithHighlight_(self, _cmd, shouldHighlight)
{ with(self)
{
}
},["void","BOOL"]), new objj_method(sel_getUid("drawWellInside:"), function $CPColorWell__drawWellInside_(self, _cmd, aRect)
{ with(self)
{
    if (!_wellView)
    {
        _wellView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aRect);
        objj_msgSend(_wellView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "addSubview:", _wellView);
    }
    else
        objj_msgSend(_wellView, "setFrame:", aRect);
    objj_msgSend(_wellView, "setBackgroundColor:", _color);
}
},["void","CGRect"]), new objj_method(sel_getUid("colorPanelDidChangeColor:"), function $CPColorWell__colorPanelDidChangeColor_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "takeColorFrom:", objj_msgSend(aNotification, "object"));
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
},["void","CPNotification"]), new objj_method(sel_getUid("colorWellDidBecomeExclusive:"), function $CPColorWell__colorWellDidBecomeExclusive_(self, _cmd, aNotification)
{ with(self)
{
    if (self != objj_msgSend(aNotification, "object"))
        objj_msgSend(self, "deactivate");
}
},["void","CPNotification"]), new objj_method(sel_getUid("colorPanelWillClose:"), function $CPColorWell__colorPanelWillClose_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "deactivate");
}
},["void","CPNotification"]), new objj_method(sel_getUid("mouseDown:"), function $CPColorWell__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "drawBezelWithHighlight:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $CPColorWell__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "drawBezelWithHighlight:", CGRectContainsPoint(objj_msgSend(self, "bounds"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)));
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $CPColorWell__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "drawBezelWithHighlight:", NO);
    if (!CGRectContainsPoint(objj_msgSend(self, "bounds"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)))
        return;
    objj_msgSend(self, "activate:", YES);
    var colorPanel = objj_msgSend(CPColorPanel, "sharedColorPanel");
    objj_msgSend(colorPanel, "setColor:", _color);
    objj_msgSend(colorPanel, "orderFront:", self);
}
},["void","CPEvent"])]);
}
var CPColorWellColorKey = "CPColorWellColorKey",
    CPColorWellBorderedKey = "CPColorWellBorderedKey";
{
var the_class = objj_getClass("CPColorWell")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPColorWell\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPColorWell__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _active = NO;
        _bordered = objj_msgSend(aCoder, "decodeObjectForKey:", CPColorWellBorderedKey);
        _color = objj_msgSend(aCoder, "decodeObjectForKey:", CPColorWellColorKey);
        objj_msgSend(self, "drawBezelWithHighlight:", NO);
        objj_msgSend(self, "drawWellInside:", CGRectInset(objj_msgSend(self, "bounds"), 3.0, 3.0));
        objj_msgSend(self, "_registerForNotifications");
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPColorWell__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    var actualSubviews = _subviews;
    _subviews = objj_msgSend(_subviews, "copy");
    objj_msgSend(_subviews, "removeObjectIdenticalTo:", _wellView);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    _subviews = actualSubviews;
    objj_msgSend(aCoder, "encodeObject:forKey:", _color, CPColorWellColorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _bordered, CPColorWellBorderedKey);
}
},["void","CPCoder"])]);
}

