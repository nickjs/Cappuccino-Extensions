I;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;1259;
var _1="_CPCibClassSwapperClassNameKey",_2="_CPCibClassSwapperOriginalClassNameKey";
var _3=objj_allocateClassPair(CPObject,"_CPCibClassSwapper"),_4=_3.isa;
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("allocObjectWithCoder:className:"),function(_5,_6,_7,_8){
with(_5){
var _9=objj_msgSend(_7,"classForClassName:",_8);
if(!_9){
_9=objj_lookUpClass(_8);
if(!_9){
return nil;
}
}
return objj_msgSend(_9,"alloc");
}
}),new objj_method(sel_getUid("allocWithCoder:"),function(_a,_b,_c){
with(_a){
if(objj_msgSend(_c,"respondsToSelector:",sel_getUid("usesOriginalClasses"))&&objj_msgSend(_c,"usesOriginalClasses")){
var _d=objj_msgSend(_c,"decodeObjectForKey:",_2),_e=objj_msgSend(_a,"allocObjectWithCoder:className:",_c,_d);
}else{
var _d=objj_msgSend(_c,"decodeObjectForKey:",_1),_e=objj_msgSend(_a,"allocObjectWithCoder:className:",_c,_d);
if(!_e){
CPLog.error("Unable to find class "+_d+" in cib file.");
_e=objj_msgSend(_a,"allocObjectWithCoder:className:",_c,objj_msgSend(_c,"decodeObjectForKey:",_2));
}
}
if(!_e){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unable to find class "+_d+" in cib file.");
}
return _e;
}
})]);
