i;9;CPArray.jc;11600;
var _1=objj_getClass("CPObject");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("mutableArrayValueForKey:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(_CPKVCArray,"alloc"),"initWithKey:forProxyObject:",_5,_3);
}
}),new objj_method(sel_getUid("mutableArrayValueForKeyPath:"),function(_6,_7,_8){
with(_6){
var _9=_8.indexOf(".");
if(_9<0){
return objj_msgSend(_6,"mutableArrayValueForKey:",_8);
}
var _a=_8.substring(0,_9),_b=_8.substring(_9+1);
return objj_msgSend(objj_msgSend(_6,"valueForKeyPath:",_a),"valueForKeyPath:",_b);
}
})]);
var _1=objj_allocateClassPair(CPArray,"_CPKVCArray"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_proxyObject"),new objj_ivar("_key"),new objj_ivar("_insertSEL"),new objj_ivar("_insert"),new objj_ivar("_removeSEL"),new objj_ivar("_remove"),new objj_ivar("_replaceSEL"),new objj_ivar("_replace"),new objj_ivar("_insertManySEL"),new objj_ivar("_insertMany"),new objj_ivar("_removeManySEL"),new objj_ivar("_removeMany"),new objj_ivar("_replaceManySEL"),new objj_ivar("_replaceMany"),new objj_ivar("_objectAtIndexSEL"),new objj_ivar("_objectAtIndex"),new objj_ivar("_countSEL"),new objj_ivar("_count"),new objj_ivar("_accessSEL"),new objj_ivar("_access"),new objj_ivar("_setSEL"),new objj_ivar("_set")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithKey:forProxyObject:"),function(_c,_d,_e,_f){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPArray")},"init");
_key=_e;
_proxyObject=_f;
var _10=_key.charAt(0).toUpperCase()+_key.substring(1);
_insertSEL=sel_getName("insertObject:in"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_insertSEL)){
_insert=objj_msgSend(_proxyObject,"methodForSelector:",_insertSEL);
}
_removeSEL=sel_getName("removeObjectFrom"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeSEL)){
_remove=objj_msgSend(_proxyObject,"methodForSelector:",_removeSEL);
}
_replaceSEL=sel_getName("replaceObjectFrom"+_10+"AtIndex:withObject:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_replaceSEL)){
_replace=objj_msgSend(_proxyObject,"methodForSelector:",_replaceSEL);
}
_insertManySEL=sel_getName("insertObjects:in"+_10+"AtIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_insertManySEL)){
_insert=objj_msgSend(_proxyObject,"methodForSelector:",_insertManySEL);
}
_removeManySEL=sel_getName("removeObjectsFrom"+_10+"AtIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeManySEL)){
_remove=objj_msgSend(_proxyObject,"methodForSelector:",_removeManySEL);
}
_replaceManySEL=sel_getName("replaceObjectsFrom"+_10+"AtIndexes:withObjects:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_replaceManySEL)){
_replace=objj_msgSend(_proxyObject,"methodForSelector:",_replaceManySEL);
}
_objectAtIndexSEL=sel_getName("objectIn"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_objectAtIndexSEL)){
_objectAtIndex=objj_msgSend(_proxyObject,"methodForSelector:",_objectAtIndexSEL);
}
_countSEL=sel_getName("countOf"+_10);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_countSEL)){
_count=objj_msgSend(_proxyObject,"methodForSelector:",_countSEL);
}
_accessSEL=sel_getName(_key);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_accessSEL)){
_access=objj_msgSend(_proxyObject,"methodForSelector:",_accessSEL);
}
_setSEL=sel_getName("set"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_setSEL)){
_set=objj_msgSend(_proxyObject,"methodForSelector:",_setSEL);
}
return _c;
}
}),new objj_method(sel_getUid("copy"),function(_11,_12){
with(_11){
var _13=[],_14=objj_msgSend(_11,"count");
for(var i=0;i<_14;i++){
objj_msgSend(_13,"addObject:",objj_msgSend(_11,"objectAtIndex:",i));
}
return _13;
}
}),new objj_method(sel_getUid("_representedObject"),function(_16,_17){
with(_16){
if(_access){
return _access(_proxyObject,_accessSEL);
}
return objj_msgSend(_proxyObject,"valueForKey:",_key);
}
}),new objj_method(sel_getUid("_setRepresentedObject:"),function(_18,_19,_1a){
with(_18){
if(_set){
return _set(_proxyObject,_setSEL,_1a);
}
objj_msgSend(_proxyObject,"setValue:forKey:",_1a,_key);
}
}),new objj_method(sel_getUid("count"),function(_1b,_1c){
with(_1b){
if(_count){
return _count(_proxyObject,_countSEL);
}
return objj_msgSend(objj_msgSend(_1b,"_representedObject"),"count");
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_1d,_1e,_1f){
with(_1d){
if(_objectAtIndex){
return _objectAtIndex(_proxyObject,_objectAtIndexSEL,_1f);
}
return objj_msgSend(objj_msgSend(_1d,"_representedObject"),"objectAtIndex:",_1f);
}
}),new objj_method(sel_getUid("addObject:"),function(_20,_21,_22){
with(_20){
if(_insert){
return _insert(_proxyObject,_insertSEL,_22,objj_msgSend(_20,"count"));
}
var _23=objj_msgSend(objj_msgSend(_20,"_representedObject"),"copy");
objj_msgSend(_23,"addObject:",_22);
objj_msgSend(_20,"_setRepresentedObject:",_23);
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_24,_25,_26,_27){
with(_24){
if(_insert){
return _insert(_proxyObject,_insertSEL,_26,_27);
}
var _28=objj_msgSend(objj_msgSend(_24,"_representedObject"),"copy");
objj_msgSend(_28,"insertObject:atIndex:",_26,_27);
objj_msgSend(_24,"_setRepresentedObject:",_28);
}
}),new objj_method(sel_getUid("removeLastObject"),function(_29,_2a){
with(_29){
if(_remove){
return _remove(_proxyObject,_removeSEL,objj_msgSend(_29,"count")-1);
}
var _2b=objj_msgSend(objj_msgSend(_29,"_representedObject"),"copy");
objj_msgSend(_2b,"removeLastObject");
objj_msgSend(_29,"_setRepresentedObject:",_2b);
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_2c,_2d,_2e){
with(_2c){
if(_remove){
return _remove(_proxyObject,_removeSEL,_2e);
}
var _2f=objj_msgSend(objj_msgSend(_2c,"_representedObject"),"copy");
objj_msgSend(_2f,"removeObjectAtIndex:",_2e);
objj_msgSend(_2c,"_setRepresentedObject:",_2f);
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_30,_31,_32,_33){
with(_30){
if(_replace){
return _replace(_proxyObject,_replaceSEL,_32,_33);
}
var _34=objj_msgSend(objj_msgSend(_30,"_representedObject"),"copy");
objj_msgSend(_34,"replaceObjectAtIndex:withObject:",_32,_33);
objj_msgSend(_30,"_setRepresentedObject:",_34);
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_35,_36,_37){
with(_35){
var _38=objj_msgSend(_37,"firstIndex"),_39=[];
while(_38!=CPNotFound){
objj_msgSend(_39,"addObject:",objj_msgSend(_35,"objectAtIndex:",_38));
_38=objj_msgSend(_37,"indexGreaterThanIndex:",_38);
}
return _39;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_3a,_3b){
with(_3a){
var a=[];
a.isa=_3a;
var _3d=class_copyIvarList(_3a),_3e=_3d.length;
while(_3e--){
a[ivar_getName(_3d[_3e])]=nil;
}
return a;
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPArray\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("valueForKey:"),function(_3f,_40,_41){
with(_3f){
if(_41.indexOf("@")===0){
if(_41.indexOf(".")!==-1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"called valueForKey: on an array with a complex key ("+_41+"). use valueForKeyPath:");
}
if(_41=="@count"){
return length;
}
return nil;
}else{
var _42=[],_43=objj_msgSend(_3f,"objectEnumerator"),_44;
while((_44=objj_msgSend(_43,"nextObject"))!==nil){
var _45=objj_msgSend(_44,"valueForKey:",_41);
if(_45===nil||_45===undefined){
_45=objj_msgSend(CPNull,"null");
}
_42.push(_45);
}
return _42;
}
}
}),new objj_method(sel_getUid("valueForKeyPath:"),function(_46,_47,_48){
with(_46){
if(_48.indexOf("@")===0){
var _49=_48.indexOf("."),_4a=_48.substring(1,_49),_4b=_48.substring(_49+1);
if(_4c[_4a]){
return _4c[_4a](_46,_47,_4b);
}
return nil;
}else{
var _4d=[],_4e=objj_msgSend(_46,"objectEnumerator"),_4f;
while((_4f=objj_msgSend(_4e,"nextObject"))!==nil){
var _50=objj_msgSend(_4f,"valueForKeyPath:",_48);
if(_50===nil||_50===undefined){
_50=objj_msgSend(CPNull,"null");
}
_4d.push(_50);
}
return _4d;
}
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_51,_52,_53,_54){
with(_51){
var _55=objj_msgSend(_51,"objectEnumerator"),_56;
while(_56=objj_msgSend(_55,"nextObject")){
objj_msgSend(_56,"setValue:forKey:",_53,_54);
}
}
}),new objj_method(sel_getUid("setValue:forKeyPath:"),function(_57,_58,_59,_5a){
with(_57){
var _5b=objj_msgSend(_57,"objectEnumerator"),_5c;
while(_5c=objj_msgSend(_5b,"nextObject")){
objj_msgSend(_5c,"setValue:forKeyPath:",_59,_5a);
}
}
})]);
var _4c=[];
_4c["avg"]=avgOperator=function(_5d,_5e,_5f){
var _60=objj_msgSend(_5d,"valueForKeyPath:",_5f),_61=objj_msgSend(_60,"count"),_62=_61;
average=0;
if(!_61){
return 0;
}
while(_62--){
average+=objj_msgSend(_60[_62],"doubleValue");
}
return average/_61;
};
_4c["max"]=maxOperator=function(_63,_64,_65){
var _66=objj_msgSend(_63,"valueForKeyPath:",_65),_67=objj_msgSend(_66,"count")-1,max=objj_msgSend(_66,"lastObject");
while(_67--){
var _69=_66[_67];
if(objj_msgSend(max,"compare:",_69)<0){
max=_69;
}
}
return max;
};
_4c["min"]=minOperator=function(_6a,_6b,_6c){
var _6d=objj_msgSend(_6a,"valueForKeyPath:",_6c),_6e=objj_msgSend(_6d,"count")-1,min=objj_msgSend(_6d,"lastObject");
while(_6e--){
var _70=_6d[_6e];
if(objj_msgSend(min,"compare:",_70)>0){
min=_70;
}
}
return min;
};
_4c["count"]=countOperator=function(_71,_72,_73){
return objj_msgSend(_71,"count");
};
_4c["sum"]=sumOperator=function(_74,_75,_76){
var _77=objj_msgSend(_74,"valueForKeyPath:",_76),_78=objj_msgSend(_77,"count"),sum=0;
while(_78--){
sum+=objj_msgSend(_77[_78],"doubleValue");
}
return sum;
};
var _1=objj_getClass("CPArray");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPArray\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addObserver:toObjectsAtIndexes:forKeyPath:options:context:"),function(_7a,_7b,_7c,_7d,_7e,_7f,_80){
with(_7a){
var _81=objj_msgSend(_7d,"firstIndex");
while(_81>=0){
objj_msgSend(_7a[_81],"addObserver:forKeyPath:options:context:",_7c,_7e,_7f,_80);
_81=objj_msgSend(_7d,"indexGreaterThanIndex:",_81);
}
}
}),new objj_method(sel_getUid("removeObserver:fromObjectsAtIndexes:forKeyPath:"),function(_82,_83,_84,_85,_86){
with(_82){
var _87=objj_msgSend(_85,"firstIndex");
while(_87>=0){
objj_msgSend(_82[_87],"removeObserver:forKeyPath:",_84,_86);
_87=objj_msgSend(_85,"indexGreaterThanIndex:",_87);
}
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_88,_89,_8a,_8b,_8c,_8d){
with(_88){
if(objj_msgSend(isa,"instanceMethodForSelector:",_89)===objj_msgSend(CPArray,"instanceMethodForSelector:",_89)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unsupported method on CPArray");
}else{
objj_msgSendSuper({receiver:_88,super_class:objj_getClass("CPArray").super_class},"addObserver:forKeyPath:options:context:",_8a,_8b,_8c,_8d);
}
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_8e,_8f,_90,_91){
with(_8e){
if(objj_msgSend(isa,"instanceMethodForSelector:",_8f)===objj_msgSend(CPArray,"instanceMethodForSelector:",_8f)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unsupported method on CPArray");
}else{
objj_msgSendSuper({receiver:_8e,super_class:objj_getClass("CPArray").super_class},"removeObserver:forKeyPath:",_90,_91);
}
}
})]);
