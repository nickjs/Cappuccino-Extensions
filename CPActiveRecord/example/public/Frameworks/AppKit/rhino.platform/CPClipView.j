i;8;CPView.jc;4242;
var _1=objj_allocateClassPair(CPView,"CPClipView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_documentView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setDocumentView:"),function(_3,_4,_5){
with(_3){
if(_documentView==_5){
return;
}
var _6=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_documentView){
objj_msgSend(_6,"removeObserver:name:object:",_3,CPViewFrameDidChangeNotification,_documentView);
objj_msgSend(_6,"removeObserver:name:object:",_3,CPViewBoundsDidChangeNotification,_documentView);
objj_msgSend(_documentView,"removeFromSuperview");
}
_documentView=_5;
if(_documentView){
objj_msgSend(_3,"addSubview:",_documentView);
objj_msgSend(_documentView,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_documentView,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_6,"addObserver:selector:name:object:",_3,sel_getUid("viewFrameChanged:"),CPViewFrameDidChangeNotification,_documentView);
objj_msgSend(_6,"addObserver:selector:name:object:",_3,sel_getUid("viewBoundsChanged:"),CPViewBoundsDidChangeNotification,_documentView);
}
}
}),new objj_method(sel_getUid("documentView"),function(_7,_8){
with(_7){
return _documentView;
}
}),new objj_method(sel_getUid("constrainScrollPoint:"),function(_9,_a,_b){
with(_9){
if(!_documentView){
return {x:0,y:0};
}
var _c=objj_msgSend(_documentView,"frame");
_b.x=MAX(0,MIN(_b.x,MAX((_c.size.width)-(_bounds.size.width),0)));
_b.y=MAX(0,MIN(_b.y,MAX((_c.size.height)-(_bounds.size.height),0)));
return _b;
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_d,_e,_f){
with(_d){
if((_bounds.origin.x==_f.x&&_bounds.origin.y==_f.y)){
return;
}
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPView")},"setBoundsOrigin:",_f);
var _10=objj_msgSend(_d,"superview");
if(objj_msgSend(_10,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_10,"reflectScrolledClipView:",_d);
}
}
}),new objj_method(sel_getUid("scrollToPoint:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"setBoundsOrigin:",objj_msgSend(_11,"constrainScrollPoint:",_13));
}
}),new objj_method(sel_getUid("viewBoundsChanged:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"_constrainScrollPoint");
}
}),new objj_method(sel_getUid("viewFrameChanged:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"_constrainScrollPoint");
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPView")},"resizeSubviewsWithOldSize:",_1c);
objj_msgSend(_1a,"_constrainScrollPoint");
}
}),new objj_method(sel_getUid("_constrainScrollPoint"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_1d,"bounds").origin;
objj_msgSend(_1d,"scrollToPoint:",_1f);
if(!CGPointEqualToPoint(_1f,objj_msgSend(_1d,"bounds").origin)){
return;
}
var _20=objj_msgSend(_1d,"superview");
if(objj_msgSend(_20,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_20,"reflectScrolledClipView:",_1d);
}
}
}),new objj_method(sel_getUid("autoscroll:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(_21,"bounds"),_25=objj_msgSend(_21,"convertPoint:fromView:",objj_msgSend(_23,"locationInWindow"),nil);
if(CPRectContainsPoint(_24,_25)){
return NO;
}
var _26=CGRectMakeZero();
_26.origin=_25;
_26.size=CPSizeMake(10,10);
return objj_msgSend(_documentView,"scrollRectToVisible:",_26);
}
})]);
var _27="CPScrollViewDocumentView";
var _1=objj_getClass("CPClipView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPClipView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_28,_29,_2a){
with(_28){
if(_28=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("CPView")},"initWithCoder:",_2a)){
objj_msgSend(_28,"setDocumentView:",objj_msgSend(_2a,"decodeObjectForKey:",_27));
}
return _28;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("CPView")},"encodeWithCoder:",_2d);
objj_msgSend(_2d,"encodeObject:forKey:",_documentView,_27);
}
})]);
