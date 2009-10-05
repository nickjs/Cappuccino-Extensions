i;9;CPImage.ji;8;CPView.jc;17480;
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
_DOMDividerElements=[];
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
if(!_DOMDividerElements[_drawingDivider]){
_DOMDividerElements[_drawingDivider]=document.createElement("div");
_DOMDividerElements[_drawingDivider].style.cursor="move";
_DOMDividerElements[_drawingDivider].style.position="absolute";
_DOMDividerElements[_drawingDivider].style.backgroundRepeat="repeat";
_DOMElement.appendChild(_DOMDividerElements[_drawingDivider]);
if(_isPaneSplitter){
_DOMDividerElements[_drawingDivider].style.backgroundColor="#A5A5A5";
_DOMDividerElements[_drawingDivider].style.backgroundImage="";
}else{
_DOMDividerElements[_drawingDivider].style.backgroundColor="";
_DOMDividerElements[_drawingDivider].style.backgroundImage="url('"+_dividerImagePath+"')";
}
}
if(NULL){
var _34=_CGPointApplyAffineTransform(CGPointMake((_33.origin.x),(_33.origin.y)),NULL);
}else{
var _34={x:(_33.origin.x),y:(_33.origin.y)};
}
_DOMDividerElements[_drawingDivider].style.left=ROUND(_34.x)+"px";
_DOMDividerElements[_drawingDivider].style.top=ROUND(_34.y)+"px";
_DOMDividerElements[_drawingDivider].style.width=MAX(0,ROUND((_33.size.width)))+"px";
_DOMDividerElements[_drawingDivider].style.height=MAX(0,ROUND((_33.size.height)))+"px";
}
}),new objj_method(sel_getUid("viewWillDraw"),function(_35,_36){
with(_35){
objj_msgSend(_35,"_adjustSubviewsWithCalculatedSize");
}
}),new objj_method(sel_getUid("_adjustSubviewsWithCalculatedSize"),function(_37,_38){
with(_37){
if(!_needsResizeSubviews){
return;
}
_needsResizeSubviews=NO;
var _39=objj_msgSend(_37,"subviews"),_3a=_39.length,_3b=CGSizeMakeZero();
if(objj_msgSend(_37,"isVertical")){
_3b.width+=objj_msgSend(_37,"dividerThickness")*(_3a-1);
_3b.height=CGRectGetHeight(objj_msgSend(_37,"frame"));
}else{
_3b.width=CGRectGetWidth(objj_msgSend(_37,"frame"));
_3b.height+=objj_msgSend(_37,"dividerThickness")*(_3a-1);
}
while(_3a--){
_3b[_sizeComponent]+=objj_msgSend(_39[_3a],"frame").size[_sizeComponent];
}
objj_msgSend(_37,"resizeSubviewsWithOldSize:",_3b);
}
}),new objj_method(sel_getUid("cursorAtPoint:hitDividerAtIndex:"),function(_3c,_3d,_3e,_3f){
with(_3c){
var _40=objj_msgSend(_subviews[_3f],"frame"),_41=_40.origin[_originComponent]+_40.size[_sizeComponent],_42=objj_msgSend(_3c,"effectiveRectOfDividerAtIndex:",_3f),_43=null;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:"))){
_42=objj_msgSend(_delegate,"splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:",_3c,_42,_42,_3f);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:additionalEffectiveRectOfDividerAtIndex:"))){
_43=objj_msgSend(_delegate,"splitView:additionalEffectiveRectOfDividerAtIndex:",_3c,_3f);
}
return CGRectContainsPoint(_42,_3e)||(_43&&CGRectContainsPoint(_43,_3e));
}
}),new objj_method(sel_getUid("hitTest:"),function(_44,_45,_46){
with(_44){
if(objj_msgSend(_44,"isHidden")||!objj_msgSend(_44,"hitTests")||!CGRectContainsPoint(objj_msgSend(_44,"frame"),_46)){
return nil;
}
var _47=objj_msgSend(_44,"convertPoint:fromView:",_46,objj_msgSend(_44,"superview"));
var _48=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_48;i++){
if(objj_msgSend(_44,"cursorAtPoint:hitDividerAtIndex:",_47,i)){
return _44;
}
}
return objj_msgSendSuper({receiver:_44,super_class:objj_getClass("CPView")},"hitTest:",_46);
}
}),new objj_method(sel_getUid("trackDivider:"),function(_4a,_4b,_4c){
with(_4a){
var _4d=objj_msgSend(_4c,"type");
if(_4d==CPLeftMouseUp){
if(_currentDivider!=CPNotFound){
_currentDivider=CPNotFound;
objj_msgSend(_4a,"_postNotificationDidResize");
}
return;
}
if(_4d==CPLeftMouseDown){
var _4e=objj_msgSend(_4a,"convertPoint:fromView:",objj_msgSend(_4c,"locationInWindow"),nil);
_currentDivider=CPNotFound;
var _4f=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_4f;i++){
var _51=objj_msgSend(_subviews[i],"frame"),_52=_51.origin[_originComponent]+_51.size[_sizeComponent];
if(objj_msgSend(_4a,"cursorAtPoint:hitDividerAtIndex:",_4e,i)){
if(objj_msgSend(_4c,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:"))){
var _53=objj_msgSend(_4a,"minPossiblePositionOfDividerAtIndex:",i),_54=objj_msgSend(_4a,"maxPossiblePositionOfDividerAtIndex:",i);
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_4a,_subviews[i])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_4a,_subviews[i],i)){
if(objj_msgSend(_4a,"isSubviewCollapsed:",_subviews[i])){
objj_msgSend(_4a,"setPosition:ofDividerAtIndex:",(_53+(_54-_53)/2),i);
}else{
objj_msgSend(_4a,"setPosition:ofDividerAtIndex:",_53,i);
}
}else{
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_4a,_subviews[i+1])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_4a,_subviews[i+1],i)){
if(objj_msgSend(_4a,"isSubviewCollapsed:",_subviews[i+1])){
objj_msgSend(_4a,"setPosition:ofDividerAtIndex:",(_53+(_54-_53)/2),i);
}else{
objj_msgSend(_4a,"setPosition:ofDividerAtIndex:",_54,i);
}
}
}
}else{
_currentDivider=i;
_initialOffset=_52-_4e[_originComponent];
objj_msgSend(_4a,"_postNotificationWillResize");
}
}
}
if(_currentDivider===CPNotFound){
return;
}
}else{
if(_4d==CPLeftMouseDragged&&_currentDivider!=CPNotFound){
var _4e=objj_msgSend(_4a,"convertPoint:fromView:",objj_msgSend(_4c,"locationInWindow"),nil);
objj_msgSend(_4a,"setPosition:ofDividerAtIndex:",(_4e[_originComponent]+_initialOffset),_currentDivider);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_4a,sel_getUid("trackDivider:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_55,_56,_57){
with(_55){
objj_msgSend(_55,"trackDivider:",_57);
}
}),new objj_method(sel_getUid("maxPossiblePositionOfDividerAtIndex:"),function(_58,_59,_5a){
with(_58){
var _5b=objj_msgSend(_subviews[_5a+1],"frame");
if(_5a+1<objj_msgSend(_subviews,"count")-1){
return _5b.origin[_originComponent]+_5b.size[_sizeComponent]-objj_msgSend(_58,"dividerThickness");
}else{
return objj_msgSend(_58,"frame").size[_sizeComponent]-objj_msgSend(_58,"dividerThickness");
}
}
}),new objj_method(sel_getUid("minPossiblePositionOfDividerAtIndex:"),function(_5c,_5d,_5e){
with(_5c){
if(_5e>0){
var _5f=objj_msgSend(_subviews[_5e-1],"frame");
return _5f.origin[_originComponent]+_5f.size[_sizeComponent]+objj_msgSend(_5c,"dividerThickness");
}else{
return 0;
}
}
}),new objj_method(sel_getUid("setPosition:ofDividerAtIndex:"),function(_60,_61,_62,_63){
with(_60){
objj_msgSend(_60,"_adjustSubviewsWithCalculatedSize");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:"))){
_62=objj_msgSend(_delegate,"splitView:constrainSplitPosition:ofSubviewAt:",_60,_62,_63);
}
var _64=objj_msgSend(_60,"maxPossiblePositionOfDividerAtIndex:",_63),_65=objj_msgSend(_60,"minPossiblePositionOfDividerAtIndex:",_63),_66=_64,_67=_65;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"))){
_67=objj_msgSend(_delegate,"splitView:constrainMinCoordinate:ofSubviewAt:",_60,_65,_63);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"))){
_66=objj_msgSend(_delegate,"splitView:constrainMaxCoordinate:ofSubviewAt:",_60,_64,_63);
}
var _68=objj_msgSend(_60,"frame"),_69=_subviews[_63],_6a=objj_msgSend(_69,"frame"),_6b=_subviews[_63+1],_6c=objj_msgSend(_6b,"frame");
var _6d=MAX(MIN(_62,_66),_67);
if(_62<_65+(_67-_65)/2){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))){
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_60,_69)){
_6d=_65;
}
}
}
_6a.size[_sizeComponent]=_6d-_6a.origin[_originComponent];
objj_msgSend(_subviews[_63],"setFrame:",_6a);
_6c.size[_sizeComponent]=_6c.origin[_originComponent]+_6c.size[_sizeComponent]-_6d-objj_msgSend(_60,"dividerThickness");
_6c.origin[_originComponent]=_6d+objj_msgSend(_60,"dividerThickness");
objj_msgSend(_subviews[_63+1],"setFrame:",_6c);
objj_msgSend(_60,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_6e,_6f,_70){
with(_6e){
objj_msgSend(_6e,"_adjustSubviewsWithCalculatedSize");
objj_msgSendSuper({receiver:_6e,super_class:objj_getClass("CPView")},"setFrameSize:",_70);
objj_msgSend(_6e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_71,_72,_73){
with(_71){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:resizeSubviewsWithOldSize:"))){
objj_msgSend(_delegate,"splitView:resizeSubviewsWithOldSize:",_71,_73);
return;
}
objj_msgSend(_71,"_postNotificationWillResize");
var _74=0,_75=objj_msgSend(_subviews,"count"),_76=objj_msgSend(_71,"bounds"),_77=objj_msgSend(_71,"dividerThickness"),_78=_75-1,_79=0,_7a=0,_7b=-1,_7c=0,_7d=objj_msgSend(_71,"isVertical");
for(_74=0;_74<_75;++_74){
var _7e=_subviews[_74],_7f=_7d?objj_msgSend(_7e,"autoresizingMask")&CPViewWidthSizable:objj_msgSend(_7e,"autoresizingMask")&CPViewHeightSizable;
if(_7f){
_79+=objj_msgSend(_7e,"frame").size[_sizeComponent];
_7b=_74;
_7c++;
}
}
if(_7c===_75){
_79=0;
}
var _7a=_79?_76.size[_sizeComponent]-_79:0,_80=_76.size[_sizeComponent]-_73[_sizeComponent],_81=(_73[_sizeComponent]-_78*_77-_7a),_82=_81<=0?0:(_76.size[_sizeComponent]-_78*_77-_7a)/_81;
for(_74=0;_74<_75;++_74){
var _7e=_subviews[_74],_83=CGRectMakeCopy(_76),_7f=_7d?objj_msgSend(_7e,"autoresizingMask")&CPViewWidthSizable:objj_msgSend(_7e,"autoresizingMask")&CPViewHeightSizable;
if(_74+1==_75){
_83.size[_sizeComponent]=_76.size[_sizeComponent]-_83.origin[_originComponent];
}else{
if(_79&&_7f&&_7b===_74){
_83.size[_sizeComponent]=MAX(0,ROUND(objj_msgSend(_7e,"frame").size[_sizeComponent]+_80));
}else{
if(_7f||!_79){
_83.size[_sizeComponent]=MAX(0,ROUND(_82*objj_msgSend(_7e,"frame").size[_sizeComponent]));
_80-=(_83.size[_sizeComponent]-objj_msgSend(_7e,"frame").size[_sizeComponent]);
}else{
if(_79&&!_7f){
_83.size[_sizeComponent]=objj_msgSend(_7e,"frame").size[_sizeComponent];
}else{
alert("SHOULD NEVER GET HERE");
}
}
}
}
_76.origin[_originComponent]+=_83.size[_sizeComponent]+_77;
objj_msgSend(_7e,"setFrame:",_83);
}
objj_msgSend(_71,"_postNotificationDidResize");
}
}),new objj_method(sel_getUid("setDelegate:"),function(_84,_85,_86){
with(_84){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewDidResizeSubviewsNotification,_84);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewWillResizeSubviewsNotification,_84);
}
_delegate=_86;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewDidResizeSubviews:"),CPSplitViewDidResizeSubviewsNotification,_84);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewWillResizeSubviews:"),CPSplitViewWillResizeSubviewsNotification,_84);
}
}
}),new objj_method(sel_getUid("_postNotificationWillResize"),function(_87,_88){
with(_87){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPSplitViewWillResizeSubviewsNotification,_87);
}
}),new objj_method(sel_getUid("_postNotificationDidResize"),function(_89,_8a){
with(_89){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPSplitViewDidResizeSubviewsNotification,_89);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_8b,_8c){
with(_8b){
if(_8b!=objj_msgSend(CPSplitView,"class")){
return;
}
var _8d=objj_msgSend(CPBundle,"bundleForClass:",_8b);
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8d,"pathForResource:","CPSplitView/CPSplitViewHorizontal.png"),CPSizeMake(5,10));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8d,"pathForResource:","CPSplitView/CPSplitViewVertical.png"),CPSizeMake(10,5));
}
})]);
var _8e="CPSplitViewDelegateKey",_8f="CPSplitViewIsVerticalKey",_90="CPSplitViewIsPaneSplitterKey";
var _3=objj_getClass("CPSplitView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSplitView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_91,_92,_93){
with(_91){
_91=objj_msgSendSuper({receiver:_91,super_class:objj_getClass("CPView")},"initWithCoder:",_93);
if(_91){
_currentDivider=CPNotFound;
_DOMDividerElements=[];
_delegate=objj_msgSend(_93,"decodeObjectForKey:",_8e);
_isPaneSplitter=objj_msgSend(_93,"decodeBoolForKey:",_90);
objj_msgSend(_91,"_setVertical:",objj_msgSend(_93,"decodeBoolForKey:",_8f));
}
return _91;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_94,_95,_96){
with(_94){
objj_msgSendSuper({receiver:_94,super_class:objj_getClass("CPView")},"encodeWithCoder:",_96);
objj_msgSend(_96,"encodeConditionalObject:forKey:",_delegate,_8e);
objj_msgSend(_96,"encodeBool:forKey:",_isVertical,_8f);
objj_msgSend(_96,"encodeBool:forKey:",_isPaneSplitter,_90);
}
})]);
