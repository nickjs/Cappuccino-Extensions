I;20;Foundation/CPArray.ji;11;CPControl.ji;15;CPTableColumn.ji;15;_CPCornerView.ji;12;CPScroller.jc;44248;
CPTableViewColumnDidMoveNotification="CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification="CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification="CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification="CPTableViewSelectionIsChangingNotification";
var _1=1<<2,_2=1<<3,_3=1<<4,_4=1<<5,_5=1<<6,_6=1<<7;
var _7=1<<0,_8=1<<1,_9=1<<2,_a=1<<3,_b=1<<4,_c=1<<5,_d=1<<6,_e=1<<7,_f=1<<8,_10=1<<9,_11=1<<10,_12=1<<11,_13=1<<12,_14=1<<13,_15=1<<14,_16=1<<15,_17=1<<16,_18=1<<17,_19=1<<18,_1a=1<<19;
CPTableViewSelectionHighlightStyleRegular=0;
CPTableViewSelectionHighlightStyleSourceList=1;
CPTableViewGridNone=0;
CPTableViewSolidVerticalGridLineMask=1<<0;
CPTableViewSolidHorizontalGridLineMask=1<<1;
var _1b=objj_allocateClassPair(CPView,"_CPTableDrawView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_tableView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithTableView:"),function(_1d,_1e,_1f){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPView")},"init");
if(_1d){
_tableView=_1f;
}
return _1d;
}
}),new objj_method(sel_getUid("drawRect:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_20,"frame"),_24=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextTranslateCTM(_24,-(_23.origin.x),-(_23.origin.y));
objj_msgSend(_tableView,"_drawRect:",_22);
}
})]);
var _1b=objj_allocateClassPair(CPControl,"CPTableView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_dataSource"),new objj_ivar("_implementedDataSourceMethods"),new objj_ivar("_delegate"),new objj_ivar("_implementedDelegateMethods"),new objj_ivar("_tableColumns"),new objj_ivar("_tableColumnRanges"),new objj_ivar("_dirtyTableColumnRangeIndex"),new objj_ivar("_numberOfHiddenColumns"),new objj_ivar("_reloadAllRows"),new objj_ivar("_objectValues"),new objj_ivar("_exposedRows"),new objj_ivar("_exposedColumns"),new objj_ivar("_dataViewsForTableColumns"),new objj_ivar("_cachedDataViews"),new objj_ivar("_allowsColumnReordering"),new objj_ivar("_allowsColumnResizing"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_intercellSpacing"),new objj_ivar("_rowHeight"),new objj_ivar("_usesAlternatingRowBackgroundColors"),new objj_ivar("_alternatingRowBackgroundColors"),new objj_ivar("_selectionHighlightMask"),new objj_ivar("_currentHighlightedTableColumn"),new objj_ivar("_gridStyleMask"),new objj_ivar("_gridColor"),new objj_ivar("_numberOfRows"),new objj_ivar("_headerView"),new objj_ivar("_cornerView"),new objj_ivar("_selectedColumnIndexes"),new objj_ivar("_selectedRowIndexes"),new objj_ivar("_selectionAnchorRow"),new objj_ivar("_tableDrawView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithFrame:"),function(_25,_26,_27){
with(_25){
_25=objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPControl")},"initWithFrame:",_27);
if(_25){
_allowsColumnReordering=YES;
_allowsColumnResizing=YES;
_allowsMultipleSelection=NO;
_allowsEmptySelection=YES;
_allowsColumnSelection=NO;
_tableViewFlags=0;
_selectionHighlightMask=CPTableViewSelectionHighlightStyleRegular;
objj_msgSend(_25,"setUsesAlternatingRowBackgroundColors:",NO);
objj_msgSend(_25,"setAlternatingRowBackgroundColors:",[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithHexString:","e4e7ff")]);
_tableColumns=[];
_tableColumnRanges=[];
_dirtyTableColumnRangeIndex=CPNotFound;
_numberOfHiddenColumns=0;
_objectValues={};
_dataViewsForTableColumns={};
_dataViews=[];
_numberOfRows=0;
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_cachedDataViews={};
_intercellSpacing={width:0,height:0};
_rowHeight=19;
objj_msgSend(_25,"setGridColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_25,"setGridStyleMask:",CPTableViewGridNone);
_headerView=objj_msgSend(objj_msgSend(CPTableHeaderView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(_25,"bounds").size.width,_rowHeight));
objj_msgSend(_headerView,"setTableView:",_25);
_cornerView=objj_msgSend(objj_msgSend(_CPCornerView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),CGRectGetHeight(objj_msgSend(_headerView,"frame"))));
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
_tableDrawView=objj_msgSend(objj_msgSend(_CPTableDrawView,"alloc"),"initWithTableView:",_25);
objj_msgSend(_tableDrawView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_25,"addSubview:",_tableDrawView);
}
return _25;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_28,_29,_2a){
with(_28){
if(_dataSource===_2a){
return;
}
_dataSource=_2a;
_implementedDataSourceMethods=0;
if(!_dataSource){
return;
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("numberOfRowsInTableView:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement numberOfRowsInTableView:.");
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:objectValueForTableColumn:row:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement tableView:objectValueForTableColumn:row:");
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_1;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_2;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:"))){
_implementedDataSourceMethods|=_3;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"))){
_implementedDataSourceMethods|=_4;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"))){
_implementedDataSourceMethods|=_5;
}
objj_msgSend(_28,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_2b,_2c){
with(_2b){
return _dataSource;
}
}),new objj_method(sel_getUid("reloadDataForRowIndexes:columnIndexes:"),function(_2d,_2e,_2f,_30){
with(_2d){
objj_msgSend(_2d,"reloadData");
}
}),new objj_method(sel_getUid("reloadData"),function(_31,_32){
with(_31){
if(!_dataSource){
return;
}
_reloadAllRows=YES;
_objectValues={};
objj_msgSend(_31,"noteNumberOfRowsChanged");
objj_msgSend(_31,"setNeedsLayout");
objj_msgSend(_31,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_33,_34,_35){
with(_33){
_doubleAction=_35;
}
}),new objj_method(sel_getUid("doubleAction"),function(_36,_37){
with(_36){
return _doubleAction;
}
}),new objj_method(sel_getUid("setAllowsColumnReordering:"),function(_38,_39,_3a){
with(_38){
_allowsColumnReordering=!!_3a;
}
}),new objj_method(sel_getUid("allowsColumnReordering"),function(_3b,_3c){
with(_3b){
return _allowsColumnReordering;
}
}),new objj_method(sel_getUid("setAllowsColumnResizing:"),function(_3d,_3e,_3f){
with(_3d){
_allowsColumnResizing=!!_3f;
}
}),new objj_method(sel_getUid("allowsColumnResizing"),function(_40,_41){
with(_40){
return _allowsColumnResizing;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_42,_43,_44){
with(_42){
_allowsMultipleSelection=!!_44;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_45,_46){
with(_45){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_47,_48,_49){
with(_47){
_allowsEmptySelection=!!_49;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_4a,_4b){
with(_4a){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsColumnSelection:"),function(_4c,_4d,_4e){
with(_4c){
_allowsColumnSelection=!!_4e;
}
}),new objj_method(sel_getUid("allowsColumnSelection"),function(_4f,_50){
with(_4f){
return _allowsColumnSelection;
}
}),new objj_method(sel_getUid("setIntercellSpacing:"),function(_51,_52,_53){
with(_51){
if((_intercellSpacing.width==_53.width&&_intercellSpacing.height==_53.height)){
return;
}
_intercellSpacing={width:_53.width,height:_53.height};
objj_msgSend(_51,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setThemeState:"),function(_54,_55,_56){
with(_54){
}
}),new objj_method(sel_getUid("intercellSpacing"),function(_57,_58){
with(_57){
return {width:_intercellSpacing.width,height:_intercellSpacing.height};
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_59,_5a,_5b){
with(_59){
_5b=+_5b;
if(_rowHeight===_5b){
return;
}
_rowHeight=MAX(0,_5b);
objj_msgSend(_59,"setNeedsLayout");
}
}),new objj_method(sel_getUid("rowHeight"),function(_5c,_5d){
with(_5c){
return _rowHeight;
}
}),new objj_method(sel_getUid("setUsesAlternatingRowBackgroundColors:"),function(_5e,_5f,_60){
with(_5e){
_usesAlternatingRowBackgroundColors=_60;
}
}),new objj_method(sel_getUid("usesAlternatingRowBackgroundColors"),function(_61,_62){
with(_61){
return _usesAlternatingRowBackgroundColors;
}
}),new objj_method(sel_getUid("setAlternatingRowBackgroundColors:"),function(_63,_64,_65){
with(_63){
if(objj_msgSend(_alternatingRowBackgroundColors,"isEqual:",_65)){
return;
}
_alternatingRowBackgroundColors=_65;
objj_msgSend(_63,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternatingRowBackgroundColors"),function(_66,_67){
with(_66){
return _alternatingRowBackgroundColors;
}
}),new objj_method(sel_getUid("selectionHighlightStyle"),function(_68,_69){
with(_68){
return _selectionHighlightMask;
}
}),new objj_method(sel_getUid("setSelectionHighlightStyle:"),function(_6a,_6b,_6c){
with(_6a){
_selectionHighlightMask=_6c;
}
}),new objj_method(sel_getUid("setGridColor:"),function(_6d,_6e,_6f){
with(_6d){
if(_gridColor===_6f){
return;
}
_gridColor=_6f;
objj_msgSend(_6d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridColor"),function(_70,_71){
with(_70){
return _gridColor;
}
}),new objj_method(sel_getUid("setGridStyleMask:"),function(_72,_73,_74){
with(_72){
if(_gridStyleMask===_74){
return;
}
_gridStyleMask=_74;
objj_msgSend(_72,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridStyleMask"),function(_75,_76){
with(_75){
return _gridStyleMask;
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_77,_78,_79){
with(_77){
objj_msgSend(_tableColumns,"addObject:",_79);
objj_msgSend(_79,"setTableView:",_77);
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=(_tableColumns.length)-1;
}else{
_dirtyTableColumnRangeIndex=MIN((_tableColumns.length)-1,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_77,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_7a,_7b,_7c){
with(_7a){
if(objj_msgSend(_7c,"tableView")!==_7a){
return;
}
var _7d=objj_msgSend(_tableColumns,"indexOfObjectIdenticalTo:",_7c);
if(_7d===CPNotFound){
return;
}
objj_msgSend(_7c,"setTableView:",nil);
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_7d);
var _7e=objj_msgSend(_7c,"UID");
if(_objectValues[_7e]){
_objectValues[_7e]=nil;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=_7d;
}else{
_dirtyTableColumnRangeIndex=MIN(_7d,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_7a,"setNeedsLayout");
}
}),new objj_method(sel_getUid("moveColumn:toColumn:"),function(_7f,_80,_81,_82){
with(_7f){
_81=+_81;
_82=+_82;
if(_81===_82){
return;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=MIN(_81,_82);
}else{
_dirtyTableColumnRangeIndex=MIN(_81,_82,_dirtyTableColumnRangeIndex);
}
if(_82>_81){
--_82;
}
var _83=_tableColumns[_81];
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_81);
objj_msgSend(_tableColumns,"insertObject:atIndex:",_83,_82);
objj_msgSend(_7f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("tableColumns"),function(_84,_85){
with(_84){
return _tableColumns;
}
}),new objj_method(sel_getUid("columnWithIdentifier:"),function(_86,_87,_88){
with(_86){
var _89=0,_8a=(_tableColumns.length);
for(;_89<_8a;++_89){
if(objj_msgSend(_tableColumns,"identifier")===_88){
return _89;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("tableColumnWithIdentifier:"),function(_8b,_8c,_8d){
with(_8b){
var _8e=objj_msgSend(_8b,"columnWithIdentifier:",_8d);
if(_8e===CPNotFound){
return nil;
}
return _tableColumns[_8e];
}
}),new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"),function(_8f,_90,_91,_92){
with(_8f){
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_92){
objj_msgSend(_selectedColumnIndexes,"addIndexes:",_91);
}else{
_selectedColumnIndexes=objj_msgSend(_91,"copy");
}
objj_msgSend(_8f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_93,_94,_95,_96){
with(_93){
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_96){
objj_msgSend(_selectedRowIndexes,"addIndexes:",_95);
}else{
_selectedRowIndexes=objj_msgSend(_95,"copy");
}
objj_msgSend(_93,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectedColumnIndexes"),function(_97,_98){
with(_97){
return _selectedColumnIndexes;
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_99,_9a){
with(_99){
return _selectedRowIndexes;
}
}),new objj_method(sel_getUid("deselectColumn:"),function(_9b,_9c,_9d){
with(_9b){
objj_msgSend(_selectedColumnIndexes,"removeIndex:",_9d);
}
}),new objj_method(sel_getUid("deselectRow:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_selectedRowIndexes,"removeIndex:",_a0);
}
}),new objj_method(sel_getUid("numberOfSelectedColumns"),function(_a1,_a2){
with(_a1){
return objj_msgSend(_selectedColumnIndexes,"count");
}
}),new objj_method(sel_getUid("numberOfSelectedRows"),function(_a3,_a4){
with(_a3){
return objj_msgSend(_selectedRowIndexes,"count");
}
}),new objj_method(sel_getUid("isColumnSelected:"),function(_a5,_a6,_a7){
with(_a5){
return objj_msgSend(_selectedColumnIndexes,"containsIndex:",_a7);
}
}),new objj_method(sel_getUid("isRowSelected:"),function(_a8,_a9,_aa){
with(_a8){
return objj_msgSend(_selectedRowIndexes,"containsIndex:",_aa);
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_ab,_ac){
with(_ab){
return (_tableColumns.length);
}
}),new objj_method(sel_getUid("numberOfRows"),function(_ad,_ae){
with(_ad){
if(!_dataSource){
return 0;
}
return objj_msgSend(_dataSource,"numberOfRowsInTableView:",_ad);
}
}),new objj_method(sel_getUid("cornerView"),function(_af,_b0){
with(_af){
return _cornerView;
}
}),new objj_method(sel_getUid("setCornerView:"),function(_b1,_b2,_b3){
with(_b1){
if(_cornerView===_b3){
return;
}
_cornerView=_b3;
var _b4=objj_msgSend(objj_msgSend(_b1,"superview"),"superview");
if(objj_msgSend(_b4,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))&&objj_msgSend(_b4,"documentView")===_b1){
objj_msgSend(_b4,"_updateCornerAndHeaderView");
}
}
}),new objj_method(sel_getUid("headerView"),function(_b5,_b6){
with(_b5){
return _headerView;
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_b7,_b8,_b9){
with(_b7){
if(_headerView===_b9){
return;
}
objj_msgSend(_headerView,"setTableView:",nil);
_headerView=_b9;
if(_headerView){
objj_msgSend(_headerView,"setTableView:",_b7);
objj_msgSend(_headerView,"setFrameSize:",{width:(objj_msgSend(_b7,"frame").size.width),height:(objj_msgSend(_headerView,"frame").size.height)});
}
var _ba=objj_msgSend(objj_msgSend(_b7,"superview"),"superview");
if(objj_msgSend(_ba,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))&&objj_msgSend(_ba,"documentView")===_b7){
objj_msgSend(_ba,"_updateCornerAndHeaderView");
}
}
}),new objj_method(sel_getUid("_recalculateTableColumnRanges"),function(_bb,_bc){
with(_bb){
if(_dirtyTableColumnRangeIndex<0){
return;
}
var _bd=_dirtyTableColumnRangeIndex,_be=(_tableColumns.length),x=_bd===0?0:CPMaxRange(_tableColumnRanges[_bd-1]);
for(;_bd<_be;++_bd){
var _c0=_tableColumns[_bd];
if(objj_msgSend(_c0,"isHidden")){
_tableColumnRanges[_bd]=CPMakeRange(x,0);
}else{
var _c1=objj_msgSend(_tableColumns[_bd],"width");
_tableColumnRanges[_bd]=CPMakeRange(x,_c1);
x+=_c1;
}
}
_tableColumnRanges.length=_be;
_dirtyTableColumnRangeIndex=CPNotFound;
}
}),new objj_method(sel_getUid("rectOfColumn:"),function(_c2,_c3,_c4){
with(_c2){
_c4=+_c4;
if(_c4<0||_c4>=(_tableColumns.length)){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_c2,"_recalculateTableColumnRanges");
}
var _c5=_tableColumnRanges[_c4];
return {origin:{x:_c5.location,y:0},size:{width:_c5.length,height:CGRectGetHeight(objj_msgSend(_c2,"bounds"))}};
}
}),new objj_method(sel_getUid("rectOfRow:"),function(_c6,_c7,_c8){
with(_c6){
if(NO){
return NULL;
}
return {origin:{x:0,y:(_c8*(_rowHeight+_intercellSpacing.height))},size:{width:(objj_msgSend(_c6,"bounds").size.width),height:_rowHeight}};
}
}),new objj_method(sel_getUid("rowsInRect:"),function(_c9,_ca,_cb){
with(_c9){
if(_numberOfRows<=0){
return CPMakeRange(0,0);
}
var _cc=objj_msgSend(_c9,"bounds");
if(!CGRectIntersectsRect(_cb,_cc)){
return CPMakeRange(0,0);
}
var _cd=objj_msgSend(_c9,"rowAtPoint:",_cb.origin);
if(_cd<0){
_cd=0;
}
var _ce=objj_msgSend(_c9,"rowAtPoint:",{x:0,y:(_cb.origin.y+_cb.size.height)});
if(_ce<0){
_ce=_numberOfRows-1;
}
return CPMakeRange(_cd,_ce-_cd+1);
}
}),new objj_method(sel_getUid("columnIndexesInRect:"),function(_cf,_d0,_d1){
with(_cf){
var _d2=MAX(0,objj_msgSend(_cf,"columnAtPoint:",{x:_d1.origin.x,y:0})),_d3=objj_msgSend(_cf,"columnAtPoint:",{x:(_d1.origin.x+_d1.size.width),y:0});
if(_d3===CPNotFound){
_d3=(_tableColumns.length)-1;
}
if(_numberOfHiddenColumns<=0){
return objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_d2,_d3-_d2+1));
}
var _d4=objj_msgSend(CPIndexSet,"indexSet");
for(;_d2<=_d3;++_d2){
var _d5=_tableColumns[_d2];
if(!objj_msgSend(_d5,"isHidden")){
objj_msgSend(_d4,"addIndex:",_d2);
}
}
return _d4;
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_d6,_d7,_d8){
with(_d6){
var _d9=objj_msgSend(_d6,"bounds");
if(!(_d8.x>=(_d9.origin.x)&&_d8.y>=(_d9.origin.y)&&_d8.x<(_d9.origin.x+_d9.size.width)&&_d8.y<(_d9.origin.y+_d9.size.height))){
return CPNotFound;
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_d6,"_recalculateTableColumnRanges");
}
var x=_d8.x,low=0,_dc=_tableColumnRanges.length-1;
while(low<=_dc){
var _dd=FLOOR(low+(_dc-low)/2),_de=_tableColumnRanges[_dd];
if(x<_de.location){
_dc=_dd-1;
}else{
if(x>=CPMaxRange(_de)){
low=_dd+1;
}else{
var _df=_tableColumnRanges.length;
while(_dd<_df&&objj_msgSend(_tableColumns[_dd],"isHidden")){
++_dd;
}
if(_dd<_df){
return _dd;
}
return CPNotFound;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("rowAtPoint:"),function(_e0,_e1,_e2){
with(_e0){
var y=_e2.y;
if(NO){
}
var row=FLOOR(y/(_rowHeight+_intercellSpacing.height));
if(row>=_numberOfRows){
return -1;
}
return row;
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(_e5,_e6,_e7,_e8){
with(_e5){
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_e5,"_recalculateTableColumnRanges");
}
var _e9=_tableColumnRanges[_e7],_ea=objj_msgSend(_e5,"rectOfRow:",_e8);
return {origin:{x:_e9.location,y:(_ea.origin.y)},size:{width:_e9.length,height:(_ea.size.height)}};
}
}),new objj_method(sel_getUid("sizeLastColumnToFit"),function(_eb,_ec){
with(_eb){
var _ed=objj_msgSend(_eb,"superview");
if(!_ed){
return;
}
var _ee=objj_msgSend(_ed,"bounds").size;
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_eb,"_recalculateTableColumnRanges");
}
var _ef=(_tableColumns.length);
while(_ef--&&objj_msgSend(_tableColumns[_ef],"isHidden")){
}
if(_ef>=0){
objj_msgSend(_tableColumns[_ef],"setWidth:",MAX(0,_ee.width-(objj_msgSend(_eb,"rectOfColumn:",_ef).origin.x)));
}
objj_msgSend(_eb,"setNeedsLayout");
}
}),new objj_method(sel_getUid("noteNumberOfRowsChanged"),function(_f0,_f1){
with(_f0){
_numberOfRows=objj_msgSend(_dataSource,"numberOfRowsInTableView:",_f0);
objj_msgSend(_f0,"tile");
}
}),new objj_method(sel_getUid("tile"),function(_f2,_f3){
with(_f2){
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_f2,"_recalculateTableColumnRanges");
}
var _f4=_tableColumnRanges.length>0?CPMaxRange(objj_msgSend(_tableColumnRanges,"lastObject")):0,_f5=(_rowHeight+_intercellSpacing.height)*_numberOfRows,_f6=objj_msgSend(_f2,"superview");
if(objj_msgSend(_f6,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
var _f7=objj_msgSend(_f6,"bounds").size;
_f4=MAX(_f7.width,_f4);
_f5=MAX(_f7.height,_f5);
}
objj_msgSend(_f2,"setFrameSize:",{width:_f4,height:_f5});
objj_msgSend(_f2,"setNeedsLayout");
objj_msgSend(_f2,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_f8,_f9,_fa){
with(_f8){
if(_delegate===_fa){
return;
}
var _fb=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_fb,"removeObserver:name:object:",_delegate,CPTableViewColumnDidMoveNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_fb,"removeObserver:name:object:",_delegate,CPTableViewColumnDidResizeNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_fb,"removeObserver:name:object:",_delegate,CPTableViewSelectionDidChangeNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_fb,"removeObserver:name:object:",_delegate,CPTableViewSelectionIsChangingNotification,_f8);
}
}
_delegate=_fa;
_implementedDelegateMethods=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("selectionShouldChangeInTableView:"))){
_implementedDelegateMethods|=_7;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:dataViewForTableColumn:row:"))){
_implementedDelegateMethods|=_8;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didClickTableColumn:"))){
_implementedDelegateMethods|=_9;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didDragTableColumn:"))){
_implementedDelegateMethods|=_a;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:heightOfRow:"))){
_implementedDelegateMethods|=_b;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:isGroupRow:"))){
_implementedDelegateMethods|=_c;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:mouseDownInHeaderOfTableColumn:"))){
_implementedDelegateMethods|=_d;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:nextTypeSelectMatchFromRow:toRow:forString:"))){
_implementedDelegateMethods|=_e;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:selectionIndexesForProposedSelection:"))){
_implementedDelegateMethods|=_f;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldEditTableColumn:row:"))){
_implementedDelegateMethods|=_10;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectRow:"))){
_implementedDelegateMethods|=_11;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectTableColumn:"))){
_implementedDelegateMethods|=_12;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldShowViewExpansionForTableColumn:row:"))){
_implementedDelegateMethods|=_13;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTrackView:forTableColumn:row:"))){
_implementedDelegateMethods|=_14;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTypeSelectForEvent:withCurrentSearchString:"))){
_implementedDelegateMethods|=_15;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:toolTipForView:rect:tableColumn:row:mouseLocation:"))){
_implementedDelegateMethods|=_16;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:typeSelectStringForTableColumn:row:"))){
_implementedDelegateMethods|=_17;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:willDisplayView:forTableColumn:row:"))){
_implementedDelegateMethods|=_18;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_fb,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidMoveNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_fb,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidResizeNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_fb,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionDidChange:"),CPTableViewSelectionDidChangeNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_fb,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionIsChanging:"),CPTableViewSelectionIsChangingNotification,_f8);
}
}
}),new objj_method(sel_getUid("delegate"),function(_fc,_fd){
with(_fc){
return _delegate;
}
}),new objj_method(sel_getUid("_objectValueForTableColumn:row:"),function(_fe,_ff,_100,_101){
with(_fe){
var _102=objj_msgSend(_100,"UID"),_103=_objectValues[_102];
if(!_103){
_103=[];
_objectValues[_102]=_103;
}
var _104=_103[_101];
if(_104===undefined){
_104=objj_msgSend(_dataSource,"tableView:objectValueForTableColumn:row:",_fe,_100,_101);
_103[_101]=_104;
}
return _104;
}
}),new objj_method(sel_getUid("_exposedRect"),function(self,_cmd){
with(self){
var _107=objj_msgSend(self,"superview");
if(!objj_msgSend(_107,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(self,"bounds");
}
return objj_msgSend(self,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_107,"bounds"),objj_msgSend(self,"frame")),_107);
}
}),new objj_method(sel_getUid("load"),function(self,_cmd){
with(self){
if(_reloadAllRows){
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_exposedRows,_exposedColumns);
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_reloadAllRows=NO;
}
var _10a=objj_msgSend(self,"_exposedRect"),_10b=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_10a)),_10c=objj_msgSend(self,"columnIndexesInRect:",_10a),_10d=objj_msgSend(_exposedRows,"copy"),_10e=objj_msgSend(_exposedColumns,"copy");
objj_msgSend(_10d,"removeIndexes:",_10b);
objj_msgSend(_10e,"removeIndexes:",_10c);
var _10f=objj_msgSend(_10b,"copy"),_110=objj_msgSend(_10c,"copy");
objj_msgSend(_10f,"removeIndexes:",_exposedRows);
objj_msgSend(_110,"removeIndexes:",_exposedColumns);
var _111=objj_msgSend(_10b,"copy"),_112=objj_msgSend(_10c,"copy");
objj_msgSend(_111,"removeIndexes:",_10f);
objj_msgSend(_112,"removeIndexes:",_110);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_111,_10e);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_10d,_112);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_10d,_10e);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_111,_110);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_10f,_112);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_10f,_110);
_exposedRows=_10b;
_exposedColumns=_10c;
objj_msgSend(_tableDrawView,"setFrame:",_10a);
objj_msgSend(_tableDrawView,"display");
for(identifier in _cachedDataViews){
var _113=_cachedDataViews[identifier],_114=_113.length;
while(_114--){
objj_msgSend(_113[_114],"removeFromSuperview");
}
}
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(self,_cmd,rows,_118){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_118,"count")){
return;
}
var _119=[],_11a=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_119,-1,nil);
objj_msgSend(_118,"getIndexes:maxCount:inIndexRange:",_11a,-1,nil);
var _11b=0,_11c=_11a.length;
for(;_11b<_11c;++_11b){
var _11d=_11a[_11b],_11e=_tableColumns[_11d],_11f=objj_msgSend(_11e,"UID");
var _120=0,_121=_119.length;
for(;_120<_121;++_120){
var row=_119[_120],_123=_dataViewsForTableColumns[_11f][row];
_dataViewsForTableColumns[_11f][row]=nil;
objj_msgSend(self,"_enqueueReusableDataView:",_123);
}
}
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(self,_cmd,rows,_127){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_127,"count")){
return;
}
var _128=[],_129=[],_12a=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_128,-1,nil);
objj_msgSend(_127,"getIndexes:maxCount:inIndexRange:",_12a,-1,nil);
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
var _12b=0,_12c=_12a.length;
for(;_12b<_12c;++_12b){
var _12d=_12a[_12b],_12e=_tableColumns[_12d],_12f=objj_msgSend(_12e,"UID");
if(!_dataViewsForTableColumns[_12f]){
_dataViewsForTableColumns[_12f]=[];
}
var _130=0,_131=_128.length;
for(;_130<_131;++_130){
var row=_128[_130],_133=objj_msgSend(self,"_newDataViewForRow:tableColumn:",row,_12e);
objj_msgSend(_133,"setFrame:",objj_msgSend(self,"frameOfDataViewAtColumn:row:",_12d,row));
objj_msgSend(_133,"setObjectValue:",objj_msgSend(self,"_objectValueForTableColumn:row:",_12e,row));
if(objj_msgSend(_133,"superview")!==self){
objj_msgSend(self,"addSubview:",_133);
}
_dataViewsForTableColumns[_12f][row]=_133;
}
}
}
}),new objj_method(sel_getUid("_newDataViewForRow:tableColumn:"),function(self,_cmd,aRow,_137){
with(self){
return objj_msgSend(_137,"_newDataViewForRow:",aRow);
}
}),new objj_method(sel_getUid("_enqueueReusableDataView:"),function(self,_cmd,_13a){
with(self){
var _13b=_13a.identifier;
if(!_cachedDataViews[_13b]){
_cachedDataViews[_13b]=[_13a];
}else{
_cachedDataViews[_13b].push(_13a);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(self,_cmd,_13e){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"setFrameSize:",_13e);
if(_headerView){
objj_msgSend(_headerView,"setFrameSize:",{width:(objj_msgSend(self,"frame").size.width),height:(objj_msgSend(_headerView,"frame").size.height)});
}
}
}),new objj_method(sel_getUid("exposedClipRect"),function(self,_cmd){
with(self){
var _141=objj_msgSend(self,"superview");
if(!objj_msgSend(_141,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(self,"bounds");
}
return objj_msgSend(self,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_141,"bounds"),objj_msgSend(self,"frame")),_141);
}
}),new objj_method(sel_getUid("_drawRect:"),function(self,_cmd,_144){
with(self){
var _145=objj_msgSend(self,"_exposedRect");
objj_msgSend(self,"drawBackgroundInClipRect:",_145);
objj_msgSend(self,"highlightSelectionInClipRect:",_145);
objj_msgSend(self,"drawGridInClipRect:",_145);
}
}),new objj_method(sel_getUid("drawBackgroundInClipRect:"),function(self,_cmd,_148){
with(self){
if(!objj_msgSend(self,"usesAlternatingRowBackgroundColors")){
return;
}
var _149=objj_msgSend(self,"alternatingRowBackgroundColors"),_14a=objj_msgSend(_149,"count");
if(_14a===0){
return;
}
var _14b=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
if(_14a===1){
CGContextSetFillColor(_14b,_149[0]);
CGContextFillRect(_14b,_148);
return;
}
var _14c=objj_msgSend(self,"rowsInRect:",_148),_14d=_14c.location,_14e=CPMaxRange(_14c)-1,_14f=MIN(_14c.length,_14a),_150=0;
while(_14f--){
var row=_14d%_14a+_14d+_14f,_152=nil;
CGContextBeginPath(_14b);
for(;row<=_14e;row+=_14a){
CGContextAddRect(_14b,CGRectIntersection(_148,_152=objj_msgSend(self,"rectOfRow:",row)));
}
if(row-_14a===_14e){
_150=(_152.origin.y+_152.size.height);
}
CGContextClosePath(_14b);
CGContextSetFillColor(_14b,_149[_14f]);
CGContextFillPath(_14b);
}
var _153=(_148.origin.y+_148.size.height);
if(_150>=_153||_rowHeight<=0){
return;
}
var _154=_rowHeight+_intercellSpacing.height,_152={origin:{x:(_148.origin.x),y:(_148.origin.y)+_150},size:{width:(_148.size.width),height:_154}};
for(row=_14e+1;_150<_153;++row){
CGContextSetFillColor(_14b,_149[row%_14a]);
CGContextFillRect(_14b,_152);
_150+=_154;
_152.origin.y+=_154;
}
}
}),new objj_method(sel_getUid("drawGridInClipRect:"),function(self,_cmd,_157){
with(self){
var _158=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_159=objj_msgSend(self,"gridStyleMask");
if(!(_159&(CPTableViewSolidHorizontalGridLineMask|CPTableViewSolidVerticalGridLineMask))){
return;
}
CGContextBeginPath(_158);
if(_159&CPTableViewSolidHorizontalGridLineMask){
var _15a=objj_msgSend(self,"rowsInRect:",_157);
row=_15a.location,lastRow=CPMaxRange(_15a)-1,rowY=0,minX=(_157.origin.x),maxX=(_157.origin.x+_157.size.width);
for(;row<=lastRow;++row){
var _15c=objj_msgSend(self,"rectOfRow:",row),rowY=(_15c.origin.y+_15c.size.height)-0.5;
CGContextMoveToPoint(_158,minX,rowY);
CGContextAddLineToPoint(_158,maxX,rowY);
}
if(_rowHeight>0){
var _15d=_rowHeight+_intercellSpacing.height,_15e=(_157.origin.y+_157.size.height);
while(rowY<_15e){
rowY+=_15d;
CGContextMoveToPoint(_158,minX,rowY);
CGContextAddLineToPoint(_158,maxX,rowY);
}
}
}
if(_159&CPTableViewSolidVerticalGridLineMask){
var _15f=objj_msgSend(self,"columnIndexesInRect:",_157),_160=[];
objj_msgSend(_15f,"getIndexes:maxCount:inIndexRange:",_160,-1,nil);
var _161=0,_162=_160.length,minY=(_157.origin.y),maxY=(_157.origin.y+_157.size.height);
for(;_161<_162;++_161){
var _165=objj_msgSend(self,"rectOfColumn:",_161),_166=(_165.origin.x+_165.size.width)-0.5;
CGContextMoveToPoint(_158,_166,minY);
CGContextAddLineToPoint(_158,_166,maxY);
}
}
CGContextClosePath(_158);
CGContextSetStrokeColor(_158,_gridColor);
CGContextStrokePath(_158);
}
}),new objj_method(sel_getUid("highlightSelectionInClipRect:"),function(self,_cmd,_169){
with(self){
if(objj_msgSend(self,"selectionHighlightStyle")===CPTableViewSelectionHighlightStyleSourceList){
objj_msgSend(objj_msgSend(CPColor,"selectionColorSourceView"),"setFill");
}else{
objj_msgSend(objj_msgSend(CPColor,"selectionColor"),"setFill");
}
var _16a=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_16b=[],_16c=sel_getUid("rectOfRow:");
if(objj_msgSend(_selectedRowIndexes,"count")>=1){
var _16d=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_169)),_16e=objj_msgSend(_16d,"firstIndex"),_16f=CPMakeRange(_16e,objj_msgSend(_16d,"lastIndex")-_16e+1);
objj_msgSend(_selectedRowIndexes,"getIndexes:maxCount:inIndexRange:",_16b,-1,_16f);
}else{
if(objj_msgSend(_selectedColumnIndexes,"count")>=1){
_16c=sel_getUid("rectOfColumn:");
var _170=objj_msgSend(self,"columnIndexesInRect:",_169),_171=objj_msgSend(_170,"firstIndex"),_16f=CPMakeRange(_171,objj_msgSend(_170,"lastIndex")-_171+1);
objj_msgSend(_selectedColumnIndexes,"getIndexes:maxCount:inIndexRange:",_16b,-1,_16f);
}
}
var _172=objj_msgSend(_16b,"count");
if(!_172){
return;
}
CGContextBeginPath(_16a);
while(_172--){
CGContextAddRect(_16a,CGRectIntersection(objj_msgSend(self,_16c,_16b[_172]),_169));
}
CGContextClosePath(_16a);
CGContextFillPath(_16a);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_cmd){
with(self){
objj_msgSend(self,"load");
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(self,_cmd,_177){
with(self){
var _178=objj_msgSend(self,"superview"),_179=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_178){
objj_msgSend(_179,"removeObserver:name:object:",self,CPViewFrameDidChangeNotification,_178);
objj_msgSend(_179,"removeObserver:name:object:",self,CPViewBoundsDidChangeNotification,_178);
}
if(_177){
objj_msgSend(_177,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_177,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_179,"addObserver:selector:name:object:",self,sel_getUid("superviewFrameChanged:"),CPViewFrameDidChangeNotification,_177);
objj_msgSend(_179,"addObserver:selector:name:object:",self,sel_getUid("superviewBoundsChanged:"),CPViewBoundsDidChangeNotification,_177);
}
}
}),new objj_method(sel_getUid("superviewBoundsChanged:"),function(self,_cmd,_17c){
with(self){
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("superviewFrameChanged:"),function(self,_cmd,_17f){
with(self){
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(self,_cmd){
with(self){
return YES;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(self,_cmd,_184){
with(self){
var row=objj_msgSend(self,"rowAtPoint:",_184);
if(objj_msgSend(self,"mouseDownFlags")&CPShiftKeyMask){
_selectionAnchorRow=(ABS(objj_msgSend(_selectedRowIndexes,"firstIndex")-row)<ABS(objj_msgSend(_selectedRowIndexes,"lastIndex")-row))?objj_msgSend(_selectedRowIndexes,"firstIndex"):objj_msgSend(_selectedRowIndexes,"lastIndex");
}else{
_selectionAnchorRow=row;
}
_previouslySelectedRowIndexes=nil;
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",row);
return YES;
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(self,_cmd,_188,_189){
with(self){
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",objj_msgSend(self,"rowAtPoint:",_189));
return YES;
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(self,_cmd,_18c,_18d,_18e){
with(self){
if(!objj_msgSend(_previouslySelectedRowIndexes,"isEqualToIndexSet:",_selectedRowIndexes)){
objj_msgSend(self,"_noteSelectionDidChange");
}
}
}),new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"),function(self,_cmd,aRow){
with(self){
if(objj_msgSend(self,"mouseDownFlags")&(CPCommandKeyMask|CPControlKeyMask|CPAlternateKeyMask)){
if(objj_msgSend(_selectedRowIndexes,"containsIndex:",aRow)){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"removeIndex:",aRow);
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"addIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}
}
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(MIN(aRow,_selectionAnchorRow),ABS(aRow-_selectionAnchorRow)+1));
}else{
if(aRow>=0&&aRow<_numberOfRows){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSet");
}
}
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
if(_implementedDelegateMethods&_7&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",self)){
return;
}
if(_implementedDelegateMethods&_f){
newSelection=objj_msgSend(_delegate,"tableView:selectionIndexesForProposedSelection:",self,newSelection);
}
if(_implementedDelegateMethods&_11){
var _192=[];
objj_msgSend(newSelection,"getIndexes:maxCount:inIndexRange:",_192,-1,nil);
var _193=_192.length;
while(_193--){
var _194=_192[_193];
if(!objj_msgSend(_delegate,"tableView:shouldSelectRow:",self,_194)){
objj_msgSend(newSelection,"removeIndex:",_194);
}
}
}
if(!_allowsEmptySelection&&objj_msgSend(newSelection,"count")===0){
return;
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
if(!_previouslySelectedRowIndexes){
_previouslySelectedRowIndexes=objj_msgSend(_selectedRowIndexes,"copy");
}
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",newSelection,NO);
objj_msgSend(self,"_noteSelectionIsChanging");
}
}),new objj_method(sel_getUid("_noteSelectionIsChanging"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionIsChangingNotification,self,nil);
}
}),new objj_method(sel_getUid("_noteSelectionDidChange"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionDidChangeNotification,self,nil);
}
})]);
var _199="CPTableViewDataSourceKey",_19a="CPTableViewDelegateKey",_19b="CPTableViewHeaderViewKey",_19c="CPTableViewTableColumnsKey",_19d="CPTableViewRowHeightKey",_19e="CPTableViewIntercellSpacingKey",_19f="CPTableViewMultipleSelectionKey",_1a0="CPTableViewEmptySelectionKey";
var _1b=objj_getClass("CPTableView");
if(!_1b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableView\""));
}
var _1c=_1b.isa;
class_addMethods(_1b,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1a3){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"initWithCoder:",_1a3);
if(self){
_allowsColumnReordering=YES;
_allowsColumnResizing=YES;
_allowsMultipleSelection=objj_msgSend(_1a3,"decodeBoolForKey:",_19f);
_allowsEmptySelection=objj_msgSend(_1a3,"decodeBoolForKey:",_1a0);
_allowsColumnSelection=NO;
_tableViewFlags=0;
_selectionHighlightMask=CPTableViewSelectionHighlightStyleRegular;
objj_msgSend(self,"setUsesAlternatingRowBackgroundColors:",NO);
objj_msgSend(self,"setAlternatingRowBackgroundColors:",[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithHexString:","e4e7ff")]);
_tableColumns=objj_msgSend(_1a3,"decodeObjectForKey:",_19c);
objj_msgSend(_tableColumns,"makeObjectsPerformSelector:withObject:",sel_getUid("setTableView:"),self);
_tableColumnRanges=[];
_dirtyTableColumnRangeIndex=0;
_numberOfHiddenColumns=0;
_objectValues={};
_dataViewsForTableColumns={};
_dataViews=[];
_numberOfRows=0;
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_cachedDataViews={};
_rowHeight=objj_msgSend(_1a3,"decodeFloatForKey:",_19d);
_intercellSpacing=objj_msgSend(_1a3,"decodeSizeForKey:",_19e);
objj_msgSend(self,"setGridColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(self,"setGridStyleMask:",CPTableViewGridNone);
_headerView=objj_msgSend(objj_msgSend(CPTableHeaderView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(self,"bounds").size.width,_rowHeight));
objj_msgSend(_headerView,"setTableView:",self);
_cornerView=objj_msgSend(objj_msgSend(_CPCornerView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),CGRectGetHeight(objj_msgSend(_headerView,"frame"))));
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
objj_msgSend(self,"setDataSource:",objj_msgSend(_1a3,"decodeObjectForKey:",_199));
objj_msgSend(self,"setDelegate:",objj_msgSend(_1a3,"decodeObjectForKey:",_19a));
_tableDrawView=objj_msgSend(objj_msgSend(_CPTableDrawView,"alloc"),"initWithTableView:",self);
objj_msgSend(_tableDrawView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(self,"addSubview:",_tableDrawView);
objj_msgSend(self,"viewWillMoveToSuperview:",objj_msgSend(self,"superview"));
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1a6){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_1a6);
objj_msgSend(_1a6,"encodeObject:forKey:",_dataSource,_199);
objj_msgSend(_1a6,"encodeObject:forKey:",_delegate,_19a);
objj_msgSend(_1a6,"encodeFloat:forKey:",_rowHeight,_19d);
objj_msgSend(_1a6,"encodeSize:forKey:",_intercellSpacing,_19e);
objj_msgSend(_1a6,"encodeBool:forKey:",_allowsMultipleSelection,_19f);
objj_msgSend(_1a6,"encodeBool:forKey:",_allowsEmptySelection,_1a0);
objj_msgSend(_1a6,"encodeObject:forKey:",_tableColumns,_19c);
}
})]);
var _1b=objj_getClass("CPColor");
if(!_1b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _1c=_1b.isa;
class_addMethods(_1c,[new objj_method(sel_getUid("selectionColor"),function(self,_cmd){
with(self){
return objj_msgSend(CPColor,"colorWithHexString:","5f83b9");
}
}),new objj_method(sel_getUid("selectionColorSourceView"),function(self,_cmd){
with(self){
return objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:","Resources/tableviewselection.png",CGSizeMake(6,22)));
}
})]);
