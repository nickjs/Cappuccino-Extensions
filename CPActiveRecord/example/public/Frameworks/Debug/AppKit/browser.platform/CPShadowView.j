I;21;Foundation/CPBundle.ji;12;CGGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPView.jc;7979;
CPLightShadow = 0;
CPHeavyShadow = 1;
var CPShadowViewLightBackgroundColor = nil,
    CPShadowViewHeavyBackgroundColor = nil;
var LIGHT_LEFT_INSET = 3.0,
    LIGHT_RIGHT_INSET = 3.0,
    LIGHT_TOP_INSET = 3.0,
    LIGHT_BOTTOM_INSET = 5.0,
    HEAVY_LEFT_INSET = 7.0,
    HEAVY_RIGHT_INSET = 7.0,
    HEAVY_TOP_INSET = 5.0,
    HEAVY_BOTTOM_INSET = 5.0;
{var the_class = objj_allocateClassPair(CPView, "CPShadowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_weight")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPShadowView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _weight = CPLightShadow;
        objj_msgSend(self, "setBackgroundColor:", CPShadowViewLightBackgroundColor);
        objj_msgSend(self, "setHitTests:", NO);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setWeight:"), function $CPShadowView__setWeight_(self, _cmd, aWeight)
{ with(self)
{
    if (_weight == aWeight)
        return;
    _weight = aWeight;
    if (_weight == CPLightShadow)
        objj_msgSend(self, "setBackgroundColor:", CPShadowViewLightBackgroundColor);
    else
        objj_msgSend(self, "setBackgroundColor:", CPShadowViewHeavyBackgroundColor);
}
},["void","CPShadowWeight"]), new objj_method(sel_getUid("leftInset"), function $CPShadowView__leftInset(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_LEFT_INSET : HEAVY_LEFT_INSET;
}
},["float"]), new objj_method(sel_getUid("rightInset"), function $CPShadowView__rightInset(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_RIGHT_INSET : HEAVY_RIGHT_INSET;
}
},["float"]), new objj_method(sel_getUid("topInset"), function $CPShadowView__topInset(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_TOP_INSET : HEAVY_TOP_INSET;
}
},["float"]), new objj_method(sel_getUid("bottomInset"), function $CPShadowView__bottomInset(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_BOTTOM_INSET : HEAVY_BOTTOM_INSET;
}
},["float"]), new objj_method(sel_getUid("horizontalInset"), function $CPShadowView__horizontalInset(self, _cmd)
{ with(self)
{
    if (_weight == CPLightShadow)
        return LIGHT_LEFT_INSET + LIGHT_RIGHT_INSET;
    return HEAVY_LEFT_INSET + HEAVY_RIGHT_INSET;
}
},["float"]), new objj_method(sel_getUid("verticalInset"), function $CPShadowView__verticalInset(self, _cmd)
{ with(self)
{
    if (_weight == CPLightShadow)
        return LIGHT_TOP_INSET + LIGHT_BOTTOM_INSET;
    return HEAVY_TOP_INSET + HEAVY_BOTTOM_INSET;
}
},["float"]), new objj_method(sel_getUid("frameForContentFrame:"), function $CPShadowView__frameForContentFrame_(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "frameForContentFrame:withWeight:", aFrame, _weight);
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("setFrameForContentFrame:"), function $CPShadowView__setFrameForContentFrame_(self, _cmd, aFrame)
{ with(self)
{
    objj_msgSend(self, "setFrame:", objj_msgSend(self, "frameForContentFrame:", aFrame));
}
},["void","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPShadowView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPShadowView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
    CPShadowViewLightBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightTopLeft.png"), CGSizeMake(9.0, 9.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightTop.png"), CGSizeMake(1.0, 9.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightTopRight.png"), CGSizeMake(9.0, 9.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightLeft.png"), CGSizeMake(9.0, 1.0)),
            nil,
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightRight.png"), CGSizeMake(9.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightBottomLeft.png"), CGSizeMake(9.0, 9.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightBottom.png"), CGSizeMake(1.0, 9.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightBottomRight.png"), CGSizeMake(9.0, 9.0))
        ]));
    CPShadowViewHeavyBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyTopLeft.png"), CGSizeMake(17.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyTop.png"), CGSizeMake(1.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyTopRight.png"), CGSizeMake(17.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyLeft.png"), CGSizeMake(17.0, 1.0)),
            nil,
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyRight.png"), CGSizeMake(17.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyBottomLeft.png"), CGSizeMake(17.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyBottom.png"), CGSizeMake(1.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyBottomRight.png"), CGSizeMake(17.0, 17.0))
        ]));
}
},["void"]), new objj_method(sel_getUid("frameForContentFrame:withWeight:"), function $CPShadowView__frameForContentFrame_withWeight_(self, _cmd, aFrame, aWeight)
{ with(self)
{
    if (aWeight == CPLightShadow)
        return CGRectMake((aFrame.origin.x) - LIGHT_LEFT_INSET, (aFrame.origin.y) - LIGHT_TOP_INSET, (aFrame.size.width) + LIGHT_LEFT_INSET + LIGHT_RIGHT_INSET, (aFrame.size.height) + LIGHT_TOP_INSET + LIGHT_BOTTOM_INSET);
    else
        return CGRectMake((aFrame.origin.x) - HEAVY_LEFT_INSET, (aFrame.origin.y) - HEAVY_TOP_INSET, (aFrame.size.width) + HEAVY_LEFT_INSET + HEAVY_RIGHT_INSET, (aFrame.size.height) + HEAVY_TOP_INSET + HEAVY_BOTTOM_INSET);
}
},["CGRect","CGRect","CPShadowWeight"])]);
}

