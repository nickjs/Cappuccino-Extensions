I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;22;AppKit/CPApplication.jI;17;AppKit/CPButton.jI;16;AppKit/CPColor.jI;15;AppKit/CPFont.jI;16;AppKit/CPImage.jI;20;AppKit/CPImageView.jI;16;AppKit/CPPanel.jI;20;AppKit/CPTextField.jc;5572;
CPWarningAlertStyle=0;
CPInformationalAlertStyle=1;
CPCriticalAlertStyle=2;
var _1,_2,_3;
var _4=objj_allocateClassPair(CPObject,"CPAlert"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_alertPanel"),new objj_ivar("_messageLabel"),new objj_ivar("_alertImageView"),new objj_ivar("_alertStyle"),new objj_ivar("_windowTitle"),new objj_ivar("_windowStyle"),new objj_ivar("_buttonCount"),new objj_ivar("_buttons"),new objj_ivar("_delegate")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("init"),function(_6,_7){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPObject")},"init");
if(_6){
_buttonCount=0;
_buttons=objj_msgSend(CPArray,"array");
_alertStyle=CPWarningAlertStyle;
_messageLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(57,10,220,80));
objj_msgSend(_messageLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_messageLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_messageLabel,"setAlignment:",CPJustifiedTextAlignment);
_alertImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(15,12,32,32));
objj_msgSend(_6,"setWindowStyle:",nil);
}
return _6;
}
}),new objj_method(sel_getUid("setWindowStyle:"),function(_8,_9,_a){
with(_8){
_windowStyle=_a;
_alertPanel=objj_msgSend(objj_msgSend(CPPanel,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,300,130),_a?_a|CPTitledWindowMask:CPTitledWindowMask);
objj_msgSend(_alertPanel,"setFloatingPanel:",YES);
objj_msgSend(_alertPanel,"center");
objj_msgSend(_messageLabel,"setTextColor:",(_a==CPHUDBackgroundWindowMask)?objj_msgSend(CPColor,"whiteColor"):objj_msgSend(CPColor,"blackColor"));
var _b=objj_msgSend(_buttons,"count");
for(var i=0;i<_b;i++){
var _d=_buttons[i];
objj_msgSend(_d,"setFrameSize:",CGSizeMake(objj_msgSend(_d,"frame").size.width,(_a==CPHUDBackgroundWindowMask)?20:24));
objj_msgSend(_d,"setBezelStyle:",(_a==CPHUDBackgroundWindowMask)?CPHUDBezelStyle:CPRoundedBezelStyle);
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_d);
}
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_messageLabel);
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_alertImageView);
}
}),new objj_method(sel_getUid("setTitle:"),function(_e,_f,_10){
with(_e){
_windowTitle=_10;
}
}),new objj_method(sel_getUid("title"),function(_11,_12){
with(_11){
return _windowTitle;
}
}),new objj_method(sel_getUid("windowStyle"),function(_13,_14){
with(_13){
return _windowStyle;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_15,_16,_17){
with(_15){
_delegate=_17;
}
}),new objj_method(sel_getUid("delegate"),function(_18,_19){
with(_18){
return _delegate;
}
}),new objj_method(sel_getUid("setAlertStyle:"),function(_1a,_1b,_1c){
with(_1a){
_alertStyle=_1c;
}
}),new objj_method(sel_getUid("alertStyle"),function(_1d,_1e){
with(_1d){
return _alertStyle;
}
}),new objj_method(sel_getUid("setMessageText:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_messageLabel,"setStringValue:",_21);
}
}),new objj_method(sel_getUid("messageText"),function(_22,_23){
with(_22){
return objj_msgSend(_messageLabel,"stringValue");
}
}),new objj_method(sel_getUid("addButtonWithTitle:"),function(_24,_25,_26){
with(_24){
var _27=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(200-(_buttonCount*90),98,80,(_windowStyle==CPHUDBackgroundWindowMask)?20:24));
objj_msgSend(_27,"setTitle:",_26);
objj_msgSend(_27,"setTarget:",_24);
objj_msgSend(_27,"setTag:",_buttonCount);
objj_msgSend(_27,"setAction:",sel_getUid("_notifyDelegate:"));
objj_msgSend(_27,"setBezelStyle:",(_windowStyle==CPHUDBackgroundWindowMask)?CPHUDBezelStyle:CPRoundRectBezelStyle);
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_27);
if(_buttonCount==0){
objj_msgSend(_alertPanel,"setDefaultButton:",_27);
}
_buttonCount++;
objj_msgSend(_buttons,"addObject:",_27);
}
}),new objj_method(sel_getUid("runModal"),function(_28,_29){
with(_28){
var _2a;
switch(_alertStyle){
case CPWarningAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_1);
_2a="Warning";
break;
case CPInformationalAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_2);
_2a="Information";
break;
case CPCriticalAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_3);
_2a="Error";
break;
}
objj_msgSend(_alertPanel,"setTitle:",_windowTitle?_windowTitle:_2a);
objj_msgSend(CPApp,"runModalForWindow:",_alertPanel);
}
}),new objj_method(sel_getUid("_notifyDelegate:"),function(_2b,_2c,_2d){
with(_2b){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("alertDidEnd:returnCode:"))){
objj_msgSend(_delegate,"alertDidEnd:returnCode:",_2b,objj_msgSend(_2d,"tag"));
}
objj_msgSend(CPApp,"abortModal");
objj_msgSend(_alertPanel,"close");
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_2e,_2f){
with(_2e){
if(_2e!=CPAlert){
return;
}
var _30=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_2e,"class"));
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","CPAlert/dialog-warning.png"),CGSizeMake(32,32));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","CPAlert/dialog-information.png"),CGSizeMake(32,32));
_3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_30,"pathForResource:","CPAlert/dialog-error.png"),CGSizeMake(32,32));
}
})]);
