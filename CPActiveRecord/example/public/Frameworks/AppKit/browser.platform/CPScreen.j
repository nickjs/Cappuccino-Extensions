I;21;Foundation/CPObject.jc;408;
var _1=objj_allocateClassPair(CPObject,"CPScreen"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("visibleFrame"),function(_3,_4){
with(_3){
return {origin:{x:window.screen.availLeft,y:window.screen.availTop},size:{width:window.screen.availWidth,height:window.screen.availHeight}};
}
})]);
