i;8;CPView.ji;13;CPImageView.jc;9094;
var _1=nil;
var _2=objj_allocateClassPair(CPView,"_CPWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_styleMask"),new objj_ivar("_resizeIndicator"),new objj_ivar("_resizeIndicatorOffset"),new objj_ivar("_toolbarView"),new objj_ivar("_resizeFrame"),new objj_ivar("_mouseDraggedPoint"),new objj_ivar("_cachedScreenFrame")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_4,_5,_6){
with(_4){
return objj_msgSend(objj_msgSend(_4,"class"),"contentRectForFrameRect:",_6);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(objj_msgSend(_7,"class"),"frameRectForContentRect:",_9);
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPView")},"initWithFrame:",_c);
if(_a){
_styleMask=_d;
_resizeIndicatorOffset=CGSizeMake(0,0);
_toolbarOffset=CGSizeMake(0,0);
objj_msgSend(_a,"setShowsResizeIndicator:",!(_styleMask&CPBorderlessBridgeWindowMask)&&(_styleMask&CPResizableWindowMask));
}
return _a;
}
}),new objj_method(sel_getUid("setTitle:"),function(_e,_f,_10){
with(_e){
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_11,_12,_13){
with(_11){
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_14,_15,_16){
with(_14){
var _17=objj_msgSend(_14,"window");
if((_styleMask&CPResizableWindowMask)&&_resizeIndicator){
var _18=objj_msgSend(_resizeIndicator,"frame");
if(CGRectContainsPoint(_18,objj_msgSend(_14,"convertPoint:fromView:",objj_msgSend(_16,"locationInWindow"),nil))){
return objj_msgSend(_14,"trackResizeWithEvent:",_16);
}
}
if(objj_msgSend(_17,"isMovableByWindowBackground")){
objj_msgSend(_14,"trackMoveWithEvent:",_16);
}else{
objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPView")},"mouseDown:",_16);
}
}
}),new objj_method(sel_getUid("trackResizeWithEvent:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(_1b,"locationInWindow"),_1d=objj_msgSend(_1b,"type");
if(_1d===CPLeftMouseUp){
return;
}
var _1e=objj_msgSend(_19,"window");
if(_1d===CPLeftMouseDown){
var _1f=objj_msgSend(_1e,"frame");
_resizeFrame=CGRectMake(_1c.x,_1c.y,CGRectGetWidth(_1f),CGRectGetHeight(_1f));
}else{
if(_1d===CPLeftMouseDragged){
objj_msgSend(_1e,"setFrameSize:",CGSizeMake(CGRectGetWidth(_resizeFrame)+_1c.x-CGRectGetMinX(_resizeFrame),CGRectGetHeight(_resizeFrame)+_1c.y-CGRectGetMinY(_resizeFrame)));
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_19,sel_getUid("trackResizeWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_pointWithinScreenFrame:"),function(_20,_21,_22){
with(_20){
if(!objj_msgSend(CPPlatform,"isBrowser")){
return _22;
}
var _23=_cachedScreenFrame;
if(!_23){
_23=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"visibleFrame");
}
var _24=CGPointMake(0,0);
_24.x=MIN(MAX(_22.x,-_frame.size.width+4),CGRectGetMaxX(_23)-4);
_24.y=MIN(MAX(_22.y,0),CGRectGetMaxY(_23)-8);
return _24;
}
}),new objj_method(sel_getUid("trackMoveWithEvent:"),function(_25,_26,_27){
with(_25){
var _28=objj_msgSend(_27,"type");
if(_28===CPLeftMouseUp){
_cachedScreenFrame=nil;
return;
}else{
if(_28===CPLeftMouseDown){
_mouseDraggedPoint=objj_msgSend(objj_msgSend(_25,"window"),"convertBaseToGlobal:",objj_msgSend(_27,"locationInWindow"));
_cachedScreenFrame=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"visibleFrame");
}else{
if(_28===CPLeftMouseDragged){
var _29=objj_msgSend(_25,"window"),_2a=objj_msgSend(_29,"frame"),_2b=objj_msgSend(_29,"convertBaseToGlobal:",objj_msgSend(_27,"locationInWindow")),_2c=objj_msgSend(_25,"_pointWithinScreenFrame:",CGPointMake((_2a.origin.x)+(_2b.x-_mouseDraggedPoint.x),(_2a.origin.y)+(_2b.y-_mouseDraggedPoint.y)));
objj_msgSend(_29,"setFrameOrigin:",_2c);
_mouseDraggedPoint=objj_msgSend(_25,"_pointWithinScreenFrame:",_2b);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_25,sel_getUid("trackMoveWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_2d,_2e,_2f){
with(_2d){
if(_2f){
var _30=objj_msgSend(_1,"size"),_31=objj_msgSend(_2d,"frame").size;
_resizeIndicator=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(_31.width-_30.width-_resizeIndicatorOffset.width,_31.height-_30.height-_resizeIndicatorOffset.height,_30.width,_30.height));
objj_msgSend(_resizeIndicator,"setImage:",_1);
objj_msgSend(_resizeIndicator,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_2d,"addSubview:",_resizeIndicator);
}else{
objj_msgSend(_resizeIndicator,"removeFromSuperview");
_resizeIndicator=nil;
}
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_32,_33){
with(_32){
return _resizeIndicator!==nil;
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_34,_35,_36){
with(_34){
if(CGSizeEqualToSize(_resizeIndicatorOffset,_36)){
return;
}
_resizeIndicatorOffset=_36;
if(!_resizeIndicator){
return;
}
var _37=objj_msgSend(_resizeIndicator,"frame").size,_38=objj_msgSend(_34,"frame").size;
objj_msgSend(_resizeIndicator,"setFrameOrigin:",CGPointMake(_38.width-_37.width-_36.width,_38.height-_37.height-_36.height));
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_39,_3a){
with(_39){
return _resizeIndicatorOffset;
}
}),new objj_method(sel_getUid("windowDidChangeDocumentEdited"),function(_3b,_3c){
with(_3b){
}
}),new objj_method(sel_getUid("windowDidChangeDocumentSaving"),function(_3d,_3e){
with(_3d){
}
}),new objj_method(sel_getUid("showsToolbar"),function(_3f,_40){
with(_3f){
return YES;
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_41,_42){
with(_41){
return CGSizeMakeZero();
}
}),new objj_method(sel_getUid("toolbarLabelColor"),function(_43,_44){
with(_43){
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("toolbarMaxY"),function(_45,_46){
with(_45){
if(!_toolbarView||objj_msgSend(_toolbarView,"isHidden")){
return objj_msgSend(_45,"toolbarOffset").height;
}
return CGRectGetMaxY(objj_msgSend(_toolbarView,"frame"));
}
}),new objj_method(sel_getUid("toolbarView"),function(_47,_48){
with(_47){
return _toolbarView;
}
}),new objj_method(sel_getUid("tile"),function(_49,_4a){
with(_49){
var _4b=objj_msgSend(_49,"window"),_4c=objj_msgSend(_49,"bounds"),_4d=CGRectGetWidth(_4c);
if(objj_msgSend(objj_msgSend(_4b,"toolbar"),"isVisible")){
var _4e=objj_msgSend(_49,"toolbarView"),_4f=objj_msgSend(_49,"toolbarOffset");
objj_msgSend(_4e,"setFrame:",CGRectMake(_4f.width,_4f.height,_4d,CGRectGetHeight(objj_msgSend(_4e,"frame"))));
}
if(objj_msgSend(_49,"showsResizeIndicator")){
var _50=objj_msgSend(_resizeIndicator,"frame").size,_51=objj_msgSend(_49,"bounds").size;
objj_msgSend(_resizeIndicator,"setFrameOrigin:",CGPointMake(_51.width-_50.width-_resizeIndicatorOffset.width,_51.height-_50.height-_resizeIndicatorOffset.height));
}
}
}),new objj_method(sel_getUid("noteToolbarChanged"),function(_52,_53){
with(_52){
var _54=objj_msgSend(_52,"window"),_55=objj_msgSend(_54,"toolbar"),_56=objj_msgSend(_55,"_toolbarView");
if(_toolbarView!==_56){
objj_msgSend(_toolbarView,"removeFromSuperview");
if(_56){
objj_msgSend(_56,"removeFromSuperview");
objj_msgSend(_56,"setLabelColor:",objj_msgSend(_52,"toolbarLabelColor"));
if(objj_msgSend(_52,"respondsToSelector:",sel_getUid("toolbarLabelShadowColor"))){
objj_msgSend(_56,"setLabelShadowColor:",objj_msgSend(_52,"toolbarLabelShadowColor"));
}
objj_msgSend(_52,"addSubview:",_56);
}
_toolbarView=_56;
}
objj_msgSend(_56,"setHidden:",!objj_msgSend(_52,"showsToolbar")||!objj_msgSend(_55,"isVisible"));
if(_54){
var _57=objj_msgSend(_52,"convertRect:toView:",objj_msgSend(objj_msgSend(_54,"contentView"),"frame"),nil);
_57.origin=objj_msgSend(_54,"convertBaseToGlobal:",_57.origin);
objj_msgSend(_52,"setAutoresizesSubviews:",NO);
objj_msgSend(_54,"setFrame:",objj_msgSend(_54,"frameRectForContentRect:",_57));
objj_msgSend(_52,"setAutoresizesSubviews:",YES);
}
objj_msgSend(_52,"tile");
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_58,_59,_5a){
with(_58){
if(!_resizeIndicator||_5a===_resizeIndicator){
return;
}
objj_msgSend(_58,"addSubview:",_resizeIndicator);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_5b,_5c){
with(_5b){
if(_5b!=objj_msgSend(_CPWindowView,"class")){
return;
}
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class")),"pathForResource:","_CPWindowView/_CPWindowViewResizeIndicator.png"),CGSizeMake(12,12));
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_5d,_5e,_5f){
with(_5d){
return CGRectMakeCopy(_5f);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_60,_61,_62){
with(_60){
return CGRectMakeCopy(_62);
}
})]);
