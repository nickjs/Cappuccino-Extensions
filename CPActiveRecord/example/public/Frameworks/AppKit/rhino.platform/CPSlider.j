i;11;CPControl.jc;11368;
CPLinearSlider=0;
CPCircularSlider=1;
var _1=objj_allocateClassPair(CPControl,"CPSlider"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_altIncrementValue"),new objj_ivar("_isVertical")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"initWithFrame:",_5);
if(_3){
_minValue=0;
_maxValue=100;
objj_msgSend(_3,"setObjectValue:",50);
objj_msgSend(_3,"setContinuous:",YES);
objj_msgSend(_3,"_recalculateIsVertical");
}
return _3;
}
}),new objj_method(sel_getUid("setMinValue:"),function(_6,_7,_8){
with(_6){
if(_minValue===_8){
return;
}
_minValue=_8;
var _9=objj_msgSend(_6,"doubleValue");
if(_9<_minValue){
objj_msgSend(_6,"setDoubleValue:",_minValue);
}
objj_msgSend(_6,"setNeedsLayout");
objj_msgSend(_6,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("minValue"),function(_a,_b){
with(_a){
return _minValue;
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_c,_d,_e){
with(_c){
if(_maxValue===_e){
return;
}
_maxValue=_e;
var _f=objj_msgSend(_c,"doubleValue");
if(_f>_maxValue){
objj_msgSend(_c,"setDoubleValue:",_maxValue);
}
objj_msgSend(_c,"setNeedsLayout");
objj_msgSend(_c,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("maxValue"),function(_10,_11){
with(_10){
return _maxValue;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_12,_13,_14){
with(_12){
objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPControl")},"setObjectValue:",MIN(MAX(_14,_minValue),_maxValue));
objj_msgSend(_12,"setNeedsLayout");
objj_msgSend(_12,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setSliderType:"),function(_15,_16,_17){
with(_15){
if(_17===CPCircularSlider){
objj_msgSend(_15,"setThemeState:",CPThemeStateCircular);
}else{
objj_msgSend(_15,"unsetThemeState:",CPThemeStateCircular);
}
}
}),new objj_method(sel_getUid("sliderType"),function(_18,_19){
with(_18){
return objj_msgSend(_18,"hasThemeState:",CPThemeStateCircular)?CPCircularSlider:CPLinearSlider;
}
}),new objj_method(sel_getUid("trackRectForBounds:"),function(_1a,_1b,_1c){
with(_1a){
if(objj_msgSend(_1a,"hasThemeState:",CPThemeStateCircular)){
var _1d=CGRectCreateCopy(_1c);
_1c.size.width=MIN(_1c.size.width,_1c.size.height);
_1c.size.height=_1c.size.width;
if(_1c.size.width<_1d.size.width){
_1c.origin.x+=(_1d.size.width-_1c.size.width)/2;
}else{
_1c.origin.y+=(_1d.size.height-_1c.size.height)/2;
}
}else{
var _1e=objj_msgSend(_1a,"currentValueForThemeAttribute:","track-width");
if(_1e<=0){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(objj_msgSend(_1a,"isVertical")){
_1c.origin.x=((_1c.size.width)-_1e)/2;
_1c.size.width=_1e;
}else{
_1c.origin.y=((_1c.size.height)-_1e)/2;
_1c.size.height=_1e;
}
}
return _1c;
}
}),new objj_method(sel_getUid("knobRectForBounds:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(_1f,"currentValueForThemeAttribute:","knob-size");
if(_22.width<=0||_22.height<=0){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _23={origin:{x:0,y:0},size:{width:_22.width,height:_22.height}},_24=objj_msgSend(_1f,"trackRectForBounds:",_21);
if(!_24||(_24.size.width<=0||_24.size.height<=0)){
_24=_21;
}
if(objj_msgSend(_1f,"hasThemeState:",CPThemeStateCircular)){
var _25=3*PI_2-(1-objj_msgSend(_1f,"doubleValue")-_minValue)/(_maxValue-_minValue)*PI2,_26=CGRectGetWidth(_24)/2-8;
_23.origin.x=_26*COS(_25)+CGRectGetMidX(_24)-3;
_23.origin.y=_26*SIN(_25)+CGRectGetMidY(_24)-2;
}else{
if(objj_msgSend(_1f,"isVertical")){
_23.origin.x=(_24.origin.x+(_24.size.width)/2)-_22.width/2;
_23.origin.y=((objj_msgSend(_1f,"doubleValue")-_minValue)/(_maxValue-_minValue))*((_24.size.height)-_22.height);
}else{
_23.origin.x=((objj_msgSend(_1f,"doubleValue")-_minValue)/(_maxValue-_minValue))*((_24.size.width)-_22.width);
_23.origin.y=(_24.origin.y+(_24.size.height)/2)-_22.height/2;
}
}
return _23;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_27,_28,_29){
with(_27){
if(_29==="track-view"){
return objj_msgSend(_27,"trackRectForBounds:",objj_msgSend(_27,"bounds"));
}else{
if(_29==="knob-view"){
return objj_msgSend(_27,"knobRectForBounds:",objj_msgSend(_27,"bounds"));
}
}
return objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_29);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_2a,_2b,_2c){
with(_2a){
if(_2c==="track-view"||_2c==="knob-view"){
var _2d=objj_msgSend(objj_msgSend(CPView,"alloc"),"init");
objj_msgSend(_2d,"setHitTests:",NO);
return _2d;
}
return objj_msgSendSuper({receiver:_2a,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_2c);
}
}),new objj_method(sel_getUid("setAltIncrementValue:"),function(_2e,_2f,_30){
with(_2e){
_altIncrementValue=_30;
}
}),new objj_method(sel_getUid("altIncrementValue"),function(_31,_32){
with(_31){
return _altIncrementValue;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_33,_34,_35){
with(_33){
objj_msgSendSuper({receiver:_33,super_class:objj_getClass("CPControl")},"setFrameSize:",_35);
objj_msgSend(_33,"_recalculateIsVertical");
}
}),new objj_method(sel_getUid("_recalculateIsVertical"),function(_36,_37){
with(_36){
var _38=objj_msgSend(_36,"bounds"),_39=(_38.size.width),_3a=(_38.size.height);
_isVertical=_39<_3a?1:(_39>_3a?0:-1);
if(_isVertical===1){
objj_msgSend(_36,"setThemeState:",CPThemeStateVertical);
}else{
if(_isVertical===0){
objj_msgSend(_36,"unsetThemeState:",CPThemeStateVertical);
}
}
}
}),new objj_method(sel_getUid("isVertical"),function(_3b,_3c){
with(_3b){
return _isVertical;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_3d,_3e){
with(_3d){
var _3f=objj_msgSend(_3d,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","track-view",CPWindowBelow,"knob-view");
if(_3f){
objj_msgSend(_3f,"setBackgroundColor:",objj_msgSend(_3d,"currentValueForThemeAttribute:","track-color"));
}
var _40=objj_msgSend(_3d,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","knob-view",CPWindowAbove,"track-view");
if(_40){
objj_msgSend(_40,"setBackgroundColor:",objj_msgSend(_3d,"currentValueForThemeAttribute:","knob-color"));
}
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(_41,_42){
with(_41){
return YES;
}
}),new objj_method(sel_getUid("_valueAtPoint:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(_43,"bounds"),_47=objj_msgSend(_43,"knobRectForBounds:",_46),_48=objj_msgSend(_43,"trackRectForBounds:",_46);
if(objj_msgSend(_43,"hasThemeState:",CPThemeStateCircular)){
var _49=(_47.size.width);
_48.origin.x+=_49/2;
_48.size.width-=_49;
var _4a=objj_msgSend(_43,"minValue"),dx=_45.x-(_48.origin.x+(_48.size.width)/2),dy=_45.y-(_48.origin.y+(_48.size.height)/2);
return MAX(0,MIN(1,1-(3*PI_2-ATAN2(dy,dx))%PI2/PI2))*(objj_msgSend(_43,"maxValue")-_4a)+_4a;
}else{
if(objj_msgSend(_43,"isVertical")){
var _4d=(_47.size.height);
_48.origin.y+=_4d/2;
_48.size.height-=_4d;
var _4a=objj_msgSend(_43,"minValue");
return MAX(0,MIN(1,(_45.y-(_48.origin.y))/(_48.size.height)))*(objj_msgSend(_43,"maxValue")-_4a)+_4a;
}else{
var _49=(_47.size.width);
_48.origin.x+=_49/2;
_48.size.width-=_49;
var _4a=objj_msgSend(_43,"minValue");
return MAX(0,MIN(1,(_45.x-(_48.origin.x))/(_48.size.width)))*(objj_msgSend(_43,"maxValue")-_4a)+_4a;
}
}
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_4e,_4f,_50){
with(_4e){
var _51=objj_msgSend(_4e,"bounds"),_52=objj_msgSend(_4e,"knobRectForBounds:",{origin:{x:_51.origin.x,y:_51.origin.y},size:{width:_51.size.width,height:_51.size.height}});
if((_50.x>=(_52.origin.x)&&_50.y>=(_52.origin.y)&&_50.x<(_52.origin.x+_52.size.width)&&_50.y<(_52.origin.y+_52.size.height))){
_dragOffset={width:(_52.origin.x+(_52.size.width)/2)-_50.x,height:(_52.origin.y+(_52.size.height)/2)-_50.y};
}else{
var _53=objj_msgSend(_4e,"trackRectForBounds:",_51);
if(_53&&(_50.x>=(_53.origin.x)&&_50.y>=(_53.origin.y)&&_50.x<(_53.origin.x+_53.size.width)&&_50.y<(_53.origin.y+_53.size.height))){
_dragOffset={width:0,height:0};
objj_msgSend(_4e,"setObjectValue:",objj_msgSend(_4e,"_valueAtPoint:",_50));
}else{
return NO;
}
}
objj_msgSend(_4e,"setHighlighted:",YES);
objj_msgSend(_4e,"setNeedsLayout");
objj_msgSend(_4e,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(_54,_55,_56,_57){
with(_54){
objj_msgSend(_54,"setObjectValue:",objj_msgSend(_54,"_valueAtPoint:",{x:_57.x+_dragOffset.width,y:_57.y+_dragOffset.height}));
return YES;
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_58,_59,_5a,_5b,_5c){
with(_58){
objj_msgSend(_58,"setHighlighted:",NO);
if(objj_msgSend(_target,"respondsToSelector:",sel_getUid("sliderDidFinish:"))){
objj_msgSend(_target,"sliderDidFinish:",_58);
}
objj_msgSend(_58,"setNeedsLayout");
objj_msgSend(_58,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setContinuous:"),function(_5d,_5e,_5f){
with(_5d){
if(_5f){
_sendActionOn|=CPLeftMouseDraggedMask;
}else{
_sendActionOn&=~CPLeftMouseDraggedMask;
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_60,_61){
with(_60){
return "slider";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_62,_63){
with(_62){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil,{width:0,height:0},0,nil],["knob-color","knob-size","track-width","track-color"]);
}
})]);
var _64="CPSliderMinValueKey",_65="CPSliderMaxValueKey",_66="CPSliderAltIncrValueKey";
var _1=objj_getClass("CPSlider");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSlider\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_67,_68,_69){
with(_67){
_minValue=objj_msgSend(_69,"decodeDoubleForKey:",_64);
_maxValue=objj_msgSend(_69,"decodeDoubleForKey:",_65);
_67=objj_msgSendSuper({receiver:_67,super_class:objj_getClass("CPControl")},"initWithCoder:",_69);
if(_67){
_altIncrementValue=objj_msgSend(_69,"decodeDoubleForKey:",_66);
objj_msgSend(_67,"setContinuous:",YES);
objj_msgSend(_67,"_recalculateIsVertical");
objj_msgSend(_67,"setNeedsLayout");
objj_msgSend(_67,"setNeedsDisplay:",YES);
}
return _67;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_6a,_6b,_6c){
with(_6a){
objj_msgSendSuper({receiver:_6a,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_6c);
objj_msgSend(_6c,"encodeDouble:forKey:",_minValue,_64);
objj_msgSend(_6c,"encodeDouble:forKey:",_maxValue,_65);
objj_msgSend(_6c,"encodeDouble:forKey:",_altIncrementValue,_66);
}
})]);
var _1=objj_getClass("CPSlider");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSlider\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("value"),function(_6d,_6e){
with(_6d){
CPLog.warn("[CPSlider value] is deprecated, use doubleValue or objectValue instead.");
return objj_msgSend(_6d,"doubleValue");
}
}),new objj_method(sel_getUid("setValue:"),function(_6f,_70,_71){
with(_6f){
CPLog.warn("[CPSlider setValue:] is deprecated, use setDoubleValue: or setObjectValue: instead.");
objj_msgSend(_6f,"setObjectValue:",_71);
}
})]);
