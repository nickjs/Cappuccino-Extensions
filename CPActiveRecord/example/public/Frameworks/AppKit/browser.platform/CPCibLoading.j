I;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;2894;
var _1="CPCibOwner";
var _2={};
var _3=objj_getClass("CPObject");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("awakeFromCib"),function(_5,_6){
with(_5){
}
})]);
var _3=objj_getClass("CPBundle");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPBundle\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("loadCibFile:externalNameTable:"),function(_7,_8,_9,_a){
with(_7){
objj_msgSend(objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",_9),"instantiateCibWithExternalNameTable:",_a);
}
}),new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"),function(_b,_c,_d,_e,_f){
with(_b){
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithCibNamed:bundle:loadDelegate:",_d,_b,objj_msgSend(_b,"class"));
_2[objj_msgSend(cib,"UID")]={loadDelegate:_f,externalNameTable:_e};
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("loadCibFile:externalNameTable:"),function(_11,_12,_13,_14){
with(_11){
objj_msgSend(objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",_13),"instantiateCibWithExternalNameTable:",_14);
}
}),new objj_method(sel_getUid("loadCibNamed:owner:"),function(_15,_16,_17,_18){
with(_15){
if(!objj_msgSend(_17,"hasSuffix:",".cib")){
_17=objj_msgSend(_17,"stringByAppendingString:",".cib");
}
var _19=_18?objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_18,"class")):objj_msgSend(CPBundle,"mainBundle"),_1a=objj_msgSend(_19,"pathForResource:",_17);
objj_msgSend(_15,"loadCibFile:externalNameTable:",_1a,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_18,_1));
}
}),new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"),function(_1b,_1c,_1d,_1e,_1f){
with(_1b){
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:loadDelegate:",_1d,_1b);
_2[objj_msgSend(cib,"UID")]={loadDelegate:_1f,externalNameTable:_1e};
}
}),new objj_method(sel_getUid("loadCibNamed:owner:loadDelegate:"),function(_21,_22,_23,_24,_25){
with(_21){
if(!objj_msgSend(_23,"hasSuffix:",".cib")){
_23=objj_msgSend(_23,"stringByAppendingString:",".cib");
}
var _26=_24?objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_24,"class")):objj_msgSend(CPBundle,"mainBundle"),_27=objj_msgSend(_26,"pathForResource:",_23);
objj_msgSend(_21,"loadCibFile:externalNameTable:loadDelegate:",_27,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_24,_1),_25);
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_28,_29,_2a){
with(_28){
var _2b=_2[objj_msgSend(_2a,"UID")];
delete _2[objj_msgSend(_2a,"UID")];
objj_msgSend(_2a,"instantiateCibWithExternalNameTable:",_2b.externalNameTable);
objj_msgSend(_2b.loadDelegate,"cibDidFinishLoading:",_2a);
}
})]);
