i;10;CPObject.ji;11;CPRunLoop.ji;14;CPURLRequest.ji;15;CPURLResponse.jc;4598;
var _1=0,_2=1,_3=2,_4=3,_5=4;
var _6=nil;
var _7=objj_allocateClassPair(CPObject,"CPURLConnection"),_8=_7.isa;
class_addIvars(_7,[new objj_ivar("_request"),new objj_ivar("_delegate"),new objj_ivar("_isCanceled"),new objj_ivar("_isLocalFileConnection"),new objj_ivar("_XMLHTTPRequest")]);
objj_registerClassPair(_7);
objj_addClassForBundle(_7,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_7,[new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:"),function(_9,_a,_b,_c,_d){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"init");
if(_9){
_request=_b;
_delegate=_c;
_isCanceled=NO;
var _e=objj_msgSend(_request,"URL"),_f=objj_msgSend(_e,"scheme");
_isLocalFileConnection=_f==="file"||((_f!=="http"||_f!=="https:")&&window.location&&(window.location.protocol==="file:"||window.location.protocol==="app:"));
_XMLHTTPRequest=objj_request_xmlhttp();
if(_d){
objj_msgSend(_9,"start");
}
}
return _9;
}
}),new objj_method(sel_getUid("initWithRequest:delegate:"),function(_10,_11,_12,_13){
with(_10){
return objj_msgSend(_10,"initWithRequest:delegate:startImmediately:",_12,_13,YES);
}
}),new objj_method(sel_getUid("delegate"),function(_14,_15){
with(_14){
return _delegate;
}
}),new objj_method(sel_getUid("start"),function(_16,_17){
with(_16){
_isCanceled=NO;
try{
_XMLHTTPRequest.open(objj_msgSend(_request,"HTTPMethod"),objj_msgSend(objj_msgSend(_request,"URL"),"absoluteString"),YES);
_XMLHTTPRequest.onreadystatechange=function(){
objj_msgSend(_16,"_readyStateDidChange");
};
var _18=objj_msgSend(_request,"allHTTPHeaderFields"),key=nil,_1a=objj_msgSend(_18,"keyEnumerator");
while(key=objj_msgSend(_1a,"nextObject")){
_XMLHTTPRequest.setRequestHeader(key,objj_msgSend(_18,"objectForKey:",key));
}
_XMLHTTPRequest.send(objj_msgSend(_request,"HTTPBody"));
}
catch(anException){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didFailWithError:"))){
objj_msgSend(_delegate,"connection:didFailWithError:",_16,anException);
}
}
}
}),new objj_method(sel_getUid("cancel"),function(_1b,_1c){
with(_1b){
_isCanceled=YES;
try{
_XMLHTTPRequest.abort();
}
catch(anException){
}
}
}),new objj_method(sel_getUid("isLocalFileConnection"),function(_1d,_1e){
with(_1d){
return _isLocalFileConnection;
}
}),new objj_method(sel_getUid("_readyStateDidChange"),function(_1f,_20){
with(_1f){
if(_XMLHTTPRequest.readyState==_5){
var _21=_XMLHTTPRequest.status,URL=objj_msgSend(_request,"URL");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveResponse:"))){
if(_isLocalFileConnection){
objj_msgSend(_delegate,"connection:didReceiveResponse:",_1f,objj_msgSend(objj_msgSend(CPURLResponse,"alloc"),"initWithURL:",URL));
}else{
var _23=objj_msgSend(objj_msgSend(CPHTTPURLResponse,"alloc"),"initWithURL:",URL);
objj_msgSend(_23,"_setStatusCode:",_21);
objj_msgSend(_delegate,"connection:didReceiveResponse:",_1f,_23);
}
}
if(!_isCanceled){
if(_21==401&&objj_msgSend(_6,"respondsToSelector:",sel_getUid("connectionDidReceiveAuthenticationChallenge:"))){
objj_msgSend(_6,"connectionDidReceiveAuthenticationChallenge:",_1f);
}else{
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveData:"))){
objj_msgSend(_delegate,"connection:didReceiveData:",_1f,_XMLHTTPRequest.responseText);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connectionDidFinishLoading:"))){
objj_msgSend(_delegate,"connectionDidFinishLoading:",_1f);
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_XMLHTTPRequest"),function(_24,_25){
with(_24){
return _XMLHTTPRequest;
}
})]);
class_addMethods(_8,[new objj_method(sel_getUid("setClassDelegate:"),function(_26,_27,_28){
with(_26){
_6=_28;
}
}),new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:error:"),function(_29,_2a,_2b,_2c,_2d){
with(_29){
try{
var _2e=objj_request_xmlhttp();
_2e.open(objj_msgSend(_2b,"HTTPMethod"),objj_msgSend(objj_msgSend(_2b,"URL"),"absoluteString"),NO);
var _2f=objj_msgSend(_2b,"allHTTPHeaderFields"),key=nil,_31=objj_msgSend(_2f,"keyEnumerator");
while(key=objj_msgSend(_31,"nextObject")){
_2e.setRequestHeader(key,objj_msgSend(_2f,"objectForKey:",key));
}
_2e.send(objj_msgSend(_2b,"HTTPBody"));
return objj_msgSend(CPData,"dataWithString:",_2e.responseText);
}
catch(anException){
}
return nil;
}
}),new objj_method(sel_getUid("connectionWithRequest:delegate:"),function(_32,_33,_34,_35){
with(_32){
return objj_msgSend(objj_msgSend(_32,"alloc"),"initWithRequest:delegate:",_34,_35);
}
})]);
