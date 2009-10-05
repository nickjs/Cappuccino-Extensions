I;21;Foundation/CPObject.jc;841;
var _1=objj_allocateClassPair(CPObject,"BKThemeTemplate"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_description")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_name=objj_msgSend(_5,"decodeObjectForKey:","BKThemeTemplateName");
_description=objj_msgSend(_5,"decodeObjectForKey:","BKThemeTemplateDescription");
}
return _3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_6,_7,_8){
with(_6){
objj_msgSend(_8,"encodeObject:forKey:",_name,"BKThemeTemplateName");
objj_msgSend(_8,"encodeObject:forKey:",_description,"BKThemeTemplateDescription");
}
})]);
