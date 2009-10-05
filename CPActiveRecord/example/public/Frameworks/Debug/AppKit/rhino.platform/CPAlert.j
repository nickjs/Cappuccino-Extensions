I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;22;AppKit/CPApplication.jI;17;AppKit/CPButton.jI;16;AppKit/CPColor.jI;15;AppKit/CPFont.jI;16;AppKit/CPImage.jI;20;AppKit/CPImageView.jI;16;AppKit/CPPanel.jI;20;AppKit/CPTextField.jc;7565;
CPWarningAlertStyle = 0;
CPInformationalAlertStyle = 1;
CPCriticalAlertStyle = 2;
var CPAlertWarningImage,
    CPAlertInformationImage,
    CPAlertErrorImage;
{var the_class = objj_allocateClassPair(CPObject, "CPAlert"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_alertPanel"), new objj_ivar("_messageLabel"), new objj_ivar("_alertImageView"), new objj_ivar("_alertStyle"), new objj_ivar("_windowTitle"), new objj_ivar("_windowStyle"), new objj_ivar("_buttonCount"), new objj_ivar("_buttons"), new objj_ivar("_delegate")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPAlert__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _buttonCount = 0;
        _buttons = objj_msgSend(CPArray, "array");
        _alertStyle = CPWarningAlertStyle;
        _messageLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(57.0, 10.0, 220.0, 80.0));
        objj_msgSend(_messageLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
        objj_msgSend(_messageLabel, "setLineBreakMode:", CPLineBreakByWordWrapping);
        objj_msgSend(_messageLabel, "setAlignment:", CPJustifiedTextAlignment);
        _alertImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(15.0, 12.0, 32.0, 32.0));
        objj_msgSend(self, "setWindowStyle:", nil);
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("setWindowStyle:"), function $CPAlert__setWindowStyle_(self, _cmd, styleMask)
{ with(self)
{
    _windowStyle = styleMask;
    _alertPanel = objj_msgSend(objj_msgSend(CPPanel, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0.0, 0.0, 300.0, 130.0), styleMask ? styleMask | CPTitledWindowMask : CPTitledWindowMask);
    objj_msgSend(_alertPanel, "setFloatingPanel:", YES);
    objj_msgSend(_alertPanel, "center");
    objj_msgSend(_messageLabel, "setTextColor:", (styleMask == CPHUDBackgroundWindowMask) ? objj_msgSend(CPColor, "whiteColor") : objj_msgSend(CPColor, "blackColor"));
    var count = objj_msgSend(_buttons, "count");
    for(var i=0; i < count; i++)
    {
        var button = _buttons[i];
        objj_msgSend(button, "setFrameSize:", CGSizeMake(objj_msgSend(button, "frame").size.width, (styleMask == CPHUDBackgroundWindowMask) ? 20.0 : 24.0));
        objj_msgSend(button, "setBezelStyle:", (styleMask == CPHUDBackgroundWindowMask) ? CPHUDBezelStyle : CPRoundedBezelStyle);
        objj_msgSend(objj_msgSend(_alertPanel, "contentView"), "addSubview:", button);
    }
    objj_msgSend(objj_msgSend(_alertPanel, "contentView"), "addSubview:", _messageLabel);
    objj_msgSend(objj_msgSend(_alertPanel, "contentView"), "addSubview:", _alertImageView);
}
},["void","int"]), new objj_method(sel_getUid("setTitle:"), function $CPAlert__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    _windowTitle = aTitle;
}
},["void","CPString"]), new objj_method(sel_getUid("title"), function $CPAlert__title(self, _cmd)
{ with(self)
{
    return _windowTitle;
}
},["CPString"]), new objj_method(sel_getUid("windowStyle"), function $CPAlert__windowStyle(self, _cmd)
{ with(self)
{
    return _windowStyle;
}
},["int"]), new objj_method(sel_getUid("setDelegate:"), function $CPAlert__setDelegate_(self, _cmd, delegate)
{ with(self)
{
    _delegate = delegate;
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $CPAlert__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["void"]), new objj_method(sel_getUid("setAlertStyle:"), function $CPAlert__setAlertStyle_(self, _cmd, style)
{ with(self)
{
    _alertStyle = style;
}
},["void","CPAlertStyle"]), new objj_method(sel_getUid("alertStyle"), function $CPAlert__alertStyle(self, _cmd)
{ with(self)
{
    return _alertStyle;
}
},["CPAlertStyle"]), new objj_method(sel_getUid("setMessageText:"), function $CPAlert__setMessageText_(self, _cmd, messageText)
{ with(self)
{
    objj_msgSend(_messageLabel, "setStringValue:", messageText);
}
},["void","CPString"]), new objj_method(sel_getUid("messageText"), function $CPAlert__messageText(self, _cmd)
{ with(self)
{
    return objj_msgSend(_messageLabel, "stringValue");
}
},["CPString"]), new objj_method(sel_getUid("addButtonWithTitle:"), function $CPAlert__addButtonWithTitle_(self, _cmd, title)
{ with(self)
{
    var button = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(200.0 - (_buttonCount * 90.0), 98.0, 80.0, (_windowStyle == CPHUDBackgroundWindowMask) ? 20.0 : 24.0));
    objj_msgSend(button, "setTitle:", title);
    objj_msgSend(button, "setTarget:", self);
    objj_msgSend(button, "setTag:", _buttonCount);
    objj_msgSend(button, "setAction:", sel_getUid("_notifyDelegate:"));
    objj_msgSend(button, "setBezelStyle:", (_windowStyle == CPHUDBackgroundWindowMask) ? CPHUDBezelStyle : CPRoundRectBezelStyle);
    objj_msgSend(objj_msgSend(_alertPanel, "contentView"), "addSubview:", button);
    if (_buttonCount == 0)
        objj_msgSend(_alertPanel, "setDefaultButton:", button);
    _buttonCount++;
    objj_msgSend(_buttons, "addObject:", button);
}
},["void","CPString"]), new objj_method(sel_getUid("runModal"), function $CPAlert__runModal(self, _cmd)
{ with(self)
{
    var theTitle;
    switch (_alertStyle)
    {
        case CPWarningAlertStyle: objj_msgSend(_alertImageView, "setImage:", CPAlertWarningImage);
                                        theTitle = "Warning";
                                        break;
        case CPInformationalAlertStyle: objj_msgSend(_alertImageView, "setImage:", CPAlertInformationImage);
                                        theTitle = "Information";
                                        break;
        case CPCriticalAlertStyle: objj_msgSend(_alertImageView, "setImage:", CPAlertErrorImage);
                                        theTitle = "Error";
                                        break;
    }
    objj_msgSend(_alertPanel, "setTitle:", _windowTitle ? _windowTitle : theTitle);
    objj_msgSend(CPApp, "runModalForWindow:", _alertPanel);
}
},["void"]), new objj_method(sel_getUid("_notifyDelegate:"), function $CPAlert___notifyDelegate_(self, _cmd, button)
{ with(self)
{
    if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("alertDidEnd:returnCode:")))
        objj_msgSend(_delegate, "alertDidEnd:returnCode:", self, objj_msgSend(button, "tag"));
    objj_msgSend(CPApp, "abortModal");
    objj_msgSend(_alertPanel, "close");
}
},["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPAlert__initialize(self, _cmd)
{ with(self)
{
    if (self != CPAlert)
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
    CPAlertWarningImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPAlert/dialog-warning.png"), CGSizeMake(32.0, 32.0));
    CPAlertInformationImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPAlert/dialog-information.png"), CGSizeMake(32.0, 32.0));
    CPAlertErrorImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPAlert/dialog-error.png"), CGSizeMake(32.0, 32.0));
}
},["void"])]);
}

