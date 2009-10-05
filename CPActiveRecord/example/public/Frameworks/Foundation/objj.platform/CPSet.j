i;10;CPObject.ji;9;CPArray.ji;10;CPNumber.ji;14;CPEnumerator.jc;7834;
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
