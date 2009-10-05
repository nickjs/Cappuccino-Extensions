I;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;2848;
var _1="_CPCibCustomResourceClassNameKey",_2="_CPCibCustomResourceResourceNameKey",_3="_CPCibCustomResourcePropertiesKey";
var _4=objj_allocateClassPair(CPObject,"_CPCibCustomResource"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_className"),new objj_ivar("_resourceName"),new objj_ivar("_properties")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithClassName:resourceName:properties:"),function(_6,_7,_8,_9,_a){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPObject")},"init");
if(_6){
_className=_8;
_resourceName=_9;
_properties=_a;
}
return _6;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPObject")},"init");
if(_b){
_className=objj_msgSend(_d,"decodeObjectForKey:",_1);
_resourceName=objj_msgSend(_d,"decodeObjectForKey:",_2);
_properties=objj_msgSend(_d,"decodeObjectForKey:",_3);
}
return _b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_10,"encodeObject:forKey:",_className,_1);
objj_msgSend(_10,"encodeObject:forKey:",_resourceName,_2);
objj_msgSend(_10,"encodeObject:forKey:",_properties,_3);
}
}),new objj_method(sel_getUid("awakeAfterUsingCoder:"),function(_11,_12,_13){
with(_11){
if(objj_msgSend(_13,"respondsToSelector:",sel_getUid("bundle"))&&(!objj_msgSend(_13,"respondsToSelector:",sel_getUid("awakenCustomResources"))||objj_msgSend(_13,"awakenCustomResources"))){
if(_className==="CPImage"){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(_13,"bundle"),"pathForResource:",_resourceName),objj_msgSend(_properties,"objectForKey:","size"));
}
}
return _11;
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("imageResourceWithName:size:"),function(_14,_15,_16,_17){
with(_14){
return objj_msgSend(objj_msgSend(_14,"alloc"),"initWithClassName:resourceName:properties:","CPImage",_16,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_17,"size"));
}
})]);
var _4=objj_getClass("_CPCibCustomResource");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibCustomResource\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("filename"),function(_18,_19){
with(_18){
return objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_resourceName);
}
}),new objj_method(sel_getUid("size"),function(_1a,_1b){
with(_1a){
return objj_msgSend(_properties,"objectForKey:","size");
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_1c,_1d){
with(_1c){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_1e,_1f){
with(_1e){
return NO;
}
})]);
