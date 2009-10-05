I;21;Foundation/CPObject.jc;4265;
var _1={},_2={},_3={},_4=nil,_5=nil,_6=nil;
var _7=objj_allocateClassPair(CPObject,"BKThemeDescriptor"),_8=_7.isa;
objj_registerClassPair(_7);
objj_addClassForBundle(_7,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("allThemeDescriptorClasses"),function(_9,_a){
with(_9){
var _b=[];
for(candidate in window){
var _c=objj_getClass(candidate),_d=class_getName(_c);
if(_d==="BKThemeDescriptor"){
continue;
}
var _e=_d.indexOf("ThemeDescriptor");
if((_e>=0)&&(_e===_d.length-"ThemeDescriptor".length)){
_b.push(_c);
}
}
objj_msgSend(_b,"sortUsingSelector:",sel_getUid("compare:"));
return _b;
}
}),new objj_method(sel_getUid("lightCheckersColor"),function(_f,_10){
with(_f){
if(!_4){
_4=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(BKThemeDescriptor,"class")),"pathForResource:","light-checkers.png"),CGSizeMake(12,12)));
}
return _4;
}
}),new objj_method(sel_getUid("darkCheckersColor"),function(_11,_12){
with(_11){
if(!_5){
_5=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(BKThemeDescriptor,"class")),"pathForResource:","dark-checkers.png"),CGSizeMake(12,12)));
}
return _5;
}
}),new objj_method(sel_getUid("windowBackgroundColor"),function(_13,_14){
with(_13){
return objj_msgSend(_CPStandardWindowView,"bodyBackgroundColor");
}
}),new objj_method(sel_getUid("defaultShowcaseBackgroundColor"),function(_15,_16){
with(_15){
return objj_msgSend(_CPStandardWindowView,"bodyBackgroundColor");
}
}),new objj_method(sel_getUid("showcaseBackgroundColor"),function(_17,_18){
with(_17){
var _19=objj_msgSend(_17,"className");
if(!_3[_19]){
_3[_19]=objj_msgSend(_17,"defaultShowcaseBackgroundColor");
}
return _3[_19];
}
}),new objj_method(sel_getUid("setShowcaseBackgroundColor:"),function(_1a,_1b,_1c){
with(_1a){
_3[objj_msgSend(_1a,"className")]=_1c;
}
}),new objj_method(sel_getUid("itemSize"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_1d,"className");
if(!_1[_1f]){
objj_msgSend(_1d,"calculateThemedObjectTemplates");
}
return CGSizeMakeCopy(_1[_1f]);
}
}),new objj_method(sel_getUid("themedObjectTemplates"),function(_20,_21){
with(_20){
var _22=objj_msgSend(_20,"className");
if(!_2[_22]){
objj_msgSend(_20,"calculateThemedObjectTemplates");
}
return _2[_22];
}
}),new objj_method(sel_getUid("calculateThemedObjectTemplates"),function(_23,_24){
with(_23){
var _25=[],_26=CGSizeMake(0,0),_27=class_copyMethodList(objj_msgSend(_23,"class").isa),_28=0,_29=objj_msgSend(_27,"count");
for(;_28<_29;++_28){
var _2a=_27[_28],_2b=method_getName(_2a);
if(_2b.indexOf("themed")!==0){
continue;
}
var _2c=method_getImplementation(_2a),_2d=_2c(_23,_2b);
if(!_2d){
continue;
}
var _2e=objj_msgSend(objj_msgSend(BKThemedObjectTemplate,"alloc"),"init");
objj_msgSend(_2e,"setValue:forKey:",_2d,"themedObject");
objj_msgSend(_2e,"setValue:forKey:",BKLabelFromIdentifier(_2b),"label");
objj_msgSend(_25,"addObject:",_2e);
if(objj_msgSend(_2d,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _2f=objj_msgSend(_2d,"frame").size,_30=objj_msgSend(objj_msgSend(_2e,"valueForKey:","label"),"sizeWithFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12)).width+20;
if(_2f.width>_26.width){
_26.width=_2f.width;
}
if(_30>_26.width){
_26.width=_30;
}
if(_2f.height>_26.height){
_26.height=_2f.height;
}
}
}
var _31=objj_msgSend(_23,"className");
_1[_31]=_26;
_2[_31]=_25;
}
}),new objj_method(sel_getUid("compare:"),function(_32,_33,_34){
with(_32){
return objj_msgSend(objj_msgSend(_32,"themeName"),"compare:",objj_msgSend(_34,"themeName"));
}
})]);
BKLabelFromIdentifier=function(_35){
var _36=_35.substr("themed".length);
index=0,count=_36.length,label="",lastCapital=null,isLeadingCapital=YES;
for(;index<count;++index){
var _37=_36.charAt(index),_38=/^[A-Z]/.test(_37);
if(_38){
if(!isLeadingCapital){
if(lastCapital===null){
label+=" "+_37.toLowerCase();
}else{
label+=_37;
}
}
lastCapital=_37;
}else{
if(isLeadingCapital&&lastCapital!==null){
label+=lastCapital;
}
label+=_37;
lastCapital=null;
isLeadingCapital=NO;
}
}
return label;
};
