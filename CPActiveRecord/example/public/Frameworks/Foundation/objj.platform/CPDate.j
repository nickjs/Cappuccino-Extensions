i;10;CPObject.ji;10;CPString.jc;3347;
var _1=new Date(Date.UTC(2001,1,1,0,0,0,0));
var _2=objj_allocateClassPair(CPObject,"CPDate"),_3=_2.isa;
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithTimeIntervalSinceNow:"),function(_4,_5,_6){
with(_4){
_4=new Date((new Date()).getTime()+_6*1000);
return _4;
}
}),new objj_method(sel_getUid("initWithTimeIntervalSince1970:"),function(_7,_8,_9){
with(_7){
_7=new Date(_9*1000);
return _7;
}
}),new objj_method(sel_getUid("initWithTimeIntervalSinceReferenceDate:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSend(_a,"initWithTimeInterval:sinceDate:",_c,_1);
return _a;
}
}),new objj_method(sel_getUid("initWithTimeInterval:sinceDate:"),function(_d,_e,_f,_10){
with(_d){
_d=new Date(_10.getTime()+_f*1000);
return _d;
}
}),new objj_method(sel_getUid("initWithString:"),function(_11,_12,_13){
with(_11){
_11=new Date(_13);
return _11;
}
}),new objj_method(sel_getUid("timeIntervalSinceDate:"),function(_14,_15,_16){
with(_14){
return (_14.getTime()-_16.getTime())/1000;
}
}),new objj_method(sel_getUid("timeIntervalSinceNow"),function(_17,_18){
with(_17){
return objj_msgSend(_17,"timeIntervalSinceDate:",objj_msgSend(CPDate,"date"));
}
}),new objj_method(sel_getUid("timeIntervalSince1970"),function(_19,_1a){
with(_19){
return _19.getTime()/1000;
}
}),new objj_method(sel_getUid("timeIntervalSinceReferenceDate"),function(_1b,_1c){
with(_1b){
return (_1b.getTime()-_1.getTime())/1000;
}
}),new objj_method(sel_getUid("isEqualToDate:"),function(_1d,_1e,_1f){
with(_1d){
return !(_1d<_1f||_1d>_1f);
}
}),new objj_method(sel_getUid("compare:"),function(_20,_21,_22){
with(_20){
return (_20>_22)?CPOrderedDescending:((_20<_22)?CPOrderedAscending:CPOrderedSame);
}
}),new objj_method(sel_getUid("earlierDate:"),function(_23,_24,_25){
with(_23){
return (_23<_25)?_23:_25;
}
}),new objj_method(sel_getUid("laterDate:"),function(_26,_27,_28){
with(_26){
return (_26>_28)?_26:_28;
}
}),new objj_method(sel_getUid("description"),function(_29,_2a){
with(_29){
return _29.toString();
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("alloc"),function(_2b,_2c){
with(_2b){
return new Date;
}
}),new objj_method(sel_getUid("date"),function(_2d,_2e){
with(_2d){
return objj_msgSend(objj_msgSend(_2d,"alloc"),"init");
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSinceNow:"),function(_2f,_30,_31){
with(_2f){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSinceNow:",_31);
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSince1970:"),function(_32,_33,_34){
with(_32){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSince1970:",_34);
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSinceReferenceDate:"),function(_35,_36,_37){
with(_35){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSinceReferenceDate:",_37);
}
}),new objj_method(sel_getUid("distantPast"),function(_38,_39){
with(_38){
return new Date(-10000,1,1,0,0,0,0);
}
}),new objj_method(sel_getUid("distantFuture"),function(_3a,_3b){
with(_3a){
return new Date(10000,1,1,0,0,0,0);
}
}),new objj_method(sel_getUid("timeIntervalSinceReferenceDate"),function(_3c,_3d){
with(_3c){
return objj_msgSend(objj_msgSend(CPDate,"date"),"timeIntervalSinceReferenceDate");
}
})]);
Date.prototype.isa=CPDate;
