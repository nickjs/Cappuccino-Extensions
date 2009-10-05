I;15;AppKit/CPView.jc;882;
var _1=objj_allocateClassPair(CPView,"BKThemedObjectTemplate"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_label"),new objj_ivar("_themedObject")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"init");
if(_3){
_label=objj_msgSend(_5,"decodeObjectForKey:","BKThemedObjectTemplateLabel");
_themedObject=objj_msgSend(_5,"decodeObjectForKey:","BKThemedObjectTemplateThemedObject");
}
return _3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_6,_7,_8){
with(_6){
objj_msgSend(_8,"encodeObject:forKey:",_label,"BKThemedObjectTemplateLabel");
objj_msgSend(_8,"encodeObject:forKey:",_themedObject,"BKThemedObjectTemplateThemedObject");
}
})]);
