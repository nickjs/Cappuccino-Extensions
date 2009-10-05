I;21;Foundation/CPObject.jc;1705;
var _1="_CPCibCustomObjectClassName";
var _2=objj_allocateClassPair(CPObject,"_CPCibCustomObject"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_className")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("customClassName"),function(_4,_5){
with(_4){
return _className;
}
}),new objj_method(sel_getUid("setCustomClassName:"),function(_6,_7,_8){
with(_6){
_className=_8;
}
}),new objj_method(sel_getUid("description"),function(_9,_a){
with(_9){
return objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"description")+" ("+objj_msgSend(_9,"customClassName")+")";
}
})]);
var _2=objj_getClass("_CPCibCustomObject");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibCustomObject\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPObject")},"init");
if(_b){
_className=objj_msgSend(_d,"decodeObjectForKey:",_1);
}
return _b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_10,"encodeObject:forKey:",_className,_1);
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_11,_12){
with(_11){
var _13=CPClassFromString(_className);
if(_13===objj_msgSend(_11,"class")){
_className="CPObject";
return _11;
}
if(!_13){
_13=objj_msgSend(CPObject,"class");
}
if(_13===objj_msgSend(CPApplication,"class")){
return objj_msgSend(CPApplication,"sharedApplication");
}
return objj_msgSend(objj_msgSend(_13,"alloc"),"init");
}
})]);
