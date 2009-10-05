i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.jc;20761;
CPLineBreakByWordWrapping=0;
CPLineBreakByCharWrapping=1;
CPLineBreakByClipping=2;
CPLineBreakByTruncatingHead=3;
CPLineBreakByTruncatingTail=4;
CPLineBreakByTruncatingMiddle=5;
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
var _1=nil,_2=nil,_3=nil,_4=nil,_5=nil,_6=NO,_7=NO,_8=NO,_9=nil,_a=nil,_b=nil,_c=nil,_d=nil,_e=nil;
var _f="‚Ä¢";
var _10=objj_getClass("CPString");
if(!_10){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _11=_10.isa;
class_addMethods(_10,[new objj_method(sel_getUid("string"),function(_12,_13){
with(_12){
return _12;
}
})]);
CPTextFieldStateRounded=CPThemeState("rounded");
CPTextFieldStatePlaceholder=CPThemeState("placeholder");
var _10=objj_allocateClassPair(CPControl,"CPTextField"),_11=_10.isa;
class_addIvars(_10,[new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isSecure"),new objj_ivar("_drawsBackground"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_delegate"),new objj_ivar("_textDidChangeValue"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_10);
objj_addClassForBundle(_10,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_10,[new objj_method(sel_getUid("_inputElement"),function(_14,_15){
with(_14){
if(!_1){
_1=document.createElement("input");
_1.style.position="absolute";
_1.style.border="0px";
_1.style.padding="0px";
_1.style.margin="0px";
_1.style.whiteSpace="pre";
_1.style.background="transparent";
_1.style.outline="none";
_b=function(_16){
if(_4&&_4._DOMElement!=_1.parentNode){
return;
}
if(!_6){
objj_msgSend(objj_msgSend(_4,"window"),"makeFirstResponder:",nil);
return;
}
CPTextFieldHandleBlur(_16,_1);
_7=YES;
return true;
};
_e=function(_17){
_5=objj_msgSend(_4,"stringValue");
_d(_17);
return true;
};
_d=function(_18){
_18=_18||window.event;
if(_18.keyCode==CPReturnKeyCode||_18.keyCode==CPTabKeyCode){
if(_18.preventDefault){
_18.preventDefault();
}
if(_18.stopPropagation){
_18.stopPropagation();
}
_18.cancelBubble=true;
var _19=_4;
if(_18&&_18.keyCode==CPReturnKeyCode){
objj_msgSend(_19,"sendAction:to:",objj_msgSend(_19,"action"),objj_msgSend(_19,"target"));
objj_msgSend(objj_msgSend(_19,"window"),"makeFirstResponder:",nil);
}else{
if(_18&&_18.keyCode==CPTabKeyCode){
if(!_18.shiftKey){
objj_msgSend(objj_msgSend(_19,"window"),"selectNextKeyView:",_19);
}else{
objj_msgSend(objj_msgSend(_19,"window"),"selectPreviousKeyView:",_19);
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
_c=function(){
objj_msgSend(_4,"setStringValue:",_1.value);
if(objj_msgSend(_4,"stringValue")!==_5){
_5=objj_msgSend(_4,"stringValue");
objj_msgSend(_4,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_4,nil));
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
CPTextFieldHandleBlur=function(_1a){
var _1b=_4;
_4=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
if(document.attachEvent){
_1.attachEvent("on"+CPDOMEventKeyUp,_c);
_1.attachEvent("on"+CPDOMEventKeyDown,_e);
_1.attachEvent("on"+CPDOMEventKeyPress,_d);
}else{
_1.addEventListener(CPDOMEventKeyUp,_c,NO);
_1.addEventListener(CPDOMEventKeyDown,_e,NO);
_1.addEventListener(CPDOMEventKeyPress,_d,NO);
}
_1.onblur=_b;
_3=_1;
}
if(CPFeatureIsCompatible(CPInputTypeCanBeChangedFeature)){
if(objj_msgSend(_14,"isSecure")){
_1.type="password";
}else{
_1.type="text";
}
return _1;
}
if(objj_msgSend(_14,"isSecure")){
if(!_2){
_2=document.createElement("input");
_2.style.position="absolute";
_2.style.border="0px";
_2.style.padding="0px";
_2.style.margin="0px";
_2.style.whiteSpace="pre";
_2.style.background="transparent";
_2.style.outline="none";
_2.type="password";
_2.attachEvent("on"+CPDOMEventKeyUp,_c);
_2.attachEvent("on"+CPDOMEventKeyDown,_e);
_2.attachEvent("on"+CPDOMEventKeyPress,_d);
_2.onblur=_b;
}
_1=_2;
}else{
_1=_3;
}
return _1;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_1c,_1d,_1e){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("CPControl")},"initWithFrame:",_1e);
if(_1c){
objj_msgSend(_1c,"setStringValue:","");
objj_msgSend(_1c,"setPlaceholderString:","");
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
objj_msgSend(_1c,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
}
return _1c;
}
}),new objj_method(sel_getUid("setEditable:"),function(_1f,_20,_21){
with(_1f){
_isEditable=_21;
}
}),new objj_method(sel_getUid("isEditable"),function(_22,_23){
with(_22){
return _isEditable;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_24,_25,_26){
with(_24){
_isSelectable=_26;
}
}),new objj_method(sel_getUid("isSelectable"),function(_27,_28){
with(_27){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSecure:"),function(_29,_2a,_2b){
with(_29){
_isSecure=_2b;
}
}),new objj_method(sel_getUid("isSecure"),function(_2c,_2d){
with(_2c){
return _isSecure;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_2e,_2f,_30){
with(_2e){
if(_30){
objj_msgSend(_2e,"setThemeState:",CPThemeStateBezeled);
}else{
objj_msgSend(_2e,"unsetThemeState:",CPThemeStateBezeled);
}
}
}),new objj_method(sel_getUid("isBezeled"),function(_31,_32){
with(_31){
return objj_msgSend(_31,"hasThemeState:",CPThemeStateBezeled);
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_33,_34,_35){
with(_33){
var _36=_35===CPTextFieldRoundedBezel;
if(_36){
objj_msgSend(_33,"setThemeState:",CPTextFieldStateRounded);
}else{
objj_msgSend(_33,"unsetThemeState:",CPTextFieldStateRounded);
}
}
}),new objj_method(sel_getUid("bezelStyle"),function(_37,_38){
with(_37){
if(objj_msgSend(_37,"hasThemeState:",CPTextFieldStateRounded)){
return CPTextFieldRoundedBezel;
}
return CPTextFieldSquareBezel;
}
}),new objj_method(sel_getUid("setBordered:"),function(_39,_3a,_3b){
with(_39){
if(_3b){
objj_msgSend(_39,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_39,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_3c,_3d){
with(_3c){
return objj_msgSend(_3c,"hasThemeState:",CPThemeStateBordered);
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_3e,_3f,_40){
with(_3e){
if(_drawsBackground==_40){
return;
}
_drawsBackground=_40;
objj_msgSend(_3e,"setNeedsLayout");
objj_msgSend(_3e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawsBackground"),function(_41,_42){
with(_41){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_43,_44,_45){
with(_43){
if(_textFieldBackgroundColor==_45){
return;
}
_textFieldBackgroundColor=_45;
objj_msgSend(_43,"setNeedsLayout");
objj_msgSend(_43,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_46,_47){
with(_46){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_48,_49){
with(_48){
return objj_msgSend(_48,"isEditable")&&objj_msgSend(_48,"isEnabled");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_4a,_4b){
with(_4a){
if(_4&&objj_msgSend(_4,"window")!==objj_msgSend(_4a,"window")){
objj_msgSend(objj_msgSend(_4,"window"),"makeFirstResponder:",nil);
}
objj_msgSend(_4a,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_4a,"_updatePlaceholderState");
objj_msgSend(_4a,"setNeedsLayout");
var _4c=objj_msgSend(_4a,"stringValue"),_4d=objj_msgSend(_4a,"_inputElement");
_4d.value=_4c;
_4d.style.color=objj_msgSend(objj_msgSend(_4a,"currentValueForThemeAttribute:","text-color"),"cssString");
_4d.style.font=objj_msgSend(objj_msgSend(_4a,"currentValueForThemeAttribute:","font"),"cssString");
_4d.style.zIndex=1000;
switch(objj_msgSend(_4a,"alignment")){
case CPCenterTextAlignment:
_4d.style.textAlign="center";
break;
case CPRightTextAlignment:
_4d.style.textAlign="right";
break;
default:
_4d.style.textAlign="left";
}
var _4e=objj_msgSend(_4a,"contentRectForBounds:",objj_msgSend(_4a,"bounds"));
_4d.style.top=(_4e.origin.y)+"px";
_4d.style.left=((_4e.origin.x)-1)+"px";
_4d.style.width=(_4e.size.width)+"px";
_4d.style.height=(_4e.size.height)+"px";
_DOMElement.appendChild(_4d);
window.setTimeout(function(){
_4d.focus();
_4=_4a;
},0);
objj_msgSend(_4a,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_4a,nil));
objj_msgSend(objj_msgSend(objj_msgSend(_4a,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
_8=YES;
if(document.attachEvent){
_9=document.body.onselectstart;
_a=document.body.ondrag;
document.body.ondrag=function(){
};
document.body.onselectstart=function(){
};
}
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_4f,_50){
with(_4f){
objj_msgSend(_4f,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_4f,"_updatePlaceholderState");
objj_msgSend(_4f,"setNeedsLayout");
var _51=objj_msgSend(_4f,"_inputElement");
objj_msgSend(_4f,"setObjectValue:",_51.value);
_6=YES;
_51.blur();
if(!_7){
_b();
}
_7=NO;
_6=NO;
if(_51.parentNode==_DOMElement){
_51.parentNode.removeChild(_51);
}
_8=NO;
if(document.attachEvent){
_9=nil;
_a=nil;
document.body.ondrag=_a;
document.body.onselectstart=_9;
}
objj_msgSend(_4f,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_4f,nil));
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_52,_53,_54){
with(_52){
if(objj_msgSend(_52,"isEditable")&&objj_msgSend(_52,"isEnabled")){
return objj_msgSend(objj_msgSend(_52,"window"),"makeFirstResponder:",_52);
}else{
return objj_msgSend(objj_msgSend(_52,"nextResponder"),"mouseDown:",_54);
}
}
}),new objj_method(sel_getUid("objectValue"),function(_55,_56){
with(_55){
return objj_msgSendSuper({receiver:_55,super_class:objj_getClass("CPControl")},"objectValue");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_57,_58,_59){
with(_57){
objj_msgSendSuper({receiver:_57,super_class:objj_getClass("CPControl")},"setObjectValue:",_59);
objj_msgSend(_57,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_5a,_5b){
with(_5a){
var _5c=objj_msgSend(_5a,"stringValue");
if((!_5c||_5c.length===0)&&!objj_msgSend(_5a,"hasThemeState:",CPThemeStateEditing)){
objj_msgSend(_5a,"setThemeState:",CPTextFieldStatePlaceholder);
}else{
objj_msgSend(_5a,"unsetThemeState:",CPTextFieldStatePlaceholder);
}
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_5d,_5e,_5f){
with(_5d){
if(_placeholderString===_5f){
return;
}
_placeholderString=_5f;
if(objj_msgSend(_5d,"hasThemeState:",CPTextFieldStatePlaceholder)){
objj_msgSend(_5d,"setNeedsLayout");
objj_msgSend(_5d,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_60,_61){
with(_60){
return _placeholderString;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_62,_63){
with(_62){
var _64=objj_msgSend((objj_msgSend(_62,"stringValue")||" "),"sizeWithFont:",objj_msgSend(_62,"currentValueForThemeAttribute:","font")),_65=objj_msgSend(_62,"currentValueForThemeAttribute:","content-inset"),_66=objj_msgSend(_62,"currentValueForThemeAttribute:","min-size"),_67=objj_msgSend(_62,"currentValueForThemeAttribute:","max-size");
_64.width=MAX(_64.width+_65.left+_65.right,_66.width);
_64.height=MAX(_64.height+_65.top+_65.bottom,_66.height);
if(_67.width>=0){
_64.width=MIN(_64.width,_67.width);
}
if(_67.height>=0){
_64.height=MIN(_64.height,_67.height);
}
if(objj_msgSend(_62,"isEditable")){
_64.width=CGRectGetWidth(objj_msgSend(_62,"frame"));
}
objj_msgSend(_62,"setFrameSize:",_64);
}
}),new objj_method(sel_getUid("selectText:"),function(_68,_69,_6a){
with(_68){
var _6b=objj_msgSend(_68,"_inputElement");
if(_6b.parentNode===_DOMElement&&(objj_msgSend(_68,"isEditable")||objj_msgSend(_68,"isSelectable"))){
window.setTimeout(function(){
_6b.select();
},0);
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_6c,_6d,_6e){
with(_6c){
var _6f=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_6f,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_6c);
objj_msgSend(_6f,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_6c);
objj_msgSend(_6f,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_6c);
}
_delegate=_6e;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_6f,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_6c);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_6f,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_6c);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_6f,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_6c);
}
}
}),new objj_method(sel_getUid("delegate"),function(_70,_71){
with(_70){
return _delegate;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_72,_73,_74){
with(_72){
var _75=objj_msgSend(_72,"currentValueForThemeAttribute:","content-inset");
if(!_75){
return _74;
}
_74.origin.x+=_75.left;
_74.origin.y+=_75.top;
_74.size.width-=_75.left+_75.right;
_74.size.height-=_75.top+_75.bottom;
return _74;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_76,_77,_78){
with(_76){
var _79=objj_msgSend(_76,"currentValueForThemeAttribute:","bezel-inset");
if(((_79).top===0&&(_79).right===0&&(_79).bottom===0&&(_79).left===0)){
return _78;
}
_78.origin.x+=_79.left;
_78.origin.y+=_79.top;
_78.size.width-=_79.left+_79.right;
_78.size.height-=_79.top+_79.bottom;
return _78;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_7a,_7b,_7c){
with(_7a){
if(_7c==="bezel-view"){
return objj_msgSend(_7a,"bezelRectForBounds:",objj_msgSend(_7a,"bounds"));
}else{
if(_7c==="content-view"){
return objj_msgSend(_7a,"contentRectForBounds:",objj_msgSend(_7a,"bounds"));
}
}
return objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_7c);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_7d,_7e,_7f){
with(_7d){
if(_7f==="bezel-view"){
var _80=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_80,"setHitTests:",NO);
return _80;
}else{
var _80=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
return _80;
}
return objj_msgSendSuper({receiver:_7d,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_7f);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_81,_82){
with(_81){
var _83=objj_msgSend(_81,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_83){
objj_msgSend(_83,"setBackgroundColor:",objj_msgSend(_81,"currentValueForThemeAttribute:","bezel-color"));
}
var _84=objj_msgSend(_81,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_84){
objj_msgSend(_84,"setHidden:",objj_msgSend(_81,"hasThemeState:",CPThemeStateEditing));
var _85="";
if(objj_msgSend(_81,"hasThemeState:",CPTextFieldStatePlaceholder)){
_85=objj_msgSend(_81,"placeholderString");
}else{
_85=objj_msgSend(_81,"stringValue");
if(objj_msgSend(_81,"isSecure")){
_85=_86(_85);
}
}
objj_msgSend(_84,"setText:",_85);
objj_msgSend(_84,"setTextColor:",objj_msgSend(_81,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_84,"setFont:",objj_msgSend(_81,"currentValueForThemeAttribute:","font"));
objj_msgSend(_84,"setAlignment:",objj_msgSend(_81,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_84,"setVerticalAlignment:",objj_msgSend(_81,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_84,"setLineBreakMode:",objj_msgSend(_81,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_84,"setTextShadowColor:",objj_msgSend(_81,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_84,"setTextShadowOffset:",objj_msgSend(_81,"currentValueForThemeAttribute:","text-shadow-offset"));
}
}
})]);
class_addMethods(_11,[new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:"),function(_87,_88,_89,_8a,_8b){
with(_87){
return objj_msgSend(_87,"textFieldWithStringValue:placeholder:width:theme:",_89,_8a,_8b,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:theme:"),function(_8c,_8d,_8e,_8f,_90,_91){
with(_8c){
var _92=objj_msgSend(objj_msgSend(_8c,"alloc"),"initWithFrame:",CGRectMake(0,0,_90,29));
objj_msgSend(_92,"setTheme:",_91);
objj_msgSend(_92,"setStringValue:",_8e);
objj_msgSend(_92,"setPlaceholderString:",_8f);
objj_msgSend(_92,"setBordered:",YES);
objj_msgSend(_92,"setBezeled:",YES);
objj_msgSend(_92,"setEditable:",YES);
objj_msgSend(_92,"sizeToFit");
return _92;
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:"),function(_93,_94,_95,_96,_97){
with(_93){
return objj_msgSend(_93,"roundedTextFieldWithStringValue:placeholder:width:theme:",_95,_96,_97,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:theme:"),function(_98,_99,_9a,_9b,_9c,_9d){
with(_98){
var _9e=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(0,0,_9c,29));
objj_msgSend(_9e,"setTheme:",_9d);
objj_msgSend(_9e,"setStringValue:",_9a);
objj_msgSend(_9e,"setPlaceholderString:",_9b);
objj_msgSend(_9e,"setBezelStyle:",CPTextFieldRoundedBezel);
objj_msgSend(_9e,"setBordered:",YES);
objj_msgSend(_9e,"setBezeled:",YES);
objj_msgSend(_9e,"setEditable:",YES);
objj_msgSend(_9e,"sizeToFit");
return _9e;
}
}),new objj_method(sel_getUid("labelWithTitle:"),function(_9f,_a0,_a1){
with(_9f){
return objj_msgSend(_9f,"labelWithTitle:theme:",_a1,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("labelWithTitle:theme:"),function(_a2,_a3,_a4,_a5){
with(_a2){
var _a6=objj_msgSend(objj_msgSend(_a2,"alloc"),"init");
objj_msgSend(_a6,"setStringValue:",_a4);
objj_msgSend(_a6,"sizeToFit");
return _a6;
}
}),new objj_method(sel_getUid("themeClass"),function(_a7,_a8){
with(_a7){
return "textfield";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_a9,_aa){
with(_a9){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(2),right:(2),bottom:(2),left:(2)},nil],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _86=function(_ab){
if(!_ab){
return "";
}
var _ac="",_ad=_ab.length;
while(_ad--){
_ac+=_f;
}
return _ac;
};
var _ae="CPTextFieldIsEditableKey",_af="CPTextFieldIsSelectableKey",_b0="CPTextFieldIsBorderedKey",_b1="CPTextFieldIsBezeledKey",_b2="CPTextFieldBezelStyleKey",_b3="CPTextFieldDrawsBackgroundKey",_b4="CPTextFieldLineBreakModeKey",_b5="CPTextFieldBackgroundColorKey",_b6="CPTextFieldPlaceholderStringKey";
var _10=objj_getClass("CPTextField");
if(!_10){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTextField\""));
}
var _11=_10.isa;
class_addMethods(_10,[new objj_method(sel_getUid("initWithCoder:"),function(_b7,_b8,_b9){
with(_b7){
_b7=objj_msgSendSuper({receiver:_b7,super_class:objj_getClass("CPControl")},"initWithCoder:",_b9);
if(_b7){
objj_msgSend(_b7,"setEditable:",objj_msgSend(_b9,"decodeBoolForKey:",_ae));
objj_msgSend(_b7,"setSelectable:",objj_msgSend(_b9,"decodeBoolForKey:",_af));
objj_msgSend(_b7,"setDrawsBackground:",objj_msgSend(_b9,"decodeBoolForKey:",_b3));
objj_msgSend(_b7,"setTextFieldBackgroundColor:",objj_msgSend(_b9,"decodeObjectForKey:",_b5));
objj_msgSend(_b7,"setPlaceholderString:",objj_msgSend(_b9,"decodeObjectForKey:",_b6));
}
return _b7;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_ba,_bb,_bc){
with(_ba){
objj_msgSendSuper({receiver:_ba,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_bc);
objj_msgSend(_bc,"encodeBool:forKey:",_isEditable,_ae);
objj_msgSend(_bc,"encodeBool:forKey:",_isSelectable,_af);
objj_msgSend(_bc,"encodeBool:forKey:",_drawsBackground,_b3);
objj_msgSend(_bc,"encodeObject:forKey:",_textFieldBackgroundColor,_b5);
objj_msgSend(_bc,"encodeObject:forKey:",_placeholderString,_b6);
}
})]);
