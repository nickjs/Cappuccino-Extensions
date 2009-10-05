i;8;CPView.ji;12;CPClipView.ji;12;CPScroller.jc;25917;
{var the_class = objj_allocateClassPair(CPView, "CPScrollView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_headerClipView"), new objj_ivar("_cornerView"), new objj_ivar("_hasVerticalScroller"), new objj_ivar("_hasHorizontalScroller"), new objj_ivar("_autohidesScrollers"), new objj_ivar("_verticalScroller"), new objj_ivar("_horizontalScroller"), new objj_ivar("_recursionCount"), new objj_ivar("_verticalLineScroll"), new objj_ivar("_verticalPageScroll"), new objj_ivar("_horizontalLineScroll"), new objj_ivar("_horizontalPageScroll")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPScrollView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _verticalLineScroll = 10.0;
        _verticalPageScroll = 10.0;
        _horizontalLineScroll = 10.0;
        _horizontalPageScroll = 10.0;
        _contentView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self, "addSubview:", _contentView);
        _headerClipView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "init");
        objj_msgSend(self, "addSubview:", _headerClipView);
        objj_msgSend(self, "setHasVerticalScroller:", YES);
        objj_msgSend(self, "setHasHorizontalScroller:", YES);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("contentSize"), function $CPScrollView__contentSize(self, _cmd)
{ with(self)
{
    return objj_msgSend(_contentView, "frame").size;
}
},["CGRect"]), new objj_method(sel_getUid("documentView"), function $CPScrollView__documentView(self, _cmd)
{ with(self)
{
    return objj_msgSend(_contentView, "documentView");
}
},["id"]), new objj_method(sel_getUid("setContentView:"), function $CPScrollView__setContentView_(self, _cmd, aContentView)
{ with(self)
{
    if (_contentView !== aContentView || !aContentView)
        return;
    var documentView = objj_msgSend(aContentView, "documentView");
    if (documentView)
        objj_msgSend(documentView, "removeFromSuperview");
    objj_msgSend(_contentView, "removeFromSuperview");
    _contentView = aContentView;
    objj_msgSend(_contentView, "setDocumentView:", documentView);
    objj_msgSend(self, "addSubview:", _contentView);
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
},["void","CPClipView"]), new objj_method(sel_getUid("contentView"), function $CPScrollView__contentView(self, _cmd)
{ with(self)
{
    return _contentView;
}
},["CPClipView"]), new objj_method(sel_getUid("setDocumentView:"), function $CPScrollView__setDocumentView_(self, _cmd, aView)
{ with(self)
{
    objj_msgSend(_contentView, "setDocumentView:", aView);
    objj_msgSend(self, "_updateCornerAndHeaderView");
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
},["void","CPView"]), new objj_method(sel_getUid("reflectScrolledClipView:"), function $CPScrollView__reflectScrolledClipView_(self, _cmd, aClipView)
{ with(self)
{
    if(_contentView !== aClipView)
        return;
    if (_recursionCount > 5)
        return;
    ++_recursionCount;
    var documentView = objj_msgSend(self, "documentView");
    if (!documentView)
    {
        if (_autohidesScrollers)
        {
            objj_msgSend(_verticalScroller, "setHidden:", YES);
            objj_msgSend(_horizontalScroller, "setHidden:", YES);
        }
        else
        {
        }
        objj_msgSend(_contentView, "setFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(_headerClipView, "setFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
        --_recursionCount;
        return;
    }
    var documentFrame = objj_msgSend(documentView, "frame"),
        contentFrame = objj_msgSend(self, "bounds"),
        headerClipViewFrame = objj_msgSend(self, "_headerClipViewFrame"),
        headerClipViewHeight = (headerClipViewFrame.size.height);
    contentFrame.origin.y += headerClipViewHeight;
    contentFrame.size.height -= headerClipViewHeight;
    var difference = { width:(documentFrame.size.width) - (contentFrame.size.width), height:(documentFrame.size.height) - (contentFrame.size.height) },
        verticalScrollerWidth = (objj_msgSend(_verticalScroller, "frame").size.width),
        horizontalScrollerHeight = (objj_msgSend(_horizontalScroller, "frame").size.height),
        hasVerticalScroll = difference.height > 0.0,
        hasHorizontalScroll = difference.width > 0.0,
        shouldShowVerticalScroller = _hasVerticalScroller && (!_autohidesScrollers || hasVerticalScroll),
        shouldShowHorizontalScroller = _hasHorizontalScroller && (!_autohidesScrollers || hasHorizontalScroll);
    if (shouldShowVerticalScroller)
    {
        difference.width += verticalScrollerWidth;
        hasHorizontalScroll = difference.width > 0.0;
        shouldShowHorizontalScroller = _hasHorizontalScroller && (!_autohidesScrollers || hasHorizontalScroll);
    }
    if (shouldShowHorizontalScroller)
    {
        difference.height += horizontalScrollerHeight;
        hasVerticalScroll = difference.height > 0.0;
        shouldShowVerticalScroller = _hasVerticalScroller && (!_autohidesScrollers || hasVerticalScroll);
    }
    objj_msgSend(_verticalScroller, "setHidden:", !shouldShowVerticalScroller);
    objj_msgSend(_verticalScroller, "setEnabled:", hasVerticalScroll);
    objj_msgSend(_horizontalScroller, "setHidden:", !shouldShowHorizontalScroller);
    objj_msgSend(_horizontalScroller, "setEnabled:", hasHorizontalScroll);
    if (shouldShowVerticalScroller)
        contentFrame.size.width -= verticalScrollerWidth;
    if (shouldShowHorizontalScroller)
        contentFrame.size.height -= horizontalScrollerHeight;
    var scrollPoint = objj_msgSend(_contentView, "bounds").origin,
        wasShowingVerticalScroller = !objj_msgSend(_verticalScroller, "isHidden"),
        wasShowingHorizontalScroller = !objj_msgSend(_horizontalScroller, "isHidden");
    if (shouldShowVerticalScroller)
    {
        var verticalScrollerY = MAX((objj_msgSend(self, "_cornerViewFrame").size.height), headerClipViewHeight),
            verticalScrollerHeight = (objj_msgSend(self, "bounds").size.height) - verticalScrollerY;
        if (shouldShowHorizontalScroller)
            verticalScrollerHeight -= horizontalScrollerHeight;
        objj_msgSend(_verticalScroller, "setFloatValue:", (difference.height <= 0.0) ? 0.0 : scrollPoint.y / difference.height);
        objj_msgSend(_verticalScroller, "setKnobProportion:", (contentFrame.size.height) / (documentFrame.size.height));
        objj_msgSend(_verticalScroller, "setFrame:", { origin: { x:(contentFrame.origin.x + contentFrame.size.width), y:verticalScrollerY }, size: { width:verticalScrollerWidth, height:verticalScrollerHeight } });
    }
    else if (wasShowingVerticalScroller)
    {
        objj_msgSend(_verticalScroller, "setFloatValue:", 0.0);
        objj_msgSend(_verticalScroller, "setKnobProportion:", 1.0);
    }
    if (shouldShowHorizontalScroller)
    {
        objj_msgSend(_horizontalScroller, "setFloatValue:", (difference.width <= 0.0) ? 0.0 : scrollPoint.x / difference.width);
        objj_msgSend(_horizontalScroller, "setKnobProportion:", (contentFrame.size.width) / (documentFrame.size.width));
        objj_msgSend(_horizontalScroller, "setFrame:", { origin: { x:0.0, y:(contentFrame.origin.y + contentFrame.size.height) }, size: { width:(contentFrame.size.width), height:horizontalScrollerHeight } });
    }
    else if (wasShowingHorizontalScroller)
    {
        objj_msgSend(_horizontalScroller, "setFloatValue:", 0.0);
        objj_msgSend(_horizontalScroller, "setKnobProportion:", 1.0);
    }
    objj_msgSend(_contentView, "setFrame:", contentFrame);
    objj_msgSend(_headerClipView, "setFrame:", headerClipViewFrame);
    objj_msgSend(_cornerView, "setFrame:", objj_msgSend(self, "_cornerViewFrame"));
    --_recursionCount;
}
},["void","CPClipView"]), new objj_method(sel_getUid("setHorizontalScroller:"), function $CPScrollView__setHorizontalScroller_(self, _cmd, aScroller)
{ with(self)
{
    if (_horizontalScroller === aScroller)
        return;
    objj_msgSend(_horizontalScroller, "removeFromSuperview");
    objj_msgSend(_horizontalScroller, "setTarget:", nil);
    objj_msgSend(_horizontalScroller, "setAction:", nil);
    _horizontalScroller = aScroller;
    objj_msgSend(_horizontalScroller, "setTarget:", self);
    objj_msgSend(_horizontalScroller, "setAction:", sel_getUid("_horizontalScrollerDidScroll:"));
    objj_msgSend(self, "addSubview:", _horizontalScroller);
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
},["void","CPScroller"]), new objj_method(sel_getUid("horizontalScroller"), function $CPScrollView__horizontalScroller(self, _cmd)
{ with(self)
{
    return _horizontalScroller;
}
},["CPScroller"]), new objj_method(sel_getUid("setHasHorizontalScroller:"), function $CPScrollView__setHasHorizontalScroller_(self, _cmd, shouldHaveHorizontalScroller)
{ with(self)
{
    if (_hasHorizontalScroller === shouldHaveHorizontalScroller)
        return;
    _hasHorizontalScroller = shouldHaveHorizontalScroller;
    if (_hasHorizontalScroller && !_horizontalScroller)
        objj_msgSend(self, "setHorizontalScroller:", objj_msgSend(objj_msgSend(CPScroller, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, (objj_msgSend(self, "bounds").size.width), objj_msgSend(CPScroller, "scrollerWidth"))));
    else if (!_hasHorizontalScroller && _horizontalScroller)
    {
        objj_msgSend(_horizontalScroller, "setHidden:", YES);
        objj_msgSend(self, "reflectScrolledClipView:", _contentView);
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("hasHorizontalScroller"), function $CPScrollView__hasHorizontalScroller(self, _cmd)
{ with(self)
{
    return _hasHorizontalScroller;
}
},["BOOL"]), new objj_method(sel_getUid("setVerticalScroller:"), function $CPScrollView__setVerticalScroller_(self, _cmd, aScroller)
{ with(self)
{
    if (_verticalScroller === aScroller)
        return;
    objj_msgSend(_verticalScroller, "removeFromSuperview");
    objj_msgSend(_verticalScroller, "setTarget:", nil);
    objj_msgSend(_verticalScroller, "setAction:", nil);
    _verticalScroller = aScroller;
    objj_msgSend(_verticalScroller, "setTarget:", self);
    objj_msgSend(_verticalScroller, "setAction:", sel_getUid("_verticalScrollerDidScroll:"));
    objj_msgSend(self, "addSubview:", _verticalScroller);
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
},["void","CPScroller"]), new objj_method(sel_getUid("verticalScroller"), function $CPScrollView__verticalScroller(self, _cmd)
{ with(self)
{
    return _verticalScroller;
}
},["CPScroller"]), new objj_method(sel_getUid("setHasVerticalScroller:"), function $CPScrollView__setHasVerticalScroller_(self, _cmd, shouldHaveVerticalScroller)
{ with(self)
{
    if (_hasVerticalScroller === shouldHaveVerticalScroller)
        return;
    _hasVerticalScroller = shouldHaveVerticalScroller;
    if (_hasVerticalScroller && !_verticalScroller)
        objj_msgSend(self, "setVerticalScroller:", objj_msgSend(objj_msgSend(CPScroller, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:objj_msgSend(CPScroller, "scrollerWidth"), height:(objj_msgSend(self, "bounds").size.height) } }));
    else if (!_hasVerticalScroller && _verticalScroller)
    {
        objj_msgSend(_verticalScroller, "setHidden:", YES);
        objj_msgSend(self, "reflectScrolledClipView:", _contentView);
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("hasVerticalScroller"), function $CPScrollView__hasVerticalScroller(self, _cmd)
{ with(self)
{
    return _hasVerticalScroller;
}
},["BOOL"]), new objj_method(sel_getUid("setAutohidesScrollers:"), function $CPScrollView__setAutohidesScrollers_(self, _cmd, autohidesScrollers)
{ with(self)
{
    if (_autohidesScrollers == autohidesScrollers)
        return;
    _autohidesScrollers = autohidesScrollers;
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
},["void","BOOL"]), new objj_method(sel_getUid("autohidesScrollers"), function $CPScrollView__autohidesScrollers(self, _cmd)
{ with(self)
{
    return _autohidesScrollers;
}
},["BOOL"]), new objj_method(sel_getUid("_updateCornerAndHeaderView"), function $CPScrollView___updateCornerAndHeaderView(self, _cmd)
{ with(self)
{
    var documentView = objj_msgSend(self, "documentView"),
        currentHeaderView = objj_msgSend(self, "_headerView"),
        documentHeaderView = objj_msgSend(documentView, "respondsToSelector:", sel_getUid("headerView")) ? objj_msgSend(documentView, "headerView") : nil;
    if (currentHeaderView !== documentHeaderView)
    {
        objj_msgSend(currentHeaderView, "removeFromSuperview");
        objj_msgSend(_headerClipView, "setDocumentView:", documentHeaderView);
    }
    var documentCornerView = objj_msgSend(documentView, "respondsToSelector:", sel_getUid("cornerView")) ? objj_msgSend(documentView, "cornerView") : nil;
    if (_cornerView !== documentCornerView)
    {
        objj_msgSend(_cornerView, "removeFromSuperview");
        _cornerView = documentCornerView;
        if (_cornerView)
            objj_msgSend(self, "addSubview:", _cornerView);
    }
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
},["void"]), new objj_method(sel_getUid("_headerView"), function $CPScrollView___headerView(self, _cmd)
{ with(self)
{
    var headerClipViewSubviews = objj_msgSend(_headerClipView, "subviews");
    return objj_msgSend(headerClipViewSubviews, "count") ? headerClipViewSubviews[0] : nil;
}
},["CPView"]), new objj_method(sel_getUid("_cornerViewFrame"), function $CPScrollView___cornerViewFrame(self, _cmd)
{ with(self)
{
    if (!_cornerView)
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    var bounds = objj_msgSend(self, "bounds"),
        frame = objj_msgSend(_cornerView, "frame");
    frame.origin.x = (bounds.origin.x + bounds.size.width) - (frame.size.width);
    frame.origin.y = 0;
    return frame;
}
},["CGRect"]), new objj_method(sel_getUid("_headerClipViewFrame"), function $CPScrollView___headerClipViewFrame(self, _cmd)
{ with(self)
{
    var headerView = objj_msgSend(self, "_headerView");
    if (!headerView)
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    var frame = objj_msgSend(self, "bounds");
    frame.size.height = (objj_msgSend(headerView, "frame").size.height);
    frame.size.width -= (objj_msgSend(self, "_cornerViewFrame").size.width);
    return frame;
}
},["CGRect"]), new objj_method(sel_getUid("_verticalScrollerDidScroll:"), function $CPScrollView___verticalScrollerDidScroll_(self, _cmd, aScroller)
{ with(self)
{
   var value = objj_msgSend(aScroller, "floatValue"),
        documentFrame = objj_msgSend(objj_msgSend(_contentView, "documentView"), "frame");
        contentBounds = objj_msgSend(_contentView, "bounds");
    switch (objj_msgSend(_verticalScroller, "hitPart"))
    {
        case CPScrollerDecrementLine: contentBounds.origin.y -= _verticalLineScroll;
                                        break;
        case CPScrollerIncrementLine: contentBounds.origin.y += _verticalLineScroll;
                                        break;
        case CPScrollerDecrementPage: contentBounds.origin.y -= (contentBounds.size.height) - _verticalPageScroll;
                                        break;
        case CPScrollerIncrementPage: contentBounds.origin.y += (contentBounds.size.height) - _verticalPageScroll;
                                        break;
        case CPScrollerKnobSlot:
        case CPScrollerKnob:
        default: contentBounds.origin.y = ROUND(value * ((documentFrame.size.height) - (contentBounds.size.height)));
    }
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
}
},["void","CPScroller"]), new objj_method(sel_getUid("_horizontalScrollerDidScroll:"), function $CPScrollView___horizontalScrollerDidScroll_(self, _cmd, aScroller)
{ with(self)
{
   var value = objj_msgSend(aScroller, "floatValue"),
       documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
       contentBounds = objj_msgSend(_contentView, "bounds");
    switch (objj_msgSend(_horizontalScroller, "hitPart"))
    {
        case CPScrollerDecrementLine: contentBounds.origin.x -= _horizontalLineScroll;
                                        break;
        case CPScrollerIncrementLine: contentBounds.origin.x += _horizontalLineScroll;
                                        break;
        case CPScrollerDecrementPage: contentBounds.origin.x -= (contentBounds.size.width) - _horizontalPageScroll;
                                        break;
        case CPScrollerIncrementPage: contentBounds.origin.x += (contentBounds.size.width) - _horizontalPageScroll;
                                        break;
        case CPScrollerKnobSlot:
        case CPScrollerKnob:
        default: contentBounds.origin.x = ROUND(value * ((documentFrame.size.width) - (contentBounds.size.width)));
    }
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
    objj_msgSend(_headerClipView, "scrollToPoint:", CGPointMake(contentBounds.origin.x, 0.0));
}
},["void","CPScroller"]), new objj_method(sel_getUid("tile"), function $CPScrollView__tile(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPScrollView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
},["void","CGSize"]), new objj_method(sel_getUid("setLineScroll:"), function $CPScrollView__setLineScroll_(self, _cmd, aLineScroll)
{ with(self)
{
    objj_msgSend(self, "setHorizonalLineScroll:", aLineScroll);
    objj_msgSend(self, "setVerticalLineScroll:", aLineScroll);
}
},["void","float"]), new objj_method(sel_getUid("lineScroll"), function $CPScrollView__lineScroll(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "horizontalLineScroll");
}
},["float"]), new objj_method(sel_getUid("setHorizontalLineScroll:"), function $CPScrollView__setHorizontalLineScroll_(self, _cmd, aLineScroll)
{ with(self)
{
    _horizontalLineScroll = aLineScroll;
}
},["void","float"]), new objj_method(sel_getUid("horizontalLineScroll"), function $CPScrollView__horizontalLineScroll(self, _cmd)
{ with(self)
{
    return _horizontalLineScroll;
}
},["float"]), new objj_method(sel_getUid("setVerticalLineScroll:"), function $CPScrollView__setVerticalLineScroll_(self, _cmd, aLineScroll)
{ with(self)
{
    _verticalLineScroll = aLineScroll;
}
},["void","float"]), new objj_method(sel_getUid("verticalLineScroll"), function $CPScrollView__verticalLineScroll(self, _cmd)
{ with(self)
{
    return _verticalLineScroll;
}
},["float"]), new objj_method(sel_getUid("setPageScroll:"), function $CPScrollView__setPageScroll_(self, _cmd, aPageScroll)
{ with(self)
{
    objj_msgSend(self, "setHorizontalPageScroll:", aPageScroll);
    objj_msgSend(self, "setVerticalPageScroll:", aPageScroll);
}
},["void","float"]), new objj_method(sel_getUid("pageScroll"), function $CPScrollView__pageScroll(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "horizontalPageScroll");
}
},["float"]), new objj_method(sel_getUid("setHorizontalPageScroll:"), function $CPScrollView__setHorizontalPageScroll_(self, _cmd, aPageScroll)
{ with(self)
{
    _horizontalPageScroll = aPageScroll;
}
},["void","float"]), new objj_method(sel_getUid("horizontalPageScroll"), function $CPScrollView__horizontalPageScroll(self, _cmd)
{ with(self)
{
    return _horizontalPageScroll;
}
},["float"]), new objj_method(sel_getUid("setVerticalPageScroll:"), function $CPScrollView__setVerticalPageScroll_(self, _cmd, aPageScroll)
{ with(self)
{
    _verticalPageScroll = aPageScroll;
}
},["void","float"]), new objj_method(sel_getUid("verticalPageScroll"), function $CPScrollView__verticalPageScroll(self, _cmd)
{ with(self)
{
    return _verticalPageScroll;
}
},["float"]), new objj_method(sel_getUid("scrollWheel:"), function $CPScrollView__scrollWheel_(self, _cmd, anEvent)
{ with(self)
{
   var documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
       contentBounds = objj_msgSend(_contentView, "bounds");
    contentBounds.origin.x = ROUND(contentBounds.origin.x + objj_msgSend(anEvent, "deltaX") * _horizontalLineScroll);
    contentBounds.origin.y = ROUND(contentBounds.origin.y + objj_msgSend(anEvent, "deltaY") * _verticalLineScroll);
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
    objj_msgSend(_headerClipView, "scrollToPoint:", CGPointMake(contentBounds.origin.x, 0.0));
}
},["void","CPEvent"]), new objj_method(sel_getUid("keyDown:"), function $CPScrollView__keyDown_(self, _cmd, anEvent)
{ with(self)
{
    var keyCode = objj_msgSend(anEvent, "keyCode"),
        documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
        contentBounds = objj_msgSend(_contentView, "bounds");
    switch (keyCode)
    {
        case 33:
                    contentBounds.origin.y -= (contentBounds.size.height) - _verticalPageScroll;
                    break;
        case 34:
                    contentBounds.origin.y += (contentBounds.size.height) - _verticalPageScroll;
                    break;
        case 38:
                    contentBounds.origin.y -= _verticalLineScroll;
                    break;
        case 40:
                    contentBounds.origin.y += _verticalLineScroll;
                    break;
        case 37:
                    contentBounds.origin.x -= _horizontalLineScroll;
                    break;
        case 49:
                    contentBounds.origin.x += _horizontalLineScroll;
                    break;
        default: return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "keyDown:", anEvent);
    }
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
    objj_msgSend(_headerClipView, "scrollToPoint:", CGPointMake(contentBounds.origin, 0));
}
},["void","CPEvent"])]);
}
var CPScrollViewContentViewKey = "CPScrollViewContentView",
    CPScrollViewVLineScrollKey = "CPScrollViewVLineScroll",
    CPScrollViewHLineScrollKey = "CPScrollViewHLineScroll",
    CPScrollViewVPageScrollKey = "CPScrollViewVPageScroll",
    CPScrollViewHPageScrollKey = "CPScrollViewHPageScroll",
    CPScrollViewHasVScrollerKey = "CPScrollViewHasVScroller",
    CPScrollViewHasHScrollerKey = "CPScrollViewHasHScroller",
    CPScrollViewVScrollerKey = "CPScrollViewVScroller",
    CPScrollViewHScrollerKey = "CPScrollViewHScroller",
    CPScrollViewAutohidesScrollerKey = "CPScrollViewAutohidesScroller";
{
var the_class = objj_getClass("CPScrollView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPScrollView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPScrollView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder))
    {
        _verticalLineScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewVLineScrollKey);
        _verticalPageScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewVPageScrollKey);
        _horizontalLineScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewHLineScrollKey);
        _horizontalPageScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewHPageScrollKey);
        _contentView = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewContentViewKey);
        _verticalScroller = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewVScrollerKey);
        _horizontalScroller = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewHScrollerKey);
        _hasVerticalScroller = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewHasVScrollerKey);
        _hasHorizontalScroller = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewHasHScrollerKey);
        _autohidesScrollers = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewAutohidesScrollerKey);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("reflectScrolledClipView:"), self, _contentView, 0, [CPDefaultRunLoopMode]);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPScrollView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _contentView, CPScrollViewContentViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _verticalScroller, CPScrollViewVScrollerKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _horizontalScroller, CPScrollViewHScrollerKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _verticalLineScroll, CPScrollViewVLineScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _verticalPageScroll, CPScrollViewVPageScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _horizontalLineScroll, CPScrollViewHLineScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _horizontalPageScroll, CPScrollViewHPageScrollKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _hasVerticalScroller, CPScrollViewHasVScrollerKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _hasHorizontalScroller, CPScrollViewHasHScrollerKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _autohidesScrollers, CPScrollViewAutohidesScrollerKey);
}
},["void","CPCoder"])]);
}

