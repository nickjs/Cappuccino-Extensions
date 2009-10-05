I;21;Foundation/CPObject.jc;1746;
var _1=nil,_2=nil,_3=nil;
var _4=objj_allocateClassPair(CPObject,"CPPlatformString"),_5=_4.isa;
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("bootstrap"),function(_6,_7){
with(_6){
_1=document.createElement("iframe");
_1.name=name="iframe_"+FLOOR(RAND()*10000);
_1.style.position="absolute";
_1.style.left="-100px";
_1.style.top="-100px";
_1.style.width="1px";
_1.style.height="1px";
_1.style.borderWidth="0px";
_1.style.background="blue";
_1.style.overflow="hidden";
_1.style.zIndex=100000000000;
document.getElementsByTagName("body")[0].appendChild(_1);
var _8=(_1.contentDocument||_1.contentWindow.document);
_8.write("<html><head></head><body></body></html>");
_8.close();
_2=_8.createElement("span");
_2.style.position="absolute";
_2.style.whiteSpace="pre";
_2.style.visibility="visible";
_2.style.padding="0px";
_2.style.margin="0px";
_2.style.background="red";
_8.getElementsByTagName("body")[0].appendChild(_2);
}
}),new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"),function(_9,_a,_b,_c,_d){
with(_9){
if(!_c){
if(!_3){
_3=objj_msgSend(CPFont,"systemFontOfSize:",12);
}
_c=_3;
}
var _e=_2.style;
if(_d===NULL){
_e.width="";
_e.whiteSpace="pre";
}else{
_e.width=ROUND(_d)+"px";
if(document.attachEvent){
_e.wordWrap="break-word";
}else{
_e.whiteSpace="-o-pre-wrap";
_e.whiteSpace="-pre-wrap";
_e.whiteSpace="-moz-pre-wrap";
_e.whiteSpace="pre-wrap";
}
}
_e.font=objj_msgSend(_c,"cssString");
if(CPFeatureIsCompatible(CPJavascriptInnerTextFeature)){
_2.innerText=_b;
}else{
if(CPFeatureIsCompatible(CPJavascriptTextContentFeature)){
_2.textContent=_b;
}
}
return {width:_2.clientWidth,height:_2.clientHeight};
}
})]);
