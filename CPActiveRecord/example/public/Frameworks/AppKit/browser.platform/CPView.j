I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.ji;18;_CPDisplayServer.jc;55520;
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
var _3=nil,_4=0,_5=1,_6=2,_7=3;
var _8={},_9=1<<0,_a=1<<1;
var _b=objj_allocateClassPair(CPResponder,"CPView"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_DOMImageParts"),new objj_ivar("_DOMImageSizes"),new objj_ivar("_backgroundType"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView"),new objj_ivar("_viewClassFlags")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("setupViewFlags"),function(_d,_e){
with(_d){
var _f=objj_msgSend(_d,"class"),_10=objj_msgSend(_f,"UID");
if(_8[_10]===undefined){
var _11=0;
if(objj_msgSend(_f,"instanceMethodForSelector:",sel_getUid("drawRect:"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"))){
_11|=_9;
}
if(objj_msgSend(_f,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))){
_11|=_a;
}
_8[_10]=_11;
}
_viewClassFlags=_8[_10];
}
}),new objj_method(sel_getUid("init"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_14,_15,_16){
with(_14){
_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPResponder")},"init");
if(_14){
var _17=(_16.size.width),_18=(_16.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_16.origin.x,y:_16.origin.y},size:{width:_16.size.width,height:_16.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_17,height:_18}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_DOMElement=_3.cloneNode(false);
if(NULL){
var _19={x:CGPointMake((_16.origin.x),(_16.origin.y)).x*NULL.a+CGPointMake((_16.origin.x),(_16.origin.y)).y*NULL.c+NULL.tx,y:CGPointMake((_16.origin.x),(_16.origin.y)).x*NULL.b+CGPointMake((_16.origin.x),(_16.origin.y)).y*NULL.d+NULL.ty};
}else{
var _19={x:(_16.origin.x),y:(_16.origin.y)};
}
_DOMElement.style.left=ROUND(_19.x)+"px";
_DOMElement.style.top=ROUND(_19.y)+"px";
_DOMElement.style.width=MAX(0,ROUND(_17))+"px";
_DOMElement.style.height=MAX(0,ROUND(_18))+"px";
_DOMImageParts=[];
_DOMImageSizes=[];
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_14,"setupViewFlags");
objj_msgSend(_14,"_loadThemeAttributes");
}
return _14;
}
}),new objj_method(sel_getUid("superview"),function(_1a,_1b){
with(_1a){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_1c,_1d){
with(_1c){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_1e,_1f){
with(_1e){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_20,"_insertSubview:atIndex:",_22,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_23,_24,_25,_26,_27){
with(_23){
var _28=_27?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_27):CPNotFound;
if(_28===CPNotFound){
_28=(_26===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_26===CPWindowAbove){
++_28;
}
}
objj_msgSend(_23,"_insertSubview:atIndex:",_25,_28);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_29,_2a,_2b,_2c){
with(_29){
var _2d=_subviews.length;
objj_msgSend(objj_msgSend(_29,"window"),"_dirtyKeyViewLoop");
if(_2b._superview==_29){
var _2e=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_2b);
if(_2e===_2c||_2e===_2d-1&&_2c===_2d){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_2e);
_DOMElement.removeChild(_2b._DOMElement);
if(_2c>_2e){
--_2c;
}
--_2d;
}else{
objj_msgSend(_2b,"removeFromSuperview");
objj_msgSend(_2b,"_setWindow:",_window);
objj_msgSend(_2b,"viewWillMoveToSuperview:",_29);
_2b._superview=_29;
}
if(_2c===CPNotFound||_2c>=_2d){
_subviews.push(_2b);
_DOMElement.appendChild(_2b._DOMElement);
}else{
_subviews.splice(_2c,0,_2b);
_DOMElement.insertBefore(_2b._DOMElement,_subviews[_2c+1]._DOMElement);
}
objj_msgSend(_2b,"setNextResponder:",_29);
objj_msgSend(_2b,"viewDidMoveToSuperview");
objj_msgSend(_29,"didAddSubview:",_2b);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_2f,_30,_31){
with(_2f){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_32,_33){
with(_32){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_32,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_32);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_32);
_superview._DOMElement.removeChild(_DOMElement);
_superview=nil;
objj_msgSend(_32,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_34,_35,_36,_37){
with(_34){
if(_36._superview!=_34){
return;
}
var _38=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_36);
objj_msgSend(_36,"removeFromSuperview");
objj_msgSend(_34,"_insertSubview:atIndex:",_37,_38);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_39,_3a,_3b){
with(_39){
if(_window===_3b){
return;
}
objj_msgSend(objj_msgSend(_39,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_39){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_39,"viewWillMoveToWindow:",_3b);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_3b,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_3b;
var _3c=objj_msgSend(_subviews,"count");
while(_3c--){
objj_msgSend(_subviews[_3c],"_setWindow:",_3b);
}
objj_msgSend(_39,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_39,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_3d,_3e,_3f){
with(_3d){
var _40=_3d;
do{
if(_40==_3f){
return YES;
}
}while(_40=objj_msgSend(_40,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_41,_42){
with(_41){
objj_msgSend(_41,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_43,_44){
with(_43){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_45,_46,_47){
with(_45){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_48,_49,_4a){
with(_48){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_4b,_4c,_4d){
with(_4b){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_4e,_4f){
with(_4e){
var _50=_4e;
while(_50&&!objj_msgSend(_50,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_50=objj_msgSend(_50,"superview");
}
if(_50){
return _50._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_51,_52,_53){
with(_51){
_tag=_53;
}
}),new objj_method(sel_getUid("tag"),function(_54,_55){
with(_54){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_56,_57,_58){
with(_56){
if(objj_msgSend(_56,"tag")===_58){
return _56;
}
var _59=0,_5a=_subviews.length;
for(;_59<_5a;++_59){
var _5b=objj_msgSend(_subviews[_59],"viewWithTag:",_58);
if(_5b){
return _5b;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_5c,_5d){
with(_5c){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_5e,_5f,_60){
with(_5e){
if(((_frame.origin.x==_60.origin.x&&_frame.origin.y==_60.origin.y)&&(_frame.size.width==_60.size.width&&_frame.size.height==_60.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_5e,"setFrameOrigin:",_60.origin);
objj_msgSend(_5e,"setFrameSize:",_60.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_5e);
}
}
}),new objj_method(sel_getUid("frame"),function(_61,_62){
with(_61){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("frameOrigin"),function(_63,_64){
with(_63){
return {x:_frame.origin.x,y:_frame.origin.y};
}
}),new objj_method(sel_getUid("frameSize"),function(_65,_66){
with(_65){
return {width:_frame.size.width,height:_frame.size.height};
}
}),new objj_method(sel_getUid("setCenter:"),function(_67,_68,_69){
with(_67){
objj_msgSend(_67,"setFrameOrigin:",CGPointMake(_69.x-_frame.size.width/2,_69.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_6a,_6b){
with(_6a){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_6c,_6d,_6e){
with(_6c){
var _6f=_frame.origin;
if(!_6e||(_6f.x==_6e.x&&_6f.y==_6e.y)){
return;
}
_6f.x=_6e.x;
_6f.y=_6e.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_6c);
}
var _70=_superview?_superview._boundsTransform:NULL;
if(_70){
var _71={x:CGPointMake(_6f.x,_6f.y).x*_70.a+CGPointMake(_6f.x,_6f.y).y*_70.c+_70.tx,y:CGPointMake(_6f.x,_6f.y).x*_70.b+CGPointMake(_6f.x,_6f.y).y*_70.d+_70.ty};
}else{
var _71={x:_6f.x,y:_6f.y};
}
_DOMElement.style.left=ROUND(_71.x)+"px";
_DOMElement.style.top=ROUND(_71.y)+"px";
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_72,_73,_74){
with(_72){
var _75=_frame.size;
if(!_74||(_75.width==_74.width&&_75.height==_74.height)){
return;
}
var _76={width:_75.width,height:_75.height};
_75.width=_74.width;
_75.height=_74.height;
if(YES){
_bounds.size.width=_74.width;
_bounds.size.height=_74.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_72,"resizeSubviewsWithOldSize:",_76);
}
objj_msgSend(_72,"setNeedsLayout");
objj_msgSend(_72,"setNeedsDisplay:",YES);
_DOMElement.style.width=MAX(0,ROUND(_75.width))+"px";
_DOMElement.style.height=MAX(0,ROUND(_75.height))+"px";
if(_DOMContentsElement){
_DOMContentsElement.width=MAX(0,ROUND(_75.width));
_DOMContentsElement.height=MAX(0,ROUND(_75.height));
_DOMContentsElement.style.width=MAX(0,ROUND(_75.width))+"px";
_DOMContentsElement.style.height=MAX(0,ROUND(_75.height))+"px";
}
if(_backgroundType!==_4){
var _77=objj_msgSend(objj_msgSend(_backgroundColor,"patternImage"),"imageSlices");
if(_backgroundType===_5){
_DOMImageParts[1].style.width=MAX(0,ROUND(_75.width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_75.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height))+"px";
}else{
if(_backgroundType===_6){
_DOMImageParts[1].style.width=MAX(0,ROUND(_75.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_75.height))+"px";
}else{
if(_backgroundType===_7){
var _78=_75.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_79=_75.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
_DOMImageParts[1].style.width=MAX(0,ROUND(_78))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_DOMImageSizes[0].height))+"px";
_DOMImageParts[3].style.width=MAX(0,ROUND(_DOMImageSizes[3].width))+"px";
_DOMImageParts[3].style.height=MAX(0,ROUND(_79))+"px";
_DOMImageParts[4].style.width=MAX(0,ROUND(_78))+"px";
_DOMImageParts[4].style.height=MAX(0,ROUND(_79))+"px";
_DOMImageParts[5].style.width=MAX(0,ROUND(_DOMImageSizes[5].width))+"px";
_DOMImageParts[5].style.height=MAX(0,ROUND(_79))+"px";
_DOMImageParts[7].style.width=MAX(0,ROUND(_78))+"px";
_DOMImageParts[7].style.height=MAX(0,ROUND(_DOMImageSizes[7].height))+"px";
}
}
}
}
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_72);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_7a,_7b,_7c){
with(_7a){
if(((_bounds.origin.x==_7c.origin.x&&_bounds.origin.y==_7c.origin.y)&&(_bounds.size.width==_7c.size.width&&_bounds.size.height==_7c.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_7a,"setBoundsOrigin:",_7c.origin);
objj_msgSend(_7a,"setBoundsSize:",_7c.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_7a);
}
}
}),new objj_method(sel_getUid("bounds"),function(_7d,_7e){
with(_7d){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_7f,_80,_81){
with(_7f){
var _82=_bounds.origin;
if((_82.x==_81.x&&_82.y==_81.y)){
return;
}
_82.x=_81.x;
_82.y=_81.y;
if(_82.x!=0||_82.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_82.x,ty:-_82.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
var _83=_subviews.length;
while(_83--){
var _84=_subviews[_83],_82=_84._frame.origin;
if(_boundsTransform){
var _85={x:CGPointMake(_82.x,_82.y).x*_boundsTransform.a+CGPointMake(_82.x,_82.y).y*_boundsTransform.c+_boundsTransform.tx,y:CGPointMake(_82.x,_82.y).x*_boundsTransform.b+CGPointMake(_82.x,_82.y).y*_boundsTransform.d+_boundsTransform.ty};
}else{
var _85={x:_82.x,y:_82.y};
}
_84._DOMElement.style.left=ROUND(_85.x)+"px";
_84._DOMElement.style.top=ROUND(_85.y)+"px";
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_7f);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_86,_87,_88){
with(_86){
var _89=_bounds.size;
if((_89.width==_88.width&&_89.height==_88.height)){
return;
}
var _8a=_frame.size;
if(!(_89.width==_8a.width&&_89.height==_8a.height)){
var _8b=_bounds.origin;
_8b.x/=_89.width/_8a.width;
_8b.y/=_89.height/_8a.height;
}
_89.width=_88.width;
_89.height=_88.height;
if(!(_89.width==_8a.width&&_89.height==_8a.height)){
var _8b=_bounds.origin;
_8b.x*=_89.width/_8a.width;
_8b.y*=_89.height/_8a.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_86);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=objj_msgSend(_8c,"autoresizingMask");
if(_8f==CPViewNotSizable){
return;
}
var _90=_superview._frame,_91={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_90.size.width)-_8e.width)/(((_8f&CPViewMinXMargin)?1:0)+(_8f&CPViewWidthSizable?1:0)+(_8f&CPViewMaxXMargin?1:0)),dY=((_90.size.height)-_8e.height)/((_8f&CPViewMinYMargin?1:0)+(_8f&CPViewHeightSizable?1:0)+(_8f&CPViewMaxYMargin?1:0));
if(_8f&CPViewMinXMargin){
_91.origin.x+=dX;
}
if(_8f&CPViewWidthSizable){
_91.size.width+=dX;
}
if(_8f&CPViewMinYMargin){
_91.origin.y+=dY;
}
if(_8f&CPViewHeightSizable){
_91.size.height+=dY;
}
objj_msgSend(_8c,"setFrame:",_91);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_94,_95,_96){
with(_94){
var _97=_subviews.length;
while(_97--){
objj_msgSend(_subviews[_97],"resizeWithOldSuperviewSize:",_96);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_98,_99,_9a){
with(_98){
_autoresizesSubviews=!!_9a;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_9b,_9c){
with(_9b){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_9d,_9e,_9f){
with(_9d){
_autoresizingMask=_9f;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_a0,_a1){
with(_a0){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_a2,_a3){
with(_a2){
return objj_msgSend(_a2,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_a4,_a5,_a6,_a7){
with(_a4){
_fullScreenModeState=_a8(_a4);
var _a9=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_a9,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_a9,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _aa=objj_msgSend(_a9,"contentView");
objj_msgSend(_aa,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_aa,"addSubview:",_a4);
objj_msgSend(_a4,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_a4,"setFrame:",CGRectMakeCopy(objj_msgSend(_aa,"bounds")));
objj_msgSend(_a9,"makeKeyAndOrderFront:",_a4);
objj_msgSend(_a9,"makeFirstResponder:",_a4);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_ab,_ac){
with(_ab){
objj_msgSend(_ab,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_ad,_ae,_af){
with(_ad){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_ad,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_ad,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_ad,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_ad,"window"),"orderOut:",_ad);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_b0,_b1){
with(_b0){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_b2,_b3,_b4){
with(_b2){
_b4=!!_b4;
if(_isHidden===_b4){
return;
}
_isHidden=_b4;
_DOMElement.style.display=_isHidden?"none":"block";
if(_b4){
var _b5=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_b5,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_b2==_b5){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_b2,"nextValidKeyView"));
break;
}
}while(_b5=objj_msgSend(_b5,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_b6,_b7){
with(_b6){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_b8,_b9,_ba){
with(_b8){
if(_opacity==_ba){
return;
}
_opacity=_ba;
if(CPFeatureIsCompatible(CPOpacityRequiresFilterFeature)){
if(_ba==1){
try{
_DOMElement.style.removeAttribute("filter");
}
catch(anException){
}
}else{
_DOMElement.style.filter="alpha(opacity="+_ba*100+")";
}
}else{
_DOMElement.style.opacity=_ba;
}
}
}),new objj_method(sel_getUid("alphaValue"),function(_bb,_bc){
with(_bb){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_bd,_be){
with(_bd){
var _bf=_bd;
while(_bf&&!objj_msgSend(_bf,"isHidden")){
_bf=objj_msgSend(_bf,"superview");
}
return _bf!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_c0,_c1,_c2){
with(_c0){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_c3,_c4){
with(_c3){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_c5,_c6,_c7){
with(_c5){
_hitTests=!!_c7;
}
}),new objj_method(sel_getUid("hitTest:"),function(_c8,_c9,_ca){
with(_c8){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_ca)){
return nil;
}
var _cb=nil,i=_subviews.length,_cd={x:_ca.x-(_frame.origin.x),y:_ca.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_cd={x:_cd.x*_inverseBoundsTransform.a+_cd.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_cd.x*_inverseBoundsTransform.b+_cd.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_cb=objj_msgSend(_subviews[i],"hitTest:",_cd)){
return _cb;
}
}
return _c8;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_ce,_cf){
with(_ce){
return !objj_msgSend(_ce,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_d0,_d1,_d2){
with(_d0){
if(objj_msgSend(_d0,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_d0,super_class:objj_getClass("CPResponder")},"mouseDown:",_d2);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_d3,_d4,_d5){
with(_d3){
if(_backgroundColor==_d5){
return;
}
_backgroundColor=_d5;
var _d6=objj_msgSend(_backgroundColor,"patternImage"),_d7=0;
if(objj_msgSend(_d6,"isThreePartImage")){
_backgroundType=objj_msgSend(_d6,"isVertical")?_5:_6;
_d7=3-_DOMImageParts.length;
}else{
if(objj_msgSend(_d6,"isNinePartImage")){
_backgroundType=_7;
_d7=9-_DOMImageParts.length;
}else{
_backgroundType=_4;
_d7=0-_DOMImageParts.length;
}
}
if(_d7>0){
while(_d7--){
var _d8=_3.cloneNode(false);
_d8.style.zIndex=-1000;
_DOMImageParts.push(_d8);
_DOMElement.appendChild(_d8);
}
}else{
_d7=-_d7;
while(_d7--){
_DOMElement.removeChild(_DOMImageParts.pop());
}
}
if(_backgroundType==_4){
_DOMElement.style.background=_backgroundColor?objj_msgSend(_backgroundColor,"cssString"):"";
}else{
var _d9=objj_msgSend(_d6,"imageSlices"),_da=MIN(_DOMImageParts.length,_d9.length),_db=_frame.size;
while(_da--){
var _dc=_d9[_da],_dd=_DOMImageSizes[_da]=_dc?objj_msgSend(_dc,"size"):{width:0,height:0};
_DOMImageParts[_da].style.width=MAX(0,ROUND(_dd.width))+"px";
_DOMImageParts[_da].style.height=MAX(0,ROUND(_dd.height))+"px";
_DOMImageParts[_da].style.background=_dc?"url(\""+objj_msgSend(_dc,"filename")+"\")":"";
}
if(_backgroundType==_7){
var _de=_db.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_df=_db.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
_DOMImageParts[1].style.width=MAX(0,ROUND(_de))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_DOMImageSizes[0].height))+"px";
_DOMImageParts[3].style.width=MAX(0,ROUND(_DOMImageSizes[3].width))+"px";
_DOMImageParts[3].style.height=MAX(0,ROUND(_df))+"px";
_DOMImageParts[4].style.width=MAX(0,ROUND(_de))+"px";
_DOMImageParts[4].style.height=MAX(0,ROUND(_df))+"px";
_DOMImageParts[5].style.width=MAX(0,ROUND(_DOMImageSizes[5].width))+"px";
_DOMImageParts[5].style.height=MAX(0,ROUND(_df))+"px";
_DOMImageParts[7].style.width=MAX(0,ROUND(_de))+"px";
_DOMImageParts[7].style.height=MAX(0,ROUND(_DOMImageSizes[7].height))+"px";
if(NULL){
var _e0={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _e0={x:0,y:0};
}
_DOMImageParts[0].style.left=ROUND(_e0.x)+"px";
_DOMImageParts[0].style.top=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.a+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.b+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.d+NULL.ty};
}else{
var _e0={x:_DOMImageSizes[0].width,y:0};
}
_DOMImageParts[1].style.left=ROUND(_e0.x)+"px";
_DOMImageParts[1].style.top=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _e0={x:0,y:0};
}
_DOMImageParts[2].style.right=ROUND(_e0.x)+"px";
_DOMImageParts[2].style.top=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.a+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.c+NULL.tx,y:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.b+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.d+NULL.ty};
}else{
var _e0={x:0,y:_DOMImageSizes[1].height};
}
_DOMImageParts[3].style.left=ROUND(_e0.x)+"px";
_DOMImageParts[3].style.top=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).x*NULL.a+CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).x*NULL.b+CGPointMake(_DOMImageSizes[0].width,_DOMImageSizes[0].height).y*NULL.d+NULL.ty};
}else{
var _e0={x:_DOMImageSizes[0].width,y:_DOMImageSizes[0].height};
}
_DOMImageParts[4].style.left=ROUND(_e0.x)+"px";
_DOMImageParts[4].style.top=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.a+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.c+NULL.tx,y:CGPointMake(0,_DOMImageSizes[1].height).x*NULL.b+CGPointMake(0,_DOMImageSizes[1].height).y*NULL.d+NULL.ty};
}else{
var _e0={x:0,y:_DOMImageSizes[1].height};
}
_DOMImageParts[5].style.right=ROUND(_e0.x)+"px";
_DOMImageParts[5].style.top=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _e0={x:0,y:0};
}
_DOMImageParts[6].style.left=ROUND(_e0.x)+"px";
_DOMImageParts[6].style.bottom=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(_DOMImageSizes[6].width,0).x*NULL.a+CGPointMake(_DOMImageSizes[6].width,0).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[6].width,0).x*NULL.b+CGPointMake(_DOMImageSizes[6].width,0).y*NULL.d+NULL.ty};
}else{
var _e0={x:_DOMImageSizes[6].width,y:0};
}
_DOMImageParts[7].style.left=ROUND(_e0.x)+"px";
_DOMImageParts[7].style.bottom=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _e0={x:0,y:0};
}
_DOMImageParts[8].style.right=ROUND(_e0.x)+"px";
_DOMImageParts[8].style.bottom=ROUND(_e0.y)+"px";
}else{
if(_backgroundType==_5){
_DOMImageParts[1].style.width=MAX(0,ROUND(_db.width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_db.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height))+"px";
if(NULL){
var _e0={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _e0={x:0,y:0};
}
_DOMImageParts[0].style.left=ROUND(_e0.x)+"px";
_DOMImageParts[0].style.top=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(0,_DOMImageSizes[0].height).x*NULL.a+CGPointMake(0,_DOMImageSizes[0].height).y*NULL.c+NULL.tx,y:CGPointMake(0,_DOMImageSizes[0].height).x*NULL.b+CGPointMake(0,_DOMImageSizes[0].height).y*NULL.d+NULL.ty};
}else{
var _e0={x:0,y:_DOMImageSizes[0].height};
}
_DOMImageParts[1].style.left=ROUND(_e0.x)+"px";
_DOMImageParts[1].style.top=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _e0={x:0,y:0};
}
_DOMImageParts[2].style.left=ROUND(_e0.x)+"px";
_DOMImageParts[2].style.bottom=ROUND(_e0.y)+"px";
}else{
if(_backgroundType==_6){
_DOMImageParts[1].style.width=MAX(0,ROUND(_db.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width))+"px";
_DOMImageParts[1].style.height=MAX(0,ROUND(_db.height))+"px";
if(NULL){
var _e0={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _e0={x:0,y:0};
}
_DOMImageParts[0].style.left=ROUND(_e0.x)+"px";
_DOMImageParts[0].style.top=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.a+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.c+NULL.tx,y:CGPointMake(_DOMImageSizes[0].width,0).x*NULL.b+CGPointMake(_DOMImageSizes[0].width,0).y*NULL.d+NULL.ty};
}else{
var _e0={x:_DOMImageSizes[0].width,y:0};
}
_DOMImageParts[1].style.left=ROUND(_e0.x)+"px";
_DOMImageParts[1].style.top=ROUND(_e0.y)+"px";
if(NULL){
var _e0={x:CGPointMake(0,0).x*NULL.a+CGPointMake(0,0).y*NULL.c+NULL.tx,y:CGPointMake(0,0).x*NULL.b+CGPointMake(0,0).y*NULL.d+NULL.ty};
}else{
var _e0={x:0,y:0};
}
_DOMImageParts[2].style.right=ROUND(_e0.x)+"px";
_DOMImageParts[2].style.top=ROUND(_e0.y)+"px";
}
}
}
}
}
}),new objj_method(sel_getUid("backgroundColor"),function(_e1,_e2){
with(_e1){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_e3,_e4,_e5,_e6){
with(_e3){
return CGPointApplyAffineTransform(_e5,_e7(_e6,_e3));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_e8,_e9,_ea,_eb){
with(_e8){
return CGPointApplyAffineTransform(_ea,_e7(_e8,_eb));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_ec,_ed,_ee,_ef){
with(_ec){
return CGSizeApplyAffineTransform(_ee,_e7(_ef,_ec));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_f0,_f1,_f2,_f3){
with(_f0){
return CGSizeApplyAffineTransform(_f2,_e7(_f0,_f3));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_f4,_f5,_f6,_f7){
with(_f4){
return CGRectApplyAffineTransform(_f6,_e7(_f7,_f4));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_f8,_f9,_fa,_fb){
with(_f8){
return CGRectApplyAffineTransform(_fa,_e7(_f8,_fb));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_fc,_fd,_fe){
with(_fc){
_fe=!!_fe;
if(_postsFrameChangedNotifications===_fe){
return;
}
_postsFrameChangedNotifications=_fe;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_fc);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_ff,_cmd){
with(_ff){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(self,_cmd,_103){
with(self){
_103=!!_103;
if(_postsBoundsChangedNotifications===_103){
return;
}
_postsBoundsChangedNotifications=_103;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,self);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(self,_cmd){
with(self){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(self,_cmd,_108,_109,_10a,_10b,_10c,_10d,_10e){
with(self){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_108,objj_msgSend(self,"convertPoint:toView:",_109,nil),_10a,_10b,_10c,_10d,_10e);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(self,_cmd,_111,_112,_113,_114,_115,_116,_117){
with(self){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_111,objj_msgSend(self,"convertPoint:toView:",_112,nil),_113,_114,_115,_116,_117);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(self,_cmd,_11a){
with(self){
if(!_11a||!objj_msgSend(_11a,"count")){
return;
}
var _11b=objj_msgSend(self,"window");
objj_msgSend(_11b,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_11a);
objj_msgSend(_11b,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
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
}),new objj_method(sel_getUid("drawRect:"),function(self,_cmd,_122){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_125){
with(self){
if(_125){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_128){
with(self){
if(!(_viewClassFlags&_9)){
return;
}
if((_128.size.width<=0||_128.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_128,_dirtyRect);
}else{
_dirtyRect={origin:{x:_128.origin.x,y:_128.origin.y},size:{width:_128.size.width,height:_128.size.height}};
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
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_131){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_131);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_134){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_134,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_137,_138){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_137);
objj_msgSend(self,"drawRect:",_137);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _13d=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_13d.DOMElement;
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
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_13d,YES);
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
if(!(_viewClassFlags&_a)){
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
var _14c=_superview,_14d=objj_msgSend(CPClipView,"class");
while(_14c&&!objj_msgSend(_14c,"isKindOfClass:",_14d)){
_14c=_14c._superview;
}
return _14c;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_150){
with(self){
var _151=objj_msgSend(self,"_enclosingClipView");
if(!_151){
return;
}
objj_msgSend(_151,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_150,_151));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_154){
with(self){
var _155=objj_msgSend(self,"visibleRect");
_154=CGRectIntersection(_154,_bounds);
if((_154.size.width<=0||_154.size.height<=0)||CGRectContainsRect(_155,_154)){
return NO;
}
var _156=objj_msgSend(self,"_enclosingClipView");
if(!_156){
return NO;
}
var _157={x:_155.origin.x,y:_155.origin.y};
if((_154.origin.x)<=(_155.origin.x)){
_157.x=(_154.origin.x);
}else{
if((_154.origin.x+_154.size.width)>(_155.origin.x+_155.size.width)){
_157.x+=(_154.origin.x+_154.size.width)-(_155.origin.x+_155.size.width);
}
}
if((_154.origin.y)<=(_155.origin.y)){
_157.y=CGRectGetMinY(_154);
}else{
if((_154.origin.y+_154.size.height)>(_155.origin.y+_155.size.height)){
_157.y+=(_154.origin.y+_154.size.height)-(_155.origin.y+_155.size.height);
}
}
objj_msgSend(_156,"scrollToPoint:",CGPointMake(_157.x,_157.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_15a){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_15a);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_15d){
with(self){
return _15d;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_160,_161){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _164=_superview,_165=objj_msgSend(CPScrollView,"class");
while(_164&&!objj_msgSend(_164,"isKindOfClass:",_165)){
_164=_164._superview;
}
return _164;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_168,_169){
with(self){
objj_msgSend(_168,"scrollToPoint:",_169);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_16c){
with(self){
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_3=document.createElement("div");
var _16f=_3.style;
_16f.overflow="hidden";
_16f.position="absolute";
_16f.visibility="visible";
_16f.zIndex=0;
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingFrame"),function(self,_cmd){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","frameOrigin","frameSize");
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _178=objj_msgSend(self,"nextKeyView");
while(_178&&!objj_msgSend(_178,"canBecomeKeyView")){
_178=objj_msgSend(_178,"nextKeyView");
}
return _178;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _17d=objj_msgSend(self,"previousKeyView");
while(_17d&&!objj_msgSend(_17d,"canBecomeKeyView")){
_17d=objj_msgSend(_17d,"previousKeyView");
}
return _17d;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_180){
with(self){
_previousKeyView=_180;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_186){
with(self){
if(_layer==_186){
return;
}
if(_layer){
_layer._owningView=nil;
_DOMElement.removeChild(_layer._DOMElement);
}
_layer=_186;
if(_layer){
var _187=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
_layer._DOMElement.style.zIndex=100;
_DOMElement.appendChild(_layer._DOMElement);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_18c){
with(self){
_wantsLayer=!!_18c;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("themeState"),function(self,_cmd){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_cmd,_193){
with(self){
return !!(_themeState&((typeof _193==="string")?CPThemeState(_193):_193));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_cmd,_196){
with(self){
var _197=(typeof _196==="string")?CPThemeState(_196):_196;
if(_themeState&_197){
return NO;
}
_themeState|=_197;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_cmd,_19a){
with(self){
var _19b=((typeof _19a==="string")?CPThemeState(_19a):_19a);
if(!(_themeState&_19b)){
return NO;
}
_themeState&=~_19b;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_cmd){
with(self){
var _19e=objj_msgSend(self,"class"),_19f=objj_msgSend(_19e,"_themeAttributes"),_1a0=_19f.length;
if(!_1a0){
return;
}
var _1a1=objj_msgSend(self,"theme"),_1a2=objj_msgSend(_19e,"themeClass");
_themeAttributes={};
while(_1a0--){
var _1a3=_19f[_1a0--],_1a4=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_1a3,_19f[_1a0]);
objj_msgSend(_1a4,"setParentAttribute:",objj_msgSend(_1a1,"_attributeWithName:forClass:",_1a3,_1a2));
_themeAttributes[_1a3]=_1a4;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_1a7){
with(self){
if(_theme===_1a7){
return;
}
_theme=_1a7;
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
var _1ac=objj_msgSend(self,"theme"),_1ad=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _1ae in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1ae)){
objj_msgSend(_themeAttributes[_1ae],"setParentAttribute:",objj_msgSend(_1ac,"_attributeWithName:forClass:",_1ae,_1ad));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_cmd){
with(self){
var _1b1=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _1b2=objj_msgSend(self,"theme");
for(var _1b3 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1b3)){
objj_msgSend(_1b1,"setObject:forKey:",_themeAttributes[_1b3],_1b3);
}
}
}
return _1b1;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_cmd,_1b6,_1b7,_1b8){
with(self){
if(!_themeAttributes||!_themeAttributes[_1b7]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1b7+"'");
}
var _1b9=objj_msgSend(self,"currentValueForThemeAttribute:",_1b7);
objj_msgSend(_themeAttributes[_1b7],"setValue:forState:",_1b6,_1b8);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1b7)===_1b9){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_cmd,_1bc,_1bd){
with(self){
if(!_themeAttributes||!_themeAttributes[_1bd]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1bd+"'");
}
var _1be=objj_msgSend(self,"currentValueForThemeAttribute:",_1bd);
objj_msgSend(_themeAttributes[_1bd],"setValue:",_1bc);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1bd)===_1be){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_cmd,_1c1,_1c2){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c1]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c1+"'");
}
return objj_msgSend(_themeAttributes[_1c1],"valueForState:",_1c2);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_cmd,_1c5){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c5]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c5+"'");
}
return objj_msgSend(_themeAttributes[_1c5],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_cmd,_1c8){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c8]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c8+"'");
}
return objj_msgSend(_themeAttributes[_1c8],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_cmd,_1cb){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_cmd,_1ce){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_cmd,_1d1,_1d2,_1d3){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _1d4=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_1d1);
if(_1d4&&!(_1d4.size.width<=0||_1d4.size.height<=0)){
if(!_ephemeralSubviewsForNames[_1d1]){
_ephemeralSubviewsForNames[_1d1]=objj_msgSend(self,"createEphemeralSubviewNamed:",_1d1);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_1d1]);
if(_ephemeralSubviewsForNames[_1d1]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_1d1],_1d2,_ephemeralSubviewsForNames[_1d3]);
}
}
if(_ephemeralSubviewsForNames[_1d1]){
objj_msgSend(_ephemeralSubviewsForNames[_1d1],"setFrame:",_1d4);
}
}else{
if(_ephemeralSubviewsForNames[_1d1]){
objj_msgSend(_ephemeralSubviewsForNames[_1d1],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_1d1]);
delete _ephemeralSubviewsForNames[_1d1];
}
}
return _ephemeralSubviewsForNames[_1d1];
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("themeClass"),function(self,_cmd){
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
var _1db=objj_msgSend(self,"class"),_1dc=objj_msgSend(CPView,"class"),_1dd=[];
for(;_1db&&_1db!==_1dc;_1db=objj_msgSend(_1db,"superclass")){
var _1de=_2[class_getName(_1db)];
if(_1de){
_1dd=_1dd.length?_1dd.concat(_1de):_1dd;
_2[objj_msgSend(self,"className")]=_1dd;
break;
}
var _1df=objj_msgSend(_1db,"themeAttributes");
if(!_1df){
continue;
}
var _1e0=objj_msgSend(_1df,"allKeys"),_1e1=_1e0.length;
while(_1e1--){
var _1e2=_1e0[_1e1];
_1dd.push(objj_msgSend(_1df,"objectForKey:",_1e2));
_1dd.push(_1e2);
}
}
return _1dd;
}
})]);
var _1e3="CPViewAutoresizingMask",_1e4="CPViewAutoresizesSubviews",_1e5="CPViewBackgroundColor",_1e6="CPViewBoundsKey",_1e7="CPViewFrameKey",_1e8="CPViewHitTestsKey",_1e9="CPViewIsHiddenKey",_1ea="CPViewOpacityKey",_1eb="CPViewSubviewsKey",_1ec="CPViewSuperviewKey",_1ed="CPViewTagKey",_1ee="CPViewThemeStateKey",_1ef="CPViewWindowKey",_1f0="CPViewNextKeyViewKey",_1f1="CPViewPreviousKeyViewKey";
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1f4){
with(self){
_DOMElement=_3.cloneNode(false);
_frame=objj_msgSend(_1f4,"decodeRectForKey:",_1e7);
_bounds=objj_msgSend(_1f4,"decodeRectForKey:",_1e6);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1f4);
if(self){
_tag=objj_msgSend(_1f4,"containsValueForKey:",_1ed)?objj_msgSend(_1f4,"decodeIntForKey:",_1ed):-1;
_window=objj_msgSend(_1f4,"decodeObjectForKey:",_1ef);
_subviews=objj_msgSend(_1f4,"decodeObjectForKey:",_1eb)||[];
_superview=objj_msgSend(_1f4,"decodeObjectForKey:",_1ec);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_autoresizingMask=objj_msgSend(_1f4,"decodeIntForKey:",_1e3)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_1f4,"containsValueForKey:",_1e4)||objj_msgSend(_1f4,"decodeBoolForKey:",_1e4);
_hitTests=!objj_msgSend(_1f4,"containsValueForKey:",_1e8)||objj_msgSend(_1f4,"decodeObjectForKey:",_1e8);
_DOMImageParts=[];
_DOMImageSizes=[];
if(NULL){
var _1f5={x:CGPointMake((_frame.origin.x),(_frame.origin.y)).x*NULL.a+CGPointMake((_frame.origin.x),(_frame.origin.y)).y*NULL.c+NULL.tx,y:CGPointMake((_frame.origin.x),(_frame.origin.y)).x*NULL.b+CGPointMake((_frame.origin.x),(_frame.origin.y)).y*NULL.d+NULL.ty};
}else{
var _1f5={x:(_frame.origin.x),y:(_frame.origin.y)};
}
_DOMElement.style.left=ROUND(_1f5.x)+"px";
_DOMElement.style.top=ROUND(_1f5.y)+"px";
_DOMElement.style.width=MAX(0,ROUND((_frame.size.width)))+"px";
_DOMElement.style.height=MAX(0,ROUND((_frame.size.height)))+"px";
var _1f6=0,_1f7=_subviews.length;
for(;_1f6<_1f7;++_1f6){
_DOMElement.appendChild(_subviews[_1f6]._DOMElement);
}
if(objj_msgSend(_1f4,"containsValueForKey:",_1e9)){
objj_msgSend(self,"setHidden:",objj_msgSend(_1f4,"decodeBoolForKey:",_1e9));
}else{
_isHidden=NO;
}
if(objj_msgSend(_1f4,"containsValueForKey:",_1ea)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1f4,"decodeIntForKey:",_1ea));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1f4,"decodeObjectForKey:",_1e5));
objj_msgSend(self,"setupViewFlags");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_1f4,"decodeIntForKey:",_1ee));
_themeAttributes={};
var _1f8=objj_msgSend(self,"class"),_1f9=objj_msgSend(_1f8,"themeClass"),_1fa=objj_msgSend(_1f8,"_themeAttributes"),_1f7=_1fa.length;
while(_1f7--){
var _1fb=_1fa[_1f7--];
_themeAttributes[_1fb]=CPThemeAttributeDecode(_1f4,_1fb,_1fa[_1f7],_theme,_1f9);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1fe){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1fe);
if(_tag!==-1){
objj_msgSend(_1fe,"encodeInt:forKey:",_tag,_1ed);
}
objj_msgSend(_1fe,"encodeRect:forKey:",_frame,_1e7);
objj_msgSend(_1fe,"encodeRect:forKey:",_bounds,_1e6);
if(_window!==nil){
objj_msgSend(_1fe,"encodeConditionalObject:forKey:",_window,_1ef);
}
var _1ff=objj_msgSend(_subviews,"count"),_200=_subviews;
if(_1ff>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_200=objj_msgSend(_200,"copy");
while(_1ff--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_200[_1ff])){
_200.splice(_1ff,1);
}
}
}
if(_200.length>0){
objj_msgSend(_1fe,"encodeObject:forKey:",_200,_1eb);
}
if(_superview!==nil){
objj_msgSend(_1fe,"encodeConditionalObject:forKey:",_superview,_1ec);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1fe,"encodeInt:forKey:",_autoresizingMask,_1e3);
}
if(!_autoresizesSubviews){
objj_msgSend(_1fe,"encodeBool:forKey:",_autoresizesSubviews,_1e4);
}
if(_backgroundColor!==nil){
objj_msgSend(_1fe,"encodeObject:forKey:",_backgroundColor,_1e5);
}
if(_hitTests!==YES){
objj_msgSend(_1fe,"encodeBool:forKey:",_hitTests,_1e8);
}
if(_opacity!==1){
objj_msgSend(_1fe,"encodeFloat:forKey:",_opacity,_1ea);
}
if(_isHidden){
objj_msgSend(_1fe,"encodeBool:forKey:",_isHidden,_1e9);
}
var _201=objj_msgSend(self,"nextKeyView");
if(_201!==nil){
objj_msgSend(_1fe,"encodeConditionalObject:forKey:",_201,_1f0);
}
var _202=objj_msgSend(self,"previousKeyView");
if(_202!==nil){
objj_msgSend(_1fe,"encodeConditionalObject:forKey:",_202,_1f1);
}
objj_msgSend(_1fe,"encodeInt:forKey:",CPThemeStateName(_themeState),_1ee);
for(var _203 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_203)){
CPThemeAttributeEncode(_1fe,_themeAttributes[_203]);
}
}
}
})]);
var _a8=function(_204){
var _205=_204._superview;
return {autoresizingMask:_204._autoresizingMask,frame:CGRectMakeCopy(_204._frame),index:(_205?objj_msgSend(_205._subviews,"indexOfObjectIdenticalTo:",_204):0),superview:_205};
};
var _e7=function(_206,_207){
var _208=CGAffineTransformMakeIdentity(),_209=YES,_20a=nil,_20b=nil;
if(_206){
var view=_206;
while(view&&view!=_207){
var _20d=view._frame;
_208.tx+=(_20d.origin.x);
_208.ty+=(_20d.origin.y);
if(view._boundsTransform){
var tx=_208.tx*view._boundsTransform.a+_208.ty*view._boundsTransform.c+view._boundsTransform.tx;
_208.ty=_208.tx*view._boundsTransform.b+_208.ty*view._boundsTransform.d+view._boundsTransform.ty;
_208.tx=tx;
var a=_208.a*view._boundsTransform.a+_208.b*view._boundsTransform.c,b=_208.a*view._boundsTransform.b+_208.b*view._boundsTransform.d,c=_208.c*view._boundsTransform.a+_208.d*view._boundsTransform.c;
_208.d=_208.c*view._boundsTransform.b+_208.d*view._boundsTransform.d;
_208.a=a;
_208.b=b;
_208.c=c;
}
view=view._superview;
}
if(view===_207){
return _208;
}else{
if(_206&&_207){
_20a=objj_msgSend(_206,"window");
_20b=objj_msgSend(_207,"window");
if(_20a&&_20b&&_20a!==_20b){
_209=NO;
var _20d=objj_msgSend(_20a,"frame");
_208.tx+=(_20d.origin.x);
_208.ty+=(_20d.origin.y);
}
}
}
}
var view=_207;
while(view){
var _20d=view._frame;
_208.tx-=(_20d.origin.x);
_208.ty-=(_20d.origin.y);
if(view._boundsTransform){
var tx=_208.tx*view._inverseBoundsTransform.a+_208.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_208.ty=_208.tx*view._inverseBoundsTransform.b+_208.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_208.tx=tx;
var a=_208.a*view._inverseBoundsTransform.a+_208.b*view._inverseBoundsTransform.c,b=_208.a*view._inverseBoundsTransform.b+_208.b*view._inverseBoundsTransform.d,c=_208.c*view._inverseBoundsTransform.a+_208.d*view._inverseBoundsTransform.c;
_208.d=_208.c*view._inverseBoundsTransform.b+_208.d*view._inverseBoundsTransform.d;
_208.a=a;
_208.b=b;
_208.c=c;
}
view=view._superview;
}
if(!_209){
var _20d=objj_msgSend(_20b,"frame");
_208.tx-=(_20d.origin.x);
_208.ty-=(_20d.origin.y);
}
return _208;
};
