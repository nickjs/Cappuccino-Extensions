I;21;Foundation/CPObject.jc;982;
var _1=objj_allocateClassPair(CPObject,"CPPlatform"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("bootstrap"),function(_3,_4){
with(_3){
objj_msgSend(CPPlatformString,"bootstrap");
objj_msgSend(CPPlatformWindow,"setPrimaryPlatformWindow:",objj_msgSend(objj_msgSend(CPPlatformWindow,"alloc"),"_init"));
}
}),new objj_method(sel_getUid("isBrowser"),function(_5,_6){
with(_5){
return typeof window.cpIsDesktop==="undefined";
}
}),new objj_method(sel_getUid("supportsDragAndDrop"),function(_7,_8){
with(_7){
return CPFeatureIsCompatible(CPHTMLDragAndDropFeature);
}
}),new objj_method(sel_getUid("supportsNativeMainMenu"),function(_9,_a){
with(_9){
return (typeof window["cpSetMainMenu"]==="function");
}
}),new objj_method(sel_getUid("terminateApplication"),function(_b,_c){
with(_b){
if(typeof window["cpTerminate"]==="function"){
window.cpTerminate();
}
}
})]);
