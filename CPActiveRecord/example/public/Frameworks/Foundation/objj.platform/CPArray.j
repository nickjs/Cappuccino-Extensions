i;10;CPObject.ji;9;CPRange.ji;14;CPEnumerator.ji;18;CPSortDescriptor.ji;13;CPException.jc;17781;
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
