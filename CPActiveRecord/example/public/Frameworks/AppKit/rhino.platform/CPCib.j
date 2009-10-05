I;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.ji;20;_CPCibClassSwapper.ji;20;_CPCibCustomObject.ji;22;_CPCibCustomResource.ji;18;_CPCibCustomView.ji;23;_CPCibKeyedUnarchiver.ji;18;_CPCibObjectData.ji;19;_CPCibProxyObject.ji;22;_CPCibWindowTemplate.jc;4545;
CPCibOwner="CPCibOwner",CPCibTopLevelObjects="CPCibTopLevelObjects",CPCibReplacementClasses="CPCibReplacementClasses",CPCibExternalObjects="CPCibExternalObjects";
var _1="CPCibObjectDataKey";
var _2=objj_allocateClassPair(CPObject,"CPCib"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_data"),new objj_ivar("_bundle"),new objj_ivar("_awakenCustomResources"),new objj_ivar("_loadDelegate")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithContentsOfURL:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_data=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:error:",objj_msgSend(CPURLRequest,"requestWithURL:",_6),nil,nil);
_awakenCustomResources=YES;
}
return _4;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:loadDelegate:"),function(_7,_8,_9,_a){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPObject")},"init");
if(_7){
objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",_9),_7);
_awakenCustomResources=YES;
_loadDelegate=_a;
}
return _7;
}
}),new objj_method(sel_getUid("initWithCibNamed:bundle:"),function(_b,_c,_d,_e){
with(_b){
if(!objj_msgSend(_d,"hasSuffix:",".cib")){
_d=objj_msgSend(_d,"stringByAppendingString:",".cib");
}
_b=objj_msgSend(_b,"initWithContentsOfURL:",objj_msgSend(_e||objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_d));
if(_b){
_bundle=_e;
}
return _b;
}
}),new objj_method(sel_getUid("initWithCibNamed:bundle:loadDelegate:"),function(_f,_10,_11,_12,_13){
with(_f){
if(!objj_msgSend(_11,"hasSuffix:",".cib")){
_11=objj_msgSend(_11,"stringByAppendingString:",".cib");
}
_f=objj_msgSend(_f,"initWithContentsOfURL:loadDelegate:",objj_msgSend(_12||objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_11),_13);
if(_f){
_bundle=_12;
}
return _f;
}
}),new objj_method(sel_getUid("_setAwakenCustomResources:"),function(_14,_15,_16){
with(_14){
_awakenCustomResources=_16;
}
}),new objj_method(sel_getUid("_awakenCustomResources"),function(_17,_18){
with(_17){
return _awakenCustomResources;
}
}),new objj_method(sel_getUid("instantiateCibWithExternalNameTable:"),function(_19,_1a,_1b){
with(_19){
var _1c=_bundle,_1d=objj_msgSend(_1b,"objectForKey:",CPCibOwner);
if(!_1c&&_1d){
_1c=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_1d,"class"));
}
var _1e=objj_msgSend(objj_msgSend(_CPCibKeyedUnarchiver,"alloc"),"initForReadingWithData:bundle:awakenCustomResources:",_data,_1c,_awakenCustomResources),_1f=objj_msgSend(_1b,"objectForKey:",CPCibReplacementClasses);
if(_1f){
var key=nil,_21=objj_msgSend(_1f,"keyEnumerator");
while(key=objj_msgSend(_21,"nextObject")){
objj_msgSend(_1e,"setClass:forClassName:",objj_msgSend(_1f,"objectForKey:",key),key);
}
}
objj_msgSend(_1e,"setExternalObjectsForProxyIdentifiers:",objj_msgSend(_1b,"objectForKey:",CPCibExternalObjects));
var _22=objj_msgSend(_1e,"decodeObjectForKey:",_1);
if(!_22||!objj_msgSend(_22,"isKindOfClass:",objj_msgSend(_CPCibObjectData,"class"))){
return NO;
}
var _23=objj_msgSend(_1b,"objectForKey:",CPCibTopLevelObjects);
objj_msgSend(_22,"instantiateWithOwner:topLevelObjects:",_1d,_23);
objj_msgSend(_22,"establishConnectionsWithOwner:topLevelObjects:",_1d,_23);
objj_msgSend(_22,"awakeWithOwner:topLevelObjects:",_1d,_23);
objj_msgSend(_22,"displayVisibleWindows");
return YES;
}
}),new objj_method(sel_getUid("instantiateCibWithOwner:topLevelObjects:"),function(_24,_25,_26,_27){
with(_24){
return objj_msgSend(_24,"instantiateCibWithExternalNameTable:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_26,CPCibOwner,_27,CPCibTopLevelObjects));
}
})]);
var _2=objj_getClass("CPCib");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCib\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("connection:didReceiveData:"),function(_28,_29,_2a,_2b){
with(_28){
_data=objj_msgSend(CPData,"dataWithString:",_2b);
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_2c,_2d,_2e,_2f){
with(_2c){
alert("cib: connection failed.");
_loadDelegate=nil;
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_30,_31,_32){
with(_30){
if(objj_msgSend(_loadDelegate,"respondsToSelector:",sel_getUid("cibDidFinishLoading:"))){
objj_msgSend(_loadDelegate,"cibDidFinishLoading:",_30);
}
_loadDelegate=nil;
}
})]);
