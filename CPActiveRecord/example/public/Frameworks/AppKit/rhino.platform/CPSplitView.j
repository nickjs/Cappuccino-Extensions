i;9;CPImage.ji;8;CPView.jc;16313;
CPSplitViewDidResizeSubviewsNotification="CPSplitViewDidResizeSubviewsNotification";
CPSplitViewWillResizeSubviewsNotification="CPSplitViewWillResizeSubviewsNotification";
var _1=nil,_2=nil;
var _3=objj_allocateClassPair(CPView,"CPSplitView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_delegate"),new objj_ivar("_isVertical"),new objj_ivar("_isPaneSplitter"),new objj_ivar("_currentDivider"),new objj_ivar("_initialOffset"),new objj_ivar("_originComponent"),new objj_ivar("_sizeComponent"),new objj_ivar("_DOMDividerElements"),new objj_ivar("_dividerImagePath"),new objj_ivar("_drawingDivider"),new objj_ivar("_needsResizeSubviews")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_5,_6,_7){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPView")},"initWithFrame:",_7)){
_currentDivider=CPNotFound;
_DOMDividerElements=[];
objj_msgSend(_5,"_setVertical:",YES);
}
return _5;
}
}),new objj_method(sel_getUid("dividerThickness"),function(_8,_9){
with(_8){
return _isPaneSplitter?1:10;
}
}),new objj_method(sel_getUid("isVertical"),function(_a,_b){
with(_a){
return _isVertical;
}
}),new objj_method(sel_getUid("setVertical:"),function(_c,_d,_e){
with(_c){
if(!objj_msgSend(_c,"_setVertical:",_e)){
return;
}
var _f=objj_msgSend(_c,"frame"),_10=objj_msgSend(_c,"dividerThickness");
objj_msgSend(_c,"_postNotificationWillResize");
var _11=ROUND((_f.size[_sizeComponent]-_10*(_subviews.length-1))/_subviews.length),_12=0,_13=_subviews.length;
if(objj_msgSend(_c,"isVertical")){
for(;_12<_13;++_12){
objj_msgSend(_subviews[_12],"setFrame:",CGRectMake(ROUND((_11+_10)*_12),0,_11,_f.size.height));
}
}else{
for(;_12<_13;++_12){
objj_msgSend(_subviews[_12],"setFrame:",CGRectMake(0,ROUND((_11+_10)*_12),_f.size.width,_11));
}
}
objj_msgSend(_c,"setNeedsDisplay:",YES);
objj_msgSend(_c,"_postNotificationDidResize");
}
}),new objj_method(sel_getUid("_setVertical:"),function(_14,_15,_16){
with(_14){
var _17=(_isVertical!=_16);
_isVertical=_16;
_originComponent=objj_msgSend(_14,"isVertical")?"x":"y";
_sizeComponent=objj_msgSend(_14,"isVertical")?"width":"height";
_dividerImagePath=objj_msgSend(_14,"isVertical")?objj_msgSend(_2,"filename"):objj_msgSend(_1,"filename");
return _17;
}
}),new objj_method(sel_getUid("isPaneSplitter"),function(_18,_19){
with(_18){
return _isPaneSplitter;
}
}),new objj_method(sel_getUid("setIsPaneSplitter:"),function(_1a,_1b,_1c){
with(_1a){
if(_isPaneSplitter==_1c){
return;
}
_isPaneSplitter=_1c;
objj_msgSend(_1a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_1d,_1e,_1f){
with(_1d){
_needsResizeSubviews=YES;
}
}),new objj_method(sel_getUid("isSubviewCollapsed:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_22,"frame").size[_sizeComponent]<1?YES:NO;
}
}),new objj_method(sel_getUid("rectOfDividerAtIndex:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_subviews[_25],"frame"),_27=CGRectMakeZero();
_27.size=objj_msgSend(_23,"frame").size;
_27.size[_sizeComponent]=objj_msgSend(_23,"dividerThickness");
_27.origin[_originComponent]=_26.origin[_originComponent]+_26.size[_sizeComponent];
return _27;
}
}),new objj_method(sel_getUid("effectiveRectOfDividerAtIndex:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(_28,"rectOfDividerAtIndex:",_2a);
var _2c=2;
_2b.size[_sizeComponent]+=_2c*2;
_2b.origin[_originComponent]-=_2c;
return _2b;
}
}),new objj_method(sel_getUid("drawRect:"),function(_2d,_2e,_2f){
with(_2d){
var _30=objj_msgSend(_subviews,"count")-1;
while((_30--)>0){
_drawingDivider=_30;
objj_msgSend(_2d,"drawDividerInRect:",objj_msgSend(_2d,"rectOfDividerAtIndex:",_30));
}
}
}),new objj_method(sel_getUid("drawDividerInRect:"),function(_31,_32,_33){
with(_31){
}
}),new objj_method(sel_getUid("viewWillDraw"),function(_34,_35){
with(_34){
objj_msgSend(_34,"_adjustSubviewsWithCalculatedSize");
}
}),new objj_method(sel_getUid("_adjustSubviewsWithCalculatedSize"),function(_36,_37){
with(_36){
if(!_needsResizeSubviews){
return;
}
_needsResizeSubviews=NO;
var _38=objj_msgSend(_36,"subviews"),_39=_38.length,_3a=CGSizeMakeZero();
if(objj_msgSend(_36,"isVertical")){
_3a.width+=objj_msgSend(_36,"dividerThickness")*(_39-1);
_3a.height=CGRectGetHeight(objj_msgSend(_36,"frame"));
}else{
_3a.width=CGRectGetWidth(objj_msgSend(_36,"frame"));
_3a.height+=objj_msgSend(_36,"dividerThickness")*(_39-1);
}
while(_39--){
_3a[_sizeComponent]+=objj_msgSend(_38[_39],"frame").size[_sizeComponent];
}
objj_msgSend(_36,"resizeSubviewsWithOldSize:",_3a);
}
}),new objj_method(sel_getUid("cursorAtPoint:hitDividerAtIndex:"),function(_3b,_3c,_3d,_3e){
with(_3b){
var _3f=objj_msgSend(_subviews[_3e],"frame"),_40=_3f.origin[_originComponent]+_3f.size[_sizeComponent],_41=objj_msgSend(_3b,"effectiveRectOfDividerAtIndex:",_3e),_42=null;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:"))){
_41=objj_msgSend(_delegate,"splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:",_3b,_41,_41,_3e);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:additionalEffectiveRectOfDividerAtIndex:"))){
_42=objj_msgSend(_delegate,"splitView:additionalEffectiveRectOfDividerAtIndex:",_3b,_3e);
}
return CGRectContainsPoint(_41,_3d)||(_42&&CGRectContainsPoint(_42,_3d));
}
}),new objj_method(sel_getUid("hitTest:"),function(_43,_44,_45){
with(_43){
if(objj_msgSend(_43,"isHidden")||!objj_msgSend(_43,"hitTests")||!CGRectContainsPoint(objj_msgSend(_43,"frame"),_45)){
return nil;
}
var _46=objj_msgSend(_43,"convertPoint:fromView:",_45,objj_msgSend(_43,"superview"));
var _47=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_47;i++){
if(objj_msgSend(_43,"cursorAtPoint:hitDividerAtIndex:",_46,i)){
return _43;
}
}
return objj_msgSendSuper({receiver:_43,super_class:objj_getClass("CPView")},"hitTest:",_45);
}
}),new objj_method(sel_getUid("trackDivider:"),function(_49,_4a,_4b){
with(_49){
var _4c=objj_msgSend(_4b,"type");
if(_4c==CPLeftMouseUp){
if(_currentDivider!=CPNotFound){
_currentDivider=CPNotFound;
objj_msgSend(_49,"_postNotificationDidResize");
}
return;
}
if(_4c==CPLeftMouseDown){
var _4d=objj_msgSend(_49,"convertPoint:fromView:",objj_msgSend(_4b,"locationInWindow"),nil);
_currentDivider=CPNotFound;
var _4e=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_4e;i++){
var _50=objj_msgSend(_subviews[i],"frame"),_51=_50.origin[_originComponent]+_50.size[_sizeComponent];
if(objj_msgSend(_49,"cursorAtPoint:hitDividerAtIndex:",_4d,i)){
if(objj_msgSend(_4b,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:"))){
var _52=objj_msgSend(_49,"minPossiblePositionOfDividerAtIndex:",i),_53=objj_msgSend(_49,"maxPossiblePositionOfDividerAtIndex:",i);
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_49,_subviews[i])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_49,_subviews[i],i)){
if(objj_msgSend(_49,"isSubviewCollapsed:",_subviews[i])){
objj_msgSend(_49,"setPosition:ofDividerAtIndex:",(_52+(_53-_52)/2),i);
}else{
objj_msgSend(_49,"setPosition:ofDividerAtIndex:",_52,i);
}
}else{
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_49,_subviews[i+1])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_49,_subviews[i+1],i)){
if(objj_msgSend(_49,"isSubviewCollapsed:",_subviews[i+1])){
objj_msgSend(_49,"setPosition:ofDividerAtIndex:",(_52+(_53-_52)/2),i);
}else{
objj_msgSend(_49,"setPosition:ofDividerAtIndex:",_53,i);
}
}
}
}else{
_currentDivider=i;
_initialOffset=_51-_4d[_originComponent];
objj_msgSend(_49,"_postNotificationWillResize");
}
}
}
if(_currentDivider===CPNotFound){
return;
}
}else{
if(_4c==CPLeftMouseDragged&&_currentDivider!=CPNotFound){
var _4d=objj_msgSend(_49,"convertPoint:fromView:",objj_msgSend(_4b,"locationInWindow"),nil);
objj_msgSend(_49,"setPosition:ofDividerAtIndex:",(_4d[_originComponent]+_initialOffset),_currentDivider);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_49,sel_getUid("trackDivider:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_54,_55,_56){
with(_54){
objj_msgSend(_54,"trackDivider:",_56);
}
}),new objj_method(sel_getUid("maxPossiblePositionOfDividerAtIndex:"),function(_57,_58,_59){
with(_57){
var _5a=objj_msgSend(_subviews[_59+1],"frame");
if(_59+1<objj_msgSend(_subviews,"count")-1){
return _5a.origin[_originComponent]+_5a.size[_sizeComponent]-objj_msgSend(_57,"dividerThickness");
}else{
return objj_msgSend(_57,"frame").size[_sizeComponent]-objj_msgSend(_57,"dividerThickness");
}
}
}),new objj_method(sel_getUid("minPossiblePositionOfDividerAtIndex:"),function(_5b,_5c,_5d){
with(_5b){
if(_5d>0){
var _5e=objj_msgSend(_subviews[_5d-1],"frame");
return _5e.origin[_originComponent]+_5e.size[_sizeComponent]+objj_msgSend(_5b,"dividerThickness");
}else{
return 0;
}
}
}),new objj_method(sel_getUid("setPosition:ofDividerAtIndex:"),function(_5f,_60,_61,_62){
with(_5f){
objj_msgSend(_5f,"_adjustSubviewsWithCalculatedSize");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:"))){
_61=objj_msgSend(_delegate,"splitView:constrainSplitPosition:ofSubviewAt:",_5f,_61,_62);
}
var _63=objj_msgSend(_5f,"maxPossiblePositionOfDividerAtIndex:",_62),_64=objj_msgSend(_5f,"minPossiblePositionOfDividerAtIndex:",_62),_65=_63,_66=_64;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"))){
_66=objj_msgSend(_delegate,"splitView:constrainMinCoordinate:ofSubviewAt:",_5f,_64,_62);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"))){
_65=objj_msgSend(_delegate,"splitView:constrainMaxCoordinate:ofSubviewAt:",_5f,_63,_62);
}
var _67=objj_msgSend(_5f,"frame"),_68=_subviews[_62],_69=objj_msgSend(_68,"frame"),_6a=_subviews[_62+1],_6b=objj_msgSend(_6a,"frame");
var _6c=MAX(MIN(_61,_65),_66);
if(_61<_64+(_66-_64)/2){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))){
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_5f,_68)){
_6c=_64;
}
}
}
_69.size[_sizeComponent]=_6c-_69.origin[_originComponent];
objj_msgSend(_subviews[_62],"setFrame:",_69);
_6b.size[_sizeComponent]=_6b.origin[_originComponent]+_6b.size[_sizeComponent]-_6c-objj_msgSend(_5f,"dividerThickness");
_6b.origin[_originComponent]=_6c+objj_msgSend(_5f,"dividerThickness");
objj_msgSend(_subviews[_62+1],"setFrame:",_6b);
objj_msgSend(_5f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_6d,_6e,_6f){
with(_6d){
objj_msgSend(_6d,"_adjustSubviewsWithCalculatedSize");
objj_msgSendSuper({receiver:_6d,super_class:objj_getClass("CPView")},"setFrameSize:",_6f);
objj_msgSend(_6d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_70,_71,_72){
with(_70){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:resizeSubviewsWithOldSize:"))){
objj_msgSend(_delegate,"splitView:resizeSubviewsWithOldSize:",_70,_72);
return;
}
objj_msgSend(_70,"_postNotificationWillResize");
var _73=0,_74=objj_msgSend(_subviews,"count"),_75=objj_msgSend(_70,"bounds"),_76=objj_msgSend(_70,"dividerThickness"),_77=_74-1,_78=0,_79=0,_7a=-1,_7b=0,_7c=objj_msgSend(_70,"isVertical");
for(_73=0;_73<_74;++_73){
var _7d=_subviews[_73],_7e=_7c?objj_msgSend(_7d,"autoresizingMask")&CPViewWidthSizable:objj_msgSend(_7d,"autoresizingMask")&CPViewHeightSizable;
if(_7e){
_78+=objj_msgSend(_7d,"frame").size[_sizeComponent];
_7a=_73;
_7b++;
}
}
if(_7b===_74){
_78=0;
}
var _79=_78?_75.size[_sizeComponent]-_78:0,_7f=_75.size[_sizeComponent]-_72[_sizeComponent],_80=(_72[_sizeComponent]-_77*_76-_79),_81=_80<=0?0:(_75.size[_sizeComponent]-_77*_76-_79)/_80;
for(_73=0;_73<_74;++_73){
var _7d=_subviews[_73],_82=CGRectMakeCopy(_75),_7e=_7c?objj_msgSend(_7d,"autoresizingMask")&CPViewWidthSizable:objj_msgSend(_7d,"autoresizingMask")&CPViewHeightSizable;
if(_73+1==_74){
_82.size[_sizeComponent]=_75.size[_sizeComponent]-_82.origin[_originComponent];
}else{
if(_78&&_7e&&_7a===_73){
_82.size[_sizeComponent]=MAX(0,ROUND(objj_msgSend(_7d,"frame").size[_sizeComponent]+_7f));
}else{
if(_7e||!_78){
_82.size[_sizeComponent]=MAX(0,ROUND(_81*objj_msgSend(_7d,"frame").size[_sizeComponent]));
_7f-=(_82.size[_sizeComponent]-objj_msgSend(_7d,"frame").size[_sizeComponent]);
}else{
if(_78&&!_7e){
_82.size[_sizeComponent]=objj_msgSend(_7d,"frame").size[_sizeComponent];
}else{
alert("SHOULD NEVER GET HERE");
}
}
}
}
_75.origin[_originComponent]+=_82.size[_sizeComponent]+_76;
objj_msgSend(_7d,"setFrame:",_82);
}
objj_msgSend(_70,"_postNotificationDidResize");
}
}),new objj_method(sel_getUid("setDelegate:"),function(_83,_84,_85){
with(_83){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewDidResizeSubviewsNotification,_83);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewWillResizeSubviewsNotification,_83);
}
_delegate=_85;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewDidResizeSubviews:"),CPSplitViewDidResizeSubviewsNotification,_83);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewWillResizeSubviews:"),CPSplitViewWillResizeSubviewsNotification,_83);
}
}
}),new objj_method(sel_getUid("_postNotificationWillResize"),function(_86,_87){
with(_86){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPSplitViewWillResizeSubviewsNotification,_86);
}
}),new objj_method(sel_getUid("_postNotificationDidResize"),function(_88,_89){
with(_88){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPSplitViewDidResizeSubviewsNotification,_88);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_8a,_8b){
with(_8a){
if(_8a!=objj_msgSend(CPSplitView,"class")){
return;
}
var _8c=objj_msgSend(CPBundle,"bundleForClass:",_8a);
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","CPSplitView/CPSplitViewHorizontal.png"),CPSizeMake(5,10));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","CPSplitView/CPSplitViewVertical.png"),CPSizeMake(10,5));
}
})]);
var _8d="CPSplitViewDelegateKey",_8e="CPSplitViewIsVerticalKey",_8f="CPSplitViewIsPaneSplitterKey";
var _3=objj_getClass("CPSplitView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSplitView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_90,_91,_92){
with(_90){
_90=objj_msgSendSuper({receiver:_90,super_class:objj_getClass("CPView")},"initWithCoder:",_92);
if(_90){
_currentDivider=CPNotFound;
_DOMDividerElements=[];
_delegate=objj_msgSend(_92,"decodeObjectForKey:",_8d);
_isPaneSplitter=objj_msgSend(_92,"decodeBoolForKey:",_8f);
objj_msgSend(_90,"_setVertical:",objj_msgSend(_92,"decodeBoolForKey:",_8e));
}
return _90;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_93,_94,_95){
with(_93){
objj_msgSendSuper({receiver:_93,super_class:objj_getClass("CPView")},"encodeWithCoder:",_95);
objj_msgSend(_95,"encodeConditionalObject:forKey:",_delegate,_8d);
objj_msgSend(_95,"encodeBool:forKey:",_isVertical,_8e);
objj_msgSend(_95,"encodeBool:forKey:",_isPaneSplitter,_8f);
}
})]);
