i;9;CPArray.ji;14;CPDictionary.ji;16;CPNotification.ji;13;CPException.jc;6405;
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPNotificationCenter"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_namedRegistries"),new objj_ivar("_unnamedRegistry")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_namedRegistries=objj_msgSend(CPDictionary,"dictionary");
_unnamedRegistry=objj_msgSend(objj_msgSend(_CPNotificationRegistry,"alloc"),"init");
}
return _4;
}
}),new objj_method(sel_getUid("addObserver:selector:name:object:"),function(_6,_7,_8,_9,_a,_b){
with(_6){
var _c,_d=objj_msgSend(objj_msgSend(_CPNotificationObserver,"alloc"),"initWithObserver:selector:",_8,_9);
if(_a==nil){
_c=_unnamedRegistry;
}else{
if(!(_c=objj_msgSend(_namedRegistries,"objectForKey:",_a))){
_c=objj_msgSend(objj_msgSend(_CPNotificationRegistry,"alloc"),"init");
objj_msgSend(_namedRegistries,"setObject:forKey:",_c,_a);
}
}
objj_msgSend(_c,"addObserver:object:",_d,_b);
}
}),new objj_method(sel_getUid("removeObserver:"),function(_e,_f,_10){
with(_e){
var _11=nil,_12=objj_msgSend(_namedRegistries,"keyEnumerator");
while(_11=objj_msgSend(_12,"nextObject")){
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_11),"removeObserver:object:",_10,nil);
}
objj_msgSend(_unnamedRegistry,"removeObserver:object:",_10,nil);
}
}),new objj_method(sel_getUid("removeObserver:name:object:"),function(_13,_14,_15,_16,_17){
with(_13){
if(_16==nil){
var _18=nil,_19=objj_msgSend(_namedRegistries,"keyEnumerator");
while(_18=objj_msgSend(_19,"nextObject")){
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_18),"removeObserver:object:",_15,_17);
}
objj_msgSend(_unnamedRegistry,"removeObserver:object:",_15,_17);
}else{
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_16),"removeObserver:object:",_15,_17);
}
}
}),new objj_method(sel_getUid("postNotification:"),function(_1a,_1b,_1c){
with(_1a){
if(!_1c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"postNotification: does not except 'nil' notifications");
}
_1d(_1a,_1c);
}
}),new objj_method(sel_getUid("postNotificationName:object:userInfo:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
_1d(_1e,objj_msgSend(objj_msgSend(CPNotification,"alloc"),"initWithName:object:userInfo:",_20,_21,_22));
}
}),new objj_method(sel_getUid("postNotificationName:object:"),function(_23,_24,_25,_26){
with(_23){
_1d(_23,objj_msgSend(objj_msgSend(CPNotification,"alloc"),"initWithName:object:userInfo:",_25,_26,nil));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("defaultCenter"),function(_27,_28){
with(_27){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPNotificationCenter,"alloc"),"init");
}
return _1;
}
})]);
var _1d=function(_29,_2a){
objj_msgSend(_29._unnamedRegistry,"postNotification:",_2a);
objj_msgSend(objj_msgSend(_29._namedRegistries,"objectForKey:",objj_msgSend(_2a,"name")),"postNotification:",_2a);
};
var _2=objj_allocateClassPair(CPObject,"_CPNotificationRegistry"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_objectObservers"),new objj_ivar("_observerRemovalCount")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_2b,_2c){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("CPObject")},"init");
if(_2b){
_observerRemovalCount=0;
_objectObservers=objj_msgSend(CPDictionary,"dictionary");
}
return _2b;
}
}),new objj_method(sel_getUid("addObserver:object:"),function(_2d,_2e,_2f,_30){
with(_2d){
if(!_30){
_30=objj_msgSend(CPNull,"null");
}
var _31=objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(_30,"UID"));
if(!_31){
_31=[];
objj_msgSend(_objectObservers,"setObject:forKey:",_31,objj_msgSend(_30,"UID"));
}
_31.push(_2f);
}
}),new objj_method(sel_getUid("removeObserver:object:"),function(_32,_33,_34,_35){
with(_32){
var _36=[];
if(_35==nil){
var key=nil,_38=objj_msgSend(_objectObservers,"keyEnumerator");
while(key=objj_msgSend(_38,"nextObject")){
var _39=objj_msgSend(_objectObservers,"objectForKey:",key),_3a=_39?_39.length:0;
while(_3a--){
if(objj_msgSend(_39[_3a],"observer")==_34){
++_observerRemovalCount;
_39.splice(_3a,1);
}
}
if(!_39||_39.length==0){
_36.push(key);
}
}
}else{
var key=objj_msgSend(_35,"UID"),_39=objj_msgSend(_objectObservers,"objectForKey:",key);
_3a=_39?_39.length:0;
while(_3a--){
if(objj_msgSend(_39[_3a],"observer")==_34){
++_observerRemovalCount;
_39.splice(_3a,1);
}
}
if(!_39||_39.length==0){
_36.push(key);
}
}
var _3a=_36.length;
while(_3a--){
objj_msgSend(_objectObservers,"removeObjectForKey:",_36[_3a]);
}
}
}),new objj_method(sel_getUid("postNotification:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=_observerRemovalCount,_3f=objj_msgSend(_3d,"object"),_40=nil;
if(_3f!=nil&&(_40=objj_msgSend(objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(_3f,"UID")),"copy"))){
var _41=_40,_42=_40.length;
while(_42--){
var _43=_40[_42];
if((_3e===_observerRemovalCount)||objj_msgSend(_41,"indexOfObjectIdenticalTo:",_43)!==CPNotFound){
objj_msgSend(_43,"postNotification:",_3d);
}
}
}
_40=objj_msgSend(objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(objj_msgSend(CPNull,"null"),"UID")),"copy");
if(!_40){
return;
}
var _3e=_observerRemovalCount,_42=_40.length,_41=_40;
while(_42--){
var _43=_40[_42];
if((_3e===_observerRemovalCount)||objj_msgSend(_41,"indexOfObjectIdenticalTo:",_43)!==CPNotFound){
objj_msgSend(_43,"postNotification:",_3d);
}
}
}
}),new objj_method(sel_getUid("count"),function(_44,_45){
with(_44){
return objj_msgSend(_objectObservers,"count");
}
})]);
var _2=objj_allocateClassPair(CPObject,"_CPNotificationObserver"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_observer"),new objj_ivar("_selector")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithObserver:selector:"),function(_46,_47,_48,_49){
with(_46){
if(_46){
_observer=_48;
_selector=_49;
}
return _46;
}
}),new objj_method(sel_getUid("observer"),function(_4a,_4b){
with(_4a){
return _observer;
}
}),new objj_method(sel_getUid("postNotification:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_observer,"performSelector:withObject:",_selector,_4e);
}
})]);
