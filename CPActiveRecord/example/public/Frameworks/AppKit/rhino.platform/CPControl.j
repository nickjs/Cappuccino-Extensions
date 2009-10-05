i;8;CPFont.ji;10;CPShadow.ji;8;CPView.jc;16240;
CPLeftTextAlignment=0;
CPRightTextAlignment=1;
CPCenterTextAlignment=2;
CPJustifiedTextAlignment=3;
CPNaturalTextAlignment=4;
CPRegularControlSize=0;
CPSmallControlSize=1;
CPMiniControlSize=2;
CPControlNormalBackgroundColor="CPControlNormalBackgroundColor";
CPControlSelectedBackgroundColor="CPControlSelectedBackgroundColor";
CPControlHighlightedBackgroundColor="CPControlHighlightedBackgroundColor";
CPControlDisabledBackgroundColor="CPControlDisabledBackgroundColor";
CPControlTextDidBeginEditingNotification="CPControlTextDidBeginEditingNotification";
CPControlTextDidChangeNotification="CPControlTextDidChangeNotification";
CPControlTextDidEndEditingNotification="CPControlTextDidEndEditingNotification";
var _1=objj_msgSend(CPColor,"blackColor");
var _2=objj_allocateClassPair(CPView,"CPControl"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_value"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_sendActionOn"),new objj_ivar("_continuousTracking"),new objj_ivar("_trackingWasWithinFrame"),new objj_ivar("_trackingMouseDownFlags"),new objj_ivar("_previousTrackingLocation"),new objj_ivar("_toolTip")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPView")},"initWithFrame:",_6);
if(_4){
_sendActionOn=CPLeftMouseUpMask;
_trackingMouseDownFlags=0;
}
return _4;
}
}),new objj_method(sel_getUid("setAction:"),function(_7,_8,_9){
with(_7){
_action=_9;
}
}),new objj_method(sel_getUid("action"),function(_a,_b){
with(_a){
return _action;
}
}),new objj_method(sel_getUid("setTarget:"),function(_c,_d,_e){
with(_c){
_target=_e;
}
}),new objj_method(sel_getUid("target"),function(_f,_10){
with(_f){
return _target;
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_11,_12,_13,_14){
with(_11){
objj_msgSend(CPApp,"sendAction:to:from:",_13,_14,_11);
}
}),new objj_method(sel_getUid("sendActionOn:"),function(_15,_16,_17){
with(_15){
var _18=_sendActionOn;
_sendActionOn=_17;
return _18;
}
}),new objj_method(sel_getUid("isContinuous"),function(_19,_1a){
with(_19){
return (_sendActionOn&CPPeriodicMask)!==0;
}
}),new objj_method(sel_getUid("setContinuous:"),function(_1b,_1c,_1d){
with(_1b){
if(_1d){
_sendActionOn|=CPPeriodicMask;
}else{
_sendActionOn&=~CPPeriodicMask;
}
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(_1e,_1f){
with(_1e){
return NO;
}
}),new objj_method(sel_getUid("trackMouse:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_22,"type"),_24=objj_msgSend(_20,"convertPoint:fromView:",objj_msgSend(_22,"locationInWindow"),nil);
isWithinFrame=objj_msgSend(_20,"tracksMouseOutsideOfFrame")||CGRectContainsPoint(objj_msgSend(_20,"bounds"),_24);
if(_23===CPLeftMouseUp){
objj_msgSend(_20,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_24,YES);
_trackingMouseDownFlags=0;
}else{
if(_23===CPLeftMouseDown){
_trackingMouseDownFlags=objj_msgSend(_22,"modifierFlags");
_continuousTracking=objj_msgSend(_20,"startTrackingAt:",_24);
}else{
if(_23===CPLeftMouseDragged){
if(isWithinFrame){
if(!_trackingWasWithinFrame){
_continuousTracking=objj_msgSend(_20,"startTrackingAt:",_24);
}else{
if(_continuousTracking){
_continuousTracking=objj_msgSend(_20,"continueTracking:at:",_previousTrackingLocation,_24);
}
}
}else{
objj_msgSend(_20,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_24,NO);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_20,sel_getUid("trackMouse:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
if((_sendActionOn&(1<<_23))&&isWithinFrame){
objj_msgSend(_20,"sendAction:to:",_action,_target);
}
_trackingWasWithinFrame=isWithinFrame;
_previousTrackingLocation=_24;
}
}),new objj_method(sel_getUid("performClick:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_25,"highlight:",YES);
objj_msgSend(_25,"setState:",objj_msgSend(_25,"nextState"));
objj_msgSend(_25,"sendAction:to:",objj_msgSend(_25,"action"),objj_msgSend(_25,"target"));
objj_msgSend(_25,"highlight:",NO);
}
}),new objj_method(sel_getUid("setState:"),function(_28,_29,_2a){
with(_28){
}
}),new objj_method(sel_getUid("nextState"),function(_2b,_2c){
with(_2b){
return 0;
}
}),new objj_method(sel_getUid("mouseDownFlags"),function(_2d,_2e){
with(_2d){
return _trackingMouseDownFlags;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_2f,_30,_31){
with(_2f){
objj_msgSend(_2f,"highlight:",YES);
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(_32,_33,_34,_35){
with(_32){
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_36,_37,_38,_39,_3a){
with(_36){
objj_msgSend(_36,"highlight:",NO);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_3b,_3c,_3d){
with(_3b){
if(!objj_msgSend(_3b,"isEnabled")){
return;
}
objj_msgSend(_3b,"trackMouse:",_3d);
}
}),new objj_method(sel_getUid("objectValue"),function(_3e,_3f){
with(_3e){
return _value;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_40,_41,_42){
with(_40){
_value=_42;
objj_msgSend(_40,"setNeedsLayout");
objj_msgSend(_40,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("floatValue"),function(_43,_44){
with(_43){
var _45=parseFloat(_value,10);
return isNaN(_45)?0:_45;
}
}),new objj_method(sel_getUid("setFloatValue:"),function(_46,_47,_48){
with(_46){
objj_msgSend(_46,"setObjectValue:",_48);
}
}),new objj_method(sel_getUid("doubleValue"),function(_49,_4a){
with(_49){
var _4b=parseFloat(_value,10);
return isNaN(_4b)?0:_4b;
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4c,"setObjectValue:",_4e);
}
}),new objj_method(sel_getUid("intValue"),function(_4f,_50){
with(_4f){
var _51=parseInt(_value,10);
return isNaN(_51)?0:_51;
}
}),new objj_method(sel_getUid("setIntValue:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_52,"setObjectValue:",_54);
}
}),new objj_method(sel_getUid("integerValue"),function(_55,_56){
with(_55){
var _57=parseInt(_value,10);
return isNaN(_57)?0:_57;
}
}),new objj_method(sel_getUid("setIntegerValue:"),function(_58,_59,_5a){
with(_58){
objj_msgSend(_58,"setObjectValue:",_5a);
}
}),new objj_method(sel_getUid("stringValue"),function(_5b,_5c){
with(_5b){
return (_value===undefined||_value===nil)?"":String(_value);
}
}),new objj_method(sel_getUid("setStringValue:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(_5d,"setObjectValue:",_5f);
}
}),new objj_method(sel_getUid("takeDoubleValueFrom:"),function(_60,_61,_62){
with(_60){
if(objj_msgSend(_62,"respondsToSelector:",sel_getUid("doubleValue"))){
objj_msgSend(_60,"setDoubleValue:",objj_msgSend(_62,"doubleValue"));
}
}
}),new objj_method(sel_getUid("takeFloatValueFrom:"),function(_63,_64,_65){
with(_63){
if(objj_msgSend(_65,"respondsToSelector:",sel_getUid("floatValue"))){
objj_msgSend(_63,"setFloatValue:",objj_msgSend(_65,"floatValue"));
}
}
}),new objj_method(sel_getUid("takeIntegerValueFrom:"),function(_66,_67,_68){
with(_66){
if(objj_msgSend(_68,"respondsToSelector:",sel_getUid("integerValue"))){
objj_msgSend(_66,"setIntegerValue:",objj_msgSend(_68,"integerValue"));
}
}
}),new objj_method(sel_getUid("takeIntValueFrom:"),function(_69,_6a,_6b){
with(_69){
if(objj_msgSend(_6b,"respondsToSelector:",sel_getUid("intValue"))){
objj_msgSend(_69,"setIntValue:",objj_msgSend(_6b,"intValue"));
}
}
}),new objj_method(sel_getUid("takeObjectValueFrom:"),function(_6c,_6d,_6e){
with(_6c){
if(objj_msgSend(_6e,"respondsToSelector:",sel_getUid("objectValue"))){
objj_msgSend(_6c,"setObjectValue:",objj_msgSend(_6e,"objectValue"));
}
}
}),new objj_method(sel_getUid("takeStringValueFrom:"),function(_6f,_70,_71){
with(_6f){
if(objj_msgSend(_71,"respondsToSelector:",sel_getUid("stringValue"))){
objj_msgSend(_6f,"setStringValue:",objj_msgSend(_71,"stringValue"));
}
}
}),new objj_method(sel_getUid("textDidBeginEditing:"),function(_72,_73,_74){
with(_72){
if(objj_msgSend(_74,"object")!=_72){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidBeginEditingNotification,_72,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_74,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidChange:"),function(_75,_76,_77){
with(_75){
if(objj_msgSend(_77,"object")!=_75){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidChangeNotification,_75,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_77,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidEndEditing:"),function(_78,_79,_7a){
with(_78){
if(objj_msgSend(_7a,"object")!=_78){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidEndEditingNotification,_78,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_7a,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("setAlignment:"),function(_7b,_7c,_7d){
with(_7b){
objj_msgSend(_7b,"setValue:forThemeAttribute:",_7d,"alignment");
}
}),new objj_method(sel_getUid("alignment"),function(_7e,_7f){
with(_7e){
return objj_msgSend(_7e,"valueForThemeAttribute:","alignment");
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_80,_81,_82){
with(_80){
objj_msgSend(_80,"setValue:forThemeAttribute:",_82,"vertical-alignment");
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_83,_84){
with(_83){
return objj_msgSend(_83,"valueForThemeAttribute:","vertical-alignment");
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_85,_86,_87){
with(_85){
objj_msgSend(_85,"setValue:forThemeAttribute:",_87,"line-break-mode");
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_88,_89){
with(_88){
return objj_msgSend(_88,"valueForThemeAttribute:","line-break-mode");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSend(_8a,"setValue:forThemeAttribute:",_8c,"text-color");
}
}),new objj_method(sel_getUid("textColor"),function(_8d,_8e){
with(_8d){
return objj_msgSend(_8d,"valueForThemeAttribute:","text-color");
}
}),new objj_method(sel_getUid("setFont:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"setValue:forThemeAttribute:",_91,"font");
}
}),new objj_method(sel_getUid("font"),function(_92,_93){
with(_92){
return objj_msgSend(_92,"valueForThemeAttribute:","font");
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_94,_95,_96){
with(_94){
objj_msgSend(_94,"setValue:forThemeAttribute:",_96,"text-shadow-color");
}
}),new objj_method(sel_getUid("textShadowColor"),function(_97,_98){
with(_97){
return objj_msgSend(_97,"valueForThemeAttribute:","text-shadow-color");
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_99,_9a,_9b){
with(_99){
objj_msgSend(_99,"setValue:forThemeAttribute:",_9b,"text-shadow-offset");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_9c,_9d){
with(_9c){
return objj_msgSend(_9c,"valueForThemeAttribute:","text-shadow-offset");
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_9e,"setValue:forThemeAttribute:",_a0,"image-position");
}
}),new objj_method(sel_getUid("imagePosition"),function(_a1,_a2){
with(_a1){
return objj_msgSend(_a1,"valueForThemeAttribute:","image-position");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_a3,_a4,_a5){
with(_a3){
objj_msgSend(_a3,"setValue:forThemeAttribute:",_a5,"image-scaling");
}
}),new objj_method(sel_getUid("imageScaling"),function(_a6,_a7){
with(_a6){
return objj_msgSend(_a6,"valueForThemeAttribute:","image-scaling");
}
}),new objj_method(sel_getUid("setEnabled:"),function(_a8,_a9,_aa){
with(_a8){
if(_aa){
objj_msgSend(_a8,"unsetThemeState:",CPThemeStateDisabled);
}else{
objj_msgSend(_a8,"setThemeState:",CPThemeStateDisabled);
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_ab,_ac){
with(_ab){
return !objj_msgSend(_ab,"hasThemeState:",CPThemeStateDisabled);
}
}),new objj_method(sel_getUid("highlight:"),function(_ad,_ae,_af){
with(_ad){
objj_msgSend(_ad,"setHighlighted:",_af);
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_b0,_b1,_b2){
with(_b0){
if(_b2){
objj_msgSend(_b0,"setThemeState:",CPThemeStateHighlighted);
}else{
objj_msgSend(_b0,"unsetThemeState:",CPThemeStateHighlighted);
}
}
}),new objj_method(sel_getUid("isHighlighted"),function(_b3,_b4){
with(_b3){
return objj_msgSend(_b3,"hasThemeState:",CPThemeStateHighlighted);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeAttributes"),function(_b5,_b6){
with(_b5){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPLeftTextAlignment,CPTopVerticalTextAlignment,CPLineBreakByClipping,objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPFont,"systemFontOfSize:",12),nil,{width:0,height:0},CPImageLeft,CPScaleToFit,{width:0,height:0},{width:-1,height:-1}],["alignment","vertical-alignment","line-break-mode","text-color","font","text-shadow-color","text-shadow-offset","image-position","image-scaling","min-size","max-size"]);
}
})]);
var _b7="CPControlValueKey",_b8="CPControlControlStateKey",_b9="CPControlIsEnabledKey",_ba="CPControlTargetKey",_bb="CPControlActionKey",_bc="CPControlSendActionOnKey";
var _bd="CPImageViewImageKey";
var _2=objj_getClass("CPControl");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPControl\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_be,_bf,_c0){
with(_be){
_be=objj_msgSendSuper({receiver:_be,super_class:objj_getClass("CPView")},"initWithCoder:",_c0);
if(_be){
objj_msgSend(_be,"setObjectValue:",objj_msgSend(_c0,"decodeObjectForKey:",_b7));
objj_msgSend(_be,"setTarget:",objj_msgSend(_c0,"decodeObjectForKey:",_ba));
objj_msgSend(_be,"setAction:",objj_msgSend(_c0,"decodeObjectForKey:",_bb));
objj_msgSend(_be,"sendActionOn:",objj_msgSend(_c0,"decodeIntForKey:",_bc));
}
return _be;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c1,_c2,_c3){
with(_c1){
objj_msgSendSuper({receiver:_c1,super_class:objj_getClass("CPView")},"encodeWithCoder:",_c3);
if(_value!==nil){
objj_msgSend(_c3,"encodeObject:forKey:",_value,_b7);
}
if(_target!==nil){
objj_msgSend(_c3,"encodeConditionalObject:forKey:",_target,_ba);
}
if(_action!==NULL){
objj_msgSend(_c3,"encodeObject:forKey:",_action,_bb);
}
objj_msgSend(_c3,"encodeInt:forKey:",_sendActionOn,_bc);
}
})]);
var _c4=[],_c5={},_c6={};
_c4[CPRegularControlSize]="Regular";
_c4[CPSmallControlSize]="Small";
_c4[CPMiniControlSize]="Mini";
_CPControlIdentifierForControlSize=function(_c7){
return _c4[_c7];
};
_CPControlColorWithPatternImage=function(_c8,_c9){
var _ca=1,_cb=arguments.length,_cc="";
for(;_ca<_cb;++_ca){
_cc+=arguments[_ca];
}
var _cd=_c5[_cc];
if(!_cd){
var _ce=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class"));
_cd=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:",_c9+"/"+_cc+".png"),_c8[_cc]));
_c5[_cc]=_cd;
}
return _cd;
};
_CPControlThreePartImagePattern=function(_cf,_d0,_d1){
var _d2=2,_d3=arguments.length,_d4="";
for(;_d2<_d3;++_d2){
_d4+=arguments[_d2];
}
var _d5=_c6[_d4];
if(!_d5){
var _d6=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class")),_d7=_d1+"/"+_d4;
_d0=_d0[_d4];
_d5=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d6,"pathForResource:",_d7+"0.png"),_d0[0]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d6,"pathForResource:",_d7+"1.png"),_d0[1]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d6,"pathForResource:",_d7+"2.png"),_d0[2])],_cf));
_c6[_d4]=_d5;
}
return _d5;
};
