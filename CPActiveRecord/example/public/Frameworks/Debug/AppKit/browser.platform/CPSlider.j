i;11;CPControl.jc;16337;
CPLinearSlider = 0;
CPCircularSlider = 1;
{var the_class = objj_allocateClassPair(CPControl, "CPSlider"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_altIncrementValue"), new objj_ivar("_isVertical")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPSlider__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _minValue = 0.0;
        _maxValue = 100.0;
        objj_msgSend(self, "setObjectValue:", 50.0);
        objj_msgSend(self, "setContinuous:", YES);
        objj_msgSend(self, "_recalculateIsVertical");
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setMinValue:"), function $CPSlider__setMinValue_(self, _cmd, aMinimumValue)
{ with(self)
{
    if (_minValue === aMinimumValue)
        return;
    _minValue = aMinimumValue;
    var doubleValue = objj_msgSend(self, "doubleValue");
    if (doubleValue < _minValue)
        objj_msgSend(self, "setDoubleValue:", _minValue);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","float"]), new objj_method(sel_getUid("minValue"), function $CPSlider__minValue(self, _cmd)
{ with(self)
{
    return _minValue;
}
},["float"]), new objj_method(sel_getUid("setMaxValue:"), function $CPSlider__setMaxValue_(self, _cmd, aMaximumValue)
{ with(self)
{
    if (_maxValue === aMaximumValue)
        return;
    _maxValue = aMaximumValue;
    var doubleValue = objj_msgSend(self, "doubleValue");
    if (doubleValue > _maxValue)
        objj_msgSend(self, "setDoubleValue:", _maxValue);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","float"]), new objj_method(sel_getUid("maxValue"), function $CPSlider__maxValue(self, _cmd)
{ with(self)
{
    return _maxValue;
}
},["float"]), new objj_method(sel_getUid("setObjectValue:"), function $CPSlider__setObjectValue_(self, _cmd, aValue)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setObjectValue:", MIN(MAX(aValue, _minValue), _maxValue));
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","id"]), new objj_method(sel_getUid("setSliderType:"), function $CPSlider__setSliderType_(self, _cmd, aSliderType)
{ with(self)
{
    if (aSliderType === CPCircularSlider)
        objj_msgSend(self, "setThemeState:", CPThemeStateCircular);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateCircular);
}
},["void","CPSliderType"]), new objj_method(sel_getUid("sliderType"), function $CPSlider__sliderType(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateCircular) ? CPCircularSlider : CPLinearSlider;
}
},["CPSliderType"]), new objj_method(sel_getUid("trackRectForBounds:"), function $CPSlider__trackRectForBounds_(self, _cmd, bounds)
{ with(self)
{
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateCircular))
    {
        var originalBounds = CGRectCreateCopy(bounds);
        bounds.size.width = MIN(bounds.size.width, bounds.size.height);
        bounds.size.height = bounds.size.width;
        if (bounds.size.width < originalBounds.size.width)
            bounds.origin.x += (originalBounds.size.width - bounds.size.width) / 2.0;
        else
            bounds.origin.y += (originalBounds.size.height - bounds.size.height) / 2.0;
    }
    else
    {
        var trackWidth = objj_msgSend(self, "currentValueForThemeAttribute:", "track-width");
        if (trackWidth <= 0)
            return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        if (objj_msgSend(self, "isVertical"))
        {
            bounds.origin.x = ((bounds.size.width) - trackWidth) / 2.0;
            bounds.size.width = trackWidth;
        }
        else
        {
            bounds.origin.y = ((bounds.size.height) - trackWidth) / 2.0;
            bounds.size.height = trackWidth;
        }
    }
    return bounds;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("knobRectForBounds:"), function $CPSlider__knobRectForBounds_(self, _cmd, bounds)
{ with(self)
{
    var knobSize = objj_msgSend(self, "currentValueForThemeAttribute:", "knob-size");
    if (knobSize.width <= 0 || knobSize.height <= 0)
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    var knobRect = { origin: { x:0.0, y:0.0 }, size: { width:knobSize.width, height:knobSize.height } },
        trackRect = objj_msgSend(self, "trackRectForBounds:", bounds);
    if (!trackRect || (trackRect.size.width <= 0.0 || trackRect.size.height <= 0.0))
        trackRect = bounds;
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateCircular))
    {
        var angle = 3*PI_2 - (1.0 - objj_msgSend(self, "doubleValue") - _minValue) / (_maxValue - _minValue) * PI2,
            radius = CGRectGetWidth(trackRect) / 2.0 - 8.0;
        knobRect.origin.x = radius * COS(angle) + CGRectGetMidX(trackRect) - 3.0;
        knobRect.origin.y = radius * SIN(angle) + CGRectGetMidY(trackRect) - 2.0;
    }
    else if (objj_msgSend(self, "isVertical"))
    {
        knobRect.origin.x = (trackRect.origin.x + (trackRect.size.width) / 2.0) - knobSize.width / 2.0;
        knobRect.origin.y = ((objj_msgSend(self, "doubleValue") - _minValue) / (_maxValue - _minValue)) * ((trackRect.size.height) - knobSize.height);
    }
    else
    {
        knobRect.origin.x = ((objj_msgSend(self, "doubleValue") - _minValue) / (_maxValue - _minValue)) * ((trackRect.size.width) - knobSize.width);
        knobRect.origin.y = (trackRect.origin.y + (trackRect.size.height) / 2.0) - knobSize.height / 2.0;
    }
    return knobRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPSlider__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    if (aName === "track-view")
        return objj_msgSend(self, "trackRectForBounds:", objj_msgSend(self, "bounds"));
    else if (aName === "knob-view")
        return objj_msgSend(self, "knobRectForBounds:", objj_msgSend(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "rectForEphemeralSubviewNamed:", aName);
}
},["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPSlider__createEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    if (aName === "track-view" || aName === "knob-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
        objj_msgSend(view, "setHitTests:", NO);
        return view;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "createEphemeralSubviewNamed:", aName);
}
},["CPView","CPString"]), new objj_method(sel_getUid("setAltIncrementValue:"), function $CPSlider__setAltIncrementValue_(self, _cmd, anAltIncrementValue)
{ with(self)
{
    _altIncrementValue = anAltIncrementValue;
}
},["void","float"]), new objj_method(sel_getUid("altIncrementValue"), function $CPSlider__altIncrementValue(self, _cmd)
{ with(self)
{
    return _altIncrementValue;
}
},["float"]), new objj_method(sel_getUid("setFrameSize:"), function $CPSlider__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFrameSize:", aSize);
    objj_msgSend(self, "_recalculateIsVertical");
}
},["void","CGSize"]), new objj_method(sel_getUid("_recalculateIsVertical"), function $CPSlider___recalculateIsVertical(self, _cmd)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        width = (bounds.size.width),
        height = (bounds.size.height);
    _isVertical = width < height ? 1 : (width > height ? 0 : -1);
    if (_isVertical === 1)
        objj_msgSend(self, "setThemeState:", CPThemeStateVertical);
    else if (_isVertical === 0)
        objj_msgSend(self, "unsetThemeState:", CPThemeStateVertical);
}
},["void"]), new objj_method(sel_getUid("isVertical"), function $CPSlider__isVertical(self, _cmd)
{ with(self)
{
    return _isVertical;
}
},["int"]), new objj_method(sel_getUid("layoutSubviews"), function $CPSlider__layoutSubviews(self, _cmd)
{ with(self)
{
    var trackView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "track-view", CPWindowBelow, "knob-view");
    if (trackView)
        objj_msgSend(trackView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "track-color"));
    var knobView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "knob-view", CPWindowAbove, "track-view");
    if (knobView)
        objj_msgSend(knobView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "knob-color"));
}
},["void"]), new objj_method(sel_getUid("tracksMouseOutsideOfFrame"), function $CPSlider__tracksMouseOutsideOfFrame(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("_valueAtPoint:"), function $CPSlider___valueAtPoint_(self, _cmd, aPoint)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        knobRect = objj_msgSend(self, "knobRectForBounds:", bounds),
        trackRect = objj_msgSend(self, "trackRectForBounds:", bounds);
    if (objj_msgSend(self, "hasThemeState:", CPThemeStateCircular))
    {
        var knobWidth = (knobRect.size.width);
        trackRect.origin.x += knobWidth / 2;
        trackRect.size.width -= knobWidth;
        var minValue = objj_msgSend(self, "minValue"),
            dx = aPoint.x - (trackRect.origin.x + (trackRect.size.width) / 2.0),
            dy = aPoint.y - (trackRect.origin.y + (trackRect.size.height) / 2.0);
        return MAX(0.0, MIN(1.0, 1.0 - (3 * PI_2 - ATAN2(dy, dx)) % PI2 / PI2)) * (objj_msgSend(self, "maxValue") - minValue) + minValue;
    }
    else if (objj_msgSend(self, "isVertical"))
    {
        var knobHeight = (knobRect.size.height);
        trackRect.origin.y += knobHeight / 2;
        trackRect.size.height -= knobHeight;
        var minValue = objj_msgSend(self, "minValue");
        return MAX(0.0, MIN(1.0, (aPoint.y - (trackRect.origin.y)) / (trackRect.size.height))) * (objj_msgSend(self, "maxValue") - minValue) + minValue;
    }
    else
    {
        var knobWidth = (knobRect.size.width);
        trackRect.origin.x += knobWidth / 2;
        trackRect.size.width -= knobWidth;
        var minValue = objj_msgSend(self, "minValue");
        return MAX(0.0, MIN(1.0, (aPoint.x - (trackRect.origin.x)) / (trackRect.size.width))) * (objj_msgSend(self, "maxValue") - minValue) + minValue;
    }
}
},["float","CGPoint"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPSlider__startTrackingAt_(self, _cmd, aPoint)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        knobRect = objj_msgSend(self, "knobRectForBounds:", { origin: { x:bounds.origin.x, y:bounds.origin.y }, size: { width:bounds.size.width, height:bounds.size.height } });
    if ((aPoint.x >= (knobRect.origin.x) && aPoint.y >= (knobRect.origin.y) && aPoint.x < (knobRect.origin.x + knobRect.size.width) && aPoint.y < (knobRect.origin.y + knobRect.size.height)))
        _dragOffset = { width:(knobRect.origin.x + (knobRect.size.width) / 2.0) - aPoint.x, height:(knobRect.origin.y + (knobRect.size.height) / 2.0) - aPoint.y };
    else
    {
        var trackRect = objj_msgSend(self, "trackRectForBounds:", bounds);
        if (trackRect && (aPoint.x >= (trackRect.origin.x) && aPoint.y >= (trackRect.origin.y) && aPoint.x < (trackRect.origin.x + trackRect.size.width) && aPoint.y < (trackRect.origin.y + trackRect.size.height)))
        {
            _dragOffset = { width:0.0, height:0.0 };
            objj_msgSend(self, "setObjectValue:", objj_msgSend(self, "_valueAtPoint:", aPoint));
        }
        else
            return NO;
    }
    objj_msgSend(self, "setHighlighted:", YES);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    return YES;
}
},["BOOL","CGPoint"]), new objj_method(sel_getUid("continueTracking:at:"), function $CPSlider__continueTracking_at_(self, _cmd, lastPoint, aPoint)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", objj_msgSend(self, "_valueAtPoint:", { x:aPoint.x + _dragOffset.width, y:aPoint.y + _dragOffset.height }));
    return YES;
}
},["BOOL","CGPoint","CGPoint"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPSlider__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{ with(self)
{
    objj_msgSend(self, "setHighlighted:", NO);
    if (objj_msgSend(_target, "respondsToSelector:", sel_getUid("sliderDidFinish:")))
        objj_msgSend(_target, "sliderDidFinish:", self);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("setContinuous:"), function $CPSlider__setContinuous_(self, _cmd, flag)
{ with(self)
{
    if (flag)
        _sendActionOn |= CPLeftMouseDraggedMask;
    else
        _sendActionOn &= ~CPLeftMouseDraggedMask;
}
},["void","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeClass"), function $CPSlider__themeClass(self, _cmd)
{ with(self)
{
    return "slider";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPSlider__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [nil, { width:0.0, height:0.0 }, 0.0, nil], ["knob-color", "knob-size", "track-width", "track-color"]);
}
},["id"])]);
}
var CPSliderMinValueKey = "CPSliderMinValueKey",
    CPSliderMaxValueKey = "CPSliderMaxValueKey",
    CPSliderAltIncrValueKey = "CPSliderAltIncrValueKey";
{
var the_class = objj_getClass("CPSlider")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSlider\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPSlider__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    _minValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderMinValueKey);
    _maxValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderMaxValueKey);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _altIncrementValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderAltIncrValueKey);
        objj_msgSend(self, "setContinuous:", YES);
        objj_msgSend(self, "_recalculateIsVertical");
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSlider__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _minValue, CPSliderMinValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _maxValue, CPSliderMaxValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _altIncrementValue, CPSliderAltIncrValueKey);
}
},["void","CPCoder"])]);
}
{
var the_class = objj_getClass("CPSlider")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSlider\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("value"), function $CPSlider__value(self, _cmd)
{ with(self)
{
    CPLog.warn("[CPSlider value] is deprecated, use doubleValue or objectValue instead.");
    return objj_msgSend(self, "doubleValue");
}
},["id"]), new objj_method(sel_getUid("setValue:"), function $CPSlider__setValue_(self, _cmd, aValue)
{ with(self)
{
    CPLog.warn("[CPSlider setValue:] is deprecated, use setDoubleValue: or setObjectValue: instead.");
    objj_msgSend(self, "setObjectValue:", aValue);
}
},["void","id"])]);
}

