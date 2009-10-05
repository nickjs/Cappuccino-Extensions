i;10;CPObject.ji;14;CPDictionary.ji;14;CPURLRequest.jc;3694;
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
