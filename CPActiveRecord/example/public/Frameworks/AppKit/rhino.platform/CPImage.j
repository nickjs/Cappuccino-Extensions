I;21;Foundation/CPBundle.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;21;Foundation/CPString.ji;12;CPGeometry.jc;8936;
CPImageLoadStatusInitialized=0;
CPImageLoadStatusLoading=1;
CPImageLoadStatusCompleted=2;
CPImageLoadStatusCancelled=3;
CPImageLoadStatusInvalidData=4;
CPImageLoadStatusUnexpectedEOF=5;
CPImageLoadStatusReadError=6;
CPImageDidLoadNotification="CPImageDidLoadNotification";
CPImageInBundle=function(_1,_2,_3){
if(!_3){
_3=objj_msgSend(CPBundle,"mainBundle");
}
if(_2){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3,"pathForResource:",_1),_2);
}
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_3,"pathForResource:",_1));
};
var _4=objj_getClass("CPBundle");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPBundle\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("pathForResource:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"resourcePath")+"/"+_8;
}
})]);
var _4=objj_allocateClassPair(CPObject,"CPImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_size"),new objj_ivar("_filename"),new objj_ivar("_delegate"),new objj_ivar("_loadStatus"),new objj_ivar("_image")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initByReferencingFile:size:"),function(_9,_a,_b,_c){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"init");
if(_9){
_size=CPSizeCreateCopy(_c);
_filename=_b;
_loadStatus=CPImageLoadStatusInitialized;
}
return _9;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:size:"),function(_d,_e,_f,_10){
with(_d){
_d=objj_msgSend(_d,"initByReferencingFile:size:",_f,_10);
if(_d){
objj_msgSend(_d,"load");
}
return _d;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:"),function(_11,_12,_13){
with(_11){
_11=objj_msgSend(_11,"initByReferencingFile:size:",_13,CGSizeMake(-1,-1));
if(_11){
objj_msgSend(_11,"load");
}
return _11;
}
}),new objj_method(sel_getUid("filename"),function(_14,_15){
with(_14){
return _filename;
}
}),new objj_method(sel_getUid("setSize:"),function(_16,_17,_18){
with(_16){
_size=CGSizeMakeCopy(_18);
}
}),new objj_method(sel_getUid("size"),function(_19,_1a){
with(_19){
return _size;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_1b,_1c,_1d){
with(_1b){
_delegate=_1d;
}
}),new objj_method(sel_getUid("delegate"),function(_1e,_1f){
with(_1e){
return _delegate;
}
}),new objj_method(sel_getUid("loadStatus"),function(_20,_21){
with(_20){
return _loadStatus;
}
}),new objj_method(sel_getUid("load"),function(_22,_23){
with(_22){
if(_loadStatus==CPImageLoadStatusLoading||_loadStatus==CPImageLoadStatusCompleted){
return;
}
_loadStatus=CPImageLoadStatusLoading;
_image=new Image();
var _24=YES;
_image.onload=function(){
if(_24){
window.setTimeout(function(){
objj_msgSend(_22,"_imageDidLoad");
},0);
}else{
objj_msgSend(_22,"_imageDidLoad");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_22,"_derefFromImage");
};
_image.onerror=function(){
if(_24){
window.setTimeout(function(){
objj_msgSend(_22,"_imageDidError");
},0);
}else{
objj_msgSend(_22,"_imageDidError");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_22,"_derefFromImage");
};
_image.onabort=function(){
if(_24){
window.setTimeout(function(){
objj_msgSend(_22,"_imageDidAbort");
},0);
}else{
objj_msgSend(_22,"_imageDidAbort");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_22,"_derefFromImage");
};
_image.src=_filename;
_24=NO;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_25,_26){
with(_25){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_27,_28){
with(_27){
return NO;
}
}),new objj_method(sel_getUid("_derefFromImage"),function(_29,_2a){
with(_29){
_image.onload=null;
_image.onerror=null;
_image.onabort=null;
}
}),new objj_method(sel_getUid("_imageDidLoad"),function(_2b,_2c){
with(_2b){
_loadStatus=CPImageLoadStatusCompleted;
if(!_size||(_size.width==-1&&_size.height==-1)){
_size=CGSizeMake(_image.width,_image.height);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPImageDidLoadNotification,_2b);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidLoad:"))){
objj_msgSend(_delegate,"imageDidLoad:",_2b);
}
}
}),new objj_method(sel_getUid("_imageDidError"),function(_2d,_2e){
with(_2d){
_loadStatus=CPImageLoadStatusReadError;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidError:"))){
objj_msgSend(_delegate,"imageDidError:",_2d);
}
}
}),new objj_method(sel_getUid("_imageDidAbort"),function(_2f,_30){
with(_2f){
_loadStatus=CPImageLoadStatusCancelled;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidAbort:"))){
objj_msgSend(_delegate,"imageDidAbort:",_2f);
}
}
})]);
var _4=objj_getClass("CPImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_31,_32,_33){
with(_31){
return objj_msgSend(_31,"initWithContentsOfFile:size:",objj_msgSend(_33,"decodeObjectForKey:","CPFilename"),objj_msgSend(_33,"decodeSizeForKey:","CPSize"));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_36,"encodeObject:forKey:",_filename,"CPFilename");
objj_msgSend(_36,"encodeSize:forKey:",_size,"CPSize");
}
})]);
var _4=objj_allocateClassPair(CPObject,"CPThreePartImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_imageSlices"),new objj_ivar("_isVertical")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithImageSlices:isVertical:"),function(_37,_38,_39,_3a){
with(_37){
_37=objj_msgSendSuper({receiver:_37,super_class:objj_getClass("CPObject")},"init");
if(_37){
_imageSlices=_39;
_isVertical=_3a;
}
return _37;
}
}),new objj_method(sel_getUid("filename"),function(_3b,_3c){
with(_3b){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_3d,_3e){
with(_3d){
return _imageSlices;
}
}),new objj_method(sel_getUid("isVertical"),function(_3f,_40){
with(_3f){
return _isVertical;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_41,_42){
with(_41){
return YES;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_43,_44){
with(_43){
return NO;
}
})]);
var _45="CPThreePartImageImageSlicesKey",_46="CPThreePartImageIsVerticalKey";
var _4=objj_getClass("CPThreePartImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPThreePartImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_47,_48,_49){
with(_47){
_47=objj_msgSendSuper({receiver:_47,super_class:objj_getClass("CPObject")},"init");
if(_47){
_imageSlices=objj_msgSend(_49,"decodeObjectForKey:",_45);
_isVertical=objj_msgSend(_49,"decodeBoolForKey:",_46);
}
return _47;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSend(_4c,"encodeObject:forKey:",_imageSlices,_45);
objj_msgSend(_4c,"encodeBool:forKey:",_isVertical,_46);
}
})]);
var _4=objj_allocateClassPair(CPObject,"CPNinePartImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_imageSlices")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithImageSlices:"),function(_4d,_4e,_4f){
with(_4d){
_4d=objj_msgSendSuper({receiver:_4d,super_class:objj_getClass("CPObject")},"init");
if(_4d){
_imageSlices=_4f;
}
return _4d;
}
}),new objj_method(sel_getUid("filename"),function(_50,_51){
with(_50){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_52,_53){
with(_52){
return _imageSlices;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_54,_55){
with(_54){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_56,_57){
with(_56){
return YES;
}
})]);
var _58="CPNinePartImageImageSlicesKey";
var _4=objj_getClass("CPNinePartImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPNinePartImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_59,_5a,_5b){
with(_59){
_59=objj_msgSendSuper({receiver:_59,super_class:objj_getClass("CPObject")},"init");
if(_59){
_imageSlices=objj_msgSend(_5b,"decodeObjectForKey:",_58);
}
return _59;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5c,_5d,_5e){
with(_5c){
objj_msgSend(_5e,"encodeObject:forKey:",_imageSlices,_58);
}
})]);
