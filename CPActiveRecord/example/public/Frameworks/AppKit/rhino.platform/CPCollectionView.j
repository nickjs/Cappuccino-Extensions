I;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;23;Foundation/CPIndexSet.jI;28;Foundation/CPKeyedArchiver.jI;30;Foundation/CPKeyedUnarchiver.ji;8;CPView.ji;22;CPCollectionViewItem.jc;12832;
var _1=objj_allocateClassPair(CPView,"CPCollectionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_content"),new objj_ivar("_items"),new objj_ivar("_itemData"),new objj_ivar("_itemPrototype"),new objj_ivar("_itemForDragging"),new objj_ivar("_cachedItems"),new objj_ivar("_maxNumberOfRows"),new objj_ivar("_maxNumberOfColumns"),new objj_ivar("_minItemSize"),new objj_ivar("_maxItemSize"),new objj_ivar("_backgroundColors"),new objj_ivar("_tileWidth"),new objj_ivar("_isSelectable"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_selectionIndexes"),new objj_ivar("_itemSize"),new objj_ivar("_horizontalMargin"),new objj_ivar("_verticalMargin"),new objj_ivar("_numberOfRows"),new objj_ivar("_numberOfColumns"),new objj_ivar("_delegate"),new objj_ivar("_mouseDownEvent")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_items=[];
_content=[];
_cachedItems=[];
_itemSize=CGSizeMakeZero();
_minItemSize=CGSizeMakeZero();
_maxItemSize=CGSizeMakeZero();
objj_msgSend(_3,"setBackgroundColors:",nil);
_verticalMargin=5;
_tileWidth=-1;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_allowsEmptySelection=YES;
_isSelectable=YES;
}
return _3;
}
}),new objj_method(sel_getUid("setItemPrototype:"),function(_6,_7,_8){
with(_6){
_cachedItems=[];
_itemData=nil;
_itemForDragging=nil;
_itemPrototype=_8;
objj_msgSend(_6,"reloadContent");
}
}),new objj_method(sel_getUid("itemPrototype"),function(_9,_a){
with(_9){
return _itemPrototype;
}
}),new objj_method(sel_getUid("newItemForRepresentedObject:"),function(_b,_c,_d){
with(_b){
var _e=nil;
if(_cachedItems.length){
_e=_cachedItems.pop();
}else{
if(!_itemData){
if(_itemPrototype){
_itemData=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_itemPrototype);
}
}
_e=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_itemData);
}
objj_msgSend(_e,"setRepresentedObject:",_d);
objj_msgSend(objj_msgSend(_e,"view"),"setFrameSize:",_itemSize);
return _e;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_f,_10){
with(_f){
return YES;
}
}),new objj_method(sel_getUid("isFirstResponder"),function(_11,_12){
with(_11){
return objj_msgSend(objj_msgSend(_11,"window"),"firstResponder")===_11;
}
}),new objj_method(sel_getUid("setContent:"),function(_13,_14,_15){
with(_13){
if(_content==_15){
return;
}
_content=_15;
objj_msgSend(_13,"reloadContent");
}
}),new objj_method(sel_getUid("content"),function(_16,_17){
with(_16){
return _content;
}
}),new objj_method(sel_getUid("items"),function(_18,_19){
with(_18){
return _items;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_1a,_1b,_1c){
with(_1a){
if(_isSelectable==_1c){
return;
}
_isSelectable=_1c;
if(!_isSelectable){
var _1d=CPNotFound;
while((_1d=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_1d))!=CPNotFound){
objj_msgSend(_items[_1d],"setSelected:",NO);
}
}
}
}),new objj_method(sel_getUid("isSelected"),function(_1e,_1f){
with(_1e){
return _isSelected;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_20,_21,_22){
with(_20){
_allowsEmptySelection=_22;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_23,_24){
with(_23){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_25,_26,_27){
with(_25){
_allowsMultipleSelection=_27;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_28,_29){
with(_28){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_2a,_2b,_2c){
with(_2a){
if(_selectionIndexes==_2c||!_isSelectable){
return;
}
var _2d=CPNotFound;
while((_2d=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_2d))!=CPNotFound){
objj_msgSend(_items[_2d],"setSelected:",NO);
}
_selectionIndexes=_2c;
var _2d=CPNotFound;
while((_2d=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_2d))!=CPNotFound){
objj_msgSend(_items[_2d],"setSelected:",YES);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionViewDidChangeSelection:"))){
objj_msgSend(_delegate,"collectionViewDidChangeSelection:",_2a);
}
}
}),new objj_method(sel_getUid("selectionIndexes"),function(_2e,_2f){
with(_2e){
return _selectionIndexes;
}
}),new objj_method(sel_getUid("reloadContent"),function(_30,_31){
with(_30){
var _32=_items.length;
while(_32--){
objj_msgSend(objj_msgSend(_items[_32],"view"),"removeFromSuperview");
_cachedItems.push(_items[_32]);
}
_items=[];
if(!_itemPrototype||!_content){
return;
}
var _33=0;
_32=_content.length;
for(;_33<_32;++_33){
_items.push(objj_msgSend(_30,"newItemForRepresentedObject:",_content[_33]));
objj_msgSend(_30,"addSubview:",objj_msgSend(_items[_33],"view"));
}
objj_msgSend(_30,"tile");
}
}),new objj_method(sel_getUid("tile"),function(_34,_35){
with(_34){
var _36=CGRectGetWidth(objj_msgSend(_34,"bounds"));
if(!objj_msgSend(_content,"count")||_36==_tileWidth){
return;
}
var _37=CGSizeMakeCopy(_minItemSize);
_numberOfColumns=MAX(1,FLOOR(_36/_37.width));
if(_maxNumberOfColumns>0){
_numberOfColumns=MIN(_maxNumberOfColumns,_numberOfColumns);
}
var _38=_36-_numberOfColumns*_37.width,_39=NO;
if(_38>0&&_37.width<_maxItemSize.width){
_37.width=MIN(_maxItemSize.width,_37.width+FLOOR(_38/_numberOfColumns));
}
if(_maxNumberOfColumns==1&&_37.width<_maxItemSize.width&&_37.width<_36){
_37.width=MIN(_maxItemSize.width,_36);
}
if(!CGSizeEqualToSize(_itemSize,_37)){
_itemSize=_37;
_39=YES;
}
var _3a=0,_3b=_items.length;
if(_maxNumberOfColumns>0&&_maxNumberOfRows>0){
_3b=MIN(_3b,_maxNumberOfColumns*_maxNumberOfRows);
}
_numberOfRows=CEIL(_3b/_numberOfColumns);
_horizontalMargin=FLOOR((_36-_numberOfColumns*_37.width)/(_numberOfColumns+1));
var x=_horizontalMargin,y=-_37.height;
for(;_3a<_3b;++_3a){
if(_3a%_numberOfColumns==0){
x=_horizontalMargin;
y+=_verticalMargin+_37.height;
}
var _3e=objj_msgSend(_items[_3a],"view");
objj_msgSend(_3e,"setFrameOrigin:",CGPointMake(x,y));
if(_39){
objj_msgSend(_3e,"setFrameSize:",_itemSize);
}
x+=_37.width+_horizontalMargin;
}
_tileWidth=_36;
objj_msgSend(_34,"setFrameSize:",CGSizeMake(_36,y+_37.height+_verticalMargin));
_tileWidth=-1;
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_3f,_40,_41){
with(_3f){
objj_msgSend(_3f,"tile");
}
}),new objj_method(sel_getUid("setMaxNumberOfRows:"),function(_42,_43,_44){
with(_42){
if(_maxNumberOfRows==_44){
return;
}
_maxNumberOfRows=_44;
objj_msgSend(_42,"tile");
}
}),new objj_method(sel_getUid("maxNumberOfRows"),function(_45,_46){
with(_45){
return _maxNumberOfRows;
}
}),new objj_method(sel_getUid("setMaxNumberOfColumns:"),function(_47,_48,_49){
with(_47){
if(_maxNumberOfColumns==_49){
return;
}
_maxNumberOfColumns=_49;
objj_msgSend(_47,"tile");
}
}),new objj_method(sel_getUid("maxNumberOfColumns"),function(_4a,_4b){
with(_4a){
return _maxNumberOfColumns;
}
}),new objj_method(sel_getUid("numberOfRows"),function(_4c,_4d){
with(_4c){
return _numberOfRows;
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_4e,_4f){
with(_4e){
return _numberOfColumns;
}
}),new objj_method(sel_getUid("setMinItemSize:"),function(_50,_51,_52){
with(_50){
if(CGSizeEqualToSize(_minItemSize,_52)){
return;
}
_minItemSize=CGSizeMakeCopy(_52);
objj_msgSend(_50,"tile");
}
}),new objj_method(sel_getUid("minItemSize"),function(_53,_54){
with(_53){
return _minItemSize;
}
}),new objj_method(sel_getUid("setMaxItemSize:"),function(_55,_56,_57){
with(_55){
if(CGSizeEqualToSize(_maxItemSize,_57)){
return;
}
_maxItemSize=CGSizeMakeCopy(_57);
objj_msgSend(_55,"tile");
}
}),new objj_method(sel_getUid("maxItemSize"),function(_58,_59){
with(_58){
return _maxItemSize;
}
}),new objj_method(sel_getUid("setBackgroundColors:"),function(_5a,_5b,_5c){
with(_5a){
if(_backgroundColors===_5c){
return;
}
_backgroundColors=_5c;
if(!_backgroundColors){
_backgroundColors=objj_msgSend(CPColor,"whiteColor");
}
if(objj_msgSend(_backgroundColors,"count")===1){
objj_msgSend(_5a,"setBackgroundColor:",_backgroundColors[0]);
}else{
objj_msgSend(_5a,"setBackgroundColor:",nil);
}
objj_msgSend(_5a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("backgroundColors"),function(_5d,_5e){
with(_5d){
return _backgroundColors;
}
}),new objj_method(sel_getUid("mouseUp:"),function(_5f,_60,_61){
with(_5f){
if(objj_msgSend(_selectionIndexes,"count")&&objj_msgSend(_61,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"))){
objj_msgSend(_delegate,"collectionView:didDoubleClickOnItemAtIndex:",_5f,objj_msgSend(_selectionIndexes,"firstIndex"));
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_62,_63,_64){
with(_62){
_mouseDownEvent=_64;
var _65=objj_msgSend(_62,"convertPoint:fromView:",objj_msgSend(_64,"locationInWindow"),nil),row=FLOOR(_65.y/(_itemSize.height+_verticalMargin)),_67=FLOOR(_65.x/(_itemSize.width+_horizontalMargin)),_68=row*_numberOfColumns+_67;
if(_68>=0&&_68<_items.length){
objj_msgSend(_62,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_68));
}else{
if(_allowsEmptySelection){
objj_msgSend(_62,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
}
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_69,_6a,_6b){
with(_69){
if(!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionView:dragTypesForItemsAtIndexes:"))){
return;
}
if(!objj_msgSend(_selectionIndexes,"count")){
return;
}
var _6c=objj_msgSend(_delegate,"collectionView:dragTypesForItemsAtIndexes:",_69,_selectionIndexes);
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",_6c,_69);
var _6d=objj_msgSend(_69,"convertPoint:fromView:",objj_msgSend(_6b,"locationInWindow"),nil);
if(!_itemForDragging){
_itemForDragging=objj_msgSend(_69,"newItemForRepresentedObject:",_content[objj_msgSend(_selectionIndexes,"firstIndex")]);
}else{
objj_msgSend(_itemForDragging,"setRepresentedObject:",_content[objj_msgSend(_selectionIndexes,"firstIndex")]);
}
var _6e=objj_msgSend(_itemForDragging,"view");
objj_msgSend(_6e,"setFrameSize:",_itemSize);
objj_msgSend(_6e,"setAlphaValue:",0.7);
objj_msgSend(_69,"dragView:at:offset:event:pasteboard:source:slideBack:",_6e,objj_msgSend(objj_msgSend(_items[objj_msgSend(_selectionIndexes,"firstIndex")],"view"),"frame").origin,CGSizeMakeZero(),_mouseDownEvent,nil,_69,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_6f,_70,_71,_72){
with(_6f){
objj_msgSend(_71,"setData:forType:",objj_msgSend(_delegate,"collectionView:dataForItemsAtIndexes:forType:",_6f,_selectionIndexes,_72),_72);
}
}),new objj_method(sel_getUid("setVerticalMargin:"),function(_73,_74,_75){
with(_73){
if(_verticalMargin==_75){
return;
}
_verticalMargin=_75;
objj_msgSend(_73,"tile");
}
}),new objj_method(sel_getUid("verticalMargin"),function(_76,_77){
with(_76){
return _verticalMargin;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_78,_79,_7a){
with(_78){
_delegate=_7a;
}
}),new objj_method(sel_getUid("delegate"),function(_7b,_7c){
with(_7b){
return _delegate;
}
})]);
var _7d="CPCollectionViewMinItemSizeKey",_7e="CPCollectionViewMaxItemSizeKey",_7f="CPCollectionViewVerticalMarginKey",_80="CPCollectionViewBackgroundColorsKey";
var _1=objj_getClass("CPCollectionView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCollectionView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_81,_82,_83){
with(_81){
_81=objj_msgSendSuper({receiver:_81,super_class:objj_getClass("CPView")},"initWithCoder:",_83);
if(_81){
_items=[];
_content=[];
_cachedItems=[];
_itemSize=CGSizeMakeZero();
_minItemSize=objj_msgSend(_83,"decodeSizeForKey:",_7d)||CGSizeMakeZero();
_maxItemSize=objj_msgSend(_83,"decodeSizeForKey:",_7e)||CGSizeMakeZero();
_verticalMargin=objj_msgSend(_83,"decodeFloatForKey:",_7f);
objj_msgSend(_81,"setBackgroundColors:",objj_msgSend(_83,"decodeObjectForKey:",_80));
_tileWidth=-1;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_allowsEmptySelection=YES;
_isSelectable=YES;
}
return _81;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_84,_85,_86){
with(_84){
objj_msgSendSuper({receiver:_84,super_class:objj_getClass("CPView")},"encodeWithCoder:",_86);
if(!CGSizeEqualToSize(_minItemSize,CGSizeMakeZero())){
objj_msgSend(_86,"encodeSize:forKey:",_minItemSize,_7d);
}
if(!CGSizeEqualToSize(_maxItemSize,CGSizeMakeZero())){
objj_msgSend(_86,"encodeSize:forKey:",_maxItemSize,_7e);
}
objj_msgSend(_86,"encodeFloat:forKey:",_verticalMargin,_7f);
objj_msgSend(_86,"encodeObject:forKey:",_backgroundColors,_80);
}
})]);
