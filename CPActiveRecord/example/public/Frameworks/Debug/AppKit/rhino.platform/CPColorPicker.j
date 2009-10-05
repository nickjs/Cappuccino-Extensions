I;21;Foundation/CPObject.ji;14;CPColorPanel.jc;13708;
{var the_class = objj_allocateClassPair(CPObject, "CPColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_panel"), new objj_ivar("_mask")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function $CPColorPicker__initWithPickerMask_colorPanel_(self, _cmd, aMask, aPanel)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _panel = aPanel;
    _mask = aMask;
    return self;
}
},["id","int","CPColorPanel"]), new objj_method(sel_getUid("colorPanel"), function $CPColorPicker__colorPanel(self, _cmd)
{ with(self)
{
    return _panel;
}
},["CPColorPanel"]), new objj_method(sel_getUid("provideNewButtonImage"), function $CPColorPicker__provideNewButtonImage(self, _cmd)
{ with(self)
{
    return nil;
}
},["CPImage"]), new objj_method(sel_getUid("setMode:"), function $CPColorPicker__setMode_(self, _cmd, mode)
{ with(self)
{
    return;
}
},["void","CPColorPanelMode"]), new objj_method(sel_getUid("setColor:"), function $CPColorPicker__setColor_(self, _cmd, aColor)
{ with(self)
{
    return;
}
},["void","CPColor"])]);
}
{var the_class = objj_allocateClassPair(CPColorPicker, "CPColorWheelColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_pickerView"), new objj_ivar("_brightnessSlider"), new objj_ivar("_hueSaturationView"), new objj_ivar("_cachedColor")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function $CPColorWheelColorPicker__initWithPickerMask_colorPanel_(self, _cmd, mask, owningColorPanel)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPicker") }, "initWithPickerMask:colorPanel:", mask,  owningColorPanel);
}
},["id","int","CPColorPanel"]), new objj_method(sel_getUid("initView"), function $CPColorWheelColorPicker__initView(self, _cmd)
{ with(self)
{
    aFrame = CPRectMake(0, 0, CPColorPickerViewWidth, CPColorPickerViewHeight);
    _pickerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aFrame);
    objj_msgSend(_pickerView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    _brightnessSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(0, (aFrame.size.height - 34), aFrame.size.width, 15));
    objj_msgSend(_brightnessSlider, "setValue:forThemeAttribute:", 15.0, "track-width");
    objj_msgSend(_brightnessSlider, "setValue:forThemeAttribute:", objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPColorPicker, "class")), "pathForResource:", "brightness_bar.png"))), "track-color");
    objj_msgSend(_brightnessSlider, "setMinValue:", 0.0);
    objj_msgSend(_brightnessSlider, "setMaxValue:", 100.0);
    objj_msgSend(_brightnessSlider, "setFloatValue:", 100.0);
    objj_msgSend(_brightnessSlider, "setTarget:", self);
    objj_msgSend(_brightnessSlider, "setAction:", sel_getUid("brightnessSliderDidChange:"));
    objj_msgSend(_brightnessSlider, "setAutoresizingMask:", CPViewWidthSizable | CPViewMinYMargin);
    _hueSaturationView = objj_msgSend(objj_msgSend(__CPColorWheel, "alloc"), "initWithFrame:",  CPRectMake(0, 0, aFrame.size.width, aFrame.size.height - 38));
    objj_msgSend(_hueSaturationView, "setDelegate:",  self);
    objj_msgSend(_hueSaturationView, "setAutoresizingMask:",  (CPViewWidthSizable | CPViewHeightSizable));
    objj_msgSend(_pickerView, "addSubview:", _hueSaturationView);
    objj_msgSend(_pickerView, "addSubview:", _brightnessSlider);
}
},["id"]), new objj_method(sel_getUid("brightnessSliderDidChange:"), function $CPColorWheelColorPicker__brightnessSliderDidChange_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "updateColor");
}
},["void","id"]), new objj_method(sel_getUid("colorWheelDidChange:"), function $CPColorWheelColorPicker__colorWheelDidChange_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "updateColor");
}
},["void","id"]), new objj_method(sel_getUid("updateColor"), function $CPColorWheelColorPicker__updateColor(self, _cmd)
{ with(self)
{
    var hue = objj_msgSend(_hueSaturationView, "angle"),
        saturation = objj_msgSend(_hueSaturationView, "distance"),
        brightness = objj_msgSend(_brightnessSlider, "floatValue");
    objj_msgSend(_hueSaturationView, "setWheelBrightness:", brightness / 100.0);
    objj_msgSend(_brightnessSlider, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHue:saturation:brightness:", hue, saturation, 100));
    var colorPanel = objj_msgSend(self, "colorPanel"),
        opacity = objj_msgSend(colorPanel, "opacity");
    _cachedColor = objj_msgSend(CPColor, "colorWithHue:saturation:brightness:alpha:", hue, saturation, brightness, opacity);
    objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:", _cachedColor);
}
},["void"]), new objj_method(sel_getUid("supportsMode:"), function $CPColorWheelColorPicker__supportsMode_(self, _cmd, mode)
{ with(self)
{
    return (mode == CPWheelColorPickerMode) ? YES : NO;
}
},["BOOL","int"]), new objj_method(sel_getUid("currentMode"), function $CPColorWheelColorPicker__currentMode(self, _cmd)
{ with(self)
{
    return CPWheelColorPickerMode;
}
},["int"]), new objj_method(sel_getUid("provideNewView:"), function $CPColorWheelColorPicker__provideNewView_(self, _cmd, initialRequest)
{ with(self)
{
    if (initialRequest)
        objj_msgSend(self, "initView");
    return _pickerView;
}
},["CPView","BOOL"]), new objj_method(sel_getUid("setColor:"), function $CPColorWheelColorPicker__setColor_(self, _cmd, newColor)
{ with(self)
{
    if (objj_msgSend(newColor, "isEqual:", _cachedColor))
        return;
    var hsb = objj_msgSend(newColor, "hsbComponents");
    objj_msgSend(_hueSaturationView, "setPositionToColor:", newColor);
    objj_msgSend(_brightnessSlider, "setFloatValue:", hsb[2]);
    objj_msgSend(_hueSaturationView, "setWheelBrightness:", hsb[2] / 100.0);
    objj_msgSend(_brightnessSlider, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHue:saturation:brightness:", hsb[0], hsb[1], 100));
}
},["void","CPColor"]), new objj_method(sel_getUid("provideNewButtonImage"), function $CPColorWheelColorPicker__provideNewButtonImage(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel_button.png"), CGSizeMake(32, 32));
}
},["CPImage"]), new objj_method(sel_getUid("provideNewAlternateButtonImage"), function $CPColorWheelColorPicker__provideNewAlternateButtonImage(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel_button_h.png"), CGSizeMake(32, 32));
}
},["CPImage"])]);
}
{var the_class = objj_allocateClassPair(CPView, "__CPColorWheel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_wheelImage"), new objj_ivar("_blackWheelImage"), new objj_ivar("_crosshair"), new objj_ivar("_delegate"), new objj_ivar("_angle"), new objj_ivar("_distance"), new objj_ivar("_radius")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $__CPColorWheel__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    var path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel.png");
    _wheelImage = new Image();
    _wheelImage.src = path;
    _wheelImage.style.position = "absolute";
    path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel_black.png");
    _blackWheelImage = new Image();
    _blackWheelImage.src = path;
    _blackWheelImage.style.opacity = "0";
    _blackWheelImage.style.filter = "alpha(opacity=0)"
    _blackWheelImage.style.position = "absolute";
    _DOMElement.appendChild(_wheelImage);
    _DOMElement.appendChild(_blackWheelImage);
    objj_msgSend(self, "setWheelSize:", aFrame.size);
    _crosshair = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(_radius - 2, _radius - 2, 4, 4));
    objj_msgSend(_crosshair, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(_crosshair, "bounds"), 1.0, 1.0));
    objj_msgSend(view, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(_crosshair, "addSubview:", view);
    objj_msgSend(self, "addSubview:", _crosshair);
    return self;
}
},["id","CPRect"]), new objj_method(sel_getUid("setWheelBrightness:"), function $__CPColorWheel__setWheelBrightness_(self, _cmd, brightness)
{ with(self)
{
    _blackWheelImage.style.opacity = 1.0 - brightness;
    _blackWheelImage.style.filter = "alpha(opacity=" + (1.0 - brightness)*100 + ")"
}
},["void","float"]), new objj_method(sel_getUid("setFrameSize:"), function $__CPColorWheel__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "setWheelSize:", aSize);
}
},["void","CPSize"]), new objj_method(sel_getUid("setWheelSize:"), function $__CPColorWheel__setWheelSize_(self, _cmd, aSize)
{ with(self)
{
    var min = MIN(aSize.width, aSize.height);
    _blackWheelImage.style.width = min;
    _blackWheelImage.style.height = min;
    _blackWheelImage.width = min;
    _blackWheelImage.height = min;
    _blackWheelImage.style.top = (aSize.height - min) / 2.0 + "px";
    _blackWheelImage.style.left = (aSize.width - min) / 2.0 + "px";
    _wheelImage.style.width = min;
    _wheelImage.style.height = min;
    _wheelImage.width = min;
    _wheelImage.height = min;
    _wheelImage.style.top = (aSize.height - min) / 2.0 + "px";
    _wheelImage.style.left = (aSize.width - min) / 2.0 + "px";
    _radius = min / 2.0;
    objj_msgSend(self, "setAngle:distance:", objj_msgSend(self, "degreesToRadians:", _angle), (_distance / 100.0) * _radius);
}
},["void","CPSize"]), new objj_method(sel_getUid("setDelegate:"), function $__CPColorWheel__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $__CPColorWheel__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("angle"), function $__CPColorWheel__angle(self, _cmd)
{ with(self)
{
    return _angle;
}
},["float"]), new objj_method(sel_getUid("distance"), function $__CPColorWheel__distance(self, _cmd)
{ with(self)
{
    return _distance;
}
},["float"]), new objj_method(sel_getUid("mouseDown:"), function $__CPColorWheel__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "reposition:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $__CPColorWheel__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "reposition:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("reposition:"), function $__CPColorWheel__reposition_(self, _cmd, anEvent)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    var midX = CGRectGetMidX(bounds);
    var midY = CGRectGetMidY(bounds);
    var distance = MIN(SQRT((location.x - midX)*(location.x - midX) + (location.y - midY)*(location.y - midY)), _radius);
    var angle = ATAN2(location.y - midY, location.x - midX);
    objj_msgSend(self, "setAngle:distance:", angle, distance);
    objj_msgSend(_delegate, "colorWheelDidChange:", self);
}
},["void","CPEvent"]), new objj_method(sel_getUid("setAngle:distance:"), function $__CPColorWheel__setAngle_distance_(self, _cmd, angle, distance)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    var midX = CGRectGetMidX(bounds);
    var midY = CGRectGetMidY(bounds);
    _angle = objj_msgSend(self, "radiansToDegrees:", angle);
    _distance = (distance / _radius) * 100.0;
    objj_msgSend(_crosshair, "setFrameOrigin:", CPPointMake(COS(angle) * distance + midX - 2.0, SIN(angle) * distance + midY - 2.0));
}
},["void","int","float"]), new objj_method(sel_getUid("setPositionToColor:"), function $__CPColorWheel__setPositionToColor_(self, _cmd, aColor)
{ with(self)
{
    var hsb = objj_msgSend(aColor, "hsbComponents"),
        bounds = objj_msgSend(self, "bounds");
    var angle = objj_msgSend(self, "degreesToRadians:", hsb[0]),
        distance = (hsb[1] / 100.0) * _radius;
    objj_msgSend(self, "setAngle:distance:", angle, distance);
}
},["void","CPColor"]), new objj_method(sel_getUid("radiansToDegrees:"), function $__CPColorWheel__radiansToDegrees_(self, _cmd, radians)
{ with(self)
{
    return ((-radians / PI) * 180 + 360) % 360;
}
},["int","float"]), new objj_method(sel_getUid("degreesToRadians:"), function $__CPColorWheel__degreesToRadians_(self, _cmd, degrees)
{ with(self)
{
    return -(((degrees - 360) / 180) * PI);
}
},["float","float"])]);
}

