I;21;Foundation/CPObject.jc;402;
var _1=objj_allocateClassPair(CPObject,"CPPlatformString"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("bootstrap"),function(_3,_4){
with(_3){
}
}),new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"),function(_5,_6,_7,_8,_9){
with(_5){
return {width:0,height:0};
}
})]);
