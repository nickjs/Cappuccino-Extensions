i;15;_CPWindowView.jc;2481;
var _CPToolbarViewBackgroundColor = nil;
{var the_class = objj_allocateClassPair(_CPWindowView, "_CPBorderlessBridgeWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbarBackgroundView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("tile"), function $_CPBorderlessBridgeWindowView__tile(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "tile");
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds");
    objj_msgSend(objj_msgSend(theWindow, "contentView"), "setFrame:", CGRectMake(0.0, objj_msgSend(self, "toolbarMaxY"), CGRectGetWidth(bounds), CGRectGetHeight(bounds) - objj_msgSend(self, "toolbarMaxY")));
    if (!objj_msgSend(objj_msgSend(theWindow, "toolbar"), "isVisible"))
    {
        objj_msgSend(_toolbarBackgroundView, "removeFromSuperview");
        _toolbarBackgroundView = nil;
        return;
    }
    if (!_toolbarBackgroundView)
    {
        _toolbarBackgroundView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_toolbarBackgroundView, "setBackgroundColor:", objj_msgSend(objj_msgSend(self, "class"), "toolbarBackgroundColor"));
        objj_msgSend(_toolbarBackgroundView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self, "addSubview:positioned:relativeTo:", _toolbarBackgroundView, CPWindowBelow, nil);
    }
    var frame = CGRectMakeZero();
    frame.origin = CGPointMakeCopy(objj_msgSend(self, "toolbarOffset"));
    frame.size = objj_msgSend(_toolbarView, "frame").size;
    objj_msgSend(_toolbarBackgroundView, "setFrame:", frame);
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("toolbarBackgroundColor"), function $_CPBorderlessBridgeWindowView__toolbarBackgroundColor(self, _cmd)
{ with(self)
{
    if (!_CPToolbarViewBackgroundColor)
        _CPToolbarViewBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_CPBorderlessBridgeWindowView, "class")), "pathForResource:", "_CPToolbarView/_CPToolbarViewBackground.png"), CGSizeMake(1.0, 59.0)));
    return _CPToolbarViewBackgroundColor;
}
},["CPColor"])]);
}

