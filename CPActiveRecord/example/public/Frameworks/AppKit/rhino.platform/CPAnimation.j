I;21;Foundation/CPObject.ji;23;CAMediaTimingFunction.jc;4270;
CPAnimationEaseInOut=0;
CPAnimationEaseIn=1;
CPAnimationEaseOut=2;
CPAnimationLinear=3;
ACTUAL_FRAME_RATE=0;
var _1=objj_allocateClassPair(CPObject,"CPAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_lastTime"),new objj_ivar("_duration"),new objj_ivar("_animationCurve"),new objj_ivar("_timingFunction"),new objj_ivar("_frameRate"),new objj_ivar("_progress"),new objj_ivar("_delegate"),new objj_ivar("_timer")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithDuration:animationCurve:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_progress=0;
_duration=MAX(0,_5);
_animationCurve=_6;
_frameRate=60;
}
return _3;
}
}),new objj_method(sel_getUid("setAnimationCurve:"),function(_7,_8,_9){
with(_7){
switch(_animationCurve){
case CPAnimationEaseInOut:
timingFunctionName=kCAMediaTimingFunctionEaseInEaseOut;
break;
case CPAnimationEaseIn:
timingFunctionName=kCAMediaTimingFunctionEaseIn;
break;
case CPAnimationEaseOut:
timingFunctionName=kCAMediaTimingFunctionEaseOut;
break;
case CPAnimationLinear:
timingFunctionName=kCAMediaTimingFunctionLinear;
break;
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid value provided for animation curve");
break;
}
_animationCurve=_9;
_timingFunction=objj_msgSend(CAMediaTimingFunction,"functionWithName:",timingFunctionName);
}
}),new objj_method(sel_getUid("animationCurve"),function(_a,_b){
with(_a){
return _animationCurve;
}
}),new objj_method(sel_getUid("setDuration:"),function(_c,_d,_e){
with(_c){
if(_e<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"aDuration can't be negative");
}
_duration=_e;
}
}),new objj_method(sel_getUid("duration"),function(_f,_10){
with(_f){
return _duration;
}
}),new objj_method(sel_getUid("setFrameRate:"),function(_11,_12,_13){
with(_11){
if(_13<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"frameRate can't be negative");
}
_frameRate=_13;
}
}),new objj_method(sel_getUid("frameRate"),function(_14,_15){
with(_14){
return _frameRate;
}
}),new objj_method(sel_getUid("delegate"),function(_16,_17){
with(_16){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_18,_19,_1a){
with(_18){
_delegate=_1a;
}
}),new objj_method(sel_getUid("startAnimation"),function(_1b,_1c){
with(_1b){
if(_timer||_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationShouldStart:"))&&!objj_msgSend(_delegate,"animationShouldStart:",_1b)){
return;
}
if(_progress===1){
_progress=0;
}
ACTUAL_FRAME_RATE=0;
_lastTime=new Date();
_timer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_1b,sel_getUid("animationTimerDidFire:"),nil,YES);
}
}),new objj_method(sel_getUid("animationTimerDidFire:"),function(_1d,_1e,_1f){
with(_1d){
var _20=new Date(),_21=MIN(1,objj_msgSend(_1d,"currentProgress")+(_20-_lastTime)/(_duration*1000));
_lastTime=_20;
++ACTUAL_FRAME_RATE;
objj_msgSend(_1d,"setCurrentProgress:",_21);
if(_21===1){
objj_msgSend(_timer,"invalidate");
_timer=nil;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidEnd:"))){
objj_msgSend(_delegate,"animationDidEnd:",_1d);
}
}
}
}),new objj_method(sel_getUid("stopAnimation"),function(_22,_23){
with(_22){
if(!_timer){
return;
}
objj_msgSend(_timer,"invalidate");
_timer=nil;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidStop:"))){
objj_msgSend(_delegate,"animationDidStop:",_22);
}
}
}),new objj_method(sel_getUid("isAnimating"),function(_24,_25){
with(_24){
return _timer;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(_26,_27,_28){
with(_26){
_progress=_28;
}
}),new objj_method(sel_getUid("currentProgress"),function(_29,_2a){
with(_29){
return _progress;
}
}),new objj_method(sel_getUid("currentValue"),function(_2b,_2c){
with(_2b){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animation:valueForProgress:"))){
return objj_msgSend(_delegate,"animation:valueForProgress:",_2b,_progress);
}
if(_animationCurve==CPAnimationLinear){
return _progress;
}
alert("IMPLEMENT ANIMATION CURVES!!!");
}
})]);
