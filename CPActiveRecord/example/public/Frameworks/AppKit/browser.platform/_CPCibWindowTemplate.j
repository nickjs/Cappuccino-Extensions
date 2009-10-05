I;21;Foundation/CPObject.jc;3880;
var _1="_CPCibWindowTemplateMinSizeKey",_2="_CPCibWindowTemplateMaxSizeKey",_3="_CPCibWindowTemplateViewClassKey",_4="_CPCibWindowTemplateWindowClassKey",_5="_CPCibWindowTemplateWindowRectKey",_6="_CPCibWindowTempatStyleMaskKey",_7="_CPCibWindowTemplateWindowTitleKey",_8="_CPCibWindowTemplateWindowViewKey",_9="_CPCibWindowTemplateWindowIsFullBridgeKey";
var _a=objj_allocateClassPair(CPObject,"_CPCibWindowTemplate"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_viewClass"),new objj_ivar("_windowClass"),new objj_ivar("_windowRect"),new objj_ivar("_windowStyleMask"),new objj_ivar("_windowTitle"),new objj_ivar("_windowView"),new objj_ivar("_windowIsFullBridge")]);
objj_registerClassPair(_a);
objj_addClassForBundle(_a,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_a,[new objj_method(sel_getUid("init"),function(_c,_d){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPObject")},"init");
if(_c){
_windowClass="CPWindow";
_windowRect=CGRectMake(0,0,400,200);
_windowStyleMask=CPTitledWindowMask|CPClosableWindowMask|CPMiniaturizableWindowMask|CPResizableWindowMask;
_windowTitle="Window";
_windowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,400,200));
_windowIsFullBridge=NO;
}
return _c;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPObject")},"init");
if(_e){
if(objj_msgSend(_10,"containsValueForKey:",_1)){
_minSize=objj_msgSend(_10,"decodeSizeForKey:",_1);
}
if(objj_msgSend(_10,"containsValueForKey:",_2)){
_maxSize=objj_msgSend(_10,"decodeSizeForKey:",_2);
}
_viewClass=objj_msgSend(_10,"decodeObjectForKey:",_3);
_windowClass=objj_msgSend(_10,"decodeObjectForKey:",_4);
_windowRect=objj_msgSend(_10,"decodeRectForKey:",_5);
_windowStyleMask=objj_msgSend(_10,"decodeIntForKey:",_6);
_windowTitle=objj_msgSend(_10,"decodeObjectForKey:",_7);
_windowView=objj_msgSend(_10,"decodeObjectForKey:",_8);
_windowIsFullBridge=objj_msgSend(_10,"decodeObjectForKey:",_9);
}
return _e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_11,_12,_13){
with(_11){
if(_minSize){
objj_msgSend(_13,"encodeSize:forKey:",_minSize,_1);
}
if(_maxSize){
objj_msgSend(_13,"encodeSize:forKey:",_maxSize,_2);
}
objj_msgSend(_13,"encodeObject:forKey:",_viewClass,_3);
objj_msgSend(_13,"encodeObject:forKey:",_windowClass,_4);
objj_msgSend(_13,"encodeRect:forKey:",_windowRect,_5);
objj_msgSend(_13,"encodeInt:forKey:",_windowStyleMask,_6);
objj_msgSend(_13,"encodeObject:forKey:",_windowTitle,_7);
objj_msgSend(_13,"encodeObject:forKey:",_windowView,_8);
objj_msgSend(_13,"encodeObject:forKey:",_windowIsFullBridge,_9);
}
}),new objj_method(sel_getUid("customClassName"),function(_14,_15){
with(_14){
return _windowClass;
}
}),new objj_method(sel_getUid("setCustomClassName:"),function(_16,_17,_18){
with(_16){
_windowClass=_18;
}
}),new objj_method(sel_getUid("windowClass"),function(_19,_1a){
with(_19){
return _windowClass;
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_1b,_1c){
with(_1b){
var _1d=CPClassFromString(objj_msgSend(_1b,"windowClass"));
var _1e=objj_msgSend(objj_msgSend(_1d,"alloc"),"initWithContentRect:styleMask:",_windowRect,_windowStyleMask);
if(_minSize){
objj_msgSend(_1e,"setMinSize:",_minSize);
}
if(_maxSize){
objj_msgSend(_1e,"setMaxSize:",_maxSize);
}
objj_msgSend(_1e,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_1e,"setTitle:",_windowTitle);
objj_msgSend(_windowView,"setAutoresizesSubviews:",NO);
objj_msgSend(_1e,"setContentView:",_windowView);
objj_msgSend(_windowView,"setAutoresizesSubviews:",YES);
if(objj_msgSend(_viewClass,"isKindOfClass:",objj_msgSend(CPToolbar,"class"))){
objj_msgSend(_1e,"setToolbar:",_viewClass);
}
objj_msgSend(_1e,"setFullBridge:",_windowIsFullBridge);
return _1e;
}
})]);
