i;10;CPButton.ji;12;CPGeometry.ji;8;CPMenu.ji;12;CPMenuItem.jc;13908;
var _1=7;
CPPopUpButtonStatePullsDown=CPThemeState("pulls-down");
var _2=objj_allocateClassPair(CPButton,"CPPopUpButton"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_selectedIndex"),new objj_ivar("_preferredEdge"),new objj_ivar("_menu")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:pullsDown:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPButton")},"initWithFrame:",_6);
if(_4){
_selectedIndex=CPNotFound;
_preferredEdge=CPMaxYEdge;
objj_msgSend(_4,"setValue:forThemeAttribute:",CPImageLeft,"image-position");
objj_msgSend(_4,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
objj_msgSend(_4,"setValue:forThemeAttribute:",CPLineBreakByTruncatingTail,"line-break-mode");
objj_msgSend(_4,"setMenu:",objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:",""));
objj_msgSend(_4,"setPullsDown:",_7);
}
return _4;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"initWithFrame:pullsDown:",_a,NO);
}
}),new objj_method(sel_getUid("setPullsDown:"),function(_b,_c,_d){
with(_b){
if(_d){
var _e=objj_msgSend(_b,"setThemeState:",CPPopUpButtonStatePullsDown);
}else{
var _e=objj_msgSend(_b,"unsetThemeState:",CPPopUpButtonStatePullsDown);
}
if(!_e){
return;
}
var _f=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_f,"count")<=0){
return;
}
objj_msgSend(_f[0],"setHidden:",objj_msgSend(_b,"pullsDown"));
objj_msgSend(_b,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("pullsDown"),function(_10,_11){
with(_10){
return objj_msgSend(_10,"hasThemeState:",CPPopUpButtonStatePullsDown);
}
}),new objj_method(sel_getUid("addItem:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_menu,"addItem:",_14);
}
}),new objj_method(sel_getUid("addItemWithTitle:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_menu,"addItemWithTitle:action:keyEquivalent:",_17,NULL,nil);
}
}),new objj_method(sel_getUid("addItemsWithTitles:"),function(_18,_19,_1a){
with(_18){
var _1b=0,_1c=objj_msgSend(_1a,"count");
for(;_1b<_1c;++_1b){
objj_msgSend(_18,"addItemWithTitle:",_1a[_1b]);
}
}
}),new objj_method(sel_getUid("insertItemWithTitle:atIndex:"),function(_1d,_1e,_1f,_20){
with(_1d){
var _21=objj_msgSend(_1d,"itemArray"),_22=objj_msgSend(_21,"count");
while(_22--){
if(objj_msgSend(_21[_22],"title")==_1f){
objj_msgSend(_1d,"removeItemAtIndex:",_22);
}
}
objj_msgSend(_menu,"insertItemWithTitle:action:keyEquivalent:atIndex:",_1f,NULL,nil,_20);
}
}),new objj_method(sel_getUid("removeAllItems"),function(_23,_24){
with(_23){
var _25=objj_msgSend(_menu,"numberOfItems");
while(_25--){
objj_msgSend(_menu,"removeItemAtIndex:",0);
}
}
}),new objj_method(sel_getUid("removeItemWithTitle:"),function(_26,_27,_28){
with(_26){
objj_msgSend(_26,"removeItemAtIndex:",objj_msgSend(_26,"indexOfItemWithTitle:",_28));
objj_msgSend(_26,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_menu,"removeItemAtIndex:",_2b);
objj_msgSend(_29,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("selectedItem"),function(_2c,_2d){
with(_2c){
if(_selectedIndex<0||_selectedIndex>objj_msgSend(_2c,"numberOfItems")-1){
return nil;
}
return objj_msgSend(_menu,"itemAtIndex:",_selectedIndex);
}
}),new objj_method(sel_getUid("titleOfSelectedItem"),function(_2e,_2f){
with(_2e){
return objj_msgSend(objj_msgSend(_2e,"selectedItem"),"title");
}
}),new objj_method(sel_getUid("indexOfSelectedItem"),function(_30,_31){
with(_30){
return _selectedIndex;
}
}),new objj_method(sel_getUid("objectValue"),function(_32,_33){
with(_32){
return _selectedIndex;
}
}),new objj_method(sel_getUid("selectItem:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"selectItemAtIndex:",objj_msgSend(_34,"indexOfItem:",_36));
}
}),new objj_method(sel_getUid("selectItemAtIndex:"),function(_37,_38,_39){
with(_37){
if(_selectedIndex==_39){
return;
}
if(_selectedIndex>=0&&!objj_msgSend(_37,"pullsDown")){
objj_msgSend(objj_msgSend(_37,"selectedItem"),"setState:",CPOffState);
}
_selectedIndex=_39;
if(_selectedIndex>=0&&!objj_msgSend(_37,"pullsDown")){
objj_msgSend(objj_msgSend(_37,"selectedItem"),"setState:",CPOnState);
}
objj_msgSend(_37,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("selectItemWithTag:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSend(_3a,"selectItemAtIndex:",objj_msgSend(_3a,"indexOfItemWithTag:",_3c));
}
}),new objj_method(sel_getUid("selectItemWithTitle:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSend(_3d,"selectItemAtIndex:",objj_msgSend(_3d,"indexOfItemWithTitle:",_3f));
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_40,_41,_42){
with(_40){
objj_msgSend(_40,"selectItemAtIndex:",objj_msgSend(_42,"intValue"));
}
}),new objj_method(sel_getUid("menu"),function(_43,_44){
with(_43){
return _menu;
}
}),new objj_method(sel_getUid("setMenu:"),function(_45,_46,_47){
with(_45){
if(_menu===_47){
return;
}
var _48=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_menu){
objj_msgSend(_48,"removeObserver:name:object:",_45,CPMenuDidAddItemNotification,_menu);
objj_msgSend(_48,"removeObserver:name:object:",_45,CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_48,"removeObserver:name:object:",_45,CPMenuDidRemoveItemNotification,_menu);
}
_menu=_47;
if(_menu){
objj_msgSend(_48,"addObserver:selector:name:object:",_45,sel_getUid("menuDidAddItem:"),CPMenuDidAddItemNotification,_menu);
objj_msgSend(_48,"addObserver:selector:name:object:",_45,sel_getUid("menuDidChangeItem:"),CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_48,"addObserver:selector:name:object:",_45,sel_getUid("menuDidRemoveItem:"),CPMenuDidRemoveItemNotification,_menu);
}
objj_msgSend(_45,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("numberOfItems"),function(_49,_4a){
with(_49){
return objj_msgSend(_menu,"numberOfItems");
}
}),new objj_method(sel_getUid("itemArray"),function(_4b,_4c){
with(_4b){
return objj_msgSend(_menu,"itemArray");
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_4d,_4e,_4f){
with(_4d){
return objj_msgSend(_menu,"itemAtIndex:",_4f);
}
}),new objj_method(sel_getUid("itemTitleAtIndex:"),function(_50,_51,_52){
with(_50){
return objj_msgSend(objj_msgSend(_menu,"itemAtIndex:",_52),"title");
}
}),new objj_method(sel_getUid("itemTitles"),function(_53,_54){
with(_53){
var _55=[],_56=objj_msgSend(_53,"itemArray"),_57=0,_58=objj_msgSend(_56,"count");
for(;_57<_58;++_57){
_56.push(objj_msgSend(_56[_57],"title"));
}
}
}),new objj_method(sel_getUid("itemWithTitle:"),function(_59,_5a,_5b){
with(_59){
return objj_msgSend(_menu,"itemAtIndex:",objj_msgSend(_menu,"indexOfItemWithTitle:",_5b));
}
}),new objj_method(sel_getUid("lastItem"),function(_5c,_5d){
with(_5c){
return objj_msgSend(objj_msgSend(_menu,"itemArray"),"lastObject");
}
}),new objj_method(sel_getUid("indexOfItem:"),function(_5e,_5f,_60){
with(_5e){
return objj_msgSend(_menu,"indexOfItem:",_60);
}
}),new objj_method(sel_getUid("indexOfItemWithTag:"),function(_61,_62,_63){
with(_61){
return objj_msgSend(_menu,"indexOfItemWithTag:",_63);
}
}),new objj_method(sel_getUid("indexOfItemWithTitle:"),function(_64,_65,_66){
with(_64){
return objj_msgSend(_menu,"indexOfItemWithTitle:",_66);
}
}),new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"),function(_67,_68,_69){
with(_67){
return objj_msgSend(_menu,"indexOfItemWithRepresentedObject:",_69);
}
}),new objj_method(sel_getUid("indexOfItemWithTarget:action:"),function(_6a,_6b,_6c,_6d){
with(_6a){
return objj_msgSend(_menu,"indexOfItemWithTarget:action:",_6c,_6d);
}
}),new objj_method(sel_getUid("preferredEdge"),function(_6e,_6f){
with(_6e){
return _preferredEdge;
}
}),new objj_method(sel_getUid("setPreferredEdge:"),function(_70,_71,_72){
with(_70){
_preferredEdge=_72;
}
}),new objj_method(sel_getUid("setTitle:"),function(_73,_74,_75){
with(_73){
if(objj_msgSend(_73,"title")===_75){
return;
}
if(objj_msgSend(_73,"pullsDown")){
var _76=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_76,"count")<=0){
objj_msgSend(_73,"addItemWithTitle:",_75);
}else{
objj_msgSend(_76[0],"setTitle:",_75);
objj_msgSend(_73,"synchronizeTitleAndSelectedItem");
}
}else{
var _77=objj_msgSend(_73,"indexOfItemWithTitle:",_75);
if(_77<0){
objj_msgSend(_73,"addItemWithTitle:",_75);
_77=objj_msgSend(_73,"numberOfItems")-1;
}
objj_msgSend(_73,"selectItemAtIndex:",_77);
}
}
}),new objj_method(sel_getUid("setImage:"),function(_78,_79,_7a){
with(_78){
}
}),new objj_method(sel_getUid("synchronizeTitleAndSelectedItem"),function(_7b,_7c){
with(_7b){
var _7d=nil;
if(objj_msgSend(_7b,"pullsDown")){
var _7e=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_7e,"count")>0){
_7d=_7e[0];
}
}else{
_7d=objj_msgSend(_7b,"selectedItem");
}
objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPButton")},"setImage:",objj_msgSend(_7d,"image"));
objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPButton")},"setTitle:",objj_msgSend(_7d,"title"));
}
}),new objj_method(sel_getUid("menuDidAddItem:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(objj_msgSend(_81,"userInfo"),"objectForKey:","CPMenuItemIndex");
if(_selectedIndex<0){
objj_msgSend(_7f,"selectItemAtIndex:",0);
}else{
if(_82==_selectedIndex){
objj_msgSend(_7f,"synchronizeTitleAndSelectedItem");
}else{
if(_82<_selectedIndex){
++_selectedIndex;
}
}
}
if(_82==0&&objj_msgSend(_7f,"pullsDown")){
var _83=objj_msgSend(_menu,"itemArray");
objj_msgSend(_83[0],"setHidden:",YES);
if(_83.length>0){
objj_msgSend(_83[1],"setHidden:",NO);
}
}
var _84=objj_msgSend(_menu,"itemArray")[_82],_85=objj_msgSend(_84,"action");
if(!_85||(_85===sel_getUid("_popUpItemAction:"))){
objj_msgSend(_84,"setTarget:",_7f);
objj_msgSend(_84,"setAction:",sel_getUid("_popUpItemAction:"));
}
}
}),new objj_method(sel_getUid("menuDidChangeItem:"),function(_86,_87,_88){
with(_86){
var _89=objj_msgSend(objj_msgSend(_88,"userInfo"),"objectForKey:","CPMenuItemIndex");
if(objj_msgSend(_86,"pullsDown")&&_89!=0){
return;
}
if(!objj_msgSend(_86,"pullsDown")&&_89!=_selectedIndex){
return;
}
objj_msgSend(_86,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("menuDidRemoveItem:"),function(_8a,_8b,_8c){
with(_8a){
var _8d=objj_msgSend(_8a,"numberOfItems");
if(_8d<=_selectedIndex&&_8d>0){
objj_msgSend(_8a,"selectItemAtIndex:",_8d-1);
}else{
objj_msgSend(_8a,"synchronizeTitleAndSelectedItem");
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_8e,_8f,_90){
with(_8e){
if(!objj_msgSend(_8e,"isEnabled")||!objj_msgSend(_8e,"numberOfItems")){
return;
}
objj_msgSend(_8e,"highlight:",YES);
var _91=objj_msgSend(_8e,"menu"),_92=objj_msgSend(_8e,"window"),_93=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_91,objj_msgSend(_8e,"font"));
objj_msgSend(_93,"setDelegate:",_8e);
objj_msgSend(_93,"setBackgroundStyle:",_CPMenuWindowPopUpBackgroundStyle);
if(objj_msgSend(_8e,"pullsDown")){
var _94=objj_msgSend(_92,"convertBaseToGlobal:",objj_msgSend(_8e,"convertPoint:toView:",CGPointMake(0,CGRectGetMaxY(objj_msgSend(_8e,"bounds"))),nil));
}else{
var _95=objj_msgSend(_8e,"convertRect:toView:",objj_msgSend(_8e,"contentRectForBounds:",objj_msgSend(_8e,"bounds")),nil),_94=objj_msgSend(_92,"convertBaseToGlobal:",_95.origin),_96=objj_msgSend(_93,"rectForItemAtIndex:",_selectedIndex);
_94.x-=CGRectGetMinX(_96)+objj_msgSend(_93,"overlapOffsetWidth")+objj_msgSend(objj_msgSend(objj_msgSend(_91,"itemAtIndex:",_selectedIndex),"_menuItemView"),"overlapOffsetWidth");
_94.y-=CGRectGetMinY(_96)+(CGRectGetHeight(_96)-CGRectGetHeight(_95))/2;
}
objj_msgSend(_93,"setFrameOrigin:",_94);
var _97=CGRectGetMaxX(objj_msgSend(_93,"frame")),_98=objj_msgSend(_92,"convertBaseToGlobal:",CGPointMake(CGRectGetMaxX(objj_msgSend(_8e,"convertRect:toView:",objj_msgSend(_8e,"bounds"),nil)),0)).x;
if(_97<_98){
objj_msgSend(_93,"setMinWidth:",CGRectGetWidth(objj_msgSend(_93,"frame"))+_98-_97-(objj_msgSend(_8e,"pullsDown")?0:_1));
}
objj_msgSend(_93,"orderFront:",_8e);
objj_msgSend(_93,"beginTrackingWithEvent:sessionDelegate:didEndSelector:",_90,_8e,sel_getUid("menuWindowDidFinishTracking:highlightedItem:"));
}
}),new objj_method(sel_getUid("menuWindowDidFinishTracking:highlightedItem:"),function(_99,_9a,_9b,_9c){
with(_99){
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_9b);
objj_msgSend(_99,"highlight:",NO);
var _9d=objj_msgSend(_menu,"indexOfItem:",_9c);
if(_9d==CPNotFound){
return;
}
objj_msgSend(_99,"selectItemAtIndex:",_9d);
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_9c,"action"),objj_msgSend(_9c,"target"),_9c);
}
}),new objj_method(sel_getUid("_popUpItemAction:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_9e,"sendAction:to:",objj_msgSend(_9e,"action"),objj_msgSend(_9e,"target"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeClass"),function(_a1,_a2){
with(_a1){
return "popup-button";
}
})]);
var _a3="CPPopUpButtonMenuKey",_a4="CPPopUpButtonSelectedIndexKey",_a5="CPPopUpButtonPullsDownKey";
var _2=objj_getClass("CPPopUpButton");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPPopUpButton\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_a6,_a7,_a8){
with(_a6){
_a6=objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("CPButton")},"initWithCoder:",_a8);
if(_a6){
_selectedIndex=-1;
objj_msgSend(_a6,"setMenu:",objj_msgSend(_a8,"decodeObjectForKey:",_a3));
objj_msgSend(_a6,"selectItemAtIndex:",objj_msgSend(_a8,"decodeObjectForKey:",_a4));
}
return _a6;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a9,_aa,_ab){
with(_a9){
objj_msgSendSuper({receiver:_a9,super_class:objj_getClass("CPButton")},"encodeWithCoder:",_ab);
objj_msgSend(_ab,"encodeObject:forKey:",_menu,_a3);
objj_msgSend(_ab,"encodeInt:forKey:",_selectedIndex,_a4);
}
})]);
