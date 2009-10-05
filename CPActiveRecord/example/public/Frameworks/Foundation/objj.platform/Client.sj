@STATIC;1.0;p;13;CPArray+KVO.ji;9;CPArray.jc;11600;
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
p;9;CPArray.ji;10;CPObject.ji;9;CPRange.ji;14;CPEnumerator.ji;18;CPSortDescriptor.ji;13;CPException.jc;17781;
var _1=objj_allocateClassPair(CPEnumerator,"_CPArrayEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithArray:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPEnumerator")},"init");
if(_3){
_array=_5;
_index=-1;
}
return _3;
}
}),new objj_method(sel_getUid("nextObject"),function(_6,_7){
with(_6){
if(++_index>=objj_msgSend(_array,"count")){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _1=objj_allocateClassPair(CPEnumerator,"_CPReverseArrayEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithArray:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPEnumerator")},"init");
if(_8){
_array=_a;
_index=objj_msgSend(_array,"count");
}
return _8;
}
}),new objj_method(sel_getUid("nextObject"),function(_b,_c){
with(_b){
if(--_index<0){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPArray"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
return _d;
}
}),new objj_method(sel_getUid("initWithArray:"),function(_f,_10,_11){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPObject")},"init");
if(_f){
objj_msgSend(_f,"setArray:",_11);
}
return _f;
}
}),new objj_method(sel_getUid("initWithArray:copyItems:"),function(_12,_13,_14,_15){
with(_12){
if(!_15){
return objj_msgSend(_12,"initWithArray:",_14);
}
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPObject")},"init");
if(_12){
var _16=0,_17=objj_msgSend(_14,"count");
for(;_16<_17;++i){
if(_14[i].isa){
_12[i]=objj_msgSend(_14,"copy");
}else{
_12[i]=_14;
}
}
}
return _12;
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_18,_19,_1a){
with(_18){
var i=2,_1c;
for(;i<arguments.length&&(_1c=arguments[i])!=nil;++i){
push(_1c);
}
return _18;
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_1d,_1e,_1f,_20){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPObject")},"init");
if(_1d){
var _21=0;
for(;_21<_20;++_21){
push(_1f[_21]);
}
}
return _1d;
}
}),new objj_method(sel_getUid("containsObject:"),function(_22,_23,_24){
with(_22){
return objj_msgSend(_22,"indexOfObject:",_24)!=CPNotFound;
}
}),new objj_method(sel_getUid("count"),function(_25,_26){
with(_25){
return length;
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_27,_28,_29){
with(_27){
if(_29===nil){
return CPNotFound;
}
var i=0,_2b=length;
if(_29.isa){
for(;i<_2b;++i){
if(objj_msgSend(_27[i],"isEqual:",_29)){
return i;
}
}
}else{
if(_27.indexOf){
return indexOf(_29);
}else{
for(;i<_2b;++i){
if(_27[i]==_29){
return i;
}
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_2c,_2d,_2e,_2f){
with(_2c){
if(_2e===nil){
return CPNotFound;
}
var i=_2f.location,_31=MIN(CPMaxRange(_2f),length);
if(_2e.isa){
for(;i<_31;++i){
if(objj_msgSend(_2c[i],"isEqual:",_2e)){
return i;
}
}
}else{
for(;i<_31;++i){
if(_2c[i]==_2e){
return i;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:"),function(_32,_33,_34){
with(_32){
if(_34===nil){
return CPNotFound;
}
if(_32.indexOf){
return indexOf(_34);
}else{
var _35=0,_36=length;
for(;_35<_36;++_35){
if(_32[_35]==_34){
return _35;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_37,_38,_39,_3a){
with(_37){
if(_39===nil){
return CPNotFound;
}
if(_37.indexOf){
var _3b=indexOf(_39,_3a.location);
if(CPLocationInRange(_3b,_3a)){
return _3b;
}
}else{
var _3b=_3a.location,_3c=MIN(CPMaxRange(_3a),length);
for(;_3b<_3c;++_3b){
if(_37[_3b]==_39){
return _3b;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:sortedBySelector:"),function(_3d,_3e,_3f,_40){
with(_3d){
return objj_msgSend(_3d,"indexOfObject:sortedByFunction:",_3f,function(lhs,rhs){
objj_msgSend(lhs,_40,rhs);
});
}
}),new objj_method(sel_getUid("indexOfObject:sortedByFunction:"),function(_43,_44,_45,_46){
with(_43){
return objj_msgSend(_43,"indexOfObject:sortedByFunction:context:",_45,_46,nil);
}
}),new objj_method(sel_getUid("indexOfObject:sortedByFunction:context:"),function(_47,_48,_49,_4a,_4b){
with(_47){
if(!_4a||_49===undefined){
return CPNotFound;
}
var mid,c,_4e=0,_4f=length-1;
while(_4e<=_4f){
mid=FLOOR((_4e+_4f)/2);
c=_4a(_49,_47[mid],_4b);
if(c>0){
_4e=mid+1;
}else{
if(c<0){
_4f=mid-1;
}else{
while(mid<length-1&&_4a(_49,_47[mid+1],_4b)==CPOrderedSame){
mid++;
}
return mid;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:sortedByDescriptors:"),function(_50,_51,_52,_53){
with(_50){
return objj_msgSend(_50,"indexOfObject:sortedByFunction:",_52,function(lhs,rhs){
var i=0,_57=objj_msgSend(_53,"count"),_58=CPOrderedSame;
while(i<_57){
if((_58=objj_msgSend(_53[i++],"compareObject:withObject:",lhs,rhs))!=CPOrderedSame){
return _58;
}
}
return _58;
});
}
}),new objj_method(sel_getUid("lastObject"),function(_59,_5a){
with(_59){
var _5b=objj_msgSend(_59,"count");
if(!_5b){
return nil;
}
return _59[_5b-1];
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_5c,_5d,_5e){
with(_5c){
if(_5e>=length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"index ("+_5e+") beyond bounds ("+length+")");
}
return _5c[_5e];
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_5f,_60,_61){
with(_5f){
var _62=objj_msgSend(_61,"firstIndex"),_63=[];
while(_62!=CPNotFound){
objj_msgSend(_63,"addObject:",_5f[_62]);
_62=objj_msgSend(_61,"indexGreaterThanIndex:",_62);
}
return _63;
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_64,_65){
with(_64){
return objj_msgSend(objj_msgSend(_CPArrayEnumerator,"alloc"),"initWithArray:",_64);
}
}),new objj_method(sel_getUid("reverseObjectEnumerator"),function(_66,_67){
with(_66){
return objj_msgSend(objj_msgSend(_CPReverseArrayEnumerator,"alloc"),"initWithArray:",_66);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:"),function(_68,_69,_6a){
with(_68){
if(!_6a){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"makeObjectsPerformSelector: 'aSelector' can't be nil");
}
var _6b=0,_6c=length;
for(;_6b<_6c;++_6b){
objj_msgSend(_68[_6b],_6a);
}
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"),function(_6d,_6e,_6f,_70){
with(_6d){
if(!_6f){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"makeObjectsPerformSelector:withObject 'aSelector' can't be nil");
}
var _71=0,_72=length;
for(;_71<_72;++_71){
objj_msgSend(_6d[_71],_6f,_70);
}
}
}),new objj_method(sel_getUid("firstObjectCommonWithArray:"),function(_73,_74,_75){
with(_73){
if(!objj_msgSend(_75,"count")||!objj_msgSend(_73,"count")){
return nil;
}
var i=0,_77=objj_msgSend(_73,"count");
for(;i<_77;++i){
if(objj_msgSend(_75,"containsObject:",_73[i])){
return _73[i];
}
}
return nil;
}
}),new objj_method(sel_getUid("isEqualToArray:"),function(_78,_79,_7a){
with(_78){
if(_78===_7a){
return YES;
}
if(length!=_7a.length){
return NO;
}
var _7b=0,_7c=objj_msgSend(_78,"count");
for(;_7b<_7c;++_7b){
var lhs=_78[_7b],rhs=_7a[_7b];
if(lhs!==rhs&&(!lhs.isa||!rhs.isa||!objj_msgSend(lhs,"isEqual:",rhs))){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_7f,_80,_81){
with(_7f){
if(_7f===_81){
return YES;
}
if(!objj_msgSend(_81,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
return NO;
}
return objj_msgSend(_7f,"isEqualToArray:",_81);
}
}),new objj_method(sel_getUid("arrayByAddingObject:"),function(_82,_83,_84){
with(_82){
if(_84===nil||_84===undefined){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"arrayByAddingObject: object can't be nil");
}
var _85=objj_msgSend(_82,"copy");
_85.push(_84);
return _85;
}
}),new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"),function(_86,_87,_88){
with(_86){
return slice(0).concat(_88);
}
}),new objj_method(sel_getUid("subarrayWithRange:"),function(_89,_8a,_8b){
with(_89){
if(_8b.location<0||CPMaxRange(_8b)>length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"subarrayWithRange: aRange out of bounds");
}
return slice(_8b.location,CPMaxRange(_8b));
}
}),new objj_method(sel_getUid("sortedArrayUsingDescriptors:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=objj_msgSend(_8c,"copy");
objj_msgSend(_8f,"sortUsingDescriptors:",_8e);
return _8f;
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:"),function(_90,_91,_92){
with(_90){
return objj_msgSend(_90,"sortedArrayUsingFunction:context:",_92,nil);
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:context:"),function(_93,_94,_95,_96){
with(_93){
var _97=objj_msgSend(_93,"copy");
objj_msgSend(_97,"sortUsingFunction:context:",_95,_96);
return _97;
}
}),new objj_method(sel_getUid("sortedArrayUsingSelector:"),function(_98,_99,_9a){
with(_98){
var _9b=objj_msgSend(_98,"copy");
objj_msgSend(_9b,"sortUsingSelector:",_9a);
return _9b;
}
}),new objj_method(sel_getUid("componentsJoinedByString:"),function(_9c,_9d,_9e){
with(_9c){
return join(_9e);
}
}),new objj_method(sel_getUid("description"),function(_9f,_a0){
with(_9f){
var _a1=0,_a2=objj_msgSend(_9f,"count"),_a3="(";
for(;_a1<_a2;++_a1){
var _a4=_9f[_a1];
if(_a4&&_a4.isa){
_a3+=objj_msgSend(_a4,"description");
}else{
_a3+=_a4;
}
if(_a1!==_a2-1){
_a3+=", ";
}
}
return _a3+")";
}
}),new objj_method(sel_getUid("pathsMatchingExtensions:"),function(_a5,_a6,_a7){
with(_a5){
var _a8=0,_a9=objj_msgSend(_a5,"count"),_aa=[];
for(;_a8<_a9;++_a8){
if(_a5[_a8].isa&&objj_msgSend(_a5[_a8],"isKindOfClass:",objj_msgSend(CPString,"class"))&&objj_msgSend(_a7,"containsObject:",objj_msgSend(_a5[_a8],"pathExtension"))){
_aa.push(_a5[_a8]);
}
}
return _aa;
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_ab,_ac,_ad,_ae){
with(_ab){
var i=0,_b0=objj_msgSend(_ab,"count");
for(;i<_b0;++i){
objj_msgSend(_ab[i],"setValue:forKey:",_ad,_ae);
}
}
}),new objj_method(sel_getUid("valueForKey:"),function(_b1,_b2,_b3){
with(_b1){
var i=0,_b5=objj_msgSend(_b1,"count"),_b6=[];
for(;i<_b5;++i){
_b6.push(objj_msgSend(_b1[i],"valueForKey:",_b3));
}
return _b6;
}
}),new objj_method(sel_getUid("copy"),function(_b7,_b8){
with(_b7){
return slice(0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_b9,_ba){
with(_b9){
return [];
}
}),new objj_method(sel_getUid("array"),function(_bb,_bc){
with(_bb){
return objj_msgSend(objj_msgSend(_bb,"alloc"),"init");
}
}),new objj_method(sel_getUid("arrayWithArray:"),function(_bd,_be,_bf){
with(_bd){
return objj_msgSend(objj_msgSend(_bd,"alloc"),"initWithArray:",_bf);
}
}),new objj_method(sel_getUid("arrayWithObject:"),function(_c0,_c1,_c2){
with(_c0){
return objj_msgSend(objj_msgSend(_c0,"alloc"),"initWithObjects:",_c2);
}
}),new objj_method(sel_getUid("arrayWithObjects:"),function(_c3,_c4,_c5){
with(_c3){
var i=2,_c7=objj_msgSend(objj_msgSend(_c3,"alloc"),"init"),_c8;
for(;i<arguments.length&&(_c8=arguments[i])!=nil;++i){
_c7.push(_c8);
}
return _c7;
}
}),new objj_method(sel_getUid("arrayWithObjects:count:"),function(_c9,_ca,_cb,_cc){
with(_c9){
return objj_msgSend(objj_msgSend(_c9,"alloc"),"initWithObjects:count:",_cb,_cc);
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPArray\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCapacity:"),function(_cd,_ce,_cf){
with(_cd){
return _cd;
}
}),new objj_method(sel_getUid("addObject:"),function(_d0,_d1,_d2){
with(_d0){
push(_d2);
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_d3,_d4,_d5){
with(_d3){
splice.apply(_d3,[length,0].concat(_d5));
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_d6,_d7,_d8,_d9){
with(_d6){
splice(_d9,0,_d8);
}
}),new objj_method(sel_getUid("insertObjects:atIndexes:"),function(_da,_db,_dc,_dd){
with(_da){
var _de=objj_msgSend(_dd,"count"),_df=objj_msgSend(_dc,"count");
if(_de!==_df){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"the counts of the passed-in array ("+_df+") and index set ("+_de+") must be identical.");
}
var _e0=objj_msgSend(_dd,"lastIndex");
if(_e0>=objj_msgSend(_da,"count")+_de){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"the last index ("+_e0+") must be less than the sum of the original count ("+objj_msgSend(_da,"count")+") and the insertion count ("+_de+").");
}
var _e1=0,_e2=objj_msgSend(_dd,"firstIndex");
for(;_e1<_df;++_e1,_e2=objj_msgSend(_dd,"indexGreaterThanIndex:",_e2)){
objj_msgSend(_da,"insertObject:atIndex:",_dc[_e1],_e2);
}
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_e3,_e4,_e5,_e6){
with(_e3){
_e3[_e5]=_e6;
}
}),new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"),function(_e7,_e8,_e9,_ea){
with(_e7){
var i=0,_ec=objj_msgSend(_e9,"firstIndex");
while(_ec!=CPNotFound){
objj_msgSend(_e7,"replaceObjectAtIndex:withObject:",_ec,_ea[i++]);
_ec=objj_msgSend(_e9,"indexGreaterThanIndex:",_ec);
}
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"),function(_ed,_ee,_ef,_f0,_f1){
with(_ed){
if(!_f1.location&&_f1.length==objj_msgSend(_f0,"count")){
objj_msgSend(_ed,"replaceObjectsInRange:withObjectsFromArray:",_ef,_f0);
}else{
splice.apply(_ed,[_ef.location,_ef.length].concat(objj_msgSend(_f0,"subarrayWithRange:",_f1)));
}
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:"),function(_f2,_f3,_f4,_f5){
with(_f2){
splice.apply(_f2,[_f4.location,_f4.length].concat(_f5));
}
}),new objj_method(sel_getUid("setArray:"),function(_f6,_f7,_f8){
with(_f6){
if(_f6==_f8){
return;
}
splice.apply(_f6,[0,length].concat(_f8));
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_f9,_fa){
with(_f9){
splice(0,length);
}
}),new objj_method(sel_getUid("removeLastObject"),function(_fb,_fc){
with(_fb){
pop();
}
}),new objj_method(sel_getUid("removeObject:"),function(_fd,_fe,_ff){
with(_fd){
objj_msgSend(_fd,"removeObject:inRange:",_ff,CPMakeRange(0,length));
}
}),new objj_method(sel_getUid("removeObject:inRange:"),function(self,_cmd,_102,_103){
with(self){
var _104;
while((_104=objj_msgSend(self,"indexOfObject:inRange:",_102,_103))!=CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_104);
_103=CPIntersectionRange(CPMakeRange(_104,length-_104),_103);
}
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(self,_cmd,_107){
with(self){
splice(_107,1);
}
}),new objj_method(sel_getUid("removeObjectsAtIndexes:"),function(self,_cmd,_10a){
with(self){
var _10b=objj_msgSend(_10a,"lastIndex");
while(_10b!=CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_10b);
_10b=objj_msgSend(_10a,"indexLessThanIndex:",_10b);
}
}
}),new objj_method(sel_getUid("removeObjectIdenticalTo:"),function(self,_cmd,_10e){
with(self){
objj_msgSend(self,"removeObjectIdenticalTo:inRange:",_10e,CPMakeRange(0,length));
}
}),new objj_method(sel_getUid("removeObjectIdenticalTo:inRange:"),function(self,_cmd,_111,_112){
with(self){
var _113;
while((_113=objj_msgSend(self,"indexOfObjectIdenticalTo:inRange:",_111,_112))!=CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_113);
_112=CPIntersectionRange(CPMakeRange(_113,length-_113),_112);
}
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(self,_cmd,_116){
with(self){
var _117=0,_118=objj_msgSend(_116,"count");
for(;_117<_118;++_117){
objj_msgSend(self,"removeObject:",_116[_117]);
}
}
}),new objj_method(sel_getUid("removeObjectsInRange:"),function(self,_cmd,_11b){
with(self){
splice(_11b.location,_11b.length);
}
}),new objj_method(sel_getUid("exchangeObjectAtIndex:withObjectAtIndex:"),function(self,_cmd,_11e,_11f){
with(self){
var _120=self[_11e];
self[_11e]=self[_11f];
self[_11f]=_120;
}
}),new objj_method(sel_getUid("sortUsingDescriptors:"),function(self,_cmd,_123){
with(self){
sort(function(lhs,rhs){
var i=0,_127=objj_msgSend(_123,"count"),_128=CPOrderedSame;
while(i<_127){
if((_128=objj_msgSend(_123[i++],"compareObject:withObject:",lhs,rhs))!=CPOrderedSame){
return _128;
}
}
return _128;
});
}
}),new objj_method(sel_getUid("sortUsingFunction:context:"),function(self,_cmd,_12b,_12c){
with(self){
sort(function(lhs,rhs){
return _12b(lhs,rhs,_12c);
});
}
}),new objj_method(sel_getUid("sortUsingSelector:"),function(self,_cmd,_131){
with(self){
sort(function(lhs,rhs){
return objj_msgSend(lhs,_131,rhs);
});
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("arrayWithCapacity:"),function(self,_cmd,_136){
with(self){
return objj_msgSend(objj_msgSend(self,"alloc"),"initWithCapacity:",_136);
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPArray\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_139){
with(self){
return objj_msgSend(_139,"decodeObjectForKey:","CP.objects");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_13c){
with(self){
objj_msgSend(_13c,"_encodeArrayOfObjects:forKey:",self,"CP.objects");
}
})]);
var _1=objj_allocateClassPair(CPArray,"CPMutableArray"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
Array.prototype.isa=CPArray;
objj_msgSend(CPArray,"initialize");
p;20;CPAttributedString.ji;10;CPObject.ji;10;CPString.ji;14;CPDictionary.ji;9;CPRange.jc;12370;
var _1=objj_allocateClassPair(CPObject,"CPAttributedString"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_string"),new objj_ivar("_rangeEntries")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"initWithString:attributes:",_5,nil);
}
}),new objj_method(sel_getUid("initWithAttributedString:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_6,"initWithString:attributes:","",nil);
objj_msgSend(_9,"setAttributedString:",_8);
return _9;
}
}),new objj_method(sel_getUid("initWithString:attributes:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPObject")},"init");
if(!_d){
_d=objj_msgSend(CPDictionary,"dictionary");
}
_string=""+_c;
_rangeEntries=[_e(CPMakeRange(0,_string.length),_d)];
return _a;
}
}),new objj_method(sel_getUid("string"),function(_f,_10){
with(_f){
return _string;
}
}),new objj_method(sel_getUid("mutableString"),function(_11,_12){
with(_11){
return objj_msgSend(_11,"string");
}
}),new objj_method(sel_getUid("length"),function(_13,_14){
with(_13){
return _string.length;
}
}),new objj_method(sel_getUid("_indexOfEntryWithIndex:"),function(_15,_16,_17){
with(_15){
if(_17<0||_17>_string.length||_17===undefined){
return CPNotFound;
}
var _18=function(_19,_1a){
if(CPLocationInRange(_19,_1a.range)){
return CPOrderedSame;
}else{
if(CPMaxRange(_1a.range)<=_19){
return CPOrderedDescending;
}else{
return CPOrderedAscending;
}
}
};
return objj_msgSend(_rangeEntries,"indexOfObject:sortedByFunction:",_17,_18);
}
}),new objj_method(sel_getUid("attributesAtIndex:effectiveRange:"),function(_1b,_1c,_1d,_1e){
with(_1b){
var _1f=objj_msgSend(_1b,"_indexOfEntryWithIndex:",_1d);
if(_1f==CPNotFound){
return nil;
}
var _20=_rangeEntries[_1f];
if(_1e){
_1e.location=_20.range.location;
_1e.length=_20.range.length;
}
return _20.attributes;
}
}),new objj_method(sel_getUid("attributesAtIndex:longestEffectiveRange:inRange:"),function(_21,_22,_23,_24,_25){
with(_21){
var _26=objj_msgSend(_21,"_indexOfEntryWithIndex:",_23);
if(_26==CPNotFound){
return nil;
}
if(!_24){
return _rangeEntries[_26].attributes;
}
if(CPRangeInRange(_rangeEntries[_26].range,_25)){
_24.location=_25.location;
_24.length=_25.length;
return _rangeEntries[_26].attributes;
}
var _27=_26-1,_28=_rangeEntries[_26],_29=_28.attributes;
while(_27>=0){
var _2a=_rangeEntries[_27];
if(CPMaxRange(_2a.range)>_25.location&&objj_msgSend(_2a.attributes,"isEqualToDictionary:",_29)){
_28=_2a;
_27--;
}else{
break;
}
}
_24.location=MAX(_28.range.location,_25.location);
_28=_rangeEntries[_26];
_27=_26+1;
while(_27<_rangeEntries.length){
var _2a=_rangeEntries[_27];
if(_2a.range.location<CPMaxRange(_25)&&objj_msgSend(_2a.attributes,"isEqualToDictionary:",_29)){
_28=_2a;
_27++;
}else{
break;
}
}
_24.length=MIN(CPMaxRange(_28.range),CPMaxRange(_25))-_24.location;
return _29;
}
}),new objj_method(sel_getUid("attribute:atIndex:effectiveRange:"),function(_2b,_2c,_2d,_2e,_2f){
with(_2b){
if(!_2d){
if(_2f){
_2f.location=0;
_2f.length=_string.length;
}
return nil;
}
return objj_msgSend(objj_msgSend(_2b,"attributesAtIndex:effectiveRange:",_2e,_2f),"valueForKey:",_2d);
}
}),new objj_method(sel_getUid("attribute:atIndex:longestEffectiveRange:inRange:"),function(_30,_31,_32,_33,_34,_35){
with(_30){
var _36=objj_msgSend(_30,"_indexOfEntryWithIndex:",_33);
if(_36==CPNotFound||!_32){
return nil;
}
if(!_34){
return objj_msgSend(_rangeEntries[_36].attributes,"objectForKey:",_32);
}
if(CPRangeInRange(_rangeEntries[_36].range,_35)){
_34.location=_35.location;
_34.length=_35.length;
return objj_msgSend(_rangeEntries[_36].attributes,"objectForKey:",_32);
}
var _37=_36-1,_38=_rangeEntries[_36],_39=objj_msgSend(_38.attributes,"objectForKey:",_32);
while(_37>=0){
var _3a=_rangeEntries[_37];
if(CPMaxRange(_3a.range)>_35.location&&_3b(_39,objj_msgSend(_3a.attributes,"objectForKey:",_32))){
_38=_3a;
_37--;
}else{
break;
}
}
_34.location=MAX(_38.range.location,_35.location);
_38=_rangeEntries[_36];
_37=_36+1;
while(_37<_rangeEntries.length){
var _3a=_rangeEntries[_37];
if(_3a.range.location<CPMaxRange(_35)&&_3b(_39,objj_msgSend(_3a.attributes,"objectForKey:",_32))){
_38=_3a;
_37++;
}else{
break;
}
}
_34.length=MIN(CPMaxRange(_38.range),CPMaxRange(_35))-_34.location;
return _39;
}
}),new objj_method(sel_getUid("isEqualToAttributedString:"),function(_3c,_3d,_3e){
with(_3c){
if(!_3e){
return NO;
}
if(_string!=objj_msgSend(_3e,"string")){
return NO;
}
var _3f=CPMakeRange(),_40=CPMakeRange(),_41=objj_msgSend(_3c,"attributesAtIndex:effectiveRange:",0,_3f),_42=objj_msgSend(_3e,"attributesAtIndex:effectiveRange:",0,_40),_43=_string.length;
while(CPMaxRange(CPUnionRange(_3f,_40))<_43){
if(CPIntersectionRange(_3f,_40).length>0&&!objj_msgSend(_41,"isEqualToDictionary:",_42)){
return NO;
}
if(CPMaxRange(_3f)<CPMaxRange(_40)){
_41=objj_msgSend(_3c,"attributesAtIndex:effectiveRange:",CPMaxRange(_3f),_3f);
}else{
_42=objj_msgSend(_3e,"attributesAtIndex:effectiveRange:",CPMaxRange(_40),_40);
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_44,_45,_46){
with(_44){
if(_46==_44){
return YES;
}
if(objj_msgSend(_46,"isKindOfClass:",objj_msgSend(_44,"class"))){
return objj_msgSend(_44,"isEqualToAttributedString:",_46);
}
return NO;
}
}),new objj_method(sel_getUid("attributedSubstringFromRange:"),function(_47,_48,_49){
with(_47){
if(!_49||CPMaxRange(_49)>_string.length||_49.location<0){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"tried to get attributedSubstring for an invalid range: "+(_49?CPStringFromRange(_49):"nil"));
}
var _4a=objj_msgSend(objj_msgSend(CPAttributedString,"alloc"),"initWithString:",_string.substring(_49.location,CPMaxRange(_49))),_4b=objj_msgSend(_47,"_indexOfEntryWithIndex:",_49.location),_4c=_rangeEntries[_4b],_4d=CPMaxRange(_49);
_4a._rangeEntries=[];
while(_4c&&CPMaxRange(_4c.range)<_4d){
var _4e=_4f(_4c);
_4e.range.location-=_49.location;
if(_4e.range.location<0){
_4e.range.length+=_4e.range.location;
_4e.range.location=0;
}
_4a._rangeEntries.push(_4e);
_4c=_rangeEntries[++_4b];
}
if(_4c){
var _50=_4f(_4c);
_50.range.length=CPMaxRange(_49)-_50.range.location;
_50.range.location-=_49.location;
if(_50.range.location<0){
_50.range.length+=_50.range.location;
_50.range.location=0;
}
_4a._rangeEntries.push(_50);
}
return _4a;
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withString:"),function(_51,_52,_53,_54){
with(_51){
objj_msgSend(_51,"beginEditing");
if(!_54){
_54="";
}
var _55=objj_msgSend(_51,"_indexOfEntryWithIndex:",_53.location),_56=_rangeEntries[_55],_57=objj_msgSend(_51,"_indexOfEntryWithIndex:",MAX(CPMaxRange(_53)-1,0)),_58=_rangeEntries[_57],_59=_54.length-_53.length;
_string=_string.substring(0,_53.location)+_54+_string.substring(CPMaxRange(_53));
if(_55==_57){
_56.range.length+=_59;
}else{
_58.range.length=CPMaxRange(_58.range)-CPMaxRange(_53);
_58.range.location=CPMaxRange(_53);
_56.range.length=CPMaxRange(_53)-_56.range.location;
_rangeEntries.splice(_55,_57-_55);
}
_57=_55+1;
while(_57<_rangeEntries.length){
_rangeEntries[_57++].range.location+=_59;
}
objj_msgSend(_51,"endEditing");
}
}),new objj_method(sel_getUid("deleteCharactersInRange:"),function(_5a,_5b,_5c){
with(_5a){
objj_msgSend(_5a,"replaceCharactersInRange:withString:",_5c,nil);
}
}),new objj_method(sel_getUid("setAttributes:range:"),function(_5d,_5e,_5f,_60){
with(_5d){
objj_msgSend(_5d,"beginEditing");
var _61=objj_msgSend(_5d,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_60.location,YES),_62=objj_msgSend(_5d,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",CPMaxRange(_60),YES),_63=_61;
if(_62==CPNotFound){
_62=_rangeEntries.length;
}
while(_63<_62){
_rangeEntries[_63++].attributes=objj_msgSend(_5f,"copy");
}
objj_msgSend(_5d,"_coalesceRangeEntriesFromIndex:toIndex:",_61,_62);
objj_msgSend(_5d,"endEditing");
}
}),new objj_method(sel_getUid("addAttributes:range:"),function(_64,_65,_66,_67){
with(_64){
objj_msgSend(_64,"beginEditing");
var _68=objj_msgSend(_64,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_67.location,YES),_69=objj_msgSend(_64,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",CPMaxRange(_67),YES),_6a=_68;
if(_69==CPNotFound){
_69=_rangeEntries.length;
}
while(_6a<_69){
var _6b=objj_msgSend(_66,"allKeys"),_6c=objj_msgSend(_6b,"count");
while(_6c--){
objj_msgSend(_rangeEntries[_6a].attributes,"setObject:forKey:",objj_msgSend(_66,"objectForKey:",_6b[_6c]),_6b[_6c]);
}
_6a++;
}
objj_msgSend(_64,"_coalesceRangeEntriesFromIndex:toIndex:",_68,_69);
objj_msgSend(_64,"endEditing");
}
}),new objj_method(sel_getUid("addAttribute:value:range:"),function(_6d,_6e,_6f,_70,_71){
with(_6d){
objj_msgSend(_6d,"addAttributes:range:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_70,_6f),_71);
}
}),new objj_method(sel_getUid("removeAttribute:range:"),function(_72,_73,_74,_75){
with(_72){
objj_msgSend(_72,"addAttribute:value:range:",_74,nil,_75);
}
}),new objj_method(sel_getUid("appendAttributedString:"),function(_76,_77,_78){
with(_76){
objj_msgSend(_76,"insertAttributedString:atIndex:",_78,_string.length);
}
}),new objj_method(sel_getUid("insertAttributedString:atIndex:"),function(_79,_7a,_7b,_7c){
with(_79){
objj_msgSend(_79,"beginEditing");
if(_7c<0||_7c>objj_msgSend(_79,"length")){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"tried to insert attributed string at an invalid index: "+_7c);
}
var _7d=objj_msgSend(_79,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_7c,YES),_7e=_7b._rangeEntries,_7f=objj_msgSend(_7b,"length");
if(_7d==CPNotFound){
_7d=_rangeEntries.length;
}
_string=_string.substring(0,_7c)+_7b._string+_string.substring(_7c);
var _80=_7d;
while(_80<_rangeEntries.length){
_rangeEntries[_80++].range.location+=_7f;
}
var _81=_7e.length,_82=0;
while(_82<_81){
var _83=_4f(_7e[_82++]);
_83.range.location+=_7c;
_rangeEntries.splice(_7d-1+_82,0,_83);
}
objj_msgSend(_79,"endEditing");
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withAttributedString:"),function(_84,_85,_86,_87){
with(_84){
objj_msgSend(_84,"beginEditing");
objj_msgSend(_84,"deleteCharactersInRange:",_86);
objj_msgSend(_84,"insertAttributedString:atIndex:",_87,_86.location);
objj_msgSend(_84,"endEditing");
}
}),new objj_method(sel_getUid("setAttributedString:"),function(_88,_89,_8a){
with(_88){
objj_msgSend(_88,"beginEditing");
_string=_8a._string;
_rangeEntries=[];
for(var i=0,_8c=_8a._rangeEntries.length;i<_8c;i++){
_rangeEntries.push(_4f(_8a._rangeEntries[i]));
}
objj_msgSend(_88,"endEditing");
}
}),new objj_method(sel_getUid("_indexOfRangeEntryForIndex:splitOnMaxIndex:"),function(_8d,_8e,_8f,_90){
with(_8d){
var _91=objj_msgSend(_8d,"_indexOfEntryWithIndex:",_8f);
if(_91<0){
return _91;
}
var _92=_rangeEntries[_91];
if(_92.range.location==_8f||(CPMaxRange(_92.range)-1==_8f&&!_90)){
return _91;
}
var _93=splitRangeEntryAtIndex(_92,_8f);
_rangeEntries.splice(_91,1,_93[0],_93[1]);
_91++;
return _91;
}
}),new objj_method(sel_getUid("_coalesceRangeEntriesFromIndex:toIndex:"),function(_94,_95,_96,end){
with(_94){
var _98=_96;
if(end>=_rangeEntries.length){
end=_rangeEntries.length-1;
}
while(_98<end){
var a=_rangeEntries[_98],b=_rangeEntries[_98+1];
if(objj_msgSend(a.attributes,"isEqualToDictionary:",b.attributes)){
a.range.length=CPMaxRange(b.range)-a.range.location;
_rangeEntries.splice(_98+1,1);
end--;
}else{
_98++;
}
}
}
}),new objj_method(sel_getUid("beginEditing"),function(_9b,_9c){
with(_9b){
}
}),new objj_method(sel_getUid("endEditing"),function(_9d,_9e){
with(_9d){
}
})]);
var _1=objj_allocateClassPair(CPAttributedString,"CPMutableAttributedString"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var _3b=_3b=function(a,b){
if(a==b){
return YES;
}
if(objj_msgSend(a,"respondsToSelector:",sel_getUid("isEqual:"))&&objj_msgSend(a,"isEqual:",b)){
return YES;
}
return NO;
};
var _e=_e=function(_a1,_a2){
return {range:_a1,attributes:objj_msgSend(_a2,"copy")};
};
var _4f=_4f=function(_a3){
return _e(CPCopyRange(_a3.range),objj_msgSend(_a3.attributes,"copy"));
};
var _a4=splitRangeEntryAtIndex=function(_a5,_a6){
var _a7=_4f(_a5),_a8=CPMaxRange(_a5.range);
_a5.range.length=_a6-_a5.range.location;
_a7.range.location=_a6;
_a7.range.length=_a8-_a6;
_a7.attributes=objj_msgSend(_a7.attributes,"copy");
return [_a5,_a7];
};
p;10;CPBundle.ji;10;CPObject.ji;14;CPDictionary.ji;14;CPURLRequest.jc;3694;
var _1=objj_allocateClassPair(CPObject,"CPBundle"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithPath:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
path=_5;
objj_setBundleForPath(path,_3);
}
return _3;
}
}),new objj_method(sel_getUid("classNamed:"),function(_6,_7,_8){
with(_6){
}
}),new objj_method(sel_getUid("bundlePath"),function(_9,_a){
with(_9){
return objj_msgSend(path,"stringByDeletingLastPathComponent");
}
}),new objj_method(sel_getUid("resourcePath"),function(_b,_c){
with(_b){
var _d=objj_msgSend(_b,"bundlePath");
if(_d.length){
_d+="/";
}
return _d+"Resources";
}
}),new objj_method(sel_getUid("principalClass"),function(_e,_f){
with(_e){
var _10=objj_msgSend(_e,"objectForInfoDictionaryKey:","CPPrincipalClass");
return _10?CPClassFromString(_10):Nil;
}
}),new objj_method(sel_getUid("pathForResource:"),function(_11,_12,_13){
with(_11){
return objj_msgSend(_11,"resourcePath")+"/"+_13;
}
}),new objj_method(sel_getUid("infoDictionary"),function(_14,_15){
with(_14){
return info;
}
}),new objj_method(sel_getUid("objectForInfoDictionaryKey:"),function(_16,_17,_18){
with(_16){
return objj_msgSend(info,"objectForKey:",_18);
}
}),new objj_method(sel_getUid("loadWithDelegate:"),function(_19,_1a,_1b){
with(_19){
_19._delegate=_1b;
_19._infoConnection=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_19,"bundlePath")+"/Info.plist"),_19);
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_1c,_1d,_1e,_1f){
with(_1c){
if(_1e===_1c._infoConnection){
info=CPPropertyListCreateFromData(objj_msgSend(CPData,"dataWithString:",_1f));
var _20="/",_21=objj_msgSend(_1c,"objectForInfoDictionaryKey:","CPBundlePlatforms");
if(_21){
_20=objj_msgSend(_21,"firstObjectCommonWithArray:",OBJJ_PLATFORMS);
_20=_20?"/"+_20+".platform/":"/";
}
objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_1c,"bundlePath")+_20+objj_msgSend(_1c,"objectForInfoDictionaryKey:","CPBundleExecutable")),_1c);
}else{
objj_decompile(objj_msgSend(_1f,"string"),_1c);
var _22=new objj_context();
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("bundleDidFinishLoading:"))){
_22.didCompleteCallback=function(){
objj_msgSend(_delegate,"bundleDidFinishLoading:",_1c);
};
}
var _23=objj_msgSend(_1c,"objectForInfoDictionaryKey:","CPBundleReplacedFiles"),_24=_23.length,_25=objj_msgSend(_1c,"bundlePath");
while(_24--){
var _26=_23[_24];
if(_26.indexOf(".j")===_26.length-2){
_22.pushFragment(fragment_create_file(_25+"/"+_26,new objj_bundle(""),YES,NULL));
}
}
if(_22.fragments.length){
_22.evaluate();
}else{
objj_msgSend(_delegate,"bundleDidFinishLoading:",_1c);
}
}
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_27,_28,_29,_2a){
with(_27){
alert("Couldnot find bundle:"+_2a);
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_2b,_2c,_2d){
with(_2b){
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_2e,_2f){
with(_2e){
return new objj_bundle;
}
}),new objj_method(sel_getUid("bundleWithPath:"),function(_30,_31,_32){
with(_30){
return objj_getBundleWithPath(_32);
}
}),new objj_method(sel_getUid("bundleForClass:"),function(_33,_34,_35){
with(_33){
return objj_bundleForClass(_35);
}
}),new objj_method(sel_getUid("mainBundle"),function(_36,_37){
with(_36){
return objj_msgSend(CPBundle,"bundleWithPath:","Info.plist");
}
})]);
objj_bundle.prototype.isa=CPBundle;
p;9;CPCoder.ji;10;CPObject.ji;13;CPException.jc;1894;
var _1=objj_allocateClassPair(CPObject,"CPCoder"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("allowsKeyedCoding"),function(_3,_4){
with(_3){
return NO;
}
}),new objj_method(sel_getUid("encodeValueOfObjCType:at:"),function(_5,_6,_7,_8){
with(_5){
CPInvalidAbstractInvocation();
}
}),new objj_method(sel_getUid("encodeDataObject:"),function(_9,_a,_b){
with(_9){
CPInvalidAbstractInvocation();
}
}),new objj_method(sel_getUid("encodeObject:"),function(_c,_d,_e){
with(_c){
}
}),new objj_method(sel_getUid("encodePoint:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"encodeNumber:",_11.x);
objj_msgSend(_f,"encodeNumber:",_11.y);
}
}),new objj_method(sel_getUid("encodeRect:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_12,"encodePoint:",_14.origin);
objj_msgSend(_12,"encodeSize:",_14.size);
}
}),new objj_method(sel_getUid("encodeSize:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"encodeNumber:",_17.width);
objj_msgSend(_15,"encodeNumber:",_17.height);
}
}),new objj_method(sel_getUid("encodePropertyList:"),function(_18,_19,_1a){
with(_18){
}
}),new objj_method(sel_getUid("encodeRootObject:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"encodeObject:",_1d);
}
}),new objj_method(sel_getUid("encodeBycopyObject:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_1e,"encodeObject:",object);
}
}),new objj_method(sel_getUid("encodeConditionalObject:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_21,"encodeObject:",object);
}
})]);
var _1=objj_getClass("CPObject");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("awakeAfterUsingCoder:"),function(_24,_25,_26){
with(_24){
return _24;
}
})]);
p;14;CPCountedSet.ji;7;CPSet.jc;1265;
var _1=objj_allocateClassPair(CPMutableSet,"CPCountedSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_counts")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("addObject:"),function(_3,_4,_5){
with(_3){
if(!_counts){
_counts={};
}
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPMutableSet")},"addObject:",_5);
var _6=objj_msgSend(_5,"UID");
if(_counts[_6]===undefined){
_counts[_6]=1;
}else{
++_counts[_6];
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_7,_8,_9){
with(_7){
if(!_counts){
return;
}
var _a=objj_msgSend(_9,"UID");
if(_counts[_a]===undefined){
return;
}else{
--_counts[_a];
if(_counts[_a]===0){
delete _counts[_a];
objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPMutableSet")},"removeObject:",_9);
}
}
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_b,_c){
with(_b){
objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPMutableSet")},"removeAllObjects");
_counts={};
}
}),new objj_method(sel_getUid("countForObject:"),function(_d,_e,_f){
with(_d){
if(!_counts){
_counts={};
}
var UID=objj_msgSend(_f,"UID");
if(_counts[UID]===undefined){
return 0;
}
return _counts[UID];
}
})]);
p;8;CPData.ji;10;CPObject.ji;10;CPString.jc;2225;
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
p;8;CPDate.ji;10;CPObject.ji;10;CPString.jc;3347;
var _1=new Date(Date.UTC(2001,1,1,0,0,0,0));
var _2=objj_allocateClassPair(CPObject,"CPDate"),_3=_2.isa;
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithTimeIntervalSinceNow:"),function(_4,_5,_6){
with(_4){
_4=new Date((new Date()).getTime()+_6*1000);
return _4;
}
}),new objj_method(sel_getUid("initWithTimeIntervalSince1970:"),function(_7,_8,_9){
with(_7){
_7=new Date(_9*1000);
return _7;
}
}),new objj_method(sel_getUid("initWithTimeIntervalSinceReferenceDate:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSend(_a,"initWithTimeInterval:sinceDate:",_c,_1);
return _a;
}
}),new objj_method(sel_getUid("initWithTimeInterval:sinceDate:"),function(_d,_e,_f,_10){
with(_d){
_d=new Date(_10.getTime()+_f*1000);
return _d;
}
}),new objj_method(sel_getUid("initWithString:"),function(_11,_12,_13){
with(_11){
_11=new Date(_13);
return _11;
}
}),new objj_method(sel_getUid("timeIntervalSinceDate:"),function(_14,_15,_16){
with(_14){
return (_14.getTime()-_16.getTime())/1000;
}
}),new objj_method(sel_getUid("timeIntervalSinceNow"),function(_17,_18){
with(_17){
return objj_msgSend(_17,"timeIntervalSinceDate:",objj_msgSend(CPDate,"date"));
}
}),new objj_method(sel_getUid("timeIntervalSince1970"),function(_19,_1a){
with(_19){
return _19.getTime()/1000;
}
}),new objj_method(sel_getUid("timeIntervalSinceReferenceDate"),function(_1b,_1c){
with(_1b){
return (_1b.getTime()-_1.getTime())/1000;
}
}),new objj_method(sel_getUid("isEqualToDate:"),function(_1d,_1e,_1f){
with(_1d){
return !(_1d<_1f||_1d>_1f);
}
}),new objj_method(sel_getUid("compare:"),function(_20,_21,_22){
with(_20){
return (_20>_22)?CPOrderedDescending:((_20<_22)?CPOrderedAscending:CPOrderedSame);
}
}),new objj_method(sel_getUid("earlierDate:"),function(_23,_24,_25){
with(_23){
return (_23<_25)?_23:_25;
}
}),new objj_method(sel_getUid("laterDate:"),function(_26,_27,_28){
with(_26){
return (_26>_28)?_26:_28;
}
}),new objj_method(sel_getUid("description"),function(_29,_2a){
with(_29){
return _29.toString();
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("alloc"),function(_2b,_2c){
with(_2b){
return new Date;
}
}),new objj_method(sel_getUid("date"),function(_2d,_2e){
with(_2d){
return objj_msgSend(objj_msgSend(_2d,"alloc"),"init");
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSinceNow:"),function(_2f,_30,_31){
with(_2f){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSinceNow:",_31);
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSince1970:"),function(_32,_33,_34){
with(_32){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSince1970:",_34);
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSinceReferenceDate:"),function(_35,_36,_37){
with(_35){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSinceReferenceDate:",_37);
}
}),new objj_method(sel_getUid("distantPast"),function(_38,_39){
with(_38){
return new Date(-10000,1,1,0,0,0,0);
}
}),new objj_method(sel_getUid("distantFuture"),function(_3a,_3b){
with(_3a){
return new Date(10000,1,1,0,0,0,0);
}
}),new objj_method(sel_getUid("timeIntervalSinceReferenceDate"),function(_3c,_3d){
with(_3c){
return objj_msgSend(objj_msgSend(CPDate,"date"),"timeIntervalSinceReferenceDate");
}
})]);
Date.prototype.isa=CPDate;
p;14;CPDictionary.ji;10;CPObject.ji;14;CPEnumerator.ji;13;CPException.jc;7057;
var _1=objj_allocateClassPair(CPEnumerator,"_CPDictionaryValueEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_keyEnumerator"),new objj_ivar("_dictionary")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithDictionary:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPEnumerator")},"init");
if(_3){
_keyEnumerator=objj_msgSend(_5,"keyEnumerator");
_dictionary=_5;
}
return _3;
}
}),new objj_method(sel_getUid("nextObject"),function(_6,_7){
with(_6){
var _8=objj_msgSend(_keyEnumerator,"nextObject");
if(!_8){
return nil;
}
return objj_msgSend(_dictionary,"objectForKey:",_8);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPDictionary"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithDictionary:"),function(_9,_a,_b){
with(_9){
var _c="",_d=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
for(_c in _b._buckets){
objj_msgSend(_d,"setObject:forKey:",objj_msgSend(_b,"objectForKey:",_c),_c);
}
return _d;
}
}),new objj_method(sel_getUid("initWithObjects:forKeys:"),function(_e,_f,_10,_11){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPObject")},"init");
if(objj_msgSend(_10,"count")!=objj_msgSend(_11,"count")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Counts are different.("+objj_msgSend(_10,"count")+"!="+objj_msgSend(_11,"count")+")");
}
if(_e){
var i=objj_msgSend(_11,"count");
while(i--){
objj_msgSend(_e,"setObject:forKey:",_10[i],_11[i]);
}
}
return _e;
}
}),new objj_method(sel_getUid("initWithObjectsAndKeys:"),function(_13,_14,_15){
with(_13){
var _16=arguments.length;
if(_16%2!==0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Key-value count is mismatched. ("+_16+" arguments passed)");
}
_13=objj_msgSendSuper({receiver:_13,super_class:objj_getClass("CPObject")},"init");
if(_13){
var _17=2;
for(;_17<_16;_17+=2){
var _18=arguments[_17];
if(_18===nil){
break;
}
objj_msgSend(_13,"setObject:forKey:",_18,arguments[_17+1]);
}
}
return _13;
}
}),new objj_method(sel_getUid("copy"),function(_19,_1a){
with(_19){
return objj_msgSend(CPDictionary,"dictionaryWithDictionary:",_19);
}
}),new objj_method(sel_getUid("count"),function(_1b,_1c){
with(_1b){
return count;
}
}),new objj_method(sel_getUid("allKeys"),function(_1d,_1e){
with(_1d){
return _keys;
}
}),new objj_method(sel_getUid("allValues"),function(_1f,_20){
with(_1f){
var _21=_keys.length,_22=[];
while(_21--){
_22.push(dictionary_getValue(_1f,[_keys[_21]]));
}
return _22;
}
}),new objj_method(sel_getUid("keyEnumerator"),function(_23,_24){
with(_23){
return objj_msgSend(_keys,"objectEnumerator");
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_25,_26){
with(_25){
return objj_msgSend(objj_msgSend(_CPDictionaryValueEnumerator,"alloc"),"initWithDictionary:",_25);
}
}),new objj_method(sel_getUid("isEqualToDictionary:"),function(_27,_28,_29){
with(_27){
if(count!==objj_msgSend(_29,"count")){
return NO;
}
var _2a=count;
while(_2a--){
var _2b=_keys[_2a],_2c=_buckets[_2b],_2d=_29._buckets[_2b];
if(_2c===_2d){
continue;
}
if(_2c.isa&&_2d.isa&&objj_msgSend(_2c,"respondsToSelector:",sel_getUid("isEqual:"))&&objj_msgSend(_2c,"isEqual:",_2d)){
continue;
}
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("objectForKey:"),function(_2e,_2f,_30){
with(_2e){
var _31=_buckets[_30];
return (_31===undefined)?nil:_31;
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_32,_33){
with(_32){
_keys=[];
count=0;
_buckets={};
}
}),new objj_method(sel_getUid("removeObjectForKey:"),function(_34,_35,_36){
with(_34){
dictionary_removeValue(_34,_36);
}
}),new objj_method(sel_getUid("removeObjectsForKeys:"),function(_37,_38,_39){
with(_37){
var _3a=_39.length;
while(_3a--){
dictionary_removeValue(_37,_39[_3a]);
}
}
}),new objj_method(sel_getUid("setObject:forKey:"),function(_3b,_3c,_3d,_3e){
with(_3b){
dictionary_setValue(_3b,_3e,_3d);
}
}),new objj_method(sel_getUid("addEntriesFromDictionary:"),function(_3f,_40,_41){
with(_3f){
if(!_41){
return;
}
var _42=objj_msgSend(_41,"allKeys"),_43=objj_msgSend(_42,"count");
while(_43--){
var key=_42[_43];
objj_msgSend(_3f,"setObject:forKey:",objj_msgSend(_41,"objectForKey:",key),key);
}
}
}),new objj_method(sel_getUid("description"),function(_45,_46){
with(_45){
var _47="CPDictionary {\n";
var i=_keys.length;
while(i--){
_47+=_keys[i]+":";
var _49=_buckets[_keys[i]];
if(_49&&_49.isa){
_47+=objj_msgSend(_49,"description");
}else{
_47+=_49;
}
_47+="\n";
}
_47+="}";
return _47;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_4a,_4b){
with(_4a){
return new objj_dictionary();
}
}),new objj_method(sel_getUid("dictionary"),function(_4c,_4d){
with(_4c){
return objj_msgSend(objj_msgSend(_4c,"alloc"),"init");
}
}),new objj_method(sel_getUid("dictionaryWithDictionary:"),function(_4e,_4f,_50){
with(_4e){
return objj_msgSend(objj_msgSend(_4e,"alloc"),"initWithDictionary:",_50);
}
}),new objj_method(sel_getUid("dictionaryWithObject:forKey:"),function(_51,_52,_53,_54){
with(_51){
return objj_msgSend(objj_msgSend(_51,"alloc"),"initWithObjects:forKeys:",[_53],[_54]);
}
}),new objj_method(sel_getUid("dictionaryWithObjects:forKeys:"),function(_55,_56,_57,_58){
with(_55){
return objj_msgSend(objj_msgSend(_55,"alloc"),"initWithObjects:forKeys:",_57,_58);
}
}),new objj_method(sel_getUid("dictionaryWithJSObject:"),function(_59,_5a,_5b){
with(_59){
return objj_msgSend(_59,"dictionaryWithJSObject:recursively:",_5b,NO);
}
}),new objj_method(sel_getUid("dictionaryWithJSObject:recursively:"),function(_5c,_5d,_5e,_5f){
with(_5c){
var _60=objj_msgSend(objj_msgSend(_5c,"alloc"),"init");
for(var key in _5e){
var _62=_5e[key];
if(_5f&&_62.constructor===Object){
_62=objj_msgSend(CPDictionary,"dictionaryWithJSObject:recursively:",_62,YES);
}
objj_msgSend(_60,"setObject:forKey:",_62,key);
}
return _60;
}
}),new objj_method(sel_getUid("dictionaryWithObjectsAndKeys:"),function(_63,_64,_65){
with(_63){
arguments[0]=objj_msgSend(_63,"alloc");
arguments[1]=sel_getUid("initWithObjectsAndKeys:");
return objj_msgSend.apply(this,arguments);
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPDictionary\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_66,_67,_68){
with(_66){
return objj_msgSend(_68,"_decodeDictionaryOfObjectsForKey:","CP.objects");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_69,_6a,_6b){
with(_69){
objj_msgSend(_6b,"_encodeDictionaryOfObjects:forKey:",_69,"CP.objects");
}
})]);
var _1=objj_allocateClassPair(CPDictionary,"CPMutableDictionary"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
objj_dictionary.prototype.isa=CPDictionary;
p;14;CPEnumerator.ji;10;CPObject.jc;365;
var _1=objj_allocateClassPair(CPObject,"CPEnumerator"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("nextObject"),function(_3,_4){
with(_3){
return nil;
}
}),new objj_method(sel_getUid("allObjects"),function(_5,_6){
with(_5){
return [];
}
})]);
p;13;CPException.ji;9;CPCoder.ji;10;CPObject.ji;10;CPString.jc;3229;
CPInvalidArgumentException="CPInvalidArgumentException";
CPUnsupportedMethodException="CPUnsupportedMethodException";
CPRangeException="CPRangeException";
CPInternalInconsistencyException="CPInternalInconsistencyException";
var _1=objj_allocateClassPair(CPObject,"CPException"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithName:reason:userInfo:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
name=_5;
reason=_6;
userInfo=_7;
}
return _3;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return name;
}
}),new objj_method(sel_getUid("reason"),function(_a,_b){
with(_a){
return reason;
}
}),new objj_method(sel_getUid("userInfo"),function(_c,_d){
with(_c){
return userInfo;
}
}),new objj_method(sel_getUid("description"),function(_e,_f){
with(_e){
return reason;
}
}),new objj_method(sel_getUid("raise"),function(_10,_11){
with(_10){
objj_exception_throw(_10);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_12,_13){
with(_12){
return new objj_exception();
}
}),new objj_method(sel_getUid("raise:reason:"),function(_14,_15,_16,_17){
with(_14){
objj_msgSend(objj_msgSend(_14,"exceptionWithName:reason:userInfo:",_16,_17,nil),"raise");
}
}),new objj_method(sel_getUid("exceptionWithName:reason:userInfo:"),function(_18,_19,_1a,_1b,_1c){
with(_18){
return objj_msgSend(objj_msgSend(_18,"alloc"),"initWithName:reason:userInfo:",_1a,_1b,_1c);
}
})]);
var _1=objj_getClass("CPException");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPException\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_1d,_1e){
with(_1d){
return objj_msgSend(objj_msgSend(_1d,"class"),"exceptionWithName:reason:userInfo:",name,reason,userInfo);
}
})]);
var _1f="CPExceptionNameKey",_20="CPExceptionReasonKey",_21="CPExceptionUserInfoKey";
var _1=objj_getClass("CPException");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPException\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_22,_23,_24){
with(_22){
_22=objj_msgSendSuper({receiver:_22,super_class:objj_getClass("CPObject")},"init");
if(_22){
name=objj_msgSend(_24,"decodeObjectForKey:",_1f);
reason=objj_msgSend(_24,"decodeObjectForKey:",_20);
userInfo=objj_msgSend(_24,"decodeObjectForKey:",_21);
}
return _22;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_27,"encodeObject:forKey:",name,_1f);
objj_msgSend(_27,"encodeObject:forKey:",reason,_20);
objj_msgSend(_27,"encodeObject:forKey:",userInfo,_21);
}
})]);
objj_exception.prototype.isa=CPException;
objj_msgSend(CPException,"initialize");
_CPRaiseInvalidAbstractInvocation=function(_28,_29){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"*** -"+sel_getName(_29)+" cannot be sent to an abstract object of class "+objj_msgSend(_28,"className")+": Create a concrete instance!");
};
p;12;CPIndexSet.ji;9;CPRange.ji;10;CPObject.jc;11807;
var _1=objj_allocateClassPair(CPObject,"CPIndexSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_count"),new objj_ivar("_ranges")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithIndexesInRange:",{location:(0),length:0});
}
}),new objj_method(sel_getUid("initWithIndex:"),function(_5,_6,_7){
with(_5){
return objj_msgSend(_5,"initWithIndexesInRange:",{location:(_7),length:1});
}
}),new objj_method(sel_getUid("initWithIndexesInRange:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPObject")},"init");
if(_8){
_count=MAX(0,_a.length);
if(_count>0){
_ranges=[_a];
}else{
_ranges=[];
}
}
return _8;
}
}),new objj_method(sel_getUid("initWithIndexSet:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPObject")},"init");
if(_b){
_count=objj_msgSend(_d,"count");
_ranges=[];
var _e=_d._ranges,_f=_e.length;
while(_f--){
_ranges[_f]={location:(_e[_f]).location,length:(_e[_f]).length};
}
}
return _b;
}
}),new objj_method(sel_getUid("isEqualToIndexSet:"),function(_10,_11,_12){
with(_10){
if(!_12){
return NO;
}
if(_10===_12){
return YES;
}
var _13=_ranges.length,_14=_12._ranges;
if(_13!==_14.length||_count!==_12._count){
return NO;
}
while(_13--){
if(!CPEqualRanges(_ranges[_13],_14[_13])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("containsIndex:"),function(_15,_16,_17){
with(_15){
return _18(_ranges,_17)!==CPNotFound;
}
}),new objj_method(sel_getUid("containsIndexesInRange:"),function(_19,_1a,_1b){
with(_19){
if(_1b.length<=0){
return NO;
}
if(_count<_1b.length){
return NO;
}
var _1c=_18(_ranges,_1b.location);
if(_1c===CPNotFound){
return NO;
}
var _1d=_ranges[_1c];
return CPIntersectionRange(_1d,_1b).length===_1b.length;
}
}),new objj_method(sel_getUid("containsIndexes:"),function(_1e,_1f,_20){
with(_1e){
var _21=_20._count;
if(_21<=0){
return YES;
}
if(_count<_21){
return NO;
}
var _22=_20._ranges,_23=_22.length;
while(_23--){
if(!objj_msgSend(_1e,"containsIndexesInRange:",_22[_23])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("intersectsIndexesInRange:"),function(_24,_25,_26){
with(_24){
if(_count<=0){
return NO;
}
var _27=_28(_ranges,_26.location);
if(FLOOR(_27)===_27){
return YES;
}
var _29=_28(_ranges,((_26).location+(_26).length)-1);
if(FLOOR(_29)===_29){
return YES;
}
return _27!==_29;
}
}),new objj_method(sel_getUid("count"),function(_2a,_2b){
with(_2a){
return _count;
}
}),new objj_method(sel_getUid("firstIndex"),function(_2c,_2d){
with(_2c){
if(_count>0){
return _ranges[0].location;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("lastIndex"),function(_2e,_2f){
with(_2e){
if(_count>0){
return ((_ranges[_ranges.length-1]).location+(_ranges[_ranges.length-1]).length)-1;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexGreaterThanIndex:"),function(_30,_31,_32){
with(_30){
++_32;
var _33=_28(_ranges,_32);
if(_33===CPNotFound){
return CPNotFound;
}
_33=CEIL(_33);
if(_33>=_ranges.length){
return CPNotFound;
}
var _34=_ranges[_33];
if(CPLocationInRange(_32,_34)){
return _32;
}
return _34.location;
}
}),new objj_method(sel_getUid("indexLessThanIndex:"),function(_35,_36,_37){
with(_35){
--_37;
var _38=_28(_ranges,_37);
if(_38===CPNotFound){
return CPNotFound;
}
_38=FLOOR(_38);
if(_38<0){
return CPNotFound;
}
var _39=_ranges[_38];
if(CPLocationInRange(_37,_39)){
return _37;
}
return ((_39).location+(_39).length)-1;
}
}),new objj_method(sel_getUid("indexGreaterThanOrEqualToIndex:"),function(_3a,_3b,_3c){
with(_3a){
return objj_msgSend(_3a,"indexGreaterThanIndex:",_3c-1);
}
}),new objj_method(sel_getUid("indexLessThanOrEqualToIndex:"),function(_3d,_3e,_3f){
with(_3d){
return objj_msgSend(_3d,"indexLessThanIndex:",_3f+1);
}
}),new objj_method(sel_getUid("getIndexes:maxCount:inIndexRange:"),function(_40,_41,_42,_43,_44){
with(_40){
if(!_count||_43===0||_44&&!_44.length){
if(_44){
_44.length=0;
}
return 0;
}
var _45=0;
if(_44){
var _46=_44.location,_47=((_44).location+(_44).length)-1,_48=CEIL(_28(_ranges,_46)),_49=FLOOR(_28(_ranges,_47));
}else{
var _46=objj_msgSend(_40,"firstIndex"),_47=objj_msgSend(_40,"lastIndex"),_48=0,_49=_ranges.length-1;
}
while(_48<=_49){
var _4a=_ranges[_48],_4b=MAX(_46,_4a.location),_4c=MIN(_47+1,((_4a).location+(_4a).length));
for(;_4b<_4c;++_4b){
_42[_45++]=_4b;
if(_45===_43){
if(_44){
_44.location=_4b+1;
_44.length=_47+1-_4b-1;
}
return _43;
}
}
++_48;
}
if(_44){
_44.location=CPNotFound;
_44.length=0;
}
return _45;
}
}),new objj_method(sel_getUid("description"),function(_4d,_4e){
with(_4d){
var _4f=objj_msgSendSuper({receiver:_4d,super_class:objj_getClass("CPObject")},"description");
if(_count){
var _50=0,_51=_ranges.length;
_4f+="[number of indexes: "+_count+" (in "+_51;
if(_51===1){
_4f+=" range), indexes: (";
}else{
_4f+=" ranges), indexes: (";
}
for(;_50<_51;++_50){
var _52=_ranges[_50];
_4f+=_52.location;
if(_52.length>1){
_4f+="-"+(CPMaxRange(_52)-1);
}
if(_50+1<_51){
_4f+=" ";
}
}
_4f+=")]";
}else{
_4f+="(no indexes)";
}
return _4f;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("indexSet"),function(_53,_54){
with(_53){
return objj_msgSend(objj_msgSend(_53,"alloc"),"init");
}
}),new objj_method(sel_getUid("indexSetWithIndex:"),function(_55,_56,_57){
with(_55){
return objj_msgSend(objj_msgSend(_55,"alloc"),"initWithIndex:",_57);
}
}),new objj_method(sel_getUid("indexSetWithIndexesInRange:"),function(_58,_59,_5a){
with(_58){
return objj_msgSend(objj_msgSend(_58,"alloc"),"initWithIndexesInRange:",_5a);
}
})]);
var _1=objj_getClass("CPIndexSet");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPIndexSet\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addIndex:"),function(_5b,_5c,_5d){
with(_5b){
objj_msgSend(_5b,"addIndexesInRange:",{location:(_5d),length:1});
}
}),new objj_method(sel_getUid("addIndexes:"),function(_5e,_5f,_60){
with(_5e){
var _61=_60._ranges,_62=_61.length;
while(_62--){
objj_msgSend(_5e,"addIndexesInRange:",_61[_62]);
}
}
}),new objj_method(sel_getUid("addIndexesInRange:"),function(_63,_64,_65){
with(_63){
if(_65.length<=0){
return;
}
if(_count<=0){
_count=_65.length;
_ranges=[_65];
return;
}
var _66=_ranges.length,_67=_28(_ranges,_65.location-1),_68=CEIL(_67);
if(_68===_67&&_68<_66){
_65=CPUnionRange(_65,_ranges[_68]);
}
var _69=_28(_ranges,CPMaxRange(_65)),_6a=FLOOR(_69);
if(_6a===_69&&_6a>=0){
_65=CPUnionRange(_65,_ranges[_6a]);
}
var _6b=_6a-_68+1;
if(_6b===_ranges.length){
_ranges=[_65];
_count=_65.length;
}else{
if(_6b===1){
if(_68<_ranges.length){
_count-=_ranges[_68].length;
}
_count+=_65.length;
_ranges[_68]=_65;
}else{
if(_6b>0){
var _6c=_68,_6d=_68+_6b-1;
for(;_6c<=_6d;++_6c){
_count-=_ranges[_6c].length;
}
objj_msgSend(_ranges,"removeObjectsInRange:",{location:(_68),length:_6b});
}
objj_msgSend(_ranges,"insertObject:atIndex:",_65,_68);
_count+=_65.length;
}
}
}
}),new objj_method(sel_getUid("removeIndex:"),function(_6e,_6f,_70){
with(_6e){
objj_msgSend(_6e,"removeIndexesInRange:",{location:(_70),length:1});
}
}),new objj_method(sel_getUid("removeIndexes:"),function(_71,_72,_73){
with(_71){
var _74=_73._ranges,_75=_74.length;
while(_75--){
objj_msgSend(_71,"removeIndexesInRange:",_74[_75]);
}
}
}),new objj_method(sel_getUid("removeAllIndexes"),function(_76,_77){
with(_76){
_ranges=[];
_count=0;
}
}),new objj_method(sel_getUid("removeIndexesInRange:"),function(_78,_79,_7a){
with(_78){
if(_7a.length<=0){
return;
}
if(_count<=0){
return;
}
var _7b=_ranges.length,_7c=_28(_ranges,_7a.location),_7d=CEIL(_7c);
if(_7c===_7d&&_7d<_7b){
var _7e=_ranges[_7d];
if(_7a.location!==_7e.location){
var _7f=CPMaxRange(_7a),_80=CPMaxRange(_7e);
_7e.length=_7a.location-_7e.location;
if(_7f<_80){
_count-=_7a.length;
objj_msgSend(_ranges,"insertObject:atIndex:",{location:(_7f),length:_80-_7f},_7d+1);
return;
}else{
_count-=_80-_7a.location;
_7d+=1;
}
}
}
var _81=_28(_ranges,CPMaxRange(_7a)-1),_82=FLOOR(_81);
if(_81===_82&&_82>=0){
var _7f=CPMaxRange(_7a),_7e=_ranges[_82],_80=CPMaxRange(_7e);
if(_7f!==_80){
_count-=_7f-_7e.location;
_82-=1;
_7e.location=_7f;
_7e.length=_80-_7f;
}
}
var _83=_82-_7d+1;
if(_83>0){
var _84=_7d,_85=_7d+_83-1;
for(;_84<=_85;++_84){
_count-=_ranges[_84].length;
}
objj_msgSend(_ranges,"removeObjectsInRange:",{location:(_7d),length:_83});
}
}
}),new objj_method(sel_getUid("shiftIndexesStartingAtIndex:by:"),function(_86,_87,_88,_89){
with(_86){
if(!_count||_89==0){
return;
}
var i=_ranges.length-1,_8b=CPMakeRange(CPNotFound,0);
for(;i>=0;--i){
var _8c=_ranges[i],_8d=CPMaxRange(_8c);
if(_88>_8d){
break;
}
if(_88>_8c.location&&_88<_8d){
_8b=CPMakeRange(_88+_89,_8d-_88);
_8c.length=_88-_8c.location;
if(_89>0){
objj_msgSend(_ranges,"insertObject:atIndex:",_8b,i+1);
}else{
if(_8b.location<0){
_8b.length=CPMaxRange(_8b);
_8b.location=0;
}
}
break;
}
if((_8c.location+=_89)<0){
_8c.length=CPMaxRange(_8c);
_8c.location=0;
}
}
if(_89<0){
var j=i+1,_8f=_ranges.length,_90=[];
for(;j<_8f;++j){
objj_msgSend(_90,"addObject:",_ranges[j]);
}
if((j=i+1)<_8f){
objj_msgSend(_ranges,"removeObjectsInRange:",CPMakeRange(j,_8f-j));
for(j=0,_8f=_90.length;j<_8f;++j){
objj_msgSend(_86,"addIndexesInRange:",_90[j]);
}
}
if(_8b.location!=CPNotFound){
objj_msgSend(_86,"addIndexesInRange:",_8b);
}
}
}
})]);
var _91="CPIndexSetCountKey",_92="CPIndexSetRangeStringsKey";
var _1=objj_getClass("CPIndexSet");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPIndexSet\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_93,_94,_95){
with(_93){
_93=objj_msgSendSuper({receiver:_93,super_class:objj_getClass("CPObject")},"init");
if(_93){
_count=objj_msgSend(_95,"decodeIntForKey:",_91);
_ranges=[];
var _96=objj_msgSend(_95,"decodeObjectForKey:",_92),_97=0,_98=_96.length;
for(;_97<_98;++_97){
_ranges.push(CPRangeFromString(_96[_97]));
}
}
return _93;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_99,_9a,_9b){
with(_99){
objj_msgSend(_9b,"encodeInt:forKey:",_count,_91);
var _9c=0,_9d=_ranges.length,_9e=[];
for(;_9c<_9d;++_9c){
_9e[_9c]=CPStringFromRange(_ranges[_9c]);
}
objj_msgSend(_9b,"encodeObject:forKey:",_9e,_92);
}
})]);
var _1=objj_getClass("CPIndexSet");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPIndexSet\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_9f,_a0){
with(_9f){
return objj_msgSend(objj_msgSend(objj_msgSend(_9f,"class"),"alloc"),"initWithIndexSet:",_9f);
}
}),new objj_method(sel_getUid("mutableCopy"),function(_a1,_a2){
with(_a1){
return objj_msgSend(objj_msgSend(objj_msgSend(_a1,"class"),"alloc"),"initWithIndexSet:",_a1);
}
})]);
var _1=objj_allocateClassPair(CPIndexSet,"CPMutableIndexSet"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var _18=function(_a3,_a4){
var low=0,_a6=_a3.length-1;
while(low<=_a6){
var _a7=FLOOR(low+(_a6-low)/2),_a8=_a3[_a7];
if(_a4<_a8.location){
_a6=_a7-1;
}else{
if(_a4>=CPMaxRange(_a8)){
low=_a7+1;
}else{
return _a7;
}
}
}
return CPNotFound;
};
var _28=function(_a9,_aa){
var _ab=_a9.length;
if(_ab<=0){
return CPNotFound;
}
var low=0,_ad=_ab*2;
while(low<=_ad){
var _ae=FLOOR(low+(_ad-low)/2),_af=_ae/2,_b0=FLOOR(_af);
if(_af===_b0){
if(_b0-1>=0&&_aa<CPMaxRange(_a9[_b0-1])){
_ad=_ae-1;
}else{
if(_b0<_ab&&_aa>=_a9[_b0].location){
low=_ae+1;
}else{
return _b0-0.5;
}
}
}else{
var _b1=_a9[_b0];
if(_aa<_b1.location){
_ad=_ae-1;
}else{
if(_aa>=CPMaxRange(_b1)){
low=_ae+1;
}else{
return _b0;
}
}
}
}
return CPNotFound;
};
p;14;CPInvocation.ji;10;CPObject.ji;13;CPException.jc;2623;
var _1=objj_allocateClassPair(CPObject,"CPInvocation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_returnValue"),new objj_ivar("_arguments"),new objj_ivar("_methodSignature")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithMethodSignature:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_arguments=[];
_methodSignature=_5;
}
return _3;
}
}),new objj_method(sel_getUid("setSelector:"),function(_6,_7,_8){
with(_6){
_arguments[1]=_8;
}
}),new objj_method(sel_getUid("selector"),function(_9,_a){
with(_9){
return _arguments[1];
}
}),new objj_method(sel_getUid("setTarget:"),function(_b,_c,_d){
with(_b){
_arguments[0]=_d;
}
}),new objj_method(sel_getUid("target"),function(_e,_f){
with(_e){
return _arguments[0];
}
}),new objj_method(sel_getUid("setArgument:atIndex:"),function(_10,_11,_12,_13){
with(_10){
_arguments[_13]=_12;
}
}),new objj_method(sel_getUid("argumentAtIndex:"),function(_14,_15,_16){
with(_14){
return _arguments[_16];
}
}),new objj_method(sel_getUid("setReturnValue:"),function(_17,_18,_19){
with(_17){
_returnValue=_19;
}
}),new objj_method(sel_getUid("returnValue"),function(_1a,_1b){
with(_1a){
return _returnValue;
}
}),new objj_method(sel_getUid("invoke"),function(_1c,_1d){
with(_1c){
_returnValue=objj_msgSend.apply(objj_msgSend,_arguments);
}
}),new objj_method(sel_getUid("invokeWithTarget:"),function(_1e,_1f,_20){
with(_1e){
_arguments[0]=_20;
_returnValue=objj_msgSend.apply(objj_msgSend,_arguments);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("invocationWithMethodSignature:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(objj_msgSend(_21,"alloc"),"initWithMethodSignature:",_23);
}
})]);
var _24="CPInvocationArguments",_25="CPInvocationReturnValue";
var _1=objj_getClass("CPInvocation");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPInvocation\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_26,_27,_28){
with(_26){
_26=objj_msgSendSuper({receiver:_26,super_class:objj_getClass("CPObject")},"init");
if(_26){
_returnValue=objj_msgSend(_28,"decodeObjectForKey:",_25);
_arguments=objj_msgSend(_28,"decodeObjectForKey:",_24);
}
return _26;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_2b,"encodeObject:forKey:",_returnValue,_25);
objj_msgSend(_2b,"encodeObject:forKey:",_arguments,_24);
}
})]);
p;19;CPJSONPConnection.jI;21;Foundation/CPObject.jc;3347;
CPJSONPConnectionCallbacks={};
CPJSONPCallbackReplacementString="${JSONP_CALLBACK}";
var _1=objj_allocateClassPair(CPObject,"CPJSONPConnection"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_request"),new objj_ivar("_delegate"),new objj_ivar("_callbackParameter"),new objj_ivar("_scriptTag")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithRequest:callback:delegate:"),function(_3,_4,_5,_6,_7){
with(_3){
return objj_msgSend(_3,"initWithRequest:callback:delegate:startImmediately:",_5,_6,_7,NO);
}
}),new objj_method(sel_getUid("initWithRequest:callback:delegate:startImmediately:"),function(_8,_9,_a,_b,_c,_d){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPObject")},"init");
_request=_a;
_delegate=_c;
_callbackParameter=_b;
if(!_callbackParameter&&objj_msgSend(objj_msgSend(_request,"URL"),"absoluteString").indexOf(CPJSONPCallbackReplacementString)<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"JSONP source specified without callback parameter or CPJSONPCallbackReplacementString in URL.");
}
if(_d){
objj_msgSend(_8,"start");
}
return _8;
}
}),new objj_method(sel_getUid("start"),function(_e,_f){
with(_e){
try{
CPJSONPConnectionCallbacks["callback"+objj_msgSend(_e,"UID")]=function(_10){
objj_msgSend(_delegate,"connection:didReceiveData:",_e,_10);
objj_msgSend(_e,"removeScriptTag");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
var _11=document.getElementsByTagName("head").item(0),_12=objj_msgSend(objj_msgSend(_request,"URL"),"absoluteString");
if(_callbackParameter){
_12+=(_12.indexOf("?")<0)?"?":"&";
_12+=_callbackParameter+"=CPJSONPConnectionCallbacks.callback"+objj_msgSend(_e,"UID");
}else{
if(_12.indexOf(CPJSONPCallbackReplacementString)>=0){
_12=objj_msgSend(_12,"stringByReplacingOccurrencesOfString:withString:",CPJSONPCallbackReplacementString,"CPJSONPConnectionCallbacks.callback"+objj_msgSend(_e,"UID"));
}else{
return;
}
}
_scriptTag=document.createElement("script");
_scriptTag.setAttribute("type","text/javascript");
_scriptTag.setAttribute("charset","utf-8");
_scriptTag.setAttribute("src",_12);
_11.appendChild(_scriptTag);
}
catch(exception){
objj_msgSend(_delegate,"connection:didFailWithError:",_e,exception);
objj_msgSend(_e,"removeScriptTag");
}
}
}),new objj_method(sel_getUid("removeScriptTag"),function(_13,_14){
with(_13){
var _15=document.getElementsByTagName("head").item(0);
if(_scriptTag&&_scriptTag.parentNode==_15){
_15.removeChild(_scriptTag);
}
CPJSONPConnectionCallbacks["callback"+objj_msgSend(_13,"UID")]=nil;
delete CPJSONPConnectionCallbacks["callback"+objj_msgSend(_13,"UID")];
}
}),new objj_method(sel_getUid("cancel"),function(_16,_17){
with(_16){
objj_msgSend(_16,"removeScriptTag");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("sendRequest:callback:delegate:"),function(_18,_19,_1a,_1b,_1c){
with(_18){
return objj_msgSend(_18,"connectionWithRequest:callback:delegate:",_1a,_1b,_1c);
}
}),new objj_method(sel_getUid("connectionWithRequest:callback:delegate:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
return objj_msgSend(objj_msgSend(objj_msgSend(_1d,"class"),"alloc"),"initWithRequest:callback:delegate:startImmediately:",_1f,_20,_21,YES);
}
})]);
p;17;CPKeyedArchiver.ji;8;CPData.ji;9;CPCoder.ji;9;CPArray.ji;10;CPString.ji;10;CPNumber.ji;14;CPDictionary.ji;9;CPValue.jc;10096;
var _1=nil;
var _2=1,_3=2,_4=4,_5=8,_6=16;
var _7="$null",_8=nil,_9="CP$UID",_a="$top",_b="$objects",_c="$archiver",_d="$version",_e="$classname",_f="$classes",_10="$class";
var _11=Nil,_12=Nil;
var _13=objj_allocateClassPair(CPValue,"_CPKeyedArchiverValue"),_14=_13.isa;
objj_registerClassPair(_13);
objj_addClassForBundle(_13,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var _13=objj_allocateClassPair(CPCoder,"CPKeyedArchiver"),_14=_13.isa;
class_addIvars(_13,[new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors"),new objj_ivar("_data"),new objj_ivar("_objects"),new objj_ivar("_UIDs"),new objj_ivar("_conditionalUIDs"),new objj_ivar("_replacementObjects"),new objj_ivar("_replacementClassNames"),new objj_ivar("_plistObject"),new objj_ivar("_plistObjects"),new objj_ivar("_outputFormat")]);
objj_registerClassPair(_13);
objj_addClassForBundle(_13,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_13,[new objj_method(sel_getUid("initForWritingWithMutableData:"),function(_15,_16,_17){
with(_15){
_15=objj_msgSendSuper({receiver:_15,super_class:objj_getClass("CPCoder")},"init");
if(_15){
_data=_17;
_objects=[];
_UIDs=objj_msgSend(CPDictionary,"dictionary");
_conditionalUIDs=objj_msgSend(CPDictionary,"dictionary");
_replacementObjects=objj_msgSend(CPDictionary,"dictionary");
_data=_17;
_plistObject=objj_msgSend(CPDictionary,"dictionary");
_plistObjects=objj_msgSend(CPArray,"arrayWithObject:",_7);
}
return _15;
}
}),new objj_method(sel_getUid("finishEncoding"),function(_18,_19){
with(_18){
if(_delegate&&_delegateSelectors&_6){
objj_msgSend(_delegate,"archiverWillFinish:",_18);
}
var i=0,_1b=_plistObject,_1c=[];
for(;i<_objects.length;++i){
var _1d=_objects[i],_1e=objj_msgSend(_1d,"classForKeyedArchiver");
_plistObject=_plistObjects[objj_msgSend(_UIDs,"objectForKey:",objj_msgSend(_1d,"UID"))];
objj_msgSend(_1d,"encodeWithCoder:",_18);
if(_delegate&&_delegateSelectors&_2){
objj_msgSend(_delegate,"archiver:didEncodeObject:",_18,_1d);
}
}
_plistObject=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_plistObject,"setObject:forKey:",_1b,_a);
objj_msgSend(_plistObject,"setObject:forKey:",_plistObjects,_b);
objj_msgSend(_plistObject,"setObject:forKey:",objj_msgSend(_18,"className"),_c);
objj_msgSend(_plistObject,"setObject:forKey:","100000",_d);
objj_msgSend(_data,"setPlistObject:",_plistObject);
if(_delegate&&_delegateSelectors&_5){
objj_msgSend(_delegate,"archiverDidFinish:",_18);
}
}
}),new objj_method(sel_getUid("outputFormat"),function(_1f,_20){
with(_1f){
return _outputFormat;
}
}),new objj_method(sel_getUid("setOutputFormat:"),function(_21,_22,_23){
with(_21){
_outputFormat=_23;
}
}),new objj_method(sel_getUid("encodeBool:forKey:"),function(_24,_25,_26,_27){
with(_24){
objj_msgSend(_plistObject,"setObject:forKey:",_28(_24,_26,NO),_27);
}
}),new objj_method(sel_getUid("encodeDouble:forKey:"),function(_29,_2a,_2b,_2c){
with(_29){
objj_msgSend(_plistObject,"setObject:forKey:",_28(_29,_2b,NO),_2c);
}
}),new objj_method(sel_getUid("encodeFloat:forKey:"),function(_2d,_2e,_2f,_30){
with(_2d){
objj_msgSend(_plistObject,"setObject:forKey:",_28(_2d,_2f,NO),_30);
}
}),new objj_method(sel_getUid("encodeInt:forKey:"),function(_31,_32,_33,_34){
with(_31){
objj_msgSend(_plistObject,"setObject:forKey:",_28(_31,_33,NO),_34);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_35,_36,_37){
with(_35){
_delegate=_37;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:didEncodeObject:"))){
_delegateSelectors|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willEncodeObject:"))){
_delegateSelectors|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willReplaceObject:withObject:"))){
_delegateSelectors|=_4;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:didFinishEncoding:"))){
_delegateSelectors|=_CPKeyedArchiverDidFinishEncodingSelector;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willFinishEncoding:"))){
_delegateSelectors|=_CPKeyedArchiverWillFinishEncodingSelector;
}
}
}),new objj_method(sel_getUid("delegate"),function(_38,_39){
with(_38){
return _delegate;
}
}),new objj_method(sel_getUid("encodePoint:forKey:"),function(_3a,_3b,_3c,_3d){
with(_3a){
objj_msgSend(_plistObject,"setObject:forKey:",_28(_3a,CPStringFromPoint(_3c),NO),_3d);
}
}),new objj_method(sel_getUid("encodeRect:forKey:"),function(_3e,_3f,_40,_41){
with(_3e){
objj_msgSend(_plistObject,"setObject:forKey:",_28(_3e,CPStringFromRect(_40),NO),_41);
}
}),new objj_method(sel_getUid("encodeSize:forKey:"),function(_42,_43,_44,_45){
with(_42){
objj_msgSend(_plistObject,"setObject:forKey:",_28(_42,CPStringFromSize(_44),NO),_45);
}
}),new objj_method(sel_getUid("encodeConditionalObject:forKey:"),function(_46,_47,_48,_49){
with(_46){
objj_msgSend(_plistObject,"setObject:forKey:",_28(_46,_48,YES),_49);
}
}),new objj_method(sel_getUid("encodeNumber:forKey:"),function(_4a,_4b,_4c,_4d){
with(_4a){
objj_msgSend(_plistObject,"setObject:forKey:",_28(_4a,_4c,NO),_4d);
}
}),new objj_method(sel_getUid("encodeObject:forKey:"),function(_4e,_4f,_50,_51){
with(_4e){
objj_msgSend(_plistObject,"setObject:forKey:",_28(_4e,_50,NO),_51);
}
}),new objj_method(sel_getUid("_encodeArrayOfObjects:forKey:"),function(_52,_53,_54,_55){
with(_52){
var i=0,_57=_54.length,_58=objj_msgSend(CPArray,"arrayWithCapacity:",_57);
for(;i<_57;++i){
objj_msgSend(_58,"addObject:",_28(_52,_54[i],NO));
}
objj_msgSend(_plistObject,"setObject:forKey:",_58,_55);
}
}),new objj_method(sel_getUid("_encodeDictionaryOfObjects:forKey:"),function(_59,_5a,_5b,_5c){
with(_59){
var key,_5e=objj_msgSend(_5b,"keyEnumerator"),_5f=objj_msgSend(CPDictionary,"dictionary");
while(key=objj_msgSend(_5e,"nextObject")){
objj_msgSend(_5f,"setObject:forKey:",_28(_59,objj_msgSend(_5b,"objectForKey:",key),NO),key);
}
objj_msgSend(_plistObject,"setObject:forKey:",_5f,_5c);
}
}),new objj_method(sel_getUid("setClassName:forClass:"),function(_60,_61,_62,_63){
with(_60){
if(!_replacementClassNames){
_replacementClassNames=objj_msgSend(CPDictionary,"dictionary");
}
objj_msgSend(_replacementClassNames,"setObject:forKey:",_62,CPStringFromClass(_63));
}
}),new objj_method(sel_getUid("classNameForClass:"),function(_64,_65,_66){
with(_64){
if(!_replacementClassNames){
return _66.name;
}
var _67=objj_msgSend(_replacementClassNames,"objectForKey:",CPStringFromClass(aClassName));
return _67?_67:_66.name;
}
})]);
class_addMethods(_14,[new objj_method(sel_getUid("initialize"),function(_68,_69){
with(_68){
if(_68!=objj_msgSend(CPKeyedArchiver,"class")){
return;
}
_11=objj_msgSend(CPString,"class");
_12=objj_msgSend(CPNumber,"class");
_8=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",0,_9);
}
}),new objj_method(sel_getUid("allowsKeyedCoding"),function(_6a,_6b){
with(_6a){
return YES;
}
}),new objj_method(sel_getUid("archivedDataWithRootObject:"),function(_6c,_6d,_6e){
with(_6c){
var _6f=objj_msgSend(CPData,"dataWithPlistObject:",nil),_70=objj_msgSend(objj_msgSend(_6c,"alloc"),"initForWritingWithMutableData:",_6f);
objj_msgSend(_70,"encodeObject:forKey:",_6e,"root");
objj_msgSend(_70,"finishEncoding");
return _6f;
}
}),new objj_method(sel_getUid("setClassName:forClass:"),function(_71,_72,_73,_74){
with(_71){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionary");
}
objj_msgSend(_1,"setObject:forKey:",_73,CPStringFromClass(_74));
}
}),new objj_method(sel_getUid("classNameForClass:"),function(_75,_76,_77){
with(_75){
if(!_1){
return _77.name;
}
var _78=objj_msgSend(_1,"objectForKey:",CPStringFromClass(aClassName));
return _78?_78:_77.name;
}
})]);
var _28=function(_79,_7a,_7b){
if(_7a!==nil&&!_7a.isa){
_7a=objj_msgSend(_CPKeyedArchiverValue,"valueWithJSObject:",_7a);
}
var _7c=objj_msgSend(_7a,"UID"),_7d=objj_msgSend(_79._replacementObjects,"objectForKey:",_7c);
if(_7d===nil){
_7d=objj_msgSend(_7a,"replacementObjectForKeyedArchiver:",_79);
if(_79._delegate){
if(_7d!==_7a&&_79._delegateSelectors&_4){
objj_msgSend(_79._delegate,"archiver:willReplaceObject:withObject:",_79,_7a,_7d);
}
if(_79._delegateSelectors&_3){
_7a=objj_msgSend(_79._delegate,"archiver:willEncodeObject:",_79,_7d);
if(_7a!==_7d&&_79._delegateSelectors&_4){
objj_msgSend(_79._delegate,"archiver:willReplaceObject:withObject:",_79,_7d,_7a);
}
_7d=_7a;
}
}
objj_msgSend(_79._replacementObjects,"setObject:forKey:",_7d,_7c);
}
if(_7d===nil){
return _8;
}
var UID=objj_msgSend(_79._UIDs,"objectForKey:",_7c=objj_msgSend(_7d,"UID"));
if(UID===nil){
if(_7b){
if((UID=objj_msgSend(_79._conditionalUIDs,"objectForKey:",_7c))===nil){
objj_msgSend(_79._conditionalUIDs,"setObject:forKey:",UID=objj_msgSend(_79._plistObjects,"count"),_7c);
objj_msgSend(_79._plistObjects,"addObject:",_7);
}
}else{
var _7f=objj_msgSend(_7d,"classForKeyedArchiver"),_80=nil;
if((_7f===_11)||(_7f===_12)){
_80=_7d;
}else{
_80=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_79._objects,"addObject:",_7d);
var _81=objj_msgSend(_79,"classNameForClass:",_7f);
if(!_81){
_81=objj_msgSend(objj_msgSend(_79,"class"),"classNameForClass:",_7f);
}
if(!_81){
_81=_7f.name;
}else{
_7f=window[_81];
}
var _82=objj_msgSend(_79._UIDs,"objectForKey:",_81);
if(!_82){
var _83=objj_msgSend(CPDictionary,"dictionary"),_84=[];
objj_msgSend(_83,"setObject:forKey:",_81,_e);
do{
objj_msgSend(_84,"addObject:",CPStringFromClass(_7f));
}while(_7f=objj_msgSend(_7f,"superclass"));
objj_msgSend(_83,"setObject:forKey:",_84,_f);
_82=objj_msgSend(_79._plistObjects,"count");
objj_msgSend(_79._plistObjects,"addObject:",_83);
objj_msgSend(_79._UIDs,"setObject:forKey:",_82,_81);
}
objj_msgSend(_80,"setObject:forKey:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_82,_9),_10);
}
UID=objj_msgSend(_79._conditionalUIDs,"objectForKey:",_7c);
if(UID!==nil){
objj_msgSend(_79._UIDs,"setObject:forKey:",UID,_7c);
objj_msgSend(_79._plistObjects,"replaceObjectAtIndex:withObject:",UID,_80);
}else{
objj_msgSend(_79._UIDs,"setObject:forKey:",UID=objj_msgSend(_79._plistObjects,"count"),_7c);
objj_msgSend(_79._plistObjects,"addObject:",_80);
}
}
}
return objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",UID,_9);
};
p;19;CPKeyedUnarchiver.ji;8;CPNull.ji;9;CPCoder.jc;8707;
CPInvalidUnarchiveOperationException="CPInvalidUnarchiveOperationException";
var _1=1<<0,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4,_6=1<<5;
var _7="$null";
_CPKeyedArchiverUIDKey="CP$UID",_CPKeyedArchiverTopKey="$top",_CPKeyedArchiverObjectsKey="$objects",_CPKeyedArchiverArchiverKey="$archiver",_CPKeyedArchiverVersionKey="$version",_CPKeyedArchiverClassNameKey="$classname",_CPKeyedArchiverClassesKey="$classes",_CPKeyedArchiverClassKey="$class";
var _8=Nil,_9=Nil,_a=Nil,_b=Nil,_c=Nil,_d=Nil;
var _e=objj_allocateClassPair(CPCoder,"CPKeyedUnarchiver"),_f=_e.isa;
class_addIvars(_e,[new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors"),new objj_ivar("_data"),new objj_ivar("_replacementClasses"),new objj_ivar("_objects"),new objj_ivar("_archive"),new objj_ivar("_plistObject"),new objj_ivar("_plistObjects")]);
objj_registerClassPair(_e);
objj_addClassForBundle(_e,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_e,[new objj_method(sel_getUid("initForReadingWithData:"),function(_10,_11,_12){
with(_10){
_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPCoder")},"init");
if(_10){
_archive=objj_msgSend(_12,"plistObject");
_objects=objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(CPNull,"null"));
_plistObject=objj_msgSend(_archive,"objectForKey:",_CPKeyedArchiverTopKey);
_plistObjects=objj_msgSend(_archive,"objectForKey:",_CPKeyedArchiverObjectsKey);
_replacementClasses=objj_msgSend(CPDictionary,"dictionary");
}
return _10;
}
}),new objj_method(sel_getUid("containsValueForKey:"),function(_13,_14,_15){
with(_13){
return objj_msgSend(_plistObject,"objectForKey:",_15)!=nil;
}
}),new objj_method(sel_getUid("_decodeDictionaryOfObjectsForKey:"),function(_16,_17,_18){
with(_16){
var _19=objj_msgSend(_plistObject,"objectForKey:",_18);
if(objj_msgSend(_19,"isKindOfClass:",_a)){
var key,_1b=objj_msgSend(_19,"keyEnumerator"),_1c=objj_msgSend(CPDictionary,"dictionary");
while(key=objj_msgSend(_1b,"nextObject")){
objj_msgSend(_1c,"setObject:forKey:",_1d(_16,objj_msgSend(objj_msgSend(_19,"objectForKey:",key),"objectForKey:",_CPKeyedArchiverUIDKey)),key);
}
return _1c;
}
return nil;
}
}),new objj_method(sel_getUid("decodeBoolForKey:"),function(_1e,_1f,_20){
with(_1e){
return objj_msgSend(_1e,"decodeObjectForKey:",_20);
}
}),new objj_method(sel_getUid("decodeFloatForKey:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(_21,"decodeObjectForKey:",_23);
}
}),new objj_method(sel_getUid("decodeDoubleForKey:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(_24,"decodeObjectForKey:",_26);
}
}),new objj_method(sel_getUid("decodeIntForKey:"),function(_27,_28,_29){
with(_27){
return objj_msgSend(_27,"decodeObjectForKey:",_29);
}
}),new objj_method(sel_getUid("decodePointForKey:"),function(_2a,_2b,_2c){
with(_2a){
var _2d=objj_msgSend(_2a,"decodeObjectForKey:",_2c);
if(_2d){
return CPPointFromString(_2d);
}else{
return CPPointMake(0,0);
}
}
}),new objj_method(sel_getUid("decodeRectForKey:"),function(_2e,_2f,_30){
with(_2e){
var _31=objj_msgSend(_2e,"decodeObjectForKey:",_30);
if(_31){
return CPRectFromString(_31);
}else{
return CPRectMakeZero();
}
}
}),new objj_method(sel_getUid("decodeSizeForKey:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_32,"decodeObjectForKey:",_34);
if(_35){
return CPSizeFromString(_35);
}else{
return CPSizeMake(0,0);
}
}
}),new objj_method(sel_getUid("decodeObjectForKey:"),function(_36,_37,_38){
with(_36){
var _39=objj_msgSend(_plistObject,"objectForKey:",_38);
if(objj_msgSend(_39,"isKindOfClass:",_a)){
return _1d(_36,objj_msgSend(_39,"objectForKey:",_CPKeyedArchiverUIDKey));
}else{
if(objj_msgSend(_39,"isKindOfClass:",_b)||objj_msgSend(_39,"isKindOfClass:",_c)||objj_msgSend(_39,"isKindOfClass:",_9)){
return _39;
}else{
if(objj_msgSend(_39,"isKindOfClass:",_8)){
var _3a=0,_3b=_39.length,_3c=[];
for(;_3a<_3b;++_3a){
_3c[_3a]=_1d(_36,objj_msgSend(_39[_3a],"objectForKey:",_CPKeyedArchiverUIDKey));
}
return _3c;
}
}
}
return nil;
}
}),new objj_method(sel_getUid("decodeBytesForKey:"),function(_3d,_3e,_3f){
with(_3d){
var _40=objj_msgSend(_3d,"decodeObjectForKey:",_3f);
if(objj_msgSend(_40,"isKindOfClass:",objj_msgSend(CPData,"class"))){
return _40.bytes;
}
return nil;
}
}),new objj_method(sel_getUid("finishDecoding"),function(_41,_42){
with(_41){
if(_delegateSelectors&_4){
objj_msgSend(_delegate,"unarchiverWillFinish:",_41);
}
if(_delegateSelectors&_5){
objj_msgSend(_delegate,"unarchiverDidFinish:",_41);
}
}
}),new objj_method(sel_getUid("delegate"),function(_43,_44){
with(_43){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_45,_46,_47){
with(_45){
_delegate=_47;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:"))){
_delegateSelectors|=_1;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:didDecodeObject:"))){
_delegateSelectors|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:willReplaceObject:withObject:"))){
_delegateSelectors|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiverWillFinish:"))){
_delegateSelectors|=_CPKeyedUnarchiverWilFinishSelector;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiverDidFinish:"))){
_delegateSelectors|=_5;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:"))){
_delegateSelectors|=_6;
}
}
}),new objj_method(sel_getUid("setClass:forClassName:"),function(_48,_49,_4a,_4b){
with(_48){
objj_msgSend(_replacementClasses,"setObject:forKey:",_4a,_4b);
}
}),new objj_method(sel_getUid("classForClassName:"),function(_4c,_4d,_4e){
with(_4c){
return objj_msgSend(_replacementClasses,"objectForKey:",_4e);
}
}),new objj_method(sel_getUid("allowsKeyedCoding"),function(_4f,_50){
with(_4f){
return YES;
}
})]);
class_addMethods(_f,[new objj_method(sel_getUid("initialize"),function(_51,_52){
with(_51){
if(_51!==objj_msgSend(CPKeyedUnarchiver,"class")){
return;
}
_8=objj_msgSend(CPArray,"class");
_9=objj_msgSend(CPString,"class");
_a=objj_msgSend(CPDictionary,"class");
_b=objj_msgSend(CPNumber,"class");
_c=objj_msgSend(CPData,"class");
_d=objj_msgSend(_CPKeyedArchiverValue,"class");
}
}),new objj_method(sel_getUid("unarchiveObjectWithData:"),function(_53,_54,_55){
with(_53){
var _56=objj_msgSend(objj_msgSend(_53,"alloc"),"initForReadingWithData:",_55),_57=objj_msgSend(_56,"decodeObjectForKey:","root");
objj_msgSend(_56,"finishDecoding");
return _57;
}
}),new objj_method(sel_getUid("unarchiveObjectWithFile:"),function(_58,_59,_5a){
with(_58){
}
}),new objj_method(sel_getUid("unarchiveObjectWithFile:asynchronously:"),function(_5b,_5c,_5d,_5e){
with(_5b){
}
})]);
var _1d=function(_5f,_60){
var _61=_5f._objects[_60];
if(_61){
if(_61==_5f._objects[0]){
return nil;
}else{
return _61;
}
}
var _61,_62=_5f._plistObjects[_60];
if(objj_msgSend(_62,"isKindOfClass:",_a)){
var _63=_5f._plistObjects[objj_msgSend(objj_msgSend(_62,"objectForKey:",_CPKeyedArchiverClassKey),"objectForKey:",_CPKeyedArchiverUIDKey)],_64=objj_msgSend(_63,"objectForKey:",_CPKeyedArchiverClassNameKey),_65=objj_msgSend(_63,"objectForKey:",_CPKeyedArchiverClassesKey),_66=objj_msgSend(_5f,"classForClassName:",_64);
if(!_66){
_66=CPClassFromString(_64);
}
if(!_66&&(_5f._delegateSelectors&_6)){
_66=objj_msgSend(_delegate,"unarchiver:cannotDecodeObjectOfClassName:originalClasses:",_5f,_64,_65);
}
if(!_66){
objj_msgSend(CPException,"raise:reason:",CPInvalidUnarchiveOperationException,"-[CPKeyedUnarchiver decodeObjectForKey:]: cannot decode object of class ("+_64+")");
}
var _67=_5f._plistObject;
_5f._plistObject=_62;
_61=objj_msgSend(_66,"allocWithCoder:",_5f);
_5f._objects[_60]=_61;
var _68=objj_msgSend(_61,"initWithCoder:",_5f);
_5f._plistObject=_67;
if(_68!=_61){
if(_5f._delegateSelectors&_3){
objj_msgSend(_5f._delegate,"unarchiver:willReplaceObject:withObject:",_5f,_61,_68);
}
_61=_68;
_5f._objects[_60]=_68;
}
_68=objj_msgSend(_61,"awakeAfterUsingCoder:",_5f);
if(_68!=_61){
if(_5f._delegateSelectors&_3){
objj_msgSend(_5f._delegate,"unarchiver:willReplaceObject:withObject:",_5f,_61,_68);
}
_61=_68;
_5f._objects[_60]=_68;
}
if(_5f._delegate){
if(_5f._delegateSelectors&_2){
_68=objj_msgSend(_5f._delegate,"unarchiver:didDecodeObject:",_5f,_61);
}
if(_68!=_61){
if(_5f._delegateSelectors&_3){
objj_msgSend(_5f._delegate,"unarchiver:willReplaceObject:withObject:",_5f,_61,_68);
}
_61=_68;
_5f._objects[_60]=_68;
}
}
}else{
_5f._objects[_60]=_61=_62;
if(objj_msgSend(_61,"class")==_9){
if(_61==_7){
_5f._objects[_60]=_5f._objects[0];
return nil;
}else{
_5f._objects[_60]=_61=_62;
}
}
}
if(objj_msgSend(_61,"isMemberOfClass:",_d)){
_61=objj_msgSend(_61,"JSObject");
}
return _61;
};
p;18;CPKeyValueCoding.ji;9;CPArray.ji;10;CPObject.ji;14;CPDictionary.jc;5967;
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
i;13;CPArray+KVO.jp;21;CPKeyValueObserving.ji;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;10;CPObject.ji;7;CPSet.jc;14115;
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
i;13;CPArray+KVO.jp;7;CPLog.jc;6885;
window.CPLogDisable=false;
var _1="Cappuccino";
var _2=["fatal","error","warn","info","debug","trace"];
var _3=_2[3];
var _4={};
for(var i=0;i<_2.length;i++){
_4[_2[i]]=i;
}
var _6={};
var _7=function(_8,_9,_a){
var _b=new Date();
_9=(_9==null?"":" ["+_9+"]");
if(typeof sprintf=="function"){
return sprintf("%4d-%02d-%02d %02d:%02d:%02d.%03d %s%s: %s",_b.getFullYear(),_b.getMonth(),_b.getDate(),_b.getHours(),_b.getMinutes(),_b.getSeconds(),_b.getMilliseconds(),_a,_9,_8);
}else{
return _b+" "+_a+_9+": "+_8;
}
};
CPLogRegister=function(_c,_d){
CPLogRegisterRange(_c,_2[0],_d||_2[_2.length-1]);
};
CPLogRegisterRange=function(_e,_f,_10){
var min=_4[_f];
var max=_4[_10];
if(min!=undefined&&max!=undefined){
for(var i=0;i<=max;i++){
CPLogRegisterSingle(_e,_2[i]);
}
}
};
CPLogRegisterSingle=function(_14,_15){
if(_6[_15]==undefined){
_6[_15]=[_14];
}else{
_6[_15].push(_14);
}
};
_CPLogDispatch=function(_16,_17,_18){
if(_18==undefined){
_18=_1;
}
if(_17==undefined){
_17=_3;
}
var _19=(typeof _16[0]=="string"&&_16.length>1)?sprintf.apply(null,_16):String(_16[0]);
if(_6[_17]){
for(var i=0;i<_6[_17].length;i++){
_6[_17][i](_19,_17,_18);
}
}
};
CPLog=function(){
_CPLogDispatch(arguments);
};
for(var i=0;i<_2.length;i++){
CPLog[_2[i]]=(function(_1b){
return function(){
_CPLogDispatch(arguments,_1b);
};
})(_2[i]);
}
ANSI_ESC=String.fromCharCode(27);
ANSI_CSI=ANSI_ESC+"[";
ANSI_TEXT_PROP="m";
ANSI_RESET="0";
ANSI_BOLD="1";
ANSI_FAINT="2";
ANSI_NORMAL="22";
ANSI_ITALIC="3";
ANSI_UNDER="4";
ANSI_UNDER_DBL="21";
ANSI_UNDER_OFF="24";
ANSI_BLINK="5";
ANSI_BLINK_FAST="6";
ANSI_BLINK_OFF="25";
ANSI_REVERSE="7";
ANSI_POSITIVE="27";
ANSI_CONCEAL="8";
ANSI_REVEAL="28";
ANSI_FG="3";
ANSI_BG="4";
ANSI_FG_INTENSE="9";
ANSI_BG_INTENSE="10";
ANSI_BLACK="0";
ANSI_RED="1";
ANSI_GREEN="2";
ANSI_YELLOW="3";
ANSI_BLUE="4";
ANSI_MAGENTA="5";
ANSI_CYAN="6";
ANSI_WHITE="7";
var _1c={"black":ANSI_BLACK,"red":ANSI_RED,"green":ANSI_GREEN,"yellow":ANSI_YELLOW,"blue":ANSI_BLUE,"magenta":ANSI_MAGENTA,"cyan":ANSI_CYAN,"white":ANSI_WHITE};
ANSIControlCode=function(_1d,_1e){
if(_1e==undefined){
_1e="";
}else{
if(typeof (_1e)=="object"&&(_1e instanceof Array)){
_1e=_1e.join(";");
}
}
return ANSI_CSI+String(_1e)+String(_1d);
};
ANSITextApplyProperties=function(_1f,_20){
return ANSIControlCode(ANSI_TEXT_PROP,_20)+String(_1f)+ANSIControlCode(ANSI_TEXT_PROP);
};
ANSITextColorize=function(_21,_22){
if(_1c[_22]==undefined){
return _21;
}
return ANSITextApplyProperties(_21,ANSI_FG+_1c[_22]);
};
var _23={"fatal":"red","error":"red","warn":"yellow","info":"green","debug":"cyan","trace":"blue"};
CPLogPrint=function(_24,_25,_26){
if(typeof print!="undefined"){
if(_25=="fatal"||_25=="error"||_25=="warn"){
var _27=ANSITextColorize(_7(_24,_25,_26),_23[_25]);
}else{
var _27=_7(_24,ANSITextColorize(_25,_23[_25]),_26);
}
print(_27);
}
};
CPLogAlert=function(_28,_29,_2a){
if(typeof alert!="undefined"&&!window.CPLogDisable){
var _2b=_7(_28,_29,_2a);
window.CPLogDisable=!confirm(_2b+"\n\n(Click cancel to stop log alerts)");
}
};
CPLogConsole=function(_2c,_2d,_2e){
if(typeof console!="undefined"){
var _2f=_7(_2c,_2d,_2e);
var _30={"fatal":"error","error":"error","warn":"warn","info":"info","debug":"debug","trace":"debug"}[_2d];
if(_30&&console[_30]){
console[_30](_2f);
}else{
if(console.log){
console.log(_2f);
}
}
}
};
var _31=null;
CPLogPopup=function(_32,_33,_34){
try{
if(window.CPLogDisable||window.open==undefined){
return;
}
if(!_31||!_31.document){
_31=window.open("","_blank","width=600,height=400,status=no,resizable=yes,scrollbars=yes");
if(!_31){
window.CPLogDisable=!confirm(_32+"\n\n(Disable pop-up blocking for CPLog window; Click cancel to stop log alerts)");
return;
}
_35(_31);
}
var _36=_31.document.createElement("div");
_36.setAttribute("class",_33||"fatal");
var _37=_7(_32,null,_34);
_36.appendChild(_31.document.createTextNode(_37));
_31.log.appendChild(_36);
if(_31.focusEnabled.checked){
_31.focus();
}
if(_31.blockEnabled.checked){
_31.blockEnabled.checked=_31.confirm(_37+"\nContinue blocking?");
}
if(_31.scrollEnabled.checked){
_31.scrollToBottom();
}
}
catch(e){
}
};
var _35=function(_38){
var doc=_38.document;
doc.writeln("<html><head><title></title></head><body></body></html>");
doc.title=_1+" Run Log";
var _3a=doc.getElementsByTagName("head")[0];
var _3b=doc.getElementsByTagName("body")[0];
var _3c=window.location.protocol+"//"+window.location.host+window.location.pathname;
_3c=_3c.substring(0,_3c.lastIndexOf("/")+1);
var _3d=doc.createElement("link");
_3d.setAttribute("type","text/css");
_3d.setAttribute("rel","stylesheet");
_3d.setAttribute("href",_3c+"Frameworks/Foundation/Resources/log.css");
_3d.setAttribute("media","screen");
_3a.appendChild(_3d);
var div=doc.createElement("div");
div.setAttribute("id","header");
_3b.appendChild(div);
var ul=doc.createElement("ul");
ul.setAttribute("id","enablers");
div.appendChild(ul);
for(var i=0;i<_2.length;i++){
var li=doc.createElement("li");
li.setAttribute("id","en"+_2[i]);
li.setAttribute("class",_2[i]);
li.setAttribute("onclick","toggle(this);");
li.setAttribute("enabled","yes");
li.appendChild(doc.createTextNode(_2[i]));
ul.appendChild(li);
}
var ul=doc.createElement("ul");
ul.setAttribute("id","options");
div.appendChild(ul);
var _42={"focus":["Focus",false],"block":["Block",false],"wrap":["Wrap",false],"scroll":["Scroll",true],"close":["Close",true]};
for(o in _42){
var li=doc.createElement("li");
ul.appendChild(li);
_38[o+"Enabled"]=doc.createElement("input");
_38[o+"Enabled"].setAttribute("id",o);
_38[o+"Enabled"].setAttribute("type","checkbox");
if(_42[o][1]){
_38[o+"Enabled"].setAttribute("checked","checked");
}
li.appendChild(_38[o+"Enabled"]);
var _43=doc.createElement("label");
_43.setAttribute("for",o);
_43.appendChild(doc.createTextNode(_42[o][0]));
li.appendChild(_43);
}
_38.log=doc.createElement("div");
_38.log.setAttribute("class","enerror endebug enwarn eninfo enfatal entrace");
_3b.appendChild(_38.log);
_38.toggle=function(_44){
var _45=(_44.getAttribute("enabled")=="yes")?"no":"yes";
_44.setAttribute("enabled",_45);
if(_45=="yes"){
_38.log.className+=" "+_44.id;
}else{
_38.log.className=_38.log.className.replace(new RegExp("[\\s]*"+_44.id,"g"),"");
}
};
_38.scrollToBottom=function(){
_38.scrollTo(0,_3b.offsetHeight);
};
_38.wrapEnabled.addEventListener("click",function(){
_38.log.setAttribute("wrap",_38.wrapEnabled.checked?"yes":"no");
},false);
_38.addEventListener("keydown",function(e){
var e=e||_38.event;
if(e.keyCode==75&&(e.ctrlKey||e.metaKey)){
while(_38.log.firstChild){
_38.log.removeChild(_38.log.firstChild);
}
e.preventDefault();
}
},"false");
window.addEventListener("unload",function(){
if(_38&&_38.closeEnabled&&_38.closeEnabled.checked){
window.CPLogDisable=true;
_38.close();
}
},false);
_38.addEventListener("unload",function(){
if(!window.CPLogDisable){
window.CPLogDisable=!confirm("Click cancel to stop logging");
}
},false);
};
p;16;CPNotification.ji;10;CPObject.ji;13;CPException.jc;1404;
var _1=objj_allocateClassPair(CPObject,"CPNotification"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_object"),new objj_ivar("_userInfo")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"CPNotification's init method should not be used");
}
}),new objj_method(sel_getUid("initWithName:object:userInfo:"),function(_5,_6,_7,_8,_9){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_name=_7;
_object=_8;
_userInfo=_9;
}
return _5;
}
}),new objj_method(sel_getUid("name"),function(_a,_b){
with(_a){
return _name;
}
}),new objj_method(sel_getUid("object"),function(_c,_d){
with(_c){
return _object;
}
}),new objj_method(sel_getUid("userInfo"),function(_e,_f){
with(_e){
return _userInfo;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("notificationWithName:object:userInfo:"),function(_10,_11,_12,_13,_14){
with(_10){
return objj_msgSend(objj_msgSend(_10,"alloc"),"initWithName:object:userInfo:",_12,_13,_14);
}
}),new objj_method(sel_getUid("notificationWithName:object:"),function(_15,_16,_17,_18){
with(_15){
return objj_msgSend(objj_msgSend(_15,"alloc"),"initWithName:object:userInfo:",_17,_18,nil);
}
})]);
p;22;CPNotificationCenter.ji;9;CPArray.ji;14;CPDictionary.ji;16;CPNotification.ji;13;CPException.jc;6405;
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
p;8;CPNull.ji;10;CPObject.jc;345;
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPNull"),_3=_2.isa;
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("null"),function(_4,_5){
with(_4){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPNull,"alloc"),"init");
}
return _1;
}
})]);
p;10;CPNumber.ji;10;CPObject.ji;15;CPObjJRuntime.jc;5981;
var _1=new Number(),_2={};
var _3=objj_allocateClassPair(CPObject,"CPNumber"),_4=_3.isa;
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithBool:"),function(_5,_6,_7){
with(_5){
return _7;
}
}),new objj_method(sel_getUid("initWithChar:"),function(_8,_9,_a){
with(_8){
if(_a.charCodeAt){
return _a.charCodeAt(0);
}
return _a;
}
}),new objj_method(sel_getUid("initWithDouble:"),function(_b,_c,_d){
with(_b){
return _d;
}
}),new objj_method(sel_getUid("initWithFloat:"),function(_e,_f,_10){
with(_e){
return _10;
}
}),new objj_method(sel_getUid("initWithInt:"),function(_11,_12,_13){
with(_11){
return _13;
}
}),new objj_method(sel_getUid("initWithLong:"),function(_14,_15,_16){
with(_14){
return _16;
}
}),new objj_method(sel_getUid("initWithLongLong:"),function(_17,_18,_19){
with(_17){
return _19;
}
}),new objj_method(sel_getUid("initWithShort:"),function(_1a,_1b,_1c){
with(_1a){
return _1c;
}
}),new objj_method(sel_getUid("initWithUnsignedChar:"),function(_1d,_1e,_1f){
with(_1d){
if(_1f.charCodeAt){
return _1f.charCodeAt(0);
}
return _1f;
}
}),new objj_method(sel_getUid("initWithUnsignedInt:"),function(_20,_21,_22){
with(_20){
return _22;
}
}),new objj_method(sel_getUid("initWithUnsignedLong:"),function(_23,_24,_25){
with(_23){
return _25;
}
}),new objj_method(sel_getUid("initWithUnsignedShort:"),function(_26,_27,_28){
with(_26){
return _28;
}
}),new objj_method(sel_getUid("UID"),function(_29,_2a){
with(_29){
if(!_2[_29]){
_2[_29]=_objj_generateObjectHash();
}
return _2[_29];
}
}),new objj_method(sel_getUid("boolValue"),function(_2b,_2c){
with(_2b){
return _2b?true:false;
}
}),new objj_method(sel_getUid("charValue"),function(_2d,_2e){
with(_2d){
return String.fromCharCode(_2d);
}
}),new objj_method(sel_getUid("decimalValue"),function(_2f,_30){
with(_2f){
objj_throw_exception("decimalValue: NOT YET IMPLEMENTED");
}
}),new objj_method(sel_getUid("descriptionWithLocale:"),function(_31,_32,_33){
with(_31){
if(!_33){
return toString();
}
objj_throw_exception("descriptionWithLocale: NOT YET IMPLEMENTED");
}
}),new objj_method(sel_getUid("description"),function(_34,_35){
with(_34){
return objj_msgSend(_34,"descriptionWithLocale:",nil);
}
}),new objj_method(sel_getUid("doubleValue"),function(_36,_37){
with(_36){
if(typeof _36=="boolean"){
return _36?1:0;
}
return _36;
}
}),new objj_method(sel_getUid("floatValue"),function(_38,_39){
with(_38){
if(typeof _38=="boolean"){
return _38?1:0;
}
return _38;
}
}),new objj_method(sel_getUid("intValue"),function(_3a,_3b){
with(_3a){
if(typeof _3a=="boolean"){
return _3a?1:0;
}
return _3a;
}
}),new objj_method(sel_getUid("longLongValue"),function(_3c,_3d){
with(_3c){
if(typeof _3c=="boolean"){
return _3c?1:0;
}
return _3c;
}
}),new objj_method(sel_getUid("longValue"),function(_3e,_3f){
with(_3e){
if(typeof _3e=="boolean"){
return _3e?1:0;
}
return _3e;
}
}),new objj_method(sel_getUid("shortValue"),function(_40,_41){
with(_40){
if(typeof _40=="boolean"){
return _40?1:0;
}
return _40;
}
}),new objj_method(sel_getUid("stringValue"),function(_42,_43){
with(_42){
return toString();
}
}),new objj_method(sel_getUid("unsignedCharValue"),function(_44,_45){
with(_44){
return String.fromCharCode(_44);
}
}),new objj_method(sel_getUid("unsignedIntValue"),function(_46,_47){
with(_46){
if(typeof _46=="boolean"){
return _46?1:0;
}
return _46;
}
}),new objj_method(sel_getUid("unsignedLongValue"),function(_48,_49){
with(_48){
if(typeof _48=="boolean"){
return _48?1:0;
}
return _48;
}
}),new objj_method(sel_getUid("unsignedShortValue"),function(_4a,_4b){
with(_4a){
if(typeof _4a=="boolean"){
return _4a?1:0;
}
return _4a;
}
}),new objj_method(sel_getUid("compare:"),function(_4c,_4d,_4e){
with(_4c){
if(_4c>_4e){
return CPOrderedDescending;
}else{
if(_4c<_4e){
return CPOrderedAscending;
}
}
return CPOrderedSame;
}
}),new objj_method(sel_getUid("isEqualToNumber:"),function(_4f,_50,_51){
with(_4f){
return _4f==_51;
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("alloc"),function(_52,_53){
with(_52){
return _1;
}
}),new objj_method(sel_getUid("numberWithBool:"),function(_54,_55,_56){
with(_54){
return _56;
}
}),new objj_method(sel_getUid("numberWithChar:"),function(_57,_58,_59){
with(_57){
if(_59.charCodeAt){
return _59.charCodeAt(0);
}
return _59;
}
}),new objj_method(sel_getUid("numberWithDouble:"),function(_5a,_5b,_5c){
with(_5a){
return _5c;
}
}),new objj_method(sel_getUid("numberWithFloat:"),function(_5d,_5e,_5f){
with(_5d){
return _5f;
}
}),new objj_method(sel_getUid("numberWithInt:"),function(_60,_61,_62){
with(_60){
return _62;
}
}),new objj_method(sel_getUid("numberWithLong:"),function(_63,_64,_65){
with(_63){
return _65;
}
}),new objj_method(sel_getUid("numberWithLongLong:"),function(_66,_67,_68){
with(_66){
return _68;
}
}),new objj_method(sel_getUid("numberWithShort:"),function(_69,_6a,_6b){
with(_69){
return _6b;
}
}),new objj_method(sel_getUid("numberWithUnsignedChar:"),function(_6c,_6d,_6e){
with(_6c){
if(_6e.charCodeAt){
return _6e.charCodeAt(0);
}
return _6e;
}
}),new objj_method(sel_getUid("numberWithUnsignedInt:"),function(_6f,_70,_71){
with(_6f){
return _71;
}
}),new objj_method(sel_getUid("numberWithUnsignedLong:"),function(_72,_73,_74){
with(_72){
return _74;
}
}),new objj_method(sel_getUid("numberWithUnsignedShort:"),function(_75,_76,_77){
with(_75){
return _77;
}
})]);
var _3=objj_getClass("CPNumber");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPNumber\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_78,_79,_7a){
with(_78){
return objj_msgSend(_7a,"decodeNumber");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7b,_7c,_7d){
with(_7b){
objj_msgSend(_7d,"encodeNumber:forKey:",_7b,"self");
}
})]);
Number.prototype.isa=CPNumber;
Boolean.prototype.isa=CPNumber;
objj_msgSend(CPNumber,"initialize");
p;10;CPObject.jc;6574;
var _1=objj_allocateClassPair(Nil,"CPObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("isa")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return _3;
}
}),new objj_method(sel_getUid("copy"),function(_5,_6){
with(_5){
return _5;
}
}),new objj_method(sel_getUid("mutableCopy"),function(_7,_8){
with(_7){
return objj_msgSend(_7,"copy");
}
}),new objj_method(sel_getUid("dealloc"),function(_9,_a){
with(_9){
}
}),new objj_method(sel_getUid("class"),function(_b,_c){
with(_b){
return isa;
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_d,_e,_f){
with(_d){
return objj_msgSend(isa,"isSubclassOfClass:",_f);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_10,_11,_12){
with(_10){
return _10.isa===_12;
}
}),new objj_method(sel_getUid("isProxy"),function(_13,_14){
with(_13){
return NO;
}
}),new objj_method(sel_getUid("respondsToSelector:"),function(_15,_16,_17){
with(_15){
return !!class_getInstanceMethod(isa,_17);
}
}),new objj_method(sel_getUid("methodForSelector:"),function(_18,_19,_1a){
with(_18){
return class_getMethodImplementation(isa,_1a);
}
}),new objj_method(sel_getUid("methodSignatureForSelector:"),function(_1b,_1c,_1d){
with(_1b){
return nil;
}
}),new objj_method(sel_getUid("description"),function(_1e,_1f){
with(_1e){
return "<"+isa.name+" 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_1e,"UID"))+">";
}
}),new objj_method(sel_getUid("performSelector:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_20,_22);
}
}),new objj_method(sel_getUid("performSelector:withObject:"),function(_23,_24,_25,_26){
with(_23){
return objj_msgSend(_23,_25,_26);
}
}),new objj_method(sel_getUid("performSelector:withObject:withObject:"),function(_27,_28,_29,_2a,_2b){
with(_27){
return objj_msgSend(_27,_29,_2a,_2b);
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(_2c,"doesNotRecognizeSelector:",objj_msgSend(_2e,"selector"));
}
}),new objj_method(sel_getUid("forward::"),function(_2f,_30,_31,_32){
with(_2f){
var _33=objj_msgSend(_2f,"methodSignatureForSelector:",_31);
if(_33){
invocation=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",_33);
objj_msgSend(invocation,"setTarget:",_2f);
objj_msgSend(invocation,"setSelector:",_31);
var _34=2,_35=_32.length;
for(;_34<_35;++_34){
objj_msgSend(invocation,"setArgument:atIndex:",_32[_34],_34);
}
objj_msgSend(_2f,"forwardInvocation:",invocation);
return objj_msgSend(invocation,"returnValue");
}
objj_msgSend(_2f,"doesNotRecognizeSelector:",_31);
}
}),new objj_method(sel_getUid("doesNotRecognizeSelector:"),function(_36,_37,_38){
with(_36){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,(class_isMetaClass(isa)?"+":"-")+" ["+objj_msgSend(_36,"className")+" "+_38+"] unrecognized selector sent to "+(class_isMetaClass(isa)?"class":"instance")+" 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_36,"UID")));
}
}),new objj_method(sel_getUid("awakeAfterUsingCoder:"),function(_39,_3a,_3b){
with(_39){
return _39;
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_3c,_3d){
with(_3c){
return objj_msgSend(_3c,"classForCoder");
}
}),new objj_method(sel_getUid("classForCoder"),function(_3e,_3f){
with(_3e){
return objj_msgSend(_3e,"class");
}
}),new objj_method(sel_getUid("replacementObjectForArchiver:"),function(_40,_41,_42){
with(_40){
return objj_msgSend(_40,"replacementObjectForCoder:",_42);
}
}),new objj_method(sel_getUid("replacementObjectForKeyedArchiver:"),function(_43,_44,_45){
with(_43){
return objj_msgSend(_43,"replacementObjectForCoder:",_45);
}
}),new objj_method(sel_getUid("replacementObjectForCoder:"),function(_46,_47,_48){
with(_46){
return _46;
}
}),new objj_method(sel_getUid("className"),function(_49,_4a){
with(_49){
return isa.name;
}
}),new objj_method(sel_getUid("autorelease"),function(_4b,_4c){
with(_4b){
return _4b;
}
}),new objj_method(sel_getUid("hash"),function(_4d,_4e){
with(_4d){
return objj_msgSend(_4d,"UID");
}
}),new objj_method(sel_getUid("UID"),function(_4f,_50){
with(_4f){
if(typeof _4f.__address==="undefined"){
_4f.__address=_objj_generateObjectHash();
}
return __address;
}
}),new objj_method(sel_getUid("isEqual:"),function(_51,_52,_53){
with(_51){
return _51===_53||objj_msgSend(_51,"UID")===objj_msgSend(_53,"UID");
}
}),new objj_method(sel_getUid("retain"),function(_54,_55){
with(_54){
return _54;
}
}),new objj_method(sel_getUid("release"),function(_56,_57){
with(_56){
}
}),new objj_method(sel_getUid("self"),function(_58,_59){
with(_58){
return _58;
}
}),new objj_method(sel_getUid("superclass"),function(_5a,_5b){
with(_5a){
return isa.super_class;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("load"),function(_5c,_5d){
with(_5c){
}
}),new objj_method(sel_getUid("initialize"),function(_5e,_5f){
with(_5e){
}
}),new objj_method(sel_getUid("new"),function(_60,_61){
with(_60){
return objj_msgSend(objj_msgSend(_60,"alloc"),"init");
}
}),new objj_method(sel_getUid("alloc"),function(_62,_63){
with(_62){
return class_createInstance(_62);
}
}),new objj_method(sel_getUid("allocWithCoder:"),function(_64,_65,_66){
with(_64){
return objj_msgSend(_64,"alloc");
}
}),new objj_method(sel_getUid("class"),function(_67,_68){
with(_67){
return _67;
}
}),new objj_method(sel_getUid("superclass"),function(_69,_6a){
with(_69){
return super_class;
}
}),new objj_method(sel_getUid("isSubclassOfClass:"),function(_6b,_6c,_6d){
with(_6b){
var _6e=_6b;
for(;_6e;_6e=_6e.super_class){
if(_6e===_6d){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_6f,_70,_71){
with(_6f){
return objj_msgSend(_6f,"isSubclassOfClass:",_71);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_72,_73,_74){
with(_72){
return _72===_74;
}
}),new objj_method(sel_getUid("instancesRespondToSelector:"),function(_75,_76,_77){
with(_75){
return !!class_getInstanceMethod(_75,_77);
}
}),new objj_method(sel_getUid("instanceMethodForSelector:"),function(_78,_79,_7a){
with(_78){
return class_getMethodImplementation(_78,_7a);
}
}),new objj_method(sel_getUid("setVersion:"),function(_7b,_7c,_7d){
with(_7b){
version=_7d;
return _7b;
}
}),new objj_method(sel_getUid("version"),function(_7e,_7f){
with(_7e){
return version;
}
})]);
objj_object.prototype.toString=function(){
if(this.isa&&class_getInstanceMethod(this.isa,"description")!=NULL){
return objj_msgSend(this,"description");
}else{
return String(this)+" (-description not implemented)";
}
};
p;15;CPObjJRuntime.ji;7;CPLog.jc;372;
CPStringFromSelector=function(_1){
return sel_getName(_1);
};
CPSelectorFromString=function(_2){
return sel_registerName(_2);
};
CPClassFromString=function(_3){
return objj_getClass(_3);
};
CPStringFromClass=function(_4){
return class_getName(_4);
};
CPOrderedAscending=-1;
CPOrderedSame=0;
CPOrderedDescending=1;
CPNotFound=-1;
MIN=Math.min;
MAX=Math.max;
ABS=Math.abs;
p;29;CPPropertyListSerialization.ji;10;CPObject.jc;816;
CPPropertyListUnknownFormat=0;
CPPropertyListOpenStepFormat=kCFPropertyListOpenStepFormat;
CPPropertyListXMLFormat_v1_0=kCFPropertyListXMLFormat_v1_0;
CPPropertyListBinaryFormat_v1_0=kCFPropertyListBinaryFormat_v1_0;
CPPropertyList280NorthFormat_v1_0=kCFPropertyList280NorthFormat_v1_0;
var _1=objj_allocateClassPair(CPObject,"CPPropertyListSerialization"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("dataFromPropertyList:format:errorDescription:"),function(_3,_4,_5,_6,_7){
with(_3){
return CPPropertyListCreateData(_5,_6);
}
}),new objj_method(sel_getUid("propertyListFromData:format:errorDescription:"),function(_8,_9,_a,_b,_c){
with(_8){
return CPPropertyListCreateFromData(_a,_b);
}
})]);
p;9;CPRange.jc;1225;
CPMakeRange=function(_1,_2){
return {location:_1,length:_2};
};
CPCopyRange=function(_3){
return {location:_3.location,length:_3.length};
};
CPMakeRangeCopy=function(_4){
return {location:_4.location,length:_4.length};
};
CPEmptyRange=function(_5){
return _5.length===0;
};
CPMaxRange=function(_6){
return _6.location+_6.length;
};
CPEqualRanges=function(_7,_8){
return ((_7.location===_8.location)&&(_7.length===_8.length));
};
CPLocationInRange=function(_9,_a){
return (_9>=_a.location)&&(_9<CPMaxRange(_a));
};
CPUnionRange=function(_b,_c){
var _d=MIN(_b.location,_c.location);
return CPMakeRange(_d,MAX(CPMaxRange(_b),CPMaxRange(_c))-_d);
};
CPIntersectionRange=function(_e,_f){
if(CPMaxRange(_e)<_f.location||CPMaxRange(_f)<_e.location){
return CPMakeRange(0,0);
}
var _10=MAX(_e.location,_f.location);
return CPMakeRange(_10,MIN(CPMaxRange(_e),CPMaxRange(_f))-_10);
};
CPRangeInRange=function(_11,_12){
return (_11.location<=_12.location&&CPMaxRange(_11)>=CPMaxRange(_12));
};
CPStringFromRange=function(_13){
return "{"+_13.location+", "+_13.length+"}";
};
CPRangeFromString=function(_14){
var _15=_14.indexOf(",");
return {location:parseInt(_14.substr(1,_15-1)),length:parseInt(_14.substring(_15+1,_14.length))};
};
p;11;CPRunLoop.ji;10;CPObject.ji;9;CPArray.ji;10;CPString.jc;6407;
CPDefaultRunLoopMode="CPDefaultRunLoopMode";
_CPRunLoopPerformCompare=function(_1,_2){
return objj_msgSend(_2,"order")-objj_msgSend(_1,"order");
};
var _3=[],_4=5;
var _5=objj_allocateClassPair(CPObject,"_CPRunLoopPerform"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_target"),new objj_ivar("_selector"),new objj_ivar("_argument"),new objj_ivar("_order"),new objj_ivar("_runLoopModes"),new objj_ivar("_isValid")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithSelector:target:argument:order:modes:"),function(_7,_8,_9,_a,_b,_c,_d){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPObject")},"init");
if(_7){
_selector=_9;
_target=_a;
_argument=_b;
_order=_c;
_runLoopModes=_d;
_isValid=YES;
}
return _7;
}
}),new objj_method(sel_getUid("selector"),function(_e,_f){
with(_e){
return _selector;
}
}),new objj_method(sel_getUid("target"),function(_10,_11){
with(_10){
return _target;
}
}),new objj_method(sel_getUid("argument"),function(_12,_13){
with(_12){
return _argument;
}
}),new objj_method(sel_getUid("order"),function(_14,_15){
with(_14){
return _order;
}
}),new objj_method(sel_getUid("fireInMode:"),function(_16,_17,_18){
with(_16){
if(!_isValid){
return YES;
}
if(objj_msgSend(_runLoopModes,"containsObject:",_18)){
objj_msgSend(_target,"performSelector:withObject:",_selector,_argument);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("invalidate"),function(_19,_1a){
with(_19){
_isValid=NO;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("_poolPerform:"),function(_1b,_1c,_1d){
with(_1b){
if(!_1d||_3.length>=_4){
return;
}
_3.push(_1d);
}
}),new objj_method(sel_getUid("performWithSelector:target:argument:order:modes:"),function(_1e,_1f,_20,_21,_22,_23,_24){
with(_1e){
if(_3.length){
var _25=_3.pop();
_25._target=_21;
_25._selector=_20;
_25._argument=_22;
_25._order=_23;
_25._runLoopModes=_24;
_25._isValid=YES;
return _25;
}
return objj_msgSend(objj_msgSend(_1e,"alloc"),"initWithSelector:target:argument:order:modes:",_20,_21,_22,_23,_24);
}
})]);
var _26=0;
var _5=objj_allocateClassPair(CPObject,"CPRunLoop"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_runLoopLock"),new objj_ivar("_timersForModes"),new objj_ivar("_nativeTimersForModes"),new objj_ivar("_nextTimerFireDatesForModes"),new objj_ivar("_didAddTimer"),new objj_ivar("_effectiveDate"),new objj_ivar("_orderedPerforms")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("init"),function(_27,_28){
with(_27){
_27=objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPObject")},"init");
if(_27){
_orderedPerforms=[];
_timersForModes={};
_nativeTimersForModes={};
_nextTimerFireDatesForModes={};
}
return _27;
}
}),new objj_method(sel_getUid("performSelector:target:argument:order:modes:"),function(_29,_2a,_2b,_2c,_2d,_2e,_2f){
with(_29){
var _30=objj_msgSend(_CPRunLoopPerform,"performWithSelector:target:argument:order:modes:",_2b,_2c,_2d,_2e,_2f),_31=_orderedPerforms.length;
while(_31--){
if(_2e<objj_msgSend(_orderedPerforms[_31],"order")){
break;
}
}
_orderedPerforms.splice(_31+1,0,_30);
}
}),new objj_method(sel_getUid("cancelPerformSelector:target:argument:"),function(_32,_33,_34,_35,_36){
with(_32){
var _37=_orderedPerforms.length;
while(_37--){
var _38=_orderedPerforms[_37];
if(objj_msgSend(_38,"selector")===_34&&objj_msgSend(_38,"target")==_35&&objj_msgSend(_38,"argument")==_36){
objj_msgSend(_orderedPerforms[_37],"invalidate");
}
}
}
}),new objj_method(sel_getUid("performSelectors"),function(_39,_3a){
with(_39){
objj_msgSend(_39,"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("addTimer:forMode:"),function(_3b,_3c,_3d,_3e){
with(_3b){
if(_timersForModes[_3e]){
_timersForModes[_3e].push(_3d);
}else{
_timersForModes[_3e]=[_3d];
}
_didAddTimer=YES;
if(!_3d._lastNativeRunLoopsForModes){
_3d._lastNativeRunLoopsForModes={};
}
_3d._lastNativeRunLoopsForModes[_3e]=_26;
}
}),new objj_method(sel_getUid("limitDateForMode:"),function(_3f,_40,_41){
with(_3f){
if(_runLoopLock){
return;
}
_runLoopLock=YES;
var now=_effectiveDate?objj_msgSend(_effectiveDate,"laterDate:",objj_msgSend(CPDate,"date")):objj_msgSend(CPDate,"date"),_43=nil,_44=_nextTimerFireDatesForModes[_41];
if(_didAddTimer||_44&&_44<=now){
_didAddTimer=NO;
if(_nativeTimersForModes[_41]!==nil){
window.clearNativeTimeout(_nativeTimersForModes[_41]);
_nativeTimersForModes[_41]=nil;
}
var _45=_timersForModes[_41],_46=_45.length;
_timersForModes[_41]=nil;
while(_46--){
var _47=_45[_46];
if(_47._lastNativeRunLoopsForModes[_41]<_26&&_47._isValid&&_47._fireDate<=now){
objj_msgSend(_47,"fire");
}
if(_47._isValid){
_43=(_43===nil)?_47._fireDate:objj_msgSend(_43,"earlierDate:",_47._fireDate);
}else{
_47._lastNativeRunLoopsForModes[_41]=0;
_45.splice(_46,1);
}
}
var _48=_timersForModes[_41];
if(_48&&_48.length){
_46=_48.length;
while(_46--){
var _47=_48[_46];
if(objj_msgSend(_47,"isValid")){
_43=(_43===nil)?_47._fireDate:objj_msgSend(_43,"earlierDate:",_47._fireDate);
}else{
_48.splice(_46,1);
}
}
_timersForModes[_41]=_48.concat(_45);
}else{
_timersForModes[_41]=_45;
}
_nextTimerFireDatesForModes[_41]=_43;
if(_nextTimerFireDatesForModes[_41]!==nil){
_nativeTimersForModes[_41]=window.setNativeTimeout(function(){
_effectiveDate=_43;
_nativeTimersForModes[_41]=nil;
++_26;
objj_msgSend(_3f,"limitDateForMode:",_41);
_effectiveDate=nil;
},MAX(0,objj_msgSend(_43,"timeIntervalSinceNow")*1000));
}
}
var _49=_orderedPerforms,_46=_49.length;
_orderedPerforms=[];
while(_46--){
var _4a=_49[_46];
if(objj_msgSend(_4a,"fireInMode:",CPDefaultRunLoopMode)){
objj_msgSend(_CPRunLoopPerform,"_poolPerform:",_4a);
_49.splice(_46,1);
}
}
if(_orderedPerforms.length){
_orderedPerforms=_orderedPerforms.concat(_49);
_orderedPerforms.sort(_CPRunLoopPerformCompare);
}else{
_orderedPerforms=_49;
}
_runLoopLock=NO;
return _43;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_4b,_4c){
with(_4b){
if(_4b!=objj_msgSend(CPRunLoop,"class")){
return;
}
CPMainRunLoop=objj_msgSend(objj_msgSend(CPRunLoop,"alloc"),"init");
}
}),new objj_method(sel_getUid("currentRunLoop"),function(_4d,_4e){
with(_4d){
return CPMainRunLoop;
}
}),new objj_method(sel_getUid("mainRunLoop"),function(_4f,_50){
with(_4f){
return CPMainRunLoop;
}
})]);
p;7;CPSet.ji;10;CPObject.ji;9;CPArray.ji;10;CPNumber.ji;14;CPEnumerator.jc;7834;
var _1=objj_allocateClassPair(CPObject,"CPSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contents"),new objj_ivar("_count")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init")){
_count=0;
_contents={};
}
return _3;
}
}),new objj_method(sel_getUid("initWithArray:"),function(_5,_6,_7){
with(_5){
if(_5=objj_msgSend(_5,"init")){
var _8=_7.length;
while(_8--){
objj_msgSend(_5,"addObject:",_7[_8]);
}
}
return _5;
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_9,_a,_b,_c){
with(_9){
return objj_msgSend(_9,"initWithArray:",_b.splice(0,_c));
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSend(_d,"init")){
var _10=arguments.length,i=2;
for(;i<_10&&(argument=arguments[i])!=nil;++i){
objj_msgSend(_d,"addObject:",argument);
}
}
return _d;
}
}),new objj_method(sel_getUid("initWithSet:"),function(_12,_13,_14){
with(_12){
return objj_msgSend(_12,"initWithSet:copyItems:",_14,NO);
}
}),new objj_method(sel_getUid("initWithSet:copyItems:"),function(_15,_16,_17,_18){
with(_15){
_15=objj_msgSend(_15,"init");
if(!_17){
return _15;
}
var _19=_17._contents;
for(var _1a in _19){
if(_19.hasOwnProperty(_1a)){
if(_18){
objj_msgSend(_15,"addObject:",objj_msgSend(_19[_1a],"copy"));
}else{
objj_msgSend(_15,"addObject:",_19[_1a]);
}
}
}
return _15;
}
}),new objj_method(sel_getUid("allObjects"),function(_1b,_1c){
with(_1b){
var _1d=[];
for(var _1e in _contents){
if(_contents.hasOwnProperty(_1e)){
_1d.push(_contents[_1e]);
}
}
return _1d;
}
}),new objj_method(sel_getUid("anyObject"),function(_1f,_20){
with(_1f){
for(var _21 in _contents){
if(_contents.hasOwnProperty(_21)){
return _contents[_21];
}
}
return nil;
}
}),new objj_method(sel_getUid("containsObject:"),function(_22,_23,_24){
with(_22){
if(_contents[objj_msgSend(_24,"UID")]&&objj_msgSend(_contents[objj_msgSend(_24,"UID")],"isEqual:",_24)){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("count"),function(_25,_26){
with(_25){
return _count;
}
}),new objj_method(sel_getUid("intersectsSet:"),function(_27,_28,set){
with(_27){
var _2a=objj_msgSend(set,"allObjects");
for(var i=_2a.length;i>0;i--){
if(objj_msgSend(_27,"containsObject:",_2a[i])){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isEqualToSet:"),function(_2c,_2d,set){
with(_2c){
return _2c===set||(objj_msgSend(_2c,"count")===objj_msgSend(set,"count")&&objj_msgSend(set,"isSubsetOfSet:",_2c));
}
}),new objj_method(sel_getUid("isSubsetOfSet:"),function(_2f,_30,set){
with(_2f){
var _32=objj_msgSend(_2f,"allObjects");
for(var i=0;i<_32.length;i++){
if(!objj_msgSend(set,"containsObject:",_32[i])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"makeObjectsPerformSelector:withObject:",_36,nil);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"),function(_37,_38,_39,_3a){
with(_37){
var _3b=objj_msgSend(_37,"allObjects");
for(var i=0;i<_3b.length;i++){
objj_msgSend(_3b[i],"performSelector:withObject:",_39,_3a);
}
}
}),new objj_method(sel_getUid("member:"),function(_3d,_3e,_3f){
with(_3d){
if(objj_msgSend(_3d,"containsObject:",_3f)){
return _3f;
}
return nil;
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_40,_41){
with(_40){
return objj_msgSend(objj_msgSend(_40,"allObjects"),"objectEnumerator");
}
}),new objj_method(sel_getUid("initWithCapacity:"),function(_42,_43,_44){
with(_42){
_42=objj_msgSend(_42,"init");
return _42;
}
}),new objj_method(sel_getUid("setSet:"),function(_45,_46,set){
with(_45){
objj_msgSend(_45,"removeAllObjects");
objj_msgSend(_45,"addObjectsFromArray:",objj_msgSend(set,"allObjects"));
}
}),new objj_method(sel_getUid("addObject:"),function(_48,_49,_4a){
with(_48){
if(objj_msgSend(_48,"containsObject:",_4a)){
return;
}
_contents[objj_msgSend(_4a,"UID")]=_4a;
_count++;
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=objj_msgSend(_4d,"count");
while(_4e--){
objj_msgSend(_4b,"addObject:",_4d[_4e]);
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_4f,_50,_51){
with(_4f){
if(objj_msgSend(_4f,"containsObject:",_51)){
delete _contents[objj_msgSend(_51,"UID")];
_count--;
}
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(_52,_53,_54){
with(_52){
var _55=objj_msgSend(_54,"count");
while(_55--){
objj_msgSend(_52,"removeObject:",_54[_55]);
}
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_56,_57){
with(_56){
_contents={};
_count=0;
}
}),new objj_method(sel_getUid("intersectSet:"),function(_58,_59,set){
with(_58){
var _5b=objj_msgSend(_58,"allObjects");
for(var i=0,_5d=_5b.length;i<_5d;i++){
if(!objj_msgSend(set,"containsObject:",_5b[i])){
objj_msgSend(_58,"removeObject:",_5b[i]);
}
}
}
}),new objj_method(sel_getUid("minusSet:"),function(_5e,_5f,set){
with(_5e){
var _61=objj_msgSend(set,"allObjects");
for(var i=0;i<_61.length;i++){
if(objj_msgSend(_5e,"containsObject:",_61[i])){
objj_msgSend(_5e,"removeObject:",_61[i]);
}
}
}
}),new objj_method(sel_getUid("unionSet:"),function(_63,_64,set){
with(_63){
var _66=objj_msgSend(set,"allObjects");
for(var i=0,_68=_66.length;i<_68;i++){
objj_msgSend(_63,"addObject:",_66[i]);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("set"),function(_69,_6a){
with(_69){
return objj_msgSend(objj_msgSend(_69,"alloc"),"init");
}
}),new objj_method(sel_getUid("setWithArray:"),function(_6b,_6c,_6d){
with(_6b){
return objj_msgSend(objj_msgSend(_6b,"alloc"),"initWithArray:",_6d);
}
}),new objj_method(sel_getUid("setWithObject:"),function(_6e,_6f,_70){
with(_6e){
return objj_msgSend(objj_msgSend(_6e,"alloc"),"initWithArray:",[_70]);
}
}),new objj_method(sel_getUid("setWithObjects:count:"),function(_71,_72,_73,_74){
with(_71){
return objj_msgSend(objj_msgSend(_71,"alloc"),"initWithObjects:count:",_73,_74);
}
}),new objj_method(sel_getUid("setWithObjects:"),function(_75,_76,_77){
with(_75){
var set=objj_msgSend(objj_msgSend(_75,"alloc"),"init"),_79=arguments.length,i=2;
for(;i<_79&&((argument=arguments[i])!==nil);++i){
objj_msgSend(set,"addObject:",argument);
}
return set;
}
}),new objj_method(sel_getUid("setWithSet:"),function(_7b,_7c,set){
with(_7b){
return objj_msgSend(objj_msgSend(_7b,"alloc"),"initWithSet:",set);
}
}),new objj_method(sel_getUid("setWithCapacity:"),function(_7e,_7f,_80){
with(_7e){
return objj_msgSend(objj_msgSend(_7e,"alloc"),"initWithCapacity:",_80);
}
})]);
var _1=objj_getClass("CPSet");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSet\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_81,_82){
with(_81){
return objj_msgSend(objj_msgSend(CPSet,"alloc"),"initWithSet:",_81);
}
}),new objj_method(sel_getUid("mutableCopy"),function(_83,_84){
with(_83){
return objj_msgSend(_83,"copy");
}
})]);
var _85="CPSetObjectsKey";
var _1=objj_getClass("CPSet");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSet\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_86,_87,_88){
with(_86){
return objj_msgSend(_86,"initWithArray:",objj_msgSend(_88,"decodeObjectForKey:",_85));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_89,_8a,_8b){
with(_89){
objj_msgSend(_8b,"encodeObject:forKey:",objj_msgSend(_89,"allObjects"),_85);
}
})]);
var _1=objj_allocateClassPair(CPSet,"CPMutableSet"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
p;18;CPSortDescriptor.ji;10;CPObject.ji;15;CPObjJRuntime.jc;1945;
CPOrderedAscending=-1;
CPOrderedSame=0;
CPOrderedDescending=1;
var _1=objj_allocateClassPair(CPObject,"CPSortDescriptor"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_key"),new objj_ivar("_selector"),new objj_ivar("_ascending")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithKey:ascending:"),function(_3,_4,_5,_6){
with(_3){
return objj_msgSend(_3,"initWithKey:ascending:selector:",_5,_6,sel_getUid("compare:"));
}
}),new objj_method(sel_getUid("initWithKey:ascending:selector:"),function(_7,_8,_9,_a,_b){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPObject")},"init");
if(_7){
_key=_9;
_ascending=_a;
_selector=_b;
}
return _7;
}
}),new objj_method(sel_getUid("ascending"),function(_c,_d){
with(_c){
return _ascending;
}
}),new objj_method(sel_getUid("key"),function(_e,_f){
with(_e){
return _key;
}
}),new objj_method(sel_getUid("selector"),function(_10,_11){
with(_10){
return _selector;
}
}),new objj_method(sel_getUid("compareObject:withObject:"),function(_12,_13,_14,_15){
with(_12){
return (_ascending?1:-1)*objj_msgSend(objj_msgSend(_14,"valueForKey:",_key),"performSelector:withObject:",_selector,objj_msgSend(_15,"valueForKey:",_key));
}
}),new objj_method(sel_getUid("reversedSortDescriptor"),function(_16,_17){
with(_16){
return objj_msgSend(objj_msgSend(objj_msgSend(_16,"class"),"alloc"),"initWithKey:ascending:selector:",_key,!_ascending,_selector);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("sortDescriptorWithKey:ascending:"),function(_18,_19,_1a,_1b){
with(_18){
return objj_msgSend(objj_msgSend(_18,"alloc"),"initWithKey:ascending:",_1a,_1b);
}
}),new objj_method(sel_getUid("sortDescriptorWithKey:ascending:selector:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
return objj_msgSend(objj_msgSend(_1c,"alloc"),"initWithKey:ascending:selector:",_1e,_1f,_20);
}
})]);
p;10;CPString.ji;10;CPObject.ji;13;CPException.ji;18;CPSortDescriptor.ji;9;CPValue.jc;9503;
CPCaseInsensitiveSearch=1;
CPLiteralSearch=2;
CPBackwardsSearch=4;
CPAnchoredSearch=8;
CPNumericSearch=64;
var _1=new objj_dictionary();
var _2=["/",".","*","+","?","|","$","^","(",")","[","]","{","}","\\"],_3=new RegExp("(\\"+_2.join("|\\")+")","g"),_4=new RegExp("(^\\s+|\\s+$)","g");
var _5=objj_allocateClassPair(CPObject,"CPString"),_6=_5.isa;
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithString:"),function(_7,_8,_9){
with(_7){
return String(_9);
}
}),new objj_method(sel_getUid("initWithFormat:"),function(_a,_b,_c){
with(_a){
if(!_c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
_a=sprintf.apply(this,Array.prototype.slice.call(arguments,2));
return _a;
}
}),new objj_method(sel_getUid("description"),function(_d,_e){
with(_d){
return _d;
}
}),new objj_method(sel_getUid("length"),function(_f,_10){
with(_f){
return length;
}
}),new objj_method(sel_getUid("characterAtIndex:"),function(_11,_12,_13){
with(_11){
return charAt(_13);
}
}),new objj_method(sel_getUid("stringByAppendingFormat:"),function(_14,_15,_16){
with(_14){
if(!_16){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return _14+sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
}),new objj_method(sel_getUid("stringByAppendingString:"),function(_17,_18,_19){
with(_17){
return _17+_19;
}
}),new objj_method(sel_getUid("stringByPaddingToLength:withString:startingAtIndex:"),function(_1a,_1b,_1c,_1d,_1e){
with(_1a){
if(length==_1c){
return _1a;
}
if(_1c<length){
return substr(0,_1c);
}
var _1f=_1a,_20=_1d.substring(_1e),_21=_1c-length;
while((_21-=_20.length)>=0){
_1f+=_20;
}
if(-_21<_20.length){
_1f+=_20.substring(0,-_21);
}
return _1f;
}
}),new objj_method(sel_getUid("componentsSeparatedByString:"),function(_22,_23,_24){
with(_22){
return split(_24);
}
}),new objj_method(sel_getUid("substringFromIndex:"),function(_25,_26,_27){
with(_25){
return substr(_27);
}
}),new objj_method(sel_getUid("substringWithRange:"),function(_28,_29,_2a){
with(_28){
return substr(_2a.location,_2a.length);
}
}),new objj_method(sel_getUid("substringToIndex:"),function(_2b,_2c,_2d){
with(_2b){
return substring(0,_2d);
}
}),new objj_method(sel_getUid("rangeOfString:"),function(_2e,_2f,_30){
with(_2e){
return objj_msgSend(_2e,"rangeOfString:options:",_30,0);
}
}),new objj_method(sel_getUid("rangeOfString:options:"),function(_31,_32,_33,_34){
with(_31){
return objj_msgSend(_31,"rangeOfString:options:range:",_33,_34,nil);
}
}),new objj_method(sel_getUid("rangeOfString:options:range:"),function(_35,_36,_37,_38,_39){
with(_35){
var _3a=(_39==nil)?_35:objj_msgSend(_35,"substringWithRange:",_39),_3b=CPNotFound;
if(_38&CPCaseInsensitiveSearch){
_3a=_3a.toLowerCase();
_37=_37.toLowerCase();
}
if(_38&CPBackwardsSearch){
_3b=_3a.lastIndexOf(_37,_38&CPAnchoredSearch?length-_37.length:0);
}else{
if(_38&CPAnchoredSearch){
_3b=_3a.substr(0,_37.length).indexOf(_37)!=CPNotFound?0:CPNotFound;
}else{
_3b=_3a.indexOf(_37);
}
}
return CPMakeRange(_3b,_3b==CPNotFound?0:_37.length);
}
}),new objj_method(sel_getUid("stringByEscapingRegexControlCharacters"),function(_3c,_3d){
with(_3c){
return _3c.replace(_3,"\\$1");
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:"),function(_3e,_3f,_40,_41){
with(_3e){
return _3e.replace(new RegExp(objj_msgSend(_40,"stringByEscapingRegexControlCharacters"),"g"),_41);
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:options:range:"),function(_42,_43,_44,_45,_46,_47){
with(_42){
var _48=substring(0,_47.location),_49=substr(_47.location,_47.length),end=substring(_47.location+_47.length,_42.length),_44=objj_msgSend(_44,"stringByEscapingRegexControlCharacters"),_4b;
if(_46&CPCaseInsensitiveSearch){
_4b=new RegExp(_44,"gi");
}else{
_4b=new RegExp(_44,"g");
}
return _48+""+_49.replace(_4b,_45)+""+end;
}
}),new objj_method(sel_getUid("stringByReplacingCharactersInRange:withString:"),function(_4c,_4d,_4e,_4f){
with(_4c){
return ""+substring(0,_4e.location)+_4f+substring(_4e.location+_4e.length,_4c.length);
}
}),new objj_method(sel_getUid("stringByTrimmingWhitespace"),function(_50,_51){
with(_50){
return _50.replace(_4,"");
}
}),new objj_method(sel_getUid("compare:"),function(_52,_53,_54){
with(_52){
return objj_msgSend(_52,"compare:options:",_54,nil);
}
}),new objj_method(sel_getUid("caseInsensitiveCompare:"),function(_55,_56,_57){
with(_55){
return objj_msgSend(_55,"compare:options:",_57,CPCaseInsensitiveSearch);
}
}),new objj_method(sel_getUid("compare:options:"),function(_58,_59,_5a,_5b){
with(_58){
var lhs=_58,rhs=_5a;
if(_5b&CPCaseInsensitiveSearch){
lhs=lhs.toLowerCase();
rhs=rhs.toLowerCase();
}
if(lhs<rhs){
return CPOrderedAscending;
}else{
if(lhs>rhs){
return CPOrderedDescending;
}
}
return CPOrderedSame;
}
}),new objj_method(sel_getUid("compare:options:range:"),function(_5e,_5f,_60,_61,_62){
with(_5e){
var lhs=objj_msgSend(_5e,"substringWithRange:",_62),rhs=_60;
return objj_msgSend(lhs,"compare:options:",rhs,_61);
}
}),new objj_method(sel_getUid("hasPrefix:"),function(_65,_66,_67){
with(_65){
return _67&&_67!=""&&indexOf(_67)==0;
}
}),new objj_method(sel_getUid("hasSuffix:"),function(_68,_69,_6a){
with(_68){
return _6a&&_6a!=""&&lastIndexOf(_6a)==(length-_6a.length);
}
}),new objj_method(sel_getUid("isEqualToString:"),function(_6b,_6c,_6d){
with(_6b){
return _6b==_6d;
}
}),new objj_method(sel_getUid("UID"),function(_6e,_6f){
with(_6e){
var _70=dictionary_getValue(_1,_6e);
if(!_70){
_70=_objj_generateObjectHash();
dictionary_setValue(_1,_6e,_70);
}
return _70;
}
}),new objj_method(sel_getUid("capitalizedString"),function(_71,_72){
with(_71){
var _73=_71.split(/\b/g);
for(var i=0;i<_73.length;i++){
if(i==0||(/\s$/).test(_73[i-1])){
_73[i]=_73[i].substring(0,1).toUpperCase()+_73[i].substring(1).toLowerCase();
}else{
_73[i]=_73[i].toLowerCase();
}
}
return _73.join("");
}
}),new objj_method(sel_getUid("lowercaseString"),function(_75,_76){
with(_75){
return toLowerCase();
}
}),new objj_method(sel_getUid("uppercaseString"),function(_77,_78){
with(_77){
return toUpperCase();
}
}),new objj_method(sel_getUid("doubleValue"),function(_79,_7a){
with(_79){
return parseFloat(_79,10);
}
}),new objj_method(sel_getUid("boolValue"),function(_7b,_7c){
with(_7b){
var _7d=new RegExp("^\\s*[\\+,\\-]*0*");
return RegExp("^[Y,y,t,T,1-9]").test(_7b.replace(_7d,""));
}
}),new objj_method(sel_getUid("floatValue"),function(_7e,_7f){
with(_7e){
return parseFloat(_7e,10);
}
}),new objj_method(sel_getUid("intValue"),function(_80,_81){
with(_80){
return parseInt(_80,10);
}
}),new objj_method(sel_getUid("pathComponents"),function(_82,_83){
with(_82){
var _84=split("/");
if(_84[0]===""){
_84[0]="/";
}
if(_84[_84.length-1]===""){
_84.pop();
}
return _84;
}
}),new objj_method(sel_getUid("pathExtension"),function(_85,_86){
with(_85){
return substr(lastIndexOf(".")+1);
}
}),new objj_method(sel_getUid("lastPathComponent"),function(_87,_88){
with(_87){
var _89=objj_msgSend(_87,"pathComponents");
return _89[_89.length-1];
}
}),new objj_method(sel_getUid("stringByDeletingLastPathComponent"),function(_8a,_8b){
with(_8a){
var _8c=_8a,_8d=length-1;
while(_8c.charAt(_8d)==="/"){
_8d--;
}
_8c=_8c.substr(0,_8c.lastIndexOf("/",_8d));
if(_8c===""&&charAt(0)==="/"){
return "/";
}
return _8c;
}
}),new objj_method(sel_getUid("stringByStandardizingPath"),function(_8e,_8f){
with(_8e){
return objj_standardize_path(_8e);
}
}),new objj_method(sel_getUid("copy"),function(_90,_91){
with(_90){
return new String(_90);
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("alloc"),function(_92,_93){
with(_92){
return new String;
}
}),new objj_method(sel_getUid("string"),function(_94,_95){
with(_94){
return objj_msgSend(objj_msgSend(_94,"alloc"),"init");
}
}),new objj_method(sel_getUid("stringWithHash:"),function(_96,_97,_98){
with(_96){
var _99=parseInt(_98,10).toString(16);
return "000000".substring(0,MAX(6-_99.length,0))+_99;
}
}),new objj_method(sel_getUid("stringWithString:"),function(_9a,_9b,_9c){
with(_9a){
if(!_9c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"stringWithString: the string can't be 'nil'");
}
return objj_msgSend(objj_msgSend(_9a,"alloc"),"initWithString:",_9c);
}
}),new objj_method(sel_getUid("stringWithFormat:"),function(_9d,_9e,_9f){
with(_9d){
if(!_9f){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
})]);
var _5=objj_getClass("CPString");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("objectFromJSON"),function(_a0,_a1){
with(_a0){
return JSON.parse(_a0);
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("JSONFromObject:"),function(_a2,_a3,_a4){
with(_a2){
return JSON.stringify(_a4);
}
})]);
var _5=objj_getClass("CPString");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _6=_5.isa;
class_addMethods(_6,[new objj_method(sel_getUid("UUID"),function(_a5,_a6){
with(_a5){
var g="";
for(var i=0;i<32;i++){
g+=FLOOR(RAND()*15).toString(15);
}
return g;
}
})]);
String.prototype.isa=CPString;
p;9;CPTimer.ji;10;CPObject.ji;14;CPInvocation.ji;8;CPDate.ji;11;CPRunLoop.jc;5354;
var _1=objj_allocateClassPair(CPObject,"CPTimer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_timeInterval"),new objj_ivar("_invocation"),new objj_ivar("_callback"),new objj_ivar("_repeats"),new objj_ivar("_isValid"),new objj_ivar("_fireDate"),new objj_ivar("_userInfo")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFireDate:interval:invocation:repeats:"),function(_3,_4,_5,_6,_7,_8){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_timeInterval=_6;
_invocation=_7;
_repeats=_8;
_isValid=YES;
_fireDate=_5;
}
return _3;
}
}),new objj_method(sel_getUid("initWithFireDate:interval:target:selector:userInfo:repeats:"),function(_9,_a,_b,_c,_d,_e,_f,_10){
with(_9){
var _11=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",1);
objj_msgSend(_11,"setTarget:",_d);
objj_msgSend(_11,"setSelector:",_e);
objj_msgSend(_11,"setArgument:atIndex:",_9,2);
_9=objj_msgSend(_9,"initWithFireDate:interval:invocation:repeats:",_b,_c,_11,_10);
if(_9){
_userInfo=_f;
}
return _9;
}
}),new objj_method(sel_getUid("initWithFireDate:interval:callback:repeats:"),function(_12,_13,_14,_15,_16,_17){
with(_12){
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPObject")},"init");
if(_12){
_timeInterval=_15;
_callback=_16;
_repeats=_17;
_isValid=YES;
_fireDate=_14;
}
return _12;
}
}),new objj_method(sel_getUid("timeInterval"),function(_18,_19){
with(_18){
return _timeInterval;
}
}),new objj_method(sel_getUid("fireDate"),function(_1a,_1b){
with(_1a){
return _fireDate;
}
}),new objj_method(sel_getUid("setFireDate:"),function(_1c,_1d,_1e){
with(_1c){
_fireDate=_1e;
}
}),new objj_method(sel_getUid("fire"),function(_1f,_20){
with(_1f){
if(!_isValid){
return;
}
if(_callback){
_callback();
}else{
objj_msgSend(_invocation,"invoke");
}
if(!_isValid){
return;
}
if(_repeats){
_fireDate=objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_timeInterval);
}else{
objj_msgSend(_1f,"invalidate");
}
}
}),new objj_method(sel_getUid("isValid"),function(_21,_22){
with(_21){
return _isValid;
}
}),new objj_method(sel_getUid("invalidate"),function(_23,_24){
with(_23){
_isValid=NO;
_userInfo=nil;
_invocation=nil;
_callback=nil;
}
}),new objj_method(sel_getUid("userInfo"),function(_25,_26){
with(_25){
return _userInfo;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("scheduledTimerWithTimeInterval:invocation:repeats:"),function(_27,_28,_29,_2a,_2b){
with(_27){
var _2c=objj_msgSend(objj_msgSend(_27,"alloc"),"initWithFireDate:interval:invocation:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_29),_29,_2a,_2b);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"addTimer:forMode:",_2c,CPDefaultRunLoopMode);
return _2c;
}
}),new objj_method(sel_getUid("scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:"),function(_2d,_2e,_2f,_30,_31,_32,_33){
with(_2d){
var _34=objj_msgSend(objj_msgSend(_2d,"alloc"),"initWithFireDate:interval:target:selector:userInfo:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_2f),_2f,_30,_31,_32,_33);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"addTimer:forMode:",_34,CPDefaultRunLoopMode);
return _34;
}
}),new objj_method(sel_getUid("scheduledTimerWithTimeInterval:callback:repeats:"),function(_35,_36,_37,_38,_39){
with(_35){
var _3a=objj_msgSend(objj_msgSend(_35,"alloc"),"initWithFireDate:interval:callback:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_37),_37,_38,_39);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"addTimer:forMode:",_3a,CPDefaultRunLoopMode);
return _3a;
}
}),new objj_method(sel_getUid("timerWithTimeInterval:invocation:repeats:"),function(_3b,_3c,_3d,_3e,_3f){
with(_3b){
return objj_msgSend(objj_msgSend(_3b,"alloc"),"initWithFireDate:interval:invocation:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_3d),_3d,_3e,_3f);
}
}),new objj_method(sel_getUid("timerWithTimeInterval:target:selector:userInfo:repeats:"),function(_40,_41,_42,_43,_44,_45,_46){
with(_40){
return objj_msgSend(objj_msgSend(_40,"alloc"),"initWithFireDate:interval:target:selector:userInfo:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_42),_42,_43,_44,_45,_46);
}
}),new objj_method(sel_getUid("timerWithTimeInterval:callback:repeats:"),function(_47,_48,_49,_4a,_4b){
with(_47){
return objj_msgSend(objj_msgSend(_47,"alloc"),"initWithFireDate:interval:callback:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_49),_49,_4a,_4b);
}
})]);
var _4c=1000,_4d={};
var _4e=function(_4f,_50,_51,_52){
var _53=_4c++,_54=nil;
if(typeof _4f==="string"){
_54=function(){
new Function(_4f)();
if(!_51){
_4d[_53]=nil;
}
};
}else{
if(!_52){
_52=[];
}
_54=function(){
_4f.apply(window,_52);
if(!_51){
_4d[_53]=nil;
}
};
}
_4d[_53]=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",_50/1000,_54,_51);
return _53;
};
window.setTimeout=function(_55,_56){
return _4e(_55,_56,NO,Array.prototype.slice.apply(arguments,[2]));
};
window.clearTimeout=function(_57){
var _58=_4d[_57];
if(_58){
objj_msgSend(_58,"invalidate");
}
_4d[_57]=nil;
};
window.setInterval=function(_59,_5a,_5b){
return _4e(_59,_5a,YES,Array.prototype.slice.apply(arguments,[2]));
};
window.clearInterval=function(_5c){
window.clearTimeout(_5c);
};
p;15;CPUndoManager.ji;10;CPObject.ji;14;CPInvocation.jc;13713;
var _1=0,_2=1,_3=2;
CPUndoManagerCheckpointNotification="CPUndoManagerCheckpointNotification";
CPUndoManagerDidOpenUndoGroupNotification="CPUndoManagerDidOpenUndoGroupNotification";
CPUndoManagerDidRedoChangeNotification="CPUndoManagerDidRedoChangeNotification";
CPUndoManagerDidUndoChangeNotification="CPUndoManagerDidUndoChangeNotification";
CPUndoManagerWillCloseUndoGroupNotification="CPUndoManagerWillCloseUndoGroupNotification";
CPUndoManagerWillRedoChangeNotification="CPUndoManagerWillRedoChangeNotification";
CPUndoManagerWillUndoChangeNotification="CPUndoManagerWillUndoChangeNotification";
CPUndoCloseGroupingRunLoopOrdering=350000;
var _4=[],_5=5;
var _6=objj_allocateClassPair(CPObject,"_CPUndoGrouping"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_parent"),new objj_ivar("_invocations")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("initWithParent:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPObject")},"init");
if(_8){
_parent=_a;
_invocations=[];
}
return _8;
}
}),new objj_method(sel_getUid("parent"),function(_b,_c){
with(_b){
return _parent;
}
}),new objj_method(sel_getUid("addInvocation:"),function(_d,_e,_f){
with(_d){
_invocations.push(_f);
}
}),new objj_method(sel_getUid("addInvocationsFromArray:"),function(_10,_11,_12){
with(_10){
objj_msgSend(_invocations,"addObjectsFromArray:",_12);
}
}),new objj_method(sel_getUid("removeInvocationsWithTarget:"),function(_13,_14,_15){
with(_13){
var _16=_invocations.length;
while(_16--){
if(objj_msgSend(_invocations[_16],"target")==_15){
_invocations.splice(_16,1);
}
}
}
}),new objj_method(sel_getUid("invocations"),function(_17,_18){
with(_17){
return _invocations;
}
}),new objj_method(sel_getUid("invoke"),function(_19,_1a){
with(_19){
var _1b=_invocations.length;
while(_1b--){
objj_msgSend(_invocations[_1b],"invoke");
}
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("_poolUndoGrouping:"),function(_1c,_1d,_1e){
with(_1c){
if(!_1e||_4.length>=_5){
return;
}
_4.push(_1e);
}
}),new objj_method(sel_getUid("undoGroupingWithParent:"),function(_1f,_20,_21){
with(_1f){
if(_4.length){
var _22=_4.pop();
_22._parent=_21;
if(_22._invocations.length){
_22._invocations=[];
}
return _22;
}
return objj_msgSend(objj_msgSend(_1f,"alloc"),"initWithParent:",_21);
}
})]);
var _23="_CPUndoGroupingParentKey",_24="_CPUndoGroupingInvocationsKey";
var _6=objj_getClass("_CPUndoGrouping");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPUndoGrouping\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_25,_26,_27){
with(_25){
_25=objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPObject")},"init");
if(_25){
_parent=objj_msgSend(_27,"decodeObjectForKey:",_23);
_invocations=objj_msgSend(_27,"decodeObjectForKey:",_24);
}
return _25;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_2a,"encodeObject:forKey:",_parent,_23);
objj_msgSend(_2a,"encodeObject:forKey:",_invocations,_24);
}
})]);
var _6=objj_allocateClassPair(CPObject,"CPUndoManager"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_redoStack"),new objj_ivar("_undoStack"),new objj_ivar("_groupsByEvent"),new objj_ivar("_disableCount"),new objj_ivar("_levelsOfUndo"),new objj_ivar("_currentGrouping"),new objj_ivar("_state"),new objj_ivar("_actionName"),new objj_ivar("_preparedTarget"),new objj_ivar("_runLoopModes"),new objj_ivar("_registeredWithRunLoop")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("init"),function(_2b,_2c){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("CPObject")},"init");
if(_2b){
_redoStack=[];
_undoStack=[];
_state=_1;
objj_msgSend(_2b,"setRunLoopModes:",[CPDefaultRunLoopMode]);
objj_msgSend(_2b,"setGroupsByEvent:",YES);
_performRegistered=NO;
}
return _2b;
}
}),new objj_method(sel_getUid("registerUndoWithTarget:selector:object:"),function(_2d,_2e,_2f,_30,_31){
with(_2d){
if(!_currentGrouping){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"No undo group is currently open");
}
if(_disableCount>0){
return;
}
var _32=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",nil);
objj_msgSend(_32,"setTarget:",_2f);
objj_msgSend(_32,"setSelector:",_30);
objj_msgSend(_32,"setArgument:atIndex:",_31,2);
objj_msgSend(_currentGrouping,"addInvocation:",_32);
if(_state==_1){
objj_msgSend(_redoStack,"removeAllObjects");
}
}
}),new objj_method(sel_getUid("prepareWithInvocationTarget:"),function(_33,_34,_35){
with(_33){
_preparedTarget=_35;
return _33;
}
}),new objj_method(sel_getUid("methodSignatureForSelector:"),function(_36,_37,_38){
with(_36){
if(objj_msgSend(_preparedTarget,"respondsToSelector:",_38)){
return 1;
}
return nil;
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_39,_3a,_3b){
with(_39){
if(_disableCount>0){
return;
}
objj_msgSend(_3b,"setTarget:",_preparedTarget);
objj_msgSend(_currentGrouping,"addInvocation:",_3b);
if(_state==_1){
objj_msgSend(_redoStack,"removeAllObjects");
}
_preparedTarget=nil;
}
}),new objj_method(sel_getUid("canRedo"),function(_3c,_3d){
with(_3c){
return _redoStack.length>0;
}
}),new objj_method(sel_getUid("canUndo"),function(_3e,_3f){
with(_3e){
if(_undoStack.length>0){
return YES;
}
return objj_msgSend(_currentGrouping,"actions").length>0;
}
}),new objj_method(sel_getUid("undo"),function(_40,_41){
with(_40){
if(objj_msgSend(_40,"groupingLevel")==1){
objj_msgSend(_40,"endUndoGrouping");
}
objj_msgSend(_40,"undoNestedGroup");
}
}),new objj_method(sel_getUid("undoNestedGroup"),function(_42,_43){
with(_42){
if(_undoStack.length==0){
return;
}
var _44=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_44,"postNotificationName:object:",CPUndoManagerWillUndoChangeNotification,_42);
var _45=_undoStack.pop();
_state=_2;
objj_msgSend(_42,"beginUndoGrouping");
objj_msgSend(_45,"invoke");
objj_msgSend(_42,"endUndoGrouping");
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_45);
_state=_1;
objj_msgSend(_44,"postNotificationName:object:",CPUndoManagerDidUndoChangeNotification,_42);
}
}),new objj_method(sel_getUid("redo"),function(_46,_47){
with(_46){
if(_redoStack.length==0){
return;
}
var _48=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_48,"postNotificationName:object:",CPUndoManagerWillRedoChangeNotification,_46);
var _49=_currentGrouping,_4a=_redoStack.pop();
_currentGrouping=nil;
_state=_3;
objj_msgSend(_46,"beginUndoGrouping");
objj_msgSend(_4a,"invoke");
objj_msgSend(_46,"endUndoGrouping");
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_4a);
_currentGrouping=_49;
_state=_1;
objj_msgSend(_48,"postNotificationName:object:",CPUndoManagerDidRedoChangeNotification,_46);
}
}),new objj_method(sel_getUid("beginUndoGrouping"),function(_4b,_4c){
with(_4b){
_currentGrouping=objj_msgSend(_CPUndoGrouping,"undoGroupingWithParent:",_currentGrouping);
}
}),new objj_method(sel_getUid("endUndoGrouping"),function(_4d,_4e){
with(_4d){
if(!_currentGrouping){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"endUndoGrouping. No undo group is currently open.");
}
var _4f=objj_msgSend(_currentGrouping,"parent");
if(!_4f&&objj_msgSend(_currentGrouping,"invocations").length>0){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPUndoManagerWillCloseUndoGroupNotification,_4d);
var _50=_state==_2?_redoStack:_undoStack;
_50.push(_currentGrouping);
if(_levelsOfUndo>0&&_50.length>_levelsOfUndo){
_50.splice(0,1);
}
}else{
objj_msgSend(_4f,"addInvocationsFromArray:",objj_msgSend(_currentGrouping,"invocations"));
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_currentGrouping);
}
_currentGrouping=_4f;
}
}),new objj_method(sel_getUid("enableUndoRegistration"),function(_51,_52){
with(_51){
if(_disableCount<=0){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"enableUndoRegistration. There are no disable messages in effect right now.");
}
_disableCount--;
}
}),new objj_method(sel_getUid("groupsByEvent"),function(_53,_54){
with(_53){
return _groupsByEvent;
}
}),new objj_method(sel_getUid("setGroupsByEvent:"),function(_55,_56,_57){
with(_55){
if(_groupsByEvent==_57){
return;
}
_groupsByEvent=_57;
if(_groupsByEvent){
objj_msgSend(_55,"_registerWithRunLoop");
if(!_currentGrouping){
objj_msgSend(_55,"beginUndoGrouping");
}
}else{
objj_msgSend(_55,"_unregisterWithRunLoop");
}
}
}),new objj_method(sel_getUid("groupingLevel"),function(_58,_59){
with(_58){
var _5a=_currentGrouping,_5b=_currentGrouping!=nil;
while(_5a=objj_msgSend(_5a,"parent")){
++_5b;
}
return _5b;
}
}),new objj_method(sel_getUid("disableUndoRegistration"),function(_5c,_5d){
with(_5c){
++_disableCount;
}
}),new objj_method(sel_getUid("isUndoRegistrationEnabled"),function(_5e,_5f){
with(_5e){
return _disableCount==0;
}
}),new objj_method(sel_getUid("isUndoing"),function(_60,_61){
with(_60){
return _state==_2;
}
}),new objj_method(sel_getUid("isRedoing"),function(_62,_63){
with(_62){
return _state==_3;
}
}),new objj_method(sel_getUid("removeAllActions"),function(_64,_65){
with(_64){
_redoStack=[];
_undoStack=[];
_disableCount=0;
}
}),new objj_method(sel_getUid("removeAllActionsWithTarget:"),function(_66,_67,_68){
with(_66){
objj_msgSend(_currentGrouping,"removeInvocationsWithTarget:",_68);
var _69=_redoStack.length;
while(_69--){
var _6a=_redoStack[_69];
objj_msgSend(_6a,"removeInvocationsWithTarget:",_68);
if(!objj_msgSend(_6a,"invocations").length){
_redoStack.splice(_69,1);
}
}
_69=_undoStack.length;
while(_69--){
var _6a=_undoStack[_69];
objj_msgSend(_6a,"removeInvocationsWithTarget:",_68);
if(!objj_msgSend(_6a,"invocations").length){
_undoStack.splice(_69,1);
}
}
}
}),new objj_method(sel_getUid("setActionName:"),function(_6b,_6c,_6d){
with(_6b){
_actionName=_6d;
}
}),new objj_method(sel_getUid("redoActionName"),function(_6e,_6f){
with(_6e){
return objj_msgSend(_6e,"canRedo")?_actionName:nil;
}
}),new objj_method(sel_getUid("undoActionName"),function(_70,_71){
with(_70){
return objj_msgSend(_70,"canUndo")?_actionName:nil;
}
}),new objj_method(sel_getUid("runLoopModes"),function(_72,_73){
with(_72){
return _runLoopModes;
}
}),new objj_method(sel_getUid("setRunLoopModes:"),function(_74,_75,_76){
with(_74){
_runLoopModes=_76;
objj_msgSend(_74,"_unregisterWithRunLoop");
if(_groupsByEvent){
objj_msgSend(_74,"_registerWithRunLoop");
}
}
}),new objj_method(sel_getUid("beginUndoGroupingForEvent"),function(_77,_78){
with(_77){
if(!_groupsByEvent){
return;
}
if(_currentGrouping!=nil){
objj_msgSend(_77,"endUndoGrouping");
}
objj_msgSend(_77,"beginUndoGrouping");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("beginUndoGroupingForEvent"),_77,nil,CPUndoCloseGroupingRunLoopOrdering,_runLoopModes);
}
}),new objj_method(sel_getUid("_registerWithRunLoop"),function(_79,_7a){
with(_79){
if(_registeredWithRunLoop){
return;
}
_registeredWithRunLoop=YES;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("beginUndoGroupingForEvent"),_79,nil,CPUndoCloseGroupingRunLoopOrdering,_runLoopModes);
}
}),new objj_method(sel_getUid("_unregisterWithRunLoop"),function(_7b,_7c){
with(_7b){
if(!_registeredWithRunLoop){
return;
}
_registeredWithRunLoop=NO;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"cancelPerformSelector:target:argument:",sel_getUid("beginUndoGroupingForEvent"),_7b,nil);
}
})]);
var _7d="CPUndoManagerRedoStackKey",_7e="CPUndoManagerUndoStackKey";
CPUndoManagerLevelsOfUndoKey="CPUndoManagerLevelsOfUndoKey";
CPUndoManagerActionNameKey="CPUndoManagerActionNameKey";
CPUndoManagerCurrentGroupingKey="CPUndoManagerCurrentGroupingKey";
CPUndoManagerRunLoopModesKey="CPUndoManagerRunLoopModesKey";
CPUndoManagerGroupsByEventKey="CPUndoManagerGroupsByEventKey";
var _6=objj_getClass("CPUndoManager");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPUndoManager\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_7f,_80,_81){
with(_7f){
_7f=objj_msgSendSuper({receiver:_7f,super_class:objj_getClass("CPObject")},"init");
if(_7f){
_redoStack=objj_msgSend(_81,"decodeObjectForKey:",_7d);
_undoStack=objj_msgSend(_81,"decodeObjectForKey:",_7e);
_levelsOfUndo=objj_msgSend(_81,"decodeObjectForKey:",CPUndoManagerLevelsOfUndoKey);
_actionName=objj_msgSend(_81,"decodeObjectForKey:",CPUndoManagerActionNameKey);
_currentGrouping=objj_msgSend(_81,"decodeObjectForKey:",CPUndoManagerCurrentGroupingKey);
_state=_1;
objj_msgSend(_7f,"setRunLoopModes:",objj_msgSend(_81,"decodeObjectForKey:",CPUndoManagerRunLoopModesKey));
objj_msgSend(_7f,"setGroupsByEvent:",objj_msgSend(_81,"decodeBoolForKey:",CPUndoManagerGroupsByEventKey));
}
return _7f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_82,_83,_84){
with(_82){
objj_msgSend(_84,"encodeObject:forKey:",_redoStack,_7d);
objj_msgSend(_84,"encodeObject:forKey:",_undoStack,_7e);
objj_msgSend(_84,"encodeInt:forKey:",_levelsOfUndo,CPUndoManagerLevelsOfUndoKey);
objj_msgSend(_84,"encodeObject:forKey:",_actionName,CPUndoManagerActionNameKey);
objj_msgSend(_84,"encodeObject:forKey:",_currentGrouping,CPUndoManagerCurrentGroupingKey);
objj_msgSend(_84,"encodeObject:forKey:",_runLoopModes,CPUndoManagerRunLoopModesKey);
objj_msgSend(_84,"encodeBool:forKey:",_groupsByEvent,CPUndoManagerGroupsByEventKey);
}
})]);
p;7;CPURL.jI;21;Foundation/CPObject.jc;11349;
CPURLNameKey="CPURLNameKey";
CPURLLocalizedNameKey="CPURLLocalizedNameKey";
CPURLIsRegularFileKey="CPURLIsRegularFileKey";
CPURLIsDirectoryKey="CPURLIsDirectoryKey";
CPURLIsSymbolicLinkKey="CPURLIsSymbolicLinkKey";
CPURLIsVolumeKey="CPURLIsVolumeKey";
CPURLIsPackageKey="CPURLIsPackageKey";
CPURLIsSystemImmutableKey="CPURLIsSystemImmutableKey";
CPURLIsUserImmutableKey="CPURLIsUserImmutableKey";
CPURLIsHiddenKey="CPURLIsHiddenKey";
CPURLHasHiddenExtensionKey="CPURLHasHiddenExtensionKey";
CPURLCreationDateKey="CPURLCreationDateKey";
CPURLContentAccessDateKey="CPURLContentAccessDateKey";
CPURLContentModificationDateKey="CPURLContentModificationDateKey";
CPURLAttributeModificationDateKey="CPURLAttributeModificationDateKey";
CPURLLinkCountKey="CPURLLinkCountKey";
CPURLParentDirectoryURLKey="CPURLParentDirectoryURLKey";
CPURLVolumeURLKey="CPURLTypeIdentifierKey";
CPURLTypeIdentifierKey="CPURLTypeIdentifierKey";
CPURLLocalizedTypeDescriptionKey="CPURLLocalizedTypeDescriptionKey";
CPURLLabelNumberKey="CPURLLabelNumberKey";
CPURLLabelColorKey="CPURLLabelColorKey";
CPURLLocalizedLabelKey="CPURLLocalizedLabelKey";
CPURLEffectiveIconKey="CPURLEffectiveIconKey";
CPURLCustomIconKey="CPURLCustomIconKey";
var _1=objj_allocateClassPair(CPObject,"CPURL"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_base"),new objj_ivar("_relative"),new objj_ivar("_resourceValues")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("baseURL"),function(_3,_4){
with(_3){
return _base;
}
}),new objj_method(sel_getUid("relativeString"),function(_5,_6){
with(_5){
return _relative;
}
}),new objj_method(sel_getUid("initWithScheme:host:path:"),function(_7,_8,_9,_a,_b){
with(_7){
var _c=new _d();
_c.scheme=_9;
_c.authority=_a;
_c.path=_b;
objj_msgSend(_7,"initWithString:",_c.toString());
}
}),new objj_method(sel_getUid("initWithString:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(_e,"initWithString:relativeToURL:",_10,nil);
}
}),new objj_method(sel_getUid("initWithString:relativeToURL:"),function(_11,_12,_13,_14){
with(_11){
if(!_15.test(_13)){
return nil;
}
if(_11){
_base=_14;
_relative=_13;
_resourceValues=objj_msgSend(CPDictionary,"dictionary");
}
return _11;
}
}),new objj_method(sel_getUid("absoluteURL"),function(_16,_17){
with(_16){
var _18=objj_msgSend(_16,"absoluteString");
if(_18!==_relative){
return objj_msgSend(objj_msgSend(CPURL,"alloc"),"initWithString:",_18);
}
return _16;
}
}),new objj_method(sel_getUid("absoluteString"),function(_19,_1a){
with(_19){
return _1b(objj_msgSend(_base,"absoluteString")||"",_relative);
}
}),new objj_method(sel_getUid("relativeString"),function(_1c,_1d){
with(_1c){
return _relative;
}
}),new objj_method(sel_getUid("path"),function(_1e,_1f){
with(_1e){
var str=objj_msgSend(_1e,"absoluteString");
return _15.test(str)?(_21(str).path||nil):nil;
}
}),new objj_method(sel_getUid("relativePath"),function(_22,_23){
with(_22){
return _15.test(_relative)?(_21(_relative).path||nil):nil;
}
}),new objj_method(sel_getUid("scheme"),function(_24,_25){
with(_24){
var str=objj_msgSend(_24,"absoluteString");
return _15.test(str)?(_21(str).protocol||nil):nil;
}
}),new objj_method(sel_getUid("user"),function(_27,_28){
with(_27){
var str=objj_msgSend(_27,"absoluteString");
return _15.test(str)?(_21(str).user||nil):nil;
}
}),new objj_method(sel_getUid("password"),function(_2a,_2b){
with(_2a){
var str=objj_msgSend(_2a,"absoluteString");
return _15.test(str)?(_21(str).password||nil):nil;
}
}),new objj_method(sel_getUid("host"),function(_2d,_2e){
with(_2d){
var str=objj_msgSend(_2d,"absoluteString");
return _15.test(str)?(_21(str).domain||nil):nil;
}
}),new objj_method(sel_getUid("port"),function(_30,_31){
with(_30){
var str=objj_msgSend(_30,"absoluteString");
if(_15.test(str)){
var _33=_21(str).port;
if(_33){
return parseInt(_33,10);
}
}
return nil;
}
}),new objj_method(sel_getUid("parameterString"),function(_34,_35){
with(_34){
var str=objj_msgSend(_34,"absoluteString");
return _15.test(str)?(_21(str).query||nil):nil;
}
}),new objj_method(sel_getUid("fragment"),function(_37,_38){
with(_37){
var str=objj_msgSend(_37,"absoluteString");
return _15.test(str)?(_21(str).anchor||nil):nil;
}
}),new objj_method(sel_getUid("isEqual:"),function(_3a,_3b,_3c){
with(_3a){
return objj_msgSend(_3a,"relativeString")===objj_msgSend(_3c,"relativeString")&&(objj_msgSend(_3a,"baseURL")===objj_msgSend(_3c,"baseURL")||objj_msgSend(objj_msgSend(_3a,"baseURL"),"isEqual:",objj_msgSend(_3c,"baseURL")));
}
}),new objj_method(sel_getUid("lastPathComponent"),function(_3d,_3e){
with(_3d){
var _3f=objj_msgSend(_3d,"path");
return _3f?_3f.split("/").pop():nil;
}
}),new objj_method(sel_getUid("pathExtension"),function(_40,_41){
with(_40){
var _42=objj_msgSend(_40,"path"),ext=_42.match(/\.(\w+)$/);
return ext?ext[1]:"";
}
}),new objj_method(sel_getUid("standardizedURL"),function(_44,_45){
with(_44){
return objj_msgSend(CPURL,"URLWithString:relativeToURL:",_46(_21(_relative)),_base);
}
}),new objj_method(sel_getUid("isFileURL"),function(_47,_48){
with(_47){
return objj_msgSend(_47,"scheme")==="file";
}
}),new objj_method(sel_getUid("description"),function(_49,_4a){
with(_49){
return objj_msgSend(_49,"absoluteString");
}
}),new objj_method(sel_getUid("resourceValueForKey:"),function(_4b,_4c,_4d){
with(_4b){
return objj_msgSend(_resourceValues,"objectForKey:",_4d);
}
}),new objj_method(sel_getUid("setResourceValue:forKey:"),function(_4e,_4f,_50,_51){
with(_4e){
objj_msgSend(_resourceValues,"setObject:forKey:",_50,_51);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("URLWithString:"),function(_52,_53,_54){
with(_52){
return objj_msgSend(objj_msgSend(_52,"alloc"),"initWithString:",_54);
}
}),new objj_method(sel_getUid("URLWithString:relativeToURL:"),function(_55,_56,_57,_58){
with(_55){
return objj_msgSend(objj_msgSend(_55,"alloc"),"initWithString:relativeToURL:",_57,_58);
}
})]);
var _1=objj_getClass("CPURL");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPURL\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_59,_5a,_5b){
with(_59){
_base=objj_msgSend(_5b,"decodeObjectForKey:","CPURLBaseKey");
_relative=objj_msgSend(_5b,"decodeObjectForKey:","CPURLRelativeKey");
return _59;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5c,_5d,_5e){
with(_5c){
objj_msgSend(_5e,"encodeObject:forKey:",_base,"CPURLBaseKey");
objj_msgSend(_5e,"encodeObject:forKey:",_relative,"CPURLRelativeKey");
}
})]);
var _15=/^(?:([^:\/?\#]+):)?(?:\/\/([^\/?\#]*))?([^?\#]*)(?:\?([^\#]*))?(?:\#(.*))?/;
var _d=function(str){
if(!str){
str="";
}
var _60=str.match(_15);
this.scheme=_60[1]||null;
this.authority=_60[2]||null;
this.path=_60[3]||null;
this.query=_60[4]||null;
this.fragment=_60[5]||null;
};
_d.prototype.toString=function(){
var str="";
if(this.scheme){
str+=this.scheme+":";
}
if(this.authority){
str+="//"+this.authority;
}
if(this.path){
str+=this.path;
}
if(this.query){
str+="?"+this.query;
}
if(this.fragment){
str+="#"+this.fragment;
}
return str;
};
var _21=function(uri){
return new _d(uri);
};
var _63=function(str,_65){
return decodeURI(str).replace(/\+/g," ");
};
var _66=function(str,_68){
return decodeURIComponent(str).replace(/\+/g," ");
};
var _69=["url","protocol","authorityRoot","authority","userInfo","user","password","domain","domains","port","path","root","directory","directories","file","query","anchor"];
var _6a=["url","protocol","authorityRoot","authority","userInfo","user","password","domain","port","path","root","directory","file","query","anchor"];
var _6b=new RegExp("^"+"(?:"+"([^:/?#]+):"+")?"+"(?:"+"(//)"+"("+"(?:"+"("+"([^:@]*)"+":?"+"([^:@]*)"+")?"+"@"+")?"+"([^:/?#]*)"+"(?::(\\d*))?"+")"+")?"+"("+"(/?)"+"((?:[^?#/]*/)*)"+"([^?#]*)"+")"+"(?:\\?([^#]*))?"+"(?:#(.*))?");
var _6c=function(_6d){
return function(url){
if(typeof url=="undefined"){
throw new Error("HttpError: URL is undefined");
}
if(typeof url!="string"){
return new Object(url);
}
var _6f={};
var _70=_6d.exec(url);
for(var i=0;i<_70.length;i++){
_6f[_6a[i]]=_70[i]?_70[i]:"";
}
_6f.root=(_6f.root||_6f.authorityRoot)?"/":"";
_6f.directories=_6f.directory.split("/");
if(_6f.directories[_6f.directories.length-1]==""){
_6f.directories.pop();
}
var _72=[];
for(var i=0;i<_6f.directories.length;i++){
var _73=_6f.directories[i];
if(_73=="."){
}else{
if(_73==".."){
if(_72.length&&_72[_72.length-1]!=".."){
_72.pop();
}else{
_72.push("..");
}
}else{
_72.push(_73);
}
}
}
_6f.directories=_72;
_6f.domains=_6f.domain.split(".");
return _6f;
};
};
var _21=_6c(_6b);
var _46=function(_74){
if(typeof (_74)=="undefined"){
throw new Error("UrlError: URL undefined for urls#format");
}
if(_74 instanceof String||typeof (_74)=="string"){
return _74;
}
var _75=_74.domains?_74.domains.join("."):_74.domain;
var _76=(_74.user||_74.password)?((_74.user||"")+(_74.password?":"+_74.password:"")):_74.userInfo;
var _77=(_76||_75||_74.port)?((_76?_76+"@":"")+(_75||"")+(_74.port?":"+_74.port:"")):_74.authority;
var _78=_74.directories?_74.directories.join("/"):_74.directory;
var _79=_78||_74.file?((_78?_78+"/":"")+(_74.file||"")):_74.path;
return ((_74.protocol?_74.protocol+":":"")+(_77?"//"+_77:"")+(_74.root||(_77&&_79)?"/":"")+(_79?_79:"")+(_74.query?"?"+_74.query:"")+(_74.anchor?"#"+_74.anchor:""))||_74.url||"";
};
var _7a=function(_7b,_7c){
if(!_7b){
return _7c;
}
_7b=_21(_7b);
_7c=_21(_7c);
if(_7c.url==""){
return _7b;
}
delete _7b.url;
delete _7b.authority;
delete _7b.domain;
delete _7b.userInfo;
delete _7b.path;
delete _7b.directory;
if(_7c.protocol&&_7c.protocol!=_7b.protocol||_7c.authority&&_7c.authority!=_7b.authority){
_7b=_7c;
}else{
if(_7c.root){
_7b.directories=_7c.directories;
}else{
var _7d=_7c.directories;
for(var i=0;i<_7d.length;i++){
var _7f=_7d[i];
if(_7f=="."){
}else{
if(_7f==".."){
if(_7b.directories.length){
_7b.directories.pop();
}else{
_7b.directories.push("..");
}
}else{
_7b.directories.push(_7f);
}
}
}
if(_7c.file=="."){
_7c.file="";
}else{
if(_7c.file==".."){
_7b.directories.pop();
_7c.file="";
}
}
}
}
if(_7c.root){
_7b.root=_7c.root;
}
if(_7c.protcol){
_7b.protocol=_7c.protocol;
}
if(!(!_7c.path&&_7c.anchor)){
_7b.file=_7c.file;
}
_7b.query=_7c.query;
_7b.anchor=_7c.anchor;
return _7b;
};
var _80=function(_81,_82){
_82=_21(_82);
_81=_21(_81);
delete _82.url;
if(_82.protocol==_81.protocol&&_82.authority==_81.authority){
delete _82.protocol;
delete _82.authority;
delete _82.userInfo;
delete _82.user;
delete _82.password;
delete _82.domain;
delete _82.domains;
delete _82.port;
if(!!_82.root==!!_81.root&&!(_82.root&&_82.directories[0]!=_81.directories[0])){
delete _82.path;
delete _82.root;
delete _82.directory;
while(_81.directories.length&&_82.directories.length&&_82.directories[0]==_81.directories[0]){
_82.directories.shift();
_81.directories.shift();
}
while(_81.directories.length){
_81.directories.shift();
_82.directories.unshift("..");
}
if(!_82.root&&!_82.directories.length&&!_82.file&&_81.file){
_82.directories.push(".");
}
if(_81.file==_82.file){
delete _82.file;
}
if(_81.query==_82.query){
delete _82.query;
}
if(_81.anchor==_82.anchor){
delete _82.anchor;
}
}
}
return _82;
};
var _1b=function(_83,_84){
return _46(_7a(_83,_84));
};
var _85=function(_86,_87){
return _46(_80(_86,_87));
};
p;17;CPURLConnection.ji;10;CPObject.ji;11;CPRunLoop.ji;14;CPURLRequest.ji;15;CPURLResponse.jc;4598;
var _1=0,_2=1,_3=2,_4=3,_5=4;
var _6=nil;
var _7=objj_allocateClassPair(CPObject,"CPURLConnection"),_8=_7.isa;
class_addIvars(_7,[new objj_ivar("_request"),new objj_ivar("_delegate"),new objj_ivar("_isCanceled"),new objj_ivar("_isLocalFileConnection"),new objj_ivar("_XMLHTTPRequest")]);
objj_registerClassPair(_7);
objj_addClassForBundle(_7,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_7,[new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:"),function(_9,_a,_b,_c,_d){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"init");
if(_9){
_request=_b;
_delegate=_c;
_isCanceled=NO;
var _e=objj_msgSend(_request,"URL"),_f=objj_msgSend(_e,"scheme");
_isLocalFileConnection=_f==="file"||((_f!=="http"||_f!=="https:")&&window.location&&(window.location.protocol==="file:"||window.location.protocol==="app:"));
_XMLHTTPRequest=objj_request_xmlhttp();
if(_d){
objj_msgSend(_9,"start");
}
}
return _9;
}
}),new objj_method(sel_getUid("initWithRequest:delegate:"),function(_10,_11,_12,_13){
with(_10){
return objj_msgSend(_10,"initWithRequest:delegate:startImmediately:",_12,_13,YES);
}
}),new objj_method(sel_getUid("delegate"),function(_14,_15){
with(_14){
return _delegate;
}
}),new objj_method(sel_getUid("start"),function(_16,_17){
with(_16){
_isCanceled=NO;
try{
_XMLHTTPRequest.open(objj_msgSend(_request,"HTTPMethod"),objj_msgSend(objj_msgSend(_request,"URL"),"absoluteString"),YES);
_XMLHTTPRequest.onreadystatechange=function(){
objj_msgSend(_16,"_readyStateDidChange");
};
var _18=objj_msgSend(_request,"allHTTPHeaderFields"),key=nil,_1a=objj_msgSend(_18,"keyEnumerator");
while(key=objj_msgSend(_1a,"nextObject")){
_XMLHTTPRequest.setRequestHeader(key,objj_msgSend(_18,"objectForKey:",key));
}
_XMLHTTPRequest.send(objj_msgSend(_request,"HTTPBody"));
}
catch(anException){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didFailWithError:"))){
objj_msgSend(_delegate,"connection:didFailWithError:",_16,anException);
}
}
}
}),new objj_method(sel_getUid("cancel"),function(_1b,_1c){
with(_1b){
_isCanceled=YES;
try{
_XMLHTTPRequest.abort();
}
catch(anException){
}
}
}),new objj_method(sel_getUid("isLocalFileConnection"),function(_1d,_1e){
with(_1d){
return _isLocalFileConnection;
}
}),new objj_method(sel_getUid("_readyStateDidChange"),function(_1f,_20){
with(_1f){
if(_XMLHTTPRequest.readyState==_5){
var _21=_XMLHTTPRequest.status,URL=objj_msgSend(_request,"URL");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveResponse:"))){
if(_isLocalFileConnection){
objj_msgSend(_delegate,"connection:didReceiveResponse:",_1f,objj_msgSend(objj_msgSend(CPURLResponse,"alloc"),"initWithURL:",URL));
}else{
var _23=objj_msgSend(objj_msgSend(CPHTTPURLResponse,"alloc"),"initWithURL:",URL);
objj_msgSend(_23,"_setStatusCode:",_21);
objj_msgSend(_delegate,"connection:didReceiveResponse:",_1f,_23);
}
}
if(!_isCanceled){
if(_21==401&&objj_msgSend(_6,"respondsToSelector:",sel_getUid("connectionDidReceiveAuthenticationChallenge:"))){
objj_msgSend(_6,"connectionDidReceiveAuthenticationChallenge:",_1f);
}else{
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveData:"))){
objj_msgSend(_delegate,"connection:didReceiveData:",_1f,_XMLHTTPRequest.responseText);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connectionDidFinishLoading:"))){
objj_msgSend(_delegate,"connectionDidFinishLoading:",_1f);
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_XMLHTTPRequest"),function(_24,_25){
with(_24){
return _XMLHTTPRequest;
}
})]);
class_addMethods(_8,[new objj_method(sel_getUid("setClassDelegate:"),function(_26,_27,_28){
with(_26){
_6=_28;
}
}),new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:error:"),function(_29,_2a,_2b,_2c,_2d){
with(_29){
try{
var _2e=objj_request_xmlhttp();
_2e.open(objj_msgSend(_2b,"HTTPMethod"),objj_msgSend(objj_msgSend(_2b,"URL"),"absoluteString"),NO);
var _2f=objj_msgSend(_2b,"allHTTPHeaderFields"),key=nil,_31=objj_msgSend(_2f,"keyEnumerator");
while(key=objj_msgSend(_31,"nextObject")){
_2e.setRequestHeader(key,objj_msgSend(_2f,"objectForKey:",key));
}
_2e.send(objj_msgSend(_2b,"HTTPBody"));
return objj_msgSend(CPData,"dataWithString:",_2e.responseText);
}
catch(anException){
}
return nil;
}
}),new objj_method(sel_getUid("connectionWithRequest:delegate:"),function(_32,_33,_34,_35){
with(_32){
return objj_msgSend(objj_msgSend(_32,"alloc"),"initWithRequest:delegate:",_34,_35);
}
})]);
p;14;CPURLRequest.ji;10;CPObject.jc;2151;
var _1=objj_allocateClassPair(CPObject,"CPURLRequest"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_URL"),new objj_ivar("_HTTPBody"),new objj_ivar("_HTTPMethod"),new objj_ivar("_HTTPHeaderFields")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithURL:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
if(objj_msgSend(_5,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_URL=objj_msgSend(CPURL,"URLWithString:",_5);
}else{
_URL=_5;
}
_HTTPBody="";
_HTTPMethod="GET";
_HTTPHeaderFields=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_3,"setValue:forHTTPHeaderField:","Thu, 1 Jan 1970 00:00:00 GMT","If-Modified-Since");
objj_msgSend(_3,"setValue:forHTTPHeaderField:","no-cache","Cache-Control");
objj_msgSend(_3,"setValue:forHTTPHeaderField:","XMLHttpRequest","X-Requested-With");
}
return _3;
}
}),new objj_method(sel_getUid("URL"),function(_6,_7){
with(_6){
return _URL;
}
}),new objj_method(sel_getUid("setURL:"),function(_8,_9,_a){
with(_8){
_URL=_a;
}
}),new objj_method(sel_getUid("setHTTPBody:"),function(_b,_c,_d){
with(_b){
_HTTPBody=_d;
}
}),new objj_method(sel_getUid("HTTPBody"),function(_e,_f){
with(_e){
return _HTTPBody;
}
}),new objj_method(sel_getUid("setHTTPMethod:"),function(_10,_11,_12){
with(_10){
_HTTPMethod=_12;
}
}),new objj_method(sel_getUid("HTTPMethod"),function(_13,_14){
with(_13){
return _HTTPMethod;
}
}),new objj_method(sel_getUid("allHTTPHeaderFields"),function(_15,_16){
with(_15){
return _HTTPHeaderFields;
}
}),new objj_method(sel_getUid("valueForHTTPHeaderField:"),function(_17,_18,_19){
with(_17){
return objj_msgSend(_HTTPHeaderFields,"objectForKey:",_19);
}
}),new objj_method(sel_getUid("setValue:forHTTPHeaderField:"),function(_1a,_1b,_1c,_1d){
with(_1a){
objj_msgSend(_HTTPHeaderFields,"setObject:forKey:",_1c,_1d);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("requestWithURL:"),function(_1e,_1f,_20){
with(_1e){
return objj_msgSend(objj_msgSend(CPURLRequest,"alloc"),"initWithURL:",_20);
}
})]);
p;15;CPURLResponse.ji;10;CPObject.jc;956;
var _1=objj_allocateClassPair(CPObject,"CPURLResponse"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_URL")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithURL:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_URL=_5;
}
return _3;
}
}),new objj_method(sel_getUid("URL"),function(_6,_7){
with(_6){
return _URL;
}
})]);
var _1=objj_allocateClassPair(CPURLResponse,"CPHTTPURLResponse"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_statusCode")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("_setStatusCode:"),function(_8,_9,_a){
with(_8){
_statusCode=_a;
}
}),new objj_method(sel_getUid("statusCode"),function(_b,_c){
with(_b){
return _statusCode;
}
})]);
p;22;CPUserSessionManager.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;1844;
CPUserSessionUndeterminedStatus=0;
CPUserSessionLoggedInStatus=1;
CPUserSessionLoggedOutStatus=2;
CPUserSessionManagerStatusDidChangeNotification="CPUserSessionManagerStatusDidChangeNotification";
CPUserSessionManagerUserIdentifierDidChangeNotification="CPUserSessionManagerUserIdentifierDidChangeNotification";
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPUserSessionManager"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_status"),new objj_ivar("_userIdentifier")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_status=CPUserSessionUndeterminedStatus;
}
return _4;
}
}),new objj_method(sel_getUid("status"),function(_6,_7){
with(_6){
return _status;
}
}),new objj_method(sel_getUid("setStatus:"),function(_8,_9,_a){
with(_8){
if(_status==_a){
return;
}
_status=_a;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPUserSessionManagerStatusDidChangeNotification,_8);
if(_status!=CPUserSessionLoggedInStatus){
objj_msgSend(_8,"setUserIdentifier:",nil);
}
}
}),new objj_method(sel_getUid("userIdentifier"),function(_b,_c){
with(_b){
return _userIdentifier;
}
}),new objj_method(sel_getUid("setUserIdentifier:"),function(_d,_e,_f){
with(_d){
if(_userIdentifier==_f){
return;
}
_userIdentifier=_f;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPUserSessionManagerUserIdentifierDidChangeNotification,_d);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("defaultManager"),function(_10,_11){
with(_10){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPUserSessionManager,"alloc"),"init");
}
return _1;
}
})]);
p;9;CPValue.ji;10;CPObject.ji;9;CPCoder.jc;1673;
var _1=objj_allocateClassPair(CPObject,"CPValue"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_JSObject")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithJSObject:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_JSObject=_5;
}
return _3;
}
}),new objj_method(sel_getUid("JSObject"),function(_6,_7){
with(_6){
return _JSObject;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("valueWithJSObject:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(objj_msgSend(_8,"alloc"),"initWithJSObject:",_a);
}
})]);
var _b="CPValueValueKey";
var _1=objj_getClass("CPValue");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPValue\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPObject")},"init");
if(_c){
_JSObject=JSON.parse(objj_msgSend(_e,"decodeObjectForKey:",_b));
}
return _c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_11,"encodeObject:forKey:",JSON.stringify(_JSObject),_b);
}
})]);
CPJSObjectCreateJSON=function(_12){
CPLog.warn("CPJSObjectCreateJSON deprecated, use JSON.stringify() or CPString's objectFromJSON");
return JSON.stringify(_12);
};
CPJSObjectCreateWithJSON=function(_13){
CPLog.warn("CPJSObjectCreateWithJSON deprecated, use JSON.parse() or CPString's JSONFromObject");
return JSON.parse(_13);
};
p;17;CPWebDAVManager.jc;4361;
var _1=function(_2,_3,_4){
var _5=objj_msgSend(_4,"objectForKey:","resourcetype");
if(_5===CPWebDAVManagerCollectionResourceType){
objj_msgSend(_2,"setResourceValue:forKey:",YES,CPURLIsDirectoryKey);
objj_msgSend(_2,"setResourceValue:forKey:",NO,CPURLIsRegularFileKey);
}else{
if(_5===CPWebDAVManagerNonCollectionResourceType){
objj_msgSend(_2,"setResourceValue:forKey:",NO,CPURLIsDirectoryKey);
objj_msgSend(_2,"setResourceValue:forKey:",YES,CPURLIsRegularFileKey);
}
}
var _6=objj_msgSend(_4,"objectForKey:","displayname");
if(_6!==nil){
objj_msgSend(_2,"setResourceValue:forKey:",_6,CPURLNameKey);
objj_msgSend(_2,"setResourceValue:forKey:",_6,CPURLLocalizedNameKey);
}
};
CPWebDAVManagerCollectionResourceType=1;
CPWebDAVManagerNonCollectionResourceType=0;
var _7=objj_allocateClassPair(CPObject,"CPWebDAVManager"),_8=_7.isa;
class_addIvars(_7,[new objj_ivar("_blocksForConnections")]);
objj_registerClassPair(_7);
objj_addClassForBundle(_7,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_7,[new objj_method(sel_getUid("init"),function(_9,_a){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"init");
if(_9){
_blocksForConnections=objj_msgSend(CPDictionary,"dictionary");
}
return _9;
}
}),new objj_method(sel_getUid("contentsOfDirectoryAtURL:includingPropertiesForKeys:options:block:"),function(_b,_c,_d,_e,_f,_10){
with(_b){
var _11=[],_12=objj_msgSend(_e,"count");
while(_12--){
_11.push(_13[_e[_12]]);
}
var _14=function(_15,_16){
var _17=[],_18=nil,_19=objj_msgSend(_16,"keyEnumerator");
while(_18=objj_msgSend(_19,"nextObject")){
var URL=objj_msgSend(CPURL,"URLWithString:",_18),_11=objj_msgSend(_16,"objectForKey:",_18);
if(!objj_msgSend(objj_msgSend(URL,"absoluteString"),"isEqual:",objj_msgSend(_15,"absoluteString"))){
_17.push(URL);
_1(URL,_e,_11);
}
}
return _17;
};
if(!_10){
return _14(_d,response);
}
objj_msgSend(_b,"PROPFIND:properties:depth:block:",_d,_11,1,function(_1b,_1c){
_10(_1b,_14(_1b,_1c));
});
}
}),new objj_method(sel_getUid("PROPFIND:properties:depth:block:"),function(_1d,_1e,_1f,_20,_21,_22){
with(_1d){
var _23=objj_msgSend(CPURLRequest,"requestWithURL:",_1f);
objj_msgSend(_23,"setHTTPMethod:","PROPFIND");
objj_msgSend(_23,"setValue:forHTTPHeaderField:",_21,"Depth");
var _24=["<?xml version=\"1.0\"?><a:propfind xmlns:a=\"DAV:\">"],_25=0,_26=_20.length;
for(;_25<_26;++_25){
_24.push("<a:prop><a:",_20[_25],"/></a:prop>");
}
_24.push("</a:propfind>");
objj_msgSend(_23,"setHTTPBody:",_24.join(""));
if(!_22){
return _27(objj_msgSend(objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:error:",_23,nil,nil),"string"));
}else{
var _28=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_23,_1d);
objj_msgSend(_blocksForConnections,"setObject:forKey:",_22,objj_msgSend(_28,"UID"));
}
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_29,_2a,_2b,_2c){
with(_29){
var _2d=objj_msgSend(_blocksForConnections,"objectForKey:",objj_msgSend(_2b,"UID"));
_2d(objj_msgSend(_2b._request,"URL"),_27(_2c));
}
})]);
var _13={};
_13[CPURLNameKey]="displayname";
_13[CPURLLocalizedNameKey]="displayname";
_13[CPURLIsRegularFileKey]="resourcetype";
_13[CPURLIsDirectoryKey]="resourcetype";
var _2e=function(_2f){
if(typeof window["ActiveXObject"]!=="undefined"){
var _30=new ActiveXObject("Microsoft.XMLDOM");
_30.async=false;
_30.loadXML(_2f);
return _30;
}
return new DOMParser().parseFromString(_2f,"text/xml");
};
var _27=function(_31){
var _32=_2e(_31),_33=_32.getElementsByTagNameNS("*","response"),_34=0,_35=_33.length;
var _36=objj_msgSend(CPDictionary,"dictionary");
for(;_34<_35;++_34){
var _37=_33[_34],_38=_37.getElementsByTagNameNS("*","prop").item(0).childNodes,_39=0,_3a=_38.length,_3b=objj_msgSend(CPDictionary,"dictionary");
for(;_39<_3a;++_39){
var _3c=_38[_39];
if(_3c.nodeType===8||_3c.nodeType===3){
continue;
}
var _3d=_3c.nodeName,_3e=_3d.lastIndexOf(":");
if(_3e>-1){
_3d=_3d.substr(_3e+1);
}
if(_3d==="resourcetype"){
objj_msgSend(_3b,"setObject:forKey:",_3c.firstChild?CPWebDAVManagerCollectionResourceType:CPWebDAVManagerNonCollectionResourceType,_3d);
}else{
objj_msgSend(_3b,"setObject:forKey:",_3c.firstChild.nodeValue,_3d);
}
}
var _3f=_37.getElementsByTagNameNS("*","href").item(0);
objj_msgSend(_36,"setObject:forKey:",_3b,_3f.firstChild.nodeValue);
}
return _36;
};
var _40=function(_41,_42){
};
p;12;Foundation.ji;9;CPArray.ji;10;CPBundle.ji;9;CPCoder.ji;8;CPData.ji;8;CPDate.ji;14;CPDictionary.ji;14;CPEnumerator.ji;13;CPException.ji;12;CPIndexSet.ji;14;CPInvocation.ji;19;CPJSONPConnection.ji;17;CPKeyedArchiver.ji;19;CPKeyedUnarchiver.ji;18;CPKeyValueCoding.ji;21;CPKeyValueObserving.ji;7;CPLog.ji;16;CPNotification.ji;22;CPNotificationCenter.ji;8;CPNull.ji;10;CPNumber.ji;10;CPObject.ji;15;CPObjJRuntime.ji;29;CPPropertyListSerialization.ji;9;CPRange.ji;11;CPRunLoop.ji;7;CPSet.ji;18;CPSortDescriptor.ji;10;CPString.ji;9;CPTimer.ji;15;CPUndoManager.ji;7;CPURL.ji;17;CPURLConnection.ji;14;CPURLRequest.ji;15;CPURLResponse.ji;22;CPUserSessionManager.ji;9;CPValue.j