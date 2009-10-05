i;9;CPArray.ji;10;CPObject.ji;14;CPDictionary.jc;5967;
var _1=nil,_2=nil;
CPUndefinedKeyException="CPUndefinedKeyException";
CPTargetObjectUserInfoKey="CPTargetObjectUserInfoKey";
CPUnknownUserInfoKey="CPUnknownUserInfoKey";
var _3=objj_getClass("CPObject");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("_ivarForKey:"),function(_5,_6,_7){
with(_5){
var _8="_"+_7;
if(typeof _5[_8]!="undefined"){
return _8;
}
var _9="is"+_7.charAt(0).toUpperCase()+_7.substr(1);
_8="_"+_9;
if(typeof _5[_8]!="undefined"){
return _8;
}
_8=_7;
if(typeof _5[_8]!="undefined"){
return _8;
}
_8=_9;
if(typeof _5[_8]!="undefined"){
return _8;
}
return nil;
}
}),new objj_method(sel_getUid("valueForKey:"),function(_a,_b,_c){
with(_a){
var _d=objj_msgSend(_a,"class"),_e=objj_msgSend(_d,"_accessorForKey:",_c);
if(_e){
return objj_msgSend(_a,_e);
}
if(objj_msgSend(_d,"accessInstanceVariablesDirectly")){
var _f=objj_msgSend(_a,"_ivarForKey:",_c);
if(_f){
return _a[_f];
}
}
return objj_msgSend(_a,"valueForUndefinedKey:",_c);
}
}),new objj_method(sel_getUid("valueForKeyPath:"),function(_10,_11,_12){
with(_10){
var _13=_12.split("."),_14=0,_15=_13.length,_16=_10;
for(;_14<_15;++_14){
_16=objj_msgSend(_16,"valueForKey:",_13[_14]);
}
return _16;
}
}),new objj_method(sel_getUid("dictionaryWithValuesForKeys:"),function(_17,_18,_19){
with(_17){
var _1a=0,_1b=_19.length,_1c=objj_msgSend(CPDictionary,"dictionary");
for(;_1a<_1b;++_1a){
var key=_19[_1a],_1e=objj_msgSend(_17,"valueForKey:",key);
if(_1e===nil){
objj_msgSend(_1c,"setObject:forKey:",objj_msgSend(CPNull,"null"),key);
}else{
objj_msgSend(_1c,"setObject:forKey:",_1e,key);
}
}
return _1c;
}
}),new objj_method(sel_getUid("valueForUndefinedKey:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:",CPUndefinedKeyException,objj_msgSend(_1f,"description")+" is not key value coding-compliant for the key "+_21,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_1f,_21],[CPTargetObjectUserInfoKey,CPUnknownUserInfoKey])),"raise");
}
}),new objj_method(sel_getUid("setValue:forKeyPath:"),function(_22,_23,_24,_25){
with(_22){
if(!_25){
_25="self";
}
var i=0,_27=_25.split("."),_28=_27.length-1,_29=_22;
for(;i<_28;++i){
_29=objj_msgSend(_29,"valueForKey:",_27[i]);
}
objj_msgSend(_29,"setValue:forKey:",_24,_27[i]);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_2a,_2b,_2c,_2d){
with(_2a){
var _2e=objj_msgSend(_2a,"class"),_2f=objj_msgSend(_2e,"_modifierForKey:",_2d);
if(_2f){
return objj_msgSend(_2a,_2f,_2c);
}
if(objj_msgSend(_2e,"accessInstanceVariablesDirectly")){
var _30=objj_msgSend(_2a,"_ivarForKey:",_2d);
if(_30){
objj_msgSend(_2a,"willChangeValueForKey:",_2d);
_2a[_30]=_2c;
objj_msgSend(_2a,"didChangeValueForKey:",_2d);
return;
}
}
objj_msgSend(_2a,"setValue:forUndefinedKey:",_2c,_2d);
}
}),new objj_method(sel_getUid("setValue:forUndefinedKey:"),function(_31,_32,_33,_34){
with(_31){
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:",CPUndefinedKeyException,objj_msgSend(_31,"description")+" is not key value coding-compliant for the key "+_34,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_31,_34],[CPTargetObjectUserInfoKey,CPUnknownUserInfoKey])),"raise");
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("accessInstanceVariablesDirectly"),function(_35,_36){
with(_35){
return YES;
}
}),new objj_method(sel_getUid("_accessorForKey:"),function(_37,_38,_39){
with(_37){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionary");
}
var UID=objj_msgSend(isa,"UID"),_3b=nil,_3c=objj_msgSend(_1,"objectForKey:",UID);
if(_3c){
_3b=objj_msgSend(_3c,"objectForKey:",_39);
if(_3b){
return _3b===objj_msgSend(CPNull,"null")?nil:_3b;
}
}else{
_3c=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_1,"setObject:forKey:",_3c,UID);
}
var _3d=_39.charAt(0).toUpperCase()+_39.substr(1);
if(objj_msgSend(_37,"instancesRespondToSelector:",_3b=CPSelectorFromString("get"+_3d))||objj_msgSend(_37,"instancesRespondToSelector:",_3b=CPSelectorFromString(_39))||objj_msgSend(_37,"instancesRespondToSelector:",_3b=CPSelectorFromString("is"+_3d))||objj_msgSend(_37,"instancesRespondToSelector:",_3b=CPSelectorFromString("_get"+_3d))||objj_msgSend(_37,"instancesRespondToSelector:",_3b=CPSelectorFromString("_"+_39))||objj_msgSend(_37,"instancesRespondToSelector:",_3b=CPSelectorFromString("_is"+_3d))){
objj_msgSend(_3c,"setObject:forKey:",_3b,_39);
return _3b;
}
objj_msgSend(_3c,"setObject:forKey:",objj_msgSend(CPNull,"null"),_39);
return nil;
}
}),new objj_method(sel_getUid("_modifierForKey:"),function(_3e,_3f,_40){
with(_3e){
if(!_2){
_2=objj_msgSend(CPDictionary,"dictionary");
}
var UID=objj_msgSend(isa,"UID"),_42=nil,_43=objj_msgSend(_2,"objectForKey:",UID);
if(_43){
_42=objj_msgSend(_43,"objectForKey:",_40);
if(_42){
return _42===objj_msgSend(CPNull,"null")?nil:_42;
}
}else{
_43=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_2,"setObject:forKey:",_43,UID);
}
if(_42){
return _42===objj_msgSend(CPNull,"null")?nil:_42;
}
var _44=_40.charAt(0).toUpperCase()+_40.substr(1)+":";
if(objj_msgSend(_3e,"instancesRespondToSelector:",_42=CPSelectorFromString("set"+_44))||objj_msgSend(_3e,"instancesRespondToSelector:",_42=CPSelectorFromString("_set"+_44))){
objj_msgSend(_43,"setObject:forKey:",_42,_40);
return _42;
}
objj_msgSend(_43,"setObject:forKey:",objj_msgSend(CPNull,"null"),_40);
return nil;
}
})]);
var _3=objj_getClass("CPDictionary");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPDictionary\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("valueForKey:"),function(_45,_46,_47){
with(_45){
return objj_msgSend(_45,"objectForKey:",_47);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_48,_49,_4a,_4b){
with(_48){
objj_msgSend(_48,"setObject:forKey:",_4a,_4b);
}
})]);
i;13;CPArray+KVO.j