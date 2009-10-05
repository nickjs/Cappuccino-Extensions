c;6989;
var _1=nil,_2=nil;
var _3=26;
var _4=objj_allocateClassPair(_CPWindowView,"_CPHUDWindowView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_toolbarView"),new objj_ivar("_titleField"),new objj_ivar("_closeButton")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(objj_msgSend(_6,"class"),"contentRectForFrameRect:",_8);
if(objj_msgSend(objj_msgSend(objj_msgSend(_6,"window"),"toolbar"),"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_6,"toolbarView"),"frame"));
_9.origin.y+=toolbarHeight;
_9.size.height-=toolbarHeight;
}
return _9;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_a,_b,_c){
with(_a){
var _d=objj_msgSend(objj_msgSend(_a,"class"),"frameRectForContentRect:",_c);
if(objj_msgSend(objj_msgSend(objj_msgSend(_a,"window"),"toolbar"),"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_a,"toolbarView"),"frame"));
_d.origin.y-=toolbarHeight;
_d.size.height+=toolbarHeight;
}
return _d;
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_e,_f,_10,_11){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("_CPWindowView")},"initWithFrame:styleMask:",_10,_11);
if(_e){
var _12=objj_msgSend(_e,"bounds");
objj_msgSend(_e,"setBackgroundColor:",_1);
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setHitTests:",NO);
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_titleField,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_titleField,"setTextShadowColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setStringValue:","Untitled");
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setStringValue:","");
objj_msgSend(_titleField,"setFrame:",CGRectMake(20,3,CGRectGetWidth(objj_msgSend(_e,"bounds"))-40,CGRectGetHeight(objj_msgSend(_titleField,"frame"))));
objj_msgSend(_e,"addSubview:",_titleField);
if(_styleMask&CPClosableWindowMask){
var _13=objj_msgSend(_CPHUDWindowViewCloseImage,"size");
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(4,4,_13.width,_13.height));
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_closeButton,"setImage:",_CPHUDWindowViewCloseImage);
objj_msgSend(_closeButton,"setAlternateImage:",_CPHUDWindowViewCloseActiveImage);
objj_msgSend(_e,"addSubview:",_closeButton);
}
objj_msgSend(_e,"setResizeIndicatorOffset:",CGSizeMake(5,5));
}
return _e;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_14,_15){
with(_14){
objj_msgSend(_closeButton,"setTarget:",objj_msgSend(_14,"window"));
objj_msgSend(_closeButton,"setAction:",sel_getUid("performClose:"));
}
}),new objj_method(sel_getUid("setTitle:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_titleField,"setStringValue:",_18);
}
}),new objj_method(sel_getUid("toolbarView"),function(_19,_1a){
with(_19){
return _toolbarView;
}
}),new objj_method(sel_getUid("toolbarLabelColor"),function(_1b,_1c){
with(_1b){
return objj_msgSend(CPColor,"whiteColor");
}
}),new objj_method(sel_getUid("toolbarLabelShadowColor"),function(_1d,_1e){
with(_1d){
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_1f,_20){
with(_1f){
return CGSizeMake(0,_3);
}
}),new objj_method(sel_getUid("tile"),function(_21,_22){
with(_21){
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("_CPWindowView")},"tile");
var _23=objj_msgSend(_21,"window"),_24=objj_msgSend(_21,"bounds"),_25=CGRectGetWidth(_24);
objj_msgSend(_titleField,"setFrame:",CGRectMake(20,3,_25-40,CGRectGetHeight(objj_msgSend(_titleField,"frame"))));
var _26=objj_msgSend(_21,"toolbarMaxY");
objj_msgSend(objj_msgSend(_23,"contentView"),"setFrameOrigin:",CGPointMake(0,_26,_25,CGRectGetHeight(_24)-_26));
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_27,_28){
with(_27){
if(_27!=objj_msgSend(_CPHUDWindowView,"class")){
return;
}
var _29=objj_msgSend(CPBundle,"bundleForClass:",_27);
_1=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground0.png"),CPSizeMake(6,78)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground1.png"),CPSizeMake(1,78)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground2.png"),CPSizeMake(6,78)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground3.png"),CPSizeMake(6,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground4.png"),CPSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground5.png"),CPSizeMake(6,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground6.png"),CPSizeMake(6,6)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground7.png"),CPSizeMake(6,6)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground8.png"),CPSizeMake(6,6))]));
_CPHUDWindowViewCloseImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","HUDTheme/WindowClose.png"),CPSizeMake(20,20));
_CPHUDWindowViewCloseActiveImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","HUDTheme/WindowCloseActive.png"),CPSizeMake(20,20));
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_2a,_2b,_2c){
with(_2a){
var _2d=CGRectMakeCopy(_2c),_2e=_3;
_2d.origin.y+=_2e;
_2d.size.height-=_2e;
return _2d;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_2f,_30,_31){
with(_2f){
var _32=CGRectMakeCopy(_31),_33=_3;
_32.origin.y-=_33;
_32.size.height+=_33;
return _32;
}
})]);
