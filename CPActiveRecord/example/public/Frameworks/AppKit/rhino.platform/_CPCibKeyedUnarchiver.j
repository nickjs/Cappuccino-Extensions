I;30;Foundation/CPKeyedUnarchiver.jc;1437;
var _1=objj_allocateClassPair(CPKeyedUnarchiver,"_CPCibKeyedUnarchiver"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_bundle"),new objj_ivar("_awakenCustomResources"),new objj_ivar("_externalObjectsForProxyIdentifiers")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initForReadingWithData:bundle:awakenCustomResources:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPKeyedUnarchiver")},"initForReadingWithData:",_5);
if(_3){
_bundle=_6;
_awakenCustomResources=_7;
objj_msgSend(_3,"setDelegate:",_3);
}
return _3;
}
}),new objj_method(sel_getUid("bundle"),function(_8,_9){
with(_8){
return _bundle;
}
}),new objj_method(sel_getUid("awakenCustomResources"),function(_a,_b){
with(_a){
return _awakenCustomResources;
}
}),new objj_method(sel_getUid("setExternalObjectsForProxyIdentifiers:"),function(_c,_d,_e){
with(_c){
_externalObjectsForProxyIdentifiers=_e;
}
}),new objj_method(sel_getUid("externalObjectForProxyIdentifier:"),function(_f,_10,_11){
with(_f){
return objj_msgSend(_externalObjectsForProxyIdentifiers,"objectForKey:",_11);
}
}),new objj_method(sel_getUid("replaceObjectAtUID:withObject:"),function(_12,_13,_14,_15){
with(_12){
_objects[_14]=_15;
}
}),new objj_method(sel_getUid("objectAtUID:"),function(_16,_17,_18){
with(_16){
return _objects[_18];
}
})]);
