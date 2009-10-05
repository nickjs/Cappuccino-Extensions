c;9438;var _CPHUDWindowViewBackgroundColor = nil,
    CPHUDCloseButtonImage = nil;
var HUD_TITLEBAR_HEIGHT = 26.0;
{var the_class = objj_allocateClassPair(_CPWindowView, "_CPHUDWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbarView"), new objj_ivar("_titleField"), new objj_ivar("_closeButton")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPHUDWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect);
    if (objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "toolbar"), "isVisible"))
    {
        toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(self, "toolbarView"), "frame"));
        contentRect.origin.y += toolbarHeight;
        contentRect.size.height -= toolbarHeight;
    }
    return contentRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPHUDWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect);
    if (objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "toolbar"), "isVisible"))
    {
        toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(self, "toolbarView"), "frame"));
        frameRect.origin.y -= toolbarHeight;
        frameRect.size.height += toolbarHeight;
    }
    return frameRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPHUDWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        var bounds = objj_msgSend(self, "bounds");
        objj_msgSend(self, "setBackgroundColor:", _CPHUDWindowViewBackgroundColor);
        _titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_titleField, "setHitTests:", NO);
        objj_msgSend(_titleField, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
        objj_msgSend(_titleField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(_titleField, "setTextShadowColor:", objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(_titleField, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(_titleField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_titleField, "setLineBreakMode:", CPLineBreakByTruncatingTail);
        objj_msgSend(_titleField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(_titleField, "setStringValue:", "Untitled");
        objj_msgSend(_titleField, "sizeToFit");
        objj_msgSend(_titleField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_titleField, "setStringValue:", "");
        objj_msgSend(_titleField, "setFrame:", CGRectMake(20.0, 3.0, CGRectGetWidth(objj_msgSend(self, "bounds")) - 40.0, CGRectGetHeight(objj_msgSend(_titleField, "frame"))));
        objj_msgSend(self, "addSubview:", _titleField);
        if (_styleMask & CPClosableWindowMask)
        {
            var closeSize = objj_msgSend(_CPHUDWindowViewCloseImage, "size");
            _closeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(4.0, 4.0, closeSize.width, closeSize.height));
            objj_msgSend(_closeButton, "setBordered:", NO);
            objj_msgSend(_closeButton, "setImage:", _CPHUDWindowViewCloseImage);
            objj_msgSend(_closeButton, "setAlternateImage:", _CPHUDWindowViewCloseActiveImage);
            objj_msgSend(self, "addSubview:", _closeButton);
        }
        objj_msgSend(self, "setResizeIndicatorOffset:", CGSizeMake(5.0, 5.0));
    }
    return self;
}
},["id","CPRect","unsigned"]), new objj_method(sel_getUid("viewDidMoveToWindow"), function $_CPHUDWindowView__viewDidMoveToWindow(self, _cmd)
{ with(self)
{
    objj_msgSend(_closeButton, "setTarget:", objj_msgSend(self, "window"));
    objj_msgSend(_closeButton, "setAction:", sel_getUid("performClose:"));
}
},["void"]), new objj_method(sel_getUid("setTitle:"), function $_CPHUDWindowView__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_titleField, "setStringValue:", aTitle);
}
},["void","CPString"]), new objj_method(sel_getUid("toolbarView"), function $_CPHUDWindowView__toolbarView(self, _cmd)
{ with(self)
{
    return _toolbarView;
}
},["_CPToolbarView"]), new objj_method(sel_getUid("toolbarLabelColor"), function $_CPHUDWindowView__toolbarLabelColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "whiteColor");
}
},["CPColor"]), new objj_method(sel_getUid("toolbarLabelShadowColor"), function $_CPHUDWindowView__toolbarLabelShadowColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "blackColor");
}
},["CPColor"]), new objj_method(sel_getUid("toolbarOffset"), function $_CPHUDWindowView__toolbarOffset(self, _cmd)
{ with(self)
{
    return CGSizeMake(0.0, HUD_TITLEBAR_HEIGHT);
}
},["CGSize"]), new objj_method(sel_getUid("tile"), function $_CPHUDWindowView__tile(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "tile");
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);
    objj_msgSend(_titleField, "setFrame:", CGRectMake(20.0, 3.0, width - 40.0, CGRectGetHeight(objj_msgSend(_titleField, "frame"))));
    var maxY = objj_msgSend(self, "toolbarMaxY");
    objj_msgSend(objj_msgSend(theWindow, "contentView"), "setFrameOrigin:", CGPointMake(0.0, maxY, width, CGRectGetHeight(bounds) - maxY));
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $_CPHUDWindowView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPHUDWindowView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPHUDWindowViewBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground0.png"), CPSizeMake(6.0, 78.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground1.png"), CPSizeMake(1.0, 78.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground2.png"), CPSizeMake(6.0, 78.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground3.png"), CPSizeMake(6.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground4.png"), CPSizeMake(1.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground5.png"), CPSizeMake(6.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground6.png"), CPSizeMake(6.0, 6.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground7.png"), CPSizeMake(6.0, 6.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground8.png"), CPSizeMake(6.0, 6.0))
        ]));
    _CPHUDWindowViewCloseImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowClose.png"), CPSizeMake(20.0, 20.0));
    _CPHUDWindowViewCloseActiveImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowCloseActive.png"), CPSizeMake(20.0, 20.0));
}
},["void"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPHUDWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = CGRectMakeCopy(aFrameRect),
        titleBarHeight = HUD_TITLEBAR_HEIGHT;
    contentRect.origin.y += titleBarHeight;
    contentRect.size.height -= titleBarHeight;
    return contentRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPHUDWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = CGRectMakeCopy(aContentRect),
        titleBarHeight = HUD_TITLEBAR_HEIGHT;
    frameRect.origin.y -= titleBarHeight;
    frameRect.size.height += titleBarHeight;
    return frameRect;
}
},["CGRect","CGRect"])]);
}

