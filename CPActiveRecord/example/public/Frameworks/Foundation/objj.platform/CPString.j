i;10;CPObject.ji;13;CPException.ji;18;CPSortDescriptor.ji;9;CPValue.jc;9503;
CPCaseInsensitiveSearch=1;
CPLiteralSearch=2;
CPBackwardsSearch=4;
CPAnchoredSearch=8;
CPNumericSearch=64;
var _1=new objj_dictionary();
var _2=["/",".","*","+","?","|","$","^","(",")","[","]","{","}","\\"],_3=new RegExp("(\\"+_2.join("|\\")+")","g"),_4=new RegExp("(^\\s+|\\s+$)","g");
var _5=objj_allocateClassPair(CPObject,"CPString"),_6=_5.isa;
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithString:"),function(_7,_8,_9){
with(_7){
return String(_9);
}
}),new objj_method(sel_getUid("initWithFormat:"),function(_a,_b,_c){
with(_a){
if(!_c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
_a=sprintf.apply(this,Array.prototype.slice.call(arguments,2));
return _a;
}
}),new objj_method(sel_getUid("description"),function(_d,_e){
with(_d){
return _d;
}
}),new objj_method(sel_getUid("length"),function(_f,_10){
with(_f){
return length;
}
}),new objj_method(sel_getUid("characterAtIndex:"),function(_11,_12,_13){
with(_11){
return charAt(_13);
}
}),new objj_method(sel_getUid("stringByAppendingFormat:"),function(_14,_15,_16){
with(_14){
if(!_16){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return _14+sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
}),new objj_method(sel_getUid("stringByAppendingString:"),function(_17,_18,_19){
with(_17){
return _17+_19;
}
}),new objj_method(sel_getUid("stringByPaddingToLength:withString:startingAtIndex:"),function(_1a,_1b,_1c,_1d,_1e){
with(_1a){
if(length==_1c){
return _1a;
}
if(_1c<length){
return substr(0,_1c);
}
var _1f=_1a,_20=_1d.substring(_1e),_21=_1c-length;
while((_21-=_20.length)>=0){
_1f+=_20;
}
if(-_21<_20.length){
_1f+=_20.substring(0,-_21);
}
return _1f;
}
}),new objj_method(sel_getUid("componentsSeparatedByString:"),function(_22,_23,_24){
with(_22){
return split(_24);
}
}),new objj_method(sel_getUid("substringFromIndex:"),function(_25,_26,_27){
with(_25){
return substr(_27);
}
}),new objj_method(sel_getUid("substringWithRange:"),function(_28,_29,_2a){
with(_28){
return substr(_2a.location,_2a.length);
}
}),new objj_method(sel_getUid("substringToIndex:"),function(_2b,_2c,_2d){
with(_2b){
return substring(0,_2d);
}
}),new objj_method(sel_getUid("rangeOfString:"),function(_2e,_2f,_30){
with(_2e){
return objj_msgSend(_2e,"rangeOfString:options:",_30,0);
}
}),new objj_method(sel_getUid("rangeOfString:options:"),function(_31,_32,_33,_34){
with(_31){
return objj_msgSend(_31,"rangeOfString:options:range:",_33,_34,nil);
}
}),new objj_method(sel_getUid("rangeOfString:options:range:"),function(_35,_36,_37,_38,_39){
with(_35){
var _3a=(_39==nil)?_35:objj_msgSend(_35,"substringWithRange:",_39),_3b=CPNotFound;
if(_38&CPCaseInsensitiveSearch){
_3a=_3a.toLowerCase();
_37=_37.toLowerCase();
}
if(_38&CPBackwardsSearch){
_3b=_3a.lastIndexOf(_37,_38&CPAnchoredSearch?length-_37.length:0);
}else{
if(_38&CPAnchoredSearch){
_3b=_3a.substr(0,_37.length).indexOf(_37)!=CPNotFound?0:CPNotFound;
}else{
_3b=_3a.indexOf(_37);
}
}
return CPMakeRange(_3b,_3b==CPNotFound?0:_37.length);
}
}),new objj_method(sel_getUid("stringByEscapingRegexControlCharacters"),function(_3c,_3d){
with(_3c){
return _3c.replace(_3,"\\$1");
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:"),function(_3e,_3f,_40,_41){
with(_3e){
return _3e.replace(new RegExp(objj_msgSend(_40,"stringByEscapingRegexControlCharacters"),"g"),_41);
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:options:range:"),function(_42,_43,_44,_45,_46,_47){
with(_42){
var _48=substring(0,_47.location),_49=substr(_47.location,_47.length),end=substring(_47.location+_47.length,_42.length),_44=objj_msgSend(_44,"stringByEscapingRegexControlCharacters"),_4b;
if(_46&CPCaseInsensitiveSearch){
_4b=new RegExp(_44,"gi");
}else{
_4b=new RegExp(_44,"g");
}
return _48+""+_49.replace(_4b,_45)+""+end;
}
}),new objj_method(sel_getUid("stringByReplacingCharactersInRange:withString:"),function(_4c,_4d,_4e,_4f){
with(_4c){
return ""+substring(0,_4e.location)+_4f+substring(_4e.location+_4e.length,_4c.length);
}
}),new objj_method(sel_getUid("stringByTrimmingWhitespace"),function(_50,_51){
with(_50){
return _50.replace(_4,"");
}
}),new objj_method(sel_getUid("compare:"),function(_52,_53,_54){
with(_52){
return objj_msgSend(_52,"compare:options:",_54,nil);
}
}),new objj_method(sel_getUid("caseInsensitiveCompare:"),function(_55,_56,_57){
with(_55){
return objj_msgSend(_55,"compare:options:",_57,CPCaseInsensitiveSearch);
}
}),new objj_method(sel_getUid("compare:options:"),function(_58,_59,_5a,_5b){
with(_58){
var lhs=_58,rhs=_5a;
if(_5b&CPCaseInsensitiveSearch){
lhs=lhs.toLowerCase();
rhs=rhs.toLowerCase();
}
if(lhs<rhs){
return CPOrderedAscending;
}else{
if(lhs>rhs){
return CPOrderedDescending;
}
}
return CPOrderedSame;
}
}),new objj_method(sel_getUid("compare:options:range:"),function(_5e,_5f,_60,_61,_62){
with(_5e){
var lhs=objj_msgSend(_5e,"substringWithRange:",_62),rhs=_60;
return objj_msgSend(lhs,"compare:options:",rhs,_61);
}
}),new objj_method(sel_getUid("hasPrefix:"),function(_65,_66,_67){
with(_65){
return _67&&_67!=""&&indexOf(_67)==0;
}
}),new objj_method(sel_getUid("hasSuffix:"),function(_68,_69,_6a){
with(_68){
return _6a&&_6a!=""&&lastIndexOf(_6a)==(length-_6a.length);
}
}),new objj_method(sel_getUid("isEqualToString:"),function(_6b,_6c,_6d){
with(_6b){
return _6b==_6d;
}
}),new objj_method(sel_getUid("UID"),function(_6e,_6f){
with(_6e){
var _70=dictionary_getValue(_1,_6e);
if(!_70){
_70=_objj_generateObjectHash();
dictionary_setValue(_1,_6e,_70);
}
return _70;
}
}),new objj_method(sel_getUid("capitalizedString"),function(_71,_72){
with(_71){
var _73=_71.split(/\b/g);
for(var i=0;i<_73.length;i++){
if(i==0||(/\s$/).test(_73[i-1])){
_73[i]=_73[i].substring(0,1).toUpperCase()+_73[i].substring(1).toLowerCase();
}else{
_73[i]=_73[i].toLowerCase();
}
}
return _73.join("");
}
}),new objj_method(sel_getUid("lowercaseString"),function(_75,_76){
with(_75){
return toLowerCase();
}
}),new objj_method(sel_getUid("uppercaseString"),function(_77,_78){
with(_77){
return toUpperCase();
}
}),new objj_method(sel_getUid("doubleValue"),function(_79,_7a){
with(_79){
return parseFloat(_79,10);
}
}),new objj_method(sel_getUid("boolValue"),function(_7b,_7c){
with(_7b){
var _7d=new RegExp("^\\s*[\\+,\\-]*0*");
return RegExp("^[Y,y,t,T,1-9]").test(_7b.replace(_7d,""));
}
}),new objj_method(sel_getUid("floatValue"),function(_7e,_7f){
with(_7e){
return parseFloat(_7e,10);
}
}),new objj_method(sel_getUid("intValue"),function(_80,_81){
with(_80){
return parseInt(_80,10);
}
}),new objj_method(sel_getUid("pathComponents"),function(_82,_83){
with(_82){
var _84=split("/");
if(_84[0]===""){
_84[0]="/";
}
if(_84[_84.length-1]===""){
_84.pop();
}
return _84;
}
}),new objj_method(sel_getUid("pathExtension"),function(_85,_86){
with(_85){
return substr(lastIndexOf(".")+1);
}
}),new objj_method(sel_getUid("lastPathComponent"),function(_87,_88){
with(_87){
var _89=objj_msgSend(_87,"pathComponents");
return _89[_89.length-1];
}
}),new objj_method(sel_getUid("stringByDeletingLastPathComponent"),function(_8a,_8b){
with(_8a){
var _8c=_8a,_8d=length-1;
while(_8c.charAt(_8d)==="/"){
_8d--;
}
_8c=_8c.substr(0,_8c.lastIndexOf("/",_8d));
if(_8c===""&&charAt(0)==="/"){
return "/";
}
return _8c;
}
}),new objj_method(sel_getUid("stringByStandardizingPath"),function(_8e,_8f){
with(_8e){
return objj_standardize_path(_8e);
}
}),new objj_method(sel_getUid("copy"),function(_90,_91){
with(_90){
return new String(_90);
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("alloc"),function(_92,_93){
with(_92){
return new String;
}
}),new objj_method(sel_getUid("string"),function(_94,_95){
with(_94){
return objj_msgSend(objj_msgSend(_94,"alloc"),"init");
}
}),new objj_method(sel_getUid("stringWithHash:"),function(_96,_97,_98){
with(_96){
var _99=parseInt(_98,10).toString(16);
return "000000".substring(0,MAX(6-_99.length,0))+_99;
}
}),new objj_method(sel_getUid("stringWithString:"),function(_9a,_9b,_9c){
with(_9a){
if(!_9c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"stringWithString: the string can't be 'nil'");
}
return objj_msgSend(objj_msgSend(_9a,"alloc"),"initWithString:",_9c);
}
}),new objj_method(sel_getUid("stringWithFormat:"),function(_9d,_9e,_9f){
with(_9d){
if(!_9f){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
})]);
var _5=objj_getClass("CPString");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("objectFromJSON"),function(_a0,_a1){
with(_a0){
return JSON.parse(_a0);
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("JSONFromObject:"),function(_a2,_a3,_a4){
with(_a2){
return JSON.stringify(_a4);
}
})]);
var _5=objj_getClass("CPString");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _6=_5.isa;
class_addMethods(_6,[new objj_method(sel_getUid("UUID"),function(_a5,_a6){
with(_a5){
var g="";
for(var i=0;i<32;i++){
g+=FLOOR(RAND()*15).toString(15);
}
return g;
}
})]);
String.prototype.isa=CPString;
