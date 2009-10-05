i;10;CPObject.ji;10;CPString.jc;2225;
var _1=objj_allocateClassPair(CPObject,"CPData"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_plistObject")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
string=_5;
}
return _3;
}
}),new objj_method(sel_getUid("initWithPlistObject:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPObject")},"init");
if(_6){
_plistObject=_8;
}
return _6;
}
}),new objj_method(sel_getUid("length"),function(_9,_a){
with(_9){
return objj_msgSend(objj_msgSend(_9,"string"),"length");
}
}),new objj_method(sel_getUid("description"),function(_b,_c){
with(_b){
return string;
}
}),new objj_method(sel_getUid("string"),function(_d,_e){
with(_d){
if(!string&&_plistObject){
string=objj_msgSend(objj_msgSend(CPPropertyListSerialization,"dataFromPropertyList:format:errorDescription:",_plistObject,CPPropertyList280NorthFormat_v1_0,NULL),"string");
}
return string;
}
}),new objj_method(sel_getUid("setString:"),function(_f,_10,_11){
with(_f){
string=_11;
_plistObject=nil;
}
}),new objj_method(sel_getUid("plistObject"),function(_12,_13){
with(_12){
if(string&&!_plistObject){
_plistObject=objj_msgSend(CPPropertyListSerialization,"propertyListFromData:format:errorDescription:",_12,0,NULL);
}
return _plistObject;
}
}),new objj_method(sel_getUid("setPlistObject:"),function(_14,_15,_16){
with(_14){
string=nil;
_plistObject=_16;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_17,_18){
with(_17){
return new objj_data();
}
}),new objj_method(sel_getUid("data"),function(_19,_1a){
with(_19){
return objj_msgSend(objj_msgSend(_19,"alloc"),"initWithPlistObject:",nil);
}
}),new objj_method(sel_getUid("dataWithString:"),function(_1b,_1c,_1d){
with(_1b){
return objj_msgSend(objj_msgSend(_1b,"alloc"),"initWithString:",_1d);
}
}),new objj_method(sel_getUid("dataWithPlistObject:"),function(_1e,_1f,_20){
with(_1e){
return objj_msgSend(objj_msgSend(_1e,"alloc"),"initWithPlistObject:",_20);
}
})]);
objj_data.prototype.isa=CPData;
