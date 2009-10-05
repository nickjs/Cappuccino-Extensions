I;16;AppKit/CPPanel.jc;1980;
var _1=nil;
var _2=objj_allocateClassPair(CPPanel,"CPOpenPanel"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_files"),new objj_ivar("_canChooseFiles"),new objj_ivar("_canChooseDirectories"),new objj_ivar("_allowsMultipleSelection")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("canChooseFiles"),function(_4,_5){
with(_4){
return _canChooseFiles;
}
}),new objj_method(sel_getUid("setCanChooseFiles:"),function(_6,_7,_8){
with(_6){
_canChooseFiles=_8;
}
}),new objj_method(sel_getUid("canChooseDirectories"),function(_9,_a){
with(_9){
return _canChooseDirectories;
}
}),new objj_method(sel_getUid("setCanChooseDirectories:"),function(_b,_c,_d){
with(_b){
_canChooseDirectories=_d;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_e,_f){
with(_e){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_10,_11,_12){
with(_10){
_allowsMultipleSelection=_12;
}
}),new objj_method(sel_getUid("init"),function(_13,_14){
with(_13){
if(_13=objj_msgSendSuper({receiver:_13,super_class:objj_getClass("CPPanel")},"init")){
_files=[];
_canChooseFiles=YES;
}
return _13;
}
}),new objj_method(sel_getUid("filenames"),function(_15,_16){
with(_15){
return _files;
}
}),new objj_method(sel_getUid("runModalForDirectory:file:types:"),function(_17,_18,_19,_1a,_1b){
with(_17){
if(window.Titanium){
_files=Titanium.Desktop.openFiles({path:_19,types:_1b,multiple:_allowsMultipleSelection,filename:_1a,directories:_canChooseDirectories,files:_canChooseFiles});
}
}
}),new objj_method(sel_getUid("runModalForTypes:"),function(_1c,_1d,_1e){
with(_1c){
alert("HERE");
objj_msgSend(_1c,"runModalForDirectory:file:types:","/",nil,_1e);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("openPanel"),function(_1f,_20){
with(_1f){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPOpenPanel,"alloc"),"init");
}
return _1;
}
})]);
