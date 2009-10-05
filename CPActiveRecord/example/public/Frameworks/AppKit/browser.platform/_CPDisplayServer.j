c;1205;
var _1=[],_2={},_3=[],_4={},_5=objj_msgSend(CPRunLoop,"mainRunLoop");
_CPDisplayServerAddDisplayObject=function(_6){
var _7=objj_msgSend(_6,"UID");
if(typeof _2[_7]!=="undefined"){
return;
}
var _8=_1.length;
_2[_7]=_8;
_1[_8]=_6;
};
_CPDisplayServerAddLayoutObject=function(_9){
var _a=objj_msgSend(_9,"UID");
if(typeof _4[_a]!=="undefined"){
return;
}
var _b=_3.length;
_4[_a]=_b;
_3[_b]=_9;
};
var _c=objj_allocateClassPair(CPObject,"_CPDisplayServer"),_d=_c.isa;
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_d,[new objj_method(sel_getUid("run"),function(_e,_f){
with(_e){
while(_3.length||_1.length){
var _10=0;
for(;_10<_3.length;++_10){
var _11=_3[_10];
delete _4[objj_msgSend(_11,"UID")];
objj_msgSend(_11,"layoutIfNeeded");
}
_3=[];
_4={};
_10=0;
for(;_10<_1.length;++_10){
if(_3.length){
break;
}
var _11=_1[_10];
delete _2[objj_msgSend(_11,"UID")];
objj_msgSend(_11,"displayIfNeeded");
}
if(_10===_1.length){
_1=[];
_2={};
}else{
_1=_1.splice(0,_10);
}
}
objj_msgSend(_5,"performSelector:target:argument:order:modes:",sel_getUid("run"),_e,nil,0,[CPDefaultRunLoopMode]);
}
})]);
objj_msgSend(_CPDisplayServer,"run");
