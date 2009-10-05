I;21;Foundation/CPObject.jc;1158;
var _1=objj_allocateClassPair(CPObject,"CPPlatform"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("bootstrap"),function(_3,_4){
with(_3){
var _5=document.getElementsByTagName("body")[0];
_5.innerHTML="";
_5.style.overflow="hidden";
if(document.documentElement){
document.documentElement.style.overflow="hidden";
}
objj_msgSend(CPPlatformString,"bootstrap");
objj_msgSend(CPPlatformWindow,"setPrimaryPlatformWindow:",objj_msgSend(objj_msgSend(CPPlatformWindow,"alloc"),"_init"));
}
}),new objj_method(sel_getUid("isBrowser"),function(_6,_7){
with(_6){
return typeof window.cpIsDesktop==="undefined";
}
}),new objj_method(sel_getUid("supportsDragAndDrop"),function(_8,_9){
with(_8){
return CPFeatureIsCompatible(CPHTMLDragAndDropFeature);
}
}),new objj_method(sel_getUid("supportsNativeMainMenu"),function(_a,_b){
with(_a){
return (typeof window["cpSetMainMenu"]==="function");
}
}),new objj_method(sel_getUid("terminateApplication"),function(_c,_d){
with(_c){
if(typeof window["cpTerminate"]==="function"){
window.cpTerminate();
}
}
})]);
