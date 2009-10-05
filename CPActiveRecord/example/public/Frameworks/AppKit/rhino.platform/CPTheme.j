I;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;10887;
var _1={},_2=nil;
var _3=objj_allocateClassPair(CPObject,"CPTheme"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_name"),new objj_ivar("_attributes")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithName:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_name=_7;
_attributes=objj_msgSend(CPDictionary,"dictionary");
_1[_name]=_5;
}
return _5;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return _name;
}
}),new objj_method(sel_getUid("_attributeWithName:forClass:"),function(_a,_b,_c,_d){
with(_a){
var _e=objj_msgSend(_attributes,"objectForKey:",_d);
if(!_e){
return nil;
}
return objj_msgSend(_e,"objectForKey:",_c);
}
}),new objj_method(sel_getUid("takeThemeFromObject:"),function(_f,_10,_11){
with(_f){
var _12=objj_msgSend(_11,"_themeAttributeDictionary"),_13=nil,_14=objj_msgSend(_12,"keyEnumerator"),_15=objj_msgSend(objj_msgSend(_11,"class"),"themeClass");
while(_13=objj_msgSend(_14,"nextObject")){
objj_msgSend(_f,"_recordAttribute:forClass:",objj_msgSend(_12,"objectForKey:",_13),_15);
}
}
}),new objj_method(sel_getUid("_recordAttribute:forClass:"),function(_16,_17,_18,_19){
with(_16){
if(!objj_msgSend(_18,"hasValues")){
return;
}
var _1a=objj_msgSend(_attributes,"objectForKey:",_19);
if(!_1a){
_1a=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_attributes,"setObject:forKey:",_1a,_19);
}
var _1b=objj_msgSend(_18,"name"),_1c=objj_msgSend(_1a,"objectForKey:",_1b);
if(_1c){
objj_msgSend(_1a,"setObject:forKey:",objj_msgSend(_1c,"attributeMergedWithAttribute:",_18),_1b);
}else{
objj_msgSend(_1a,"setObject:forKey:",_18,_1b);
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("setDefaultTheme:"),function(_1d,_1e,_1f){
with(_1d){
_2=_1f;
}
}),new objj_method(sel_getUid("defaultTheme"),function(_20,_21){
with(_20){
return _2;
}
}),new objj_method(sel_getUid("themeNamed:"),function(_22,_23,_24){
with(_22){
return _1[_24];
}
})]);
var _25="CPThemeNameKey",_26="CPThemeAttributesKey";
var _3=objj_getClass("CPTheme");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTheme\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_27,_28,_29){
with(_27){
_27=objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPObject")},"init");
if(_27){
_name=objj_msgSend(_29,"decodeObjectForKey:",_25);
_attributes=objj_msgSend(_29,"decodeObjectForKey:",_26);
_1[_name]=_27;
}
return _27;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2c,"encodeObject:forKey:",_name,_25);
objj_msgSend(_2c,"encodeObject:forKey:",_attributes,_26);
}
})]);
var _3=objj_allocateClassPair(CPKeyedUnarchiver,"_CPThemeKeyedUnarchiver"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_bundle")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initForReadingWithData:bundle:"),function(_2d,_2e,_2f,_30){
with(_2d){
_2d=objj_msgSendSuper({receiver:_2d,super_class:objj_getClass("CPKeyedUnarchiver")},"initForReadingWithData:",_2f);
if(_2d){
_bundle=_30;
}
return _2d;
}
}),new objj_method(sel_getUid("bundle"),function(_31,_32){
with(_31){
return _bundle;
}
}),new objj_method(sel_getUid("awakenCustomResources"),function(_33,_34){
with(_33){
return YES;
}
})]);
var _35={},_36={},_37=0;
CPThemeState=function(_38){
var _39=_35[_38];
if(_39===undefined){
if(_38.indexOf("+")===-1){
_39=1<<_37++;
}else{
var _39=0,_3a=_38.split("+"),_3b=_3a.length;
while(_3b--){
var _3c=_3a[_3b],_3d=_35[_3c];
if(_3d===undefined){
_3d=1<<_37++;
_35[_3c]=_3d;
_36[_3d]=_3c;
}
_39|=_3d;
}
}
_35[_38]=_39;
_36[_39]=_38;
}
return _39;
};
CPThemeStateName=function(_3e){
var _3f=_36[_3e];
if(_3f!==undefined){
return _3f;
}
if(!(_3e&(_3e-1))){
return "";
}
var _40=1,_3f="";
for(;_40<_3e;_40<<=1){
if(_3e&_40){
_3f+=(_3f.length===0?"":"+")+_36[_40];
}
}
_36[_3e]=_3f;
return _3f;
};
_36[0]="normal";
CPThemeStateNormal=_35["normal"]=0;
CPThemeStateDisabled=CPThemeState("disabled");
CPThemeStateHighlighted=CPThemeState("highlighted");
CPThemeStateSelected=CPThemeState("selected");
CPThemeStateBezeled=CPThemeState("bezeled");
CPThemeStateBordered=CPThemeState("bordered");
CPThemeStateEditable=CPThemeState("editable");
CPThemeStateEditing=CPThemeState("editing");
CPThemeStateVertical=CPThemeState("vertical");
CPThemeStateDefault=CPThemeState("default");
CPThemeStateCircular=CPThemeState("circular");
var _3=objj_allocateClassPair(CPObject,"_CPThemeAttribute"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_name"),new objj_ivar("_defaultValue"),new objj_ivar("_values"),new objj_ivar("_cache"),new objj_ivar("_parentAttribute")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithName:defaultValue:"),function(_41,_42,_43,_44){
with(_41){
_41=objj_msgSendSuper({receiver:_41,super_class:objj_getClass("CPObject")},"init");
if(_41){
_cache={};
_name=_43;
_defaultValue=_44;
_values=objj_msgSend(CPDictionary,"dictionary");
}
return _41;
}
}),new objj_method(sel_getUid("name"),function(_45,_46){
with(_45){
return _name;
}
}),new objj_method(sel_getUid("defaultValue"),function(_47,_48){
with(_47){
return _defaultValue;
}
}),new objj_method(sel_getUid("hasValues"),function(_49,_4a){
with(_49){
return objj_msgSend(_values,"count")>0;
}
}),new objj_method(sel_getUid("isTrivial"),function(_4b,_4c){
with(_4b){
return (objj_msgSend(_values,"count")===1)&&(Number(objj_msgSend(_values,"allKeys")[0])===CPThemeStateNormal);
}
}),new objj_method(sel_getUid("setValue:"),function(_4d,_4e,_4f){
with(_4d){
_cache={};
if(_4f===undefined||_4f===nil){
_values=objj_msgSend(CPDictionary,"dictionary");
}else{
_values=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_4f,String(CPThemeStateNormal));
}
}
}),new objj_method(sel_getUid("setValue:forState:"),function(_50,_51,_52,_53){
with(_50){
_cache={};
if((_52===undefined)||(_52===nil)){
objj_msgSend(_values,"removeObjectForKey:",String(_53));
}else{
objj_msgSend(_values,"setObject:forKey:",_52,String(_53));
}
}
}),new objj_method(sel_getUid("value"),function(_54,_55){
with(_54){
return objj_msgSend(_54,"valueForState:",CPThemeStateNormal);
}
}),new objj_method(sel_getUid("valueForState:"),function(_56,_57,_58){
with(_56){
var _59=_cache[_58];
if(_59!==undefined){
return _59;
}
_59=objj_msgSend(_values,"objectForKey:",String(_58));
if((_59===undefined||_59===nil)&&_58!==CPThemeStateNormal){
if(_58&(_58-1)){
var _5a=0,_5b=objj_msgSend(_values,"allKeys"),_5c=_5b.length;
while(_5c--){
var _5d=Number(_5b[_5c]);
if((_5d&_58)===_5d){
var _5e=_5f[_5d];
if(_5e===undefined){
_5e=_60(_5d);
}
if(_5e>_5a){
_5a=_5e;
_59=objj_msgSend(_values,"objectForKey:",String(_5d));
}
}
}
}
if(_59===undefined||_59===nil){
_59=objj_msgSend(_values,"objectForKey:",String(CPThemeStateNormal));
}
}
if(_59===undefined||_59===nil){
_59=objj_msgSend(_parentAttribute,"valueForState:",_58);
}
if(_59===undefined||_59===nil){
_59=_defaultValue;
}
_cache[_58]=_59;
return _59;
}
}),new objj_method(sel_getUid("setParentAttribute:"),function(_61,_62,_63){
with(_61){
if(_parentAttribute===_63){
return;
}
_cache={};
_parentAttribute=_63;
}
}),new objj_method(sel_getUid("attributeMergedWithAttribute:"),function(_64,_65,_66){
with(_64){
var _67=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_name,_defaultValue);
_67._values=objj_msgSend(_values,"copy");
objj_msgSend(_67._values,"addEntriesFromDictionary:",_66._values);
return _67;
}
})]);
var _3=objj_getClass("_CPThemeAttribute");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPThemeAttribute\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_68,_69,_6a){
with(_68){
_68=objj_msgSendSuper({receiver:_68,super_class:objj_getClass("CPObject")},"init");
if(_68){
_cache={};
_name=objj_msgSend(_6a,"decodeObjectForKey:","name");
_values=objj_msgSend(CPDictionary,"dictionary");
if(objj_msgSend(_6a,"containsValueForKey:","value")){
var _6b=CPThemeStateNormal;
if(objj_msgSend(_6a,"containsValueForKey:","state")){
_6b=CPThemeState(objj_msgSend(_6a,"decodeObjectForKey:","state"));
}
objj_msgSend(_values,"setObject:forKey:",objj_msgSend(_6a,"decodeObjectForKey:","value"),_6b);
}else{
var _6c=objj_msgSend(_6a,"decodeObjectForKey:","values"),_6d=objj_msgSend(_6c,"allKeys"),_6e=_6d.length;
while(_6e--){
var key=_6d[_6e];
objj_msgSend(_values,"setObject:forKey:",objj_msgSend(_6c,"objectForKey:",key),CPThemeState(key));
}
}
}
return _68;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_70,_71,_72){
with(_70){
objj_msgSend(_72,"encodeObject:forKey:",_name,"name");
var _73=objj_msgSend(_values,"allKeys"),_74=_73.length;
if(_74===1){
var _75=_73[0];
if(Number(_75)!==CPThemeStateNormal){
objj_msgSend(_72,"encodeObject:forKey:",CPThemeStateName(Number(_75)),"state");
}
objj_msgSend(_72,"encodeObject:forKey:",objj_msgSend(_values,"objectForKey:",_75),"value");
}else{
var _76=objj_msgSend(CPDictionary,"dictionary");
while(_74--){
var key=_73[_74];
objj_msgSend(_76,"setObject:forKey:",objj_msgSend(_values,"objectForKey:",key),CPThemeStateName(Number(key)));
}
objj_msgSend(_72,"encodeObject:forKey:",_76,"values");
}
}
})]);
var _5f=[0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6];
var _60=function(_78){
var _79=0,_7a=_78;
while(_78){
++_79;
_78&=(_78-1);
}
_5f[_7a]=_79;
return _79;
};
_60.displayName="numberOfOnes";
CPThemeAttributeEncode=function(_7b,_7c){
var _7d=_7c._values,_7e=objj_msgSend(_7d,"count"),key="$a"+objj_msgSend(_7c,"name");
if(_7e===1){
var _80=objj_msgSend(_7d,"allKeys")[0];
if(Number(_80)===0){
objj_msgSend(_7b,"encodeObject:forKey:",objj_msgSend(_7d,"objectForKey:",_80),key);
return YES;
}
}
if(_7e>=1){
objj_msgSend(_7b,"encodeObject:forKey:",_7c,key);
return YES;
}
return NO;
};
CPThemeAttributeDecode=function(_81,_82,_83,_84,_85){
var key="$a"+_82;
if(!objj_msgSend(_81,"containsValueForKey:",key)){
var _87=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_82,_83);
}else{
var _87=objj_msgSend(_81,"decodeObjectForKey:",key);
if(!_87.isa||!objj_msgSend(_87,"isKindOfClass:",objj_msgSend(_CPThemeAttribute,"class"))){
var _88=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_82,_83);
objj_msgSend(_88,"setValue:",_87);
_87=_88;
}
}
if(_84&&_85){
objj_msgSend(_87,"setParentAttribute:",objj_msgSend(_84,"_attributeWithName:forClass:",_82,_85));
}
return _87;
};
