I;21;Foundation/CPObject.jc;3168;
var _1=NULL;
var _2=objj_allocateClassPair(CPObject,"CPPlatformWindow"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_contentRect"),new objj_ivar("_level"),new objj_ivar("_hasShadow")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithContentRect:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_contentRect={origin:{x:_6.origin.x,y:_6.origin.y},size:{width:_6.size.width,height:_6.size.height}};
}
return _4;
}
}),new objj_method(sel_getUid("init"),function(_7,_8){
with(_7){
return objj_msgSend(_7,"initWithContentRect:",{origin:{x:0,y:0},size:{width:400,height:500}});
}
}),new objj_method(sel_getUid("contentRect"),function(_9,_a){
with(_9){
return {origin:{x:_contentRect.origin.x,y:_contentRect.origin.y},size:{width:_contentRect.size.width,height:_contentRect.size.height}};
}
}),new objj_method(sel_getUid("contentBounds"),function(_b,_c){
with(_b){
var _d=objj_msgSend(_b,"contentRect");
_d.origin={x:0,y:0};
return _d;
}
}),new objj_method(sel_getUid("visibleFrame"),function(_e,_f){
with(_e){
var _10=objj_msgSend(_e,"contentBounds");
_10.origin=CGPointMakeZero();
if(objj_msgSend(CPMenu,"menuBarVisible")){
var _11=objj_msgSend(objj_msgSend(CPApp,"mainMenu"),"menuBarHeight");
_10.origin.y+=_11;
_10.size.height-=_11;
}
return _10;
}
}),new objj_method(sel_getUid("usableContentFrame"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"visibleFrame");
}
}),new objj_method(sel_getUid("setContentRect:"),function(_14,_15,_16){
with(_14){
if(!_16||((_contentRect.origin.x==_16.origin.x&&_contentRect.origin.y==_16.origin.y)&&(_contentRect.size.width==_16.size.width&&_contentRect.size.height==_16.size.height))){
return;
}
_contentRect={origin:{x:_16.origin.x,y:_16.origin.y},size:{width:_16.size.width,height:_16.size.height}};
objj_msgSend(_14,"updateNativeContentRect");
}
}),new objj_method(sel_getUid("updateFromNativeContentRect"),function(_17,_18){
with(_17){
objj_msgSend(_17,"setContentRect:",objj_msgSend(_17,"nativeContentRect"));
}
}),new objj_method(sel_getUid("convertBaseToScreen:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(_19,"contentRect");
return {x:_1b.x+(_1c.origin.x),y:_1b.y+(_1c.origin.y)};
}
}),new objj_method(sel_getUid("convertScreenToBase:"),function(_1d,_1e,_1f){
with(_1d){
var _20=objj_msgSend(_1d,"contentRect");
return {x:_1f.x-(_20.origin.x),y:_1f.y-(_20.origin.y)};
}
}),new objj_method(sel_getUid("isVisible"),function(_21,_22){
with(_21){
return NO;
}
}),new objj_method(sel_getUid("setLevel:"),function(_23,_24,_25){
with(_23){
_level=_25;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_26,_27,_28){
with(_26){
_hasShadow=_28;
}
}),new objj_method(sel_getUid("supportsFullPlatformWindows"),function(_29,_2a){
with(_29){
return objj_msgSend(CPPlatform,"isBrowser");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("primaryPlatformWindow"),function(_2b,_2c){
with(_2b){
return _1;
}
}),new objj_method(sel_getUid("setPrimaryPlatformWindow:"),function(_2d,_2e,_2f){
with(_2d){
_1=_2f;
}
})]);
