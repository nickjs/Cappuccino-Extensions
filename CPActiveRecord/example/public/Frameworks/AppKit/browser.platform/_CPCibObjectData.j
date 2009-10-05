I;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;7;CPCib.ji;16;CPCibConnector.ji;23;CPCibControlConnector.ji;22;CPCibOutletConnector.jc;5807;
var _1=objj_allocateClassPair(CPObject,"_CPCibObjectData"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_namesKeys"),new objj_ivar("_namesValues"),new objj_ivar("_accessibilityConnectors"),new objj_ivar("_accessibilityOidsKeys"),new objj_ivar("_accessibilityOidsValues"),new objj_ivar("_classesKeys"),new objj_ivar("_classesValues"),new objj_ivar("_connections"),new objj_ivar("_fontManager"),new objj_ivar("_framework"),new objj_ivar("_nextOid"),new objj_ivar("_objectsKeys"),new objj_ivar("_objectsValues"),new objj_ivar("_oidKeys"),new objj_ivar("_oidValues"),new objj_ivar("_fileOwner"),new objj_ivar("_visibleWindows"),new objj_ivar("_replacementObjects")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_namesKeys=[];
_namesValues=[];
_classesKeys=[];
_classesValues=[];
_connections=[];
_framework="";
_nextOid=[];
_objectsKeys=[];
_objectsValues=[];
_oidKeys=[];
_oidValues=[];
_fileOwner=nil;
_visibleWindows=objj_msgSend(CPSet,"set");
}
return _3;
}
}),new objj_method(sel_getUid("displayVisibleWindows"),function(_5,_6){
with(_5){
var _7=nil,_8=objj_msgSend(_visibleWindows,"objectEnumerator");
while(_7=objj_msgSend(_8,"nextObject")){
objj_msgSend(_replacementObjects[objj_msgSend(_7,"UID")],"makeKeyAndOrderFront:",_5);
}
}
})]);
var _9="_CPCibObjectDataNamesKeysKey",_a="_CPCibObjectDataNamesValuesKey",_b="_CPCibObjectDataAccessibilityConnectors",_c="_CPCibObjectDataAccessibilityOidsKeys",_d="_CPCibObjectDataAccessibilityOidsValues",_e="_CPCibObjectDataClassesKeysKey",_f="_CPCibObjectDataClassesValuesKey",_10="_CPCibObjectDataConnectionsKey",_11="_CPCibObjectDataFontManagerKey",_12="_CPCibObjectDataFrameworkKey",_13="_CPCibObjectDataNextOidKey",_14="_CPCibObjectDataObjectsKeysKey",_15="_CPCibObjectDataObjectsValuesKey",_16="_CPCibObjectDataOidKeysKey",_17="_CPCibObjectDataOidValuesKey",_18="_CPCibObjectDataFileOwnerKey",_19="_CPCibObjectDataVisibleWindowsKey";
var _1=objj_getClass("_CPCibObjectData");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibObjectData\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_1a,_1b,_1c){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPObject")},"init");
if(_1a){
_replacementObjects={};
_namesKeys=objj_msgSend(_1c,"decodeObjectForKey:",_9);
_namesValues=objj_msgSend(_1c,"decodeObjectForKey:",_a);
_classesKeys=objj_msgSend(_1c,"decodeObjectForKey:",_e);
_classesValues=objj_msgSend(_1c,"decodeObjectForKey:",_f);
_connections=objj_msgSend(_1c,"decodeObjectForKey:",_10);
_framework=objj_msgSend(_1c,"decodeObjectForKey:",_12);
_nextOid=objj_msgSend(_1c,"decodeIntForKey:",_13);
_objectsKeys=objj_msgSend(_1c,"decodeObjectForKey:",_14);
_objectsValues=objj_msgSend(_1c,"decodeObjectForKey:",_15);
_oidKeys=objj_msgSend(_1c,"decodeObjectForKey:",_16);
_oidValues=objj_msgSend(_1c,"decodeObjectForKey:",_17);
_fileOwner=objj_msgSend(_1c,"decodeObjectForKey:",_18);
_visibleWindows=objj_msgSend(_1c,"decodeObjectForKey:",_19);
}
return _1a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_1f,"encodeObject:forKey:",_namesKeys,_9);
objj_msgSend(_1f,"encodeObject:forKey:",_namesValues,_a);
objj_msgSend(_1f,"encodeObject:forKey:",_classesKeys,_e);
objj_msgSend(_1f,"encodeObject:forKey:",_classesValues,_f);
objj_msgSend(_1f,"encodeObject:forKey:",_connections,_10);
objj_msgSend(_1f,"encodeObject:forKey:",_framework,_12);
objj_msgSend(_1f,"encodeInt:forKey:",_nextOid,_13);
objj_msgSend(_1f,"encodeObject:forKey:",_objectsKeys,_14);
objj_msgSend(_1f,"encodeObject:forKey:",_objectsValues,_15);
objj_msgSend(_1f,"encodeObject:forKey:",_oidKeys,_16);
objj_msgSend(_1f,"encodeObject:forKey:",_oidValues,_17);
objj_msgSend(_1f,"encodeObject:forKey:",_fileOwner,_18);
objj_msgSend(_1f,"encodeObject:forKey:",_visibleWindows,_19);
}
}),new objj_method(sel_getUid("instantiateWithOwner:topLevelObjects:"),function(_20,_21,_22,_23){
with(_20){
var _24=objj_msgSend(_objectsKeys,"count");
while(_24--){
var _25=_objectsKeys[_24],_26=_objectsValues[_24],_27=_25;
if(objj_msgSend(_25,"respondsToSelector:",sel_getUid("_cibInstantiate"))){
var _27=objj_msgSend(_25,"_cibInstantiate");
if(_27!==_25){
_replacementObjects[objj_msgSend(_25,"UID")]=_27;
if(objj_msgSend(_27,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _28=objj_msgSend(_27,"superview");
if(objj_msgSend(_28,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
var _29=objj_msgSend(_28,"superview");
if(objj_msgSend(_29,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_29,"setDocumentView:",_27);
}
}
}
}
}
if(_23&&_26===_fileOwner&&_25!==_fileOwner){
_23.push(_27);
}
}
}
}),new objj_method(sel_getUid("establishConnectionsWithOwner:topLevelObjects:"),function(_2a,_2b,_2c,_2d){
with(_2a){
_replacementObjects[objj_msgSend(_fileOwner,"UID")]=_2c;
var _2e=0,_2f=_connections.length;
for(;_2e<_2f;++_2e){
var _30=_connections[_2e];
objj_msgSend(_30,"replaceObjects:",_replacementObjects);
objj_msgSend(_30,"establishConnection");
}
}
}),new objj_method(sel_getUid("awakeWithOwner:topLevelObjects:"),function(_31,_32,_33,_34){
with(_31){
var _35=objj_msgSend(_objectsKeys,"count");
while(_35--){
var _36=_objectsKeys[_35],_37=_replacementObjects[objj_msgSend(_36,"UID")];
if(_37){
_36=_37;
}
if(_36!==_33&&objj_msgSend(_36,"respondsToSelector:",sel_getUid("awakeFromCib"))){
objj_msgSend(_36,"awakeFromCib");
}
}
if(objj_msgSend(_33,"respondsToSelector:",sel_getUid("awakeFromCib"))){
objj_msgSend(_33,"awakeFromCib");
}
}
})]);
