i;10;CPButton.jc;1040;
var _1=objj_allocateClassPair(CPButton,"CPCheckBox"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPButton")},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_3,"setShowsStateBy:",CPContentsCellMask);
objj_msgSend(_3,"setImagePosition:",CPImageLeft);
objj_msgSend(_3,"setAlignment:",CPLeftTextAlignment);
objj_msgSend(_3,"setBordered:",YES);
}
return _3;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("checkBoxWithTitle:theme:"),function(_6,_7,_8,_9){
with(_6){
return objj_msgSend(_6,"buttonWithTitle:theme:",_8,_9);
}
}),new objj_method(sel_getUid("checkBoxWithTitle:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"buttonWithTitle:",_c);
}
}),new objj_method(sel_getUid("themeClass"),function(_d,_e){
with(_d){
return "check-box";
}
})]);
