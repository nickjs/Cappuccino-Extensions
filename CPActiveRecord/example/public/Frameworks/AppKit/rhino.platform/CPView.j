I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.ji;18;_CPDisplayServer.jc;43451;
CPViewNotSizable=0;
CPViewMinXMargin=1;
CPViewWidthSizable=2;
CPViewMaxXMargin=4;
CPViewMinYMargin=8;
CPViewHeightSizable=16;
CPViewMaxYMargin=32;
CPViewBoundsDidChangeNotification="CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification="CPViewFrameDidChangeNotification";
var _1=nil,_2=nil;
var _3={},_4=1<<0,_5=1<<1;
var _6=objj_allocateClassPair(CPResponder,"CPView"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView"),new objj_ivar("_viewClassFlags")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("setupViewFlags"),function(_8,_9){
with(_8){
var _a=objj_msgSend(_8,"class"),_b=objj_msgSend(_a,"UID");
if(_3[_b]===undefined){
var _c=0;
if(objj_msgSend(_a,"instanceMethodForSelector:",sel_getUid("drawRect:"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"))){
_c|=_4;
}
if(objj_msgSend(_a,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))){
_c|=_5;
}
_3[_b]=_c;
}
_viewClassFlags=_3[_b];
}
}),new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_f,_10,_11){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPResponder")},"init");
if(_f){
var _12=(_11.size.width),_13=(_11.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_11.origin.x,y:_11.origin.y},size:{width:_11.size.width,height:_11.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_12,height:_13}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_f,"setupViewFlags");
objj_msgSend(_f,"_loadThemeAttributes");
}
return _f;
}
}),new objj_method(sel_getUid("superview"),function(_14,_15){
with(_14){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_16,_17){
with(_16){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_18,_19){
with(_18){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"_insertSubview:atIndex:",_1c,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
var _22=_21?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_21):CPNotFound;
if(_22===CPNotFound){
_22=(_20===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_20===CPWindowAbove){
++_22;
}
}
objj_msgSend(_1d,"_insertSubview:atIndex:",_1f,_22);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_23,_24,_25,_26){
with(_23){
var _27=_subviews.length;
objj_msgSend(objj_msgSend(_23,"window"),"_dirtyKeyViewLoop");
if(_25._superview==_23){
var _28=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_25);
if(_28===_26||_28===_27-1&&_26===_27){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_28);
if(_26>_28){
--_26;
}
--_27;
}else{
objj_msgSend(_25,"removeFromSuperview");
objj_msgSend(_25,"_setWindow:",_window);
objj_msgSend(_25,"viewWillMoveToSuperview:",_23);
_25._superview=_23;
}
if(_26===CPNotFound||_26>=_27){
_subviews.push(_25);
}else{
_subviews.splice(_26,0,_25);
}
objj_msgSend(_25,"setNextResponder:",_23);
objj_msgSend(_25,"viewDidMoveToSuperview");
objj_msgSend(_23,"didAddSubview:",_25);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_29,_2a,_2b){
with(_29){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_2c,_2d){
with(_2c){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_2c,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_2c);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_2c);
_superview=nil;
objj_msgSend(_2c,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_2e,_2f,_30,_31){
with(_2e){
if(_30._superview!=_2e){
return;
}
var _32=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_30);
objj_msgSend(_30,"removeFromSuperview");
objj_msgSend(_2e,"_insertSubview:atIndex:",_31,_32);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_33,_34,_35){
with(_33){
if(_window===_35){
return;
}
objj_msgSend(objj_msgSend(_33,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_33){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_33,"viewWillMoveToWindow:",_35);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_35,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_35;
var _36=objj_msgSend(_subviews,"count");
while(_36--){
objj_msgSend(_subviews[_36],"_setWindow:",_35);
}
objj_msgSend(_33,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_33,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_37,_38,_39){
with(_37){
var _3a=_37;
do{
if(_3a==_39){
return YES;
}
}while(_3a=objj_msgSend(_3a,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_3b,_3c){
with(_3b){
objj_msgSend(_3b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_3d,_3e){
with(_3d){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_3f,_40,_41){
with(_3f){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_42,_43,_44){
with(_42){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_45,_46,_47){
with(_45){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_48,_49){
with(_48){
var _4a=_48;
while(_4a&&!objj_msgSend(_4a,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_4a=objj_msgSend(_4a,"superview");
}
if(_4a){
return _4a._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_4b,_4c,_4d){
with(_4b){
_tag=_4d;
}
}),new objj_method(sel_getUid("tag"),function(_4e,_4f){
with(_4e){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_50,_51,_52){
with(_50){
if(objj_msgSend(_50,"tag")===_52){
return _50;
}
var _53=0,_54=_subviews.length;
for(;_53<_54;++_53){
var _55=objj_msgSend(_subviews[_53],"viewWithTag:",_52);
if(_55){
return _55;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_56,_57){
with(_56){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_58,_59,_5a){
with(_58){
if(((_frame.origin.x==_5a.origin.x&&_frame.origin.y==_5a.origin.y)&&(_frame.size.width==_5a.size.width&&_frame.size.height==_5a.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_58,"setFrameOrigin:",_5a.origin);
objj_msgSend(_58,"setFrameSize:",_5a.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_58);
}
}
}),new objj_method(sel_getUid("frame"),function(_5b,_5c){
with(_5b){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("frameOrigin"),function(_5d,_5e){
with(_5d){
return {x:_frame.origin.x,y:_frame.origin.y};
}
}),new objj_method(sel_getUid("frameSize"),function(_5f,_60){
with(_5f){
return {width:_frame.size.width,height:_frame.size.height};
}
}),new objj_method(sel_getUid("setCenter:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_61,"setFrameOrigin:",CGPointMake(_63.x-_frame.size.width/2,_63.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_64,_65){
with(_64){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_66,_67,_68){
with(_66){
var _69=_frame.origin;
if(!_68||(_69.x==_68.x&&_69.y==_68.y)){
return;
}
_69.x=_68.x;
_69.y=_68.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_66);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_6a,_6b,_6c){
with(_6a){
var _6d=_frame.size;
if(!_6c||(_6d.width==_6c.width&&_6d.height==_6c.height)){
return;
}
var _6e={width:_6d.width,height:_6d.height};
_6d.width=_6c.width;
_6d.height=_6c.height;
if(YES){
_bounds.size.width=_6c.width;
_bounds.size.height=_6c.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_6a,"resizeSubviewsWithOldSize:",_6e);
}
objj_msgSend(_6a,"setNeedsLayout");
objj_msgSend(_6a,"setNeedsDisplay:",YES);
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_6a);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_6f,_70,_71){
with(_6f){
if(((_bounds.origin.x==_71.origin.x&&_bounds.origin.y==_71.origin.y)&&(_bounds.size.width==_71.size.width&&_bounds.size.height==_71.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_6f,"setBoundsOrigin:",_71.origin);
objj_msgSend(_6f,"setBoundsSize:",_71.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_6f);
}
}
}),new objj_method(sel_getUid("bounds"),function(_72,_73){
with(_72){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_74,_75,_76){
with(_74){
var _77=_bounds.origin;
if((_77.x==_76.x&&_77.y==_76.y)){
return;
}
_77.x=_76.x;
_77.y=_76.y;
if(_77.x!=0||_77.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_77.x,ty:-_77.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_74);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_78,_79,_7a){
with(_78){
var _7b=_bounds.size;
if((_7b.width==_7a.width&&_7b.height==_7a.height)){
return;
}
var _7c=_frame.size;
if(!(_7b.width==_7c.width&&_7b.height==_7c.height)){
var _7d=_bounds.origin;
_7d.x/=_7b.width/_7c.width;
_7d.y/=_7b.height/_7c.height;
}
_7b.width=_7a.width;
_7b.height=_7a.height;
if(!(_7b.width==_7c.width&&_7b.height==_7c.height)){
var _7d=_bounds.origin;
_7d.x*=_7b.width/_7c.width;
_7d.y*=_7b.height/_7c.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_78);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_7e,_7f,_80){
with(_7e){
var _81=objj_msgSend(_7e,"autoresizingMask");
if(_81==CPViewNotSizable){
return;
}
var _82=_superview._frame,_83={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_82.size.width)-_80.width)/(((_81&CPViewMinXMargin)?1:0)+(_81&CPViewWidthSizable?1:0)+(_81&CPViewMaxXMargin?1:0)),dY=((_82.size.height)-_80.height)/((_81&CPViewMinYMargin?1:0)+(_81&CPViewHeightSizable?1:0)+(_81&CPViewMaxYMargin?1:0));
if(_81&CPViewMinXMargin){
_83.origin.x+=dX;
}
if(_81&CPViewWidthSizable){
_83.size.width+=dX;
}
if(_81&CPViewMinYMargin){
_83.origin.y+=dY;
}
if(_81&CPViewHeightSizable){
_83.size.height+=dY;
}
objj_msgSend(_7e,"setFrame:",_83);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_86,_87,_88){
with(_86){
var _89=_subviews.length;
while(_89--){
objj_msgSend(_subviews[_89],"resizeWithOldSuperviewSize:",_88);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_8a,_8b,_8c){
with(_8a){
_autoresizesSubviews=!!_8c;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_8d,_8e){
with(_8d){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_8f,_90,_91){
with(_8f){
_autoresizingMask=_91;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_92,_93){
with(_92){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_94,_95){
with(_94){
return objj_msgSend(_94,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_96,_97,_98,_99){
with(_96){
_fullScreenModeState=_9a(_96);
var _9b=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_9b,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_9b,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _9c=objj_msgSend(_9b,"contentView");
objj_msgSend(_9c,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_9c,"addSubview:",_96);
objj_msgSend(_96,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_96,"setFrame:",CGRectMakeCopy(objj_msgSend(_9c,"bounds")));
objj_msgSend(_9b,"makeKeyAndOrderFront:",_96);
objj_msgSend(_9b,"makeFirstResponder:",_96);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_9d,_9e){
with(_9d){
objj_msgSend(_9d,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_9f,_a0,_a1){
with(_9f){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_9f,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_9f,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_9f,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_9f,"window"),"orderOut:",_9f);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_a2,_a3){
with(_a2){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_a4,_a5,_a6){
with(_a4){
_a6=!!_a6;
if(_isHidden===_a6){
return;
}
_isHidden=_a6;
if(_a6){
var _a7=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_a7,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_a4==_a7){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_a4,"nextValidKeyView"));
break;
}
}while(_a7=objj_msgSend(_a7,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_a8,_a9){
with(_a8){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_aa,_ab,_ac){
with(_aa){
if(_opacity==_ac){
return;
}
_opacity=_ac;
}
}),new objj_method(sel_getUid("alphaValue"),function(_ad,_ae){
with(_ad){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_af,_b0){
with(_af){
var _b1=_af;
while(_b1&&!objj_msgSend(_b1,"isHidden")){
_b1=objj_msgSend(_b1,"superview");
}
return _b1!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_b2,_b3,_b4){
with(_b2){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_b5,_b6){
with(_b5){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_b7,_b8,_b9){
with(_b7){
_hitTests=!!_b9;
}
}),new objj_method(sel_getUid("hitTest:"),function(_ba,_bb,_bc){
with(_ba){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_bc)){
return nil;
}
var _bd=nil,i=_subviews.length,_bf={x:_bc.x-(_frame.origin.x),y:_bc.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_bf={x:_bf.x*_inverseBoundsTransform.a+_bf.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_bf.x*_inverseBoundsTransform.b+_bf.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_bd=objj_msgSend(_subviews[i],"hitTest:",_bf)){
return _bd;
}
}
return _ba;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_c0,_c1){
with(_c0){
return !objj_msgSend(_c0,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_c2,_c3,_c4){
with(_c2){
if(objj_msgSend(_c2,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_c2,super_class:objj_getClass("CPResponder")},"mouseDown:",_c4);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_c5,_c6,_c7){
with(_c5){
if(_backgroundColor==_c7){
return;
}
_backgroundColor=_c7;
}
}),new objj_method(sel_getUid("backgroundColor"),function(_c8,_c9){
with(_c8){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_ca,_cb,_cc,_cd){
with(_ca){
return CGPointApplyAffineTransform(_cc,_ce(_cd,_ca));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_cf,_d0,_d1,_d2){
with(_cf){
return CGPointApplyAffineTransform(_d1,_ce(_cf,_d2));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_d3,_d4,_d5,_d6){
with(_d3){
return CGSizeApplyAffineTransform(_d5,_ce(_d6,_d3));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_d7,_d8,_d9,_da){
with(_d7){
return CGSizeApplyAffineTransform(_d9,_ce(_d7,_da));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_db,_dc,_dd,_de){
with(_db){
return CGRectApplyAffineTransform(_dd,_ce(_de,_db));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_df,_e0,_e1,_e2){
with(_df){
return CGRectApplyAffineTransform(_e1,_ce(_df,_e2));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_e3,_e4,_e5){
with(_e3){
_e5=!!_e5;
if(_postsFrameChangedNotifications===_e5){
return;
}
_postsFrameChangedNotifications=_e5;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_e3);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_e6,_e7){
with(_e6){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_e8,_e9,_ea){
with(_e8){
_ea=!!_ea;
if(_postsBoundsChangedNotifications===_ea){
return;
}
_postsBoundsChangedNotifications=_ea;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_e8);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(_eb,_ec){
with(_eb){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_ed,_ee,_ef,_f0,_f1,_f2,_f3,_f4,_f5){
with(_ed){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_ef,objj_msgSend(_ed,"convertPoint:toView:",_f0,nil),_f1,_f2,_f3,_f4,_f5);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_f6,_f7,_f8,_f9,_fa,_fb,_fc,_fd,_fe){
with(_f6){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_f8,objj_msgSend(_f6,"convertPoint:toView:",_f9,nil),_fa,_fb,_fc,_fd,_fe);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_ff,_cmd,_101){
with(_ff){
if(!_101||!objj_msgSend(_101,"count")){
return;
}
var _102=objj_msgSend(_ff,"window");
objj_msgSend(_102,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_101);
objj_msgSend(_102,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(self,_cmd){
with(self){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(self,"window"),"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_cmd,_109){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_10c){
with(self){
if(_10c){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_10f){
with(self){
if(!(_viewClassFlags&_4)){
return;
}
if((_10f.size.width<=0||_10f.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_10f,_dirtyRect);
}else{
_dirtyRect={origin:{x:_10f.origin.x,y:_10f.origin.y},size:{width:_10f.size.width,height:_10f.size.height}};
}
_CPDisplayServerAddDisplayObject(self);
}
}),new objj_method(sel_getUid("needsDisplay"),function(self,_cmd){
with(self){
return _dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0);
}
}),new objj_method(sel_getUid("displayIfNeeded"),function(self,_cmd){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_dirtyRect);
}
}
}),new objj_method(sel_getUid("display"),function(self,_cmd){
with(self){
objj_msgSend(self,"displayRect:",objj_msgSend(self,"visibleRect"));
}
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_118){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_118);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_11b){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_11b,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_11e,_11f){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_11e);
objj_msgSend(self,"drawRect:",_11e);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _124=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_124.DOMElement;
_DOMContentsElement.style.zIndex=-100;
_DOMContentsElement.style.overflow="hidden";
_DOMContentsElement.style.position="absolute";
_DOMContentsElement.style.visibility="visible";
_DOMContentsElement.width=ROUND((_frame.size.width));
_DOMContentsElement.height=ROUND((_frame.size.height));
_DOMContentsElement.style.top="0px";
_DOMContentsElement.style.left="0px";
_DOMContentsElement.style.width=ROUND((_frame.size.width))+"px";
_DOMContentsElement.style.height=ROUND((_frame.size.height))+"px";
_DOMElement.appendChild(_DOMContentsElement);
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_124,YES);
}
objj_msgSend(CPGraphicsContext,"setCurrentContext:",_graphicsContext);
CGContextSaveGState(objj_msgSend(_graphicsContext,"graphicsPort"));
}
}),new objj_method(sel_getUid("unlockFocus"),function(self,_cmd){
with(self){
CGContextRestoreGState(objj_msgSend(_graphicsContext,"graphicsPort"));
objj_msgSend(CPGraphicsContext,"setCurrentContext:",nil);
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(self,_cmd){
with(self){
if(!(_viewClassFlags&_5)){
return;
}
_needsLayout=YES;
_CPDisplayServerAddLayoutObject(self);
}
}),new objj_method(sel_getUid("layoutIfNeeded"),function(self,_cmd){
with(self){
if(_needsLayout){
_needsLayout=NO;
objj_msgSend(self,"layoutSubviews");
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("isOpaque"),function(self,_cmd){
with(self){
return NO;
}
}),new objj_method(sel_getUid("visibleRect"),function(self,_cmd){
with(self){
if(!_superview){
return _bounds;
}
return CGRectIntersection(objj_msgSend(self,"convertRect:fromView:",objj_msgSend(_superview,"visibleRect"),_superview),_bounds);
}
}),new objj_method(sel_getUid("_enclosingClipView"),function(self,_cmd){
with(self){
var _133=_superview,_134=objj_msgSend(CPClipView,"class");
while(_133&&!objj_msgSend(_133,"isKindOfClass:",_134)){
_133=_133._superview;
}
return _133;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_137){
with(self){
var _138=objj_msgSend(self,"_enclosingClipView");
if(!_138){
return;
}
objj_msgSend(_138,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_137,_138));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_13b){
with(self){
var _13c=objj_msgSend(self,"visibleRect");
_13b=CGRectIntersection(_13b,_bounds);
if((_13b.size.width<=0||_13b.size.height<=0)||CGRectContainsRect(_13c,_13b)){
return NO;
}
var _13d=objj_msgSend(self,"_enclosingClipView");
if(!_13d){
return NO;
}
var _13e={x:_13c.origin.x,y:_13c.origin.y};
if((_13b.origin.x)<=(_13c.origin.x)){
_13e.x=(_13b.origin.x);
}else{
if((_13b.origin.x+_13b.size.width)>(_13c.origin.x+_13c.size.width)){
_13e.x+=(_13b.origin.x+_13b.size.width)-(_13c.origin.x+_13c.size.width);
}
}
if((_13b.origin.y)<=(_13c.origin.y)){
_13e.y=CGRectGetMinY(_13b);
}else{
if((_13b.origin.y+_13b.size.height)>(_13c.origin.y+_13c.size.height)){
_13e.y+=(_13b.origin.y+_13b.size.height)-(_13c.origin.y+_13c.size.height);
}
}
objj_msgSend(_13d,"scrollToPoint:",CGPointMake(_13e.x,_13e.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_141){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_141);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_144){
with(self){
return _144;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_147,_148){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _14b=_superview,_14c=objj_msgSend(CPScrollView,"class");
while(_14b&&!objj_msgSend(_14b,"isKindOfClass:",_14c)){
_14b=_14b._superview;
}
return _14b;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_14f,_150){
with(self){
objj_msgSend(_14f,"scrollToPoint:",_150);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_153){
with(self){
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingFrame"),function(self,_cmd){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","frameOrigin","frameSize");
}
})]);
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _15e=objj_msgSend(self,"nextKeyView");
while(_15e&&!objj_msgSend(_15e,"canBecomeKeyView")){
_15e=objj_msgSend(_15e,"nextKeyView");
}
return _15e;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _163=objj_msgSend(self,"previousKeyView");
while(_163&&!objj_msgSend(_163,"canBecomeKeyView")){
_163=objj_msgSend(_163,"previousKeyView");
}
return _163;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_166){
with(self){
_previousKeyView=_166;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_16c){
with(self){
if(_layer==_16c){
return;
}
if(_layer){
_layer._owningView=nil;
}
_layer=_16c;
if(_layer){
var _16d=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_172){
with(self){
_wantsLayer=!!_172;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("themeState"),function(self,_cmd){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_cmd,_179){
with(self){
return !!(_themeState&((typeof _179==="string")?CPThemeState(_179):_179));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_cmd,_17c){
with(self){
var _17d=(typeof _17c==="string")?CPThemeState(_17c):_17c;
if(_themeState&_17d){
return NO;
}
_themeState|=_17d;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_cmd,_180){
with(self){
var _181=((typeof _180==="string")?CPThemeState(_180):_180);
if(!(_themeState&_181)){
return NO;
}
_themeState&=~_181;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_cmd){
with(self){
var _184=objj_msgSend(self,"class"),_185=objj_msgSend(_184,"_themeAttributes"),_186=_185.length;
if(!_186){
return;
}
var _187=objj_msgSend(self,"theme"),_188=objj_msgSend(_184,"themeClass");
_themeAttributes={};
while(_186--){
var _189=_185[_186--],_18a=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_189,_185[_186]);
objj_msgSend(_18a,"setParentAttribute:",objj_msgSend(_187,"_attributeWithName:forClass:",_189,_188));
_themeAttributes[_189]=_18a;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_18d){
with(self){
if(_theme===_18d){
return;
}
_theme=_18d;
objj_msgSend(self,"viewDidChangeTheme");
}
}),new objj_method(sel_getUid("theme"),function(self,_cmd){
with(self){
return _theme;
}
}),new objj_method(sel_getUid("viewDidChangeTheme"),function(self,_cmd){
with(self){
if(!_themeAttributes){
return;
}
var _192=objj_msgSend(self,"theme"),_193=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _194 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_194)){
objj_msgSend(_themeAttributes[_194],"setParentAttribute:",objj_msgSend(_192,"_attributeWithName:forClass:",_194,_193));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_cmd){
with(self){
var _197=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _198=objj_msgSend(self,"theme");
for(var _199 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_199)){
objj_msgSend(_197,"setObject:forKey:",_themeAttributes[_199],_199);
}
}
}
return _197;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_cmd,_19c,_19d,_19e){
with(self){
if(!_themeAttributes||!_themeAttributes[_19d]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_19d+"'");
}
var _19f=objj_msgSend(self,"currentValueForThemeAttribute:",_19d);
objj_msgSend(_themeAttributes[_19d],"setValue:forState:",_19c,_19e);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_19d)===_19f){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_cmd,_1a2,_1a3){
with(self){
if(!_themeAttributes||!_themeAttributes[_1a3]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1a3+"'");
}
var _1a4=objj_msgSend(self,"currentValueForThemeAttribute:",_1a3);
objj_msgSend(_themeAttributes[_1a3],"setValue:",_1a2);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1a3)===_1a4){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_cmd,_1a7,_1a8){
with(self){
if(!_themeAttributes||!_themeAttributes[_1a7]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1a7+"'");
}
return objj_msgSend(_themeAttributes[_1a7],"valueForState:",_1a8);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_cmd,_1ab){
with(self){
if(!_themeAttributes||!_themeAttributes[_1ab]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1ab+"'");
}
return objj_msgSend(_themeAttributes[_1ab],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_cmd,_1ae){
with(self){
if(!_themeAttributes||!_themeAttributes[_1ae]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1ae+"'");
}
return objj_msgSend(_themeAttributes[_1ae],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_cmd,_1b1){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_cmd,_1b4){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_cmd,_1b7,_1b8,_1b9){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _1ba=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_1b7);
if(_1ba&&!(_1ba.size.width<=0||_1ba.size.height<=0)){
if(!_ephemeralSubviewsForNames[_1b7]){
_ephemeralSubviewsForNames[_1b7]=objj_msgSend(self,"createEphemeralSubviewNamed:",_1b7);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_1b7]);
if(_ephemeralSubviewsForNames[_1b7]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_1b7],_1b8,_ephemeralSubviewsForNames[_1b9]);
}
}
if(_ephemeralSubviewsForNames[_1b7]){
objj_msgSend(_ephemeralSubviewsForNames[_1b7],"setFrame:",_1ba);
}
}else{
if(_ephemeralSubviewsForNames[_1b7]){
objj_msgSend(_ephemeralSubviewsForNames[_1b7],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_1b7]);
delete _ephemeralSubviewsForNames[_1b7];
}
}
return _ephemeralSubviewsForNames[_1b7];
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("themeClass"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("_themeAttributes"),function(self,_cmd){
with(self){
if(!_2){
_2={};
}
var _1c1=objj_msgSend(self,"class"),_1c2=objj_msgSend(CPView,"class"),_1c3=[];
for(;_1c1&&_1c1!==_1c2;_1c1=objj_msgSend(_1c1,"superclass")){
var _1c4=_2[class_getName(_1c1)];
if(_1c4){
_1c3=_1c3.length?_1c3.concat(_1c4):_1c3;
_2[objj_msgSend(self,"className")]=_1c3;
break;
}
var _1c5=objj_msgSend(_1c1,"themeAttributes");
if(!_1c5){
continue;
}
var _1c6=objj_msgSend(_1c5,"allKeys"),_1c7=_1c6.length;
while(_1c7--){
var _1c8=_1c6[_1c7];
_1c3.push(objj_msgSend(_1c5,"objectForKey:",_1c8));
_1c3.push(_1c8);
}
}
return _1c3;
}
})]);
var _1c9="CPViewAutoresizingMask",_1ca="CPViewAutoresizesSubviews",_1cb="CPViewBackgroundColor",_1cc="CPViewBoundsKey",_1cd="CPViewFrameKey",_1ce="CPViewHitTestsKey",_1cf="CPViewIsHiddenKey",_1d0="CPViewOpacityKey",_1d1="CPViewSubviewsKey",_1d2="CPViewSuperviewKey",_1d3="CPViewTagKey",_1d4="CPViewThemeStateKey",_1d5="CPViewWindowKey",_1d6="CPViewNextKeyViewKey",_1d7="CPViewPreviousKeyViewKey";
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1da){
with(self){
_frame=objj_msgSend(_1da,"decodeRectForKey:",_1cd);
_bounds=objj_msgSend(_1da,"decodeRectForKey:",_1cc);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1da);
if(self){
_tag=objj_msgSend(_1da,"containsValueForKey:",_1d3)?objj_msgSend(_1da,"decodeIntForKey:",_1d3):-1;
_window=objj_msgSend(_1da,"decodeObjectForKey:",_1d5);
_subviews=objj_msgSend(_1da,"decodeObjectForKey:",_1d1)||[];
_superview=objj_msgSend(_1da,"decodeObjectForKey:",_1d2);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_autoresizingMask=objj_msgSend(_1da,"decodeIntForKey:",_1c9)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_1da,"containsValueForKey:",_1ca)||objj_msgSend(_1da,"decodeBoolForKey:",_1ca);
_hitTests=!objj_msgSend(_1da,"containsValueForKey:",_1ce)||objj_msgSend(_1da,"decodeObjectForKey:",_1ce);
if(objj_msgSend(_1da,"containsValueForKey:",_1cf)){
objj_msgSend(self,"setHidden:",objj_msgSend(_1da,"decodeBoolForKey:",_1cf));
}else{
_isHidden=NO;
}
if(objj_msgSend(_1da,"containsValueForKey:",_1d0)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1da,"decodeIntForKey:",_1d0));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1da,"decodeObjectForKey:",_1cb));
objj_msgSend(self,"setupViewFlags");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_1da,"decodeIntForKey:",_1d4));
_themeAttributes={};
var _1db=objj_msgSend(self,"class"),_1dc=objj_msgSend(_1db,"themeClass"),_1dd=objj_msgSend(_1db,"_themeAttributes"),_1de=_1dd.length;
while(_1de--){
var _1df=_1dd[_1de--];
_themeAttributes[_1df]=CPThemeAttributeDecode(_1da,_1df,_1dd[_1de],_theme,_1dc);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1e2){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1e2);
if(_tag!==-1){
objj_msgSend(_1e2,"encodeInt:forKey:",_tag,_1d3);
}
objj_msgSend(_1e2,"encodeRect:forKey:",_frame,_1cd);
objj_msgSend(_1e2,"encodeRect:forKey:",_bounds,_1cc);
if(_window!==nil){
objj_msgSend(_1e2,"encodeConditionalObject:forKey:",_window,_1d5);
}
var _1e3=objj_msgSend(_subviews,"count"),_1e4=_subviews;
if(_1e3>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_1e4=objj_msgSend(_1e4,"copy");
while(_1e3--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_1e4[_1e3])){
_1e4.splice(_1e3,1);
}
}
}
if(_1e4.length>0){
objj_msgSend(_1e2,"encodeObject:forKey:",_1e4,_1d1);
}
if(_superview!==nil){
objj_msgSend(_1e2,"encodeConditionalObject:forKey:",_superview,_1d2);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1e2,"encodeInt:forKey:",_autoresizingMask,_1c9);
}
if(!_autoresizesSubviews){
objj_msgSend(_1e2,"encodeBool:forKey:",_autoresizesSubviews,_1ca);
}
if(_backgroundColor!==nil){
objj_msgSend(_1e2,"encodeObject:forKey:",_backgroundColor,_1cb);
}
if(_hitTests!==YES){
objj_msgSend(_1e2,"encodeBool:forKey:",_hitTests,_1ce);
}
if(_opacity!==1){
objj_msgSend(_1e2,"encodeFloat:forKey:",_opacity,_1d0);
}
if(_isHidden){
objj_msgSend(_1e2,"encodeBool:forKey:",_isHidden,_1cf);
}
var _1e5=objj_msgSend(self,"nextKeyView");
if(_1e5!==nil){
objj_msgSend(_1e2,"encodeConditionalObject:forKey:",_1e5,_1d6);
}
var _1e6=objj_msgSend(self,"previousKeyView");
if(_1e6!==nil){
objj_msgSend(_1e2,"encodeConditionalObject:forKey:",_1e6,_1d7);
}
objj_msgSend(_1e2,"encodeInt:forKey:",CPThemeStateName(_themeState),_1d4);
for(var _1e7 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1e7)){
CPThemeAttributeEncode(_1e2,_themeAttributes[_1e7]);
}
}
}
})]);
var _9a=function(_1e8){
var _1e9=_1e8._superview;
return {autoresizingMask:_1e8._autoresizingMask,frame:CGRectMakeCopy(_1e8._frame),index:(_1e9?objj_msgSend(_1e9._subviews,"indexOfObjectIdenticalTo:",_1e8):0),superview:_1e9};
};
var _ce=function(_1ea,_1eb){
var _1ec=CGAffineTransformMakeIdentity(),_1ed=YES,_1ee=nil,_1ef=nil;
if(_1ea){
var view=_1ea;
while(view&&view!=_1eb){
var _1f1=view._frame;
_1ec.tx+=(_1f1.origin.x);
_1ec.ty+=(_1f1.origin.y);
if(view._boundsTransform){
var tx=_1ec.tx*view._boundsTransform.a+_1ec.ty*view._boundsTransform.c+view._boundsTransform.tx;
_1ec.ty=_1ec.tx*view._boundsTransform.b+_1ec.ty*view._boundsTransform.d+view._boundsTransform.ty;
_1ec.tx=tx;
var a=_1ec.a*view._boundsTransform.a+_1ec.b*view._boundsTransform.c,b=_1ec.a*view._boundsTransform.b+_1ec.b*view._boundsTransform.d,c=_1ec.c*view._boundsTransform.a+_1ec.d*view._boundsTransform.c;
_1ec.d=_1ec.c*view._boundsTransform.b+_1ec.d*view._boundsTransform.d;
_1ec.a=a;
_1ec.b=b;
_1ec.c=c;
}
view=view._superview;
}
if(view===_1eb){
return _1ec;
}else{
if(_1ea&&_1eb){
_1ee=objj_msgSend(_1ea,"window");
_1ef=objj_msgSend(_1eb,"window");
if(_1ee&&_1ef&&_1ee!==_1ef){
_1ed=NO;
var _1f1=objj_msgSend(_1ee,"frame");
_1ec.tx+=(_1f1.origin.x);
_1ec.ty+=(_1f1.origin.y);
}
}
}
}
var view=_1eb;
while(view){
var _1f1=view._frame;
_1ec.tx-=(_1f1.origin.x);
_1ec.ty-=(_1f1.origin.y);
if(view._boundsTransform){
var tx=_1ec.tx*view._inverseBoundsTransform.a+_1ec.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_1ec.ty=_1ec.tx*view._inverseBoundsTransform.b+_1ec.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_1ec.tx=tx;
var a=_1ec.a*view._inverseBoundsTransform.a+_1ec.b*view._inverseBoundsTransform.c,b=_1ec.a*view._inverseBoundsTransform.b+_1ec.b*view._inverseBoundsTransform.d,c=_1ec.c*view._inverseBoundsTransform.a+_1ec.d*view._inverseBoundsTransform.c;
_1ec.d=_1ec.c*view._inverseBoundsTransform.b+_1ec.d*view._inverseBoundsTransform.d;
_1ec.a=a;
_1ec.b=b;
_1ec.c=c;
}
view=view._superview;
}
if(!_1ed){
var _1f1=objj_msgSend(_1ef,"frame");
_1ec.tx-=(_1f1.origin.x);
_1ec.ty-=(_1f1.origin.y);
}
return _1ec;
};
