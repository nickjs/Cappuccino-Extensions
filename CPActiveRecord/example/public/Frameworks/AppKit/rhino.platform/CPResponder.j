I;21;Foundation/CPObject.jc;5749;
CPDeleteKeyCode=8;
CPTabKeyCode=9;
CPReturnKeyCode=13;
CPEscapeKeyCode=27;
CPLeftArrowKeyCode=37;
CPUpArrowKeyCode=38;
CPRightArrowKeyCode=39;
CPDownArrowKeyCode=40;
var _1=objj_allocateClassPair(CPObject,"CPResponder"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_menu"),new objj_ivar("_nextResponder")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("acceptsFirstResponder"),function(_3,_4){
with(_3){
return NO;
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_5,_6){
with(_5){
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_7,_8){
with(_7){
return YES;
}
}),new objj_method(sel_getUid("setNextResponder:"),function(_9,_a,_b){
with(_9){
_nextResponder=_b;
}
}),new objj_method(sel_getUid("nextResponder"),function(_c,_d){
with(_c){
return _nextResponder;
}
}),new objj_method(sel_getUid("interpretKeyEvents:"),function(_e,_f,_10){
with(_e){
var _11=0,_12=objj_msgSend(_10,"count");
for(;_11<_12;++_11){
var _13=_10[_11];
switch(objj_msgSend(_13,"keyCode")){
case CPLeftArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveLeft:"));
break;
case CPRightArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveRight:"));
break;
case CPUpArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveUp:"));
break;
case CPDownArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveDown:"));
break;
case CPDeleteKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("deleteBackward:"));
break;
case CPReturnKeyCode:
case 3:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("insertLineBreak:"));
break;
case CPEscapeKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("cancel:"));
break;
case CPTabKeyCode:
var _14=objj_msgSend(_13,"modifierFlags")&CPShiftKeyMask;
if(!_14){
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("insertTab:"));
}else{
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("insertBackTab:"));
}
break;
default:
objj_msgSend(_e,"insertText:",objj_msgSend(_13,"characters"));
}
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_nextResponder,"performSelector:withObject:",_16,_17);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_nextResponder,"performSelector:withObject:",_19,_1a);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_nextResponder,"performSelector:withObject:",_1c,_1d);
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_nextResponder,"performSelector:withObject:",_1f,_20);
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_nextResponder,"performSelector:withObject:",_22,_23);
}
}),new objj_method(sel_getUid("mouseExited:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_nextResponder,"performSelector:withObject:",_25,_26);
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_nextResponder,"performSelector:withObject:",_28,_29);
}
}),new objj_method(sel_getUid("keyDown:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_nextResponder,"performSelector:withObject:",_2b,_2c);
}
}),new objj_method(sel_getUid("keyUp:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_nextResponder,"performSelector:withObject:",_2e,_2f);
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_30,_31,_32){
with(_30){
return NO;
}
}),new objj_method(sel_getUid("insertLineBreak:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_33,"insertNewline:",_35);
}
}),new objj_method(sel_getUid("insertNewline:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_36,"insertNewline:",_38);
}
}),new objj_method(sel_getUid("cancel:"),function(_39,_3a,_3b){
with(_39){
}
}),new objj_method(sel_getUid("insertTab:"),function(_3c,_3d,_3e){
with(_3c){
}
}),new objj_method(sel_getUid("insertBackTab:"),function(_3f,_40,_41){
with(_3f){
}
}),new objj_method(sel_getUid("insertText:"),function(_42,_43,_44){
with(_42){
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_45,_46,_47){
with(_45){
if(objj_msgSend(_45,"respondsToSelector:",_47)){
objj_msgSend(_45,"performSelector:",_47);
}else{
objj_msgSend(_nextResponder,"doCommandBySelector:",_47);
}
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_48,_49,_4a,_4b){
with(_48){
if(objj_msgSend(_48,"respondsToSelector:",_4a)){
objj_msgSend(_48,"performSelector:withObject:",_4a,_4b);
return YES;
}
return objj_msgSend(_nextResponder,"tryToPerform:with:",_4a,_4b);
}
}),new objj_method(sel_getUid("setMenu:"),function(_4c,_4d,_4e){
with(_4c){
_menu=_4e;
}
}),new objj_method(sel_getUid("menu"),function(_4f,_50){
with(_4f){
return _menu;
}
}),new objj_method(sel_getUid("undoManager"),function(_51,_52){
with(_51){
return objj_msgSend(_nextResponder,"performSelector:",_52);
}
}),new objj_method(sel_getUid("noResponderFor:"),function(_53,_54,_55){
with(_53){
}
})]);
var _56="CPResponderNextResponderKey";
var _1=objj_getClass("CPResponder");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPResponder\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_57,_58,_59){
with(_57){
_57=objj_msgSendSuper({receiver:_57,super_class:objj_getClass("CPObject")},"init");
if(_57){
_nextResponder=objj_msgSend(_59,"decodeObjectForKey:",_56);
}
return _57;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5a,_5b,_5c){
with(_5a){
if(_nextResponder!==nil){
objj_msgSend(_5c,"encodeConditionalObject:forKey:",_nextResponder,_56);
}
}
})]);
