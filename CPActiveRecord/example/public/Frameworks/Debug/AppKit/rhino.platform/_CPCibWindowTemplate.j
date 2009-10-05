I;21;Foundation/CPObject.jc;6024;


var _CPCibWindowTemplateMinSizeKey = "_CPCibWindowTemplateMinSizeKey",
    _CPCibWindowTemplateMaxSizeKey = "_CPCibWindowTemplateMaxSizeKey",

    _CPCibWindowTemplateViewClassKey = "_CPCibWindowTemplateViewClassKey",
    _CPCibWindowTemplateWindowClassKey = "_CPCibWindowTemplateWindowClassKey",

    _CPCibWindowTemplateWindowRectKey = "_CPCibWindowTemplateWindowRectKey",
    _CPCibWindowTemplateWindowStyleMaskKey = "_CPCibWindowTempatStyleMaskKey",
    _CPCibWindowTemplateWindowTitleKey = "_CPCibWindowTemplateWindowTitleKey",
    _CPCibWindowTemplateWindowViewKey = "_CPCibWindowTemplateWindowViewKey",

    _CPCibWindowTemplateWindowIsFullBridgeKey = "_CPCibWindowTemplateWindowIsFullBridgeKey";

{var the_class = objj_allocateClassPair(CPObject, "_CPCibWindowTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_viewClass"), new objj_ivar("_windowClass"), new objj_ivar("_windowRect"), new objj_ivar("_windowStyleMask"), new objj_ivar("_windowTitle"), new objj_ivar("_windowView"), new objj_ivar("_windowIsFullBridge")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPCibWindowTemplate__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _windowClass = "CPWindow";
        _windowRect = CGRectMake(0.0, 0.0, 400.0, 200.0);
        _windowStyleMask = CPTitledWindowMask | CPClosableWindowMask | CPMiniaturizableWindowMask | CPResizableWindowMask;

        _windowTitle = "Window";
        _windowView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 400.0, 200.0));

        _windowIsFullBridge = NO;
    }

    return self;
}
},["id"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPCibWindowTemplate__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        if (objj_msgSend(aCoder, "containsValueForKey:", _CPCibWindowTemplateMinSizeKey))
            _minSize = objj_msgSend(aCoder, "decodeSizeForKey:", _CPCibWindowTemplateMinSizeKey);
        if (objj_msgSend(aCoder, "containsValueForKey:", _CPCibWindowTemplateMaxSizeKey))
            _maxSize = objj_msgSend(aCoder, "decodeSizeForKey:", _CPCibWindowTemplateMaxSizeKey);

        _viewClass = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateViewClassKey);

        _windowClass = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowClassKey);
        _windowRect = objj_msgSend(aCoder, "decodeRectForKey:", _CPCibWindowTemplateWindowRectKey);
        _windowStyleMask = objj_msgSend(aCoder, "decodeIntForKey:", _CPCibWindowTemplateWindowStyleMaskKey);

        _windowTitle = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowTitleKey);
        _windowView = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowViewKey);

        _windowIsFullBridge = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowIsFullBridgeKey);
    }

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibWindowTemplate__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (_minSize)
        objj_msgSend(aCoder, "encodeSize:forKey:", _minSize, _CPCibWindowTemplateMinSizeKey);
    if (_maxSize)
        objj_msgSend(aCoder, "encodeSize:forKey:", _maxSize, _CPCibWindowTemplateMaxSizeKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _viewClass, _CPCibWindowTemplateViewClassKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _windowClass, _CPCibWindowTemplateWindowClassKey);
    objj_msgSend(aCoder, "encodeRect:forKey:", _windowRect, _CPCibWindowTemplateWindowRectKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _windowStyleMask, _CPCibWindowTemplateWindowStyleMaskKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _windowTitle, _CPCibWindowTemplateWindowTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _windowView, _CPCibWindowTemplateWindowViewKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _windowIsFullBridge, _CPCibWindowTemplateWindowIsFullBridgeKey);
}
},["void","CPCoder"]), new objj_method(sel_getUid("customClassName"), function $_CPCibWindowTemplate__customClassName(self, _cmd)
{ with(self)
{
    return _windowClass;
}
},["CPString"]), new objj_method(sel_getUid("setCustomClassName:"), function $_CPCibWindowTemplate__setCustomClassName_(self, _cmd, aClassName)
{ with(self)
{
    _windowClass = aClassName;
}
},["void","CPString"]), new objj_method(sel_getUid("windowClass"), function $_CPCibWindowTemplate__windowClass(self, _cmd)
{ with(self)
{
    return _windowClass;
}
},["CPString"]), new objj_method(sel_getUid("_cibInstantiate"), function $_CPCibWindowTemplate___cibInstantiate(self, _cmd)
{ with(self)
{
    var windowClass = CPClassFromString(objj_msgSend(self, "windowClass"));





    var theWindow = objj_msgSend(objj_msgSend(windowClass, "alloc"), "initWithContentRect:styleMask:", _windowRect, _windowStyleMask);

    if (_minSize)
        objj_msgSend(theWindow, "setMinSize:", _minSize);
    if (_maxSize)
        objj_msgSend(theWindow, "setMaxSize:", _maxSize);
    objj_msgSend(theWindow, "setLevel:", CPFloatingWindowLevel);


    objj_msgSend(theWindow, "setTitle:", _windowTitle);


    objj_msgSend(_windowView, "setAutoresizesSubviews:", NO);

    objj_msgSend(theWindow, "setContentView:", _windowView);

    objj_msgSend(_windowView, "setAutoresizesSubviews:", YES);

    if (objj_msgSend(_viewClass, "isKindOfClass:", objj_msgSend(CPToolbar, "class")))
    {
       objj_msgSend(theWindow, "setToolbar:", _viewClass);
    }

    objj_msgSend(theWindow, "setFullBridge:", _windowIsFullBridge);

    return theWindow;
}
},["id"])]);
}

