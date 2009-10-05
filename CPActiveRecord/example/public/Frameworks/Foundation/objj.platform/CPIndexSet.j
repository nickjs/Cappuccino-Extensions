i;9;CPRange.ji;10;CPObject.jc;11807;
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
