I;21;Foundation/CPString.ji;18;CPPlatformString.jc;601;
var _1=objj_getClass("CPString");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("cssString"),function(_3,_4){
with(_3){
return _3;
}
}),new objj_method(sel_getUid("sizeWithFont:"),function(_5,_6,_7){
with(_5){
return objj_msgSend(_5,"sizeWithFont:inWidth:",_7,NULL);
}
}),new objj_method(sel_getUid("sizeWithFont:inWidth:"),function(_8,_9,_a,_b){
with(_8){
return objj_msgSend(CPPlatformString,"sizeOfString:withFont:forWidth:",_8,_a,_b);
}
})]);
