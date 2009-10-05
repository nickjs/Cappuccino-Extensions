i;8;CPData.ji;9;CPCoder.ji;9;CPArray.ji;10;CPString.ji;10;CPNumber.ji;14;CPDictionary.ji;9;CPValue.jc;10096;
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
