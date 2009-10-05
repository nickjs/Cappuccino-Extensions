i;13;CPTextField.jc;17925;
CPSearchFieldRecentsTitleMenuItemTag=1000;
CPSearchFieldRecentsMenuItemTag=1001;
CPSearchFieldClearRecentsMenuItemTag=1002;
CPSearchFieldNoRecentsMenuItemTag=1003;
var _1=nil,_2=nil,_3=nil,_4=nil;
var _5=objj_allocateClassPair(CPTextField,"CPSearchField"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_searchButton"),new objj_ivar("_cancelButton"),new objj_ivar("_searchMenuTemplate"),new objj_ivar("_searchMenu"),new objj_ivar("_recentsAutosaveName"),new objj_ivar("_recentSearches"),new objj_ivar("_maximumRecents"),new objj_ivar("_sendsWholeSearchString"),new objj_ivar("_sendsSearchStringImmediately"),new objj_ivar("_partialStringTimer")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPTextField")},"initWithFrame:",_9);
if(_7!=nil){
_recentSearches=objj_msgSend(CPArray,"array");
_maximumRecents=10;
_sendsWholeSearchString=NO;
_sendsSearchStringImmediately=NO;
objj_msgSend(_7,"setBezeled:",YES);
objj_msgSend(_7,"setBezelStyle:",CPTextFieldRoundedBezel);
objj_msgSend(_7,"setBordered:",YES);
objj_msgSend(_7,"setEditable:",YES);
objj_msgSend(_7,"setDelegate:",_7);
_cancelButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CPMakeRect(_9.size.width-27,(_9.size.height-22)/2,22,22));
objj_msgSend(_7,"resetCancelButton");
objj_msgSend(_cancelButton,"setHidden:",YES);
objj_msgSend(_7,"addSubview:",_cancelButton);
_searchButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CPMakeRect(5,(_9.size.height-25)/2,25,25));
objj_msgSend(_searchButton,"setBezelStyle:",CPRegularSquareBezelStyle);
objj_msgSend(_searchButton,"setBordered:",NO);
objj_msgSend(_searchButton,"setImageScaling:",CPScaleToFit);
_cancelButton._DOMElement.style.cursor="default";
_searchButton._DOMElement.style.cursor="default";
objj_msgSend(_7,"setSearchMenuTemplate:",objj_msgSend(_7,"_searchMenuTemplate"));
objj_msgSend(_7,"addSubview:",_searchButton);
}
return _7;
}
}),new objj_method(sel_getUid("copy"),function(_a,_b){
with(_a){
var _c=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPTextField")},"copy");
objj_msgSend(_c,"setCancelButton:",objj_msgSend(_cancelButton,"copy"));
objj_msgSend(_c,"setSearchButton:",objj_msgSend(_searchButton,"copy"));
objj_msgSend(_c,"setrecentsAutosaveName:",objj_msgSend(_recentsAutosaveName,"copy"));
objj_msgSend(_c,"setSendsWholeSearchString:",objj_msgSend(_sendsWholeSearchString,"copy"));
objj_msgSend(_c,"setSendsSearchStringImmediately:",objj_msgSend(_sendsSearchStringImmediately,"copy"));
objj_msgSend(_c,"setMaximumRecents:",_maximumRecents);
objj_msgSend(_c,"setSearchMenutemplate:",objj_msgSend(_searchMenuTemplate,"copy"));
return _c;
}
}),new objj_method(sel_getUid("setSearchButton:"),function(_d,_e,_f){
with(_d){
_searchButton=_f;
}
}),new objj_method(sel_getUid("searchButton"),function(_10,_11){
with(_10){
return _searchButton;
}
}),new objj_method(sel_getUid("resetSearchButton"),function(_12,_13){
with(_12){
var _14,_15,_16,_17=objj_msgSend(_12,"searchButton");
if(_searchMenuTemplate==nil){
_14=_1;
_15=objj_msgSend(_12,"action");
_16=objj_msgSend(_12,"target");
}else{
_14=_2;
_15=sel_getUid("_showMenu:");
_16=_12;
}
objj_msgSend(_17,"setImage:",_14);
objj_msgSend(_17,"setTarget:",_16);
objj_msgSend(_17,"setAction:",_15);
}
}),new objj_method(sel_getUid("setCancelButton:"),function(_18,_19,_1a){
with(_18){
_cancelButton=_1a;
}
}),new objj_method(sel_getUid("cancelButton"),function(_1b,_1c){
with(_1b){
return _cancelButton;
}
}),new objj_method(sel_getUid("resetCancelButton"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_1d,"cancelButton");
objj_msgSend(_1f,"setBezelStyle:",CPRegularSquareBezelStyle);
objj_msgSend(_1f,"setBordered:",NO);
objj_msgSend(_1f,"setImageScaling:",CPScaleToFit);
objj_msgSend(_1f,"setImage:",_3);
objj_msgSend(_1f,"setAlternateImage:",_4);
objj_msgSend(_1f,"setTarget:",_1d);
objj_msgSend(_1f,"setAction:",sel_getUid("_searchFieldCancel:"));
}
}),new objj_method(sel_getUid("searchTextRectForBounds:"),function(_20,_21,_22){
with(_20){
var _23=0,_24=_22.size.width;
if(_searchButton){
var _25=objj_msgSend(_searchButton,"frame");
_23=_25.origin.x+_25.size.width;
}
if(_cancelButton){
var _26=objj_msgSend(_cancelButton,"frame");
_24=_26.origin.x-_23;
}
return CPMakeRect(_23,_22.origin.y,_24,_22.size.height);
}
}),new objj_method(sel_getUid("searchButtonRectForBounds:"),function(_27,_28,_29){
with(_27){
return objj_msgSend(_searchButton,"frame");
}
}),new objj_method(sel_getUid("cancelButtonRectForBounds:"),function(_2a,_2b,_2c){
with(_2a){
return objj_msgSend(_cancelButton,"frame");
}
}),new objj_method(sel_getUid("searchMenuTemplate"),function(_2d,_2e){
with(_2d){
return _searchMenuTemplate;
}
}),new objj_method(sel_getUid("setSearchMenuTemplate:"),function(_2f,_30,_31){
with(_2f){
_searchMenuTemplate=_31;
objj_msgSend(_2f,"resetSearchButton");
objj_msgSend(_2f,"_updateSearchMenu");
}
}),new objj_method(sel_getUid("sendsWholeSearchString"),function(_32,_33){
with(_32){
return _sendsWholeSearchString;
}
}),new objj_method(sel_getUid("setSendsWholeSearchString:"),function(_34,_35,_36){
with(_34){
_sendsWholeSearchString=_36;
}
}),new objj_method(sel_getUid("sendsSearchStringImmediately"),function(_37,_38){
with(_37){
return _sendsSearchStringImmediately;
}
}),new objj_method(sel_getUid("setSendsSearchStringImmediately:"),function(_39,_3a,_3b){
with(_39){
_sendsSearchStringImmediately=_3b;
}
}),new objj_method(sel_getUid("maximumRecents"),function(_3c,_3d){
with(_3c){
return _maximumRecents;
}
}),new objj_method(sel_getUid("setMaximumRecents:"),function(_3e,_3f,max){
with(_3e){
if(max>254){
max=254;
}else{
if(max<0){
max=10;
}
}
_maximumRecents=max;
}
}),new objj_method(sel_getUid("recentSearches"),function(_41,_42){
with(_41){
return _recentSearches;
}
}),new objj_method(sel_getUid("setRecentSearches:"),function(_43,_44,_45){
with(_43){
var max=MIN(objj_msgSend(_43,"maximumRecents"),objj_msgSend(_45,"count"));
var _45=objj_msgSend(_45,"subarrayWithRange:",CPMakeRange(0,max));
_recentSearches=_45;
objj_msgSend(_43,"_autosaveRecentSearchList");
}
}),new objj_method(sel_getUid("recentsAutosaveName"),function(_47,_48){
with(_47){
return _recentsAutosaveName;
}
}),new objj_method(sel_getUid("setRecentsAutosaveName:"),function(_49,_4a,_4b){
with(_49){
_recentsAutosaveName=_4b;
if(_4b!=nil){
objj_msgSend(_49,"_registerForAutosaveNotification");
}else{
objj_msgSend(_49,"_deregisterForAutosaveNotification");
}
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_4c,_4d,_4e){
with(_4c){
var _4f=objj_msgSendSuper({receiver:_4c,super_class:objj_getClass("CPTextField")},"contentRectForBounds:",_4e);
return objj_msgSend(_4c,"searchTextRectForBounds:",_4f);
}
}),new objj_method(sel_getUid("menu"),function(_50,_51){
with(_50){
return _searchMenu;
}
}),new objj_method(sel_getUid("isOpaque"),function(_52,_53){
with(_52){
return objj_msgSendSuper({receiver:_52,super_class:objj_getClass("CPTextField")},"isOpaque")&&objj_msgSend(_cancelButton,"isOpaque")&&objj_msgSend(_searchButton,"isOpaque");
}
}),new objj_method(sel_getUid("_updateCancelButtonVisibility"),function(_54,_55){
with(_54){
objj_msgSend(_cancelButton,"setHidden:",(objj_msgSend(objj_msgSend(_54,"stringValue"),"length")==0));
}
}),new objj_method(sel_getUid("controlTextDidChange:"),function(_56,_57,_58){
with(_56){
if(!_sendsWholeSearchString){
if(_sendsSearchStringImmediately){
objj_msgSend(_56,"_sendPartialString");
}else{
objj_msgSend(_partialStringTimer,"invalidate");
var _59=objj_msgSend(CPSearchField,"_keyboardDelayForPartialSearchString:",objj_msgSend(_56,"stringValue"));
_partialStringTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_59,_56,sel_getUid("_sendPartialString"),nil,NO);
}
}
objj_msgSend(_56,"_updateCancelButtonVisibility");
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_5a,_5b,_5c,_5d){
with(_5a){
objj_msgSendSuper({receiver:_5a,super_class:objj_getClass("CPTextField")},"sendAction:to:",_5c,_5d);
objj_msgSend(_partialStringTimer,"invalidate");
var _5e=objj_msgSend(_5a,"objectValue");
if(_5e!=nil&&_5e!=""&&!objj_msgSend(_recentSearches,"containsObject:",_5e)){
objj_msgSend(_5a,"_addStringToRecentSearches:",_5e);
objj_msgSend(_5a,"_updateSearchMenu");
}
objj_msgSend(_5a,"_updateCancelButtonVisibility");
}
}),new objj_method(sel_getUid("_addStringToRecentSearches:"),function(_5f,_60,_61){
with(_5f){
var _62=objj_msgSend(CPMutableArray,"arrayWithArray:",_recentSearches);
objj_msgSend(_62,"addObject:",_61);
objj_msgSend(_5f,"setRecentSearches:",_62);
}
}),new objj_method(sel_getUid("trackMouse:"),function(_63,_64,_65){
with(_63){
var _66;
var _67;
var _68=objj_msgSend(_65,"locationInWindow");
_67=objj_msgSend(_63,"convertPoint:fromView:",_68,nil);
_66=objj_msgSend(_63,"searchButtonRectForBounds:",objj_msgSend(_63,"frame"));
if(CPRectContainsPoint(_66,_67)){
return objj_msgSend(objj_msgSend(_63,"searchButton"),"trackMouse:",_65);
}
_66=objj_msgSend(_63,"cancelButtonRectForBounds:",objj_msgSend(_63,"frame"));
if(CPRectContainsPoint(_66,_67)){
return objj_msgSend(objj_msgSend(_63,"cancelButton"),"trackMouse:",_65);
}
return objj_msgSendSuper({receiver:_63,super_class:objj_getClass("CPTextField")},"trackMouse:",_65);
}
}),new objj_method(sel_getUid("_searchMenuTemplate"),function(_69,_6a){
with(_69){
var _6b,_6c;
_6b=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"init");
_6c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Recent searches",NULL,"");
objj_msgSend(_6c,"setTag:",CPSearchFieldRecentsTitleMenuItemTag);
objj_msgSend(_6c,"setEnabled:",NO);
objj_msgSend(_6b,"addItem:",_6c);
_6c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Recent search item",sel_getUid("_searchFieldSearch:"),"");
objj_msgSend(_6c,"setTag:",CPSearchFieldRecentsMenuItemTag);
objj_msgSend(_6c,"setTarget:",_69);
objj_msgSend(_6b,"addItem:",_6c);
_6c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Clear recent searches",sel_getUid("_searchFieldClearRecents:"),"");
objj_msgSend(_6c,"setTag:",CPSearchFieldClearRecentsMenuItemTag);
objj_msgSend(_6c,"setTarget:",_69);
objj_msgSend(_6b,"addItem:",_6c);
_6c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","No recent searches",NULL,"");
objj_msgSend(_6c,"setTag:",CPSearchFieldNoRecentsMenuItemTag);
objj_msgSend(_6c,"setEnabled:",NO);
objj_msgSend(_6b,"addItem:",_6c);
return _6b;
}
}),new objj_method(sel_getUid("_updateSearchMenu"),function(_6d,_6e){
with(_6d){
if(_searchMenuTemplate==nil){
return;
}
var i,_70=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"init");
var _71=objj_msgSend(_recentSearches,"count");
for(i=0;i<objj_msgSend(_searchMenuTemplate,"numberOfItems");i++){
var _72=objj_msgSend(_searchMenuTemplate,"itemAtIndex:",i);
var tag=objj_msgSend(_72,"tag");
if(tag==CPSearchFieldClearRecentsMenuItemTag&&_71!=0){
var _74=objj_msgSend(CPMenuItem,"separatorItem");
objj_msgSend(_70,"addItem:",_74);
}
if(!(tag==CPSearchFieldRecentsTitleMenuItemTag&&_71==0)&&!(tag==CPSearchFieldClearRecentsMenuItemTag&&_71==0)&&!(tag==CPSearchFieldNoRecentsMenuItemTag&&_71!=0)&&!(tag==CPSearchFieldRecentsMenuItemTag)){
var _75=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",objj_msgSend(_72,"title"),objj_msgSend(_72,"action"),objj_msgSend(_72,"keyEquivalent"));
objj_msgSend(_75,"setTarget:",objj_msgSend(_72,"target"));
objj_msgSend(_75,"setEnabled:",objj_msgSend(_72,"isEnabled"));
objj_msgSend(_75,"setTag:",objj_msgSend(_72,"tag"));
objj_msgSend(_70,"addItem:",_75);
}else{
if(tag==CPSearchFieldRecentsMenuItemTag){
var j;
for(j=0;j<_71;j++){
var _77=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",objj_msgSend(_recentSearches,"objectAtIndex:",j),objj_msgSend(_72,"action"),objj_msgSend(_72,"keyEquivalent"));
objj_msgSend(_77,"setTarget:",objj_msgSend(_72,"target"));
objj_msgSend(_70,"addItem:",_77);
}
}
}
}
_searchMenu=_70;
}
}),new objj_method(sel_getUid("_showMenu:"),function(_78,_79,_7a){
with(_78){
if(_searchMenu==nil||!objj_msgSend(_78,"isEnabled")){
return;
}
objj_msgSendSuper({receiver:_78,super_class:objj_getClass("CPTextField")},"selectText:",nil);
var _7b=CPMakePoint(objj_msgSend(_78,"frame").origin.x,objj_msgSend(_78,"frame").origin.y+objj_msgSend(_78,"frame").size.height);
var _7c=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPRightMouseDown,_7b,0,objj_msgSend(CPDate,"date"),1,objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),"","",NO,0);
objj_msgSend(CPMenu,"popUpContextMenu:withEvent:forView:",_searchMenu,_7c,_7a);
}
}),new objj_method(sel_getUid("_sendPartialString"),function(_7d,_7e){
with(_7d){
objj_msgSend(objj_msgSend(_7d,"target"),"performSelector:withObject:",objj_msgSend(_7d,"action"),_7d);
}
}),new objj_method(sel_getUid("_searchFieldCancel:"),function(_7f,_80,_81){
with(_7f){
objj_msgSend(_7f,"setObjectValue:",nil);
objj_msgSend(_7f,"_sendPartialString");
objj_msgSend(_7f,"_updateCancelButtonVisibility");
objj_msgSend(_81,"setHidden:",YES);
}
}),new objj_method(sel_getUid("_searchFieldSearch:"),function(_82,_83,_84){
with(_82){
objj_msgSend(_82,"setObjectValue:",objj_msgSend(_84,"title"));
objj_msgSend(_82,"_sendPartialString");
objj_msgSend(_82,"_updateCancelButtonVisibility");
}
}),new objj_method(sel_getUid("_searchFieldClearRecents:"),function(_85,_86,_87){
with(_85){
objj_msgSend(_85,"setRecentSearches:",objj_msgSend(CPArray,"array"));
objj_msgSend(_85,"_updateSearchMenu");
}
}),new objj_method(sel_getUid("_registerForAutosaveNotification"),function(_88,_89){
with(_88){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_88,sel_getUid("_updateAutosavedRecents:"),"CPAutosavedRecentsChangedNotification",nil);
}
}),new objj_method(sel_getUid("_deregisterForAutosaveNotification"),function(_8a,_8b){
with(_8a){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_8a,"CPAutosavedRecentsChangedNotification",nil);
}
}),new objj_method(sel_getUid("_updateAutosavedRecents:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=objj_msgSend(_8e,"object");
var _90=objj_msgSend(_8c,"recentSearches");
objj_msgSend(objj_msgSend(CPUserDefaults,"standardUserDefaults"),"setObject:forKey:",_90,_8f);
}
}),new objj_method(sel_getUid("_autosaveRecentSearchList"),function(_91,_92){
with(_91){
if(_recentsAutosaveName!=nil){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:","CPAutosavedRecentsChangedNotification",_recentsAutosaveName);
}
}
}),new objj_method(sel_getUid("_loadRecentSearchList"),function(_93,_94){
with(_93){
var _95,_96=objj_msgSend(_93,"recentsAutosaveName");
_95=objj_msgSend(objj_msgSend(CPUserDefaults,"standardUserDefaults"),"objectForKey:",_96);
_recentSearches=_95;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_97,_98){
with(_97){
if(_97!=objj_msgSend(CPSearchField,"class")){
return;
}
var _99=objj_msgSend(CPBundle,"bundleForClass:",_97);
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_99,"pathForResource:","CPSearchField/CPSearchFieldSearch.png"));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_99,"pathForResource:","CPSearchField/CPSearchFieldFind.png"));
_3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_99,"pathForResource:","CPSearchField/CPSearchFieldCancel.png"));
_4=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_99,"pathForResource:","CPSearchField/CPSearchFieldCancelPressed.png"));
}
}),new objj_method(sel_getUid("_keyboardDelayForPartialSearchString:"),function(_9a,_9b,_9c){
with(_9a){
return (6-MIN(objj_msgSend(_9c,"length"),4))/10;
}
})]);
var _9d="CPSearchButtonKey",_9e="CPCancelButtonKey",_9f="CPRecentsAutosaveNameKey",_a0="CPSendsWholeSearchStringKey",_a1="CPSendsSearchStringImmediatelyKey",_a2="CPMaximumRecentsKey",_a3="CPSearchMenuTemplateKey";
var _5=objj_getClass("CPSearchField");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSearchField\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("encodeWithCoder:"),function(_a4,_a5,_a6){
with(_a4){
objj_msgSendSuper({receiver:_a4,super_class:objj_getClass("CPTextField")},"encodeWithCoder:",_a6);
objj_msgSend(_a6,"encodeObject:forKey:",_searchButton,_9d);
objj_msgSend(_a6,"encodeObject:forKey:",_cancelButton,_9e);
objj_msgSend(_a6,"encodeObject:forKey:",_recentsAutosaveName,_9f);
objj_msgSend(_a6,"encodeBool:forKey:",_sendsWholeSearchString,_a0);
objj_msgSend(_a6,"encodeBool:forKey:",_sendsSearchStringImmediately,_a1);
objj_msgSend(_a6,"encodeInt:forKey:",_maximumRecents,_a2);
objj_msgSend(_a6,"encodeObject:forKey:",_searchMenuTemplate,_a3);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_a7,_a8,_a9){
with(_a7){
_a7=objj_msgSendSuper({receiver:_a7,super_class:objj_getClass("CPTextField")},"initWithCoder:",_a9);
_searchButton=objj_msgSend(_a9,"decodeObjectForKey:",_9d);
_cancelButton=objj_msgSend(_a9,"decodeObjectForKey:",_9e);
_recentsAutosaveName=objj_msgSend(_a9,"decodeObjectForKey:",_9f);
_sendsWholeSearchString=objj_msgSend(_a9,"decodeBoolForKey:",_a0);
_sendsSearchStringImmediately=objj_msgSend(_a9,"decodeBoolForKey:",_a1);
_maximumRecents=objj_msgSend(_a9,"decodeIntForKey:",_a2);
objj_msgSend(_a7,"setSearchMenuTemplate:",objj_msgSend(_a9,"decodeObjectForKey:",_a3));
objj_msgSend(_a7,"resetCancelButton");
objj_msgSend(_a7,"setDelegate:",_a7);
return _a7;
}
})]);
