i;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.jc;15891;
CPScaleProportionally=0;
CPScaleToFit=1;
CPScaleNone=2;
CPNoImage=0;
CPImageOnly=1;
CPImageLeft=2;
CPImageRight=3;
CPImageBelow=4;
CPImageAbove=5;
CPImageOverlaps=6;
CPOnState=1;
CPOffState=0;
CPMixedState=-1;
CPRoundedBezelStyle=1;
CPRegularSquareBezelStyle=2;
CPThickSquareBezelStyle=3;
CPThickerSquareBezelStyle=4;
CPDisclosureBezelStyle=5;
CPShadowlessSquareBezelStyle=6;
CPCircularBezelStyle=7;
CPTexturedSquareBezelStyle=8;
CPHelpButtonBezelStyle=9;
CPSmallSquareBezelStyle=10;
CPTexturedRoundedBezelStyle=11;
CPRoundRectBezelStyle=12;
CPRecessedBezelStyle=13;
CPRoundedDisclosureBezelStyle=14;
CPHUDBezelStyle=-1;
CPMomentaryLightButton=0;
CPPushOnPushOffButton=1;
CPToggleButton=2;
CPSwitchButton=3;
CPRadioButton=4;
CPMomentaryChangeButton=5;
CPOnOffButton=6;
CPMomentaryPushInButton=7;
CPMomentaryPushButton=0;
CPMomentaryLight=7;
CPNoButtonMask=0;
CPContentsButtonMask=1;
CPPushInButtonMask=2;
CPGrayButtonMask=4;
CPBackgroundButtonMask=8;
CPNoCellMask=CPNoButtonMask;
CPContentsCellMask=CPContentsButtonMask;
CPPushInCellMask=CPPushInButtonMask;
CPChangeGrayCellMask=CPGrayButtonMask;
CPChangeBackgroundCellMask=CPBackgroundButtonMask;
CPButtonStateMixed=CPThemeState("mixed");
var _1=objj_allocateClassPair(CPControl,"CPButton"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_allowsMixedState"),new objj_ivar("_title"),new objj_ivar("_alternateTitle"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_showsStateBy"),new objj_ivar("_highlightsBy"),new objj_ivar("_imageDimsWhenDisabled"),new objj_ivar("_bezelStyle"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setValue:forThemeAttribute:",CPCenterTextAlignment,"alignment");
objj_msgSend(_3,"setValue:forThemeAttribute:",CPCenterVerticalTextAlignment,"vertical-alignment");
objj_msgSend(_3,"setValue:forThemeAttribute:",CPImageLeft,"image-position");
objj_msgSend(_3,"setValue:forThemeAttribute:",CPScaleNone,"image-scaling");
_controlSize=CPRegularControlSize;
objj_msgSend(_3,"setBordered:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("allowsMixedState"),function(_6,_7){
with(_6){
return _allowsMixedState;
}
}),new objj_method(sel_getUid("setAllowsMixedState:"),function(_8,_9,_a){
with(_8){
_a=!!_a;
if(_allowsMixedState===_a){
return;
}
_allowsMixedState=_a;
if(!_allowsMixedState){
objj_msgSend(_8,"unsetThemeState:",CPButtonStateMixed);
}
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_b,_c,_d){
with(_b){
if(!_d||_d===""||(objj_msgSend(_d,"intValue")===0)){
_d=CPOffState;
}else{
if(!objj_msgSend(_d,"isKindOfClass:",objj_msgSend(CPNumber,"class"))){
_d=CPOnState;
}else{
if(_d>CPOnState){
_d=CPOnState;
}else{
if(_d<CPOffState){
if(objj_msgSend(_b,"allowsMixedState")){
_d=CPMixedState;
}else{
_d=CPOnState;
}
}
}
}
}
objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPControl")},"setObjectValue:",_d);
switch(objj_msgSend(_b,"objectValue")){
case CPMixedState:
objj_msgSend(_b,"unsetThemeState:",CPThemeStateSelected);
objj_msgSend(_b,"setThemeState:",CPButtonStateMixed);
break;
case CPOnState:
objj_msgSend(_b,"unsetThemeState:",CPButtonStateMixed);
objj_msgSend(_b,"setThemeState:",CPThemeStateSelected);
break;
case CPOffState:
objj_msgSend(_b,"unsetThemeState:",CPThemeStateSelected|CPButtonStateMixed);
}
}
}),new objj_method(sel_getUid("nextState"),function(_e,_f){
with(_e){
if(objj_msgSend(_e,"allowsMixedState")){
var _10=objj_msgSend(_e,"state");
return _10-((_10===-1)?-2:1);
}
return 1-objj_msgSend(_e,"state");
}
}),new objj_method(sel_getUid("setNextState"),function(_11,_12){
with(_11){
objj_msgSend(_11,"setState:",objj_msgSend(_11,"nextState"));
}
}),new objj_method(sel_getUid("setState:"),function(_13,_14,_15){
with(_13){
objj_msgSend(_13,"setIntValue:",_15);
}
}),new objj_method(sel_getUid("state"),function(_16,_17){
with(_16){
return objj_msgSend(_16,"intValue");
}
}),new objj_method(sel_getUid("setTitle:"),function(_18,_19,_1a){
with(_18){
if(_title===_1a){
return;
}
_title=_1a;
objj_msgSend(_18,"setNeedsLayout");
objj_msgSend(_18,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("title"),function(_1b,_1c){
with(_1b){
return _title;
}
}),new objj_method(sel_getUid("setAlternateTitle:"),function(_1d,_1e,_1f){
with(_1d){
if(_alternateTitle===_1f){
return;
}
_alternateTitle=_1f;
objj_msgSend(_1d,"setNeedsLayout");
objj_msgSend(_1d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternateTitle"),function(_20,_21){
with(_20){
return _alternateTitle;
}
}),new objj_method(sel_getUid("setImage:"),function(_22,_23,_24){
with(_22){
if(_image===_24){
return;
}
_image=_24;
objj_msgSend(_22,"setNeedsLayout");
objj_msgSend(_22,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("image"),function(_25,_26){
with(_25){
return _image;
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_27,_28,_29){
with(_27){
if(_alternateImage===_29){
return;
}
_alternateImage=_29;
objj_msgSend(_27,"setNeedsLayout");
objj_msgSend(_27,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternateImage"),function(_2a,_2b){
with(_2a){
return _alternateImage;
}
}),new objj_method(sel_getUid("setShowsStateBy:"),function(_2c,_2d,_2e){
with(_2c){
if(_showsStateBy===_2e){
return;
}
_showsStateBy=_2e;
objj_msgSend(_2c,"setNeedsDisplay:",YES);
objj_msgSend(_2c,"setNeedsLayout");
}
}),new objj_method(sel_getUid("showsStateBy"),function(_2f,_30){
with(_2f){
return _showsStateBy;
}
}),new objj_method(sel_getUid("setHighlightsBy:"),function(_31,_32,_33){
with(_31){
if(_highlightsBy===_33){
return;
}
_highlightsBy=_33;
if(objj_msgSend(_31,"hasThemeState:",CPThemeStateHighlighted)){
objj_msgSend(_31,"setNeedsDisplay:",YES);
objj_msgSend(_31,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("setButtonType:"),function(_34,_35,_36){
with(_34){
switch(_36){
case CPMomentaryLightButton:
objj_msgSend(_34,"setHighlightsBy:",CPChangeBackgroundCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPNoCellMask);
break;
case CPMomentaryPushInButton:
objj_msgSend(_34,"setHighlightsBy:",CPPushInCellMask|CPChangeGrayCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPNoCellMask);
break;
case CPMomentaryChangeButton:
objj_msgSend(_34,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPNoCellMask);
break;
case CPPushOnPushOffButton:
objj_msgSend(_34,"setHighlightsBy:",CPPushInCellMask|CPChangeGrayCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPChangeBackgroundCellMask);
break;
case CPOnOffButton:
objj_msgSend(_34,"setHighlightsBy:",CPChangeBackgroundCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPChangeBackgroundCellMask);
break;
case CPToggleButton:
objj_msgSend(_34,"setHighlightsBy:",CPPushInCellMask|CPContentsCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPContentsCellMask);
break;
case CPSwitchButton:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The CPSwitchButton type is not supported in Cappuccino, use the CPCheckBox class instead.");
case CPRadioButton:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The CPRadioButton type is not supported in Cappuccino, use the CPRadio class instead.");
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unknown button type.");
}
objj_msgSend(_34,"setImageDimsWhenDisabled:",YES);
}
}),new objj_method(sel_getUid("setImageDimsWhenDisabled:"),function(_37,_38,_39){
with(_37){
_39=!!_39;
if(_imageDimsWhenDisabled===_39){
return;
}
_imageDimsWhenDisabled=_39;
if(_imageDimsWhenDisabled){
objj_msgSend(_37,"setNeedsDisplay:",YES);
objj_msgSend(_37,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("imageDimsWhenDisabled"),function(_3a,_3b){
with(_3a){
return _imageDimsWhenDisabled;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(_3c,"highlight:",YES);
return objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("CPControl")},"startTrackingAt:",_3e);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_3f,_40,_41,_42,_43){
with(_3f){
objj_msgSend(_3f,"highlight:",NO);
objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("CPControl")},"stopTracking:at:mouseIsUp:",_41,_42,_43);
if(_43&&CGRectContainsPoint(objj_msgSend(_3f,"bounds"),_42)){
objj_msgSend(_3f,"setNextState");
}
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_44,_45,_46){
with(_44){
var _47=objj_msgSend(_44,"currentValueForThemeAttribute:","content-inset");
if(((_47).top===0&&(_47).right===0&&(_47).bottom===0&&(_47).left===0)){
return _46;
}
_46.origin.x+=_47.left;
_46.origin.y+=_47.top;
_46.size.width-=_47.left+_47.right;
_46.size.height-=_47.top+_47.bottom;
return _46;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_48,_49,_4a){
with(_48){
if(!objj_msgSend(_48,"isBordered")){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _4b=objj_msgSend(_48,"currentValueForThemeAttribute:","bezel-inset");
if(((_4b).top===0&&(_4b).right===0&&(_4b).bottom===0&&(_4b).left===0)){
return _4a;
}
_4a.origin.x+=_4b.left;
_4a.origin.y+=_4b.top;
_4a.size.width-=_4b.left+_4b.right;
_4a.size.height-=_4b.top+_4b.bottom;
return _4a;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_4c,_4d){
with(_4c){
var _4e=objj_msgSend((objj_msgSend(_4c,"title")||" "),"sizeWithFont:",objj_msgSend(_4c,"currentValueForThemeAttribute:","font")),_4f=objj_msgSend(_4c,"currentValueForThemeAttribute:","content-inset"),_50=objj_msgSend(_4c,"currentValueForThemeAttribute:","min-size"),_51=objj_msgSend(_4c,"currentValueForThemeAttribute:","max-size");
_4e.width=MAX(_4e.width+_4f.left+_4f.right,_50.width);
_4e.height=MAX(_4e.height+_4f.top+_4f.bottom,_50.height);
if(_51.width>=0){
_4e.width=MIN(_4e.width,_51.width);
}
if(_51.height>=0){
_4e.height=MIN(_4e.height,_51.height);
}
objj_msgSend(_4c,"setFrameSize:",_4e);
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_52,_53,_54){
with(_52){
if(_54==="bezel-view"){
return objj_msgSend(_52,"bezelRectForBounds:",objj_msgSend(_52,"bounds"));
}else{
if(_54==="content-view"){
return objj_msgSend(_52,"contentRectForBounds:",objj_msgSend(_52,"bounds"));
}
}
return objj_msgSendSuper({receiver:_52,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_54);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_55,_56,_57){
with(_55){
if(_57==="bezel-view"){
var _58=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_58,"setHitTests:",NO);
return _58;
}else{
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
return objj_msgSendSuper({receiver:_55,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_57);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_59,_5a){
with(_59){
var _5b=objj_msgSend(_59,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_5b){
objj_msgSend(_5b,"setBackgroundColor:",objj_msgSend(_59,"currentValueForThemeAttribute:","bezel-color"));
}
var _5c=objj_msgSend(_59,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_5c){
objj_msgSend(_5c,"setText:",(objj_msgSend(_59,"hasThemeState:",CPThemeStateHighlighted)&&_alternateTitle)?_alternateTitle:_title);
objj_msgSend(_5c,"setImage:",(objj_msgSend(_59,"hasThemeState:",CPThemeStateHighlighted)&&_alternateImage)?_alternateImage:_image);
objj_msgSend(_5c,"setFont:",objj_msgSend(_59,"currentValueForThemeAttribute:","font"));
objj_msgSend(_5c,"setTextColor:",objj_msgSend(_59,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_5c,"setAlignment:",objj_msgSend(_59,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_5c,"setVerticalAlignment:",objj_msgSend(_59,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_5c,"setLineBreakMode:",objj_msgSend(_59,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_5c,"setTextShadowColor:",objj_msgSend(_59,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_5c,"setTextShadowOffset:",objj_msgSend(_59,"currentValueForThemeAttribute:","text-shadow-offset"));
objj_msgSend(_5c,"setImagePosition:",objj_msgSend(_59,"currentValueForThemeAttribute:","image-position"));
objj_msgSend(_5c,"setImageScaling:",objj_msgSend(_59,"currentValueForThemeAttribute:","image-scaling"));
}
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(_5d,_5e,_5f){
with(_5d){
if(_5f){
objj_msgSend(_5d,"setThemeState:",CPThemeStateDefault);
}else{
objj_msgSend(_5d,"unsetThemeState:",CPThemeStateDefault);
}
}
}),new objj_method(sel_getUid("setBordered:"),function(_60,_61,_62){
with(_60){
if(_62){
objj_msgSend(_60,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_60,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_63,_64){
with(_63){
return objj_msgSend(_63,"hasThemeState:",CPThemeStateBordered);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("buttonWithTitle:"),function(_65,_66,_67){
with(_65){
return objj_msgSend(_65,"buttonWithTitle:theme:",_67,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("buttonWithTitle:theme:"),function(_68,_69,_6a,_6b){
with(_68){
var _6c=objj_msgSend(objj_msgSend(_68,"alloc"),"init");
objj_msgSend(_6c,"setTheme:",_6b);
objj_msgSend(_6c,"setTitle:",_6a);
objj_msgSend(_6c,"sizeToFit");
return _6c;
}
}),new objj_method(sel_getUid("themeClass"),function(_6d,_6e){
with(_6d){
return "button";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_6f,_70){
with(_6f){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},nil],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _1=objj_getClass("CPButton");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPButton\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setBezelStyle:"),function(_71,_72,_73){
with(_71){
}
}),new objj_method(sel_getUid("bezelStyle"),function(_74,_75){
with(_74){
}
})]);
var _76="CPButtonImageKey",_77="CPButtonAlternateImageKey",_78="CPButtonTitleKey",_79="CPButtonAlternateTitleKey",_7a="CPButtonIsBorderedKey";
var _1=objj_getClass("CPButton");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPButton\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7b,_7c,_7d){
with(_7b){
_7b=objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPControl")},"initWithCoder:",_7d);
if(_7b){
_controlSize=CPRegularControlSize;
objj_msgSend(_7b,"setImage:",objj_msgSend(_7d,"decodeObjectForKey:",_76));
objj_msgSend(_7b,"setAlternateImage:",objj_msgSend(_7d,"decodeObjectForKey:",_77));
objj_msgSend(_7b,"setTitle:",objj_msgSend(_7d,"decodeObjectForKey:",_78));
objj_msgSend(_7b,"setAlternateTitle:",objj_msgSend(_7d,"decodeObjectForKey:",_79));
objj_msgSend(_7b,"setNeedsLayout");
objj_msgSend(_7b,"setNeedsDisplay:",YES);
}
return _7b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7e,_7f,_80){
with(_7e){
objj_msgSendSuper({receiver:_7e,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_80);
objj_msgSend(_80,"encodeObject:forKey:",_image,_76);
objj_msgSend(_80,"encodeObject:forKey:",_alternateImage,_77);
objj_msgSend(_80,"encodeObject:forKey:",_title,_78);
objj_msgSend(_80,"encodeObject:forKey:",_alternateTitle,_79);
}
})]);
i;12;CPCheckBox.ji;9;CPRadio.j