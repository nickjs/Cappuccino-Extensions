i;16;CPCibConnector.jc;1599;
var _1=objj_allocateClassPair(CPCibConnector,"CPCibControlConnector"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("establishConnection"),function(_3,_4){
with(_3){
var _5=_label,_6=objj_msgSend(_5,"length");
if(_6&&_5[_6-1]!==":"){
_5+=":";
}
var _7=CPSelectorFromString(_5);
if(!_7){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_3,"className")+" "+_4+"] selector "+_5+" does not exist.");
}
if(_destination&&!objj_msgSend(_destination,"respondsToSelector:",_7)){
CPLog.warn("Could not connect the action "+_7+" to target of class "+objj_msgSend(_destination,"className"));
return;
}
if(objj_msgSend(_source,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_source,sel_getUid("setAction:"),_7);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_3,"className")+" "+_4+"] "+objj_msgSend(_source,"description")+" does not respond to setAction:");
}
if(objj_msgSend(_source,"respondsToSelector:",sel_getUid("setTarget:"))){
objj_msgSend(_source,sel_getUid("setTarget:"),_destination);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_3,"className")+" "+_4+"] "+objj_msgSend(_source,"description")+" does not respond to setTarget:");
}
}
})]);
var _1=objj_allocateClassPair(CPCibControlConnector,"_CPCibControlConnector"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
