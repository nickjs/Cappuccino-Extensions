i;15;_CPWindowView.jc;1901;
var _1=nil;
var _2=objj_allocateClassPair(_CPWindowView,"_CPBorderlessBridgeWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_toolbarBackgroundView")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("tile"),function(_4,_5){
with(_4){
objj_msgSendSuper({receiver:_4,super_class:objj_getClass("_CPWindowView")},"tile");
var _6=objj_msgSend(_4,"window"),_7=objj_msgSend(_4,"bounds");
objj_msgSend(objj_msgSend(_6,"contentView"),"setFrame:",CGRectMake(0,objj_msgSend(_4,"toolbarMaxY"),CGRectGetWidth(_7),CGRectGetHeight(_7)-objj_msgSend(_4,"toolbarMaxY")));
if(!objj_msgSend(objj_msgSend(_6,"toolbar"),"isVisible")){
objj_msgSend(_toolbarBackgroundView,"removeFromSuperview");
_toolbarBackgroundView=nil;
return;
}
if(!_toolbarBackgroundView){
_toolbarBackgroundView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_toolbarBackgroundView,"setBackgroundColor:",objj_msgSend(objj_msgSend(_4,"class"),"toolbarBackgroundColor"));
objj_msgSend(_toolbarBackgroundView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_4,"addSubview:positioned:relativeTo:",_toolbarBackgroundView,CPWindowBelow,nil);
}
var _8=CGRectMakeZero();
_8.origin=CGPointMakeCopy(objj_msgSend(_4,"toolbarOffset"));
_8.size=objj_msgSend(_toolbarView,"frame").size;
objj_msgSend(_toolbarBackgroundView,"setFrame:",_8);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("toolbarBackgroundColor"),function(_9,_a){
with(_9){
if(!_1){
_1=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPBorderlessBridgeWindowView,"class")),"pathForResource:","_CPToolbarView/_CPToolbarViewBackground.png"),CGSizeMake(1,59)));
}
return _1;
}
})]);
