i;8;CPView.jc;8500;
CPNoBorder = 0;
CPLineBorder = 1;
CPBezelBorder = 2;
CPGrooveBorder = 3;
{var the_class = objj_allocateClassPair(CPView, "CPBox"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_borderType"), new objj_ivar("_borderColor"), new objj_ivar("_fillColor"), new objj_ivar("_cornerRadius"), new objj_ivar("_borderWidth"), new objj_ivar("_contentMargin"), new objj_ivar("_contentView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPBox__initWithFrame_(self, _cmd, frameRect)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", frameRect))
    {
        _fillColor = objj_msgSend(CPColor, "clearColor");
        _borderColor = objj_msgSend(CPColor, "blackColor");
        _borderWidth = 1.0;
        _contentMargin = CGSizeMake(0.0, 0.0);
        _contentView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self, "addSubview:", _contentView);
    }
    return self;
}
},["id","CPRect"]), new objj_method(sel_getUid("borderRect"), function $CPBox__borderRect(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "bounds");
}
},["CPRect"]), new objj_method(sel_getUid("borderType"), function $CPBox__borderType(self, _cmd)
{ with(self)
{
    return _borderType;
}
},["CPBorderType"]), new objj_method(sel_getUid("setBorderType:"), function $CPBox__setBorderType_(self, _cmd, value)
{ with(self)
{
    _borderType = value;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPBorderType"]), new objj_method(sel_getUid("borderColor"), function $CPBox__borderColor(self, _cmd)
{ with(self)
{
    return _borderColor;
}
},["CPColor"]), new objj_method(sel_getUid("setBorderColor:"), function $CPBox__setBorderColor_(self, _cmd, color)
{ with(self)
{
    if (objj_msgSend(color, "isEqual:", _borderColor))
        return;
    _borderColor = color;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPColor"]), new objj_method(sel_getUid("borderWidth"), function $CPBox__borderWidth(self, _cmd)
{ with(self)
{
    return _borderWidth;
}
},["float"]), new objj_method(sel_getUid("setBorderWidth:"), function $CPBox__setBorderWidth_(self, _cmd, width)
{ with(self)
{
    if (width === _borderWidth)
        return;
    _borderWidth = width;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","float"]), new objj_method(sel_getUid("cornerRadius"), function $CPBox__cornerRadius(self, _cmd)
{ with(self)
{
    return _cornerRadius;
}
},["float"]), new objj_method(sel_getUid("setCornerRadius:"), function $CPBox__setCornerRadius_(self, _cmd, radius)
{ with(self)
{
    if (radius === _cornerRadius)
        return;
    _cornerRadius = radius;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","float"]), new objj_method(sel_getUid("fillColor"), function $CPBox__fillColor(self, _cmd)
{ with(self)
{
    return _fillColor;
}
},["CPColor"]), new objj_method(sel_getUid("setFillColor:"), function $CPBox__setFillColor_(self, _cmd, color)
{ with(self)
{
    if (objj_msgSend(color, "isEqual:", _fillColor))
        return;
    _fillColor = color;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPColor"]), new objj_method(sel_getUid("contentView"), function $CPBox__contentView(self, _cmd)
{ with(self)
{
    return _contentView;
}
},["CPView"]), new objj_method(sel_getUid("setContentView:"), function $CPBox__setContentView_(self, _cmd, aView)
{ with(self)
{
    if (aView === _contentView)
        return;
    objj_msgSend(aView, "setFrame:", CGRectInset(objj_msgSend(self, "bounds"), _contentMargin.width + _borderWidth, _contentMargin.height + _borderWidth));
    objj_msgSend(self, "replaceSubview:with:", _contentView, aView);
    _contentView = aView;
}
},["void","CPView"]), new objj_method(sel_getUid("contentViewMargins"), function $CPBox__contentViewMargins(self, _cmd)
{ with(self)
{
    return _contentMargin;
}
},["CPSize"]), new objj_method(sel_getUid("setContentViewMargins:"), function $CPBox__setContentViewMargins_(self, _cmd, size)
{ with(self)
{
     if(size.width < 0 || size.height < 0)
         objj_msgSend(CPException, "raise:reason:", CPGenericException, "Margins must be positive");
    _contentMargin = CGSizeMakeCopy(size);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPSize"]), new objj_method(sel_getUid("setFrameFromContentFrame:"), function $CPBox__setFrameFromContentFrame_(self, _cmd, aRect)
{ with(self)
{
    objj_msgSend(self, "setFrame:", CGRectInset(aRect, -(_contentMargin.width + _borderWidth), -(_contentMargin.height + _borderWidth)));
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPRect"]), new objj_method(sel_getUid("sizeToFit"), function $CPBox__sizeToFit(self, _cmd)
{ with(self)
{
    var contentFrame = objj_msgSend(_contentView, "frame");
    objj_msgSend(self, "setFrameSize:", CGSizeMake(contentFrame.size.width + _contentMargin.width * 2,
                                  contentFrame.size.height + _contentMargin.height * 2));
    objj_msgSend(_contentView, "setFrameOrigin:", CGPointMake(_contentMargin.width, _contentMargin.height));
}
},["void"]), new objj_method(sel_getUid("drawRect:"), function $CPBox__drawRect_(self, _cmd, rect)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        aContext = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        border2 = _borderWidth/2,
        strokeRect = CGRectMake(bounds.origin.x + border2,
                                bounds.origin.y + border2,
                                bounds.size.width - _borderWidth,
                                bounds.size.height - _borderWidth),
        fillRect = CGRectMake(bounds.origin.x + border2,
                              bounds.origin.y + border2,
                              bounds.size.width - _borderWidth,
                              bounds.size.height - _borderWidth);
    CGContextSetFillColor(aContext, objj_msgSend(self, "fillColor"));
    CGContextSetStrokeColor(aContext, objj_msgSend(self, "borderColor"));
    CGContextSetLineWidth(aContext, _borderWidth);
    switch(_borderType)
    {
        case CPLineBorder: CGContextFillRoundedRectangleInRect(aContext, fillRect, _cornerRadius, YES, YES, YES, YES);
                            CGContextStrokeRoundedRectangleInRect(aContext, strokeRect, _cornerRadius, YES, YES, YES, YES);
                            break;
        case CPBezelBorder: CGContextFillRoundedRectangleInRect(aContext, fillRect, _cornerRadius, YES, YES, YES, YES);
                            CGContextSetStrokeColor(aContext, objj_msgSend(CPColor, "colorWithWhite:alpha:", 190.0/255.0, 1.0));
                            CGContextBeginPath(aContext);
                            CGContextMoveToPoint(aContext, strokeRect.origin.x, strokeRect.origin.y);
                            CGContextAddLineToPoint(aContext, CGRectGetMinX(strokeRect), CGRectGetMaxY(strokeRect)),
                            CGContextAddLineToPoint(aContext, CGRectGetMaxX(strokeRect), CGRectGetMaxY(strokeRect)),
                            CGContextAddLineToPoint(aContext, CGRectGetMaxX(strokeRect), CGRectGetMinY(strokeRect)),
                            CGContextStrokePath(aContext);
                            CGContextSetStrokeColor(aContext, objj_msgSend(CPColor, "colorWithWhite:alpha:", 142.0/255.0, 1.0));
                            CGContextBeginPath(aContext);
                            CGContextMoveToPoint(aContext, bounds.origin.x, strokeRect.origin.y);
                            CGContextAddLineToPoint(aContext, CGRectGetMaxX(bounds), CGRectGetMinY(strokeRect));
                            CGContextStrokePath(aContext);
                            break;
        default: break;
    }
}
},["void","CPRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("boxEnclosingView:"), function $CPBox__boxEnclosingView_(self, _cmd, aView)
{ with(self)
{
    var box = objj_msgSend(objj_msgSend(self, "alloc"), "initWithFrame:", CGRectMakeZero()),
        enclosingView = objj_msgSend(aView, "superview");
    objj_msgSend(box, "setFrameFromContentFrame:", objj_msgSend(aView, "frame"));
    objj_msgSend(enclosingView, "replaceSubview:with:", aView, box);
    objj_msgSend(box, "setContentView:", aView);
    return box;
}
},["id","CPView"])]);
}

