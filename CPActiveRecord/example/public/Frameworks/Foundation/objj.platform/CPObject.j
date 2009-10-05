c;6574;
var _1=objj_allocateClassPair(Nil,"CPObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("isa")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return _3;
}
}),new objj_method(sel_getUid("copy"),function(_5,_6){
with(_5){
return _5;
}
}),new objj_method(sel_getUid("mutableCopy"),function(_7,_8){
with(_7){
return objj_msgSend(_7,"copy");
}
}),new objj_method(sel_getUid("dealloc"),function(_9,_a){
with(_9){
}
}),new objj_method(sel_getUid("class"),function(_b,_c){
with(_b){
return isa;
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_d,_e,_f){
with(_d){
return objj_msgSend(isa,"isSubclassOfClass:",_f);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_10,_11,_12){
with(_10){
return _10.isa===_12;
}
}),new objj_method(sel_getUid("isProxy"),function(_13,_14){
with(_13){
return NO;
}
}),new objj_method(sel_getUid("respondsToSelector:"),function(_15,_16,_17){
with(_15){
return !!class_getInstanceMethod(isa,_17);
}
}),new objj_method(sel_getUid("methodForSelector:"),function(_18,_19,_1a){
with(_18){
return class_getMethodImplementation(isa,_1a);
}
}),new objj_method(sel_getUid("methodSignatureForSelector:"),function(_1b,_1c,_1d){
with(_1b){
return nil;
}
}),new objj_method(sel_getUid("description"),function(_1e,_1f){
with(_1e){
return "<"+isa.name+" 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_1e,"UID"))+">";
}
}),new objj_method(sel_getUid("performSelector:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_20,_22);
}
}),new objj_method(sel_getUid("performSelector:withObject:"),function(_23,_24,_25,_26){
with(_23){
return objj_msgSend(_23,_25,_26);
}
}),new objj_method(sel_getUid("performSelector:withObject:withObject:"),function(_27,_28,_29,_2a,_2b){
with(_27){
return objj_msgSend(_27,_29,_2a,_2b);
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(_2c,"doesNotRecognizeSelector:",objj_msgSend(_2e,"selector"));
}
}),new objj_method(sel_getUid("forward::"),function(_2f,_30,_31,_32){
with(_2f){
var _33=objj_msgSend(_2f,"methodSignatureForSelector:",_31);
if(_33){
invocation=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",_33);
objj_msgSend(invocation,"setTarget:",_2f);
objj_msgSend(invocation,"setSelector:",_31);
var _34=2,_35=_32.length;
for(;_34<_35;++_34){
objj_msgSend(invocation,"setArgument:atIndex:",_32[_34],_34);
}
objj_msgSend(_2f,"forwardInvocation:",invocation);
return objj_msgSend(invocation,"returnValue");
}
objj_msgSend(_2f,"doesNotRecognizeSelector:",_31);
}
}),new objj_method(sel_getUid("doesNotRecognizeSelector:"),function(_36,_37,_38){
with(_36){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,(class_isMetaClass(isa)?"+":"-")+" ["+objj_msgSend(_36,"className")+" "+_38+"] unrecognized selector sent to "+(class_isMetaClass(isa)?"class":"instance")+" 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_36,"UID")));
}
}),new objj_method(sel_getUid("awakeAfterUsingCoder:"),function(_39,_3a,_3b){
with(_39){
return _39;
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_3c,_3d){
with(_3c){
return objj_msgSend(_3c,"classForCoder");
}
}),new objj_method(sel_getUid("classForCoder"),function(_3e,_3f){
with(_3e){
return objj_msgSend(_3e,"class");
}
}),new objj_method(sel_getUid("replacementObjectForArchiver:"),function(_40,_41,_42){
with(_40){
return objj_msgSend(_40,"replacementObjectForCoder:",_42);
}
}),new objj_method(sel_getUid("replacementObjectForKeyedArchiver:"),function(_43,_44,_45){
with(_43){
return objj_msgSend(_43,"replacementObjectForCoder:",_45);
}
}),new objj_method(sel_getUid("replacementObjectForCoder:"),function(_46,_47,_48){
with(_46){
return _46;
}
}),new objj_method(sel_getUid("className"),function(_49,_4a){
with(_49){
return isa.name;
}
}),new objj_method(sel_getUid("autorelease"),function(_4b,_4c){
with(_4b){
return _4b;
}
}),new objj_method(sel_getUid("hash"),function(_4d,_4e){
with(_4d){
return objj_msgSend(_4d,"UID");
}
}),new objj_method(sel_getUid("UID"),function(_4f,_50){
with(_4f){
if(typeof _4f.__address==="undefined"){
_4f.__address=_objj_generateObjectHash();
}
return __address;
}
}),new objj_method(sel_getUid("isEqual:"),function(_51,_52,_53){
with(_51){
return _51===_53||objj_msgSend(_51,"UID")===objj_msgSend(_53,"UID");
}
}),new objj_method(sel_getUid("retain"),function(_54,_55){
with(_54){
return _54;
}
}),new objj_method(sel_getUid("release"),function(_56,_57){
with(_56){
}
}),new objj_method(sel_getUid("self"),function(_58,_59){
with(_58){
return _58;
}
}),new objj_method(sel_getUid("superclass"),function(_5a,_5b){
with(_5a){
return isa.super_class;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("load"),function(_5c,_5d){
with(_5c){
}
}),new objj_method(sel_getUid("initialize"),function(_5e,_5f){
with(_5e){
}
}),new objj_method(sel_getUid("new"),function(_60,_61){
with(_60){
return objj_msgSend(objj_msgSend(_60,"alloc"),"init");
}
}),new objj_method(sel_getUid("alloc"),function(_62,_63){
with(_62){
return class_createInstance(_62);
}
}),new objj_method(sel_getUid("allocWithCoder:"),function(_64,_65,_66){
with(_64){
return objj_msgSend(_64,"alloc");
}
}),new objj_method(sel_getUid("class"),function(_67,_68){
with(_67){
return _67;
}
}),new objj_method(sel_getUid("superclass"),function(_69,_6a){
with(_69){
return super_class;
}
}),new objj_method(sel_getUid("isSubclassOfClass:"),function(_6b,_6c,_6d){
with(_6b){
var _6e=_6b;
for(;_6e;_6e=_6e.super_class){
if(_6e===_6d){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_6f,_70,_71){
with(_6f){
return objj_msgSend(_6f,"isSubclassOfClass:",_71);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_72,_73,_74){
with(_72){
return _72===_74;
}
}),new objj_method(sel_getUid("instancesRespondToSelector:"),function(_75,_76,_77){
with(_75){
return !!class_getInstanceMethod(_75,_77);
}
}),new objj_method(sel_getUid("instanceMethodForSelector:"),function(_78,_79,_7a){
with(_78){
return class_getMethodImplementation(_78,_7a);
}
}),new objj_method(sel_getUid("setVersion:"),function(_7b,_7c,_7d){
with(_7b){
version=_7d;
return _7b;
}
}),new objj_method(sel_getUid("version"),function(_7e,_7f){
with(_7e){
return version;
}
})]);
objj_object.prototype.toString=function(){
if(this.isa&&class_getInstanceMethod(this.isa,"description")!=NULL){
return objj_msgSend(this,"description");
}else{
return String(this)+" (-description not implemented)";
}
};
