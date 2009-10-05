I;21;Foundation/CPObject.ji;15;CPPopUpButton.ji;15;CPToolbarItem.jc;17234;
CPToolbarDisplayModeDefault=0;
CPToolbarDisplayModeIconAndLabel=1;
CPToolbarDisplayModeIconOnly=2;
CPToolbarDisplayModeLabelOnly=3;
var _1=nil;
var _2=nil;
var _3=objj_allocateClassPair(CPObject,"CPToolbar"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_identifier"),new objj_ivar("_displayMode"),new objj_ivar("_showsBaselineSeparator"),new objj_ivar("_allowsUserCustomization"),new objj_ivar("_isVisible"),new objj_ivar("_delegate"),new objj_ivar("_itemIdentifiers"),new objj_ivar("_identifiedItems"),new objj_ivar("_defaultItems"),new objj_ivar("_allowedItems"),new objj_ivar("_selectableItems"),new objj_ivar("_items"),new objj_ivar("_itemsSortedByVisibilityPriority"),new objj_ivar("_toolbarView"),new objj_ivar("_window")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_items=[];
_identifier=_7;
_isVisible=YES;
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_5,_identifier);
}
return _5;
}
}),new objj_method(sel_getUid("setDisplayMode:"),function(_8,_9,_a){
with(_8){
}
}),new objj_method(sel_getUid("identifier"),function(_b,_c){
with(_b){
return _identifier;
}
}),new objj_method(sel_getUid("delegate"),function(_d,_e){
with(_d){
return _delegate;
}
}),new objj_method(sel_getUid("isVisible"),function(_f,_10){
with(_f){
return _isVisible;
}
}),new objj_method(sel_getUid("setVisible:"),function(_11,_12,_13){
with(_11){
if(_isVisible===_13){
return;
}
_isVisible=_13;
objj_msgSend(_window,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("_window"),function(_14,_15){
with(_14){
return _window;
}
}),new objj_method(sel_getUid("_setWindow:"),function(_16,_17,_18){
with(_16){
_window=_18;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_19,_1a,_1b){
with(_19){
if(_delegate==_1b){
return;
}
_delegate=_1b;
objj_msgSend(_19,"_reloadToolbarItems");
}
}),new objj_method(sel_getUid("_loadConfiguration"),function(_1c,_1d){
with(_1c){
}
}),new objj_method(sel_getUid("_toolbarView"),function(_1e,_1f){
with(_1e){
if(!_toolbarView){
_toolbarView=objj_msgSend(objj_msgSend(_CPToolbarView,"alloc"),"initWithFrame:",CPRectMake(0,0,1200,59));
objj_msgSend(_toolbarView,"setToolbar:",_1e);
objj_msgSend(_toolbarView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
return _toolbarView;
}
}),new objj_method(sel_getUid("_reloadToolbarItems"),function(_20,_21){
with(_20){
if(!_delegate){
return;
}
var _22=objj_msgSend(_itemIdentifiers,"count");
if(!_22){
_itemIdentifiers=objj_msgSend(objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_20),"mutableCopy");
_22=objj_msgSend(_itemIdentifiers,"count");
}
_items=[];
var _23=0;
for(;_23<_22;++_23){
var _24=_itemIdentifiers[_23],_25=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_24);
if(!_25){
_25=objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_20,_24,YES);
}
_25=objj_msgSend(_25,"copy");
if(_25==nil){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,sprintf("_delegate %s returned nil toolbar item returned for identifier %s",_delegate,_24));
}
objj_msgSend(_items,"addObject:",_25);
}
_itemsSortedByVisibilityPriority=objj_msgSend(_items,"sortedArrayUsingFunction:context:",_26,NULL);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
}),new objj_method(sel_getUid("items"),function(_27,_28){
with(_27){
return _items;
}
}),new objj_method(sel_getUid("visibleItems"),function(_29,_2a){
with(_29){
return objj_msgSend(_toolbarView,"visibleItems");
}
}),new objj_method(sel_getUid("itemsSortedByVisibilityPriority"),function(_2b,_2c){
with(_2b){
return _itemsSortedByVisibilityPriority;
}
}),new objj_method(sel_getUid("_itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_2d,_2e,_2f,_30){
with(_2d){
var _31=objj_msgSend(_identifiedItems,"objectForKey:",_2f);
if(!_31){
_31=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_2f);
if(_delegate&&!_31){
_31=objj_msgSend(objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_2d,_2f,_30),"copy");
if(!_31){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,sprintf("_delegate %s returned nil toolbar item returned for identifier %s",_delegate,_2f));
}
}
objj_msgSend(_identifiedItems,"setObject:forKey:",_31,_2f);
}
return _31;
}
}),new objj_method(sel_getUid("_itemsWithIdentifiers:"),function(_32,_33,_34){
with(_32){
var _35=[];
for(var i=0;i<_34.length;i++){
objj_msgSend(_35,"addObject:",objj_msgSend(_32,"_itemForItemIdentifier:willBeInsertedIntoToolbar:",_34[i],NO));
}
return _35;
}
}),new objj_method(sel_getUid("_defaultToolbarItems"),function(_37,_38){
with(_37){
if(!_defaultItems){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("toolbarDefaultItemIdentifiers:"))){
_defaultItems=objj_msgSend(_37,"_itemsWithIdentifiers:",objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_37));
}
}
return _defaultItems;
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_39,_3a){
with(_39){
if(_39!=objj_msgSend(CPToolbar,"class")){
return;
}
_1=objj_msgSend(CPDictionary,"dictionary");
_2=objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("_addToolbar:forIdentifier:"),function(_3b,_3c,_3d,_3e){
with(_3b){
var _3f=objj_msgSend(_1,"objectForKey:",_3e);
if(!_3f){
_3f=[];
objj_msgSend(_1,"setObject:forKey:",_3f,_3e);
}
objj_msgSend(_3f,"addObject:",_3d);
}
})]);
var _40="CPToolbarIdentifierKey",_41="CPToolbarDisplayModeKey",_42="CPToolbarShowsBaselineSeparatorKey",_43="CPToolbarAllowsUserCustomizationKey",_44="CPToolbarIsVisibleKey",_45="CPToolbarDelegateKey",_46="CPToolbarIdentifiedItemsKey",_47="CPToolbarDefaultItemsKey",_48="CPToolbarAllowedItemsKey",_49="CPToolbarSelectableItemsKey";
var _3=objj_getClass("CPToolbar");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbar\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_4a,_4b,_4c){
with(_4a){
_4a=objj_msgSendSuper({receiver:_4a,super_class:objj_getClass("CPObject")},"init");
if(_4a){
_identifier=objj_msgSend(_4c,"decodeObjectForKey:",_40);
_displayMode=objj_msgSend(_4c,"decodeIntForKey:",_41);
_showsBaselineSeparator=objj_msgSend(_4c,"decodeBoolForKey:",_42);
_allowsUserCustomization=objj_msgSend(_4c,"decodeBoolForKey:",_43);
_isVisible=objj_msgSend(_4c,"decodeBoolForKey:",_44);
_identifiedItems=objj_msgSend(_4c,"decodeObjectForKey:",_46);
_defaultItems=objj_msgSend(_4c,"decodeObjectForKey:",_47);
_allowedItems=objj_msgSend(_4c,"decodeObjectForKey:",_48);
_selectableItems=objj_msgSend(_4c,"decodeObjectForKey:",_49);
_items=[];
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_4a,_identifier);
objj_msgSend(_4a,"setDelegate:",objj_msgSend(_4c,"decodeObjectForKey:",_45));
}
return _4a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4f,"encodeObject:forKey:",_identifier,_40);
objj_msgSend(_4f,"encodeInt:forKey:",_displayMode,_41);
objj_msgSend(_4f,"encodeBool:forKey:",_showsBaselineSeparator,_42);
objj_msgSend(_4f,"encodeBool:forKey:",_allowsUserCustomization,_43);
objj_msgSend(_4f,"encodeBool:forKey:",_isVisible,_44);
objj_msgSend(_4f,"encodeObject:forKey:",_identifiedItems,_46);
objj_msgSend(_4f,"encodeObject:forKey:",_defaultItems,_47);
objj_msgSend(_4f,"encodeObject:forKey:",_allowedItems,_48);
objj_msgSend(_4f,"encodeObject:forKey:",_selectableItems,_49);
objj_msgSend(_4f,"encodeConditionalObject:forKey:",_delegate,_45);
}
})]);
var _50=nil,_51=nil,_52=nil;
var _53=5,_54=10,_55=20;
var _56=function(_57,_58,_59,_5a){
return {index:_57,view:_58,label:_59,minWidth:_5a};
};
var _3=objj_allocateClassPair(CPView,"_CPToolbarView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_toolbar"),new objj_ivar("_flexibleWidthIndexes"),new objj_ivar("_visibleFlexibleWidthIndexes"),new objj_ivar("_itemInfos"),new objj_ivar("_visibleItems"),new objj_ivar("_invisibleItems"),new objj_ivar("_additionalItemsButton"),new objj_ivar("_labelColor"),new objj_ivar("_labelShadowColor"),new objj_ivar("_minWidth")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_5b,_5c,_5d){
with(_5b){
_5b=objj_msgSendSuper({receiver:_5b,super_class:objj_getClass("CPView")},"initWithFrame:",_5d);
if(_5b){
_minWidth=0;
_labelColor=objj_msgSend(CPColor,"blackColor");
_labelShadowColor=objj_msgSend(CPColor,"colorWithWhite:alpha:",1,0.75);
_additionalItemsButton=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:pullsDown:",CGRectMake(0,0,10,15),YES);
objj_msgSend(_additionalItemsButton,"setBordered:",NO);
objj_msgSend(_additionalItemsButton,"setImagePosition:",CPImageOnly);
objj_msgSend(objj_msgSend(_additionalItemsButton,"menu"),"setShowsStateColumn:",NO);
objj_msgSend(_additionalItemsButton,"setAlternateImage:",_52);
}
return _5b;
}
}),new objj_method(sel_getUid("setToolbar:"),function(_5e,_5f,_60){
with(_5e){
_toolbar=_60;
}
}),new objj_method(sel_getUid("toolbar"),function(_61,_62){
with(_61){
return _toolbar;
}
}),new objj_method(sel_getUid("setLabelColor:"),function(_63,_64,_65){
with(_63){
if(_labelColor===_65){
return;
}
_labelColor=_65;
var _66=objj_msgSend(_toolbar,"items"),_67=objj_msgSend(_66,"count");
while(_67--){
objj_msgSend(objj_msgSend(_63,"labelForItem:",_66[_67]),"setTextColor:",_labelColor);
}
}
}),new objj_method(sel_getUid("setLabelShadowColor:"),function(_68,_69,_6a){
with(_68){
if(_labelShadowColor===_6a){
return;
}
_labelShadowColor=_6a;
var _6b=objj_msgSend(_toolbar,"items"),_6c=objj_msgSend(_6b,"count");
while(_6c--){
objj_msgSend(objj_msgSend(_68,"labelForItem:",_6b[_6c]),"setTextShadowColor:",_labelShadowColor);
}
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_6d,_6e,_6f){
with(_6d){
objj_msgSend(_6d,"layoutSubviews");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_70,_71){
with(_70){
var _72=objj_msgSend(_toolbar,"items"),_73=CGRectGetWidth(objj_msgSend(_70,"bounds")),_74=_minWidth,_75=objj_msgSend(CPIndexSet,"indexSet"),_76=[];
_visibleItems=_72;
if(_73<_74){
_73-=_55;
_visibleItems=objj_msgSend(_visibleItems,"copy");
var _77=objj_msgSend(_toolbar,"itemsSortedByVisibilityPriority"),_78=_77.length;
while(_74>_73){
var _79=_77[_78--];
_74-=objj_msgSend(_70,"minWidthForItem:",_79)+_54;
objj_msgSend(_visibleItems,"removeObjectIdenticalTo:",_79);
objj_msgSend(_76,"addObject:",_79);
objj_msgSend(objj_msgSend(_70,"viewForItem:",_79),"setHidden:",YES);
objj_msgSend(objj_msgSend(_70,"labelForItem:",_79),"setHidden:",YES);
}
}
var _7a=_visibleItems.length,_7b=0;
while(_7a--){
var _79=_visibleItems[_7a],_7c=objj_msgSend(_79,"minSize"),_7d=objj_msgSend(_70,"viewForItem:",_79);
if(_7c.width!=objj_msgSend(_79,"maxSize").width){
objj_msgSend(_75,"addIndex:",_7a);
}else{
objj_msgSend(_7d,"setFrameSize:",CGSizeMake(objj_msgSend(_79,"minSize").width,CGRectGetHeight(objj_msgSend(_7d,"frame"))));
}
objj_msgSend(_7d,"setHidden:",NO);
objj_msgSend(objj_msgSend(_70,"labelForItem:",_79),"setHidden:",NO);
if(_7b<_7c.height){
_7b=_7c.height;
}
}
var _7e=_73-_74,_7f=0;
while(_7e&&objj_msgSend(_75,"count")){
_7f+=_7e/objj_msgSend(_75,"count");
_7e=0;
var _7a=CPNotFound;
while((_7a=objj_msgSend(_75,"indexGreaterThanIndex:",_7a))!=CPNotFound){
var _79=_visibleItems[_7a];
_7d=objj_msgSend(_70,"viewForItem:",_79),_80=objj_msgSend(_7d,"frame"),proposedWidth=objj_msgSend(_79,"minSize").width+_7f,constrainedWidth=MIN(proposedWidth,objj_msgSend(_79,"maxSize").width);
if(constrainedWidth<proposedWidth){
objj_msgSend(_75,"removeIndex:",_7a);
_7e+=proposedWidth-constrainedWidth;
}
objj_msgSend(_7d,"setFrameSize:",CGSizeMake(constrainedWidth,CGRectGetHeight(_80)));
}
}
var _78=_visibleItems.length,x=_54,_82=[];
for(_7a=0;_7a<_78;++_7a){
var _79=_visibleItems[_7a],_7d=objj_msgSend(_70,"viewForItem:",_79),_80=objj_msgSend(_7d,"frame"),_83=CGRectGetWidth(_80),_84=objj_msgSend(_70,"labelForItem:",_79),_85=objj_msgSend(_84,"frame"),_86=CGRectGetWidth(_85),_87=MAX(objj_msgSend(_70,"minWidthForItem:",_79),_83),_88=CGRectGetHeight(_80);
objj_msgSend(_7d,"setFrame:",CGRectMake(x+(_87-_83)/2,_53+(_7b-_88)/2,_83,_88));
objj_msgSend(_84,"setFrameOrigin:",CGPointMake(x+(_87-_86)/2,_53+_7b+2));
x+=_87+_54;
if(objj_msgSend(_79,"itemIdentifier")==CPToolbarSeparatorItemIdentifier){
_82.push(_79);
}
}
for(_7a=0,_78=_82.length;_7a<_78;++_7a){
var _7d=objj_msgSend(_70,"viewForItem:",_82[_7a]),_88=53;
objj_msgSend(_7d,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_7d,"frame")),(59-_88)/2,CGRectGetWidth(objj_msgSend(_7d,"frame")),_88));
}
if(objj_msgSend(_76,"count")){
var _7a=0,_78=objj_msgSend(_72,"count");
_invisibleItems=[];
for(;_7a<_78;++_7a){
var _79=_72[_7a];
if(objj_msgSend(_76,"indexOfObjectIdenticalTo:",_79)!=CPNotFound){
objj_msgSend(_invisibleItems,"addObject:",_79);
}
}
objj_msgSend(_additionalItemsButton,"setFrameOrigin:",CGPointMake(_73+5,(CGRectGetHeight(objj_msgSend(_70,"bounds"))-CGRectGetHeight(objj_msgSend(_additionalItemsButton,"frame")))/2));
objj_msgSend(_70,"addSubview:",_additionalItemsButton);
objj_msgSend(_additionalItemsButton,"removeAllItems");
var _7a=0,_78=objj_msgSend(_invisibleItems,"count");
objj_msgSend(_additionalItemsButton,"addItemWithTitle:","Additional Items");
objj_msgSend(objj_msgSend(_additionalItemsButton,"itemArray")[0],"setImage:",_51);
for(;_7a<_78;++_7a){
var _79=_invisibleItems[_7a];
objj_msgSend(_additionalItemsButton,"addItemWithTitle:",objj_msgSend(_79,"label"));
var _89=objj_msgSend(_additionalItemsButton,"itemArray")[_7a+1];
objj_msgSend(_89,"setImage:",objj_msgSend(_79,"image"));
objj_msgSend(_89,"setTarget:",objj_msgSend(_79,"target"));
objj_msgSend(_89,"setAction:",objj_msgSend(_79,"action"));
}
}else{
objj_msgSend(_additionalItemsButton,"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("viewForItem:"),function(_8a,_8b,_8c){
with(_8a){
var _8d=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_8c,"UID"));
if(!_8d){
return nil;
}
return _8d.view;
}
}),new objj_method(sel_getUid("labelForItem:"),function(_8e,_8f,_90){
with(_8e){
var _91=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_90,"UID"));
if(!_91){
return nil;
}
return _91.label;
}
}),new objj_method(sel_getUid("minWidthForItem:"),function(_92,_93,_94){
with(_92){
var _95=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_94,"UID"));
if(!_95){
return 0;
}
return _95.minWidth;
}
}),new objj_method(sel_getUid("reloadToolbarItems"),function(_96,_97){
with(_96){
var _98=objj_msgSend(_96,"subviews"),_99=_98.length;
while(_99--){
objj_msgSend(_98[_99],"removeFromSuperview");
}
var _9a=objj_msgSend(_toolbar,"items"),_9b=0;
_99=_9a.length;
_itemInfos=objj_msgSend(CPDictionary,"dictionary");
_minWidth=_54;
for(;_9b<_99;++_9b){
var _9c=_9a[_9b],_9d=objj_msgSend(_9c,"view");
if(!_9d){
_9d=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,32,32));
objj_msgSend(_9d,"setBordered:",NO);
objj_msgSend(_9d,"setImage:",objj_msgSend(_9c,"image"));
objj_msgSend(_9d,"setAlternateImage:",objj_msgSend(_9c,"alternateImage"));
objj_msgSend(_9d,"setTarget:",objj_msgSend(_9c,"target"));
objj_msgSend(_9d,"setAction:",objj_msgSend(_9c,"action"));
objj_msgSend(_9d,"setTag:",objj_msgSend(_9c,"tag"));
objj_msgSend(_9d,"setImagePosition:",CPImageOnly);
}
objj_msgSend(_96,"addSubview:",_9d);
var _9e=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_9e,"setStringValue:",objj_msgSend(_9c,"label"));
objj_msgSend(_9e,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_9e,"setTextColor:",_labelColor);
objj_msgSend(_9e,"setTextShadowColor:",_labelShadowColor);
objj_msgSend(_9e,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_9e,"sizeToFit");
objj_msgSend(_9e,"setTarget:",objj_msgSend(_9c,"target"));
objj_msgSend(_9e,"setAction:",objj_msgSend(_9c,"action"));
objj_msgSend(_96,"addSubview:",_9e);
var _9f=objj_msgSend(_9c,"minSize"),_a0=MAX(_9f.width,CGRectGetWidth(objj_msgSend(_9e,"frame")));
objj_msgSend(_itemInfos,"setObject:forKey:",_56(_9b,_9d,_9e,_a0),objj_msgSend(_9c,"UID"));
_minWidth+=_a0+_54;
}
objj_msgSend(_96,"layoutSubviews");
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_a1,_a2){
with(_a1){
if(_a1!=objj_msgSend(_CPToolbarView,"class")){
return;
}
var _a3=objj_msgSend(CPBundle,"bundleForClass:",_a1);
_51=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a3,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsImage.png"),CPSizeMake(10,15));
_52=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a3,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsAlternateImage.png"),CGSizeMake(10,15));
}
})]);
var _26=function(lhs,rhs){
var _a6=objj_msgSend(lhs,"visibilityPriority"),_a7=objj_msgSend(rhs,"visibilityPriority");
if(_a6==_a7){
return CPOrderedSame;
}
if(_a6>_a7){
return CPOrderedAscending;
}
return CPOrderedDescending;
};
