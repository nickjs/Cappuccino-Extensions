i;15;_CPWindowView.jc;9845;
var _1=41;
var _2=nil,_3=nil;
var _4=objj_allocateClassPair(CPView,"_CPTexturedWindowHeadView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_gradientView"),new objj_ivar("_solidView"),new objj_ivar("_dividerView")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPView")},"initWithFrame:",_8);
if(_6){
var _9=objj_msgSend(_6,"class"),_a=objj_msgSend(_6,"bounds");
_gradientView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_a),_1));
objj_msgSend(_gradientView,"setBackgroundColor:",objj_msgSend(_9,"gradientColor"));
objj_msgSend(_6,"addSubview:",_gradientView);
_solidView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,_1,CGRectGetWidth(_a),CGRectGetHeight(_a)-_1));
objj_msgSend(_solidView,"setBackgroundColor:",objj_msgSend(_9,"solidColor"));
objj_msgSend(_6,"addSubview:",_solidView);
}
return _6;
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_b,"bounds");
objj_msgSend(_gradientView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_e),_1));
objj_msgSend(_solidView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_e),CGRectGetHeight(_e)-_1));
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("gradientColor"),function(_f,_10){
with(_f){
if(!_2){
var _11=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPWindowView,"class"));
_2=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop0.png"),CGSizeMake(6,41)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop1.png"),CGSizeMake(1,41)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop2.png"),CGSizeMake(6,41))],NO));
}
return _2;
}
}),new objj_method(sel_getUid("solidColor"),function(_12,_13){
with(_12){
if(!_3){
_3=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",195/255,195/255,195/255,1);
}
return _3;
}
})]);
var _14=nil,_15=nil,_16=nil,_17=nil,_18=nil;
var _19=41;
STANDARD_TITLEBAR_HEIGHT=25;
var _4=objj_allocateClassPair(_CPWindowView,"_CPStandardWindowView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_headView"),new objj_ivar("_dividerView"),new objj_ivar("_bodyView"),new objj_ivar("_toolbarView"),new objj_ivar("_titleField"),new objj_ivar("_closeButton")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=objj_msgSend(objj_msgSend(_1a,"class"),"contentRectForFrameRect:",_1c),_1e=objj_msgSend(objj_msgSend(_1a,"window"),"toolbar");
if(objj_msgSend(_1e,"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_1e,"_toolbarView"),"frame"));
_1d.origin.y+=toolbarHeight;
_1d.size.height-=toolbarHeight;
}
return _1d;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(objj_msgSend(_1f,"class"),"frameRectForContentRect:",_21),_23=objj_msgSend(objj_msgSend(_1f,"window"),"toolbar");
if(objj_msgSend(_23,"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_23,"_toolbarView"),"frame"));
_22.origin.y-=toolbarHeight;
_22.size.height+=toolbarHeight;
}
return _22;
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_24,_25,_26,_27){
with(_24){
_24=objj_msgSendSuper({receiver:_24,super_class:objj_getClass("_CPWindowView")},"initWithFrame:styleMask:",_26,_27);
if(_24){
var _28=objj_msgSend(_24,"class"),_29=objj_msgSend(_24,"bounds");
_headView=objj_msgSend(objj_msgSend(_CPTexturedWindowHeadView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_29),objj_msgSend(objj_msgSend(_24,"class"),"titleBarHeight")));
objj_msgSend(_headView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_headView,"setHitTests:",NO);
objj_msgSend(_24,"addSubview:",_headView);
_dividerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_headView,"frame")),CGRectGetWidth(_29),1));
objj_msgSend(_dividerView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_dividerView,"setBackgroundColor:",objj_msgSend(_28,"dividerBackgroundColor"));
objj_msgSend(_dividerView,"setHitTests:",NO);
objj_msgSend(_24,"addSubview:",_dividerView);
var y=CGRectGetMaxY(objj_msgSend(_dividerView,"frame"));
_bodyView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,y,CGRectGetWidth(_29),CGRectGetHeight(_29)-y));
objj_msgSend(_bodyView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_bodyView,"setBackgroundColor:",objj_msgSend(_28,"bodyBackgroundColor"));
objj_msgSend(_bodyView,"setHitTests:",NO);
objj_msgSend(_24,"addSubview:",_bodyView);
objj_msgSend(_24,"setResizeIndicatorOffset:",CGSizeMake(2,2));
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_titleField,"setStringValue:","Untitled");
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setStringValue:","");
objj_msgSend(_24,"addSubview:",_titleField);
if(_styleMask&CPClosableWindowMask){
if(!_17){
var _2b=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_17=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2b,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButton.png"),CGSizeMake(16,16));
_18=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2b,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButtonHighlighted.png"),CGSizeMake(16,16));
}
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(8,7,16,16));
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_closeButton,"setImage:",_17);
objj_msgSend(_closeButton,"setAlternateImage:",_18);
objj_msgSend(_24,"addSubview:",_closeButton);
}
objj_msgSend(_24,"tile");
}
return _24;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_2c,_2d){
with(_2c){
objj_msgSend(_closeButton,"setTarget:",objj_msgSend(_2c,"window"));
objj_msgSend(_closeButton,"setAction:",sel_getUid("performClose:"));
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_2e,_2f){
with(_2e){
return CGSizeMake(0,objj_msgSend(objj_msgSend(_2e,"class"),"titleBarHeight"));
}
}),new objj_method(sel_getUid("tile"),function(_30,_31){
with(_30){
objj_msgSendSuper({receiver:_30,super_class:objj_getClass("_CPWindowView")},"tile");
var _32=objj_msgSend(_30,"window"),_33=objj_msgSend(_30,"bounds"),_34=CGRectGetWidth(_33);
objj_msgSend(_headView,"setFrameSize:",CGSizeMake(_34,objj_msgSend(_30,"toolbarMaxY")));
objj_msgSend(_dividerView,"setFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_headView,"frame")),_34,1));
var _35=CGRectGetMaxY(objj_msgSend(_dividerView,"frame"));
objj_msgSend(_bodyView,"setFrame:",CGRectMake(0,_35,_34,CGRectGetHeight(_33)-_35));
objj_msgSend(_titleField,"setFrame:",CGRectMake(10,3,_34-20,CGRectGetHeight(objj_msgSend(_titleField,"frame"))));
objj_msgSend(objj_msgSend(_32,"contentView"),"setFrameOrigin:",CGPointMake(0,CGRectGetMaxY(objj_msgSend(_dividerView,"frame"))));
}
}),new objj_method(sel_getUid("setTitle:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_titleField,"setStringValue:",_38);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_39,_3a,_3b){
with(_39){
if(CGRectContainsPoint(objj_msgSend(_headView,"frame"),objj_msgSend(_39,"convertPoint:fromView:",objj_msgSend(_3b,"locationInWindow"),nil))){
return objj_msgSend(_39,"trackMoveWithEvent:",_3b);
}
objj_msgSendSuper({receiver:_39,super_class:objj_getClass("_CPWindowView")},"mouseDown:",_3b);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("bodyBackgroundColor"),function(_3c,_3d){
with(_3c){
if(!_14){
_14=objj_msgSend(CPColor,"colorWithWhite:alpha:",0.96,1);
}
return _14;
}
}),new objj_method(sel_getUid("dividerBackgroundColor"),function(_3e,_3f){
with(_3e){
if(!_15){
_15=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",125/255,125/255,125/255,1);
}
return _15;
}
}),new objj_method(sel_getUid("titleColor"),function(_40,_41){
with(_40){
if(!_16){
_16=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",44/255,44/255,44/255,1);
}
return _16;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_42,_43,_44){
with(_42){
var _45=CGRectMakeCopy(_44),_46=objj_msgSend(_42,"titleBarHeight")+1;
_45.origin.y+=_46;
_45.size.height-=_46;
return _45;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_47,_48,_49){
with(_47){
var _4a=CGRectMakeCopy(_49),_4b=objj_msgSend(_47,"titleBarHeight")+1;
_4a.origin.y-=_4b;
_4a.size.height+=_4b;
return _4a;
}
}),new objj_method(sel_getUid("titleBarHeight"),function(_4c,_4d){
with(_4c){
return STANDARD_TITLEBAR_HEIGHT;
}
})]);
