I;21;Foundation/CPObject.jc;1021;
var _1=objj_allocateClassPair(CPObject,"_CPCibProxyObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var _3="CPIdentifier";
var _1=objj_getClass("_CPCibProxyObject");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibProxyObject\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_identifier=objj_msgSend(_6,"decodeObjectForKey:",_3);
}
if(objj_msgSend(_6,"respondsToSelector:",sel_getUid("externalObjectForProxyIdentifier:"))){
return objj_msgSend(_6,"externalObjectForProxyIdentifier:",_identifier);
}
return _4;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7,_8,_9){
with(_7){
objj_msgSend(_9,"encodeObject:forKey:",_identifier,_3);
}
})]);
