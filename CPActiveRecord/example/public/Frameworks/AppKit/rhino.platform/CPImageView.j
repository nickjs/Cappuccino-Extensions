I;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jc;6312;
CPScaleProportionally=0;
CPScaleToFit=1;
CPScaleNone=2;
var _1=nil;
var _2=3,_3=3,_4=3,_5=5,_6=_4+_5,_7=_2+_3;
var _8=objj_allocateClassPair(CPControl,"CPImageView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_DOMImageElement"),new objj_ivar("_hasShadow"),new objj_ivar("_shadowView"),new objj_ivar("_isEditable"),new objj_ivar("_imageRect")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPControl")},"initWithFrame:",_c);
if(_a){
}
return _a;
}
}),new objj_method(sel_getUid("image"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"objectValue");
}
}),new objj_method(sel_getUid("setImage:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"setObjectValue:",_11);
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(_12,"objectValue");
if(_15===_14){
return;
}
objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPControl")},"setObjectValue:",_14);
var _16=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_15){
objj_msgSend(_16,"removeObserver:name:object:",_12,CPImageDidLoadNotification,_15);
}
var _17=objj_msgSend(_12,"objectValue");
var _18=objj_msgSend(_17,"size");
if(_18&&_18.width===-1&&_18.height===-1){
objj_msgSend(_16,"addObserver:selector:name:object:",_12,sel_getUid("imageDidLoad:"),CPImageDidLoadNotification,_17);
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
objj_msgSend(_12,"hideOrDisplayContents");
objj_msgSend(_12,"setNeedsLayout");
objj_msgSend(_12,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(_19,"hideOrDisplayContents");
objj_msgSend(_19,"setNeedsLayout");
objj_msgSend(_19,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("hasShadow"),function(_1c,_1d){
with(_1c){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_1e,_1f,_20){
with(_1e){
if(_hasShadow==_20){
return;
}
_hasShadow=_20;
if(_hasShadow){
_shadowView=objj_msgSend(objj_msgSend(CPShadowView,"alloc"),"initWithFrame:",objj_msgSend(_1e,"bounds"));
objj_msgSend(_1e,"addSubview:",_shadowView);
objj_msgSend(_1e,"setNeedsLayout");
objj_msgSend(_1e,"setNeedsDisplay:",YES);
}else{
objj_msgSend(_shadowView,"removeFromSuperview");
_shadowView=nil;
}
objj_msgSend(_1e,"hideOrDisplayContents");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_21,_22,_23){
with(_21){
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("CPControl")},"setImageScaling:",_23);
objj_msgSend(_21,"setNeedsLayout");
objj_msgSend(_21,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("hideOrDisplayContents"),function(_24,_25){
with(_24){
if(!objj_msgSend(_24,"image")){
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
objj_msgSend(_shadowView,"setHidden:",NO);
}
}
}),new objj_method(sel_getUid("imageRect"),function(_26,_27){
with(_26){
return _imageRect;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_28,_29){
with(_28){
if(!objj_msgSend(_28,"image")){
return;
}
var _2a=objj_msgSend(_28,"bounds"),_2b=objj_msgSend(_28,"image"),_2c=objj_msgSend(_28,"currentValueForThemeAttribute:","image-scaling"),x=0,y=0,_2f=(_hasShadow?_7:0),_30=(_hasShadow?_6:0),_31=(_2a.size.width),_32=(_2a.size.height),_33=_31-_2f,_34=_32-_30;
if(_2c===CPScaleToFit){
}else{
var _35=objj_msgSend(_2b,"size");
if(_35.width==-1&&_35.height==-1){
return;
}
if(_2c===CPScaleProportionally){
if(_33>=_35.width&&_34>=_35.height){
_33=_35.width;
_34=_35.height;
}else{
var _36=_35.width/_35.height,_37=_33/_34;
if(_37>_36){
_33=_34*_36;
}else{
_34=_33/_36;
}
}
}else{
_33=_35.width;
_34=_35.height;
}
if(_2c==CPScaleNone){
}
var x=(_31-_33)/2,y=(_32-_34)/2;
}
_imageRect={origin:{x:x,y:y},size:{width:_33,height:_34}};
if(_hasShadow){
objj_msgSend(_shadowView,"setFrame:",{origin:{x:x-_2,y:y-_4},size:{width:_33+_2f,height:_34+_30}});
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(objj_msgSend(_38,"nextResponder"),"mouseDown:",_3a);
}
}),new objj_method(sel_getUid("setEditable:"),function(_3b,_3c,_3d){
with(_3b){
if(_isEditable===_3d){
return;
}
_isEditable=_3d;
if(_isEditable){
objj_msgSend(_3b,"registerForDraggedTypes:",[CPImagesPboardType]);
}else{
var _3e=objj_msgSend(_3b,"registeredDraggedTypes");
objj_msgSend(_3b,"unregisterDraggedTypes");
objj_msgSend(_3e,"removeObjectIdenticalTo:",CPImagesPboardType);
objj_msgSend(_3b,"registerForDraggedTypes:",_3e);
}
}
}),new objj_method(sel_getUid("isEditable"),function(_3f,_40){
with(_3f){
return _isEditable;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_41,_42,_43){
with(_41){
var _44=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(objj_msgSend(_43,"draggingPasteboard"),"dataForType:",CPImagesPboardType));
if(objj_msgSend(_44,"count")){
objj_msgSend(_41,"setImage:",_44[0]);
}
}
})]);
var _45="CPImageViewImageKey",_46="CPImageViewImageScalingKey",_47="CPImageViewHasShadowKey",_48="CPImageViewIsEditableKey";
var _8=objj_getClass("CPImageView");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPImageView\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_49,_4a,_4b){
with(_49){
_49=objj_msgSendSuper({receiver:_49,super_class:objj_getClass("CPControl")},"initWithCoder:",_4b);
if(_49){
objj_msgSend(_49,"setHasShadow:",objj_msgSend(_4b,"decodeBoolForKey:",_47));
if(objj_msgSend(_4b,"decodeBoolForKey:",_48)||NO){
objj_msgSend(_49,"setEditable:",YES);
}
objj_msgSend(_49,"setNeedsLayout");
objj_msgSend(_49,"setNeedsDisplay:",YES);
}
return _49;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
if(_shadowView){
var _4f=_subviews;
_subviews=objj_msgSend(_subviews,"copy");
objj_msgSend(_subviews,"removeObjectIdenticalTo:",_shadowView);
}
objj_msgSendSuper({receiver:_4c,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_4e);
if(_shadowView){
_subviews=_4f;
}
objj_msgSend(_4e,"encodeBool:forKey:",_hasShadow,_47);
if(_isEditable){
objj_msgSend(_4e,"encodeBool:forKey:",_isEditable,_48);
}
}
})]);
