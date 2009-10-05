i;15;CPColorPicker.jc;17493;
{var the_class = objj_allocateClassPair(CPColorPicker, "CPSliderColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_redSlider"), new objj_ivar("_greenSlider"), new objj_ivar("_blueSlider"), new objj_ivar("_hueSlider"), new objj_ivar("_saturationSlider"), new objj_ivar("_brightnessSlider"), new objj_ivar("_rgbLabel"), new objj_ivar("_hsbLabel"), new objj_ivar("_redLabel"), new objj_ivar("_greenLabel"), new objj_ivar("_blueLabel"), new objj_ivar("_hueLabel"), new objj_ivar("_saturationLabel"), new objj_ivar("_brightnessLabel"), new objj_ivar("_hexLabel"), new objj_ivar("_redValue"), new objj_ivar("_greenValue"), new objj_ivar("_blueValue"), new objj_ivar("_hueValue"), new objj_ivar("_saturationValue"), new objj_ivar("_brightnessValue"), new objj_ivar("_hexValue")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function $CPSliderColorPicker__initWithPickerMask_colorPanel_(self, _cmd, mask, owningColorPanel)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPicker") }, "initWithPickerMask:colorPanel:", mask,  owningColorPanel);
}
},["id","int","CPColorPanel"]), new objj_method(sel_getUid("initView"), function $CPSliderColorPicker__initView(self, _cmd)
{ with(self)
{
    aFrame = CPRectMake(0, 0, CPColorPickerViewWidth, CPColorPickerViewHeight);
    _contentView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aFrame);
    objj_msgSend(_contentView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    _rgbLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 10, 100, 20));
    objj_msgSend(_rgbLabel, "setStringValue:",  "Red, Green, Blue");
    objj_msgSend(_rgbLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _redLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 35, 15, 20));
    objj_msgSend(_redLabel, "setStringValue:",  "R");
    objj_msgSend(_redLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _redSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 35, aFrame.size.width - 70, 20));
    objj_msgSend(_redSlider, "setMaxValue:",  1.0);
    objj_msgSend(_redSlider, "setMinValue:",  0.0);
    objj_msgSend(_redSlider, "setTarget:",  self);
    objj_msgSend(_redSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_redSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var updateFunction = function(aDOMEvent)
    {
        if(isNaN(this.value))
            return;
        switch(this)
        {
            case _redValue: objj_msgSend(_redSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 255) / 255.0, 0));
                                   break;
            case _greenValue: objj_msgSend(_greenSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 255) / 255.0, 0));
                                   break;
            case _blueValue: objj_msgSend(_blueSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 255) / 255.0, 0));
                                   break;
            case _hueValue: objj_msgSend(_hueSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 360), 0));
                                   break;
            case _saturationValue: objj_msgSend(_saturationSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 100), 0));
                                   break;
            case _brightnessValue: objj_msgSend(_brightnessSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 100), 0));
                                   break;
        }
        this.blur();
    };
    var keypressFunction = function(aDOMEvent)
    {
        aDOMEvent = aDOMEvent || window.event;
        if (aDOMEvent.keyCode == 13)
        {
            updateFunction(aDOMEvent);
            if(aDOMEvent.preventDefault)
                aDOMEvent.preventDefault();
            else if(aDOMEvent.stopPropagation)
                aDOMEvent.stopPropagation();
        }
    }
    var redValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 35, 45, 20));
    objj_msgSend(redValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _redValue = document.createElement("input");
    _redValue.style.width = "40px";
    _redValue.style.backgroundColor = "transparent";
    _redValue.style.border = "1px solid black";
    _redValue.style.color = "black";
    _redValue.style.position = "absolute";
    _redValue.style.top = "0px";
    _redValue.style.left = "0px";
    _redValue.onchange = updateFunction;
    redValue._DOMElement.appendChild(_redValue);
    objj_msgSend(_contentView, "addSubview:",  redValue);
    _greenLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 58, 15, 20));
    objj_msgSend(_greenLabel, "setStringValue:",  "G");
    objj_msgSend(_greenLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _greenSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 58, aFrame.size.width - 70, 20));
    objj_msgSend(_greenSlider, "setMaxValue:",  1.0);
    objj_msgSend(_greenSlider, "setMinValue:",  0.0);
    objj_msgSend(_greenSlider, "setTarget:",  self);
    objj_msgSend(_greenSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_greenSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var greenValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 58, 45, 20));
    objj_msgSend(greenValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _greenValue = _redValue.cloneNode(false);
    _greenValue.onchange = updateFunction;
    greenValue._DOMElement.appendChild(_greenValue);
    objj_msgSend(_contentView, "addSubview:",  greenValue);
    _blueLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 81, 15, 20));
    objj_msgSend(_blueLabel, "setStringValue:",  "B");
    objj_msgSend(_blueLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _blueSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 81, aFrame.size.width - 70, 20));
    objj_msgSend(_blueSlider, "setMaxValue:",  1.0);
    objj_msgSend(_blueSlider, "setMinValue:",  0.0);
    objj_msgSend(_blueSlider, "setTarget:",  self);
    objj_msgSend(_blueSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_blueSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var blueValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 81, 45, 20));
    objj_msgSend(blueValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _blueValue = _redValue.cloneNode(false);
    _blueValue.onchange = updateFunction;
    blueValue._DOMElement.appendChild(_blueValue);
    objj_msgSend(_contentView, "addSubview:",  blueValue);
    _hsbLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 120, 190, 20));
    objj_msgSend(_hsbLabel, "setStringValue:",  "Hue, Saturation, Brightness");
    objj_msgSend(_hsbLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _hueLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 145, 15, 20));
    objj_msgSend(_hueLabel, "setStringValue:",  "H");
    objj_msgSend(_hueLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _hueSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 145, aFrame.size.width - 70, 20));
    objj_msgSend(_hueSlider, "setMaxValue:",  359.0);
    objj_msgSend(_hueSlider, "setMinValue:",  0.0);
    objj_msgSend(_hueSlider, "setTarget:",  self);
    objj_msgSend(_hueSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_hueSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var hueValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 145, 45, 20));
    objj_msgSend(hueValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _hueValue = _redValue.cloneNode(false);
    _hueValue.onchange = updateFunction;
    hueValue._DOMElement.appendChild(_hueValue);
    objj_msgSend(_contentView, "addSubview:",  hueValue);
    _saturationLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 168, 15, 20));
    objj_msgSend(_saturationLabel, "setStringValue:",  "S");
    objj_msgSend(_saturationLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _saturationSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 168, aFrame.size.width - 70, 20));
    objj_msgSend(_saturationSlider, "setMaxValue:",  100.0);
    objj_msgSend(_saturationSlider, "setMinValue:",  0.0);
    objj_msgSend(_saturationSlider, "setTarget:",  self);
    objj_msgSend(_saturationSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_saturationSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var saturationValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 168, 45, 20));
    objj_msgSend(saturationValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _saturationValue = _redValue.cloneNode(false);
    _saturationValue.onchange = updateFunction;
    saturationValue._DOMElement.appendChild(_saturationValue);
    objj_msgSend(_contentView, "addSubview:",  saturationValue);
    _brightnessLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 191, 15, 20));
    objj_msgSend(_brightnessLabel, "setStringValue:",  "B");
    objj_msgSend(_brightnessLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _brightnessSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 191, aFrame.size.width - 70, 20));
    objj_msgSend(_brightnessSlider, "setMaxValue:",  100.0);
    objj_msgSend(_brightnessSlider, "setMinValue:",  0.0);
    objj_msgSend(_brightnessSlider, "setTarget:",  self);
    objj_msgSend(_brightnessSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_brightnessSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var brightnessValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 191, 45, 20));
    objj_msgSend(brightnessValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _brightnessValue = _redValue.cloneNode(false);
    _brightnessValue.onchange = updateFunction;
    brightnessValue._DOMElement.appendChild(_brightnessValue);
    objj_msgSend(_contentView, "addSubview:",  brightnessValue);
    _hexLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 230, 30, 20));
    objj_msgSend(_hexLabel, "setStringValue:",  "Hex");
    objj_msgSend(_hexLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _hexValue = _redValue.cloneNode(false);
    _hexValue.style.top = "228px";
    _hexValue.style.width = "80px";
    _hexValue.style.left = "35px";
    _hexValue.onkeypress = function(aDOMEvent)
    {
        aDOMEvent = aDOMEvent || window.event;
        if (aDOMEvent.keyCode == 13)
        {
            var newColor = objj_msgSend(CPColor, "colorWithHexString:",  this.value);
            if(newColor)
            {
                objj_msgSend(self, "setColor:",  newColor);
                objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:",  newColor);
            }
            if(aDOMEvent.preventDefault)
                aDOMEvent.preventDefault();
            else if(aDOMEvent.stopPropagation)
                aDOMEvent.stopPropagation();
            this.blur();
        }
    };
    _contentView._DOMElement.appendChild(_hexValue);
    objj_msgSend(_contentView, "addSubview:",  _rgbLabel);
    objj_msgSend(_contentView, "addSubview:",  _redLabel);
    objj_msgSend(_contentView, "addSubview:",  _greenLabel);
    objj_msgSend(_contentView, "addSubview:",  _blueLabel);
    objj_msgSend(_contentView, "addSubview:",  _redSlider);
    objj_msgSend(_contentView, "addSubview:",  _greenSlider);
    objj_msgSend(_contentView, "addSubview:",  _blueSlider);
    objj_msgSend(_contentView, "addSubview:",  _hsbLabel);
    objj_msgSend(_contentView, "addSubview:",  _hueLabel);
    objj_msgSend(_contentView, "addSubview:",  _saturationLabel);
    objj_msgSend(_contentView, "addSubview:",  _brightnessLabel);
    objj_msgSend(_contentView, "addSubview:",  _hueSlider);
    objj_msgSend(_contentView, "addSubview:",  _saturationSlider);
    objj_msgSend(_contentView, "addSubview:",  _brightnessSlider);
    objj_msgSend(_contentView, "addSubview:",  _hexLabel);
}
},["id"]), new objj_method(sel_getUid("provideNewView:"), function $CPSliderColorPicker__provideNewView_(self, _cmd, initialRequest)
{ with(self)
{
    if (initialRequest)
        objj_msgSend(self, "initView");
    return _contentView;
}
},["CPView","BOOL"]), new objj_method(sel_getUid("currentMode"), function $CPSliderColorPicker__currentMode(self, _cmd)
{ with(self)
{
    return CPSliderColorPickerMode;
}
},["int"]), new objj_method(sel_getUid("supportsMode:"), function $CPSliderColorPicker__supportsMode_(self, _cmd, mode)
{ with(self)
{
    return (mode == CPSliderColorPickerMode) ? YES : NO;
}
},["BOOL","int"]), new objj_method(sel_getUid("sliderChanged:"), function $CPSliderColorPicker__sliderChanged_(self, _cmd, sender)
{ with(self)
{
    var newColor,
        colorPanel = objj_msgSend(self, "colorPanel"),
        alpha = objj_msgSend(colorPanel, "opacity");
    switch(sender)
    {
        case _hueSlider:
        case _saturationSlider:
        case _brightnessSlider: newColor = objj_msgSend(CPColor, "colorWithHue:saturation:brightness:alpha:",  objj_msgSend(_hueSlider, "floatValue"),  objj_msgSend(_saturationSlider, "floatValue"),  objj_msgSend(_brightnessSlider, "floatValue"),  alpha);
                                        objj_msgSend(self, "updateRGBSliders:",  newColor);
                                        break;
        case _redSlider:
        case _greenSlider:
        case _blueSlider: newColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  objj_msgSend(_redSlider, "floatValue"),  objj_msgSend(_greenSlider, "floatValue"),  objj_msgSend(_blueSlider, "floatValue"),  alpha);
                                        objj_msgSend(self, "updateHSBSliders:",  newColor);
                                        break;
    }
    objj_msgSend(self, "updateLabels");
    objj_msgSend(self, "updateHex:",  newColor);
    objj_msgSend(colorPanel, "setColor:",  newColor);
}
},["void","id"]), new objj_method(sel_getUid("setColor:"), function $CPSliderColorPicker__setColor_(self, _cmd, aColor)
{ with(self)
{
    objj_msgSend(self, "updateRGBSliders:",  aColor);
    objj_msgSend(self, "updateHSBSliders:",  aColor);
    objj_msgSend(self, "updateHex:",  aColor);
    objj_msgSend(self, "updateLabels");
}
},["void","CPColor"]), new objj_method(sel_getUid("updateHSBSliders:"), function $CPSliderColorPicker__updateHSBSliders_(self, _cmd, aColor)
{ with(self)
{
    var hsb = objj_msgSend(aColor, "hsbComponents");
    objj_msgSend(_hueSlider, "setFloatValue:", hsb[0]);
    objj_msgSend(_saturationSlider, "setFloatValue:", hsb[1]);
    objj_msgSend(_brightnessSlider, "setFloatValue:", hsb[2]);
}
},["void","CPColor"]), new objj_method(sel_getUid("updateHex:"), function $CPSliderColorPicker__updateHex_(self, _cmd, aColor)
{ with(self)
{
    _hexValue.value = objj_msgSend(aColor, "hexString");
}
},["void","CPColor"]), new objj_method(sel_getUid("updateRGBSliders:"), function $CPSliderColorPicker__updateRGBSliders_(self, _cmd, aColor)
{ with(self)
{
    var rgb = objj_msgSend(aColor, "components");
    objj_msgSend(_redSlider, "setFloatValue:", rgb[0]);
    objj_msgSend(_greenSlider, "setFloatValue:", rgb[1]);
    objj_msgSend(_blueSlider, "setFloatValue:", rgb[2]);
}
},["void","CPColor"]), new objj_method(sel_getUid("updateLabels"), function $CPSliderColorPicker__updateLabels(self, _cmd)
{ with(self)
{
    _hueValue.value = ROUND(objj_msgSend(_hueSlider, "floatValue"));
    _saturationValue.value = ROUND(objj_msgSend(_saturationSlider, "floatValue"));
    _brightnessValue.value = ROUND(objj_msgSend(_brightnessSlider, "floatValue"));
    _redValue.value = ROUND(objj_msgSend(_redSlider, "floatValue") * 255);
    _greenValue.value = ROUND(objj_msgSend(_greenSlider, "floatValue") * 255);
    _blueValue.value = ROUND(objj_msgSend(_blueSlider, "floatValue") * 255);
}
},["void"]), new objj_method(sel_getUid("provideNewButtonImage"), function $CPSliderColorPicker__provideNewButtonImage(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "slider_button.png"), CGSizeMake(32, 32));
}
},["CPImage"]), new objj_method(sel_getUid("provideNewAlternateButtonImage"), function $CPSliderColorPicker__provideNewAlternateButtonImage(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "slider_button_h.png"), CGSizeMake(32, 32));
}
},["CPImage"])]);
}

