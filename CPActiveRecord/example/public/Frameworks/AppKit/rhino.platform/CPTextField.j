i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.jc;16048;
CPLineBreakByWordWrapping=0;
CPLineBreakByCharWrapping=1;
CPLineBreakByClipping=2;
CPLineBreakByTruncatingHead=3;
CPLineBreakByTruncatingTail=4;
CPLineBreakByTruncatingMiddle=5;
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
var _1="‚Ä¢";
var _2=objj_getClass("CPString");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("string"),function(_4,_5){
with(_4){
return _4;
}
})]);
CPTextFieldStateRounded=CPThemeState("rounded");
CPTextFieldStatePlaceholder=CPThemeState("placeholder");
var _2=objj_allocateClassPair(CPControl,"CPTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isSecure"),new objj_ivar("_drawsBackground"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_delegate"),new objj_ivar("_textDidChangeValue"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPControl")},"initWithFrame:",_8);
if(_6){
objj_msgSend(_6,"setStringValue:","");
objj_msgSend(_6,"setPlaceholderString:","");
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
objj_msgSend(_6,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
}
return _6;
}
}),new objj_method(sel_getUid("setEditable:"),function(_9,_a,_b){
with(_9){
_isEditable=_b;
}
}),new objj_method(sel_getUid("isEditable"),function(_c,_d){
with(_c){
return _isEditable;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_e,_f,_10){
with(_e){
_isSelectable=_10;
}
}),new objj_method(sel_getUid("isSelectable"),function(_11,_12){
with(_11){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSecure:"),function(_13,_14,_15){
with(_13){
_isSecure=_15;
}
}),new objj_method(sel_getUid("isSecure"),function(_16,_17){
with(_16){
return _isSecure;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_18,_19,_1a){
with(_18){
if(_1a){
objj_msgSend(_18,"setThemeState:",CPThemeStateBezeled);
}else{
objj_msgSend(_18,"unsetThemeState:",CPThemeStateBezeled);
}
}
}),new objj_method(sel_getUid("isBezeled"),function(_1b,_1c){
with(_1b){
return objj_msgSend(_1b,"hasThemeState:",CPThemeStateBezeled);
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_1d,_1e,_1f){
with(_1d){
var _20=_1f===CPTextFieldRoundedBezel;
if(_20){
objj_msgSend(_1d,"setThemeState:",CPTextFieldStateRounded);
}else{
objj_msgSend(_1d,"unsetThemeState:",CPTextFieldStateRounded);
}
}
}),new objj_method(sel_getUid("bezelStyle"),function(_21,_22){
with(_21){
if(objj_msgSend(_21,"hasThemeState:",CPTextFieldStateRounded)){
return CPTextFieldRoundedBezel;
}
return CPTextFieldSquareBezel;
}
}),new objj_method(sel_getUid("setBordered:"),function(_23,_24,_25){
with(_23){
if(_25){
objj_msgSend(_23,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_23,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_26,_27){
with(_26){
return objj_msgSend(_26,"hasThemeState:",CPThemeStateBordered);
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_28,_29,_2a){
with(_28){
if(_drawsBackground==_2a){
return;
}
_drawsBackground=_2a;
objj_msgSend(_28,"setNeedsLayout");
objj_msgSend(_28,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawsBackground"),function(_2b,_2c){
with(_2b){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_2d,_2e,_2f){
with(_2d){
if(_textFieldBackgroundColor==_2f){
return;
}
_textFieldBackgroundColor=_2f;
objj_msgSend(_2d,"setNeedsLayout");
objj_msgSend(_2d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_30,_31){
with(_30){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_32,_33){
with(_32){
return objj_msgSend(_32,"isEditable")&&objj_msgSend(_32,"isEnabled");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_34,_35){
with(_34){
if(CPTextFieldInputOwner&&objj_msgSend(CPTextFieldInputOwner,"window")!==objj_msgSend(_34,"window")){
objj_msgSend(objj_msgSend(CPTextFieldInputOwner,"window"),"makeFirstResponder:",nil);
}
objj_msgSend(_34,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_34,"_updatePlaceholderState");
objj_msgSend(_34,"setNeedsLayout");
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_36,_37){
with(_36){
objj_msgSend(_36,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_36,"_updatePlaceholderState");
objj_msgSend(_36,"setNeedsLayout");
objj_msgSend(_36,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_36,nil));
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_38,_39,_3a){
with(_38){
if(objj_msgSend(_38,"isEditable")&&objj_msgSend(_38,"isEnabled")){
return objj_msgSend(objj_msgSend(_38,"window"),"makeFirstResponder:",_38);
}else{
return objj_msgSend(objj_msgSend(_38,"nextResponder"),"mouseDown:",_3a);
}
}
}),new objj_method(sel_getUid("objectValue"),function(_3b,_3c){
with(_3b){
return objj_msgSendSuper({receiver:_3b,super_class:objj_getClass("CPControl")},"objectValue");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSendSuper({receiver:_3d,super_class:objj_getClass("CPControl")},"setObjectValue:",_3f);
objj_msgSend(_3d,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_40,_41){
with(_40){
var _42=objj_msgSend(_40,"stringValue");
if((!_42||_42.length===0)&&!objj_msgSend(_40,"hasThemeState:",CPThemeStateEditing)){
objj_msgSend(_40,"setThemeState:",CPTextFieldStatePlaceholder);
}else{
objj_msgSend(_40,"unsetThemeState:",CPTextFieldStatePlaceholder);
}
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_43,_44,_45){
with(_43){
if(_placeholderString===_45){
return;
}
_placeholderString=_45;
if(objj_msgSend(_43,"hasThemeState:",CPTextFieldStatePlaceholder)){
objj_msgSend(_43,"setNeedsLayout");
objj_msgSend(_43,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_46,_47){
with(_46){
return _placeholderString;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_48,_49){
with(_48){
var _4a=objj_msgSend((objj_msgSend(_48,"stringValue")||" "),"sizeWithFont:",objj_msgSend(_48,"currentValueForThemeAttribute:","font")),_4b=objj_msgSend(_48,"currentValueForThemeAttribute:","content-inset"),_4c=objj_msgSend(_48,"currentValueForThemeAttribute:","min-size"),_4d=objj_msgSend(_48,"currentValueForThemeAttribute:","max-size");
_4a.width=MAX(_4a.width+_4b.left+_4b.right,_4c.width);
_4a.height=MAX(_4a.height+_4b.top+_4b.bottom,_4c.height);
if(_4d.width>=0){
_4a.width=MIN(_4a.width,_4d.width);
}
if(_4d.height>=0){
_4a.height=MIN(_4a.height,_4d.height);
}
if(objj_msgSend(_48,"isEditable")){
_4a.width=CGRectGetWidth(objj_msgSend(_48,"frame"));
}
objj_msgSend(_48,"setFrameSize:",_4a);
}
}),new objj_method(sel_getUid("selectText:"),function(_4e,_4f,_50){
with(_4e){
}
}),new objj_method(sel_getUid("setDelegate:"),function(_51,_52,_53){
with(_51){
var _54=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_54,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_51);
objj_msgSend(_54,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_51);
objj_msgSend(_54,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_51);
}
_delegate=_53;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_54,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_51);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_54,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_51);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_54,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_51);
}
}
}),new objj_method(sel_getUid("delegate"),function(_55,_56){
with(_55){
return _delegate;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_57,_58,_59){
with(_57){
var _5a=objj_msgSend(_57,"currentValueForThemeAttribute:","content-inset");
if(!_5a){
return _59;
}
_59.origin.x+=_5a.left;
_59.origin.y+=_5a.top;
_59.size.width-=_5a.left+_5a.right;
_59.size.height-=_5a.top+_5a.bottom;
return _59;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_5b,_5c,_5d){
with(_5b){
var _5e=objj_msgSend(_5b,"currentValueForThemeAttribute:","bezel-inset");
if(((_5e).top===0&&(_5e).right===0&&(_5e).bottom===0&&(_5e).left===0)){
return _5d;
}
_5d.origin.x+=_5e.left;
_5d.origin.y+=_5e.top;
_5d.size.width-=_5e.left+_5e.right;
_5d.size.height-=_5e.top+_5e.bottom;
return _5d;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_5f,_60,_61){
with(_5f){
if(_61==="bezel-view"){
return objj_msgSend(_5f,"bezelRectForBounds:",objj_msgSend(_5f,"bounds"));
}else{
if(_61==="content-view"){
return objj_msgSend(_5f,"contentRectForBounds:",objj_msgSend(_5f,"bounds"));
}
}
return objj_msgSendSuper({receiver:_5f,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_61);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_62,_63,_64){
with(_62){
if(_64==="bezel-view"){
var _65=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_65,"setHitTests:",NO);
return _65;
}else{
var _65=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
return _65;
}
return objj_msgSendSuper({receiver:_62,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_64);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_66,_67){
with(_66){
var _68=objj_msgSend(_66,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_68){
objj_msgSend(_68,"setBackgroundColor:",objj_msgSend(_66,"currentValueForThemeAttribute:","bezel-color"));
}
var _69=objj_msgSend(_66,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_69){
objj_msgSend(_69,"setHidden:",objj_msgSend(_66,"hasThemeState:",CPThemeStateEditing));
var _6a="";
if(objj_msgSend(_66,"hasThemeState:",CPTextFieldStatePlaceholder)){
_6a=objj_msgSend(_66,"placeholderString");
}else{
_6a=objj_msgSend(_66,"stringValue");
if(objj_msgSend(_66,"isSecure")){
_6a=_6b(_6a);
}
}
objj_msgSend(_69,"setText:",_6a);
objj_msgSend(_69,"setTextColor:",objj_msgSend(_66,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_69,"setFont:",objj_msgSend(_66,"currentValueForThemeAttribute:","font"));
objj_msgSend(_69,"setAlignment:",objj_msgSend(_66,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_69,"setVerticalAlignment:",objj_msgSend(_66,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_69,"setLineBreakMode:",objj_msgSend(_66,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_69,"setTextShadowColor:",objj_msgSend(_66,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_69,"setTextShadowOffset:",objj_msgSend(_66,"currentValueForThemeAttribute:","text-shadow-offset"));
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:"),function(_6c,_6d,_6e,_6f,_70){
with(_6c){
return objj_msgSend(_6c,"textFieldWithStringValue:placeholder:width:theme:",_6e,_6f,_70,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:theme:"),function(_71,_72,_73,_74,_75,_76){
with(_71){
var _77=objj_msgSend(objj_msgSend(_71,"alloc"),"initWithFrame:",CGRectMake(0,0,_75,29));
objj_msgSend(_77,"setTheme:",_76);
objj_msgSend(_77,"setStringValue:",_73);
objj_msgSend(_77,"setPlaceholderString:",_74);
objj_msgSend(_77,"setBordered:",YES);
objj_msgSend(_77,"setBezeled:",YES);
objj_msgSend(_77,"setEditable:",YES);
objj_msgSend(_77,"sizeToFit");
return _77;
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:"),function(_78,_79,_7a,_7b,_7c){
with(_78){
return objj_msgSend(_78,"roundedTextFieldWithStringValue:placeholder:width:theme:",_7a,_7b,_7c,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:theme:"),function(_7d,_7e,_7f,_80,_81,_82){
with(_7d){
var _83=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(0,0,_81,29));
objj_msgSend(_83,"setTheme:",_82);
objj_msgSend(_83,"setStringValue:",_7f);
objj_msgSend(_83,"setPlaceholderString:",_80);
objj_msgSend(_83,"setBezelStyle:",CPTextFieldRoundedBezel);
objj_msgSend(_83,"setBordered:",YES);
objj_msgSend(_83,"setBezeled:",YES);
objj_msgSend(_83,"setEditable:",YES);
objj_msgSend(_83,"sizeToFit");
return _83;
}
}),new objj_method(sel_getUid("labelWithTitle:"),function(_84,_85,_86){
with(_84){
return objj_msgSend(_84,"labelWithTitle:theme:",_86,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("labelWithTitle:theme:"),function(_87,_88,_89,_8a){
with(_87){
var _8b=objj_msgSend(objj_msgSend(_87,"alloc"),"init");
objj_msgSend(_8b,"setStringValue:",_89);
objj_msgSend(_8b,"sizeToFit");
return _8b;
}
}),new objj_method(sel_getUid("themeClass"),function(_8c,_8d){
with(_8c){
return "textfield";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_8e,_8f){
with(_8e){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(2),right:(2),bottom:(2),left:(2)},nil],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _6b=function(_90){
if(!_90){
return "";
}
var _91="",_92=_90.length;
while(_92--){
_91+=_1;
}
return _91;
};
var _93="CPTextFieldIsEditableKey",_94="CPTextFieldIsSelectableKey",_95="CPTextFieldIsBorderedKey",_96="CPTextFieldIsBezeledKey",_97="CPTextFieldBezelStyleKey",_98="CPTextFieldDrawsBackgroundKey",_99="CPTextFieldLineBreakModeKey",_9a="CPTextFieldBackgroundColorKey",_9b="CPTextFieldPlaceholderStringKey";
var _2=objj_getClass("CPTextField");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTextField\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_9c,_9d,_9e){
with(_9c){
_9c=objj_msgSendSuper({receiver:_9c,super_class:objj_getClass("CPControl")},"initWithCoder:",_9e);
if(_9c){
objj_msgSend(_9c,"setEditable:",objj_msgSend(_9e,"decodeBoolForKey:",_93));
objj_msgSend(_9c,"setSelectable:",objj_msgSend(_9e,"decodeBoolForKey:",_94));
objj_msgSend(_9c,"setDrawsBackground:",objj_msgSend(_9e,"decodeBoolForKey:",_98));
objj_msgSend(_9c,"setTextFieldBackgroundColor:",objj_msgSend(_9e,"decodeObjectForKey:",_9a));
objj_msgSend(_9c,"setPlaceholderString:",objj_msgSend(_9e,"decodeObjectForKey:",_9b));
}
return _9c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_9f,_a0,_a1){
with(_9f){
objj_msgSendSuper({receiver:_9f,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_a1);
objj_msgSend(_a1,"encodeBool:forKey:",_isEditable,_93);
objj_msgSend(_a1,"encodeBool:forKey:",_isSelectable,_94);
objj_msgSend(_a1,"encodeBool:forKey:",_drawsBackground,_98);
objj_msgSend(_a1,"encodeObject:forKey:",_textFieldBackgroundColor,_9a);
objj_msgSend(_a1,"encodeObject:forKey:",_placeholderString,_9b);
}
})]);
