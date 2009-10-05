I;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;32;Foundation/CPKeyValueObserving.jI;23;Foundation/CPIndexSet.jI;21;Foundation/CPString.jI;15;AppKit/CPView.jc;10068;
var _1=objj_allocateClassPair(CPObject,"CPAccordionViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier"),new objj_ivar("_view"),new objj_ivar("_label")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return _identifier;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_5,_6,_7){
with(_5){
_identifier=_7;
}
}),new objj_method(sel_getUid("view"),function(_8,_9){
with(_8){
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_a,_b,_c){
with(_a){
_view=_c;
}
}),new objj_method(sel_getUid("label"),function(_d,_e){
with(_d){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_f,_10,_11){
with(_f){
_label=_11;
}
}),new objj_method(sel_getUid("init"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_14,_15,_16){
with(_14){
_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPObject")},"init");
if(_14){
objj_msgSend(_14,"setIdentifier:",_16);
}
return _14;
}
})]);
var _1=objj_allocateClassPair(CPView,"CPAccordionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_dirtyItemIndex"),new objj_ivar("_itemHeaderPrototype"),new objj_ivar("_items"),new objj_ivar("_itemViews"),new objj_ivar("_expandedItemIndexes")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_17,_18,_19){
with(_17){
_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("CPView")},"initWithFrame:",_19);
if(_17){
_items=[];
_itemViews=[];
_expandedItemIndexes=objj_msgSend(CPIndexSet,"indexSet");
objj_msgSend(_17,"setItemHeaderPrototype:",objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:100,height:24}}));
}
return _17;
}
}),new objj_method(sel_getUid("setItemHeaderPrototype:"),function(_1a,_1b,_1c){
with(_1a){
_itemHeaderPrototype=_1c;
}
}),new objj_method(sel_getUid("itemHeaderPrototype"),function(_1d,_1e){
with(_1d){
return _itemHeaderPrototype;
}
}),new objj_method(sel_getUid("items"),function(_1f,_20){
with(_1f){
return _items;
}
}),new objj_method(sel_getUid("addItem:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_21,"insertItem:atIndex:",_23,_items.length);
}
}),new objj_method(sel_getUid("insertItem:atIndex:"),function(_24,_25,_26,_27){
with(_24){
objj_msgSend(_expandedItemIndexes,"addIndex:",_27);
var _28=objj_msgSend(objj_msgSend(_CPAccordionItemView,"alloc"),"initWithAccordionView:",_24);
objj_msgSend(_28,"setIndex:",_27);
objj_msgSend(_28,"setLabel:",objj_msgSend(_26,"label"));
objj_msgSend(_28,"setContentView:",objj_msgSend(_26,"view"));
objj_msgSend(_24,"addSubview:",_28);
objj_msgSend(_items,"insertObject:atIndex:",_26,_27);
objj_msgSend(_itemViews,"insertObject:atIndex:",_28,_27);
objj_msgSend(_24,"_invalidateItemsStartingAtIndex:",_27);
objj_msgSend(_24,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeItem:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_29,"removeItemAtIndex:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_2b));
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(_expandedItemIndexes,"removeIndex:",_2e);
objj_msgSend(_itemViews[_2e],"removeFromSuperview");
objj_msgSend(_items,"removeObjectAtIndex:",_2e);
objj_msgSend(_itemViews,"removeObjectAtIndex:",_2e);
objj_msgSend(_2c,"_invalidateItemsStartingAtIndex:",_2e);
objj_msgSend(_2c,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeAllItems"),function(_2f,_30){
with(_2f){
var _31=_items.length;
while(_31--){
objj_msgSend(_2f,"removeItemAtIndex:",_31);
}
}
}),new objj_method(sel_getUid("expandItemAtIndex:"),function(_32,_33,_34){
with(_32){
if(!objj_msgSend(_itemViews[_34],"isCollapsed")){
return;
}
objj_msgSend(_expandedItemIndexes,"addIndex:",_34);
objj_msgSend(_itemViews[_34],"setCollapsed:",NO);
objj_msgSend(_32,"_invalidateItemsStartingAtIndex:",_34);
}
}),new objj_method(sel_getUid("collapseItemAtIndex:"),function(_35,_36,_37){
with(_35){
if(objj_msgSend(_itemViews[_37],"isCollapsed")){
return;
}
objj_msgSend(_expandedItemIndexes,"removeIndex:",_37);
objj_msgSend(_itemViews[_37],"setCollapsed:",YES);
objj_msgSend(_35,"_invalidateItemsStartingAtIndex:",_37);
}
}),new objj_method(sel_getUid("toggleItemAtIndex:"),function(_38,_39,_3a){
with(_38){
var _3b=_itemViews[_3a];
if(objj_msgSend(_3b,"isCollapsed")){
objj_msgSend(_38,"expandItemAtIndex:",_3a);
}else{
objj_msgSend(_38,"collapseItemAtIndex:",_3a);
}
}
}),new objj_method(sel_getUid("expandedItemIndexes"),function(_3c,_3d){
with(_3c){
return _expandedItemIndexes;
}
}),new objj_method(sel_getUid("collapsedItemIndexes"),function(_3e,_3f){
with(_3e){
var _40=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,_items.length));
objj_msgSend(_40,"removeIndexes:",_expandedIndexes);
return _40;
}
}),new objj_method(sel_getUid("_invalidateItemsStartingAtIndex:"),function(_41,_42,_43){
with(_41){
if(_dirtyItemIndex===CPNotFound){
_dirtyItemIndex=_43;
}
_dirtyItemIndex=MIN(_dirtyItemIndex,_43);
objj_msgSend(_41,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_44,_45,_46){
with(_44){
var _47=(objj_msgSend(_44,"frame").size.width);
objj_msgSendSuper({receiver:_44,super_class:objj_getClass("CPView")},"setFrameSize:",_46);
if(_47!==(objj_msgSend(_44,"frame").size.width)){
objj_msgSend(_44,"_invalidateItemsStartingAtIndex:",0);
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_48,_49){
with(_48){
if(_items.length<=0){
return objj_msgSend(_48,"setFrameSize:",{width:(objj_msgSend(_48,"frame").size.width),height:0});
}
if(_dirtyItemIndex===CPNotFound){
return;
}
_dirtyItemIndex=MIN(_dirtyItemIndex,_items.length-1);
var _4a=_dirtyItemIndex,_4b=_itemViews.length,_4c=(objj_msgSend(_48,"bounds").size.width),y=_4a>0?CGRectGetMaxY(objj_msgSend(_itemViews[_4a-1],"frame")):0;
_dirtyItemIndex=CPNotFound;
for(;_4a<_4b;++_4a){
var _4e=_itemViews[_4a];
objj_msgSend(_4e,"setFrameY:width:",y,_4c);
y=CGRectGetMaxY(objj_msgSend(_4e,"frame"));
}
objj_msgSend(_48,"setFrameSize:",{width:(objj_msgSend(_48,"frame").size.width),height:y});
}
})]);
var _1=objj_allocateClassPair(CPView,"_CPAccordionItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_accordionView"),new objj_ivar("_isCollapsed"),new objj_ivar("_index"),new objj_ivar("_headerView"),new objj_ivar("_contentView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("isCollapsed"),function(_4f,_50){
with(_4f){
return _isCollapsed;
}
}),new objj_method(sel_getUid("setCollapsed:"),function(_51,_52,_53){
with(_51){
_isCollapsed=_53;
}
}),new objj_method(sel_getUid("index"),function(_54,_55){
with(_54){
return _index;
}
}),new objj_method(sel_getUid("setIndex:"),function(_56,_57,_58){
with(_56){
_index=_58;
}
}),new objj_method(sel_getUid("initWithAccordionView:"),function(_59,_5a,_5b){
with(_59){
_59=objj_msgSendSuper({receiver:_59,super_class:objj_getClass("CPView")},"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
if(_59){
_accordionView=_5b;
_isCollapsed=NO;
var _5c=objj_msgSend(_59,"bounds");
_headerView=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",objj_msgSend(_accordionView,"itemHeaderPrototype")));
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setTarget:"))&&objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_headerView,"setTarget:",_59);
objj_msgSend(_headerView,"setAction:",sel_getUid("toggle:"));
}
objj_msgSend(_59,"addSubview:",_headerView);
}
return _59;
}
}),new objj_method(sel_getUid("toggle:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(_accordionView,"toggleItemAtIndex:",objj_msgSend(_5d,"index"));
}
}),new objj_method(sel_getUid("setLabel:"),function(_60,_61,_62){
with(_60){
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setTitle:"))){
objj_msgSend(_headerView,"setTitle:",_62);
}else{
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setLabel:"))){
objj_msgSend(_headerView,"setLabel:",_62);
}else{
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setStringValue:"))){
objj_msgSend(_headerView,"setStringValue:",_62);
}
}
}
}
}),new objj_method(sel_getUid("setContentView:"),function(_63,_64,_65){
with(_63){
if(_contentView===_65){
return;
}
objj_msgSend(_contentView,"removeObserver:forKeyPath:",_63,"frame");
objj_msgSend(_contentView,"removeFromSuperview");
_contentView=_65;
objj_msgSend(_contentView,"addObserver:forKeyPath:options:context:",_63,"frame",0,NULL);
objj_msgSend(_63,"addSubview:",_contentView);
objj_msgSend(_accordionView,"_invalidateItemsStartingAtIndex:",objj_msgSend(_63,"index"));
}
}),new objj_method(sel_getUid("setFrameY:width:"),function(_66,_67,aY,_69){
with(_66){
var _6a=(objj_msgSend(_headerView,"frame").size.height);
objj_msgSend(_headerView,"setFrameSize:",{width:_69,height:_6a});
objj_msgSend(_contentView,"setFrameOrigin:",{x:0,y:_6a});
if(objj_msgSend(_66,"isCollapsed")){
objj_msgSend(_66,"setFrame:",{origin:{x:0,y:aY},size:{width:_69,height:_6a}});
}else{
var _6b=(objj_msgSend(_contentView,"frame").size.height);
objj_msgSend(_contentView,"setFrameSize:",{width:_69,height:_6b});
objj_msgSend(_66,"setFrame:",{origin:{x:0,y:aY},size:{width:_69,height:_6b+_6a}});
}
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_6c,_6d,_6e){
with(_6c){
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_6f,_70,_71,_72,_73,_74){
with(_6f){
if(_71==="frame"&&!CGRectEqualToRect(objj_msgSend(_73,"objectForKey:",CPKeyValueChangeOldKey),objj_msgSend(_73,"objectForKey:",CPKeyValueChangeNewKey))){
objj_msgSend(_accordionView,"_invalidateItemsStartingAtIndex:",objj_msgSend(_6f,"index"));
}
}
})]);
