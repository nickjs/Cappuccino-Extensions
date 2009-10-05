I;20;Foundation/CPArray.ji;11;CPControl.jc;20550;
CPSegmentSwitchTrackingSelectOne=0;
CPSegmentSwitchTrackingSelectAny=1;
CPSegmentSwitchTrackingMomentary=2;
var _1=objj_allocateClassPair(CPControl,"CPSegmentedControl"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_segments"),new objj_ivar("_themeStates"),new objj_ivar("_selectedSegment"),new objj_ivar("_segmentStyle"),new objj_ivar("_trackingMode"),new objj_ivar("_trackingSegment"),new objj_ivar("_trackingHighlighted")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_segments=[];
_themeStates=[];
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"initWithFrame:",_5);
if(_3){
_selectedSegment=-1;
_trackingMode=CPSegmentSwitchTrackingSelectOne;
}
return _3;
}
}),new objj_method(sel_getUid("selectedTag"),function(_6,_7){
with(_6){
return _segments[_selectedSegment].tag;
}
}),new objj_method(sel_getUid("setSegmentCount:"),function(_8,_9,_a){
with(_8){
if(_segments.length==_a){
return;
}
var _b=CGRectGetHeight(objj_msgSend(_8,"bounds"));
if(_segments.length<_a){
for(var _c=_segments.length;_c<_a;++_c){
_segments[_c]=objj_msgSend(objj_msgSend(_CPSegmentItem,"alloc"),"init");
_themeStates[_c]=CPThemeStateNormal;
}
}else{
if(_a<_segments.length){
_segments.length=_a;
_themeStates.length=_a;
}
}
if(_selectedSegment>=_segments.length){
_selectedSegment=-1;
}
objj_msgSend(_8,"tileWithChangedSegment:",0);
}
}),new objj_method(sel_getUid("segmentCount"),function(_d,_e){
with(_d){
return _segments.length;
}
}),new objj_method(sel_getUid("setSelectedSegment:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"setSelected:forSegment:",YES,_11);
}
}),new objj_method(sel_getUid("selectedSegment"),function(_12,_13){
with(_12){
return _selectedSegment;
}
}),new objj_method(sel_getUid("selectSegmentWithTag:"),function(_14,_15,_16){
with(_14){
var _17=0;
for(;_17<_segments.length;++_17){
if(_segments[_17].tag==_16){
objj_msgSend(_14,"setSelectedSegment:",_17);
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isTracking"),function(_18,_19){
with(_18){
}
}),new objj_method(sel_getUid("setTrackingMode:"),function(_1a,_1b,_1c){
with(_1a){
if(_trackingMode==_1c){
return;
}
_trackingMode=_1c;
if(_trackingMode==CPSegmentSwitchTrackingSelectOne){
var _1d=0,_1e=NO;
for(;_1d<_segments.length;++_1d){
if(_segments[_1d].selected){
if(_1e){
objj_msgSend(_1a,"setSelected:forSegment:",NO,_1d);
}else{
_1e=YES;
}
}
}
}else{
if(_trackingMode==CPSegmentSwitchTrackingMomentary){
var _1d=0;
for(;_1d<_segments.length;++_1d){
if(_segments[_1d].selected){
objj_msgSend(_1a,"setSelected:forSegment:",NO,_1d);
}
}
}
}
}
}),new objj_method(sel_getUid("trackingMode"),function(_1f,_20){
with(_1f){
return _trackingMode;
}
}),new objj_method(sel_getUid("setWidth:forSegment:"),function(_21,_22,_23,_24){
with(_21){
_segments[_24].width=_23;
objj_msgSend(_21,"tileWithChangedSegment:",_24);
}
}),new objj_method(sel_getUid("widthForSegment:"),function(_25,_26,_27){
with(_25){
return _segments[_27].width;
}
}),new objj_method(sel_getUid("setImage:forSegment:"),function(_28,_29,_2a,_2b){
with(_28){
var _2c=_segments[_2b];
_2c.image=_2a;
objj_msgSend(_28,"tileWithChangedSegment:",_2b);
}
}),new objj_method(sel_getUid("imageForSegment:"),function(_2d,_2e,_2f){
with(_2d){
return _segments[_2f].image;
}
}),new objj_method(sel_getUid("setLabel:forSegment:"),function(_30,_31,_32,_33){
with(_30){
var _34=_segments[_33];
_segments[_33].label=_32;
objj_msgSend(_30,"tileWithChangedSegment:",_33);
}
}),new objj_method(sel_getUid("labelForSegment:"),function(_35,_36,_37){
with(_35){
return _segments[_37].label;
}
}),new objj_method(sel_getUid("setMenu:forSegment:"),function(_38,_39,_3a,_3b){
with(_38){
_segments[_3b].menu=_3a;
}
}),new objj_method(sel_getUid("menuForSegment:"),function(_3c,_3d,_3e){
with(_3c){
return _segments[_3e].menu;
}
}),new objj_method(sel_getUid("setSelected:forSegment:"),function(_3f,_40,_41,_42){
with(_3f){
var _43=_segments[_42];
if(_43.selected==_41){
return;
}
_43.selected=_41;
_themeStates[_42]=_41?CPThemeStateSelected:CPThemeStateNormal;
if(_41){
var _44=_selectedSegment;
_selectedSegment=_42;
if(_trackingMode==CPSegmentSwitchTrackingSelectOne&&_44!=_42&&_44!=-1){
_segments[_44].selected=NO;
_themeStates[_44]=CPThemeStateNormal;
objj_msgSend(_3f,"drawSegmentBezel:highlight:",_44,NO);
}
}
if(_trackingMode!=CPSegmentSwitchTrackingMomentary){
objj_msgSend(_3f,"drawSegmentBezel:highlight:",_42,NO);
}
objj_msgSend(_3f,"setNeedsLayout");
objj_msgSend(_3f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isSelectedForSegment:"),function(_45,_46,_47){
with(_45){
return _segments[_47].selected;
}
}),new objj_method(sel_getUid("setEnabled:forSegment:"),function(_48,_49,_4a,_4b){
with(_48){
_segments[_4b].enabled=_4a;
objj_msgSend(_48,"setNeedsLayout");
objj_msgSend(_48,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isEnabledForSegment:"),function(_4c,_4d,_4e){
with(_4c){
return _segments[_4e].enabled;
}
}),new objj_method(sel_getUid("setTag:forSegment:"),function(_4f,_50,_51,_52){
with(_4f){
_segments[_52].tag=_51;
}
}),new objj_method(sel_getUid("tagForSegment:"),function(_53,_54,_55){
with(_53){
return _segments[_55].tag;
}
}),new objj_method(sel_getUid("drawSegmentBezel:highlight:"),function(_56,_57,_58,_59){
with(_56){
if(_59){
_themeStates[_58]|=CPThemeStateHighlighted;
}else{
_themeStates[_58]&=~CPThemeStateHighlighted;
}
objj_msgSend(_56,"setNeedsLayout");
objj_msgSend(_56,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_leftOffsetForSegment:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(_5a,"currentValueForThemeAttribute:","bezel-inset");
if(_5c==0){
return _5d.left;
}
var _5e=objj_msgSend(_5a,"currentValueForThemeAttribute:","divider-thickness");
return objj_msgSend(_5a,"_leftOffsetForSegment:",_5c-1)+objj_msgSend(_5a,"widthForSegment:",_5c-1)+_5e;
}
}),new objj_method(sel_getUid("_indexOfLastSegment"),function(_5f,_60){
with(_5f){
var _61=objj_msgSend(_segments,"count")-1;
if(_61<0){
_61=0;
}
return _61;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_62,_63,_64){
with(_62){
var _65=objj_msgSend(_62,"currentValueForThemeAttribute:","default-height"),_66=objj_msgSend(_62,"currentValueForThemeAttribute:","content-inset"),_67=objj_msgSend(_62,"currentValueForThemeAttribute:","bezel-inset"),_68=objj_msgSend(_62,"bounds");
if(_64==="left-segment-bezel"){
return CGRectMake(_67.left,_67.top,_66.left,_65);
}else{
if(_64==="right-segment-bezel"){
var _69=objj_msgSend(_62,"_leftOffsetForSegment:",objj_msgSend(_62,"_indexOfLastSegment"));
return CPRectMake(_69+objj_msgSend(_62,"widthForSegment:",objj_msgSend(_62,"_indexOfLastSegment"))-_66.right,_67.top,_66.right,_65);
}else{
if(_64.substring(0,"segment-bezel".length)=="segment-bezel"){
var _6a=parseInt(_64.substring("segment-bezel-".length),10),_6b=CGRectCreateCopy(_segments[_6a].frame);
if(_6a==0){
_6b.origin.x+=_66.left;
_6b.size.width-=_66.left;
}
if(_6a==_segments.length-1){
_6b.size.width-=_66.right;
}
return _6b;
}else{
if(_64.substring(0,"divider-bezel".length)=="divider-bezel"){
var _6a=parseInt(_64.substring("divider-bezel-".length),10),_6c=objj_msgSend(_62,"widthForSegment:",_6a),_6d=objj_msgSend(_62,"_leftOffsetForSegment:",_6a),_6e=objj_msgSend(_62,"currentValueForThemeAttribute:","divider-thickness");
return CGRectMake(_6d+_6c,_67.top,_6e,_65);
}else{
if(_64.substring(0,"segment-content".length)=="segment-content"){
var _6a=parseInt(_64.substring("segment-content-".length),10);
return objj_msgSend(_62,"contentFrameForSegment:",_6a);
}
}
}
}
}
return objj_msgSendSuper({receiver:_62,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_64);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_6f,_70,_71){
with(_6f){
if(_71.substring(0,"segment-content".length)=="segment-content"){
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
return objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_72,_73){
with(_72){
if(_segments.length<=0){
return;
}
var _74=objj_msgSend(_72,"valueForThemeAttribute:inState:","left-segment-bezel-color",_themeStates[0]);
var _75=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","left-segment-bezel",CPWindowBelow,nil);
objj_msgSend(_75,"setBackgroundColor:",_74);
var _76=objj_msgSend(_72,"valueForThemeAttribute:inState:","right-segment-bezel-color",_themeStates[_themeStates.length-1]);
var _77=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","right-segment-bezel",CPWindowBelow,nil);
objj_msgSend(_77,"setBackgroundColor:",_76);
for(var i=0,_79=_themeStates.length;i<_79;i++){
var _7a=_themeStates[i];
_7a|=_themeState&CPThemeStateDisabled;
var _7b=objj_msgSend(_72,"valueForThemeAttribute:inState:","center-segment-bezel-color",_7a);
var _7c=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","segment-bezel-"+i,CPWindowBelow,nil);
objj_msgSend(_7c,"setBackgroundColor:",_7b);
var _7d=_segments[i];
var _7e=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","segment-content-"+i,CPWindowAbove,"segment-bezel-"+i);
objj_msgSend(_7e,"setText:",_7d.label);
objj_msgSend(_7e,"setImage:",_7d.image);
objj_msgSend(_7e,"setFont:",objj_msgSend(_72,"valueForThemeAttribute:inState:","font",_7a));
objj_msgSend(_7e,"setTextColor:",objj_msgSend(_72,"valueForThemeAttribute:inState:","text-color",_7a));
objj_msgSend(_7e,"setAlignment:",objj_msgSend(_72,"valueForThemeAttribute:inState:","alignment",_7a));
objj_msgSend(_7e,"setVerticalAlignment:",objj_msgSend(_72,"valueForThemeAttribute:inState:","vertical-alignment",_7a));
objj_msgSend(_7e,"setLineBreakMode:",objj_msgSend(_72,"valueForThemeAttribute:inState:","line-break-mode",_7a));
objj_msgSend(_7e,"setTextShadowColor:",objj_msgSend(_72,"valueForThemeAttribute:inState:","text-shadow-color",_7a));
objj_msgSend(_7e,"setTextShadowOffset:",objj_msgSend(_72,"valueForThemeAttribute:inState:","text-shadow-offset",_7a));
objj_msgSend(_7e,"setImageScaling:",objj_msgSend(_72,"valueForThemeAttribute:inState:","image-scaling",_7a));
if(_7d.image&&_7d.label){
objj_msgSend(_7e,"setImagePosition:",objj_msgSend(_72,"valueForThemeAttribute:inState:","image-position",_7a));
}else{
if(_7d.image){
objj_msgSend(_7e,"setImagePosition:",CPImageOnly);
}
}
if(i==_79-1){
continue;
}
var _7f=_themeStates[i]|_themeStates[i+1];
_7f=(_7f&CPThemeStateSelected&~CPThemeStateHighlighted)?CPThemeStateSelected:CPThemeStateNormal;
_7f|=_themeState&CPThemeStateDisabled;
var _80=objj_msgSend(_72,"valueForThemeAttribute:inState:","divider-bezel-color",_7f);
var _81=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","divider-bezel-"+i,CPWindowBelow,nil);
objj_msgSend(_81,"setBackgroundColor:",_80);
}
}
}),new objj_method(sel_getUid("drawSegment:highlight:"),function(_82,_83,_84,_85){
with(_82){
}
}),new objj_method(sel_getUid("tileWithChangedSegment:"),function(_86,_87,_88){
with(_86){
if(_88>=_segments.length){
return;
}
var _89=_segments[_88],_8a=_89.width,_8b=_themeStates[_88]|(_themeState&CPThemeStateDisabled),_8c=objj_msgSend(_86,"valueForThemeAttribute:inState:","content-inset",_8b),_8d=objj_msgSend(_86,"valueForThemeAttribute:inState:","font",_8b);
if(!_8a){
if(_89.image&&_89.label){
_8a=objj_msgSend(_89.label,"sizeWithFont:",_8d).width+objj_msgSend(_89.image,"size").width+_8c.left+_8c.right;
}else{
if(_89.image){
_8a=objj_msgSend(_89.image,"size").width+_8c.left+_8c.right;
}else{
if(_89.label){
_8a=objj_msgSend(_89.label,"sizeWithFont:",_8d).width+_8c.left+_8c.right;
}else{
_8a=0;
}
}
}
}
var _8e=_8a-CGRectGetWidth(_89.frame);
if(!_8e){
return;
}
var _8f=objj_msgSend(_86,"frame");
objj_msgSend(_86,"setFrameSize:",CGSizeMake(CGRectGetWidth(_8f)+_8e,CGRectGetHeight(_8f)));
_89.width=_8a;
_89.frame=objj_msgSend(_86,"frameForSegment:",_88);
var _90=_88+1;
for(;_90<_segments.length;++_90){
_segments[_90].frame.origin.x+=_8e;
objj_msgSend(_86,"drawSegmentBezel:highlight:",_90,NO);
objj_msgSend(_86,"drawSegment:highlight:",_90,NO);
}
objj_msgSend(_86,"drawSegmentBezel:highlight:",_88,NO);
objj_msgSend(_86,"drawSegment:highlight:",_88,NO);
objj_msgSend(_86,"setNeedsLayout");
objj_msgSend(_86,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("frameForSegment:"),function(_91,_92,_93){
with(_91){
return objj_msgSend(_91,"bezelFrameForSegment:",_93);
}
}),new objj_method(sel_getUid("bezelFrameForSegment:"),function(_94,_95,_96){
with(_94){
var _97=objj_msgSend(_94,"currentValueForThemeAttribute:","default-height"),_98=objj_msgSend(_94,"currentValueForThemeAttribute:","bezel-inset"),_99=objj_msgSend(_94,"widthForSegment:",_96),_9a=objj_msgSend(_94,"_leftOffsetForSegment:",_96);
return CGRectMake(_9a,_98.top,_99,_97);
}
}),new objj_method(sel_getUid("contentFrameForSegment:"),function(_9b,_9c,_9d){
with(_9b){
var _9e=objj_msgSend(_9b,"currentValueForThemeAttribute:","default-height"),_9f=objj_msgSend(_9b,"currentValueForThemeAttribute:","content-inset"),_a0=objj_msgSend(_9b,"widthForSegment:",_9d),_a1=objj_msgSend(_9b,"_leftOffsetForSegment:",_9d);
return CGRectMake(_a1+_9f.left,_9f.top,_a0-_9f.left-_9f.right,_9e-_9f.top-_9f.bottom);
}
}),new objj_method(sel_getUid("testSegment:"),function(_a2,_a3,_a4){
with(_a2){
var _a5=objj_msgSend(_a2,"convertPoint:fromView:",_a4,nil),_a6=_segments.length;
while(_a6--){
if(CGRectContainsPoint(_segments[_a6].frame,_a4)){
return _a6;
}
}
return -1;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_a7,_a8,_a9){
with(_a7){
if(!objj_msgSend(_a7,"isEnabled")){
return;
}
objj_msgSend(_a7,"trackSegment:",_a9);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_aa,_ab,_ac){
with(_aa){
}
}),new objj_method(sel_getUid("trackSegment:"),function(_ad,_ae,_af){
with(_ad){
var _b0=objj_msgSend(_af,"type"),_b1=objj_msgSend(_ad,"convertPoint:fromView:",objj_msgSend(_af,"locationInWindow"),nil);
if(_b0==CPLeftMouseUp){
if(_trackingSegment==-1){
return;
}
if(CGRectContainsPoint(_segments[_trackingSegment].frame,_b1)){
if(_trackingMode==CPSegmentSwitchTrackingSelectAny){
objj_msgSend(_ad,"setSelected:forSegment:",!objj_msgSend(_ad,"isSelectedForSegment:",_trackingSegment),_trackingSegment);
_selectedSegment=_trackingSegment;
}else{
objj_msgSend(_ad,"setSelected:forSegment:",YES,_trackingSegment);
}
objj_msgSend(_ad,"sendAction:to:",objj_msgSend(_ad,"action"),objj_msgSend(_ad,"target"));
if(_trackingMode==CPSegmentSwitchTrackingMomentary){
objj_msgSend(_ad,"setSelected:forSegment:",NO,_trackingSegment);
_selectedSegment=-1;
}
}
objj_msgSend(_ad,"drawSegmentBezel:highlight:",_trackingSegment,NO);
_trackingSegment=-1;
return;
}
if(_b0==CPLeftMouseDown){
_trackingHighlighted=YES;
_trackingSegment=objj_msgSend(_ad,"testSegment:",_b1);
objj_msgSend(_ad,"drawSegmentBezel:highlight:",_trackingSegment,YES);
}else{
if(_b0==CPLeftMouseDragged){
if(_trackingSegment==-1){
return;
}
var _b2=CGRectContainsPoint(_segments[_trackingSegment].frame,_b1);
if(_b2!=_trackingHighlighted){
_trackingHighlighted=_b2;
objj_msgSend(_ad,"drawSegmentBezel:highlight:",_trackingSegment,_trackingHighlighted);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_ad,sel_getUid("trackSegment:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setFont:"),function(_b3,_b4,_b5){
with(_b3){
objj_msgSendSuper({receiver:_b3,super_class:objj_getClass("CPControl")},"setFont:",_b5);
objj_msgSend(_b3,"tileWithChangedSegment:",0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_b6,_b7){
with(_b6){
return "segmented-control";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_b8,_b9){
with(_b8){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPCenterTextAlignment,CPCenterVerticalTextAlignment,CPImageLeft,CPScaleNone,{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},nil,nil,nil,nil,1,24],["alignment","vertical-alignment","image-position","image-scaling","bezel-inset","content-inset","left-segment-bezel-color","right-segment-bezel-color","center-segment-bezel-color","divider-bezel-color","divider-thickness","default-height"]);
}
})]);
var _ba="CPSegmentedControlSegmentsKey",_bb="CPSegmentedControlSelectedKey",_bc="CPSegmentedControlSegmentStyleKey",_bd="CPSegmentedControlTrackingModeKey";
var _1=objj_getClass("CPSegmentedControl");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSegmentedControl\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_be,_bf,_c0){
with(_be){
_be=objj_msgSendSuper({receiver:_be,super_class:objj_getClass("CPControl")},"initWithCoder:",_c0);
if(_be){
var _c1=objj_msgSend(_be,"frame"),_c2=_c1.size.width;
_c1.size.width=0;
objj_msgSend(_be,"setFrame:",_c1);
_segments=objj_msgSend(_c0,"decodeObjectForKey:",_ba);
_segmentStyle=objj_msgSend(_c0,"decodeIntForKey:",_bc);
_themeStates=[];
if(objj_msgSend(_c0,"containsValueForKey:",_bb)){
_selectedSegment=objj_msgSend(_c0,"decodeIntForKey:",_bb);
}else{
_selectedSegment=-1;
}
if(objj_msgSend(_c0,"containsValueForKey:",_bd)){
_trackingMode=objj_msgSend(_c0,"decodeIntForKey:",_bd);
}else{
_trackingMode=CPSegmentSwitchTrackingSelectOne;
}
for(var i=0;i<_segments.length;i++){
_themeStates[i]=_segments[i].selected?CPThemeStateSelected:CPThemeStateNormal;
objj_msgSend(_be,"tileWithChangedSegment:",i);
}
var _c4=MAX(_c2-objj_msgSend(_be,"frame").size.width,0),_c5=FLOOR(_c4/_segments.length);
for(var i=0;i<_segments.length;i++){
objj_msgSend(_be,"setWidth:forSegment:",_segments[i].width+_c5,i);
}
objj_msgSend(_be,"tileWithChangedSegment:",0);
}
return _be;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c6,_c7,_c8){
with(_c6){
objj_msgSendSuper({receiver:_c6,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_c8);
objj_msgSend(_c8,"encodeObject:forKey:",_segments,_ba);
objj_msgSend(_c8,"encodeInt:forKey:",_selectedSegment,_bb);
objj_msgSend(_c8,"encodeInt:forKey:",_segmentStyle,_bc);
objj_msgSend(_c8,"encodeInt:forKey:",_trackingMode,_bd);
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPSegmentItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("image"),new objj_ivar("label"),new objj_ivar("menu"),new objj_ivar("selected"),new objj_ivar("enabled"),new objj_ivar("tag"),new objj_ivar("width"),new objj_ivar("frame")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_c9,_ca){
with(_c9){
if(_c9=objj_msgSendSuper({receiver:_c9,super_class:objj_getClass("CPObject")},"init")){
image=nil;
label="";
menu=nil;
selected=NO;
enabled=NO;
tag=0;
width=0;
frame=CGRectMakeZero();
}
return _c9;
}
})]);
var _cb="CPSegmentItemImageKey",_cc="CPSegmentItemLabelKey",_cd="CPSegmentItemMenuKey",_ce="CPSegmentItemSelectedKey",_cf="CPSegmentItemEnabledKey",_d0="CPSegmentItemTagKey",_d1="CPSegmentItemWidthKey";
var _1=objj_getClass("_CPSegmentItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPSegmentItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_d2,_d3,_d4){
with(_d2){
_d2=objj_msgSendSuper({receiver:_d2,super_class:objj_getClass("CPObject")},"init");
if(_d2){
image=objj_msgSend(_d4,"decodeObjectForKey:",_cb);
label=objj_msgSend(_d4,"decodeObjectForKey:",_cc);
menu=objj_msgSend(_d4,"decodeObjectForKey:",_cd);
selected=objj_msgSend(_d4,"decodeBoolForKey:",_ce);
enabled=objj_msgSend(_d4,"decodeBoolForKey:",_cf);
tag=objj_msgSend(_d4,"decodeIntForKey:",_d0);
width=objj_msgSend(_d4,"decodeFloatForKey:",_d1);
frame=CGRectMakeZero();
}
return _d2;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_d5,_d6,_d7){
with(_d5){
objj_msgSend(_d7,"encodeObject:forKey:",image,_cb);
objj_msgSend(_d7,"encodeObject:forKey:",label,_cc);
objj_msgSend(_d7,"encodeObject:forKey:",menu,_cd);
objj_msgSend(_d7,"encodeBool:forKey:",selected,_ce);
objj_msgSend(_d7,"encodeBool:forKey:",enabled,_cf);
objj_msgSend(_d7,"encodeInt:forKey:",tag,_d0);
objj_msgSend(_d7,"encodeFloat:forKey:",width,_d1);
}
})]);
