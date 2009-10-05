i;8;CPView.jc;461;
var _1=objj_allocateClassPair(CPView,"_CPCornerView"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5)){
objj_msgSend(_3,"setBackgroundColor:",objj_msgSend(CPColor,"purpleColor"));
}
return _3;
}
})]);
