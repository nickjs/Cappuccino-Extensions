i;8;CPNull.ji;9;CPCoder.jc;8707;
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
