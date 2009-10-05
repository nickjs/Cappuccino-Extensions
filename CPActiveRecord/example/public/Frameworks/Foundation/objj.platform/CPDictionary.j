i;10;CPObject.ji;14;CPEnumerator.ji;13;CPException.jc;7057;
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
