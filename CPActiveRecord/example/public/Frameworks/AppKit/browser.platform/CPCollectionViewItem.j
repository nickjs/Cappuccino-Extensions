i;18;CPViewController.jc;1163;
var _1=objj_allocateClassPair(CPViewController,"CPCollectionViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_isSelected")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setRepresentedObject:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPViewController")},"setRepresentedObject:",_5);
var _6=objj_msgSend(_3,"view");
if(objj_msgSend(_6,"respondsToSelector:",sel_getUid("setRepresentedObject:"))){
objj_msgSend(_6,"setRepresentedObject:",objj_msgSend(_3,"representedObject"));
}
}
}),new objj_method(sel_getUid("setSelected:"),function(_7,_8,_9){
with(_7){
_9=!!_9;
if(_isSelected===_9){
return;
}
_isSelected=_9;
var _a=objj_msgSend(_7,"view");
if(objj_msgSend(_a,"respondsToSelector:",sel_getUid("setSelected:"))){
objj_msgSend(_a,"setSelected:",objj_msgSend(_7,"isSelected"));
}
}
}),new objj_method(sel_getUid("isSelected"),function(_b,_c){
with(_b){
return _isSelected;
}
}),new objj_method(sel_getUid("collectionView"),function(_d,_e){
with(_d){
return objj_msgSend(_view,"superview");
}
})]);
