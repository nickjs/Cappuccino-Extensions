I;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;13;CPResponder.ji;10;CPScreen.ji;18;CPPlatformWindow.jc;65693;
CPBorderlessWindowMask = 0;
CPTitledWindowMask = 1 << 0;
CPClosableWindowMask = 1 << 1;
CPMiniaturizableWindowMask = 1 << 2;
CPResizableWindowMask = 1 << 3;
CPTexturedBackgroundWindowMask = 1 << 8;
CPBorderlessBridgeWindowMask = 1 << 20;
CPHUDBackgroundWindowMask = 1 << 21;
CPWindowNotSizable = 0;
CPWindowMinXMargin = 1;
CPWindowWidthSizable = 2;
CPWindowMaxXMargin = 4;
CPWindowMinYMargin = 8;
CPWindowHeightSizable = 16;
CPWindowMaxYMargin = 32;
CPBackgroundWindowLevel = -1;
CPNormalWindowLevel = 0;
CPFloatingWindowLevel = 3;
CPSubmenuWindowLevel = 3;
CPTornOffMenuWindowLevel = 3;
CPMainMenuWindowLevel = 24;
CPStatusWindowLevel = 25;
CPModalPanelWindowLevel = 8;
CPPopUpMenuWindowLevel = 101;
CPDraggingWindowLevel = 500;
CPScreenSaverWindowLevel = 1000;
CPWindowOut = 0;
CPWindowAbove = 1;
CPWindowBelow = 2;
CPWindowWillCloseNotification = "CPWindowWillCloseNotification";
CPWindowDidBecomeMainNotification = "CPWindowDidBecomeMainNotification";
CPWindowDidResignMainNotification = "CPWindowDidResignMainNotification";
CPWindowDidMoveNotification = "CPWindowDidMoveNotification";
var SHADOW_MARGIN_LEFT = 20.0,
    SHADOW_MARGIN_RIGHT = 19.0,
    SHADOW_MARGIN_TOP = 10.0,
    SHADOW_MARGIN_BOTTOM = 10.0,
    SHADOW_DISTANCE = 5.0,
    _CPWindowShadowColor = nil;
var CPWindowSaveImage = nil,
    CPWindowSavingImage = nil;
{var the_class = objj_allocateClassPair(CPResponder, "CPWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_platformWindow"), new objj_ivar("_windowNumber"), new objj_ivar("_styleMask"), new objj_ivar("_frame"), new objj_ivar("_level"), new objj_ivar("_isVisible"), new objj_ivar("_isAnimating"), new objj_ivar("_hasShadow"), new objj_ivar("_isMovableByWindowBackground"), new objj_ivar("_supportsMultipleDocuments"), new objj_ivar("_isDocumentEdited"), new objj_ivar("_isDocumentSaving"), new objj_ivar("_shadowView"), new objj_ivar("_windowView"), new objj_ivar("_contentView"), new objj_ivar("_toolbarView"), new objj_ivar("_mouseEnteredStack"), new objj_ivar("_leftMouseDownView"), new objj_ivar("_rightMouseDownView"), new objj_ivar("_toolbar"), new objj_ivar("_firstResponder"), new objj_ivar("_initialFirstResponder"), new objj_ivar("_delegate"), new objj_ivar("_title"), new objj_ivar("_acceptsMouseMovedEvents"), new objj_ivar("_ignoresMouseEvents"), new objj_ivar("_windowController"), new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_undoManager"), new objj_ivar("_representedURL"), new objj_ivar("_registeredDraggedTypes"), new objj_ivar("_registeredDraggedTypesArray"), new objj_ivar("_inclusiveRegisteredDraggedTypes"), new objj_ivar("_defaultButton"), new objj_ivar("_defaultButtonEnabled"), new objj_ivar("_autorecalculatesKeyViewLoop"), new objj_ivar("_keyViewLoopIsDirty"), new objj_ivar("_sharesChromeWithPlatformWindow"), new objj_ivar("_DOMElement"), new objj_ivar("_autoresizingMask"), new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector"), new objj_ivar("_isFullPlatformWindow"), new objj_ivar("_fullPlatformWindowSession")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $CPWindow__initWithContentRect_styleMask_(self, _cmd, aContentRect, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        var windowViewClass = objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForStyleMask:", aStyleMask);
        _frame = objj_msgSend(windowViewClass, "frameRectForContentRect:", aContentRect);
        objj_msgSend(self, "_setSharesChromeWithPlatformWindow:", !objj_msgSend(CPPlatform, "isBrowser"));
        if (objj_msgSend(CPPlatform, "isBrowser"))
            objj_msgSend(self, "setPlatformWindow:", objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"));
        else
        {
            objj_msgSend(self, "setPlatformWindow:", objj_msgSend(objj_msgSend(CPPlatformWindow, "alloc"), "initWithContentRect:", _frame));
            objj_msgSend(self, "platformWindow")._only = self;
        }
        _isFullPlatformWindow = NO;
        _registeredDraggedTypes = objj_msgSend(CPSet, "set");
        _registeredDraggedTypesArray = [];
        _windowNumber = objj_msgSend(CPApp._windows, "count");
        CPApp._windows[_windowNumber] = self;
        _styleMask = aStyleMask;
        objj_msgSend(self, "setLevel:", CPNormalWindowLevel);
        _minSize = CGSizeMake(0.0, 0.0);
        _maxSize = CGSizeMake(1000000.0, 1000000.0);
        _windowView = objj_msgSend(objj_msgSend(windowViewClass, "alloc"), "initWithFrame:styleMask:", CGRectMake(0.0, 0.0, CGRectGetWidth(_frame), CGRectGetHeight(_frame)), aStyleMask);
        objj_msgSend(_windowView, "_setWindow:", self);
        objj_msgSend(_windowView, "setNextResponder:", self);
        objj_msgSend(self, "setMovableByWindowBackground:", aStyleMask & CPHUDBackgroundWindowMask);
        objj_msgSend(self, "setContentView:", objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero()));
        _firstResponder = self;
        _DOMElement = document.createElement("div");
        _DOMElement.style.position = "absolute";
        _DOMElement.style.visibility = "visible";
        _DOMElement.style.zIndex = 0;
        if (!objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
        {
            if (NULL) var ____p = _CGPointApplyAffineTransform(CGPointMake((_frame.origin.x), (_frame.origin.y)), NULL); else var ____p = { x:(_frame.origin.x), y:(_frame.origin.y) }; _DOMElement.style.left = ROUND(____p.x) + "px";_DOMElement.style.top = ROUND(____p.y) + "px";;
        }
        _DOMElement.style.width = MAX(0.0, ROUND(1)) + "px"; _DOMElement.style.height = MAX(0.0, ROUND(1)) + "px";;
        _DOMElement.appendChild(_windowView._DOMElement);
        objj_msgSend(self, "setNextResponder:", CPApp);
        objj_msgSend(self, "setHasShadow:", aStyleMask !== CPBorderlessWindowMask);
        if (aStyleMask & CPBorderlessBridgeWindowMask)
            objj_msgSend(self, "setFullPlatformWindow:", YES);
        _defaultButtonEnabled = YES;
        _keyViewLoopIsDirty = YES;
    }
    return self;
}
},["id","CGRect","unsignedint"]), new objj_method(sel_getUid("platformWindow"), function $CPWindow__platformWindow(self, _cmd)
{ with(self)
{
    return _platformWindow;
}
},["CPPlatformWindow"]), new objj_method(sel_getUid("setPlatformWindow:"), function $CPWindow__setPlatformWindow_(self, _cmd, aPlatformWindow)
{ with(self)
{
    _platformWindow = aPlatformWindow;
}
},["void","CPPlatformWindow"]), new objj_method(sel_getUid("setSupportsMultipleDocuments:"), function $CPWindow__setSupportsMultipleDocuments_(self, _cmd, shouldSupportMultipleDocuments)
{ with(self)
{
    shouldSupportMultipleDocuments = !!shouldSupportMultipleDocuments;
    _supportsMultipleDocuments = shouldSupportMultipleDocuments;
}
},["void","BOOL"]), new objj_method(sel_getUid("supportsMultipleDocuments"), function $CPWindow__supportsMultipleDocuments(self, _cmd)
{ with(self)
{
    return _supportsMultipleDocuments;
}
},["BOOL"]), new objj_method(sel_getUid("awakeFromCib"), function $CPWindow__awakeFromCib(self, _cmd)
{ with(self)
{
    if (_initialFirstResponder)
        objj_msgSend(self, "makeFirstResponder:", _initialFirstResponder);
    _keyViewLoopIsDirty = !objj_msgSend(self, "_hasKeyViewLoop");
}
},["void"]), new objj_method(sel_getUid("_setWindowView:"), function $CPWindow___setWindowView_(self, _cmd, aWindowView)
{ with(self)
{
    if (_windowView === aWindowView)
        return;
    var oldWindowView = _windowView;
    _windowView = aWindowView;
    if (oldWindowView)
    {
        objj_msgSend(oldWindowView, "_setWindow:", nil);
        objj_msgSend(oldWindowView, "noteToolbarChanged");
        _DOMElement.removeChild(oldWindowView._DOMElement);
    }
    if (_windowView)
    {
        _DOMElement.appendChild(_windowView._DOMElement);
        var contentRect = objj_msgSend(_contentView, "convertRect:toView:", objj_msgSend(_contentView, "bounds"), nil);
        contentRect.origin = objj_msgSend(self, "convertBaseToGlobal:", contentRect.origin);
        objj_msgSend(_windowView, "_setWindow:", self);
        objj_msgSend(_windowView, "setNextResponder:", self);
        objj_msgSend(_windowView, "addSubview:", _contentView);
        objj_msgSend(_windowView, "setTitle:", _title);
        objj_msgSend(_windowView, "noteToolbarChanged");
        objj_msgSend(self, "setFrame:", objj_msgSend(self, "frameRectForContentRect:", contentRect));
    }
}
},["void","CPView"]), new objj_method(sel_getUid("setFullPlatformWindow:"), function $CPWindow__setFullPlatformWindow_(self, _cmd, shouldBeFullPlatformWindow)
{ with(self)
{
    if (!objj_msgSend(_platformWindow, "supportsFullPlatformWindows"))
        return;
    shouldBeFullPlatformWindow = !!shouldBeFullPlatformWindow;
    if (_isFullPlatformWindow === shouldBeFullPlatformWindow)
        return;
    _isFullPlatformWindow = shouldBeFullPlatformWindow;
    if (_isFullPlatformWindow)
    {
        _fullPlatformWindowSession = _CPWindowFullPlatformWindowSessionMake(_windowView, objj_msgSend(self, "contentRectForFrameRect:", objj_msgSend(self, "frame")), objj_msgSend(self, "hasShadow"), objj_msgSend(self, "level"));
        var fullPlatformWindowViewClass = objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForFullPlatformWindowStyleMask:", _styleMask),
            windowView = objj_msgSend(objj_msgSend(fullPlatformWindowViewClass, "alloc"), "initWithFrame:styleMask:", CGRectMakeZero(), _styleMask);
        objj_msgSend(self, "_setWindowView:", windowView);
        objj_msgSend(self, "setLevel:", CPBackgroundWindowLevel);
        objj_msgSend(self, "setHasShadow:", NO);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowWidthSizable | CPWindowHeightSizable);
        objj_msgSend(self, "setFrame:", objj_msgSend(_platformWindow, "visibleFrame"));
    }
    else
    {
        var windowView = _fullPlatformWindowSession.windowView;
        objj_msgSend(self, "_setWindowView:", windowView);
        objj_msgSend(self, "setLevel:", _fullPlatformWindowSession.level);
        objj_msgSend(self, "setHasShadow:", _fullPlatformWindowSession.hasShadow);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowNotSizable);
        objj_msgSend(self, "setFrame:", objj_msgSend(windowView, "frameRectForContentRect:", _fullPlatformWindowSession.contentRect));
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("isFullPlatformWindow"), function $CPWindow__isFullPlatformWindow(self, _cmd)
{ with(self)
{
    return _isFullPlatformWindow;
}
},["BOOL"]), new objj_method(sel_getUid("styleMask"), function $CPWindow__styleMask(self, _cmd)
{ with(self)
{
    return _styleMask;
}
},["unsigned"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $CPWindow__contentRectForFrameRect_(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(_windowView, "contentRectForFrameRect:", aFrame);
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $CPWindow__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    return objj_msgSend(_windowView, "frameRectForContentRect:", aContentRect);
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frame"), function $CPWindow__frame(self, _cmd)
{ with(self)
{
    return { origin: { x:_frame.origin.x, y:_frame.origin.y }, size: { width:_frame.size.width, height:_frame.size.height } };
}
},["CGRect"]), new objj_method(sel_getUid("setFrame:display:animate:"), function $CPWindow__setFrame_display_animate_(self, _cmd, aFrame, shouldDisplay, shouldAnimate)
{ with(self)
{
    if (shouldAnimate)
    {
        var animation = objj_msgSend(objj_msgSend(_CPWindowFrameAnimation, "alloc"), "initWithWindow:targetFrame:", self, aFrame);
        objj_msgSend(animation, "startAnimation");
    }
    else
    {
        var origin = _frame.origin,
            newOrigin = aFrame.origin;
        if (!(origin.x == newOrigin.x && origin.y == newOrigin.y))
        {
            origin.x = newOrigin.x;
            origin.y = newOrigin.y;
            if (!objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
            {
                if (NULL) var ____p = _CGPointApplyAffineTransform(CGPointMake(origin.x, origin.y), NULL); else var ____p = { x:origin.x, y:origin.y }; _DOMElement.style.left = ROUND(____p.x) + "px";_DOMElement.style.top = ROUND(____p.y) + "px";;
            }
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidMoveNotification, self);
        }
        var size = _frame.size,
            newSize = aFrame.size;
        if (!(size.width == newSize.width && size.height == newSize.height))
        {
            size.width = MIN(MAX(newSize.width, _minSize.width), _maxSize.width);
            size.height = MIN(MAX(newSize.height, _minSize.height), _maxSize.height);
            objj_msgSend(_windowView, "setFrameSize:", size);
            if (_hasShadow)
                objj_msgSend(_shadowView, "setFrameSize:", { width:SHADOW_MARGIN_LEFT + size.width + SHADOW_MARGIN_RIGHT, height:SHADOW_MARGIN_BOTTOM + size.height + SHADOW_MARGIN_TOP + SHADOW_DISTANCE });
            if (!_isAnimating && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidResize:")))
                objj_msgSend(_delegate, "windowDidResize:", self);
        }
        if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
            objj_msgSend(_platformWindow, "setContentRect:", _frame);
    }
}
},["void","CGRect","BOOL","BOOL"]), new objj_method(sel_getUid("setFrame:display:"), function $CPWindow__setFrame_display_(self, _cmd, aFrame, shouldDisplay)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "setFrame:display:animate:", aFrame, shouldDisplay, NO);
}
},["void","CGRect","BOOL"]), new objj_method(sel_getUid("setFrame:"), function $CPWindow__setFrame_(self, _cmd, aFrame)
{ with(self)
{
    objj_msgSend(self, "setFrame:display:animate:", aFrame, YES, NO);
}
},["void","CGRect"]), new objj_method(sel_getUid("setFrameOrigin:"), function $CPWindow__setFrameOrigin_(self, _cmd, anOrigin)
{ with(self)
{
    objj_msgSend(self, "setFrame:display:animate:", { origin: { x:anOrigin.x, y:anOrigin.y }, size: { width:(_frame.size.width), height:(_frame.size.height) } }, YES, NO);
}
},["void","CGPoint"]), new objj_method(sel_getUid("setFrameSize:"), function $CPWindow__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "setFrame:display:animate:", { origin: { x:(_frame.origin.x), y:(_frame.origin.y) }, size: { width:aSize.width, height:aSize.height } }, YES, NO);
}
},["void","CGSize"]), new objj_method(sel_getUid("orderFront:"), function $CPWindow__orderFront_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(_platformWindow, "orderFront:", self);
    objj_msgSend(_platformWindow, "order:window:relativeTo:", CPWindowAbove, self, nil);
}
},["void","id"]), new objj_method(sel_getUid("orderBack:"), function $CPWindow__orderBack_(self, _cmd, aSender)
{ with(self)
{
}
},["void","id"]), new objj_method(sel_getUid("orderOut:"), function $CPWindow__orderOut_(self, _cmd, aSender)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowWillClose:")))
        objj_msgSend(_delegate, "windowWillClose:", self);
    objj_msgSend(_platformWindow, "order:window:relativeTo:", CPWindowOut, self, nil);
    if (objj_msgSend(CPApp, "keyWindow") == self)
    {
        objj_msgSend(self, "resignKeyWindow");
        CPApp._keyWindow = nil;
    }
    if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
        objj_msgSend(_platformWindow, "orderOut:", self);
}
},["void","id"]), new objj_method(sel_getUid("orderWindow:relativeTo:"), function $CPWindow__orderWindow_relativeTo_(self, _cmd, aPlace, otherWindowNumber)
{ with(self)
{
    objj_msgSend(_platformWindow, "order:window:relativeTo:", aPlace, self, CPApp._windows[otherWindowNumber]);
}
},["void","CPWindowOrderingMode","int"]), new objj_method(sel_getUid("setLevel:"), function $CPWindow__setLevel_(self, _cmd, aLevel)
{ with(self)
{
    _level = aLevel;
    if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
        objj_msgSend(_platformWindow, "setLevel:", aLevel);
}
},["void","int"]), new objj_method(sel_getUid("level"), function $CPWindow__level(self, _cmd)
{ with(self)
{
    return _level;
}
},["int"]), new objj_method(sel_getUid("isVisible"), function $CPWindow__isVisible(self, _cmd)
{ with(self)
{
    return _isVisible;
}
},["BOOL"]), new objj_method(sel_getUid("showsResizeIndicator"), function $CPWindow__showsResizeIndicator(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "showsResizeIndicator");
}
},["BOOL"]), new objj_method(sel_getUid("setShowsResizeIndicator:"), function $CPWindow__setShowsResizeIndicator_(self, _cmd, shouldShowResizeIndicator)
{ with(self)
{
    objj_msgSend(_windowView, "setShowsResizeIndicator:", shouldShowResizeIndicator);
}
},["void","BOOL"]), new objj_method(sel_getUid("resizeIndicatorOffset"), function $CPWindow__resizeIndicatorOffset(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "resizeIndicatorOffset");
}
},["CGSize"]), new objj_method(sel_getUid("setResizeIndicatorOffset:"), function $CPWindow__setResizeIndicatorOffset_(self, _cmd, anOffset)
{ with(self)
{
    objj_msgSend(_windowView, "setResizeIndicatorOffset:", anOffset);
}
},["void","CGSize"]), new objj_method(sel_getUid("setContentView:"), function $CPWindow__setContentView_(self, _cmd, aView)
{ with(self)
{
    if (_contentView)
        objj_msgSend(_contentView, "removeFromSuperview");
    var bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(_frame), CGRectGetHeight(_frame));
    _contentView = aView;
    objj_msgSend(_contentView, "setFrame:", objj_msgSend(self, "contentRectForFrameRect:", bounds));
    objj_msgSend(_contentView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(_windowView, "addSubview:", _contentView);
}
},["void","CPView"]), new objj_method(sel_getUid("contentView"), function $CPWindow__contentView(self, _cmd)
{ with(self)
{
    return _contentView;
}
},["CPView"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPWindow__setBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    objj_msgSend(_windowView, "setBackgroundColor:", aColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CPWindow__backgroundColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "backgroundColor");
}
},["CPColor"]), new objj_method(sel_getUid("setMinSize:"), function $CPWindow__setMinSize_(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_minSize, aSize))
        return;
    _minSize = CGSizeCreateCopy(aSize);
    var size = CGSizeMakeCopy(objj_msgSend(self, "frame").size),
        needsFrameChange = NO;
    if (size.width < _minSize.width)
    {
        size.width = _minSize.width;
        needsFrameChange = YES;
    }
    if (size.height < _minSize.height)
    {
        size.height = _minSize.height;
        needsFrameChange = YES;
    }
    if (needsFrameChange)
        objj_msgSend(self, "setFrameSize:", size);
}
},["void","CGSize"]), new objj_method(sel_getUid("minSize"), function $CPWindow__minSize(self, _cmd)
{ with(self)
{
    return _minSize;
}
},["CGSize"]), new objj_method(sel_getUid("setMaxSize:"), function $CPWindow__setMaxSize_(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_maxSize, aSize))
        return;
    _maxSize = CGSizeCreateCopy(aSize);
    var size = CGSizeMakeCopy(objj_msgSend(self, "frame").size),
        needsFrameChange = NO;
    if (size.width > _maxSize.width)
    {
        size.width = _maxSize.width;
        needsFrameChange = YES;
    }
    if (size.height > _maxSize.height)
    {
        size.height = _maxSize.height;
        needsFrameChange = YES;
    }
    if (needsFrameChange)
        objj_msgSend(self, "setFrameSize:", size);
}
},["void","CGSize"]), new objj_method(sel_getUid("maxSize"), function $CPWindow__maxSize(self, _cmd)
{ with(self)
{
    return _maxSize;
}
},["CGSize"]), new objj_method(sel_getUid("hasShadow"), function $CPWindow__hasShadow(self, _cmd)
{ with(self)
{
    return _hasShadow;
}
},["BOOL"]), new objj_method(sel_getUid("setHasShadow:"), function $CPWindow__setHasShadow_(self, _cmd, shouldHaveShadow)
{ with(self)
{
    if (_hasShadow === shouldHaveShadow)
        return;
    _hasShadow = shouldHaveShadow;
    if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
        return objj_msgSend(_platformWindow, "setHasShadow:", shouldHaveShadow);
    if (_hasShadow)
    {
        var bounds = objj_msgSend(_windowView, "bounds");
        _shadowView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(-SHADOW_MARGIN_LEFT, -SHADOW_MARGIN_TOP + SHADOW_DISTANCE,
            SHADOW_MARGIN_LEFT + CGRectGetWidth(bounds) + SHADOW_MARGIN_RIGHT, SHADOW_MARGIN_TOP + CGRectGetHeight(bounds) + SHADOW_MARGIN_BOTTOM));
        if (!_CPWindowShadowColor)
        {
            var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));
            _CPWindowShadowColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
                [
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow0.png"), CGSizeMake(20.0, 19.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow1.png"), CGSizeMake(1.0, 19.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow2.png"), CGSizeMake(19.0, 19.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow3.png"), CGSizeMake(20.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow4.png"), CGSizeMake(1.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow5.png"), CGSizeMake(19.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow6.png"), CGSizeMake(20.0, 18.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow7.png"), CGSizeMake(1.0, 18.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow8.png"), CGSizeMake(19.0, 18.0))
                ]));
        }
        objj_msgSend(_shadowView, "setBackgroundColor:", _CPWindowShadowColor);
        objj_msgSend(_shadowView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        _DOMElement.insertBefore(_shadowView._DOMElement, _windowView._DOMElement);
    }
    else if (_shadowView)
    {
        _DOMElement.removeChild(_shadowView._DOMElement);
        _shadowView = nil;
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("setDelegate:"), function $CPWindow__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
    _delegateRespondsToWindowWillReturnUndoManagerSelector = objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowWillReturnUndoManager:"));
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidBecomeMain:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("windowDidBecomeMain:"), CPWindowDidBecomeMainNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidResignMain:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("windowDidResignMain:"), CPWindowDidResignMainNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidMove:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("windowDidMove:"), CPWindowDidMoveNotification, self);
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $CPWindow__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("setWindowController:"), function $CPWindow__setWindowController_(self, _cmd, aWindowController)
{ with(self)
{
    _windowController = aWindowController;
}
},["void","CPWindowController"]), new objj_method(sel_getUid("windowController"), function $CPWindow__windowController(self, _cmd)
{ with(self)
{
    return _windowController;
}
},["CPWindowController"]), new objj_method(sel_getUid("doCommandBySelector:"), function $CPWindow__doCommandBySelector_(self, _cmd, aSelector)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", aSelector))
        objj_msgSend(_delegate, "performSelector:", aSelector);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "doCommandBySelector:", aSelector);
}
},["void","SEL"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPWindow__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("makeFirstResponder:"), function $CPWindow__makeFirstResponder_(self, _cmd, aResponder)
{ with(self)
{
    if (_firstResponder == aResponder)
        return YES;
    if(!objj_msgSend(_firstResponder, "resignFirstResponder"))
        return NO;
    if(!aResponder || !objj_msgSend(aResponder, "acceptsFirstResponder") || !objj_msgSend(aResponder, "becomeFirstResponder"))
    {
        _firstResponder = self;
        return NO;
    }
    _firstResponder = aResponder;
    return YES;
}
},["void","CPResponder"]), new objj_method(sel_getUid("firstResponder"), function $CPWindow__firstResponder(self, _cmd)
{ with(self)
{
    return _firstResponder;
}
},["CPResponder"]), new objj_method(sel_getUid("acceptsMouseMovedEvents"), function $CPWindow__acceptsMouseMovedEvents(self, _cmd)
{ with(self)
{
    return _acceptsMouseMovedEvents;
}
},["BOOL"]), new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"), function $CPWindow__setAcceptsMouseMovedEvents_(self, _cmd, shouldAcceptMouseMovedEvents)
{ with(self)
{
    _acceptsMouseMovedEvents = shouldAcceptMouseMovedEvents;
}
},["void","BOOL"]), new objj_method(sel_getUid("ignoresMouseEvents"), function $CPWindow__ignoresMouseEvents(self, _cmd)
{ with(self)
{
    return _ignoresMouseEvents;
}
},["BOOL"]), new objj_method(sel_getUid("setIgnoresMouseEvents:"), function $CPWindow__setIgnoresMouseEvents_(self, _cmd, shouldIgnoreMouseEvents)
{ with(self)
{
    _ignoresMouseEvents = shouldIgnoreMouseEvents;
}
},["void","BOOL"]), new objj_method(sel_getUid("title"), function $CPWindow__title(self, _cmd)
{ with(self)
{
    return _title;
}
},["CPString"]), new objj_method(sel_getUid("setTitle:"), function $CPWindow__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    _title = aTitle;
    objj_msgSend(_windowView, "setTitle:", aTitle);
    objj_msgSend(self, "_synchronizeMenuBarTitleWithWindowTitle");
}
},["void","CPString"]), new objj_method(sel_getUid("setTitleWithRepresentedFilename:"), function $CPWindow__setTitleWithRepresentedFilename_(self, _cmd, aFilePath)
{ with(self)
{
    objj_msgSend(self, "setRepresentedFilename:", aFilePath);
    objj_msgSend(self, "setTitle:", objj_msgSend(aFilePath, "lastPathComponent"));
}
},["void","CPString"]), new objj_method(sel_getUid("setRepresentedFilename:"), function $CPWindow__setRepresentedFilename_(self, _cmd, aFilePath)
{ with(self)
{
    objj_msgSend(self, "setRepresentedURL:", aFilePath);
}
},["void","CPString"]), new objj_method(sel_getUid("representedFilename"), function $CPWindow__representedFilename(self, _cmd)
{ with(self)
{
    return _representedURL;
}
},["CPString"]), new objj_method(sel_getUid("setRepresentedURL:"), function $CPWindow__setRepresentedURL_(self, _cmd, aURL)
{ with(self)
{
    _representedURL = aURL;
}
},["void","CPURL"]), new objj_method(sel_getUid("representedURL"), function $CPWindow__representedURL(self, _cmd)
{ with(self)
{
    return _representedURL;
}
},["CPURL"]), new objj_method(sel_getUid("screen"), function $CPWindow__screen(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPScreen, "alloc"), "init");
}
},["CPScreen"]), new objj_method(sel_getUid("setMovableByWindowBackground:"), function $CPWindow__setMovableByWindowBackground_(self, _cmd, shouldBeMovableByWindowBackground)
{ with(self)
{
    _isMovableByWindowBackground = shouldBeMovableByWindowBackground;
}
},["void","BOOL"]), new objj_method(sel_getUid("isMovableByWindowBackground"), function $CPWindow__isMovableByWindowBackground(self, _cmd)
{ with(self)
{
    return _isMovableByWindowBackground;
}
},["BOOL"]), new objj_method(sel_getUid("center"), function $CPWindow__center(self, _cmd)
{ with(self)
{
    var size = objj_msgSend(self, "frame").size,
        containerSize = objj_msgSend(CPPlatform, "isBrowser") ? objj_msgSend(_platformWindow, "contentBounds").size : objj_msgSend(objj_msgSend(self, "screen"), "visibleFrame").size;
    objj_msgSend(self, "setFrameOrigin:", CGPointMake((containerSize.width - size.width) / 2.0, (containerSize.height - size.height) / 2.0));
}
},["void"]), new objj_method(sel_getUid("sendEvent:"), function $CPWindow__sendEvent_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        point = objj_msgSend(anEvent, "locationInWindow");
    switch (type)
    {
        case CPKeyUp: return objj_msgSend(objj_msgSend(self, "firstResponder"), "keyUp:", anEvent);
        case CPKeyDown: return objj_msgSend(objj_msgSend(self, "firstResponder"), "keyDown:", anEvent);
        case CPScrollWheel: return objj_msgSend(objj_msgSend(_windowView, "hitTest:", point), "scrollWheel:", anEvent);
        case CPLeftMouseUp: if (!_leftMouseDownView)
                                        return objj_msgSend(objj_msgSend(_windowView, "hitTest:", point), "mouseUp:", anEvent);
                                    objj_msgSend(_leftMouseDownView, "mouseUp:", anEvent)
                                    _leftMouseDownView = nil;
                                    return;
        case CPLeftMouseDown: _leftMouseDownView = objj_msgSend(_windowView, "hitTest:", point);
                                    if (_leftMouseDownView != _firstResponder && objj_msgSend(_leftMouseDownView, "acceptsFirstResponder"))
                                        objj_msgSend(self, "makeFirstResponder:", _leftMouseDownView);
                                    var theWindow = objj_msgSend(anEvent, "window");
                                    if (objj_msgSend(theWindow, "isKeyWindow") || objj_msgSend(theWindow, "becomesKeyOnlyIfNeeded"))
                                        return objj_msgSend(_leftMouseDownView, "mouseDown:", anEvent);
                                    else
                                    {
                                        objj_msgSend(self, "makeKeyAndOrderFront:", self);
                                        if (objj_msgSend(_leftMouseDownView, "acceptsFirstMouse:", anEvent))
                                            return objj_msgSend(_leftMouseDownView, "mouseDown:", anEvent)
                                    }
                                    break;
        case CPLeftMouseDragged: if (!_leftMouseDownView)
                                        return objj_msgSend(objj_msgSend(_windowView, "hitTest:", point), "mouseDragged:", anEvent);
                                    return objj_msgSend(_leftMouseDownView, "mouseDragged:", anEvent);
        case CPRightMouseUp: return objj_msgSend(_rightMouseDownView, "mouseUp:", anEvent);
        case CPRightMouseDown: _rightMouseDownView = objj_msgSend(_windowView, "hitTest:", point);
                                    return objj_msgSend(_rightMouseDownView, "mouseDown:", anEvent);
        case CPRightMouseDragged: return objj_msgSend(_rightMouseDownView, "mouseDragged:", anEvent);
        case CPMouseMoved: if (!_acceptsMouseMovedEvents)
                                        return;
                                    if (!_mouseEnteredStack)
                                        _mouseEnteredStack = [];
                                    var hitTestView = objj_msgSend(_windowView, "hitTest:", point);
                                    if (objj_msgSend(_mouseEnteredStack, "count") && objj_msgSend(_mouseEnteredStack, "lastObject") === hitTestView)
                                        return objj_msgSend(hitTestView, "mouseMoved:", anEvent);
                                    var view = hitTestView,
                                        mouseEnteredStack = [];
                                    while (view)
                                    {
                                        mouseEnteredStack.unshift(view);
                                        view = objj_msgSend(view, "superview");
                                    }
                                    var deviation = MIN(_mouseEnteredStack.length, mouseEnteredStack.length);
                                    while (deviation--)
                                        if (_mouseEnteredStack[deviation] === mouseEnteredStack[deviation])
                                            break;
                                    var index = deviation + 1,
                                        count = _mouseEnteredStack.length;
                                    if (index < count)
                                    {
                                        var event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPMouseExited, point, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), _windowNumber, nil, -1, 1, 0);
                                        for (; index < count; ++index)
                                            objj_msgSend(_mouseEnteredStack[index], "mouseExited:", event);
                                    }
                                    index = deviation + 1;
                                    count = mouseEnteredStack.length;
                                    if (index < count)
                                    {
                                        var event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPMouseEntered, point, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), _windowNumber, nil, -1, 1, 0);
                                        for (; index < count; ++index)
                                            objj_msgSend(mouseEnteredStack[index], "mouseEntered:", event);
                                    }
                                    _mouseEnteredStack = mouseEnteredStack;
                                    objj_msgSend(hitTestView, "mouseMoved:", anEvent);
    }
}
},["void","CPEvent"]), new objj_method(sel_getUid("windowNumber"), function $CPWindow__windowNumber(self, _cmd)
{ with(self)
{
    return _windowNumber;
}
},["int"]), new objj_method(sel_getUid("becomeKeyWindow"), function $CPWindow__becomeKeyWindow(self, _cmd)
{ with(self)
{
    if (_firstResponder != self && objj_msgSend(_firstResponder, "respondsToSelector:", sel_getUid("becomeKeyWindow")))
        objj_msgSend(_firstResponder, "becomeKeyWindow");
}
},["void"]), new objj_method(sel_getUid("canBecomeKeyWindow"), function $CPWindow__canBecomeKeyWindow(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("isKeyWindow"), function $CPWindow__isKeyWindow(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPApp, "keyWindow") == self;
}
},["BOOL"]), new objj_method(sel_getUid("makeKeyAndOrderFront:"), function $CPWindow__makeKeyAndOrderFront_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "orderFront:", self);
    objj_msgSend(self, "makeKeyWindow");
    objj_msgSend(self, "makeMainWindow");
}
},["void","id"]), new objj_method(sel_getUid("makeKeyWindow"), function $CPWindow__makeKeyWindow(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "canBecomeKeyWindow"))
        return;
    objj_msgSend(CPApp._keyWindow, "resignKeyWindow");
    CPApp._keyWindow = self;
    objj_msgSend(self, "becomeKeyWindow");
}
},["void"]), new objj_method(sel_getUid("resignKeyWindow"), function $CPWindow__resignKeyWindow(self, _cmd)
{ with(self)
{
    if (_firstResponder != self && objj_msgSend(_firstResponder, "respondsToSelector:", sel_getUid("resignKeyWindow")))
        objj_msgSend(_firstResponder, "resignKeyWindow");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidResignKey:")))
        objj_msgSend(_delegate, "windowDidResignKey:", self);
}
},["void"]), new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"), function $CPWindow__dragImage_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:", anImage, self, objj_msgSend(self, "convertBaseToGlobal:", imageLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
},["void","CPImage","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"), function $CPWindow___noteRegisteredDraggedTypes_(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    if (!_inclusiveRegisteredDraggedTypes)
        _inclusiveRegisteredDraggedTypes = objj_msgSend(CPCountedSet, "set");
    objj_msgSend(_inclusiveRegisteredDraggedTypes, "unionSet:", pasteboardTypes);
}
},["void","CPSet"]), new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"), function $CPWindow___noteUnregisteredDraggedTypes_(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    objj_msgSend(_inclusiveRegisteredDraggedTypes, "minusSet:", pasteboardTypes)
    if (objj_msgSend(_inclusiveRegisteredDraggedTypes, "count") === 0)
        _inclusiveRegisteredDraggedTypes = nil;
}
},["void","CPArray"]), new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"), function $CPWindow__dragView_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, viewLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", aView, self, objj_msgSend(self, "convertBaseToGlobal:", viewLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
},["void","CPView","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("registerForDraggedTypes:"), function $CPWindow__registerForDraggedTypes_(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    objj_msgSend(self, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    objj_msgSend(_registeredDraggedTypes, "addObjectsFromArray:", pasteboardTypes)
    objj_msgSend(self, "_noteRegisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypesArray = nil;
}
},["void","CPArray"]), new objj_method(sel_getUid("registeredDraggedTypes"), function $CPWindow__registeredDraggedTypes(self, _cmd)
{ with(self)
{
    if (!_registeredDraggedTypesArray)
        _registeredDraggedTypesArray = objj_msgSend(_registeredDraggedTypes, "allObjects")
    return _registeredDraggedTypesArray;
}
},["CPArray"]), new objj_method(sel_getUid("unregisterDraggedTypes"), function $CPWindow__unregisterDraggedTypes(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypes = objj_msgSend(CPSet, "set");
    _registeredDraggedTypesArray = [];
}
},["void"]), new objj_method(sel_getUid("setDocumentEdited:"), function $CPWindow__setDocumentEdited_(self, _cmd, isDocumentEdited)
{ with(self)
{
    if (_isDocumentEdited == isDocumentEdited)
        return;
    _isDocumentEdited = isDocumentEdited;
    objj_msgSend(CPMenu, "_setMenuBarIconImageAlphaValue:", _isDocumentEdited ? 0.5 : 1.0);
}
},["void","BOOL"]), new objj_method(sel_getUid("isDocumentEdited"), function $CPWindow__isDocumentEdited(self, _cmd)
{ with(self)
{
    return _isDocumentEdited;
}
},["BOOL"]), new objj_method(sel_getUid("setDocumentSaving:"), function $CPWindow__setDocumentSaving_(self, _cmd, isDocumentSaving)
{ with(self)
{
    if (_isDocumentSaving == isDocumentSaving)
        return;
    _isDocumentSaving = isDocumentSaving;
    objj_msgSend(self, "_synchronizeSaveMenuWithDocumentSaving");
    objj_msgSend(_windowView, "windowDidChangeDocumentSaving");
}
},["void","BOOL"]), new objj_method(sel_getUid("isDocumentSaving"), function $CPWindow__isDocumentSaving(self, _cmd)
{ with(self)
{
    return _isDocumentSaving;
}
},["BOOL"]), new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"), function $CPWindow___synchronizeSaveMenuWithDocumentSaving(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "isMainWindow"))
        return;
    var mainMenu = objj_msgSend(CPApp, "mainMenu"),
        index = objj_msgSend(mainMenu, "indexOfItemWithTitle:", _isDocumentSaving ? "Save" : "Saving...");
    if (index == CPNotFound)
        return;
    var item = objj_msgSend(mainMenu, "itemAtIndex:", index);
    if (_isDocumentSaving)
    {
        CPWindowSaveImage = objj_msgSend(item, "image");
        objj_msgSend(item, "setTitle:", "Saving...");
        objj_msgSend(item, "setImage:", CPWindowSavingImage);
        objj_msgSend(item, "setEnabled:", NO);
    }
    else
    {
        objj_msgSend(item, "setTitle:", "Save");
        objj_msgSend(item, "setImage:", CPWindowSaveImage);
        objj_msgSend(item, "setEnabled:", YES);
    }
}
},["void"]), new objj_method(sel_getUid("performClose:"), function $CPWindow__performClose_(self, _cmd, aSender)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowShouldClose:")))
    {
        if (!objj_msgSend(_delegate, "windowShouldClose:", self))
            return;
    }
    else if (objj_msgSend(self, "respondsToSelector:", sel_getUid("windowShouldClose:")) && !objj_msgSend(self, "windowShouldClose:", self))
        return;
    objj_msgSend(self, "close");
}
},["void","id"]), new objj_method(sel_getUid("close"), function $CPWindow__close(self, _cmd)
{ with(self)
{
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowWillCloseNotification, self);
   objj_msgSend(self, "orderOut:", nil);
}
},["void"]), new objj_method(sel_getUid("isMainWindow"), function $CPWindow__isMainWindow(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPApp, "mainWindow") == self;
}
},["BOOL"]), new objj_method(sel_getUid("canBecomeMainWindow"), function $CPWindow__canBecomeMainWindow(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "isVisible"))
        return YES;
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("makeMainWindow"), function $CPWindow__makeMainWindow(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "canBecomeMainWindow"))
        return;
    objj_msgSend(CPApp._mainWindow, "resignMainWindow");
    CPApp._mainWindow = self;
    objj_msgSend(self, "becomeMainWindow");
}
},["void"]), new objj_method(sel_getUid("becomeMainWindow"), function $CPWindow__becomeMainWindow(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_synchronizeMenuBarTitleWithWindowTitle");
    objj_msgSend(self, "_synchronizeSaveMenuWithDocumentSaving");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidBecomeMainNotification, self);
}
},["void"]), new objj_method(sel_getUid("resignMainWindow"), function $CPWindow__resignMainWindow(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidResignMainNotification, self);
}
},["void"]), new objj_method(sel_getUid("toolbar"), function $CPWindow__toolbar(self, _cmd)
{ with(self)
{
    return _toolbar;
}
},["CPToolbar"]), new objj_method(sel_getUid("setToolbar:"), function $CPWindow__setToolbar_(self, _cmd, aToolbar)
{ with(self)
{
    if (_toolbar === aToolbar)
        return;
    objj_msgSend(objj_msgSend(aToolbar, "_window"), "setToolbar:", nil);
    objj_msgSend(_toolbar, "_setWindow:", nil);
    _toolbar = aToolbar;
    objj_msgSend(_toolbar, "_setWindow:", self);
    objj_msgSend(self, "_noteToolbarChanged");
}
},["void","CPToolbar"]), new objj_method(sel_getUid("toggleToolbarShown:"), function $CPWindow__toggleToolbarShown_(self, _cmd, aSender)
{ with(self)
{
    var toolbar = objj_msgSend(self, "toolbar");
    objj_msgSend(toolbar, "setVisible:", !objj_msgSend(toolbar, "isVisible"));
}
},["void","id"]), new objj_method(sel_getUid("_noteToolbarChanged"), function $CPWindow___noteToolbarChanged(self, _cmd)
{ with(self)
{
    var frame = CGRectMakeCopy(objj_msgSend(self, "frame")),
        newFrame;
    objj_msgSend(_windowView, "noteToolbarChanged");
    if (_isFullPlatformWindow)
        newFrame = objj_msgSend(_platformWindow, "visibleFrame");
    else
    {
        newFrame = CGRectMakeCopy(objj_msgSend(self, "frame"));
        newFrame.origin = frame.origin;
    }
    objj_msgSend(self, "setFrame:", newFrame);
}
},["void"]), new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"), function $CPWindow___setAttachedSheetFrameOrigin(self, _cmd)
{ with(self)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "contentView"), "frame"),
        sheetFrame = CGRectMakeCopy(objj_msgSend(_attachedSheet, "frame"));
   sheetFrame.origin.y = CGRectGetMinY(_frame) + CGRectGetMinY(contentRect);
   sheetFrame.origin.x = CGRectGetMinX(_frame) + FLOOR((CGRectGetWidth(_frame) - CGRectGetWidth(sheetFrame)) / 2.0);
   objj_msgSend(_attachedSheet, "setFrameOrigin:", sheetFrame.origin);
}
},["void"]), new objj_method(sel_getUid("_animateAttachedSheet"), function $CPWindow___animateAttachedSheet(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"), function $CPWindow___attachSheet_modalDelegate_didEndSelector_contextInfo_(self, _cmd, aSheet, aModalDelegate, aDidEndSelector, aContextInfo)
{ with(self)
{
    _attachedSheet = aSheet;
    aSheet._isSheet = YES;
    objj_msgSend(self, "_setAttachedSheetFrameOrigin");
    objj_msgSend(_platformWindow, "order:window:relativeTo:", CPWindowAbove, aSheet, self);
}
},["void","CPWindow","id","SEL","id"]), new objj_method(sel_getUid("attachedSheet"), function $CPWindow__attachedSheet(self, _cmd)
{ with(self)
{
    return _attachedSheet;
}
},["CPWindow"]), new objj_method(sel_getUid("isSheet"), function $CPWindow__isSheet(self, _cmd)
{ with(self)
{
    return _isSheet;
}
},["BOOL"]), new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"), function $CPWindow__becomesKeyOnlyIfNeeded(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("worksWhenModal"), function $CPWindow__worksWhenModal(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("keyDown:"), function $CPWindow__keyDown_(self, _cmd, event)
{ with(self)
{
    if (!objj_msgSend(self, "performKeyEquivalent:", event))
        objj_msgSend(self, "interpretKeyEvents:", [event]);
}
},["void","CPEvent"]), new objj_method(sel_getUid("insertNewline:"), function $CPWindow__insertNewline_(self, _cmd, sender)
{ with(self)
{
    if (_defaultButton && _defaultButtonEnabled)
        objj_msgSend(_defaultButton, "performClick:", nil);
}
},["void","id"]), new objj_method(sel_getUid("insertTab:"), function $CPWindow__insertTab_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "selectNextKeyView:", nil);
}
},["void","id"]), new objj_method(sel_getUid("_dirtyKeyViewLoop"), function $CPWindow___dirtyKeyViewLoop(self, _cmd)
{ with(self)
{
    if (_autorecalculatesKeyViewLoop)
        _keyViewLoopIsDirty = YES;
}
},["void"]), new objj_method(sel_getUid("_hasKeyViewLoop"), function $CPWindow___hasKeyViewLoop(self, _cmd)
{ with(self)
{
    var subviews = [];
    objj_msgSend(self, "_appendSubviewsOf:toArray:", _contentView, subviews);
    for (var i = 0, count = objj_msgSend(subviews, "count"); i<count; i++)
    {
        if (subviews[i]._nextKeyView)
            return YES;
    }
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("recalculateKeyViewLoop"), function $CPWindow__recalculateKeyViewLoop(self, _cmd)
{ with(self)
{
    var subviews = [];
    objj_msgSend(self, "_appendSubviewsOf:toArray:", _contentView, subviews);
    var keyViewOrder = objj_msgSend(subviews, "sortedArrayUsingFunction:context:", keyViewComparator, _contentView),
        count = objj_msgSend(keyViewOrder, "count");
    for (var i=0; i<count; i++)
        objj_msgSend(keyViewOrder[i], "setNextKeyView:", keyViewOrder[(i+1)%count]);
    _keyViewLoopIsDirty = NO;
}
},["void"]), new objj_method(sel_getUid("_appendSubviewsOf:toArray:"), function $CPWindow___appendSubviewsOf_toArray_(self, _cmd, aView, anArray)
{ with(self)
{
    var subviews = objj_msgSend(aView, "subviews"),
        count = objj_msgSend(subviews, "count");
    while (count--)
        objj_msgSend(self, "_appendSubviewsOf:toArray:", subviews[count], anArray);
    objj_msgSend(anArray, "addObject:", aView);
}
},["void","CPView","CPArray"]), new objj_method(sel_getUid("setAutorecalculatesKeyViewLoop:"), function $CPWindow__setAutorecalculatesKeyViewLoop_(self, _cmd, shouldRecalculate)
{ with(self)
{
    if (_autorecalculatesKeyViewLoop === shouldRecalculate)
        return;
    _autorecalculatesKeyViewLoop = shouldRecalculate;
    if (_keyViewLoopIsDirty)
        objj_msgSend(self, "recalculateKeyViewLoop");
    else if (_autorecalculatesKeyViewLoop)
        objj_msgSend(self, "_dirtyKeyViewLoop");
}
},["void","BOOL"]), new objj_method(sel_getUid("autorecalculatesKeyViewLoop"), function $CPWindow__autorecalculatesKeyViewLoop(self, _cmd)
{ with(self)
{
    return _autorecalculatesKeyViewLoop;
}
},["BOOL"]), new objj_method(sel_getUid("selectNextKeyView:"), function $CPWindow__selectNextKeyView_(self, _cmd, sender)
{ with(self)
{
    if (objj_msgSend(_firstResponder, "isKindOfClass:", objj_msgSend(CPView, "class")))
        objj_msgSend(self, "selectKeyViewFollowingView:", _firstResponder);
}
},["void","id"]), new objj_method(sel_getUid("selectPreviousKeyView:"), function $CPWindow__selectPreviousKeyView_(self, _cmd, sender)
{ with(self)
{
    if (objj_msgSend(_firstResponder, "isKindOfClass:", objj_msgSend(CPView, "class")))
        objj_msgSend(self, "selectKeyViewPrecedingView:", _firstResponder);
}
},["void","id"]), new objj_method(sel_getUid("selectKeyViewFollowingView:"), function $CPWindow__selectKeyViewFollowingView_(self, _cmd, aView)
{ with(self)
{
    if (_keyViewLoopIsDirty)
        objj_msgSend(self, "recalculateKeyViewLoop");
    objj_msgSend(self, "makeFirstResponder:", objj_msgSend(aView, "nextValidKeyView"));
}
},["void","CPView"]), new objj_method(sel_getUid("selectKeyViewPrecedingView:"), function $CPWindow__selectKeyViewPrecedingView_(self, _cmd, aView)
{ with(self)
{
    if (_keyViewLoopIsDirty)
        objj_msgSend(self, "recalculateKeyViewLoop");
    objj_msgSend(self, "makeFirstResponder:", objj_msgSend(aView, "previousValidKeyView"));
}
},["void","CPView"]), new objj_method(sel_getUid("setDefaultButtonCell:"), function $CPWindow__setDefaultButtonCell_(self, _cmd, aButton)
{ with(self)
{
    objj_msgSend(self, "setDefaultButton:", aButton);
}
},["void","CPButton"]), new objj_method(sel_getUid("defaultButtonCell"), function $CPWindow__defaultButtonCell(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "defaultButton");
}
},["CPButton"]), new objj_method(sel_getUid("setDefaultButton:"), function $CPWindow__setDefaultButton_(self, _cmd, aButton)
{ with(self)
{
    objj_msgSend(_defaultButton, "setDefaultButton:", NO);
    _defaultButton = aButton;
    objj_msgSend(_defaultButton, "setDefaultButton:", YES);
}
},["void","CPButton"]), new objj_method(sel_getUid("defaultButton"), function $CPWindow__defaultButton(self, _cmd)
{ with(self)
{
    return _defaultButton;
}
},["CPButton"]), new objj_method(sel_getUid("enableKeyEquivalentForDefaultButton"), function $CPWindow__enableKeyEquivalentForDefaultButton(self, _cmd)
{ with(self)
{
    _defaultButtonEnabled = YES;
}
},["void"]), new objj_method(sel_getUid("enableKeyEquivalentForDefaultButtonCell"), function $CPWindow__enableKeyEquivalentForDefaultButtonCell(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "enableKeyEquivalentForDefaultButton");
}
},["void"]), new objj_method(sel_getUid("disableKeyEquivalentForDefaultButton"), function $CPWindow__disableKeyEquivalentForDefaultButton(self, _cmd)
{ with(self)
{
    _defaultButtonEnabled = NO;
}
},["void"]), new objj_method(sel_getUid("disableKeyEquivalentForDefaultButtonCell"), function $CPWindow__disableKeyEquivalentForDefaultButtonCell(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "disableKeyEquivalentForDefaultButton");
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPWindow__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));
    CPWindowSavingImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(16.0, 16.0))
}
},["void"]), new objj_method(sel_getUid("_windowViewClassForStyleMask:"), function $CPWindow___windowViewClassForStyleMask_(self, _cmd, aStyleMask)
{ with(self)
{
    if (aStyleMask & CPHUDBackgroundWindowMask)
        return _CPHUDWindowView;
    else if (aStyleMask === CPBorderlessWindowMask)
        return _CPBorderlessWindowView;
    return _CPStandardWindowView;
}
},["Class","unsigned"]), new objj_method(sel_getUid("_windowViewClassForFullPlatformWindowStyleMask:"), function $CPWindow___windowViewClassForFullPlatformWindowStyleMask_(self, _cmd, aStyleMask)
{ with(self)
{
    return _CPBorderlessBridgeWindowView;
}
},["Class","unsigned"]), new objj_method(sel_getUid("frameRectForContentRect:styleMask:"), function $CPWindow__frameRectForContentRect_styleMask_(self, _cmd, aContentRect, aStyleMask)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForStyleMask:", _styleMask), "frameRectForContentRect:", aContentRect);
}
},["CGRect","CGRect","unsigned"])]);
}
var keyViewComparator = function(a, b, context)
{
    var viewBounds = objj_msgSend(a, "convertRect:toView:", objj_msgSend(a, "bounds"), nil),
        otherBounds = objj_msgSend(b, "convertRect:toView:", objj_msgSend(b, "bounds"), nil);
    if (CGRectGetMinY(viewBounds) < CGRectGetMinY(otherBounds))
        return -1;
    else if (CGRectGetMinY(viewBounds) == CGRectGetMinY(otherBounds) && CGRectGetMinX(viewBounds) < CGRectGetMinX(otherBounds))
        return -1;
    else if (CGRectGetMinX(viewBounds) == CGRectGetMinX(otherBounds) && CGRectGetMinX(viewBounds) == CGRectGetMinX(otherBounds))
        return 0;
    else
        return 1;
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_synchronizeMenuBarTitleWithWindowTitle"), function $CPWindow___synchronizeMenuBarTitleWithWindowTitle(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(_windowController, "document") || !objj_msgSend(self, "isMainWindow"))
        return;
    objj_msgSend(CPMenu, "setMenuBarTitle:", _title);
}
},["void"])]);
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("resizeWithOldPlatformWindowSize:"), function $CPWindow__resizeWithOldPlatformWindowSize_(self, _cmd, aSize)
{ with(self)
{
    if (objj_msgSend(self, "isFullPlatformWindow"))
        return objj_msgSend(self, "setFrame:", objj_msgSend(_platformWindow, "visibleFrame"));
    if (_autoresizingMask == CPWindowNotSizable)
        return;
    var frame = objj_msgSend(_platformWindow, "contentBounds"),
        newFrame = CGRectMakeCopy(_frame),
        dX = (CGRectGetWidth(frame) - aSize.width) /
            (((_autoresizingMask & CPWindowMinXMargin) ? 1 : 0) + (_autoresizingMask & CPWindowWidthSizable ? 1 : 0) + (_autoresizingMask & CPWindowMaxXMargin ? 1 : 0)),
        dY = (CGRectGetHeight(frame) - aSize.height) /
            ((_autoresizingMask & CPWindowMinYMargin ? 1 : 0) + (_autoresizingMask & CPWindowHeightSizable ? 1 : 0) + (_autoresizingMask & CPWindowMaxYMargin ? 1 : 0));
    if (_autoresizingMask & CPWindowMinXMargin)
        newFrame.origin.x += dX;
    if (_autoresizingMask & CPWindowWidthSizable)
        newFrame.size.width += dX;
    if (_autoresizingMask & CPWindowMinYMargin)
        newFrame.origin.y += dY;
    if (_autoresizingMask & CPWindowHeightSizable)
        newFrame.size.height += dY;
    objj_msgSend(self, "setFrame:", newFrame);
}
},["void","CGSize"]), new objj_method(sel_getUid("setAutoresizingMask:"), function $CPWindow__setAutoresizingMask_(self, _cmd, anAutoresizingMask)
{ with(self)
{
    _autoresizingMask = anAutoresizingMask;
}
},["void","unsigned"]), new objj_method(sel_getUid("autoresizingMask"), function $CPWindow__autoresizingMask(self, _cmd)
{ with(self)
{
    return _autoresizingMask;
}
},["unsigned"]), new objj_method(sel_getUid("convertBaseToGlobal:"), function $CPWindow__convertBaseToGlobal_(self, _cmd, aPoint)
{ with(self)
{
    return objj_msgSend(CPPlatform, "isBrowser") ? objj_msgSend(self, "convertBaseToPlatformWindow:", aPoint) : objj_msgSend(self, "convertBaseToScreen:", aPoint);
}
},["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertGlobalToBase:"), function $CPWindow__convertGlobalToBase_(self, _cmd, aPoint)
{ with(self)
{
    return objj_msgSend(CPPlatform, "isBrowser") ? objj_msgSend(self, "convertPlatformWindowToBase:", aPoint) : objj_msgSend(self, "convertScreenToBase:", aPoint);
}
},["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertBaseToPlatformWindow:"), function $CPWindow__convertBaseToPlatformWindow_(self, _cmd, aPoint)
{ with(self)
{
    if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
        return aPoint;
    var origin = objj_msgSend(self, "frame").origin;
    return { x:aPoint.x + origin.x, y:aPoint.y + origin.y };
}
},["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertPlatformWindowToBase:"), function $CPWindow__convertPlatformWindowToBase_(self, _cmd, aPoint)
{ with(self)
{
    if (objj_msgSend(self, "_sharesChromeWithPlatformWindow"))
        return aPoint;
    var origin = objj_msgSend(self, "frame").origin;
    return { x:aPoint.x - origin.x, y:aPoint.y - origin.y };
}
},["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertScreenToBase:"), function $CPWindow__convertScreenToBase_(self, _cmd, aPoint)
{ with(self)
{
    return objj_msgSend(self, "convertPlatformWindowToBase:", objj_msgSend(_platformWindow, "convertScreenToBase:", aPoint));
}
},["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertBaseToScreen:"), function $CPWindow__convertBaseToScreen_(self, _cmd, aPoint)
{ with(self)
{
    return objj_msgSend(_platformWindow, "convertBaseToScreen:", objj_msgSend(self, "convertBaseToPlatformWindow:", aPoint));
}
},["CGPoint","CGPoint"]), new objj_method(sel_getUid("_setSharesChromeWithPlatformWindow:"), function $CPWindow___setSharesChromeWithPlatformWindow_(self, _cmd, shouldShareFrameWithPlatformWindow)
{ with(self)
{
    if (shouldShareFrameWithPlatformWindow && objj_msgSend(CPPlatform, "isBrowser"))
        return;
    _sharesChromeWithPlatformWindow = shouldShareFrameWithPlatformWindow;
}
},["void","BOOL"]), new objj_method(sel_getUid("_sharesChromeWithPlatformWindow"), function $CPWindow___sharesChromeWithPlatformWindow(self, _cmd)
{ with(self)
{
    return _sharesChromeWithPlatformWindow;
}
},["BOOL"]), new objj_method(sel_getUid("undoManager"), function $CPWindow__undoManager(self, _cmd)
{ with(self)
{
    if (_delegateRespondsToWindowWillReturnUndoManagerSelector)
        return objj_msgSend(_delegate, "windowWillReturnUndoManager:", self);
    if (!_undoManager)
        _undoManager = objj_msgSend(objj_msgSend(CPUndoManager, "alloc"), "init");
    return _undoManager;
}
},["CPUndoManager"]), new objj_method(sel_getUid("undo:"), function $CPWindow__undo_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "undoManager"), "undo");
}
},["void","id"]), new objj_method(sel_getUid("redo:"), function $CPWindow__redo_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "undoManager"), "redo");
}
},["void","id"]), new objj_method(sel_getUid("containsPoint:"), function $CPWindow__containsPoint_(self, _cmd, aPoint)
{ with(self)
{
    return CGRectContainsPoint(_frame, aPoint);
}
},["BOOL","CGPoint"])]);
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setFullBridge:"), function $CPWindow__setFullBridge_(self, _cmd, shouldBeFullBridge)
{ with(self)
{
    objj_msgSend(self, "setFullPlatformWindow:", shouldBeFullBridge);
}
},["void","BOOL"]), new objj_method(sel_getUid("isFullBridge"), function $CPWindow__isFullBridge(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "isFullPlatformWindow");
}
},["BOOL"]), new objj_method(sel_getUid("convertBaseToBridge:"), function $CPWindow__convertBaseToBridge_(self, _cmd, aPoint)
{ with(self)
{
    return objj_msgSend(self, "convertBaseToPlatformWindow:", aPoint);
}
},["CGPoint","CGPoint"]), new objj_method(sel_getUid("convertBridgeToBase:"), function $CPWindow__convertBridgeToBase_(self, _cmd, aPoint)
{ with(self)
{
    return objj_msgSend(self, "convertPlatformWindowToBase:", aPoint);
}
},["CGPoint","CGPoint"])]);
}
var interpolate = function(fromValue, toValue, progress)
{
    return fromValue + (toValue - fromValue) * progress;
}
{var the_class = objj_allocateClassPair(CPAnimation, "_CPWindowFrameAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_startFrame"), new objj_ivar("_targetFrame")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithWindow:targetFrame:"), function $_CPWindowFrameAnimation__initWithWindow_targetFrame_(self, _cmd, aWindow, aTargetFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAnimation") }, "initWithDuration:animationCurve:", 0.2, CPAnimationLinear);
    if (self)
    {
        _window = aWindow;
        _targetFrame = CGRectMakeCopy(aTargetFrame);
        _startFrame = CGRectMakeCopy(objj_msgSend(_window, "frame"));
    }
    return self;
}
},["id","CPWindow","CGRect"]), new objj_method(sel_getUid("startAnimation"), function $_CPWindowFrameAnimation__startAnimation(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAnimation") }, "startAnimation");
    _window._isAnimating = YES;
}
},["void"]), new objj_method(sel_getUid("setCurrentProgress:"), function $_CPWindowFrameAnimation__setCurrentProgress_(self, _cmd, aProgress)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAnimation") }, "setCurrentProgress:", aProgress);
    var value = objj_msgSend(self, "currentValue");
    if (value == 1.0)
        _window._isAnimating = NO;
    objj_msgSend(_window, "setFrameOrigin:", CGPointMake(interpolate(CGRectGetMinX(_startFrame), CGRectGetMinX(_targetFrame), value), interpolate(CGRectGetMinY(_startFrame), CGRectGetMinY(_targetFrame), value)));
    objj_msgSend(_window, "setFrameSize:", CGSizeMake(interpolate(CGRectGetWidth(_startFrame), CGRectGetWidth(_targetFrame), value), interpolate(CGRectGetHeight(_startFrame), CGRectGetHeight(_targetFrame), value)));
}
},["void","float"])]);
}
_CPWindowFullPlatformWindowSessionMake= function(aWindowView, aContentRect, hasShadow, aLevel)
{
    return { windowView:aWindowView, contentRect:aContentRect, hasShadow:hasShadow, level:aLevel };
}
i;15;_CPWindowView.ji;23;_CPStandardWindowView.ji;18;_CPHUDWindowView.ji;25;_CPBorderlessWindowView.ji;31;_CPBorderlessBridgeWindowView.ji;14;CPDragServer.ji;8;CPView.j