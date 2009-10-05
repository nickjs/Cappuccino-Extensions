c;4361;
var _1=function(_2,_3,_4){
var _5=objj_msgSend(_4,"objectForKey:","resourcetype");
if(_5===CPWebDAVManagerCollectionResourceType){
objj_msgSend(_2,"setResourceValue:forKey:",YES,CPURLIsDirectoryKey);
objj_msgSend(_2,"setResourceValue:forKey:",NO,CPURLIsRegularFileKey);
}else{
if(_5===CPWebDAVManagerNonCollectionResourceType){
objj_msgSend(_2,"setResourceValue:forKey:",NO,CPURLIsDirectoryKey);
objj_msgSend(_2,"setResourceValue:forKey:",YES,CPURLIsRegularFileKey);
}
}
var _6=objj_msgSend(_4,"objectForKey:","displayname");
if(_6!==nil){
objj_msgSend(_2,"setResourceValue:forKey:",_6,CPURLNameKey);
objj_msgSend(_2,"setResourceValue:forKey:",_6,CPURLLocalizedNameKey);
}
};
CPWebDAVManagerCollectionResourceType=1;
CPWebDAVManagerNonCollectionResourceType=0;
var _7=objj_allocateClassPair(CPObject,"CPWebDAVManager"),_8=_7.isa;
class_addIvars(_7,[new objj_ivar("_blocksForConnections")]);
objj_registerClassPair(_7);
objj_addClassForBundle(_7,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_7,[new objj_method(sel_getUid("init"),function(_9,_a){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"init");
if(_9){
_blocksForConnections=objj_msgSend(CPDictionary,"dictionary");
}
return _9;
}
}),new objj_method(sel_getUid("contentsOfDirectoryAtURL:includingPropertiesForKeys:options:block:"),function(_b,_c,_d,_e,_f,_10){
with(_b){
var _11=[],_12=objj_msgSend(_e,"count");
while(_12--){
_11.push(_13[_e[_12]]);
}
var _14=function(_15,_16){
var _17=[],_18=nil,_19=objj_msgSend(_16,"keyEnumerator");
while(_18=objj_msgSend(_19,"nextObject")){
var URL=objj_msgSend(CPURL,"URLWithString:",_18),_11=objj_msgSend(_16,"objectForKey:",_18);
if(!objj_msgSend(objj_msgSend(URL,"absoluteString"),"isEqual:",objj_msgSend(_15,"absoluteString"))){
_17.push(URL);
_1(URL,_e,_11);
}
}
return _17;
};
if(!_10){
return _14(_d,response);
}
objj_msgSend(_b,"PROPFIND:properties:depth:block:",_d,_11,1,function(_1b,_1c){
_10(_1b,_14(_1b,_1c));
});
}
}),new objj_method(sel_getUid("PROPFIND:properties:depth:block:"),function(_1d,_1e,_1f,_20,_21,_22){
with(_1d){
var _23=objj_msgSend(CPURLRequest,"requestWithURL:",_1f);
objj_msgSend(_23,"setHTTPMethod:","PROPFIND");
objj_msgSend(_23,"setValue:forHTTPHeaderField:",_21,"Depth");
var _24=["<?xml version=\"1.0\"?><a:propfind xmlns:a=\"DAV:\">"],_25=0,_26=_20.length;
for(;_25<_26;++_25){
_24.push("<a:prop><a:",_20[_25],"/></a:prop>");
}
_24.push("</a:propfind>");
objj_msgSend(_23,"setHTTPBody:",_24.join(""));
if(!_22){
return _27(objj_msgSend(objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:error:",_23,nil,nil),"string"));
}else{
var _28=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_23,_1d);
objj_msgSend(_blocksForConnections,"setObject:forKey:",_22,objj_msgSend(_28,"UID"));
}
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_29,_2a,_2b,_2c){
with(_29){
var _2d=objj_msgSend(_blocksForConnections,"objectForKey:",objj_msgSend(_2b,"UID"));
_2d(objj_msgSend(_2b._request,"URL"),_27(_2c));
}
})]);
var _13={};
_13[CPURLNameKey]="displayname";
_13[CPURLLocalizedNameKey]="displayname";
_13[CPURLIsRegularFileKey]="resourcetype";
_13[CPURLIsDirectoryKey]="resourcetype";
var _2e=function(_2f){
if(typeof window["ActiveXObject"]!=="undefined"){
var _30=new ActiveXObject("Microsoft.XMLDOM");
_30.async=false;
_30.loadXML(_2f);
return _30;
}
return new DOMParser().parseFromString(_2f,"text/xml");
};
var _27=function(_31){
var _32=_2e(_31),_33=_32.getElementsByTagNameNS("*","response"),_34=0,_35=_33.length;
var _36=objj_msgSend(CPDictionary,"dictionary");
for(;_34<_35;++_34){
var _37=_33[_34],_38=_37.getElementsByTagNameNS("*","prop").item(0).childNodes,_39=0,_3a=_38.length,_3b=objj_msgSend(CPDictionary,"dictionary");
for(;_39<_3a;++_39){
var _3c=_38[_39];
if(_3c.nodeType===8||_3c.nodeType===3){
continue;
}
var _3d=_3c.nodeName,_3e=_3d.lastIndexOf(":");
if(_3e>-1){
_3d=_3d.substr(_3e+1);
}
if(_3d==="resourcetype"){
objj_msgSend(_3b,"setObject:forKey:",_3c.firstChild?CPWebDAVManagerCollectionResourceType:CPWebDAVManagerNonCollectionResourceType,_3d);
}else{
objj_msgSend(_3b,"setObject:forKey:",_3c.firstChild.nodeValue,_3d);
}
}
var _3f=_37.getElementsByTagNameNS("*","href").item(0);
objj_msgSend(_36,"setObject:forKey:",_3b,_3f.firstChild.nodeValue);
}
return _36;
};
var _40=function(_41,_42){
};
