I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPView.jc;9705;
CPToolbarItemVisibilityPriorityStandard=0;
CPToolbarItemVisibilityPriorityLow=-1000;
CPToolbarItemVisibilityPriorityHigh=1000;
CPToolbarItemVisibilityPriorityUser=2000;
CPToolbarSeparatorItemIdentifier="CPToolbarSeparatorItemIdentifier";
CPToolbarSpaceItemIdentifier="CPToolbarSpaceItemIdentifier";
CPToolbarFlexibleSpaceItemIdentifier="CPToolbarFlexibleSpaceItemIdentifier";
CPToolbarShowColorsItemIdentifier="CPToolbarShowColorsItemIdentifier";
CPToolbarShowFontsItemIdentifier="CPToolbarShowFontsItemIdentifier";
CPToolbarCustomizeToolbarItemIdentifier="CPToolbarCustomizeToolbarItemIdentifier";
CPToolbarPrintItemIdentifier="CPToolbarPrintItemIdentifier";
var _1=objj_allocateClassPair(CPObject,"CPToolbarItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_itemIdentifier"),new objj_ivar("_toolbar"),new objj_ivar("_label"),new objj_ivar("_paletteLabel"),new objj_ivar("_toolTip"),new objj_ivar("_tag"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_isEnabled"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_view"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_visibilityPriority")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithItemIdentifier:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_itemIdentifier=_5;
_tag=0;
_isEnabled=YES;
_minSize=CGSizeMakeZero();
_maxSize=CGSizeMakeZero();
_visibilityPriority=CPToolbarItemVisibilityPriorityStandard;
}
return _3;
}
}),new objj_method(sel_getUid("itemIdentifier"),function(_6,_7){
with(_6){
return _itemIdentifier;
}
}),new objj_method(sel_getUid("toolbar"),function(_8,_9){
with(_8){
return _toolbar;
}
}),new objj_method(sel_getUid("label"),function(_a,_b){
with(_a){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_c,_d,_e){
with(_c){
_label=_e;
}
}),new objj_method(sel_getUid("paletteLabel"),function(_f,_10){
with(_f){
return _paletteLabel;
}
}),new objj_method(sel_getUid("setPaletteLabel:"),function(_11,_12,_13){
with(_11){
_paletteLabel=_13;
}
}),new objj_method(sel_getUid("toolTip"),function(_14,_15){
with(_14){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("toolTip"))){
return objj_msgSend(_view,"toolTip");
}
return _toolTip;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_16,_17,_18){
with(_16){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setToolTip:"))){
objj_msgSend(view,"setToolTip:",_18);
}
_toolTip=_18;
}
}),new objj_method(sel_getUid("tag"),function(_19,_1a){
with(_19){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("tag"))){
return objj_msgSend(_view,"tag");
}
return _tag;
}
}),new objj_method(sel_getUid("setTag:"),function(_1b,_1c,_1d){
with(_1b){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_1d);
}
_tag=_1d;
}
}),new objj_method(sel_getUid("target"),function(_1e,_1f){
with(_1e){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("target"))?objj_msgSend(_view,"target"):nil;
}
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_20,_21,_22){
with(_20){
if(!_view){
_target=_22;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTarget:"))){
objj_msgSend(_view,"setTarget:",_22);
}
}
}
}),new objj_method(sel_getUid("action"),function(_23,_24){
with(_23){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("action"))?objj_msgSend(_view,"action"):nil;
}
return _action;
}
}),new objj_method(sel_getUid("setAction:"),function(_25,_26,_27){
with(_25){
if(!_view){
_action=_27;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_view,"setAction:",_27);
}
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_28,_29){
with(_28){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("isEnabled"))){
return objj_msgSend(_view,"isEnabled");
}
return _isEnabled;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_2a,_2b,_2c){
with(_2a){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setEnabled:"))){
objj_msgSend(_view,"setEnabled:",_2c);
}
_isEnabled=_2c;
}
}),new objj_method(sel_getUid("image"),function(_2d,_2e){
with(_2d){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("image"))){
return objj_msgSend(_view,"image");
}
return _image;
}
}),new objj_method(sel_getUid("setImage:"),function(_2f,_30,_31){
with(_2f){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setImage:"))){
objj_msgSend(_view,"setImage:",_31);
}
_image=_31;
if(!_image){
return;
}
if(_minSize.width==0&&_minSize.height==0&&_maxSize.width==0&&_maxSize.height==0){
var _32=objj_msgSend(_image,"size");
if(_32.width>0||_32.height>0){
objj_msgSend(_2f,"setMinSize:",_32);
objj_msgSend(_2f,"setMaxSize:",_32);
}
}
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_33,_34,_35){
with(_33){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAlternateImage:"))){
objj_msgSend(_view,"setAlternateImage:",_35);
}
_alternateImage=_35;
}
}),new objj_method(sel_getUid("alternateImage"),function(_36,_37){
with(_36){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("alternateIamge"))){
return objj_msgSend(_view,"alternateImage");
}
return _alternateImage;
}
}),new objj_method(sel_getUid("view"),function(_38,_39){
with(_38){
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_3a,_3b,_3c){
with(_3a){
if(_view==_3c){
return;
}
_view=_3c;
if(_view){
if(_tag!==0&&objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_tag);
}
_target=nil;
_action=nil;
}
}
}),new objj_method(sel_getUid("minSize"),function(_3d,_3e){
with(_3d){
return _minSize;
}
}),new objj_method(sel_getUid("setMinSize:"),function(_3f,_40,_41){
with(_3f){
_minSize=CGSizeMakeCopy(_41);
_maxSize=CGSizeMake(MAX(_minSize.width,_maxSize.width),MAX(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("maxSize"),function(_42,_43){
with(_42){
return _maxSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_44,_45,_46){
with(_44){
_maxSize=CGSizeMakeCopy(_46);
_minSize=CGSizeMake(MIN(_minSize.width,_maxSize.width),MIN(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("visibilityPriority"),function(_47,_48){
with(_47){
return _visibilityPriority;
}
}),new objj_method(sel_getUid("setVisibilityPriority:"),function(_49,_4a,_4b){
with(_49){
_visibilityPriority=_4b;
}
})]);
var _1=objj_getClass("CPToolbarItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbarItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_4c,_4d){
with(_4c){
var _4e=objj_msgSend(objj_msgSend(objj_msgSend(_4c,"class"),"alloc"),"initWithItemIdentifier:",_itemIdentifier);
if(_view){
objj_msgSend(_4e,"setView:",objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_view)));
}
objj_msgSend(_4e,"setLabel:",_label);
objj_msgSend(_4e,"setPaletteLabel:",_paletteLabel);
objj_msgSend(_4e,"setToolTip:",objj_msgSend(_4c,"toolTip"));
objj_msgSend(_4e,"setTag:",objj_msgSend(_4c,"tag"));
objj_msgSend(_4e,"setTarget:",objj_msgSend(_4c,"target"));
objj_msgSend(_4e,"setAction:",objj_msgSend(_4c,"action"));
objj_msgSend(_4e,"setEnabled:",objj_msgSend(_4c,"isEnabled"));
objj_msgSend(_4e,"setImage:",objj_msgSend(_4c,"image"));
objj_msgSend(_4e,"setAlternateImage:",objj_msgSend(_4c,"alternateImage"));
objj_msgSend(_4e,"setMinSize:",_minSize);
objj_msgSend(_4e,"setMaxSize:",_maxSize);
objj_msgSend(_4e,"setVisibilityPriority:",_visibilityPriority);
return _4e;
}
})]);
var _4f=nil,_50=nil;
var _1=objj_getClass("CPToolbarItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbarItem\""));
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("_separatorItemView"),function(_51,_52){
with(_51){
if(!_4f){
_4f=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,2,32));
sizes={};
sizes["CPToolbarItemSeparator"]=[CGSizeMake(2,26),CGSizeMake(2,1),CGSizeMake(2,26)];
objj_msgSend(_4f,"setBackgroundColor:",_CPControlThreePartImagePattern(YES,sizes,"CPToolbarItem","Separator"));
}
return _4f;
}
}),new objj_method(sel_getUid("_spaceItemView"),function(_53,_54){
with(_53){
if(!_50){
_50=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
}
return _50;
}
}),new objj_method(sel_getUid("_standardItemWithItemIdentifier:"),function(_55,_56,_57){
with(_55){
var _58=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_57);
switch(_57){
case CPToolbarSeparatorItemIdentifier:
objj_msgSend(_58,"setView:",objj_msgSend(_55,"_separatorItemView"));
objj_msgSend(_58,"setMinSize:",CGSizeMake(2,0));
objj_msgSend(_58,"setMaxSize:",CGSizeMake(2,100000));
return _58;
case CPToolbarSpaceItemIdentifier:
objj_msgSend(_58,"setView:",objj_msgSend(_55,"_spaceItemView"));
objj_msgSend(_58,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_58,"setMaxSize:",CGSizeMake(32,32));
return _58;
case CPToolbarFlexibleSpaceItemIdentifier:
objj_msgSend(_58,"setView:",objj_msgSend(_55,"_spaceItemView"));
objj_msgSend(_58,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_58,"setMaxSize:",CGSizeMake(10000,32));
return _58;
case CPToolbarShowColorsItemIdentifier:
return nil;
case CPToolbarShowFontsItemIdentifier:
return nil;
case CPToolbarCustomizeToolbarItemIdentifier:
return nil;
case CPToolbarPrintItemIdentifier:
return nil;
}
return nil;
}
})]);
