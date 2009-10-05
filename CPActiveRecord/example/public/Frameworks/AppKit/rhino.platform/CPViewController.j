I;20;AppKit/CPResponder.jc;3974;
var _1=objj_allocateClassPair(CPResponder,"CPViewController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_view"),new objj_ivar("_representedObject"),new objj_ivar("_title"),new objj_ivar("_cibName"),new objj_ivar("_cibBundle"),new objj_ivar("_cibExternalNameTable")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("representedObject"),function(_3,_4){
with(_3){
return _representedObject;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_5,_6,_7){
with(_5){
_representedObject=_7;
}
}),new objj_method(sel_getUid("title"),function(_8,_9){
with(_8){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_a,_b,_c){
with(_a){
_title=_c;
}
}),new objj_method(sel_getUid("cibName"),function(_d,_e){
with(_d){
return _cibName;
}
}),new objj_method(sel_getUid("cibBundle"),function(_f,_10){
with(_f){
return _cibBundle;
}
}),new objj_method(sel_getUid("cibExternalNameTable"),function(_11,_12){
with(_11){
return _cibExternalNameTable;
}
}),new objj_method(sel_getUid("init"),function(_13,_14){
with(_13){
return objj_msgSend(_13,"initWithCibName:bundle:",nil,nil);
}
}),new objj_method(sel_getUid("initWithCibName:bundle:"),function(_15,_16,_17,_18){
with(_15){
return objj_msgSend(_15,"initWithCibName:bundle:externalNameTable:",_17,_18,nil);
}
}),new objj_method(sel_getUid("initWithCibName:bundle:owner:"),function(_19,_1a,_1b,_1c,_1d){
with(_19){
return objj_msgSend(_19,"initWithCibName:bundle:externalNameTable:",_1b,_1c,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_1d,CPCibOwner));
}
}),new objj_method(sel_getUid("initWithCibName:bundle:externalNameTable:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
_1e=objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("CPResponder")},"init");
if(_1e){
_cibName=_20;
_cibBundle=_21||objj_msgSend(CPBundle,"mainBundle");
_cibExternalNameTable=_22||objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_1e,CPCibOwner);
}
return _1e;
}
}),new objj_method(sel_getUid("loadView"),function(_23,_24){
with(_23){
if(_view){
return;
}
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",objj_msgSend(_cibBundle,"pathForResource:",_cibName+".cib"));
objj_msgSend(cib,"instantiateCibWithExternalNameTable:",_cibExternalNameTable);
}
}),new objj_method(sel_getUid("view"),function(_26,_27){
with(_26){
if(!_view){
var _28=objj_msgSend(_cibExternalNameTable,"objectForKey:",CPCibOwner);
if(objj_msgSend(_28,"respondsToSelector:",sel_getUid("viewControllerWillLoadCib:"))){
objj_msgSend(_28,"viewControllerWillLoadCib:",_26);
}
objj_msgSend(_26,"loadView");
if(_view===nil&&objj_msgSend(_28,"isKindOfClass:",objj_msgSend(CPDocument,"class"))){
objj_msgSend(_26,"setView:",objj_msgSend(_28,"valueForKey:","view"));
}
if(objj_msgSend(_28,"respondsToSelector:",sel_getUid("viewControllerDidLoadCib:"))){
objj_msgSend(_28,"viewControllerDidLoadCib:",_26);
}
}
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_29,_2a,_2b){
with(_29){
_view=_2b;
}
})]);
var _2c="CPViewControllerViewKey",_2d="CPViewControllerTitleKey";
var _1=objj_getClass("CPViewController");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPViewController\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_2e,_2f,_30){
with(_2e){
_2e=objj_msgSendSuper({receiver:_2e,super_class:objj_getClass("CPResponder")},"initWithCoder:",_30);
if(_2e){
_view=objj_msgSend(_30,"decodeObjectForKey:",_2c);
_title=objj_msgSend(_30,"decodeObjectForKey:",_2d);
}
return _2e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_31,_32,_33){
with(_31){
objj_msgSendSuper({receiver:_31,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_33);
objj_msgSend(_33,"encodeObject:forKey:",_view,_2c);
objj_msgSend(_33,"encodeObject:forKey:",_title,_2d);
}
})]);
