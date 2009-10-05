I;21;Foundation/CPObject.jI;15;AppKit/CPView.jc;2568;
CPSelectedTab=0;
CPBackgroundTab=1;
CPPressedTab=2;
var _1=objj_allocateClassPair(CPObject,"CPTabViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier"),new objj_ivar("_label"),new objj_ivar("_view"),new objj_ivar("_auxiliaryView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithIdentifier:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_identifier=_5;
}
return _3;
}
}),new objj_method(sel_getUid("setLabel:"),function(_6,_7,_8){
with(_6){
_label=_8;
}
}),new objj_method(sel_getUid("label"),function(_9,_a){
with(_9){
return _label;
}
}),new objj_method(sel_getUid("tabState"),function(_b,_c){
with(_b){
return _tabState;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_d,_e,_f){
with(_d){
_identifier=_f;
}
}),new objj_method(sel_getUid("identifier"),function(_10,_11){
with(_10){
return _identifier;
}
}),new objj_method(sel_getUid("setView:"),function(_12,_13,_14){
with(_12){
_view=_14;
}
}),new objj_method(sel_getUid("view"),function(_15,_16){
with(_15){
return _view;
}
}),new objj_method(sel_getUid("setAuxiliaryView:"),function(_17,_18,_19){
with(_17){
_auxiliaryView=_19;
}
}),new objj_method(sel_getUid("auxiliaryView"),function(_1a,_1b){
with(_1a){
return _auxiliaryView;
}
}),new objj_method(sel_getUid("tabView"),function(_1c,_1d){
with(_1c){
return _tabView;
}
})]);
var _1e="CPTabViewItemIdentifierKey",_1f="CPTabViewItemLabelKey",_20="CPTabViewItemViewKey",_21="CPTabViewItemAuxViewKey";
var _1=objj_getClass("CPTabViewItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTabViewItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_22,_23,_24){
with(_22){
_22=objj_msgSendSuper({receiver:_22,super_class:objj_getClass("CPObject")},"init");
if(_22){
_identifier=objj_msgSend(_24,"decodeObjectForKey:",_1e);
_label=objj_msgSend(_24,"decodeObjectForKey:",_1f);
_view=objj_msgSend(_24,"decodeObjectForKey:",_20);
_auxiliaryView=objj_msgSend(_24,"decodeObjectForKey:",_21);
}
return _22;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_27,"encodeObject:forKey:",_identifier,_1e);
objj_msgSend(_27,"encodeObject:forKey:",_label,_1f);
objj_msgSend(_27,"encodeObject:forKey:",_view,_20);
objj_msgSend(_27,"encodeObject:forKey:",_auxiliaryView,_21);
}
})]);
