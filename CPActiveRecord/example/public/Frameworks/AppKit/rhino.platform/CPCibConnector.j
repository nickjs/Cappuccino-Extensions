I;21;Foundation/CPObject.jI;29;Foundation/CPKeyValueCoding.jc;2366;
var _1="_CPCibConnectorSourceKey",_2="_CPCibConnectorDestinationKey",_3="_CPCibConnectorLabelKey";
var _4=objj_allocateClassPair(CPObject,"CPCibConnector"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_source"),new objj_ivar("_destination"),new objj_ivar("_label")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("source"),function(_6,_7){
with(_6){
return _source;
}
}),new objj_method(sel_getUid("setSource:"),function(_8,_9,_a){
with(_8){
_source=_a;
}
}),new objj_method(sel_getUid("destination"),function(_b,_c){
with(_b){
return _destination;
}
}),new objj_method(sel_getUid("setDestination:"),function(_d,_e,_f){
with(_d){
_destination=_f;
}
}),new objj_method(sel_getUid("label"),function(_10,_11){
with(_10){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_12,_13,_14){
with(_12){
_label=_14;
}
}),new objj_method(sel_getUid("replaceObject:withObject:"),function(_15,_16,_17,_18){
with(_15){
if(_source===_17){
_source=_18;
}
if(_destination===_17){
_destination=_18;
}
}
}),new objj_method(sel_getUid("replaceObjects:"),function(_19,_1a,_1b){
with(_19){
var _1c=_1b[objj_msgSend(_source,"UID")];
if(_1c!==undefined){
_source=_1c;
}
_1c=_1b[objj_msgSend(_destination,"UID")];
if(_1c!==undefined){
_destination=_1c;
}
}
})]);
var _4=objj_getClass("CPCibConnector");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCibConnector\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_1d,_1e,_1f){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPObject")},"init");
if(_1d){
_source=objj_msgSend(_1f,"decodeObjectForKey:",_1);
_destination=objj_msgSend(_1f,"decodeObjectForKey:",_2);
_label=objj_msgSend(_1f,"decodeObjectForKey:",_3);
}
return _1d;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_22,"encodeObject:forKey:",_source,_1);
objj_msgSend(_22,"encodeObject:forKey:",_destination,_2);
objj_msgSend(_22,"encodeObject:forKey:",_label,_3);
}
})]);
var _4=objj_allocateClassPair(CPCibConnector,"_CPCibConnector"),_5=_4.isa;
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
