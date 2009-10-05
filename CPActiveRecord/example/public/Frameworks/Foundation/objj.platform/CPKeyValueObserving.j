i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;10;CPObject.ji;7;CPSet.jc;14115;
var _1=objj_getClass("CPObject");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("willChangeValueForKey:"),function(_3,_4,_5){
with(_3){
}
}),new objj_method(sel_getUid("didChangeValueForKey:"),function(_6,_7,_8){
with(_6){
}
}),new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"),function(_9,_a,_b,_c,_d){
with(_9){
}
}),new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"),function(_e,_f,_10,_11,key){
with(_e){
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_13,_14,_15,_16,_17,_18){
with(_13){
if(!_15||!_16){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_13),"_addObserver:forKeyPath:options:context:",_15,_16,_17,_18);
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_19,_1a,_1b,_1c){
with(_19){
if(!_1b||!_1c){
return;
}
objj_msgSend(_19[_1d],"_removeObserver:forKeyPath:",_1b,_1c);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"),function(_1e,_1f,_20){
with(_1e){
return YES;
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForKey:"),function(_21,_22,_23){
with(_21){
var _24=_23.charAt(0).toUpperCase()+_23.substring(1);
selector="keyPathsForValuesAffecting"+_24;
if(objj_msgSend(objj_msgSend(_21,"class"),"respondsToSelector:",selector)){
return objj_msgSend(objj_msgSend(_21,"class"),selector);
}
return objj_msgSend(CPSet,"set");
}
})]);
CPKeyValueObservingOptionNew=1<<0;
CPKeyValueObservingOptionOld=1<<1;
CPKeyValueObservingOptionInitial=1<<2;
CPKeyValueObservingOptionPrior=1<<3;
CPKeyValueChangeKindKey="CPKeyValueChangeKindKey";
CPKeyValueChangeNewKey="CPKeyValueChangeNewKey";
CPKeyValueChangeOldKey="CPKeyValueChangeOldKey";
CPKeyValueChangeIndexesKey="CPKeyValueChangeIndexesKey";
CPKeyValueChangeNotificationIsPriorKey="CPKeyValueChangeNotificationIsPriorKey";
CPKeyValueChangeSetting=1;
CPKeyValueChangeInsertion=2;
CPKeyValueChangeRemoval=3;
CPKeyValueChangeReplacement=4;
var _25=CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld,_26="$KVODEPENDENT",_1d="$KVOPROXY";
var _1=objj_allocateClassPair(CPObject,"_CPKVOProxy"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_targetObject"),new objj_ivar("_nativeClass"),new objj_ivar("_changesForKey"),new objj_ivar("_observersForKey"),new objj_ivar("_observersForKeyLength"),new objj_ivar("_replacedKeys")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithTarget:"),function(_27,_28,_29){
with(_27){
_27=objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPObject")},"init");
_targetObject=_29;
_nativeClass=objj_msgSend(_29,"class");
_replacedKeys=objj_msgSend(CPSet,"set");
_observersForKey={};
_changesForKey={};
_observersForKeyLength=0;
return _27;
}
}),new objj_method(sel_getUid("_replaceClass"),function(_2a,_2b){
with(_2a){
var _2c=_nativeClass,_2d="$KVO_"+class_getName(_nativeClass),_2e=objj_lookUpClass(_2d);
if(_2e){
_targetObject.isa=_2e;
return;
}
var _2f=objj_allocateClassPair(_2c,_2d);
objj_registerClassPair(_2f);
_class_initialize(_2f);
var _30=_CPKVOModelSubclass.method_list,_31=_30.length;
for(var i=0;i<_31;i++){
var _33=_30[i];
class_addMethod(_2f,method_getName(_33),method_getImplementation(_33),"");
}
_targetObject.isa=_2f;
}
}),new objj_method(sel_getUid("_replaceSetterForKey:"),function(_34,_35,_36){
with(_34){
if(objj_msgSend(_replacedKeys,"containsObject:",_36)||!objj_msgSend(_nativeClass,"automaticallyNotifiesObserversForKey:",_36)){
return;
}
var _37=_nativeClass,_38=_36.charAt(0).toUpperCase()+_36.substring(1),_39=false,_3a=["set"+_38+":",_3b,"_set"+_38+":",_3b,"insertObject:in"+_38+"AtIndex:",_3c,"replaceObjectIn"+_38+"AtIndex:withObject:",_3d,"removeObjectFrom"+_38+"AtIndex:",_3e];
for(var i=0,_40=_3a.length;i<_40;i+=2){
var _41=sel_getName(_3a[i]),_42=_3a[i+1];
if(objj_msgSend(_nativeClass,"instancesRespondToSelector:",_41)){
var _43=class_getInstanceMethod(_nativeClass,_41);
class_addMethod(_targetObject.isa,_41,_42(_36,_43),"");
}
}
var _44=objj_msgSend(objj_msgSend(_nativeClass,"keyPathsForValuesAffectingValueForKey:",_36),"allObjects"),_45=_44?_44.length:0;
if(!_45){
return;
}
var _46=_nativeClass[_26];
if(!_46){
_46={};
_nativeClass[_26]=_46;
}
while(_45--){
var _47=_44[_45],_48=_46[_47];
if(!_48){
_48=objj_msgSend(CPSet,"new");
_46[_47]=_48;
}
objj_msgSend(_48,"addObject:",_36);
objj_msgSend(_34,"_replaceSetterForKey:",_47);
}
}
}),new objj_method(sel_getUid("_addObserver:forKeyPath:options:context:"),function(_49,_4a,_4b,_4c,_4d,_4e){
with(_49){
if(!_4b){
return;
}
var _4f=nil;
if(_4c.indexOf(".")!=CPNotFound){
_4f=objj_msgSend(objj_msgSend(_CPKVOForwardingObserver,"alloc"),"initWithKeyPath:object:observer:options:context:",_4c,_targetObject,_4b,_4d,_4e);
}else{
objj_msgSend(_49,"_replaceSetterForKey:",_4c);
}
var _50=_observersForKey[_4c];
if(!_50){
_50=objj_msgSend(CPDictionary,"dictionary");
_observersForKey[_4c]=_50;
_observersForKeyLength++;
}
objj_msgSend(_50,"setObject:forKey:",_51(_4b,_4d,_4e,_4f),objj_msgSend(_4b,"UID"));
if(_4d&CPKeyValueObservingOptionInitial){
var _52=objj_msgSend(_targetObject,"valueForKeyPath:",_4c);
if(_52===nil||_52===undefined){
_52=objj_msgSend(CPNull,"null");
}
var _53=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_52,CPKeyValueChangeNewKey);
objj_msgSend(_4b,"observeValueForKeyPath:ofObject:change:context:",_4c,_49,_53,_4e);
}
}
}),new objj_method(sel_getUid("_removeObserver:forKeyPath:"),function(_54,_55,_56,_57){
with(_54){
var _58=_observersForKey[_57];
if(_57.indexOf(".")!=CPNotFound){
var _59=objj_msgSend(_58,"objectForKey:",objj_msgSend(_56,"UID")).forwarder;
objj_msgSend(_59,"finalize");
}
objj_msgSend(_58,"removeObjectForKey:",objj_msgSend(_56,"UID"));
if(!objj_msgSend(_58,"count")){
_observersForKeyLength--;
delete _observersForKey[_57];
}
if(!_observersForKeyLength){
_targetObject.isa=_nativeClass;
delete _targetObject[_1d];
}
}
}),new objj_method(sel_getUid("_sendNotificationsForKey:changeOptions:isBefore:"),function(_5a,_5b,_5c,_5d,_5e){
with(_5a){
var _5f=_changesForKey[_5c];
if(_5e){
_5f=_5d;
var _60=objj_msgSend(_5f,"objectForKey:",CPKeyValueChangeIndexesKey);
if(_60){
var _61=objj_msgSend(_5f,"objectForKey:",CPKeyValueChangeKindKey);
if(_61==CPKeyValueChangeReplacement||_61==CPKeyValueChangeRemoval){
var _62=objj_msgSend(objj_msgSend(_targetObject,"mutableArrayValueForKeyPath:",_5c),"objectsAtIndexes:",_60);
objj_msgSend(_5f,"setValue:forKey:",_62,CPKeyValueChangeOldKey);
}
}else{
var _63=objj_msgSend(_targetObject,"valueForKey:",_5c);
if(_63===nil||_63===undefined){
_63=objj_msgSend(CPNull,"null");
}
objj_msgSend(_5f,"setObject:forKey:",_63,CPKeyValueChangeOldKey);
}
objj_msgSend(_5f,"setObject:forKey:",1,CPKeyValueChangeNotificationIsPriorKey);
_changesForKey[_5c]=_5f;
}else{
objj_msgSend(_5f,"removeObjectForKey:",CPKeyValueChangeNotificationIsPriorKey);
var _60=objj_msgSend(_5f,"objectForKey:",CPKeyValueChangeIndexesKey);
if(_60){
var _61=objj_msgSend(_5f,"objectForKey:",CPKeyValueChangeKindKey);
if(_61==CPKeyValueChangeReplacement||_61==CPKeyValueChangeInsertion){
var _62=objj_msgSend(objj_msgSend(_targetObject,"mutableArrayValueForKeyPath:",_5c),"objectsAtIndexes:",_60);
objj_msgSend(_5f,"setValue:forKey:",_62,CPKeyValueChangeNewKey);
}
}else{
var _64=objj_msgSend(_targetObject,"valueForKey:",_5c);
if(_64===nil||_64===undefined){
_64=objj_msgSend(CPNull,"null");
}
objj_msgSend(_5f,"setObject:forKey:",_64,CPKeyValueChangeNewKey);
}
}
var _65=objj_msgSend(_observersForKey[_5c],"allValues"),_66=_65?_65.length:0;
while(_66--){
var _67=_65[_66];
if(_5e&&(_67.options&CPKeyValueObservingOptionPrior)){
objj_msgSend(_67.observer,"observeValueForKeyPath:ofObject:change:context:",_5c,_targetObject,_5f,_67.context);
}else{
if(!_5e){
objj_msgSend(_67.observer,"observeValueForKeyPath:ofObject:change:context:",_5c,_targetObject,_5f,_67.context);
}
}
}
var _68=_nativeClass[_26];
if(!_68){
return;
}
var _69=objj_msgSend(_68[_5c],"allObjects");
if(!_69){
return;
}
for(var i=0,_66=_69.length;i<_66;i++){
objj_msgSend(_5a,"_sendNotificationsForKey:changeOptions:isBefore:",_69[i],_5d,_5e);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("proxyForObject:"),function(_6b,_6c,_6d){
with(_6b){
var _6e=_6d[_1d];
if(_6e){
return _6e;
}
_6e=objj_msgSend(objj_msgSend(_6b,"alloc"),"initWithTarget:",_6d);
objj_msgSend(_6e,"_replaceClass");
_6d[_1d]=_6e;
return _6e;
}
})]);
var _1=objj_allocateClassPair(Nil,"_CPKVOModelSubclass"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("willChangeValueForKey:"),function(_6f,_70,_71){
with(_6f){
if(!_71){
return;
}
var _72=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPKeyValueChangeSetting,CPKeyValueChangeKindKey);
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_6f),"_sendNotificationsForKey:changeOptions:isBefore:",_71,_72,YES);
}
}),new objj_method(sel_getUid("didChangeValueForKey:"),function(_73,_74,_75){
with(_73){
if(!_75){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_73),"_sendNotificationsForKey:changeOptions:isBefore:",_75,nil,NO);
}
}),new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"),function(_76,_77,_78,_79,_7a){
with(_76){
if(!_7a){
return;
}
var _7b=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_78,_79],[CPKeyValueChangeKindKey,CPKeyValueChangeIndexesKey]);
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_76),"_sendNotificationsForKey:changeOptions:isBefore:",_7a,_7b,YES);
}
}),new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"),function(_7c,_7d,_7e,_7f,_80){
with(_7c){
if(!_80){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_7c),"_sendNotificationsForKey:changeOptions:isBefore:",_80,nil,NO);
}
}),new objj_method(sel_getUid("class"),function(_81,_82){
with(_81){
return _81[_1d]._nativeClass;
}
}),new objj_method(sel_getUid("superclass"),function(_83,_84){
with(_83){
return objj_msgSend(objj_msgSend(_83,"class"),"superclass");
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_85,_86,_87){
with(_85){
return objj_msgSend(objj_msgSend(_85,"class"),"isSubclassOfClass:",_87);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_88,_89,_8a){
with(_88){
return objj_msgSend(_88,"class")==_8a;
}
}),new objj_method(sel_getUid("className"),function(_8b,_8c){
with(_8b){
return objj_msgSend(_8b,"class").name;
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPKVOForwardingObserver"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_object"),new objj_ivar("_observer"),new objj_ivar("_context"),new objj_ivar("_firstPart"),new objj_ivar("_secondPart"),new objj_ivar("_value")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithKeyPath:object:observer:options:context:"),function(_8d,_8e,_8f,_90,_91,_92,_93){
with(_8d){
_8d=objj_msgSendSuper({receiver:_8d,super_class:objj_getClass("CPObject")},"init");
_context=_93;
_observer=_91;
_object=_90;
var _94=_8f.indexOf(".");
if(_94==CPNotFound){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Created _CPKVOForwardingObserver without compound key path: "+_8f);
}
_firstPart=_8f.substring(0,_94);
_secondPart=_8f.substring(_94+1);
objj_msgSend(_object,"addObserver:forKeyPath:options:context:",_8d,_firstPart,_25,nil);
_value=objj_msgSend(_object,"valueForKey:",_firstPart);
if(_value){
objj_msgSend(_value,"addObserver:forKeyPath:options:context:",_8d,_secondPart,_25,nil);
}
return _8d;
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_95,_96,_97,_98,_99,_9a){
with(_95){
if(_98==_object){
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_firstPart,_object,_99,_context);
if(_value){
objj_msgSend(_value,"removeObserver:forKeyPath:",_95,_secondPart);
}
_value=objj_msgSend(_object,"valueForKey:",_firstPart);
if(_value){
objj_msgSend(_value,"addObserver:forKeyPath:options:context:",_95,_secondPart,_25,nil);
}
}else{
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_firstPart+"."+_97,_object,_99,_context);
}
}
}),new objj_method(sel_getUid("finalize"),function(_9b,_9c){
with(_9b){
if(_value){
objj_msgSend(_value,"removeObserver:forKeyPath:",_9b,_secondPart);
}
objj_msgSend(_object,"removeObserver:forKeyPath:",_9b,_firstPart);
_object=nil;
_observer=nil;
_context=nil;
_value=nil;
}
})]);
var _51=_51=function(_9d,_9e,_9f,_a0){
return {observer:_9d,options:_9e,context:_9f,forwarder:_a0};
};
var _3b=_3b=function(_a1,_a2){
return function(_a3,_a4,_a5){
objj_msgSend(_a3,"willChangeValueForKey:",_a1);
_a2.method_imp(_a3,_a4,_a5);
objj_msgSend(_a3,"didChangeValueForKey:",_a1);
};
};
var _3c=_3c=function(_a6,_a7){
return function(_a8,_a9,_aa,_ab){
objj_msgSend(_a8,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_ab),_a6);
_a7.method_imp(_a8,_a9,_aa,_ab);
objj_msgSend(_a8,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_ab),_a6);
};
};
var _3d=_3d=function(_ac,_ad){
return function(_ae,_af,_b0,_b1){
objj_msgSend(_ae,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_b0),_ac);
_ad.method_imp(_ae,_af,_b0,_b1);
objj_msgSend(_ae,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_b0),_ac);
};
};
var _3e=_3e=function(_b2,_b3){
return function(_b4,_b5,_b6){
objj_msgSend(_b4,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_b6),_b2);
_b3.method_imp(_b4,_b5,_b6);
objj_msgSend(_b4,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_b6),_b2);
};
};
i;13;CPArray+KVO.j