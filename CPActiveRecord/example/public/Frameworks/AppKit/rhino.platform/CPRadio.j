I;21;Foundation/CPObject.jI;18;Foundation/CPSet.ji;10;CPButton.jc;5034;
var _1=objj_allocateClassPair(CPButton,"CPRadio"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_radioGroup")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:radioGroup:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPButton")},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setRadioGroup:",_6||objj_msgSend(CPRadioGroup,"new"));
objj_msgSend(_3,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_3,"setShowsStateBy:",CPContentsCellMask);
objj_msgSend(_3,"setImagePosition:",CPImageLeft);
objj_msgSend(_3,"setAlignment:",CPLeftTextAlignment);
objj_msgSend(_3,"setBordered:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"initWithFrame:radioGroup:",_9,nil);
}
}),new objj_method(sel_getUid("nextState"),function(_a,_b){
with(_a){
return CPOnState;
}
}),new objj_method(sel_getUid("setRadioGroup:"),function(_c,_d,_e){
with(_c){
if(_radioGroup===_e){
return;
}
objj_msgSend(_radioGroup,"_removeRadio:",_c);
_radioGroup=_e;
objj_msgSend(_radioGroup,"_addRadio:",_c);
}
}),new objj_method(sel_getUid("radioGroup"),function(_f,_10){
with(_f){
return _radioGroup;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_11,_12,_13){
with(_11){
objj_msgSendSuper({receiver:_11,super_class:objj_getClass("CPButton")},"setObjectValue:",_13);
if(objj_msgSend(_11,"state")===CPOnState){
objj_msgSend(_radioGroup,"_setSelectedRadio:",_11);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("radioWithTitle:theme:"),function(_14,_15,_16,_17){
with(_14){
return objj_msgSend(_14,"buttonWithTitle:theme:",_16,_17);
}
}),new objj_method(sel_getUid("radioWithTitle:"),function(_18,_19,_1a){
with(_18){
return objj_msgSend(_18,"buttonWithTitle:",_1a);
}
}),new objj_method(sel_getUid("standardButtonWithTitle:"),function(_1b,_1c,_1d){
with(_1b){
var _1e=objj_msgSend(objj_msgSend(CPRadio,"alloc"),"init");
objj_msgSend(_1e,"setTitle:",_1d);
return _1e;
}
}),new objj_method(sel_getUid("themeClass"),function(_1f,_20){
with(_1f){
return "radio";
}
})]);
var _21="CPRadioRadioGroupKey";
var _1=objj_getClass("CPRadio");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPRadio\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_22,_23,_24){
with(_22){
_22=objj_msgSendSuper({receiver:_22,super_class:objj_getClass("CPButton")},"initWithCoder:",_24);
if(_22){
_radioGroup=objj_msgSend(_24,"decodeObjectForKey:",_21);
}
return _22;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_25,_26,_27){
with(_25){
objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPButton")},"encodeWithCoder:",_27);
objj_msgSend(_27,"encodeObject:forKey:",_radioGroup,_21);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPRadioGroup"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_radios"),new objj_ivar("_selectedRadio")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_28,_29){
with(_28){
_28=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("CPObject")},"init");
if(_28){
_radios=objj_msgSend(CPSet,"set");
_selectedRadio=nil;
}
return _28;
}
}),new objj_method(sel_getUid("_addRadio:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_radios,"addObject:",_2c);
if(objj_msgSend(_2c,"state")===CPOnState){
objj_msgSend(_2a,"_setSelectedRadio:",_2c);
}
}
}),new objj_method(sel_getUid("_removeRadio:"),function(_2d,_2e,_2f){
with(_2d){
if(_selectedRadio===_2f){
_selectedRadio=nil;
}
objj_msgSend(_radios,"removeObject:",_2f);
}
}),new objj_method(sel_getUid("_setSelectedRadio:"),function(_30,_31,_32){
with(_30){
if(_selectedRadio===_32){
return;
}
objj_msgSend(_selectedRadio,"setState:",CPOffState);
_selectedRadio=_32;
}
}),new objj_method(sel_getUid("selectedRadio"),function(_33,_34){
with(_33){
return _selectedRadio;
}
}),new objj_method(sel_getUid("radios"),function(_35,_36){
with(_35){
return objj_msgSend(_radios,"allObjects");
}
})]);
var _37="CPRadioGroupRadiosKey",_38="CPRadioGroupSelectedRadioKey";
var _1=objj_getClass("CPRadioGroup");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPRadioGroup\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_39,_3a,_3b){
with(_39){
_39=objj_msgSendSuper({receiver:_39,super_class:objj_getClass("CPObject")},"init");
if(_39){
_radios=objj_msgSend(_3b,"decodeObjectForKey:",_37);
_selectedRadio=objj_msgSend(_3b,"decodeObjectForKey:",_38);
}
return _39;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(_3e,"encodeObject:forKey:",_radios,_37);
objj_msgSend(_3e,"encodeObject:forKey:",_selectedRadio,_38);
}
})]);
