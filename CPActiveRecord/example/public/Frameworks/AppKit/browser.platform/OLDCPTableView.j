i;11;CPControl.ji;15;CPTableColumn.ji;9;CPColor.ji;13;CPTextField.jc;28414;
CPTableViewColumnDidMoveNotification="CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification="CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification="CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification="CPTableViewSelectionIsChangingNotification";
var _1=1<<0,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4,_6=1<<5,_7=1<<6;
var _8=objj_allocateClassPair(CPControl,"CPTableView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_dataSource"),new objj_ivar("_delegate"),new objj_ivar("_tableColumns"),new objj_ivar("_selectedRowIndexes"),new objj_ivar("_rowHeight"),new objj_ivar("_intercellSpacing"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_doubleAction"),new objj_ivar("_delegateSelectorsCache"),new objj_ivar("_numberOfRows"),new objj_ivar("_hasVariableHeightRows"),new objj_ivar("_columnHeight"),new objj_ivar("_rowHeights"),new objj_ivar("_rowMinYs"),new objj_ivar("_tableCells"),new objj_ivar("_tableColumnViews"),new objj_ivar("_dataViewCache"),new objj_ivar("_objectValueCache"),new objj_ivar("_visibleRows"),new objj_ivar("_visibleColumns"),new objj_ivar("_populatedRows"),new objj_ivar("_populatedColumns"),new objj_ivar("_previousSelectedRowIndexes"),new objj_ivar("_selectionStartRow"),new objj_ivar("_selectionModifier"),new objj_ivar("_currentlySelected"),new objj_ivar("_selectionViews"),new objj_ivar("_selectionViewsPool"),new objj_ivar("_scrollTimer")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPControl")},"initWithFrame:",_c);
if(_a){
objj_msgSend(_a,"_init");
}
return _a;
}
}),new objj_method(sel_getUid("_init"),function(_d,_e){
with(_d){
_tableColumns=[];
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
_rowHeight=17;
_intercellSpacing=CPSizeMake(3,2);
_allowsMultipleSelection=YES;
_allowsEmptySelection=YES;
_tableCells=[];
_tableColumnViews=[];
_dataViewCache={};
_objectValueCache=[];
_visibleRows=CPMakeRange(0,0);
_visibleColumns=CPMakeRange(0,0);
_rowHeights=[];
_rowMinYs=[];
}
}),new objj_method(sel_getUid("_columnHeight"),function(_f,_10){
with(_f){
return _columnHeight;
}
}),new objj_method(sel_getUid("newCellForRow:column:avoidingRows:"),function(_11,_12,_13,_14,_15){
with(_11){
var _16=objj_msgSend(_tableColumns[_14],"_newDataViewForRow:avoidingRows:",_13,_15);
objj_msgSend(_16,"setFrame:",CGRectMake(0,(_hasVariableHeightRows?_rowMinYs[_13]:(_13*(_rowHeight+_intercellSpacing.height))),objj_msgSend(_tableColumns[_14],"width"),(_hasVariableHeightRows?_rowHeights[_13]:_rowHeight)));
if(objj_msgSend(_16,"respondsToSelector:",sel_getUid("highlight:"))){
objj_msgSend(_16,"highlight:",objj_msgSend(_selectedRowIndexes,"containsIndex:",_13));
}
if(!_objectValueCache[_14]){
_objectValueCache[_14]=[];
}
if(_objectValueCache[_14][_13]===undefined){
_objectValueCache[_14][_13]=objj_msgSend(_dataSource,"tableView:objectValueForTableColumn:row:",_11,_tableColumns[_14],_13);
}
objj_msgSend(_16,"setObjectValue:",_objectValueCache[_14][_13]);
return _16;
}
}),new objj_method(sel_getUid("clearCells"),function(_17,_18){
with(_17){
var _19=CPMaxRange(_visibleColumns),_1a=CPMaxRange(_visibleRows);
for(var _1b=_visibleColumns.location;_1b<_19;_1b++){
var _1c=_tableColumns[_1b],_1d=_tableCells[_1b];
for(var row=_visibleRows.location;row<_1a;row++){
var _1f=_1d[row];
if(_1f){
_1d[row]=nil;
objj_msgSend(_1c,"_markView:inRow:asPurgable:",_1f,row,YES);
}else{
CPLog.warn("Missing cell? "+row+","+_1b);
}
}
}
_visibleColumns=CPMakeRange(0,0);
_visibleRows=CPMakeRange(0,0);
}
}),new objj_method(sel_getUid("loadTableCellsInRect:"),function(_20,_21,_22){
with(_20){
if(!_dataSource){
return;
}
var _23=MAX(0,objj_msgSend(_20,"_rowAtY:",CGRectGetMinY(_22))-1),_24=MIN(_numberOfRows,objj_msgSend(_20,"_rowAtY:",CGRectGetMaxY(_22))+1),_25=CPMakeRange(_23,_24-_23),_26=MAX(0,objj_msgSend(_20,"_columnAtX:",CGRectGetMinX(_22))),_27=MIN(_tableColumns.length,objj_msgSend(_20,"_columnAtX:",CGRectGetMaxX(_22))+1),_28=CPMakeRange(_26,_27-_26);
if(CPEqualRanges(_visibleRows,_25)&&CPEqualRanges(_visibleColumns,_28)){
return;
}
var _29=CPUnionRange(_visibleRows,_25),_2a=CPUnionRange(_visibleColumns,_28);
if(_29.length*_2a.length<=(_visibleRows.length*_visibleColumns.length)+(_25.length*_28.length)){
var _2b=CPMaxRange(_2a),_2c=CPMaxRange(_29),_2d;
for(var _2e=_2a.location;_2e<_2b;++_2e){
var _2f=_tableColumns[_2e],_30=_tableCells[_2e],_31=CPLocationInRange(_2e,_28),_32=[];
for(var row=_29.location;row<_2c;++row){
if(_2d=_30[row]){
if(!_31||!CPLocationInRange(row,_25)){
_30[row]=nil;
objj_msgSend(_2f,"_markView:inRow:asPurgable:",_2d,row,YES);
}
}else{
_32.push(row);
}
}
while(_32.length>0){
var row=_32.pop();
_30[row]=objj_msgSend(_20,"newCellForRow:column:avoidingRows:",row,_2e,_25);
if(!_30[row]._superview){
objj_msgSend(_tableColumnViews[_2e],"addSubview:",_30[row]);
}else{
if(_30[row]._isHidden){
objj_msgSend(_30[row],"setHidden:",NO);
}
}
}
objj_msgSend(_2f,"_purge");
}
}else{
var _2b=CPMaxRange(_visibleColumns),_2c=CPMaxRange(_visibleRows),_2d;
for(var _2e=_visibleColumns.location;_2e<_2b;++_2e){
var _2f=_tableColumns[_2e],_30=_tableCells[_2e],_31=CPLocationInRange(_2e,_28);
for(var row=_visibleRows.location;row<_2c;++row){
if(_2d=_30[row]){
if(!_31||!CPLocationInRange(row,_25)){
_30[row]=nil;
objj_msgSend(_2f,"_markView:inRow:asPurgable:",_2d,row,YES);
}
}
}
}
var _2b=CPMaxRange(_28),_2c=CPMaxRange(_25);
for(var _2e=_28.location;_2e<_2b;++_2e){
var _2f=_tableColumns[_2e],_30=_tableCells[_2e];
for(var row=_25.location;row<_2c;++row){
_30[row]=objj_msgSend(_20,"newCellForRow:column:avoidingRows:",row,_2e,_25);
if(!_30[row]._superview){
objj_msgSend(_tableColumnViews[_2e],"addSubview:",_30[row]);
}else{
if(_30[row]._isHidden){
objj_msgSend(_30[row],"setHidden:",NO);
}
}
}
objj_msgSend(_2f,"_purge");
}
}
_visibleRows=_25;
_visibleColumns=_28;
}
}),new objj_method(sel_getUid("setIntercellSpacing:"),function(_34,_35,_36){
with(_34){
if(_intercellSpacing.width!=_36.width){
var i=1,_38=_36.width-_intercellSpacing.width;
total=_38;
for(;i<_tableColumns.length;++i,total+=_38){
var _39=objj_msgSend(_tableColumnViews[i],"frame").origin;
objj_msgSend(_tableColumnViews[i],"setFrameOrigin:",CGPointMake(_39.x+total,_39.y));
}
}
if(_intercellSpacing.height!=_36.height){
var i=0;
for(;i<_tableColumns.length;++i,total+=_38){
objj_msgSend(_tableColumnViews[i],"setFrameSize:",CGSizeMake(objj_msgSend(_tableColumnViews[i],"width"),_numberOfRows*(_rowHeight+_intercellSpacing.height)));
var j=1,y=_rowHeight+_intercellSpacing.height;
for(;j<_numberOfRows;++i,y+=_rowHeight+_intercellSpacing.height){
if(!_tableCells[i][j]){
continue;
}
objj_msgSend(_tableCells[i][j],"setFrameOrigin:",CPPointMake(0,y));
}
}
}
_intercellSpacing=CPSizeCreateCopy(_36);
}
}),new objj_method(sel_getUid("intercellSpacing"),function(_3c,_3d){
with(_3c){
return _intercellSpacing;
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_3e,_3f,_40){
with(_3e){
if(_rowHeight==_40){
return;
}
_rowHeight=_40;
if(_hasVariableHeightRows){
return;
}
for(var row=0;row<_numberOfRows;++row){
for(var _42=0;_42<_tableColumns.length;++_42){
objj_msgSend(_tableCells[_42][row],"setFrameOrigin:",CPPointMake(0,row*(_rowHeight+_intercellSpacing.height)));
}
}
}
}),new objj_method(sel_getUid("rowHeight"),function(_43,_44){
with(_43){
return _rowHeight;
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_45,_46,_47){
with(_45){
var i=0,x=_tableColumns.length?CPRectGetMaxX(objj_msgSend(_45,"rectOfColumn:",_tableColumns.length-1))+_intercellSpacing.width:0,_4a=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(x,0,objj_msgSend(_47,"width"),objj_msgSend(_45,"_columnHeight"))),_4b=[];
objj_msgSend(_tableColumns,"addObject:",_47);
objj_msgSend(_tableColumnViews,"addObject:",_4a);
objj_msgSend(_45,"addSubview:",_4a);
objj_msgSend(_tableCells,"addObject:",_4b);
for(;i<_numberOfRows;++i){
_tableCells[_tableColumns.length-1][i]=nil;
}
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_4c,_4d,_4e){
with(_4c){
var _4f=objj_msgSend(_4c,"frame"),_50=objj_msgSend(_4e,"width")+_intercellSpacing.width,_51=objj_msgSend(_tableColumns,"indexOfObjectIdenticalTo:",_4e);
objj_msgSend(_tableColumnViews[i],"removeFromSuperview");
objj_msgSend(_tableCells,"removeObjectAtIndex:",_51);
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_51);
objj_msgSend(_tableColumnViews,"removeObjectAtIndex:",_51);
for(;_51<_tableColumns.length;++_51){
objj_msgSend(_tableColumnViews[_51],"setFrameOrigin:",CPPointMake(CPRectGetMinX(objj_msgSend(_tableColumnViews[_51],"frame"))-_50,0));
}
objj_msgSend(_4c,"setFrameSize:",CPSizeMake(CPRectGetWidth(_4f)-_50,CPRectGetHeight(_4f)));
}
}),new objj_method(sel_getUid("moveColumn:toColumn:"),function(_52,_53,_54,_55){
with(_52){
if(_54==_55){
return;
}
}
}),new objj_method(sel_getUid("tableColumns"),function(_56,_57){
with(_56){
return _tableColumns;
}
}),new objj_method(sel_getUid("tableColumnWithIdentifier:"),function(_58,_59,_5a){
with(_58){
for(var i=0;i<_tableColumns.length;i++){
if(objj_msgSend(_tableColumns[i],"isEqual:",_5a)){
return _tableColumns[i];
}
}
return nil;
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_5c,_5d){
with(_5c){
return _tableColumns.length;
}
}),new objj_method(sel_getUid("numberOfRows"),function(_5e,_5f){
with(_5e){
return _numberOfRows;
}
}),new objj_method(sel_getUid("tile"),function(_60,_61){
with(_60){
var _62=10;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_63,_64,_65){
with(_63){
if(!objj_msgSend(_65,"respondsToSelector:",sel_getUid("numberOfRowsInTableView:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source doesn't support 'numberOfRowsInTableView:'");
}
if(!objj_msgSend(_65,"respondsToSelector:",sel_getUid("tableView:objectValueForTableColumn:row:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source doesn't support 'tableView:objectValueForTableColumn:row:'");
}
_dataSource=_65;
objj_msgSend(_63,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_66,_67){
with(_66){
return _dataSource;
}
}),new objj_method(sel_getUid("delegate"),function(_68,_69){
with(_68){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_6a,_6b,_6c){
with(_6a){
if(_delegate===_6c){
return;
}
var _6d=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_6d,"removeObserver:name:object:",_delegate,CPTableViewColumnDidMoveNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_6d,"removeObserver:name:object:",_delegate,CPTableViewColumnDidResizeNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_6d,"removeObserver:name:object:",_delegate,CPTableViewSelectionDidChangeNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_6d,"removeObserver:name:object:",_delegate,CPTableViewSelectionIsChangingNotification,_6a);
}
_delegate=_6c;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_6d,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidMoveNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_6d,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidResize:"),CPTableViewColumnDidResizeNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_6d,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionDidChange:"),CPTableViewSelectionDidChangeNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_6d,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionIsChanging:"),CPTableViewSelectionIsChangingNotification,_6a);
}
_delegateSelectorsCache=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:willDisplayCell:forTableColumn:row:"))){
_delegateSelectorsCache|=_1;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectRow:"))){
_delegateSelectorsCache|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectTableColumn:"))){
_delegateSelectorsCache|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("selectionShouldChangeInTableView:"))){
_delegateSelectorsCache|=_4;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldEditTableColumn:row:"))){
_delegateSelectorsCache|=_5;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:selectionIndexesForProposedSelection:"))){
_delegateSelectorsCache|=_6;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:heightOfRow:"))){
_delegateSelectorsCache|=_7;
_hasVariableHeightRows=YES;
}else{
_hasVariableHeightRows=NO;
}
}
}),new objj_method(sel_getUid("noteNumberOfRowsChanged"),function(_6e,_6f){
with(_6e){
var _70=objj_msgSend(_dataSource,"numberOfRowsInTableView:",_6e);
if(_numberOfRows!=_70){
_numberOfRows=_70;
objj_msgSend(_6e,"_recalculateColumnHeight");
}
}
}),new objj_method(sel_getUid("noteHeightOfRowsWithIndexesChanged:"),function(_71,_72,_73){
with(_71){
objj_msgSend(_71,"_recalculateColumnHeight");
}
}),new objj_method(sel_getUid("rectOfRow:"),function(_74,_75,_76){
with(_74){
return CPRectMake(0,(_hasVariableHeightRows?_rowMinYs[_76]:(_76*(_rowHeight+_intercellSpacing.height))),CPRectGetWidth(objj_msgSend(_74,"bounds")),(_hasVariableHeightRows?_rowHeights[_76]:_rowHeight));
}
}),new objj_method(sel_getUid("rectOfColumn:"),function(_77,_78,_79){
with(_77){
return objj_msgSend(_tableColumnViews[_79],"frame");
}
}),new objj_method(sel_getUid("sizeToFit"),function(_7a,_7b){
with(_7a){
}
}),new objj_method(sel_getUid("_recalculateColumnHeight"),function(_7c,_7d){
with(_7c){
var _7e=_columnHeight;
if(_hasVariableHeightRows){
_rowMinYs[0]=0;
for(var row=0;row<_numberOfRows;row++){
_rowHeights[row]=objj_msgSend(_delegate,"tableView:heightOfRow:",_7c,row);
_rowMinYs[row+1]=_rowMinYs[row]+_rowHeights[row]+_intercellSpacing.height;
}
_columnHeight=_rowMinYs[_numberOfRows];
}else{
_columnHeight=_numberOfRows*(_rowHeight+_intercellSpacing.height);
}
var _80=_tableColumnViews.length;
while(_80--){
objj_msgSend(_tableColumnViews[_80],"setFrameSize:",CGSizeMake(objj_msgSend(_tableColumns[_80],"width"),_columnHeight));
}
objj_msgSend(_7c,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_7c,"frame")),_columnHeight));
}
}),new objj_method(sel_getUid("visibleRectInParent"),function(_81,_82){
with(_81){
var _83=objj_msgSend(_81,"superview");
if(!_83){
return objj_msgSend(_81,"bounds");
}
return objj_msgSend(_81,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_83,"bounds"),objj_msgSend(_81,"frame")),_83);
}
}),new objj_method(sel_getUid("reloadData"),function(_84,_85){
with(_84){
var _86=_numberOfRows;
_numberOfRows=objj_msgSend(_dataSource,"numberOfRowsInTableView:",_84);
if(_86!=_numberOfRows){
objj_msgSend(_84,"_recalculateColumnHeight");
objj_msgSend(_84,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_84,"frame")),objj_msgSend(_84,"_columnHeight")));
}
_objectValueCache=[];
objj_msgSend(_84,"clearCells");
objj_msgSend(_84,"setNeedsLayout");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_87,_88){
with(_87){
objj_msgSend(_87,"loadTableCellsInRect:",objj_msgSend(_87,"visibleRectInParent"));
}
}),new objj_method(sel_getUid("displaySoon"),function(_89,_8a){
with(_89){
objj_msgSend(_scrollTimer,"invalidate");
_scrollTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.05,_89,sel_getUid("displayNow"),nil,NO);
}
}),new objj_method(sel_getUid("displayNow"),function(_8b,_8c){
with(_8b){
objj_msgSend(_8b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_8d,_8e){
with(_8d){
objj_msgSend(objj_msgSend(objj_msgSend(_8d,"enclosingScrollView"),"contentView"),"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8d,sel_getUid("viewBoundsChanged:"),CPViewBoundsDidChangeNotification,objj_msgSend(objj_msgSend(_8d,"enclosingScrollView"),"contentView"));
}
}),new objj_method(sel_getUid("viewBoundsChanged:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"displayNow");
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_92,_93,_94){
with(_92){
if(_allowsMultipleSelection===_94){
return;
}
_allowsMultipleSelection=_94;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_95,_96){
with(_95){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_97,_98,_99){
with(_97){
if(_allowsEmptySelection===_99){
return;
}
_allowsEmptySelection=_99;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_9a,_9b){
with(_9a){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("rowAtPoint:"),function(_9c,_9d,_9e){
with(_9c){
var _9f=objj_msgSend(_9c,"_rowAtY:",_9e.y);
if(_9f>=0&&_9f<_numberOfRows){
return _9f;
}else{
return CPNotFound;
}
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_a0,_a1,_a2){
with(_a0){
var _a3=objj_msgSend(_a0,"_columnAtX:",_a2.x);
if(_a3>=0&&_a3<_tableColumns.length){
return _a3;
}else{
return CPNotFound;
}
}
}),new objj_method(sel_getUid("_rowAtY:"),function(_a4,_a5,y){
with(_a4){
if(_hasVariableHeightRows){
var a=0,b=_numberOfRows;
if(y<_rowMinYs[0]){
return -1;
}
if(y>=_rowMinYs[_rowMinYs.length-1]){
return _numberOfRows;
}
while(true){
var _a9=a+Math.floor((b-a)/2);
if(y<_rowMinYs[_a9]){
b=_a9;
}else{
if(_a9<_numberOfRows-1&&y>=_rowMinYs[_a9+1]){
a=_a9;
}else{
return _a9;
}
}
}
}else{
return FLOOR(y/(_rowHeight+_intercellSpacing.height));
}
}
}),new objj_method(sel_getUid("_columnAtX:"),function(_aa,_ab,x){
with(_aa){
var a=0,b=_tableColumns.length;
var _af=objj_msgSend(_tableColumnViews[_tableColumns.length-1],"frame");
if(x<objj_msgSend(_tableColumnViews[0],"frame").origin.x){
return -1;
}
if(x>=_af.origin.x+_af.size.width){
return _tableColumns.length;
}
while(true){
var _b0=a+Math.floor((b-a)/2);
if(x<objj_msgSend(_tableColumnViews[_b0],"frame").origin.x){
b=_b0;
}else{
if(_b0<_tableColumns.length-1&&x>=objj_msgSend(_tableColumnViews[_b0+1],"frame").origin.x){
a=_b0;
}else{
return _b0;
}
}
}
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_b1,_b2,_b3,_b4){
with(_b1){
if(_b4){
_selectedRowIndexes=objj_msgSend(objj_msgSend(_selectedRowIndexes,"copy"),"addIndexes:",_b3);
}else{
if(objj_msgSend(_b3,"count")>0||_allowsEmptySelection){
_selectedRowIndexes=objj_msgSend(_b3,"copy");
}
}
objj_msgSend(_b1,"_drawSelection");
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_b5,_b6){
with(_b5){
return _selectedRowIndexes;
}
}),new objj_method(sel_getUid("numberOfSelectedRows"),function(_b7,_b8){
with(_b7){
return objj_msgSend(_selectedRowIndexes,"count");
}
}),new objj_method(sel_getUid("deselectAll:"),function(_b9,_ba,_bb){
with(_b9){
if(!_allowsEmptySelection||objj_msgSend(_selectedRowIndexes,"count")===0||((_delegateSelectorsCache&_4)&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",_b9))){
return;
}
objj_msgSend(_b9,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSet"),NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionDidChangeNotification,_b9,nil);
}
}),new objj_method(sel_getUid("editColumn:row:withEvent:select:"),function(_bc,_bd,_be,_bf,_c0,_c1){
with(_bc){
}
}),new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"),function(_c2,_c3,_c4){
with(_c2){
var _c5;
if(_allowsMultipleSelection){
_c5=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(MIN(_c4,_selectionStartRow),ABS(_c4-_selectionStartRow)+1));
}else{
if(_c4>=0&&_c4<_numberOfRows){
_c5=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_c4);
}else{
_c5=objj_msgSend(CPIndexSet,"indexSet");
}
}
if(_allowsMultipleSelection&&_selectionModifier&(CPCommandKeyMask|CPControlKeyMask|CPAlternateKeyMask)){
var _c6=objj_msgSend(_c5,"copy"),_c7=objj_msgSend(_c5,"copy");
objj_msgSend(_c7,"removeIndexes:",_previousSelectedRowIndexes);
objj_msgSend(_c6,"removeIndexes:",_c7);
objj_msgSend(_c5,"addIndexes:",_previousSelectedRowIndexes);
objj_msgSend(_c5,"removeIndexes:",_c6);
}
if(!objj_msgSend(_c5,"isEqualToIndexSet:",_selectedRowIndexes)){
if((_delegateSelectorsCache&_4)&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",_c2)){
return;
}
if(_delegateSelectorsCache&_6){
_c5=objj_msgSend(_delegate,"tableView:selectionIndexesForProposedSelection:",_c2,_c5);
}else{
if(_delegateSelectorsCache&_2){
var _c8=[];
objj_msgSend(_c5,"getIndexes:maxCount:inIndexRange:",_c8,Number.MAX_VALUE,nil);
for(var i=0;i<_c8.length;i++){
if(!objj_msgSend(_delegate,"tableView:shouldSelectRow:",_c2,_c8[i])){
objj_msgSend(_c5,"removeIndex:",_c8[i]);
}
}
}
}
}
if(!_allowsEmptySelection&&objj_msgSend(_c5,"count")===0){
return;
}
if(!objj_msgSend(_c5,"isEqualToIndexSet:",_selectedRowIndexes)){
objj_msgSend(_c2,"selectRowIndexes:byExtendingSelection:",_c5,NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionIsChangingNotification,_c2,nil);
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_ca,_cb,_cc){
with(_ca){
objj_msgSend(_ca,"trackSelection:",_cc);
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_cd,_ce,_cf){
with(_cd){
_doubleAction=_cf;
}
}),new objj_method(sel_getUid("doubleAction"),function(_d0,_d1){
with(_d0){
return _doubleAction;
}
}),new objj_method(sel_getUid("clickedColumn"),function(_d2,_d3){
with(_d2){
return _clickedColumn;
}
}),new objj_method(sel_getUid("clickedRow"),function(_d4,_d5){
with(_d4){
return _clickedRow;
}
}),new objj_method(sel_getUid("trackSelection:"),function(_d6,_d7,_d8){
with(_d6){
var _d9=objj_msgSend(_d8,"type"),_da=objj_msgSend(_d6,"convertPoint:fromView:",objj_msgSend(_d8,"locationInWindow"),nil),_db=MAX(0,MIN(_numberOfRows-1,objj_msgSend(_d6,"_rowAtY:",_da.y)));
if(_d9==CPLeftMouseUp){
_clickedRow=objj_msgSend(_d6,"rowAtPoint:",_da);
_clickedColumn=objj_msgSend(_d6,"columnAtPoint:",_da);
if(objj_msgSend(_d8,"clickCount")===2){
CPLog.warn("edit?!");
objj_msgSend(_d6,"sendAction:to:",_doubleAction,_target);
}else{
if(!objj_msgSend(_previousSelectedRowIndexes,"isEqualToIndexSet:",_selectedRowIndexes)){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionDidChangeNotification,_d6,nil);
}
objj_msgSend(_d6,"sendAction:to:",_action,_target);
}
return;
}
if(_d9==CPLeftMouseDown){
_previousSelectedRowIndexes=_selectedRowIndexes;
_selectionModifier=objj_msgSend(_d8,"modifierFlags");
if(_selectionModifier&CPShiftKeyMask){
_selectionStartRow=(ABS(objj_msgSend(_previousSelectedRowIndexes,"firstIndex")-_db)<ABS(objj_msgSend(_previousSelectedRowIndexes,"lastIndex")-_db))?objj_msgSend(_previousSelectedRowIndexes,"firstIndex"):objj_msgSend(_previousSelectedRowIndexes,"lastIndex");
}else{
_selectionStartRow=_db;
}
objj_msgSend(_d6,"_updateSelectionWithMouseAtRow:",_db);
}else{
if(_d9==CPLeftMouseDragged){
objj_msgSend(_d6,"_updateSelectionWithMouseAtRow:",_db);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_d6,sel_getUid("trackSelection:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_drawSelection"),function(_dc,_dd){
with(_dc){
if(!_currentlySelected){
_currentlySelected=objj_msgSend(CPIndexSet,"indexSet");
_selectionViews=[];
_selectionViewsPool=[];
}
var _de=objj_msgSend(_currentlySelected,"copy"),_df=[];
objj_msgSend(_de,"removeIndexes:",_selectedRowIndexes);
objj_msgSend(_de,"getIndexes:maxCount:inIndexRange:",_df,Number.MAX_VALUE,nil);
var _e0=objj_msgSend(_selectedRowIndexes,"copy"),_e1=[];
objj_msgSend(_e0,"removeIndexes:",_currentlySelected);
objj_msgSend(_e0,"getIndexes:maxCount:inIndexRange:",_e1,Number.MAX_VALUE,nil);
for(var i=0;i<_df.length;i++){
var row=_df[i];
for(var _e4=0;_e4<_tableColumns.length;_e4++){
if(objj_msgSend(_tableCells[_e4][row],"respondsToSelector:",sel_getUid("highlight:"))){
objj_msgSend(_tableCells[_e4][row],"highlight:",NO);
}
}
}
for(var i=0;i<_e1.length;i++){
var row=_e1[i];
for(var _e4=0;_e4<_tableColumns.length;_e4++){
if(objj_msgSend(_tableCells[_e4][row],"respondsToSelector:",sel_getUid("highlight:"))){
objj_msgSend(_tableCells[_e4][row],"highlight:",YES);
}
}
}
for(var i=0;i<_e1.length;i++){
var _e5=_e1[i],_e6;
if(_df.length>0){
_e6=_selectionViews[_df.pop()];
}else{
if(_selectionViewsPool.length>0){
_e6=_selectionViewsPool.pop();
objj_msgSend(_dc,"addSubview:positioned:relativeTo:",_e6,CPWindowBelow,nil);
}else{
_e6=objj_msgSend(objj_msgSend(CPView,"alloc"),"init");
objj_msgSend(_e6,"setBackgroundColor:",objj_msgSend(CPColor,"alternateSelectedControlColor"));
objj_msgSend(_dc,"addSubview:positioned:relativeTo:",_e6,CPWindowBelow,nil);
}
}
_selectionViews[_e5]=_e6;
var _e7=objj_msgSend(_dc,"rectOfRow:",_e5);
_e7.size.height+=_intercellSpacing.height-1;
objj_msgSend(_e6,"setFrame:",_e7);
}
for(var i=0;i<_df.length;i++){
var row=_df[i],_e6=_selectionViews[row];
objj_msgSend(_e6,"removeFromSuperview");
_selectionViewsPool.push(_e6);
}
_currentlySelected=objj_msgSend(_selectedRowIndexes,"copy");
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(_e8,_e9){
with(_e8){
}
})]);
var _ea="CPTableViewDataSourceKey",_eb="CPTableViewDelegateKey",_ec="CPTableViewHeaderViewKey",_ed="CPTableViewTableColumnsKey",_ee="CPTableViewRowHeightKey",_ef="CPTableViewIntercellSpacingKey",_f0="CPTableViewMultipleSelectionKey",_f1="CPTableViewEmptySelectionKey";
var _8=objj_getClass("CPTableView");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableView\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_f2,_f3,_f4){
with(_f2){
if(_f2=objj_msgSendSuper({receiver:_f2,super_class:objj_getClass("CPControl")},"initWithCoder:",_f4)){
objj_msgSend(_f2,"_init");
_dataSource=objj_msgSend(_f4,"decodeObjectForKey:",_ea);
_delegate=objj_msgSend(_f4,"decodeObjectForKey:",_eb);
_rowHeight=objj_msgSend(_f4,"decodeFloatForKey:",_ee);
_intercellSpacing=objj_msgSend(_f4,"decodeSizeForKey:",_ef);
_allowsMultipleSelection=objj_msgSend(_f4,"decodeBoolForKey:",_f0);
_allowsEmptySelection=objj_msgSend(_f4,"decodeBoolForKey:",_f1);
var _f5=objj_msgSend(_f4,"decodeObjectForKey:",_ed);
for(var i=0;i<_f5.length;i++){
objj_msgSend(_f2,"addTableColumn:",_f5[i]);
}
}
return _f2;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_f7,_f8,_f9){
with(_f7){
objj_msgSendSuper({receiver:_f7,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_f9);
objj_msgSend(_f9,"encodeObject:forKey:",_dataSource,_ea);
objj_msgSend(_f9,"encodeObject:forKey:",_delegate,_eb);
objj_msgSend(_f9,"encodeObject:forKey:",_tableColumns,_ed);
objj_msgSend(_f9,"encodeFloat:forKey:",_rowHeight,_ee);
objj_msgSend(_f9,"encodeSize:forKey:",_intercellSpacing,_ef);
objj_msgSend(_f9,"encodeBool:forKey:",_allowsMultipleSelection,_f0);
objj_msgSend(_f9,"encodeBool:forKey:",_allowsEmptySelection,_f1);
}
})]);
var _8=objj_getClass("CPColor");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _9=_8.isa;
class_addMethods(_9,[new objj_method(sel_getUid("alternateSelectedControlColor"),function(_fa,_fb){
with(_fa){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.22,0.46,0.84,1]);
}
}),new objj_method(sel_getUid("secondarySelectedControlColor"),function(_fc,_fd){
with(_fc){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.83,0.83,0.83,1]);
}
})]);
