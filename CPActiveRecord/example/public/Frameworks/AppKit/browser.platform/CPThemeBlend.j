I;21;Foundation/CPObject.jI;16;AppKit/CPTheme.jI;29;AppKit/_CPCibCustomResource.jI;30;AppKit/_CPCibKeyedUnarchiver.jc;1452;
var _1=objj_allocateClassPair(CPObject,"CPThemeBlend"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_bundle"),new objj_ivar("_themes"),new objj_ivar("_loadDelegate")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("themes"),function(_3,_4){
with(_3){
return _themes;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_bundle=objj_msgSend(objj_msgSend(CPBundle,"alloc"),"initWithPath:",_7+"/Info.plist");
}
return _5;
}
}),new objj_method(sel_getUid("loadWithDelegate:"),function(_8,_9,_a){
with(_8){
_loadDelegate=_a;
objj_msgSend(_bundle,"loadWithDelegate:",_8);
}
}),new objj_method(sel_getUid("bundleDidFinishLoading:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_bundle,"objectForInfoDictionaryKey:","CPBundleReplacedFiles"),_f=0,_10=_e.length,_11=objj_msgSend(_bundle,"bundlePath");
while(_10--){
var _12=_e[_10];
if(objj_msgSend(_12,"pathExtension")==="keyedtheme"){
var _13=objj_msgSend(objj_msgSend(_CPThemeKeyedUnarchiver,"alloc"),"initForReadingWithData:bundle:",objj_msgSend(CPData,"dataWithString:",objj_files[_11+"/"+_12].contents),_bundle);
objj_msgSend(_13,"decodeObjectForKey:","root");
objj_msgSend(_13,"finishDecoding");
}
}
objj_msgSend(_loadDelegate,"blendDidFinishLoading:",_b);
}
})]);
