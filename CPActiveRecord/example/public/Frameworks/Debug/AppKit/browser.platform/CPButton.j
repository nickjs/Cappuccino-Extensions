i;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.jc;21935;
CPScaleProportionally = 0;
CPScaleToFit = 1;
CPScaleNone = 2;
CPNoImage = 0;
CPImageOnly = 1;
CPImageLeft = 2;
CPImageRight = 3;
CPImageBelow = 4;
CPImageAbove = 5;
CPImageOverlaps = 6;
CPOnState = 1;
CPOffState = 0;
CPMixedState = -1;
CPRoundedBezelStyle = 1;
CPRegularSquareBezelStyle = 2;
CPThickSquareBezelStyle = 3;
CPThickerSquareBezelStyle = 4;
CPDisclosureBezelStyle = 5;
CPShadowlessSquareBezelStyle = 6;
CPCircularBezelStyle = 7;
CPTexturedSquareBezelStyle = 8;
CPHelpButtonBezelStyle = 9;
CPSmallSquareBezelStyle = 10;
CPTexturedRoundedBezelStyle = 11;
CPRoundRectBezelStyle = 12;
CPRecessedBezelStyle = 13;
CPRoundedDisclosureBezelStyle = 14;
CPHUDBezelStyle = -1;
CPMomentaryLightButton = 0;
CPPushOnPushOffButton = 1;
CPToggleButton = 2;
CPSwitchButton = 3;
CPRadioButton = 4;
CPMomentaryChangeButton = 5;
CPOnOffButton = 6;
CPMomentaryPushInButton = 7;
CPMomentaryPushButton = 0;
CPMomentaryLight = 7;
CPNoButtonMask = 0;
CPContentsButtonMask = 1;
CPPushInButtonMask = 2;
CPGrayButtonMask = 4;
CPBackgroundButtonMask = 8;
CPNoCellMask = CPNoButtonMask;
CPContentsCellMask = CPContentsButtonMask;
CPPushInCellMask = CPPushInButtonMask;
CPChangeGrayCellMask = CPGrayButtonMask;
CPChangeBackgroundCellMask = CPBackgroundButtonMask;
CPButtonStateMixed = CPThemeState("mixed");
{var the_class = objj_allocateClassPair(CPControl, "CPButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_allowsMixedState"), new objj_ivar("_title"), new objj_ivar("_alternateTitle"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_showsStateBy"), new objj_ivar("_highlightsBy"), new objj_ivar("_imageDimsWhenDisabled"), new objj_ivar("_bezelStyle"), new objj_ivar("_controlSize")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setValue:forThemeAttribute:", CPCenterTextAlignment, "alignment");
        objj_msgSend(self, "setValue:forThemeAttribute:", CPCenterVerticalTextAlignment, "vertical-alignment");
        objj_msgSend(self, "setValue:forThemeAttribute:", CPImageLeft, "image-position");
        objj_msgSend(self, "setValue:forThemeAttribute:", CPScaleNone, "image-scaling");
        _controlSize = CPRegularControlSize;
        objj_msgSend(self, "setBordered:", YES);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("allowsMixedState"), function $CPButton__allowsMixedState(self, _cmd)
{ with(self)
{
    return _allowsMixedState;
}
},["BOOL"]), new objj_method(sel_getUid("setAllowsMixedState:"), function $CPButton__setAllowsMixedState_(self, _cmd, aFlag)
{ with(self)
{
    aFlag = !!aFlag;
    if (_allowsMixedState === aFlag)
        return;
    _allowsMixedState = aFlag;
    if (!_allowsMixedState)
        objj_msgSend(self, "unsetThemeState:", CPButtonStateMixed);
}
},["void","BOOL"]), new objj_method(sel_getUid("setObjectValue:"), function $CPButton__setObjectValue_(self, _cmd, anObjectValue)
{ with(self)
{
    if (!anObjectValue || anObjectValue === "" || (objj_msgSend(anObjectValue, "intValue") === 0))
        anObjectValue = CPOffState;
    else if (!objj_msgSend(anObjectValue, "isKindOfClass:", objj_msgSend(CPNumber, "class")))
        anObjectValue = CPOnState;
    else if (anObjectValue > CPOnState)
        anObjectValue = CPOnState
    else if (anObjectValue < CPOffState)
        if (objj_msgSend(self, "allowsMixedState"))
            anObjectValue = CPMixedState;
        else
            anObjectValue = CPOnState;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setObjectValue:", anObjectValue);
    switch (objj_msgSend(self, "objectValue"))
    {
        case CPMixedState: objj_msgSend(self, "unsetThemeState:", CPThemeStateSelected);
                            objj_msgSend(self, "setThemeState:", CPButtonStateMixed);
                            break;
        case CPOnState: objj_msgSend(self, "unsetThemeState:", CPButtonStateMixed);
                            objj_msgSend(self, "setThemeState:", CPThemeStateSelected);
                            break;
        case CPOffState: objj_msgSend(self, "unsetThemeState:", CPThemeStateSelected | CPButtonStateMixed);
    }
}
},["void","id"]), new objj_method(sel_getUid("nextState"), function $CPButton__nextState(self, _cmd)
{ with(self)
{
   if (objj_msgSend(self, "allowsMixedState"))
   {
      var value = objj_msgSend(self, "state");
      return value - ((value === -1) ? -2 : 1);
   }
    return 1 - objj_msgSend(self, "state");
}
},["CPInteger"]), new objj_method(sel_getUid("setNextState"), function $CPButton__setNextState(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setState:", objj_msgSend(self, "nextState"));
}
},["void"]), new objj_method(sel_getUid("setState:"), function $CPButton__setState_(self, _cmd, aState)
{ with(self)
{
    objj_msgSend(self, "setIntValue:", aState);
}
},["void","CPInteger"]), new objj_method(sel_getUid("state"), function $CPButton__state(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "intValue");
}
},["CPInteger"]), new objj_method(sel_getUid("setTitle:"), function $CPButton__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    if (_title === aTitle)
        return;
    _title = aTitle;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPString"]), new objj_method(sel_getUid("title"), function $CPButton__title(self, _cmd)
{ with(self)
{
    return _title;
}
},["CPString"]), new objj_method(sel_getUid("setAlternateTitle:"), function $CPButton__setAlternateTitle_(self, _cmd, aTitle)
{ with(self)
{
    if (_alternateTitle === aTitle)
        return;
    _alternateTitle = aTitle;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPString"]), new objj_method(sel_getUid("alternateTitle"), function $CPButton__alternateTitle(self, _cmd)
{ with(self)
{
    return _alternateTitle;
}
},["CPString"]), new objj_method(sel_getUid("setImage:"), function $CPButton__setImage_(self, _cmd, anImage)
{ with(self)
{
    if (_image === anImage)
        return;
    _image = anImage;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPImage"]), new objj_method(sel_getUid("image"), function $CPButton__image(self, _cmd)
{ with(self)
{
    return _image;
}
},["CPImage"]), new objj_method(sel_getUid("setAlternateImage:"), function $CPButton__setAlternateImage_(self, _cmd, anImage)
{ with(self)
{
    if (_alternateImage === anImage)
        return;
    _alternateImage = anImage;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPButton__alternateImage(self, _cmd)
{ with(self)
{
    return _alternateImage;
}
},["CPImage"]), new objj_method(sel_getUid("setShowsStateBy:"), function $CPButton__setShowsStateBy_(self, _cmd, aMask)
{ with(self)
{
    if (_showsStateBy === aMask)
        return;
    _showsStateBy = aMask;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPInteger"]), new objj_method(sel_getUid("showsStateBy"), function $CPButton__showsStateBy(self, _cmd)
{ with(self)
{
    return _showsStateBy;
}
},["CPInteger"]), new objj_method(sel_getUid("setHighlightsBy:"), function $CPButton__setHighlightsBy_(self, _cmd, aMask)
{ with(self)
{
    if (_highlightsBy === aMask)
        return;
    _highlightsBy = aMask;
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateHighlighted))
    {
        objj_msgSend(self, "setNeedsDisplay:", YES);
        objj_msgSend(self, "setNeedsLayout");
    }
}
},["void","CPInteger"]), new objj_method(sel_getUid("setButtonType:"), function $CPButton__setButtonType_(self, _cmd, aButtonType)
{ with(self)
{
    switch (aButtonType)
    {
        case CPMomentaryLightButton: objj_msgSend(self, "setHighlightsBy:", CPChangeBackgroundCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPNoCellMask);
                                        break;
        case CPMomentaryPushInButton: objj_msgSend(self, "setHighlightsBy:", CPPushInCellMask | CPChangeGrayCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPNoCellMask);
                                        break;
        case CPMomentaryChangeButton: objj_msgSend(self, "setHighlightsBy:", CPContentsCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPNoCellMask);
                                        break;
        case CPPushOnPushOffButton: objj_msgSend(self, "setHighlightsBy:", CPPushInCellMask | CPChangeGrayCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPChangeBackgroundCellMask);
                                        break;
        case CPOnOffButton: objj_msgSend(self, "setHighlightsBy:", CPChangeBackgroundCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPChangeBackgroundCellMask);
                                        break;
        case CPToggleButton: objj_msgSend(self, "setHighlightsBy:", CPPushInCellMask | CPContentsCellMask);
                                        objj_msgSend(self, "setShowsStateBy:", CPContentsCellMask);
                                        break;
        case CPSwitchButton: objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "The CPSwitchButton type is not supported in Cappuccino, use the CPCheckBox class instead.");
        case CPRadioButton: objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "The CPRadioButton type is not supported in Cappuccino, use the CPRadio class instead.");
        default: objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Unknown button type.");
    }
    objj_msgSend(self, "setImageDimsWhenDisabled:", YES);
}
},["void","CPButtonType"]), new objj_method(sel_getUid("setImageDimsWhenDisabled:"), function $CPButton__setImageDimsWhenDisabled_(self, _cmd, imageShouldDimWhenDisabled)
{ with(self)
{
    imageShouldDimWhenDisabled = !!imageShouldDimWhenDisabled;
    if (_imageDimsWhenDisabled === imageShouldDimWhenDisabled)
        return;
    _imageDimsWhenDisabled = imageShouldDimWhenDisabled;
    if (_imageDimsWhenDisabled)
    {
        objj_msgSend(self, "setNeedsDisplay:", YES);
        objj_msgSend(self, "setNeedsLayout");
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("imageDimsWhenDisabled"), function $CPButton__imageDimsWhenDisabled(self, _cmd)
{ with(self)
{
    return _imageDimsWhenDisabled;
}
},["BOOL"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPButton__startTrackingAt_(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "highlight:", YES);
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "startTrackingAt:", aPoint);
}
},["BOOL","CGPoint"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPButton__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{ with(self)
{
    objj_msgSend(self, "highlight:", NO);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "stopTracking:at:mouseIsUp:", lastPoint, aPoint, mouseIsUp);
    if (mouseIsUp && CGRectContainsPoint(objj_msgSend(self, "bounds"), aPoint))
        objj_msgSend(self, "setNextState");
}
},["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("contentRectForBounds:"), function $CPButton__contentRectForBounds_(self, _cmd, bounds)
{ with(self)
{
    var contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset");
    if (((contentInset).top === 0 && (contentInset).right === 0 && (contentInset).bottom === 0 && (contentInset).left === 0))
        return bounds;
    bounds.origin.x += contentInset.left;
    bounds.origin.y += contentInset.top;
    bounds.size.width -= contentInset.left + contentInset.right;
    bounds.size.height -= contentInset.top + contentInset.bottom;
    return bounds;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("bezelRectForBounds:"), function $CPButton__bezelRectForBounds_(self, _cmd, bounds)
{ with(self)
{
    if (!objj_msgSend(self, "isBordered"))
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    var bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset");
    if (((bezelInset).top === 0 && (bezelInset).right === 0 && (bezelInset).bottom === 0 && (bezelInset).left === 0))
        return bounds;
    bounds.origin.x += bezelInset.left;
    bounds.origin.y += bezelInset.top;
    bounds.size.width -= bezelInset.left + bezelInset.right;
    bounds.size.height -= bezelInset.top + bezelInset.bottom;
    return bounds;
}
},["CGRect","CFRect"]), new objj_method(sel_getUid("sizeToFit"), function $CPButton__sizeToFit(self, _cmd)
{ with(self)
{
    var size = objj_msgSend((objj_msgSend(self, "title") || " "), "sizeWithFont:", objj_msgSend(self, "currentValueForThemeAttribute:", "font")),
        contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset"),
        minSize = objj_msgSend(self, "currentValueForThemeAttribute:", "min-size"),
        maxSize = objj_msgSend(self, "currentValueForThemeAttribute:", "max-size");
    size.width = MAX(size.width + contentInset.left + contentInset.right, minSize.width);
    size.height = MAX(size.height + contentInset.top + contentInset.bottom, minSize.height);
    if (maxSize.width >= 0.0)
        size.width = MIN(size.width, maxSize.width);
    if (maxSize.height >= 0.0)
        size.height = MIN(size.height, maxSize.height);
    objj_msgSend(self, "setFrameSize:", size);
}
},["void"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPButton__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
        return objj_msgSend(self, "bezelRectForBounds:", objj_msgSend(self, "bounds"));
    else if (aName === "content-view")
        return objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "rectForEphemeralSubviewNamed:", aName);
}
},["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPButton__createEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
        objj_msgSend(view, "setHitTests:", NO);
        return view;
    }
    else
        return objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "createEphemeralSubviewNamed:", aName);
}
},["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPButton__layoutSubviews(self, _cmd)
{ with(self)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    if (bezelView)
        objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-color"));
    var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    if (contentView)
    {
        objj_msgSend(contentView, "setText:", (objj_msgSend(self, "hasThemeState:", CPThemeStateHighlighted) && _alternateTitle) ? _alternateTitle : _title);
        objj_msgSend(contentView, "setImage:", (objj_msgSend(self, "hasThemeState:", CPThemeStateHighlighted) && _alternateImage) ? _alternateImage : _image);
        objj_msgSend(contentView, "setFont:", objj_msgSend(self, "currentValueForThemeAttribute:", "font"));
        objj_msgSend(contentView, "setTextColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-color"));
        objj_msgSend(contentView, "setAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "alignment"));
        objj_msgSend(contentView, "setVerticalAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "vertical-alignment"));
        objj_msgSend(contentView, "setLineBreakMode:", objj_msgSend(self, "currentValueForThemeAttribute:", "line-break-mode"));
        objj_msgSend(contentView, "setTextShadowColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-shadow-color"));
        objj_msgSend(contentView, "setTextShadowOffset:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-shadow-offset"));
        objj_msgSend(contentView, "setImagePosition:", objj_msgSend(self, "currentValueForThemeAttribute:", "image-position"));
        objj_msgSend(contentView, "setImageScaling:", objj_msgSend(self, "currentValueForThemeAttribute:", "image-scaling"));
    }
}
},["void"]), new objj_method(sel_getUid("setDefaultButton:"), function $CPButton__setDefaultButton_(self, _cmd, shouldBeDefaultButton)
{ with(self)
{
    if (shouldBeDefaultButton)
        objj_msgSend(self, "setThemeState:", CPThemeStateDefault);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateDefault);
}
},["void","BOOL"]), new objj_method(sel_getUid("setBordered:"), function $CPButton__setBordered_(self, _cmd, shouldBeBordered)
{ with(self)
{
    if (shouldBeBordered)
        objj_msgSend(self, "setThemeState:", CPThemeStateBordered);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateBordered);
}
},["void","BOOL"]), new objj_method(sel_getUid("isBordered"), function $CPButton__isBordered(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateBordered);
}
},["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("buttonWithTitle:"), function $CPButton__buttonWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(self, "buttonWithTitle:theme:", aTitle, objj_msgSend(CPTheme, "defaultTheme"));
}
},["id","CPString"]), new objj_method(sel_getUid("buttonWithTitle:theme:"), function $CPButton__buttonWithTitle_theme_(self, _cmd, aTitle, aTheme)
{ with(self)
{
    var button = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    objj_msgSend(button, "setTheme:", aTheme);
    objj_msgSend(button, "setTitle:", aTitle);
    objj_msgSend(button, "sizeToFit");
    return button;
}
},["id","CPString","CPTheme"]), new objj_method(sel_getUid("themeClass"), function $CPButton__themeClass(self, _cmd)
{ with(self)
{
    return "button";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPButton__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [{ top:(0), right:(0), bottom:(0), left:(0) }, { top:(0), right:(0), bottom:(0), left:(0) }, nil], ["bezel-inset", "content-inset", "bezel-color"]);
}
},["id"])]);
}
{
var the_class = objj_getClass("CPButton")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPButton\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setBezelStyle:"), function $CPButton__setBezelStyle_(self, _cmd, aBezelStyle)
{ with(self)
{
}
},["void","unsigned"]), new objj_method(sel_getUid("bezelStyle"), function $CPButton__bezelStyle(self, _cmd)
{ with(self)
{
}
},["unsigned"])]);
}
var CPButtonImageKey = "CPButtonImageKey",
    CPButtonAlternateImageKey = "CPButtonAlternateImageKey",
    CPButtonTitleKey = "CPButtonTitleKey",
    CPButtonAlternateTitleKey = "CPButtonAlternateTitleKey",
    CPButtonIsBorderedKey = "CPButtonIsBorderedKey";
{
var the_class = objj_getClass("CPButton")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPButton\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPButton__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _controlSize = CPRegularControlSize;
        objj_msgSend(self, "setImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonImageKey));
        objj_msgSend(self, "setAlternateImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonAlternateImageKey));
        objj_msgSend(self, "setTitle:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonTitleKey));
        objj_msgSend(self, "setAlternateTitle:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonAlternateTitleKey));
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPButton__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _image, CPButtonImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _alternateImage, CPButtonAlternateImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPButtonTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _alternateTitle, CPButtonAlternateTitleKey);
}
},["void","CPCoder"])]);
}
i;12;CPCheckBox.ji;9;CPRadio.j