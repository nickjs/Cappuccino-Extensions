I;20;Foundation/CPArray.ji;11;CPControl.jc;30438;
CPSegmentSwitchTrackingSelectOne = 0;
CPSegmentSwitchTrackingSelectAny = 1;
CPSegmentSwitchTrackingMomentary = 2;
{var the_class = objj_allocateClassPair(CPControl, "CPSegmentedControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_segments"), new objj_ivar("_themeStates"), new objj_ivar("_selectedSegment"), new objj_ivar("_segmentStyle"), new objj_ivar("_trackingMode"), new objj_ivar("_trackingSegment"), new objj_ivar("_trackingHighlighted")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPSegmentedControl__initWithFrame_(self, _cmd, aRect)
{ with(self)
{
    _segments = [];
    _themeStates = [];
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aRect);
    if (self)
    {
        _selectedSegment = -1;
        _trackingMode = CPSegmentSwitchTrackingSelectOne;
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("selectedTag"), function $CPSegmentedControl__selectedTag(self, _cmd)
{ with(self)
{
    return _segments[_selectedSegment].tag;
}
},["int"]), new objj_method(sel_getUid("setSegmentCount:"), function $CPSegmentedControl__setSegmentCount_(self, _cmd, aCount)
{ with(self)
{
    if (_segments.length == aCount)
        return;
    var height = CGRectGetHeight(objj_msgSend(self, "bounds"));
    if (_segments.length < aCount)
    {
        for (var index = _segments.length; index < aCount; ++index)
        {
            _segments[index] = objj_msgSend(objj_msgSend(_CPSegmentItem, "alloc"), "init");
            _themeStates[index] = CPThemeStateNormal;
        }
    }
    else if (aCount < _segments.length)
    {
        _segments.length = aCount;
        _themeStates.length = aCount;
    }
    if (_selectedSegment >= _segments.length)
        _selectedSegment = -1;
    objj_msgSend(self, "tileWithChangedSegment:", 0);
}
},["void","unsigned"]), new objj_method(sel_getUid("segmentCount"), function $CPSegmentedControl__segmentCount(self, _cmd)
{ with(self)
{
    return _segments.length;
}
},["unsigned"]), new objj_method(sel_getUid("setSelectedSegment:"), function $CPSegmentedControl__setSelectedSegment_(self, _cmd, aSegment)
{ with(self)
{
    objj_msgSend(self, "setSelected:forSegment:", YES, aSegment);
}
},["void","unsigned"]), new objj_method(sel_getUid("selectedSegment"), function $CPSegmentedControl__selectedSegment(self, _cmd)
{ with(self)
{
    return _selectedSegment;
}
},["unsigned"]), new objj_method(sel_getUid("selectSegmentWithTag:"), function $CPSegmentedControl__selectSegmentWithTag_(self, _cmd, aTag)
{ with(self)
{
    var index = 0;
    for (; index < _segments.length; ++index)
        if (_segments[index].tag == aTag)
        {
            objj_msgSend(self, "setSelectedSegment:", index);
            return YES;
        }
    return NO;
}
},["BOOL","int"]), new objj_method(sel_getUid("isTracking"), function $CPSegmentedControl__isTracking(self, _cmd)
{ with(self)
{
}
},["BOOL"]), new objj_method(sel_getUid("setTrackingMode:"), function $CPSegmentedControl__setTrackingMode_(self, _cmd, aTrackingMode)
{ with(self)
{
    if (_trackingMode == aTrackingMode)
        return;
    _trackingMode = aTrackingMode;
    if (_trackingMode == CPSegmentSwitchTrackingSelectOne)
    {
        var index = 0,
            selected = NO;
        for (; index < _segments.length; ++index)
            if (_segments[index].selected)
                if (selected)
                    objj_msgSend(self, "setSelected:forSegment:", NO, index);
                else
                    selected = YES;
    }
    else if (_trackingMode == CPSegmentSwitchTrackingMomentary)
    {
        var index = 0;
        for (; index < _segments.length; ++index)
            if (_segments[index].selected)
                objj_msgSend(self, "setSelected:forSegment:", NO, index);
    }
}
},["void","CPSegmentSwitchTracking"]), new objj_method(sel_getUid("trackingMode"), function $CPSegmentedControl__trackingMode(self, _cmd)
{ with(self)
{
    return _trackingMode;
}
},["CPSegmentSwitchTracking"]), new objj_method(sel_getUid("setWidth:forSegment:"), function $CPSegmentedControl__setWidth_forSegment_(self, _cmd, aWidth, aSegment)
{ with(self)
{
    _segments[aSegment].width = aWidth;
    objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
},["void","float","unsigned"]), new objj_method(sel_getUid("widthForSegment:"), function $CPSegmentedControl__widthForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].width;
}
},["float","unsigned"]), new objj_method(sel_getUid("setImage:forSegment:"), function $CPSegmentedControl__setImage_forSegment_(self, _cmd, anImage, aSegment)
{ with(self)
{
    var segment = _segments[aSegment];
    segment.image = anImage;
    objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
},["void","CPImage","unsigned"]), new objj_method(sel_getUid("imageForSegment:"), function $CPSegmentedControl__imageForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].image;
}
},["CPImage","unsigned"]), new objj_method(sel_getUid("setLabel:forSegment:"), function $CPSegmentedControl__setLabel_forSegment_(self, _cmd, aLabel, aSegment)
{ with(self)
{
    var segment = _segments[aSegment];
    _segments[aSegment].label = aLabel;
    objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
},["void","CPString","unsigned"]), new objj_method(sel_getUid("labelForSegment:"), function $CPSegmentedControl__labelForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].label;
}
},["CPString","unsigned"]), new objj_method(sel_getUid("setMenu:forSegment:"), function $CPSegmentedControl__setMenu_forSegment_(self, _cmd, aMenu, aSegment)
{ with(self)
{
    _segments[aSegment].menu = aMenu;
}
},["void","CPMenu","unsigned"]), new objj_method(sel_getUid("menuForSegment:"), function $CPSegmentedControl__menuForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].menu;
}
},["CPMenu","unsigned"]), new objj_method(sel_getUid("setSelected:forSegment:"), function $CPSegmentedControl__setSelected_forSegment_(self, _cmd, isSelected, aSegment)
{ with(self)
{
    var segment = _segments[aSegment];
    if (segment.selected == isSelected)
        return;
    segment.selected = isSelected;
    _themeStates[aSegment] = isSelected ? CPThemeStateSelected : CPThemeStateNormal;
    if (isSelected)
    {
        var oldSelectedSegment = _selectedSegment;
        _selectedSegment = aSegment;
        if (_trackingMode == CPSegmentSwitchTrackingSelectOne && oldSelectedSegment != aSegment && oldSelectedSegment != -1)
        {
            _segments[oldSelectedSegment].selected = NO;
            _themeStates[oldSelectedSegment] = CPThemeStateNormal;
            objj_msgSend(self, "drawSegmentBezel:highlight:", oldSelectedSegment, NO);
        }
    }
    if (_trackingMode != CPSegmentSwitchTrackingMomentary)
        objj_msgSend(self, "drawSegmentBezel:highlight:", aSegment, NO);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","BOOL","unsigned"]), new objj_method(sel_getUid("isSelectedForSegment:"), function $CPSegmentedControl__isSelectedForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].selected;
}
},["BOOL","unsigned"]), new objj_method(sel_getUid("setEnabled:forSegment:"), function $CPSegmentedControl__setEnabled_forSegment_(self, _cmd, isEnabled, aSegment)
{ with(self)
{
    _segments[aSegment].enabled = isEnabled;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","BOOL","unsigned"]), new objj_method(sel_getUid("isEnabledForSegment:"), function $CPSegmentedControl__isEnabledForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].enabled;
}
},["BOOL","unsigned"]), new objj_method(sel_getUid("setTag:forSegment:"), function $CPSegmentedControl__setTag_forSegment_(self, _cmd, aTag, aSegment)
{ with(self)
{
    _segments[aSegment].tag = aTag;
}
},["void","int","unsigned"]), new objj_method(sel_getUid("tagForSegment:"), function $CPSegmentedControl__tagForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].tag;
}
},["int","unsigned"]), new objj_method(sel_getUid("drawSegmentBezel:highlight:"), function $CPSegmentedControl__drawSegmentBezel_highlight_(self, _cmd, aSegment, shouldHighlight)
{ with(self)
{
    if (shouldHighlight)
        _themeStates[aSegment] |= CPThemeStateHighlighted;
    else
        _themeStates[aSegment] &= ~CPThemeStateHighlighted;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","int","BOOL"]), new objj_method(sel_getUid("_leftOffsetForSegment:"), function $CPSegmentedControl___leftOffsetForSegment_(self, _cmd, segment)
{ with(self)
{
    var bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset");
    if (segment == 0)
        return bezelInset.left;
    var thickness = objj_msgSend(self, "currentValueForThemeAttribute:", "divider-thickness");
    return objj_msgSend(self, "_leftOffsetForSegment:", segment - 1) + objj_msgSend(self, "widthForSegment:", segment - 1) + thickness;
}
},["float","unsigned"]), new objj_method(sel_getUid("_indexOfLastSegment"), function $CPSegmentedControl___indexOfLastSegment(self, _cmd)
{ with(self)
{
    var lastSegmentIndex = objj_msgSend(_segments, "count") - 1;
    if (lastSegmentIndex < 0)
        lastSegmentIndex = 0;
    return lastSegmentIndex;
}
},["unsigned"]), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPSegmentedControl__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    var height = objj_msgSend(self, "currentValueForThemeAttribute:", "default-height"),
        contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset"),
        bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset"),
        bounds = objj_msgSend(self, "bounds");
    if (aName === "left-segment-bezel")
    {
        return CGRectMake(bezelInset.left, bezelInset.top, contentInset.left, height);
    }
    else if (aName === "right-segment-bezel")
    {
        var lastSegmentLeftOffset = objj_msgSend(self, "_leftOffsetForSegment:", objj_msgSend(self, "_indexOfLastSegment"));
        return CPRectMake(lastSegmentLeftOffset + objj_msgSend(self, "widthForSegment:", objj_msgSend(self, "_indexOfLastSegment")) - contentInset.right,
                            bezelInset.top,
                            contentInset.right,
                            height);
    }
    else if (aName.substring(0, "segment-bezel".length) == "segment-bezel")
    {
        var segment = parseInt(aName.substring("segment-bezel-".length), 10),
            frame = CGRectCreateCopy(_segments[segment].frame);
        if (segment == 0)
        {
            frame.origin.x += contentInset.left;
            frame.size.width -= contentInset.left;
        }
        if (segment == _segments.length - 1)
            frame.size.width -= contentInset.right;
        return frame;
    }
    else if (aName.substring(0, "divider-bezel".length) == "divider-bezel")
    {
        var segment = parseInt(aName.substring("divider-bezel-".length), 10),
            width = objj_msgSend(self, "widthForSegment:", segment),
            left = objj_msgSend(self, "_leftOffsetForSegment:", segment),
            thickness = objj_msgSend(self, "currentValueForThemeAttribute:", "divider-thickness");
        return CGRectMake(left + width, bezelInset.top, thickness, height);
    }
    else if (aName.substring(0, "segment-content".length) == "segment-content")
    {
        var segment = parseInt(aName.substring("segment-content-".length), 10);
        return objj_msgSend(self, "contentFrameForSegment:", segment);
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "rectForEphemeralSubviewNamed:", aName);
}
},["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPSegmentedControl__createEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    if (aName.substring(0, "segment-content".length) == "segment-content")
        return objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    return objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
}
},["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPSegmentedControl__layoutSubviews(self, _cmd)
{ with(self)
{
    if (_segments.length <= 0)
        return;
    var leftCapColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "left-segment-bezel-color", _themeStates[0]);
    var leftBezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "left-segment-bezel", CPWindowBelow, nil);
    objj_msgSend(leftBezelView, "setBackgroundColor:", leftCapColor);
    var rightCapColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "right-segment-bezel-color", _themeStates[_themeStates.length - 1]);
    var rightBezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "right-segment-bezel", CPWindowBelow, nil);
    objj_msgSend(rightBezelView, "setBackgroundColor:", rightCapColor);
    for (var i=0, count = _themeStates.length; i<count; i++)
    {
        var themeState = _themeStates[i];
        themeState |= _themeState & CPThemeStateDisabled;
        var bezelColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "center-segment-bezel-color", themeState);
        var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "segment-bezel-"+i, CPWindowBelow, nil);
        objj_msgSend(bezelView, "setBackgroundColor:", bezelColor);
        var segment = _segments[i];
        var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "segment-content-"+i, CPWindowAbove, "segment-bezel-"+i);
        objj_msgSend(contentView, "setText:", segment.label);
        objj_msgSend(contentView, "setImage:", segment.image);
        objj_msgSend(contentView, "setFont:", objj_msgSend(self, "valueForThemeAttribute:inState:", "font", themeState));
        objj_msgSend(contentView, "setTextColor:", objj_msgSend(self, "valueForThemeAttribute:inState:", "text-color", themeState));
        objj_msgSend(contentView, "setAlignment:", objj_msgSend(self, "valueForThemeAttribute:inState:", "alignment", themeState));
        objj_msgSend(contentView, "setVerticalAlignment:", objj_msgSend(self, "valueForThemeAttribute:inState:", "vertical-alignment", themeState));
        objj_msgSend(contentView, "setLineBreakMode:", objj_msgSend(self, "valueForThemeAttribute:inState:", "line-break-mode", themeState));
        objj_msgSend(contentView, "setTextShadowColor:", objj_msgSend(self, "valueForThemeAttribute:inState:", "text-shadow-color", themeState));
        objj_msgSend(contentView, "setTextShadowOffset:", objj_msgSend(self, "valueForThemeAttribute:inState:", "text-shadow-offset", themeState));
        objj_msgSend(contentView, "setImageScaling:", objj_msgSend(self, "valueForThemeAttribute:inState:", "image-scaling", themeState));
        if (segment.image && segment.label)
            objj_msgSend(contentView, "setImagePosition:", objj_msgSend(self, "valueForThemeAttribute:inState:", "image-position", themeState));
        else if (segment.image)
            objj_msgSend(contentView, "setImagePosition:", CPImageOnly);
        if (i == count - 1)
            continue;
        var borderState = _themeStates[i] | _themeStates[i+1];
        borderState = (borderState & CPThemeStateSelected & ~CPThemeStateHighlighted) ? CPThemeStateSelected : CPThemeStateNormal;
        borderState |= _themeState & CPThemeStateDisabled;
        var borderColor = objj_msgSend(self, "valueForThemeAttribute:inState:", "divider-bezel-color", borderState);
        var borderView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "divider-bezel-"+i, CPWindowBelow, nil);
        objj_msgSend(borderView, "setBackgroundColor:", borderColor);
    }
}
},["void"]), new objj_method(sel_getUid("drawSegment:highlight:"), function $CPSegmentedControl__drawSegment_highlight_(self, _cmd, aSegment, shouldHighlight)
{ with(self)
{
}
},["void","int","BOOL"]), new objj_method(sel_getUid("tileWithChangedSegment:"), function $CPSegmentedControl__tileWithChangedSegment_(self, _cmd, aSegment)
{ with(self)
{
    if (aSegment >= _segments.length)
        return;
    var segment = _segments[aSegment],
        segmentWidth = segment.width,
        themeState = _themeStates[aSegment] | (_themeState & CPThemeStateDisabled),
        contentInset = objj_msgSend(self, "valueForThemeAttribute:inState:", "content-inset", themeState),
        font = objj_msgSend(self, "valueForThemeAttribute:inState:", "font", themeState);
    if (!segmentWidth)
    {
        if (segment.image && segment.label)
            segmentWidth = objj_msgSend(segment.label, "sizeWithFont:", font).width + objj_msgSend(segment.image, "size").width + contentInset.left + contentInset.right;
        else if (segment.image)
            segmentWidth = objj_msgSend(segment.image, "size").width + contentInset.left + contentInset.right;
        else if (segment.label)
            segmentWidth = objj_msgSend(segment.label, "sizeWithFont:", font).width + contentInset.left + contentInset.right;
        else
            segmentWidth = 0.0;
    }
    var delta = segmentWidth - CGRectGetWidth(segment.frame);
    if (!delta)
        return;
    var frame = objj_msgSend(self, "frame");
    objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(frame) + delta, CGRectGetHeight(frame)));
    segment.width = segmentWidth;
    segment.frame = objj_msgSend(self, "frameForSegment:", aSegment);;
    var index = aSegment + 1;
    for (; index < _segments.length; ++index)
    {
        _segments[index].frame.origin.x += delta;
        objj_msgSend(self, "drawSegmentBezel:highlight:", index, NO);
        objj_msgSend(self, "drawSegment:highlight:", index, NO);
    }
    objj_msgSend(self, "drawSegmentBezel:highlight:", aSegment, NO);
    objj_msgSend(self, "drawSegment:highlight:", aSegment, NO);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","unsigned"]), new objj_method(sel_getUid("frameForSegment:"), function $CPSegmentedControl__frameForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return objj_msgSend(self, "bezelFrameForSegment:", aSegment);
}
},["CGRect","unsigned"]), new objj_method(sel_getUid("bezelFrameForSegment:"), function $CPSegmentedControl__bezelFrameForSegment_(self, _cmd, aSegment)
{ with(self)
{
    var height = objj_msgSend(self, "currentValueForThemeAttribute:", "default-height"),
        bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset"),
        width = objj_msgSend(self, "widthForSegment:", aSegment),
        left = objj_msgSend(self, "_leftOffsetForSegment:", aSegment);
    return CGRectMake(left, bezelInset.top, width, height);
}
},["CGRect","unsigned"]), new objj_method(sel_getUid("contentFrameForSegment:"), function $CPSegmentedControl__contentFrameForSegment_(self, _cmd, aSegment)
{ with(self)
{
    var height = objj_msgSend(self, "currentValueForThemeAttribute:", "default-height"),
        contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset"),
        width = objj_msgSend(self, "widthForSegment:", aSegment),
        left = objj_msgSend(self, "_leftOffsetForSegment:", aSegment);
    return CGRectMake(left + contentInset.left, contentInset.top, width - contentInset.left - contentInset.right, height - contentInset.top - contentInset.bottom);
}
},["CGRect","unsigned"]), new objj_method(sel_getUid("testSegment:"), function $CPSegmentedControl__testSegment_(self, _cmd, aPoint)
{ with(self)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", aPoint, nil),
        count = _segments.length;
    while (count--)
        if (CGRectContainsPoint(_segments[count].frame, aPoint))
            return count;
    return -1;
}
},["unsigned","CGPoint"]), new objj_method(sel_getUid("mouseDown:"), function $CPSegmentedControl__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "trackSegment:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $CPSegmentedControl__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
}
},["void","CPEvent"]), new objj_method(sel_getUid("trackSegment:"), function $CPSegmentedControl__trackSegment_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    if (type == CPLeftMouseUp)
    {
        if (_trackingSegment == -1)
            return;
        if (CGRectContainsPoint(_segments[_trackingSegment].frame, location))
        {
            if (_trackingMode == CPSegmentSwitchTrackingSelectAny)
            {
                objj_msgSend(self, "setSelected:forSegment:", !objj_msgSend(self, "isSelectedForSegment:", _trackingSegment), _trackingSegment);
                _selectedSegment = _trackingSegment;
            }
            else
                objj_msgSend(self, "setSelected:forSegment:", YES, _trackingSegment);
            objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
            if (_trackingMode == CPSegmentSwitchTrackingMomentary)
            {
                objj_msgSend(self, "setSelected:forSegment:", NO, _trackingSegment);
                _selectedSegment = -1;
            }
        }
        objj_msgSend(self, "drawSegmentBezel:highlight:", _trackingSegment, NO);
        _trackingSegment = -1;
        return;
    }
    if (type == CPLeftMouseDown)
    {
        _trackingHighlighted = YES;
        _trackingSegment = objj_msgSend(self, "testSegment:", location);
        objj_msgSend(self, "drawSegmentBezel:highlight:", _trackingSegment, YES);
    }
    else if (type == CPLeftMouseDragged)
    {
        if (_trackingSegment == -1)
            return;
        var highlighted = CGRectContainsPoint(_segments[_trackingSegment].frame, location);
        if (highlighted != _trackingHighlighted)
        {
            _trackingHighlighted = highlighted;
            objj_msgSend(self, "drawSegmentBezel:highlight:", _trackingSegment, _trackingHighlighted);
        }
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackSegment:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("setFont:"), function $CPSegmentedControl__setFont_(self, _cmd, aFont)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFont:", aFont);
    objj_msgSend(self, "tileWithChangedSegment:", 0);
}
},["void","CPFont"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeClass"), function $CPSegmentedControl__themeClass(self, _cmd)
{ with(self)
{
    return "segmented-control";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPSegmentedControl__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [CPCenterTextAlignment, CPCenterVerticalTextAlignment, CPImageLeft, CPScaleNone, { top:(0), right:(0), bottom:(0), left:(0) }, { top:(0), right:(0), bottom:(0), left:(0) }, nil, nil, nil, nil, 1.0, 24.0], ["alignment", "vertical-alignment", "image-position", "image-scaling", "bezel-inset", "content-inset", "left-segment-bezel-color", "right-segment-bezel-color", "center-segment-bezel-color", "divider-bezel-color", "divider-thickness", "default-height"]);
}
},["id"])]);
}
var CPSegmentedControlSegmentsKey = "CPSegmentedControlSegmentsKey",
    CPSegmentedControlSelectedKey = "CPSegmentedControlSelectedKey",
    CPSegmentedControlSegmentStyleKey = "CPSegmentedControlSegmentStyleKey",
    CPSegmentedControlTrackingModeKey = "CPSegmentedControlTrackingModeKey";
{
var the_class = objj_getClass("CPSegmentedControl")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSegmentedControl\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPSegmentedControl__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        var frame = objj_msgSend(self, "frame"),
            originalWidth = frame.size.width;
        frame.size.width = 0;
        objj_msgSend(self, "setFrame:", frame);
        _segments = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentedControlSegmentsKey);
        _segmentStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlSegmentStyleKey);
        _themeStates = [];
        if (objj_msgSend(aCoder, "containsValueForKey:", CPSegmentedControlSelectedKey))
            _selectedSegment = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlSelectedKey);
        else
            _selectedSegment = -1;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPSegmentedControlTrackingModeKey))
            _trackingMode = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlTrackingModeKey);
        else
            _trackingMode = CPSegmentSwitchTrackingSelectOne;
        for (var i = 0; i < _segments.length; i++)
        {
            _themeStates[i] = _segments[i].selected ? CPThemeStateSelected : CPThemeStateNormal;
            objj_msgSend(self, "tileWithChangedSegment:", i);
        }
        var difference = MAX(originalWidth - objj_msgSend(self, "frame").size.width, 0.0),
            remainingWidth = FLOOR(difference / _segments.length);
        for (var i=0; i < _segments.length; i++)
            objj_msgSend(self, "setWidth:forSegment:", _segments[i].width + remainingWidth, i);
        objj_msgSend(self, "tileWithChangedSegment:", 0);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSegmentedControl__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _segments, CPSegmentedControlSegmentsKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _selectedSegment, CPSegmentedControlSelectedKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _segmentStyle, CPSegmentedControlSegmentStyleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _trackingMode, CPSegmentedControlTrackingModeKey);
}
},["void","CPCoder"])]);
}
{var the_class = objj_allocateClassPair(CPObject, "_CPSegmentItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("image"), new objj_ivar("label"), new objj_ivar("menu"), new objj_ivar("selected"), new objj_ivar("enabled"), new objj_ivar("tag"), new objj_ivar("width"), new objj_ivar("frame")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPSegmentItem__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        image = nil;
        label = "";
        menu = nil;
        selected = NO;
        enabled = NO;
        tag = 0;
        width = 0;
        frame = CGRectMakeZero();
    }
    return self;
}
},["id"])]);
}
var CPSegmentItemImageKey = "CPSegmentItemImageKey",
    CPSegmentItemLabelKey = "CPSegmentItemLabelKey",
    CPSegmentItemMenuKey = "CPSegmentItemMenuKey",
    CPSegmentItemSelectedKey = "CPSegmentItemSelectedKey",
    CPSegmentItemEnabledKey = "CPSegmentItemEnabledKey",
    CPSegmentItemTagKey = "CPSegmentItemTagKey",
    CPSegmentItemWidthKey = "CPSegmentItemWidthKey";
{
var the_class = objj_getClass("_CPSegmentItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPSegmentItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPSegmentItem__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        image = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemImageKey);
        label = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemLabelKey);
        menu = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemMenuKey);
        selected = objj_msgSend(aCoder, "decodeBoolForKey:", CPSegmentItemSelectedKey);
        enabled = objj_msgSend(aCoder, "decodeBoolForKey:", CPSegmentItemEnabledKey);
        tag = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentItemTagKey);
        width = objj_msgSend(aCoder, "decodeFloatForKey:", CPSegmentItemWidthKey);
        frame = CGRectMakeZero();
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPSegmentItem__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", image, CPSegmentItemImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", label, CPSegmentItemLabelKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", menu, CPSegmentItemMenuKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", selected, CPSegmentItemSelectedKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", enabled, CPSegmentItemEnabledKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", tag, CPSegmentItemTagKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", width, CPSegmentItemWidthKey);
}
},["void","CPCoder"])]);
}

