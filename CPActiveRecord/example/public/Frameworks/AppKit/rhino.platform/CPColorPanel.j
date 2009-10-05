i;10;CPButton.ji;10;CPCookie.ji;9;CPPanel.ji;8;CPView.jc;16229;
CPColorPanelColorDidChangeNotification="CPColorPanelColorDidChangeNotification";
var _1=20,_2=32,_3=14,_4=32,_5=12;
var _6=nil,_7=[];
CPWheelColorPickerMode=1;
CPSliderColorPickerMode=2;
CPColorPickerViewWidth=265,CPColorPickerViewHeight=370;
var _8=objj_allocateClassPair(CPPanel,"CPColorPanel"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_toolbar"),new objj_ivar("_swatchView"),new objj_ivar("_previewView"),new objj_ivar("_opacitySlider"),new objj_ivar("_colorPickers"),new objj_ivar("_currentView"),new objj_ivar("_activePicker"),new objj_ivar("_color"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_mode")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(_a,_b){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPPanel")},"initWithContentRect:styleMask:",CGRectMake(500,50,219,370),(CPTitledWindowMask|CPClosableWindowMask|CPResizableWindowMask));
if(_a){
objj_msgSend(objj_msgSend(_a,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.95,1));
objj_msgSend(_a,"setTitle:","Color Panel");
objj_msgSend(_a,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_a,"setFloatingPanel:",YES);
objj_msgSend(_a,"setBecomesKeyOnlyIfNeeded:",YES);
objj_msgSend(_a,"setMinSize:",CGSizeMake(219,342));
objj_msgSend(_a,"setMaxSize:",CGSizeMake(323,537));
}
return _a;
}
}),new objj_method(sel_getUid("setColor:"),function(_c,_d,_e){
with(_c){
_color=_e;
objj_msgSend(_previewView,"setBackgroundColor:",_color);
objj_msgSend(CPApp,"sendAction:to:from:",sel_getUid("changeColor:"),nil,_c);
if(_target&&_action){
objj_msgSend(CPApp,"sendAction:to:from:",_action,_target,_c);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPColorPanelColorDidChangeNotification,_c);
objj_msgSend(_activePicker,"setColor:",_color);
objj_msgSend(_opacitySlider,"setFloatValue:",objj_msgSend(_color,"alphaComponent"));
}
}),new objj_method(sel_getUid("setColor:updatePicker:"),function(_f,_10,_11,_12){
with(_f){
objj_msgSend(_f,"setColor:",_11);
if(_12){
objj_msgSend(_activePicker,"setColor:",_color);
}
}
}),new objj_method(sel_getUid("color"),function(_13,_14){
with(_13){
return _color;
}
}),new objj_method(sel_getUid("opacity"),function(_15,_16){
with(_15){
return objj_msgSend(_opacitySlider,"floatValue");
}
}),new objj_method(sel_getUid("setTarget:"),function(_17,_18,_19){
with(_17){
_target=_19;
}
}),new objj_method(sel_getUid("target"),function(_1a,_1b){
with(_1a){
return _target;
}
}),new objj_method(sel_getUid("setAction:"),function(_1c,_1d,_1e){
with(_1c){
_action=_1e;
}
}),new objj_method(sel_getUid("action"),function(_1f,_20){
with(_1f){
return _action;
}
}),new objj_method(sel_getUid("setMode:"),function(_21,_22,_23){
with(_21){
_mode=_23;
}
}),new objj_method(sel_getUid("_setPicker:"),function(_24,_25,_26){
with(_24){
var _27=_colorPickers[objj_msgSend(_26,"tag")],_28=objj_msgSend(_27,"provideNewView:",NO);
if(!_28){
_28=objj_msgSend(_27,"provideNewView:",YES);
}
if(_28==_currentView){
return;
}
if(_currentView){
objj_msgSend(_28,"setFrame:",objj_msgSend(_currentView,"frame"));
}else{
var _29=(_2+10+_1+5+_3+32),_2a=objj_msgSend(objj_msgSend(_24,"contentView"),"bounds");
objj_msgSend(_28,"setFrameSize:",CPSizeMake(_2a.size.width-10,_2a.size.height-_29));
objj_msgSend(_28,"setFrameOrigin:",CPPointMake(5,_29));
}
objj_msgSend(_currentView,"removeFromSuperview");
objj_msgSend(objj_msgSend(_24,"contentView"),"addSubview:",_28);
_currentView=_28;
_activePicker=_27;
objj_msgSend(_27,"setColor:",objj_msgSend(_24,"color"));
}
}),new objj_method(sel_getUid("mode"),function(_2b,_2c){
with(_2b){
return _mode;
}
}),new objj_method(sel_getUid("orderFront:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_2d,"_loadContentsIfNecessary");
objj_msgSendSuper({receiver:_2d,super_class:objj_getClass("CPPanel")},"orderFront:",_2f);
}
}),new objj_method(sel_getUid("_loadContentsIfNecessary"),function(_30,_31){
with(_30){
if(_toolbar){
return;
}
if(!_color){
_color=objj_msgSend(CPColor,"whiteColor");
}
_colorPickers=[];
var _32=objj_msgSend(_7,"count");
for(var i=0;i<_32;i++){
var _34=_7[i],_35=objj_msgSend(objj_msgSend(_34,"alloc"),"initWithPickerMask:colorPanel:",0,_30);
_colorPickers.push(_35);
}
var _36=objj_msgSend(_30,"contentView"),_37=objj_msgSend(_36,"bounds");
_toolbar=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,6,CGRectGetWidth(_37),_2));
objj_msgSend(_toolbar,"setAutoresizingMask:",CPViewWidthSizable);
var _38=_32*_4+(_32-1)*_5,_39=(CGRectGetWidth(_37)-_38)/2,_3a=nil;
for(var i=0;i<_32;i++){
var _3b=objj_msgSend(_colorPickers[i],"provideNewButtonImage"),_3c=objj_msgSend(_colorPickers[i],"provideNewAlternateButtonImage"),_3d=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(_39+i*(_4+_5),0,_4,_4));
objj_msgSend(_3d,"setTag:",i);
objj_msgSend(_3d,"setTarget:",_30);
objj_msgSend(_3d,"setAction:",sel_getUid("_setPicker:"));
objj_msgSend(_3d,"setBordered:",NO);
objj_msgSend(_3d,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_3d,"setImage:",_3b);
objj_msgSend(_3d,"setAlternateImage:",_3c);
objj_msgSend(_toolbar,"addSubview:",_3d);
if(!_3a){
_3a=_3d;
}
}
var _3e=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(76,_2+10,CGRectGetWidth(_37)-86,_1));
_previewView=objj_msgSend(objj_msgSend(_CPColorPanelPreview,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_3e,"bounds"),2,2));
objj_msgSend(_previewView,"setColorPanel:",_30);
objj_msgSend(_previewView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3e,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.8,1));
objj_msgSend(_3e,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3e,"addSubview:",_previewView);
var _3f=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(10,_2+10,60,15));
objj_msgSend(_3f,"setStringValue:","Preview:");
objj_msgSend(_3f,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_3f,"setAlignment:",CPRightTextAlignment);
var _40=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(76,_2+10+_1+5,CGRectGetWidth(_37)-86,_3+2));
objj_msgSend(_40,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.8,1));
objj_msgSend(_40,"setAutoresizingMask:",CPViewWidthSizable);
_swatchView=objj_msgSend(objj_msgSend(_CPColorPanelSwatches,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_40,"bounds"),1,1));
objj_msgSend(_swatchView,"setColorPanel:",_30);
objj_msgSend(_swatchView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_40,"addSubview:",_swatchView);
var _41=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(10,_2+8+_1+6,60,15));
objj_msgSend(_41,"setStringValue:","Swatches:");
objj_msgSend(_41,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_41,"setAlignment:",CPRightTextAlignment);
var _42=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(10,_2+_1+35,60,20));
objj_msgSend(_42,"setStringValue:","Opacity:");
objj_msgSend(_42,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_42,"setAlignment:",CPRightTextAlignment);
_opacitySlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CGRectMake(76,_2+_1+34,CGRectGetWidth(_37)-86,20));
objj_msgSend(_opacitySlider,"setMinValue:",0);
objj_msgSend(_opacitySlider,"setMaxValue:",1);
objj_msgSend(_opacitySlider,"setTarget:",_30);
objj_msgSend(_opacitySlider,"setAction:",sel_getUid("setOpacity:"));
objj_msgSend(_36,"addSubview:",_toolbar);
objj_msgSend(_36,"addSubview:",_3e);
objj_msgSend(_36,"addSubview:",_3f);
objj_msgSend(_36,"addSubview:",_40);
objj_msgSend(_36,"addSubview:",_41);
objj_msgSend(_36,"addSubview:",_42);
objj_msgSend(_36,"addSubview:",_opacitySlider);
_target=nil;
_action=nil;
_activePicker=nil;
objj_msgSend(_previewView,"setBackgroundColor:",_color);
if(_3a){
objj_msgSend(_30,"_setPicker:",_3a);
}
}
}),new objj_method(sel_getUid("setOpacity:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(objj_msgSend(_43,"color"),"components"),_47=objj_msgSend(_45,"floatValue");
objj_msgSend(_43,"setColor:updatePicker:",objj_msgSend(_color,"colorWithAlphaComponent:",_47),YES);
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("provideColorPickerClass:"),function(_48,_49,_4a){
with(_48){
_7.push(_4a);
}
}),new objj_method(sel_getUid("sharedColorPanel"),function(_4b,_4c){
with(_4b){
if(!_6){
_6=objj_msgSend(objj_msgSend(CPColorPanel,"alloc"),"init");
}
return _6;
}
}),new objj_method(sel_getUid("setPickerMode:"),function(_4d,_4e,_4f){
with(_4d){
var _50=objj_msgSend(CPColorPanel,"sharedColorPanel");
objj_msgSend(_50,"setMode:",_4f);
}
})]);
CPColorDragType="CPColorDragType";
var _51="CPColorPanelSwatchesCookie";
var _8=objj_allocateClassPair(CPView,"_CPColorPanelSwatches"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_swatches"),new objj_ivar("_dragColor"),new objj_ivar("_colorPanel"),new objj_ivar("_swatchCookie")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_52,_53,_54){
with(_52){
_52=objj_msgSendSuper({receiver:_52,super_class:objj_getClass("CPView")},"initWithFrame:",_54);
objj_msgSend(_52,"setBackgroundColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_52,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObjects:",CPColorDragType));
var _55=objj_msgSend(CPColor,"whiteColor");
_swatchCookie=objj_msgSend(objj_msgSend(CPCookie,"alloc"),"initWithName:",_51);
var _56=objj_msgSend(_52,"startingColorList");
_swatches=[];
for(var i=0;i<50;i++){
var _58=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(13*i+1,1,12,12)),_59=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_58,"bounds"),1,1));
objj_msgSend(_58,"setBackgroundColor:",_55);
objj_msgSend(_59,"setBackgroundColor:",(i<_56.length)?_56[i]:_55);
objj_msgSend(_58,"addSubview:",_59);
objj_msgSend(_52,"addSubview:",_58);
_swatches.push(_58);
}
return _52;
}
}),new objj_method(sel_getUid("isOpaque"),function(_5a,_5b){
with(_5a){
return YES;
}
}),new objj_method(sel_getUid("startingColorList"),function(_5c,_5d){
with(_5c){
var _5e=objj_msgSend(_swatchCookie,"value");
if(_5e==""){
return [objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPColor,"darkGrayColor"),objj_msgSend(CPColor,"grayColor"),objj_msgSend(CPColor,"lightGrayColor"),objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"redColor"),objj_msgSend(CPColor,"greenColor"),objj_msgSend(CPColor,"blueColor"),objj_msgSend(CPColor,"yellowColor")];
}
var _5e=eval(_5e);
var _5f=[];
for(var i=0;i<_5e.length;i++){
_5f.push(objj_msgSend(CPColor,"colorWithHexString:",_5e[i]));
}
return _5f;
}
}),new objj_method(sel_getUid("saveColorList"),function(_61,_62){
with(_61){
var _63=[];
for(var i=0;i<_swatches.length;i++){
_63.push(objj_msgSend(objj_msgSend(objj_msgSend(_swatches[i],"subviews")[0],"backgroundColor"),"hexString"));
}
var _65=new Date();
_65.setYear(2019);
objj_msgSend(_swatchCookie,"setValue:expires:domain:",JSON.stringify(_63),_65,nil);
}
}),new objj_method(sel_getUid("setColorPanel:"),function(_66,_67,_68){
with(_66){
_colorPanel=_68;
}
}),new objj_method(sel_getUid("colorPanel"),function(_69,_6a){
with(_69){
return _colorPanel;
}
}),new objj_method(sel_getUid("colorAtIndex:"),function(_6b,_6c,_6d){
with(_6b){
return objj_msgSend(objj_msgSend(_swatches[_6d],"subviews")[0],"backgroundColor");
}
}),new objj_method(sel_getUid("setColor:atIndex:"),function(_6e,_6f,_70,_71){
with(_6e){
objj_msgSend(objj_msgSend(_swatches[_71],"subviews")[0],"setBackgroundColor:",_70);
objj_msgSend(_6e,"saveColorList");
}
}),new objj_method(sel_getUid("mouseUp:"),function(_72,_73,_74){
with(_72){
var _75=objj_msgSend(_72,"convertPoint:fromView:",objj_msgSend(_74,"locationInWindow"),nil);
if(_75.x>objj_msgSend(_72,"bounds").size.width-1||_75.x<1){
return NO;
}
objj_msgSend(_colorPanel,"setColor:updatePicker:",objj_msgSend(_72,"colorAtIndex:",FLOOR(_75.x/13)),YES);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_76,_77,_78){
with(_76){
var _79=objj_msgSend(_76,"convertPoint:fromView:",objj_msgSend(_78,"locationInWindow"),nil);
if(_79.x>objj_msgSend(_76,"bounds").size.width-1||_79.x<1){
return NO;
}
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObject:",CPColorDragType),_76);
var _7a=_swatches[FLOOR(_79.x/13)];
_dragColor=objj_msgSend(objj_msgSend(_7a,"subviews")[0],"backgroundColor");
var _7b=CPRectCreateCopy(objj_msgSend(_7a,"bounds"));
var _7c=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_7b);
dragFillView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(_7b,1,1));
objj_msgSend(_7c,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(dragFillView,"setBackgroundColor:",_dragColor);
objj_msgSend(_7c,"addSubview:",dragFillView);
objj_msgSend(_76,"dragView:at:offset:event:pasteboard:source:slideBack:",_7c,CPPointMake(_79.x-_7b.size.width/2,_79.y-_7b.size.height/2),CPPointMake(0,0),_78,nil,_76,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_7d,_7e,_7f,_80){
with(_7d){
if(_80==CPColorDragType){
objj_msgSend(_7f,"setData:forType:",_dragColor,_80);
}
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_81,_82,_83){
with(_81){
var _84=objj_msgSend(_81,"convertPoint:fromView:",objj_msgSend(_83,"draggingLocation"),nil),_85=objj_msgSend(_83,"draggingPasteboard"),_86=nil;
if(!objj_msgSend(_85,"availableTypeFromArray:",[CPColorDragType])||_84.x>objj_msgSend(_81,"bounds").size.width-1||_84.x<1){
return NO;
}
objj_msgSend(_81,"setColor:atIndex:",objj_msgSend(_85,"dataForType:",CPColorDragType),FLOOR(_84.x/13));
}
})]);
var _8=objj_allocateClassPair(CPView,"_CPColorPanelPreview"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_colorPanel")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_87,_88,_89){
with(_87){
_87=objj_msgSendSuper({receiver:_87,super_class:objj_getClass("CPView")},"initWithFrame:",_89);
objj_msgSend(_87,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObjects:",CPColorDragType));
return _87;
}
}),new objj_method(sel_getUid("setColorPanel:"),function(_8a,_8b,_8c){
with(_8a){
_colorPanel=_8c;
}
}),new objj_method(sel_getUid("colorPanel"),function(_8d,_8e){
with(_8d){
return _colorPanel;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_8f,_90,_91){
with(_8f){
var _92=objj_msgSend(_91,"draggingPasteboard");
if(!objj_msgSend(_92,"availableTypeFromArray:",[CPColorDragType])){
return NO;
}
var _93=objj_msgSend(_92,"dataForType:",CPColorDragType);
objj_msgSend(_colorPanel,"setColor:updatePicker:",_93,YES);
}
}),new objj_method(sel_getUid("isOpaque"),function(_94,_95){
with(_94){
return YES;
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_96,_97,_98){
with(_96){
var _99=objj_msgSend(_96,"convertPoint:fromView:",objj_msgSend(_98,"locationInWindow"),nil);
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObject:",CPColorDragType),_96);
var _9a=CPRectMake(0,0,15,15);
var _9b=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_9a);
dragFillView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(_9a,1,1));
objj_msgSend(_9b,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(dragFillView,"setBackgroundColor:",objj_msgSend(_96,"backgroundColor"));
objj_msgSend(_9b,"addSubview:",dragFillView);
objj_msgSend(_96,"dragView:at:offset:event:pasteboard:source:slideBack:",_9b,CPPointMake(_99.x-_9a.size.width/2,_99.y-_9a.size.height/2),CPPointMake(0,0),_98,nil,_96,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_9c,_9d,_9e,_9f){
with(_9c){
if(_9f==CPColorDragType){
objj_msgSend(_9e,"setData:forType:",objj_msgSend(_9c,"backgroundColor"),_9f);
}
}
})]);
i;15;CPColorPicker.ji;21;CPSliderColorPicker.jc;155;
objj_msgSend(CPColorPanel,"provideColorPickerClass:",CPColorWheelColorPicker);
objj_msgSend(CPColorPanel,"provideColorPickerClass:",CPSliderColorPicker);
