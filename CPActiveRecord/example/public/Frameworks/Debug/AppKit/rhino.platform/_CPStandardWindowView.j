i;15;_CPWindowView.jc;14360;
var GRADIENT_HEIGHT = 41.0;
var _CPTexturedWindowHeadGradientColor = nil,
    _CPTexturedWindowHeadSolidColor = nil;
{var the_class = objj_allocateClassPair(CPView, "_CPTexturedWindowHeadView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_gradientView"), new objj_ivar("_solidView"), new objj_ivar("_dividerView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPTexturedWindowHeadView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        var theClass = objj_msgSend(self, "class"),
            bounds = objj_msgSend(self, "bounds");
        _gradientView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), GRADIENT_HEIGHT));
        objj_msgSend(_gradientView, "setBackgroundColor:", objj_msgSend(theClass, "gradientColor"));
        objj_msgSend(self, "addSubview:", _gradientView);
        _solidView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, GRADIENT_HEIGHT, CGRectGetWidth(bounds), CGRectGetHeight(bounds) - GRADIENT_HEIGHT));
        objj_msgSend(_solidView, "setBackgroundColor:", objj_msgSend(theClass, "solidColor"));
        objj_msgSend(self, "addSubview:", _solidView);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $_CPTexturedWindowHeadView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    objj_msgSend(_gradientView, "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), GRADIENT_HEIGHT));
    objj_msgSend(_solidView, "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), CGRectGetHeight(bounds) - GRADIENT_HEIGHT));
}
},["void","CGSize"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("gradientColor"), function $_CPTexturedWindowHeadView__gradientColor(self, _cmd)
{ with(self)
{
    if (!_CPTexturedWindowHeadGradientColor)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_CPWindowView, "class"));
        _CPTexturedWindowHeadGradientColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
            [
                objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardTop0.png"), CGSizeMake(6.0, 41.0)),
                objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardTop1.png"), CGSizeMake(1.0, 41.0)),
                objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardTop2.png"), CGSizeMake(6.0, 41.0))
            ], NO
        ));
    }
    return _CPTexturedWindowHeadGradientColor;
}
},["CPColor"]), new objj_method(sel_getUid("solidColor"), function $_CPTexturedWindowHeadView__solidColor(self, _cmd)
{ with(self)
{
    if (!_CPTexturedWindowHeadSolidColor)
        _CPTexturedWindowHeadSolidColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 195.0 / 255.0, 195.0 / 255.0, 195.0 / 255.0, 1.0);
    return _CPTexturedWindowHeadSolidColor;
}
},["CPColor"])]);
}
var _CPStandardWindowViewBodyBackgroundColor = nil,
    _CPStandardWindowViewDividerBackgroundColor = nil,
    _CPStandardWindowViewTitleBackgroundColor = nil,
    _CPStandardWindowViewCloseButtonImage = nil,
    _CPStandardWindowViewCloseButtonHighlightedImage = nil;
var STANDARD_GRADIENT_HEIGHT = 41.0;
    STANDARD_TITLEBAR_HEIGHT = 25.0;
{var the_class = objj_allocateClassPair(_CPWindowView, "_CPStandardWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_headView"), new objj_ivar("_dividerView"), new objj_ivar("_bodyView"), new objj_ivar("_toolbarView"), new objj_ivar("_titleField"), new objj_ivar("_closeButton")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPStandardWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect),
        theToolbar = objj_msgSend(objj_msgSend(self, "window"), "toolbar");
    if (objj_msgSend(theToolbar, "isVisible"))
    {
        toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(theToolbar, "_toolbarView"), "frame"));
        contentRect.origin.y += toolbarHeight;
        contentRect.size.height -= toolbarHeight;
    }
    return contentRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPStandardWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect),
        theToolbar = objj_msgSend(objj_msgSend(self, "window"), "toolbar");
    if (objj_msgSend(theToolbar, "isVisible"))
    {
        toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(theToolbar, "_toolbarView"), "frame"));
        frameRect.origin.y -= toolbarHeight;
        frameRect.size.height += toolbarHeight;
    }
    return frameRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPStandardWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        var theClass = objj_msgSend(self, "class"),
            bounds = objj_msgSend(self, "bounds");
        _headView = objj_msgSend(objj_msgSend(_CPTexturedWindowHeadView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight")));
        objj_msgSend(_headView, "setAutoresizingMask:", CPViewWidthSizable);;
        objj_msgSend(_headView, "setHitTests:", NO);
        objj_msgSend(self, "addSubview:", _headView);
        _dividerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, CGRectGetMaxY(objj_msgSend(_headView, "frame")), CGRectGetWidth(bounds), 1.0));
        objj_msgSend(_dividerView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_dividerView, "setBackgroundColor:", objj_msgSend(theClass, "dividerBackgroundColor"));
        objj_msgSend(_dividerView, "setHitTests:", NO);
        objj_msgSend(self, "addSubview:", _dividerView);
        var y = CGRectGetMaxY(objj_msgSend(_dividerView, "frame"));
        _bodyView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, y, CGRectGetWidth(bounds), CGRectGetHeight(bounds) - y));
        objj_msgSend(_bodyView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(_bodyView, "setBackgroundColor:", objj_msgSend(theClass, "bodyBackgroundColor"));
        objj_msgSend(_bodyView, "setHitTests:", NO);
        objj_msgSend(self, "addSubview:", _bodyView);
        objj_msgSend(self, "setResizeIndicatorOffset:", CGSizeMake(2.0, 2.0));
        _titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_titleField, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12.0));
        objj_msgSend(_titleField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_titleField, "setLineBreakMode:", CPLineBreakByTruncatingTail);
        objj_msgSend(_titleField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(_titleField, "setTextShadowColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(_titleField, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(_titleField, "setStringValue:", "Untitled");
        objj_msgSend(_titleField, "sizeToFit");
        objj_msgSend(_titleField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_titleField, "setStringValue:", "");
        objj_msgSend(self, "addSubview:", _titleField);
        if (_styleMask & CPClosableWindowMask)
        {
            if (!_CPStandardWindowViewCloseButtonImage)
            {
                var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));
                _CPStandardWindowViewCloseButtonImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardCloseButton.png"), CGSizeMake(16.0, 16.0));
                _CPStandardWindowViewCloseButtonHighlightedImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardCloseButtonHighlighted.png"), CGSizeMake(16.0, 16.0));
            }
            _closeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(8.0, 7.0, 16.0, 16.0));
            objj_msgSend(_closeButton, "setBordered:", NO);
            objj_msgSend(_closeButton, "setImage:", _CPStandardWindowViewCloseButtonImage);
            objj_msgSend(_closeButton, "setAlternateImage:", _CPStandardWindowViewCloseButtonHighlightedImage);
            objj_msgSend(self, "addSubview:", _closeButton);
        }
        objj_msgSend(self, "tile");
    }
    return self;
}
},["id","CPRect","unsigned"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $_CPStandardWindowView__viewDidMoveToWindow(self, _cmd)
{ with(self)
{
    objj_msgSend(_closeButton, "setTarget:", objj_msgSend(self, "window"));
    objj_msgSend(_closeButton, "setAction:", sel_getUid("performClose:"));
}
},["void"]), new objj_method(sel_getUid("toolbarOffset"), function $_CPStandardWindowView__toolbarOffset(self, _cmd)
{ with(self)
{
    return CGSizeMake(0.0, objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight"));
}
},["CGSize"]), new objj_method(sel_getUid("tile"), function $_CPStandardWindowView__tile(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "tile");
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);
    objj_msgSend(_headView, "setFrameSize:", CGSizeMake(width, objj_msgSend(self, "toolbarMaxY")));
    objj_msgSend(_dividerView, "setFrame:", CGRectMake(0.0, CGRectGetMaxY(objj_msgSend(_headView, "frame")), width, 1.0));
    var dividerMaxY = CGRectGetMaxY(objj_msgSend(_dividerView, "frame"));
    objj_msgSend(_bodyView, "setFrame:", CGRectMake(0.0, dividerMaxY, width, CGRectGetHeight(bounds) - dividerMaxY));
    objj_msgSend(_titleField, "setFrame:", CGRectMake(10.0, 3.0, width - 20.0, CGRectGetHeight(objj_msgSend(_titleField, "frame"))));
    objj_msgSend(objj_msgSend(theWindow, "contentView"), "setFrameOrigin:", CGPointMake(0.0, CGRectGetMaxY(objj_msgSend(_dividerView, "frame"))));
}
},["void"]), new objj_method(sel_getUid("setTitle:"), function $_CPStandardWindowView__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_titleField, "setStringValue:", aTitle);
}
},["void","CPString"]), new objj_method(sel_getUid("mouseDown:"), function $_CPStandardWindowView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (CGRectContainsPoint(objj_msgSend(_headView, "frame"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)))
        return objj_msgSend(self, "trackMoveWithEvent:", anEvent);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "mouseDown:", anEvent);
}
},["void","CPEvent"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("bodyBackgroundColor"), function $_CPStandardWindowView__bodyBackgroundColor(self, _cmd)
{ with(self)
{
    if (!_CPStandardWindowViewBodyBackgroundColor)
        _CPStandardWindowViewBodyBackgroundColor = objj_msgSend(CPColor, "colorWithWhite:alpha:", 0.96, 1.0);
    return _CPStandardWindowViewBodyBackgroundColor;
}
},["CPColor"]), new objj_method(sel_getUid("dividerBackgroundColor"), function $_CPStandardWindowView__dividerBackgroundColor(self, _cmd)
{ with(self)
{
    if (!_CPStandardWindowViewDividerBackgroundColor)
        _CPStandardWindowViewDividerBackgroundColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 125.0 / 255.0, 125.0 / 255.0, 125.0 / 255.0, 1.0);
    return _CPStandardWindowViewDividerBackgroundColor;
}
},["CPColor"]), new objj_method(sel_getUid("titleColor"), function $_CPStandardWindowView__titleColor(self, _cmd)
{ with(self)
{
    if (!_CPStandardWindowViewTitleBackgroundColor)
        _CPStandardWindowViewTitleBackgroundColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 44.0 / 255.0, 44.0 / 255.0, 44.0 / 255.0, 1.0);
    return _CPStandardWindowViewTitleBackgroundColor;
}
},["CPColor"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPStandardWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = CGRectMakeCopy(aFrameRect),
        titleBarHeight = objj_msgSend(self, "titleBarHeight") + 1.0;
    contentRect.origin.y += titleBarHeight;
    contentRect.size.height -= titleBarHeight;
    return contentRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPStandardWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = CGRectMakeCopy(aContentRect),
        titleBarHeight = objj_msgSend(self, "titleBarHeight") + 1.0;
    frameRect.origin.y -= titleBarHeight;
    frameRect.size.height += titleBarHeight;
    return frameRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("titleBarHeight"), function $_CPStandardWindowView__titleBarHeight(self, _cmd)
{ with(self)
{
    return STANDARD_TITLEBAR_HEIGHT;
}
},["float"])]);
}

