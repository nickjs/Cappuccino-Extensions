I;20;Foundation/CPArray.ji;11;CPControl.ji;15;CPTableColumn.ji;15;_CPCornerView.ji;12;CPScroller.jc;64794;
CPTableViewColumnDidMoveNotification = "CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification = "CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification = "CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification = "CPTableViewSelectionIsChangingNotification";
var CPTableViewDataSource_tableView_setObjectValue_forTableColumn_row_ = 1 << 2,
    CPTableViewDataSource_tableView_acceptDrop_row_dropOperation_ = 1 << 3,
    CPTableViewDataSource_tableView_namesOfPromisedFilesDroppedAtDestination_forDraggedRowsWithIndexes_ = 1 << 4,
    CPTableViewDataSource_tableView_validateDrop_proposedRow_proposedDropOperation_ = 1 << 5,
    CPTableViewDataSource_tableView_writeRowsWithIndexes_toPasteboard_ = 1 << 6,
    CPTableViewDataSource_tableView_sortDescriptorsDidChange_ = 1 << 7;
var CPTableViewDelegate_selectionShouldChangeInTableView_ = 1 << 0,
    CPTableViewDelegate_tableView_dataViewForTableColumn_row_ = 1 << 1,
    CPTableViewDelegate_tableView_didClickTableColumn_ = 1 << 2,
    CPTableViewDelegate_tableView_didDragTableColumn_ = 1 << 3,
    CPTableViewDelegate_tableView_heightOfRow_ = 1 << 4,
    CPTableViewDelegate_tableView_isGroupRow_ = 1 << 5,
    CPTableViewDelegate_tableView_mouseDownInHeaderOfTableColumn_ = 1 << 6,
    CPTableViewDelegate_tableView_nextTypeSelectMatchFromRow_toRow_forString_ = 1 << 7,
    CPTableViewDelegate_tableView_selectionIndexesForProposedSelection_ = 1 << 8,
    CPTableViewDelegate_tableView_shouldEditTableColumn_row_ = 1 << 9,
    CPTableViewDelegate_tableView_shouldSelectRow_ = 1 << 10,
    CPTableViewDelegate_tableView_shouldSelectTableColumn_ = 1 << 11,
    CPTableViewDelegate_tableView_shouldShowViewExpansionForTableColumn_row_ = 1 << 12,
    CPTableViewDelegate_tableView_shouldTrackView_forTableColumn_row_ = 1 << 13,
    CPTableViewDelegate_tableView_shouldTypeSelectForEvent_withCurrentSearchString_ = 1 << 14,
    CPTableViewDelegate_tableView_toolTipForView_rect_tableColumn_row_mouseLocation_ = 1 << 15,
    CPTableViewDelegate_tableView_typeSelectStringForTableColumn_row_ = 1 << 16,
    CPTableViewDelegate_tableView_willDisplayView_forTableColumn_row_ = 1 << 17,
    CPTableViewDelegate_tableViewSelectionDidChange_ = 1 << 18,
    CPTableViewDelegate_tableViewSelectionIsChanging_ = 1 << 19;
CPTableViewSelectionHighlightStyleRegular = 0;
CPTableViewSelectionHighlightStyleSourceList = 1;
CPTableViewGridNone = 0;
CPTableViewSolidVerticalGridLineMask = 1 << 0;
CPTableViewSolidHorizontalGridLineMask = 1 << 1;
{var the_class = objj_allocateClassPair(CPView, "_CPTableDrawView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tableView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTableView:"), function $_CPTableDrawView__initWithTableView_(self, _cmd, aTableView)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "init");
    if (self)
        _tableView = aTableView;
    return self;
}
},["id","CPTableView"]), new objj_method(sel_getUid("drawRect:"), function $_CPTableDrawView__drawRect_(self, _cmd, aRect)
{ with(self)
{
    var frame = objj_msgSend(self, "frame"),
        context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextTranslateCTM(context, -(frame.origin.x), -(frame.origin.y));
    objj_msgSend(_tableView, "_drawRect:", aRect);
}
},["void","CGRect"])]);
}
{var the_class = objj_allocateClassPair(CPControl, "CPTableView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dataSource"), new objj_ivar("_implementedDataSourceMethods"), new objj_ivar("_delegate"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_tableColumns"), new objj_ivar("_tableColumnRanges"), new objj_ivar("_dirtyTableColumnRangeIndex"), new objj_ivar("_numberOfHiddenColumns"), new objj_ivar("_reloadAllRows"), new objj_ivar("_objectValues"), new objj_ivar("_exposedRows"), new objj_ivar("_exposedColumns"), new objj_ivar("_dataViewsForTableColumns"), new objj_ivar("_cachedDataViews"), new objj_ivar("_allowsColumnReordering"), new objj_ivar("_allowsColumnResizing"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_allowsEmptySelection"), new objj_ivar("_intercellSpacing"), new objj_ivar("_rowHeight"), new objj_ivar("_usesAlternatingRowBackgroundColors"), new objj_ivar("_alternatingRowBackgroundColors"), new objj_ivar("_selectionHighlightMask"), new objj_ivar("_currentHighlightedTableColumn"), new objj_ivar("_gridStyleMask"), new objj_ivar("_gridColor"), new objj_ivar("_numberOfRows"), new objj_ivar("_headerView"), new objj_ivar("_cornerView"), new objj_ivar("_selectedColumnIndexes"), new objj_ivar("_selectedRowIndexes"), new objj_ivar("_selectionAnchorRow"), new objj_ivar("_tableDrawView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPTableView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _allowsColumnReordering = YES;
        _allowsColumnResizing = YES;
        _allowsMultipleSelection = NO;
        _allowsEmptySelection = YES;
        _allowsColumnSelection = NO;
        _tableViewFlags = 0;
        _selectionHighlightMask = CPTableViewSelectionHighlightStyleRegular;
        objj_msgSend(self, "setUsesAlternatingRowBackgroundColors:", NO);
        objj_msgSend(self, "setAlternatingRowBackgroundColors:", [objj_msgSend(CPColor, "whiteColor"), objj_msgSend(CPColor, "colorWithHexString:", "e4e7ff")]);
        _tableColumns = [];
        _tableColumnRanges = [];
        _dirtyTableColumnRangeIndex = CPNotFound;
        _numberOfHiddenColumns = 0;
        _objectValues = { };
        _dataViewsForTableColumns = { };
        _dataViews= [];
        _numberOfRows = 0;
        _exposedRows = objj_msgSend(CPIndexSet, "indexSet");
        _exposedColumns = objj_msgSend(CPIndexSet, "indexSet");
        _cachedDataViews = { };
        _intercellSpacing = { width:0.0, height:0.0 };
        _rowHeight = 19.0;
        objj_msgSend(self, "setGridColor:", objj_msgSend(CPColor, "grayColor"));
        objj_msgSend(self, "setGridStyleMask:", CPTableViewGridNone);
        _headerView = objj_msgSend(objj_msgSend(CPTableHeaderView, "alloc"), "initWithFrame:", CGRectMake(0, 0, objj_msgSend(self, "bounds").size.width, _rowHeight));
        objj_msgSend(_headerView, "setTableView:", self);
        _cornerView = objj_msgSend(objj_msgSend(_CPCornerView, "alloc"), "initWithFrame:", CGRectMake(0, 0, objj_msgSend(CPScroller, "scrollerWidth"), CGRectGetHeight(objj_msgSend(_headerView, "frame"))));
        _selectedColumnIndexes = objj_msgSend(CPIndexSet, "indexSet");
        _selectedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
        _tableDrawView = objj_msgSend(objj_msgSend(_CPTableDrawView, "alloc"), "initWithTableView:", self);
        objj_msgSend(_tableDrawView, "setBackgroundColor:", objj_msgSend(CPColor, "clearColor"));
        objj_msgSend(self, "addSubview:", _tableDrawView);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setDataSource:"), function $CPTableView__setDataSource_(self, _cmd, aDataSource)
{ with(self)
{
    if (_dataSource === aDataSource)
        return;
    _dataSource = aDataSource;
    _implementedDataSourceMethods = 0;
    if (!_dataSource)
        return;
    if (!objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("numberOfRowsInTableView:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, objj_msgSend(aDataSource, "description") + " does not implement numberOfRowsInTableView:.");
    if (!objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:objectValueForTableColumn:row:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, objj_msgSend(aDataSource, "description") + " does not implement tableView:objectValueForTableColumn:row:");
    if (objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:setObjectValue:forTableColumn:row:")))
        _implementedDataSourceMethods |= CPTableViewDataSource_tableView_setObjectValue_forTableColumn_row_;
    if (objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:setObjectValue:forTableColumn:row:")))
        _implementedDataSourceMethods |= CPTableViewDataSource_tableView_acceptDrop_row_dropOperation_;
    if (objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:")))
        _implementedDataSourceMethods |= CPTableViewDataSource_tableView_namesOfPromisedFilesDroppedAtDestination_forDraggedRowsWithIndexes_;
    if (objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:")))
        _implementedDataSourceMethods |= CPTableViewDataSource_tableView_validateDrop_proposedRow_proposedDropOperation_;
    if (objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:")))
        _implementedDataSourceMethods |= CPTableViewDataSource_tableView_writeRowsWithIndexes_toPasteboard_;
    objj_msgSend(self, "reloadData");
}
},["void","id"]), new objj_method(sel_getUid("dataSource"), function $CPTableView__dataSource(self, _cmd)
{ with(self)
{
    return _dataSource;
}
},["id"]), new objj_method(sel_getUid("reloadDataForRowIndexes:columnIndexes:"), function $CPTableView__reloadDataForRowIndexes_columnIndexes_(self, _cmd, rowIndexes, columnIndexes)
{ with(self)
{
    objj_msgSend(self, "reloadData");
}
},["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("reloadData"), function $CPTableView__reloadData(self, _cmd)
{ with(self)
{
    if (!_dataSource)
        return;
    _reloadAllRows = YES;
    _objectValues = { };
    objj_msgSend(self, "noteNumberOfRowsChanged");
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void"]), new objj_method(sel_getUid("setDoubleAction:"), function $CPTableView__setDoubleAction_(self, _cmd, anAction)
{ with(self)
{
    _doubleAction = anAction;
}
},["void","SEL"]), new objj_method(sel_getUid("doubleAction"), function $CPTableView__doubleAction(self, _cmd)
{ with(self)
{
    return _doubleAction;
}
},["SEL"]), new objj_method(sel_getUid("setAllowsColumnReordering:"), function $CPTableView__setAllowsColumnReordering_(self, _cmd, shouldAllowColumnReordering)
{ with(self)
{
    _allowsColumnReordering = !!shouldAllowColumnReordering;
}
},["void","BOOL"]), new objj_method(sel_getUid("allowsColumnReordering"), function $CPTableView__allowsColumnReordering(self, _cmd)
{ with(self)
{
    return _allowsColumnReordering;
}
},["BOOL"]), new objj_method(sel_getUid("setAllowsColumnResizing:"), function $CPTableView__setAllowsColumnResizing_(self, _cmd, shouldAllowColumnResizing)
{ with(self)
{
    _allowsColumnResizing = !!shouldAllowColumnResizing;
}
},["void","BOOL"]), new objj_method(sel_getUid("allowsColumnResizing"), function $CPTableView__allowsColumnResizing(self, _cmd)
{ with(self)
{
    return _allowsColumnResizing;
}
},["BOOL"]), new objj_method(sel_getUid("setAllowsMultipleSelection:"), function $CPTableView__setAllowsMultipleSelection_(self, _cmd, shouldAllowMultipleSelection)
{ with(self)
{
    _allowsMultipleSelection = !!shouldAllowMultipleSelection;
}
},["void","BOOL"]), new objj_method(sel_getUid("allowsMultipleSelection"), function $CPTableView__allowsMultipleSelection(self, _cmd)
{ with(self)
{
    return _allowsMultipleSelection;
}
},["BOOL"]), new objj_method(sel_getUid("setAllowsEmptySelection:"), function $CPTableView__setAllowsEmptySelection_(self, _cmd, shouldAllowEmptySelection)
{ with(self)
{
    _allowsEmptySelection = !!shouldAllowEmptySelection;
}
},["void","BOOL"]), new objj_method(sel_getUid("allowsEmptySelection"), function $CPTableView__allowsEmptySelection(self, _cmd)
{ with(self)
{
    return _allowsEmptySelection;
}
},["BOOL"]), new objj_method(sel_getUid("setAllowsColumnSelection:"), function $CPTableView__setAllowsColumnSelection_(self, _cmd, shouldAllowColumnSelection)
{ with(self)
{
    _allowsColumnSelection = !!shouldAllowColumnSelection;
}
},["void","BOOL"]), new objj_method(sel_getUid("allowsColumnSelection"), function $CPTableView__allowsColumnSelection(self, _cmd)
{ with(self)
{
    return _allowsColumnSelection;
}
},["BOOL"]), new objj_method(sel_getUid("setIntercellSpacing:"), function $CPTableView__setIntercellSpacing_(self, _cmd, aSize)
{ with(self)
{
    if ((_intercellSpacing.width == aSize.width && _intercellSpacing.height == aSize.height))
        return;
    _intercellSpacing = { width:aSize.width, height:aSize.height };
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CGSize"]), new objj_method(sel_getUid("setThemeState:"), function $CPTableView__setThemeState_(self, _cmd, astae)
{ with(self)
{
}
},["void","int"]), new objj_method(sel_getUid("intercellSpacing"), function $CPTableView__intercellSpacing(self, _cmd)
{ with(self)
{
    return { width:_intercellSpacing.width, height:_intercellSpacing.height };
}
},["CGSize"]), new objj_method(sel_getUid("setRowHeight:"), function $CPTableView__setRowHeight_(self, _cmd, aRowHeight)
{ with(self)
{
    aRowHeight = +aRowHeight;
    if (_rowHeight === aRowHeight)
        return;
    _rowHeight = MAX(0.0, aRowHeight);
    objj_msgSend(self, "setNeedsLayout");
}
},["void","unsigned"]), new objj_method(sel_getUid("rowHeight"), function $CPTableView__rowHeight(self, _cmd)
{ with(self)
{
    return _rowHeight;
}
},["unsigned"]), new objj_method(sel_getUid("setUsesAlternatingRowBackgroundColors:"), function $CPTableView__setUsesAlternatingRowBackgroundColors_(self, _cmd, shouldUseAlternatingRowBackgroundColors)
{ with(self)
{
    _usesAlternatingRowBackgroundColors = shouldUseAlternatingRowBackgroundColors;
}
},["void","BOOL"]), new objj_method(sel_getUid("usesAlternatingRowBackgroundColors"), function $CPTableView__usesAlternatingRowBackgroundColors(self, _cmd)
{ with(self)
{
    return _usesAlternatingRowBackgroundColors;
}
},["BOOL"]), new objj_method(sel_getUid("setAlternatingRowBackgroundColors:"), function $CPTableView__setAlternatingRowBackgroundColors_(self, _cmd, alternatingRowBackgroundColors)
{ with(self)
{
    if (objj_msgSend(_alternatingRowBackgroundColors, "isEqual:", alternatingRowBackgroundColors))
        return;
    _alternatingRowBackgroundColors = alternatingRowBackgroundColors;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPArray"]), new objj_method(sel_getUid("alternatingRowBackgroundColors"), function $CPTableView__alternatingRowBackgroundColors(self, _cmd)
{ with(self)
{
    return _alternatingRowBackgroundColors;
}
},["CPArray"]), new objj_method(sel_getUid("selectionHighlightStyle"), function $CPTableView__selectionHighlightStyle(self, _cmd)
{ with(self)
{
    return _selectionHighlightMask;
}
},["unsigned"]), new objj_method(sel_getUid("setSelectionHighlightStyle:"), function $CPTableView__setSelectionHighlightStyle_(self, _cmd, aSelectionHighlightStyle)
{ with(self)
{
    _selectionHighlightMask = aSelectionHighlightStyle;
}
},["void","unsigned"]), new objj_method(sel_getUid("setGridColor:"), function $CPTableView__setGridColor_(self, _cmd, aColor)
{ with(self)
{
    if (_gridColor === aColor)
        return;
    _gridColor = aColor;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPColor"]), new objj_method(sel_getUid("gridColor"), function $CPTableView__gridColor(self, _cmd)
{ with(self)
{
    return _gridColor;
}
},["CPColor"]), new objj_method(sel_getUid("setGridStyleMask:"), function $CPTableView__setGridStyleMask_(self, _cmd, aGrideStyleMask)
{ with(self)
{
    if (_gridStyleMask === aGrideStyleMask)
        return;
    _gridStyleMask = aGrideStyleMask
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","unsigned"]), new objj_method(sel_getUid("gridStyleMask"), function $CPTableView__gridStyleMask(self, _cmd)
{ with(self)
{
    return _gridStyleMask;
}
},["unsigned"]), new objj_method(sel_getUid("addTableColumn:"), function $CPTableView__addTableColumn_(self, _cmd, aTableColumn)
{ with(self)
{
    objj_msgSend(_tableColumns, "addObject:", aTableColumn);
    objj_msgSend(aTableColumn, "setTableView:", self);
    if (_dirtyTableColumnRangeIndex < 0)
        _dirtyTableColumnRangeIndex = (_tableColumns.length) - 1;
    else
        _dirtyTableColumnRangeIndex = MIN((_tableColumns.length) - 1, _dirtyTableColumnRangeIndex);
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPTableColumn"]), new objj_method(sel_getUid("removeTableColumn:"), function $CPTableView__removeTableColumn_(self, _cmd, aTableColumn)
{ with(self)
{
    if (objj_msgSend(aTableColumn, "tableView") !== self)
        return;
    var index = objj_msgSend(_tableColumns, "indexOfObjectIdenticalTo:", aTableColumn);
    if (index === CPNotFound)
        return;
    objj_msgSend(aTableColumn, "setTableView:", nil);
    objj_msgSend(_tableColumns, "removeObjectAtIndex:", index);
    var tableColumnUID = objj_msgSend(aTableColumn, "UID");
    if (_objectValues[tableColumnUID])
        _objectValues[tableColumnUID] = nil;
    if (_dirtyTableColumnRangeIndex < 0)
        _dirtyTableColumnRangeIndex = index;
    else
        _dirtyTableColumnRangeIndex = MIN(index, _dirtyTableColumnRangeIndex);
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPTableColumn"]), new objj_method(sel_getUid("moveColumn:toColumn:"), function $CPTableView__moveColumn_toColumn_(self, _cmd, fromIndex, toIndex)
{ with(self)
{
    fromIndex = +fromIndex;
    toIndex = +toIndex;
    if (fromIndex === toIndex)
        return;
    if (_dirtyTableColumnRangeIndex < 0)
        _dirtyTableColumnRangeIndex = MIN(fromIndex, toIndex);
    else
        _dirtyTableColumnRangeIndex = MIN(fromIndex, toIndex, _dirtyTableColumnRangeIndex);
    if (toIndex > fromIndex)
        --toIndex;
    var tableColumn = _tableColumns[fromIndex];
    objj_msgSend(_tableColumns, "removeObjectAtIndex:", fromIndex);
    objj_msgSend(_tableColumns, "insertObject:atIndex:", tableColumn, toIndex);
    objj_msgSend(self, "setNeedsLayout");
}
},["void","unsigned","unsigned"]), new objj_method(sel_getUid("tableColumns"), function $CPTableView__tableColumns(self, _cmd)
{ with(self)
{
    return _tableColumns;
}
},["CPArray"]), new objj_method(sel_getUid("columnWithIdentifier:"), function $CPTableView__columnWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    var index = 0,
        count = (_tableColumns.length);
    for (; index < count; ++index)
        if (objj_msgSend(_tableColumns, "identifier") === anIdentifier)
            return index;
    return CPNotFound;
}
},["CPInteger","CPString"]), new objj_method(sel_getUid("tableColumnWithIdentifier:"), function $CPTableView__tableColumnWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    var index = objj_msgSend(self, "columnWithIdentifier:", anIdentifier);
    if (index === CPNotFound)
        return nil;
    return _tableColumns[index];
}
},["CPTableColumn","CPString"]), new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"), function $CPTableView__selectColumnIndexes_byExtendingSelection_(self, _cmd, columns, shouldExtendSelection)
{ with(self)
{
    _selectedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
    if (shouldExtendSelection)
        objj_msgSend(_selectedColumnIndexes, "addIndexes:", columns);
    else
        _selectedColumnIndexes = objj_msgSend(columns, "copy");
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"), function $CPTableView__selectRowIndexes_byExtendingSelection_(self, _cmd, rows, shouldExtendSelection)
{ with(self)
{
    _selectedColumnIndexes = objj_msgSend(CPIndexSet, "indexSet");
    if (shouldExtendSelection)
        objj_msgSend(_selectedRowIndexes, "addIndexes:", rows);
    else
        _selectedRowIndexes = objj_msgSend(rows, "copy");
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPIndexSet","BOOL"]), new objj_method(sel_getUid("selectedColumnIndexes"), function $CPTableView__selectedColumnIndexes(self, _cmd)
{ with(self)
{
    return _selectedColumnIndexes;
}
},["CPIndexSet"]), new objj_method(sel_getUid("selectedRowIndexes"), function $CPTableView__selectedRowIndexes(self, _cmd)
{ with(self)
{
    return _selectedRowIndexes;
}
},["void"]), new objj_method(sel_getUid("deselectColumn:"), function $CPTableView__deselectColumn_(self, _cmd, aColumn)
{ with(self)
{
    objj_msgSend(_selectedColumnIndexes, "removeIndex:", aColumn);
}
},["void","CPInteger"]), new objj_method(sel_getUid("deselectRow:"), function $CPTableView__deselectRow_(self, _cmd, aRow)
{ with(self)
{
    objj_msgSend(_selectedRowIndexes, "removeIndex:", aRow);
}
},["void","CPInteger"]), new objj_method(sel_getUid("numberOfSelectedColumns"), function $CPTableView__numberOfSelectedColumns(self, _cmd)
{ with(self)
{
    return objj_msgSend(_selectedColumnIndexes, "count");
}
},["CPInteger"]), new objj_method(sel_getUid("numberOfSelectedRows"), function $CPTableView__numberOfSelectedRows(self, _cmd)
{ with(self)
{
    return objj_msgSend(_selectedRowIndexes, "count");
}
},["CPInteger"]), new objj_method(sel_getUid("isColumnSelected:"), function $CPTableView__isColumnSelected_(self, _cmd, aColumn)
{ with(self)
{
    return objj_msgSend(_selectedColumnIndexes, "containsIndex:", aColumn);
}
},["BOOL","CPInteger"]), new objj_method(sel_getUid("isRowSelected:"), function $CPTableView__isRowSelected_(self, _cmd, aRow)
{ with(self)
{
    return objj_msgSend(_selectedRowIndexes, "containsIndex:", aRow);
}
},["BOOL","CPInteger"]), new objj_method(sel_getUid("numberOfColumns"), function $CPTableView__numberOfColumns(self, _cmd)
{ with(self)
{
    return (_tableColumns.length);
}
},["int"]), new objj_method(sel_getUid("numberOfRows"), function $CPTableView__numberOfRows(self, _cmd)
{ with(self)
{
    if (!_dataSource)
        return 0;
    return objj_msgSend(_dataSource, "numberOfRowsInTableView:", self);
}
},["int"]), new objj_method(sel_getUid("cornerView"), function $CPTableView__cornerView(self, _cmd)
{ with(self)
{
    return _cornerView;
}
},["CPView"]), new objj_method(sel_getUid("setCornerView:"), function $CPTableView__setCornerView_(self, _cmd, aView)
{ with(self)
{
    if (_cornerView === aView)
        return;
    _cornerView = aView;
    var scrollView = objj_msgSend(objj_msgSend(self, "superview"), "superview");
    if (objj_msgSend(scrollView, "isKindOfClass:", objj_msgSend(CPScrollView, "class")) && objj_msgSend(scrollView, "documentView") === self)
        objj_msgSend(scrollView, "_updateCornerAndHeaderView");
}
},["void","CPView"]), new objj_method(sel_getUid("headerView"), function $CPTableView__headerView(self, _cmd)
{ with(self)
{
    return _headerView;
}
},["CPView"]), new objj_method(sel_getUid("setHeaderView:"), function $CPTableView__setHeaderView_(self, _cmd, aHeaderView)
{ with(self)
{
    if (_headerView === aHeaderView)
        return;
    objj_msgSend(_headerView, "setTableView:", nil);
    _headerView = aHeaderView;
    if (_headerView)
    {
        objj_msgSend(_headerView, "setTableView:", self);
        objj_msgSend(_headerView, "setFrameSize:", { width:(objj_msgSend(self, "frame").size.width), height:(objj_msgSend(_headerView, "frame").size.height) });
    }
    var scrollView = objj_msgSend(objj_msgSend(self, "superview"), "superview");
    if (objj_msgSend(scrollView, "isKindOfClass:", objj_msgSend(CPScrollView, "class")) && objj_msgSend(scrollView, "documentView") === self)
        objj_msgSend(scrollView, "_updateCornerAndHeaderView");
}
},["void","CPView"]), new objj_method(sel_getUid("_recalculateTableColumnRanges"), function $CPTableView___recalculateTableColumnRanges(self, _cmd)
{ with(self)
{
    if (_dirtyTableColumnRangeIndex < 0)
        return;
    var index = _dirtyTableColumnRangeIndex,
        count = (_tableColumns.length),
        x = index === 0 ? 0.0 : CPMaxRange(_tableColumnRanges[index - 1]);
    for (; index < count; ++index)
    {
        var tableColumn = _tableColumns[index];
        if (objj_msgSend(tableColumn, "isHidden"))
            _tableColumnRanges[index] = CPMakeRange(x, 0.0);
        else
        {
            var width = objj_msgSend(_tableColumns[index], "width");
            _tableColumnRanges[index] = CPMakeRange(x, width);
            x += width;
        }
    }
    _tableColumnRanges.length = count;
    _dirtyTableColumnRangeIndex = CPNotFound;
}
},["void"]), new objj_method(sel_getUid("rectOfColumn:"), function $CPTableView__rectOfColumn_(self, _cmd, aColumnIndex)
{ with(self)
{
    aColumnIndex = +aColumnIndex;
    if (aColumnIndex < 0 || aColumnIndex >= (_tableColumns.length))
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    if (_dirtyTableColumnRangeIndex !== CPNotFound) objj_msgSend(self, "_recalculateTableColumnRanges");;
    var range = _tableColumnRanges[aColumnIndex];
    return { origin: { x:range.location, y:0.0 }, size: { width:range.length, height:CGRectGetHeight(objj_msgSend(self, "bounds")) } };
}
},["CGRect","CPInteger"]), new objj_method(sel_getUid("rectOfRow:"), function $CPTableView__rectOfRow_(self, _cmd, aRowIndex)
{ with(self)
{
    if (NO)
        return NULL;
    return { origin: { x:0.0, y:(aRowIndex * (_rowHeight + _intercellSpacing.height)) }, size: { width:(objj_msgSend(self, "bounds").size.width), height:_rowHeight } };
}
},["CGRect","CPInteger"]), new objj_method(sel_getUid("rowsInRect:"), function $CPTableView__rowsInRect_(self, _cmd, aRect)
{ with(self)
{
    if (_numberOfRows <= 0)
        return CPMakeRange(0, 0);
    var bounds = objj_msgSend(self, "bounds");
    if (!CGRectIntersectsRect(aRect, bounds))
        return CPMakeRange(0, 0);
    var firstRow = objj_msgSend(self, "rowAtPoint:", aRect.origin);
    if (firstRow < 0)
        firstRow = 0;
    var lastRow = objj_msgSend(self, "rowAtPoint:", { x:0.0, y:(aRect.origin.y + aRect.size.height) });
    if (lastRow < 0)
        lastRow = _numberOfRows - 1;
    return CPMakeRange(firstRow, lastRow - firstRow + 1);
}
},["CPRange","CGRect"]), new objj_method(sel_getUid("columnIndexesInRect:"), function $CPTableView__columnIndexesInRect_(self, _cmd, aRect)
{ with(self)
{
    var column = MAX(0, objj_msgSend(self, "columnAtPoint:", { x:aRect.origin.x, y:0.0 })),
        lastColumn = objj_msgSend(self, "columnAtPoint:", { x:(aRect.origin.x + aRect.size.width), y:0.0 });
    if (lastColumn === CPNotFound)
        lastColumn = (_tableColumns.length) - 1;
    if (_numberOfHiddenColumns <= 0)
        return objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(column, lastColumn - column + 1));
    var indexSet = objj_msgSend(CPIndexSet, "indexSet");
    for (; column <= lastColumn; ++column)
    {
        var tableColumn = _tableColumns[column];
        if (!objj_msgSend(tableColumn, "isHidden"))
            objj_msgSend(indexSet, "addIndex:", column);
    }
    return indexSet;
}
},["CPIndexSet","CGRect"]), new objj_method(sel_getUid("columnAtPoint:"), function $CPTableView__columnAtPoint_(self, _cmd, aPoint)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    if (!(aPoint.x >= (bounds.origin.x) && aPoint.y >= (bounds.origin.y) && aPoint.x < (bounds.origin.x + bounds.size.width) && aPoint.y < (bounds.origin.y + bounds.size.height)))
        return CPNotFound;
    if (_dirtyTableColumnRangeIndex !== CPNotFound) objj_msgSend(self, "_recalculateTableColumnRanges");;
    var x = aPoint.x,
        low = 0,
        high = _tableColumnRanges.length - 1;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            range = _tableColumnRanges[middle];
        if (x < range.location)
            high = middle - 1;
        else if (x >= CPMaxRange(range))
            low = middle + 1;
        else
        {
            var numberOfColumns = _tableColumnRanges.length;
            while (middle < numberOfColumns && objj_msgSend(_tableColumns[middle], "isHidden"))
                ++middle;
            if (middle < numberOfColumns)
                return middle;
            return CPNotFound;
        }
   }
   return CPNotFound;
}
},["CPInteger","CGPoint"]), new objj_method(sel_getUid("rowAtPoint:"), function $CPTableView__rowAtPoint_(self, _cmd, aPoint)
{ with(self)
{
    var y = aPoint.y;
    if (NO)
    {
    }
    var row = FLOOR(y / (_rowHeight + _intercellSpacing.height));
    if (row >= _numberOfRows)
        return -1;
    return row;
}
},["CPInteger","CGPoint"]), new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"), function $CPTableView__frameOfDataViewAtColumn_row_(self, _cmd, aColumn, aRow)
{ with(self)
{
    if (_dirtyTableColumnRangeIndex !== CPNotFound) objj_msgSend(self, "_recalculateTableColumnRanges");;
    var tableColumnRange = _tableColumnRanges[aColumn],
        rectOfRow = objj_msgSend(self, "rectOfRow:", aRow);
    return { origin: { x:tableColumnRange.location, y:(rectOfRow.origin.y) }, size: { width:tableColumnRange.length, height:(rectOfRow.size.height) } };
}
},["CGRect","CPInteger","CPInteger"]), new objj_method(sel_getUid("sizeLastColumnToFit"), function $CPTableView__sizeLastColumnToFit(self, _cmd)
{ with(self)
{
    var superview = objj_msgSend(self, "superview");
    if (!superview)
        return;
    var superviewSize = objj_msgSend(superview, "bounds").size;
    if (_dirtyTableColumnRangeIndex !== CPNotFound) objj_msgSend(self, "_recalculateTableColumnRanges");;
    var count = (_tableColumns.length);
    while (count-- && objj_msgSend(_tableColumns[count], "isHidden")) ;
    if (count >= 0)
        objj_msgSend(_tableColumns[count], "setWidth:", MAX(0.0, superviewSize.width - (objj_msgSend(self, "rectOfColumn:", count).origin.x)));
    objj_msgSend(self, "setNeedsLayout");
}
},["void"]), new objj_method(sel_getUid("noteNumberOfRowsChanged"), function $CPTableView__noteNumberOfRowsChanged(self, _cmd)
{ with(self)
{
    _numberOfRows = objj_msgSend(_dataSource, "numberOfRowsInTableView:", self);
    objj_msgSend(self, "tile");
}
},["void"]), new objj_method(sel_getUid("tile"), function $CPTableView__tile(self, _cmd)
{ with(self)
{
    if (_dirtyTableColumnRangeIndex !== CPNotFound) objj_msgSend(self, "_recalculateTableColumnRanges");;
    var width = _tableColumnRanges.length > 0 ? CPMaxRange(objj_msgSend(_tableColumnRanges, "lastObject")) : 0.0,
        height = (_rowHeight + _intercellSpacing.height) * _numberOfRows,
        superview = objj_msgSend(self, "superview");
    if (objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPClipView, "class")))
    {
        var superviewSize = objj_msgSend(superview, "bounds").size;
        width = MAX(superviewSize.width, width);
        height = MAX(superviewSize.height, height);
    }
    objj_msgSend(self, "setFrameSize:", { width:width, height:height });
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void"]), new objj_method(sel_getUid("setDelegate:"), function $CPTableView__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate === aDelegate)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_delegate)
    {
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPTableViewColumnDidMoveNotification, self);
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPTableViewColumnDidResizeNotification, self);
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPTableViewSelectionDidChangeNotification, self);
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPTableViewSelectionIsChangingNotification, self);
    }
    _delegate = aDelegate;
    _implementedDelegateMethods = 0;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("selectionShouldChangeInTableView:")))
        _implementedDelegateMethods |= CPTableViewDelegate_selectionShouldChangeInTableView_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:dataViewForTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_dataViewForTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:didClickTableColumn:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_didClickTableColumn_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:didDragTableColumn:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_didDragTableColumn_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:heightOfRow:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_heightOfRow_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:isGroupRow:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_isGroupRow_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:mouseDownInHeaderOfTableColumn:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_mouseDownInHeaderOfTableColumn_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:nextTypeSelectMatchFromRow:toRow:forString:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_nextTypeSelectMatchFromRow_toRow_forString_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:selectionIndexesForProposedSelection:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_selectionIndexesForProposedSelection_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldEditTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldEditTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldSelectRow:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldSelectRow_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldSelectTableColumn:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldSelectTableColumn_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldShowViewExpansionForTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldShowViewExpansionForTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldTrackView:forTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldTrackView_forTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldTypeSelectForEvent:withCurrentSearchString:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldTypeSelectForEvent_withCurrentSearchString_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:toolTipForView:rect:tableColumn:row:mouseLocation:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_toolTipForView_rect_tableColumn_row_mouseLocation_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:typeSelectStringForTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_typeSelectStringForTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:willDisplayView:forTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_willDisplayView_forTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewColumnDidMove:"), CPTableViewColumnDidMoveNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewColumnDidMove:"), CPTableViewColumnDidResizeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewSelectionDidChange:"), CPTableViewSelectionDidChangeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewSelectionIsChanging:"), CPTableViewSelectionIsChangingNotification, self);
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $CPTableView__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("_objectValueForTableColumn:row:"), function $CPTableView___objectValueForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{ with(self)
{
    var tableColumnUID = objj_msgSend(aTableColumn, "UID"),
        tableColumnObjectValues = _objectValues[tableColumnUID];
    if (!tableColumnObjectValues)
    {
        tableColumnObjectValues = [];
        _objectValues[tableColumnUID] = tableColumnObjectValues;
    }
    var objectValue = tableColumnObjectValues[aRowIndex];
    if (objectValue === undefined)
    {
        objectValue = objj_msgSend(_dataSource, "tableView:objectValueForTableColumn:row:", self, aTableColumn, aRowIndex);
        tableColumnObjectValues[aRowIndex] = objectValue;
    }
    return objectValue;
}
},["id","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("_exposedRect"), function $CPTableView___exposedRect(self, _cmd)
{ with(self)
{
    var superview = objj_msgSend(self, "superview");
    if (!objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPClipView, "class")))
        return objj_msgSend(self, "bounds");
    return objj_msgSend(self, "convertRect:fromView:", CGRectIntersection(objj_msgSend(superview, "bounds"), objj_msgSend(self, "frame")), superview);
}
},["CGRect"]), new objj_method(sel_getUid("load"), function $CPTableView__load(self, _cmd)
{ with(self)
{
    if (_reloadAllRows)
    {
        objj_msgSend(self, "_unloadDataViewsInRows:columns:", _exposedRows, _exposedColumns);
        _exposedRows = objj_msgSend(CPIndexSet, "indexSet");
        _exposedColumns = objj_msgSend(CPIndexSet, "indexSet");
        _reloadAllRows = NO;
    }
    var exposedRect = objj_msgSend(self, "_exposedRect"),
        exposedRows = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", objj_msgSend(self, "rowsInRect:", exposedRect)),
        exposedColumns = objj_msgSend(self, "columnIndexesInRect:", exposedRect),
        obscuredRows = objj_msgSend(_exposedRows, "copy"),
        obscuredColumns = objj_msgSend(_exposedColumns, "copy");
    objj_msgSend(obscuredRows, "removeIndexes:", exposedRows);
    objj_msgSend(obscuredColumns, "removeIndexes:", exposedColumns);
    var newlyExposedRows = objj_msgSend(exposedRows, "copy"),
        newlyExposedColumns = objj_msgSend(exposedColumns, "copy");
    objj_msgSend(newlyExposedRows, "removeIndexes:", _exposedRows);
    objj_msgSend(newlyExposedColumns, "removeIndexes:", _exposedColumns);
    var previouslyExposedRows = objj_msgSend(exposedRows, "copy"),
        previouslyExposedColumns = objj_msgSend(exposedColumns, "copy");
    objj_msgSend(previouslyExposedRows, "removeIndexes:", newlyExposedRows);
    objj_msgSend(previouslyExposedColumns, "removeIndexes:", newlyExposedColumns);
    objj_msgSend(self, "_unloadDataViewsInRows:columns:", previouslyExposedRows, obscuredColumns);
    objj_msgSend(self, "_unloadDataViewsInRows:columns:", obscuredRows, previouslyExposedColumns);
    objj_msgSend(self, "_unloadDataViewsInRows:columns:", obscuredRows, obscuredColumns);
    objj_msgSend(self, "_loadDataViewsInRows:columns:", previouslyExposedRows, newlyExposedColumns);
    objj_msgSend(self, "_loadDataViewsInRows:columns:", newlyExposedRows, previouslyExposedColumns);
    objj_msgSend(self, "_loadDataViewsInRows:columns:", newlyExposedRows, newlyExposedColumns);
    _exposedRows = exposedRows;
    _exposedColumns = exposedColumns;
    objj_msgSend(_tableDrawView, "setFrame:", exposedRect);
    objj_msgSend(_tableDrawView, "display");
    for (identifier in _cachedDataViews)
    {
        var dataViews = _cachedDataViews[identifier],
            count = dataViews.length;
        while (count--)
            objj_msgSend(dataViews[count], "removeFromSuperview");
    }
}
},["void"]), new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"), function $CPTableView___unloadDataViewsInRows_columns_(self, _cmd, rows, columns)
{ with(self)
{
    if (!objj_msgSend(rows, "count") || !objj_msgSend(columns, "count"))
        return;
    var rowArray = [],
        columnArray = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil);
    objj_msgSend(columns, "getIndexes:maxCount:inIndexRange:", columnArray, -1, nil);
    var columnIndex = 0,
        columnsCount = columnArray.length;
    for (; columnIndex < columnsCount; ++columnIndex)
    {
        var column = columnArray[columnIndex],
            tableColumn = _tableColumns[column],
            tableColumnUID = objj_msgSend(tableColumn, "UID");
        var rowIndex = 0,
            rowsCount = rowArray.length;
        for (; rowIndex < rowsCount; ++rowIndex)
        {
            var row = rowArray[rowIndex],
                dataView = _dataViewsForTableColumns[tableColumnUID][row];
            _dataViewsForTableColumns[tableColumnUID][row] = nil;
            objj_msgSend(self, "_enqueueReusableDataView:", dataView);
        }
    }
}
},["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_loadDataViewsInRows:columns:"), function $CPTableView___loadDataViewsInRows_columns_(self, _cmd, rows, columns)
{ with(self)
{
    if (!objj_msgSend(rows, "count") || !objj_msgSend(columns, "count"))
        return;
    var rowArray = [],
        rowRects = [],
        columnArray = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil);
    objj_msgSend(columns, "getIndexes:maxCount:inIndexRange:", columnArray, -1, nil);
    if (_dirtyTableColumnRangeIndex !== CPNotFound) objj_msgSend(self, "_recalculateTableColumnRanges");;
    var columnIndex = 0,
        columnsCount = columnArray.length;
    for (; columnIndex < columnsCount; ++columnIndex)
    {
        var column = columnArray[columnIndex],
            tableColumn = _tableColumns[column],
            tableColumnUID = objj_msgSend(tableColumn, "UID");
    if (!_dataViewsForTableColumns[tableColumnUID])
        _dataViewsForTableColumns[tableColumnUID] = [];
        var rowIndex = 0,
            rowsCount = rowArray.length;
        for (; rowIndex < rowsCount; ++rowIndex)
        {
            var row = rowArray[rowIndex],
                dataView = objj_msgSend(self, "_newDataViewForRow:tableColumn:", row, tableColumn);
            objj_msgSend(dataView, "setFrame:", objj_msgSend(self, "frameOfDataViewAtColumn:row:", column, row));
            objj_msgSend(dataView, "setObjectValue:", objj_msgSend(self, "_objectValueForTableColumn:row:", tableColumn, row));
            if (objj_msgSend(dataView, "superview") !== self)
                objj_msgSend(self, "addSubview:", dataView);
            _dataViewsForTableColumns[tableColumnUID][row] = dataView;
        }
    }
}
},["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_newDataViewForRow:tableColumn:"), function $CPTableView___newDataViewForRow_tableColumn_(self, _cmd, aRow, aTableColumn)
{ with(self)
{
    return objj_msgSend(aTableColumn, "_newDataViewForRow:", aRow);
}
},["CPView","CPInteger","CPTableColumn"]), new objj_method(sel_getUid("_enqueueReusableDataView:"), function $CPTableView___enqueueReusableDataView_(self, _cmd, aDataView)
{ with(self)
{
    var identifier = aDataView.identifier;
    if (!_cachedDataViews[identifier])
        _cachedDataViews[identifier] = [aDataView];
    else
        _cachedDataViews[identifier].push(aDataView);
}
},["void","CPView"]), new objj_method(sel_getUid("setFrameSize:"), function $CPTableView__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFrameSize:", aSize);
    if (_headerView)
        objj_msgSend(_headerView, "setFrameSize:", { width:(objj_msgSend(self, "frame").size.width), height:(objj_msgSend(_headerView, "frame").size.height) });
}
},["void","CGSize"]), new objj_method(sel_getUid("exposedClipRect"), function $CPTableView__exposedClipRect(self, _cmd)
{ with(self)
{
    var superview = objj_msgSend(self, "superview");
    if (!objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPClipView, "class")))
        return objj_msgSend(self, "bounds");
    return objj_msgSend(self, "convertRect:fromView:", CGRectIntersection(objj_msgSend(superview, "bounds"), objj_msgSend(self, "frame")), superview);
}
},["CGRect"]), new objj_method(sel_getUid("_drawRect:"), function $CPTableView___drawRect_(self, _cmd, aRect)
{ with(self)
{
    var exposedRect = objj_msgSend(self, "_exposedRect");
    objj_msgSend(self, "drawBackgroundInClipRect:", exposedRect);
    objj_msgSend(self, "highlightSelectionInClipRect:", exposedRect);
    objj_msgSend(self, "drawGridInClipRect:", exposedRect);
}
},["void","CGRect"]), new objj_method(sel_getUid("drawBackgroundInClipRect:"), function $CPTableView__drawBackgroundInClipRect_(self, _cmd, aRect)
{ with(self)
{
    if (!objj_msgSend(self, "usesAlternatingRowBackgroundColors"))
        return;
    var rowColors = objj_msgSend(self, "alternatingRowBackgroundColors"),
        colorCount = objj_msgSend(rowColors, "count");
    if (colorCount === 0)
        return;
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    if (colorCount === 1)
    {
        CGContextSetFillColor(context, rowColors[0]);
        CGContextFillRect(context, aRect);
     return;
    }
    var exposedRows = objj_msgSend(self, "rowsInRect:", aRect),
        firstRow = exposedRows.location,
        lastRow = CPMaxRange(exposedRows) - 1,
        colorIndex = MIN(exposedRows.length, colorCount),
        heightFilled = 0.0;
    while (colorIndex--)
    {
        var row = firstRow % colorCount + firstRow + colorIndex,
            fillRect = nil;
        CGContextBeginPath(context);
        for (; row <= lastRow; row += colorCount)
            CGContextAddRect(context, CGRectIntersection(aRect, fillRect = objj_msgSend(self, "rectOfRow:", row)));
        if (row - colorCount === lastRow)
            heightFilled = (fillRect.origin.y + fillRect.size.height);
        CGContextClosePath(context);
        CGContextSetFillColor(context, rowColors[colorIndex]);
        CGContextFillPath(context);
    }
    var totalHeight = (aRect.origin.y + aRect.size.height);
    if (heightFilled >= totalHeight || _rowHeight <= 0.0)
        return;
    var rowHeight = _rowHeight + _intercellSpacing.height,
        fillRect = { origin: { x:(aRect.origin.x), y:(aRect.origin.y) + heightFilled }, size: { width:(aRect.size.width), height:rowHeight } };
    for (row = lastRow + 1; heightFilled < totalHeight; ++row)
    {
        CGContextSetFillColor(context, rowColors[row % colorCount]);
        CGContextFillRect(context, fillRect);
        heightFilled += rowHeight;
        fillRect.origin.y += rowHeight;
    }
}
},["void","CGRect"]), new objj_method(sel_getUid("drawGridInClipRect:"), function $CPTableView__drawGridInClipRect_(self, _cmd, aRect)
{ with(self)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        gridStyleMask = objj_msgSend(self, "gridStyleMask");
    if (!(gridStyleMask & (CPTableViewSolidHorizontalGridLineMask | CPTableViewSolidVerticalGridLineMask)))
        return;
    CGContextBeginPath(context);
    if (gridStyleMask & CPTableViewSolidHorizontalGridLineMask)
    {
        var exposedRows = objj_msgSend(self, "rowsInRect:", aRect);
            row = exposedRows.location,
            lastRow = CPMaxRange(exposedRows) - 1,
            rowY = 0.0,
            minX = (aRect.origin.x),
            maxX = (aRect.origin.x + aRect.size.width);
        for (; row <= lastRow; ++row)
        {
            var rowRect = objj_msgSend(self, "rectOfRow:", row),
                rowY = (rowRect.origin.y + rowRect.size.height) - 0.5;
            CGContextMoveToPoint(context, minX, rowY);
            CGContextAddLineToPoint(context, maxX, rowY);
        }
        if (_rowHeight > 0.0)
        {
            var rowHeight = _rowHeight + _intercellSpacing.height,
                totalHeight = (aRect.origin.y + aRect.size.height);
            while (rowY < totalHeight)
            {
                rowY += rowHeight;
                CGContextMoveToPoint(context, minX, rowY);
                CGContextAddLineToPoint(context, maxX, rowY);
            }
        }
    }
    if (gridStyleMask & CPTableViewSolidVerticalGridLineMask)
    {
        var exposedColumnIndexes = objj_msgSend(self, "columnIndexesInRect:", aRect),
            columnsArray = [];
        objj_msgSend(exposedColumnIndexes, "getIndexes:maxCount:inIndexRange:", columnsArray, -1, nil);
        var columnArrayIndex = 0,
            columnArrayCount = columnsArray.length,
            minY = (aRect.origin.y),
            maxY = (aRect.origin.y + aRect.size.height);
        for (; columnArrayIndex < columnArrayCount; ++columnArrayIndex)
        {
            var columnRect = objj_msgSend(self, "rectOfColumn:", columnArrayIndex),
                columnX = (columnRect.origin.x + columnRect.size.width) - 0.5;
            CGContextMoveToPoint(context, columnX, minY);
            CGContextAddLineToPoint(context, columnX, maxY);
        }
    }
    CGContextClosePath(context);
    CGContextSetStrokeColor(context, _gridColor);
    CGContextStrokePath(context);
}
},["void","CGRect"]), new objj_method(sel_getUid("highlightSelectionInClipRect:"), function $CPTableView__highlightSelectionInClipRect_(self, _cmd, aRect)
{ with(self)
{
    if (objj_msgSend(self, "selectionHighlightStyle") === CPTableViewSelectionHighlightStyleSourceList)
        objj_msgSend(objj_msgSend(CPColor, "selectionColorSourceView"), "setFill");
 else
    objj_msgSend(objj_msgSend(CPColor, "selectionColor"), "setFill");
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        indexes = [],
        rectSelector = sel_getUid("rectOfRow:");
    if (objj_msgSend(_selectedRowIndexes, "count") >= 1)
    {
        var exposedRows = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", objj_msgSend(self, "rowsInRect:", aRect)),
            firstRow = objj_msgSend(exposedRows, "firstIndex"),
            exposedRange = CPMakeRange(firstRow, objj_msgSend(exposedRows, "lastIndex") - firstRow + 1);
        objj_msgSend(_selectedRowIndexes, "getIndexes:maxCount:inIndexRange:", indexes, -1, exposedRange);
    }
    else if (objj_msgSend(_selectedColumnIndexes, "count") >= 1)
    {
        rectSelector = sel_getUid("rectOfColumn:");
        var exposedColumns = objj_msgSend(self, "columnIndexesInRect:", aRect),
            firstColumn = objj_msgSend(exposedColumns, "firstIndex"),
            exposedRange = CPMakeRange(firstColumn, objj_msgSend(exposedColumns, "lastIndex") - firstColumn + 1);
        objj_msgSend(_selectedColumnIndexes, "getIndexes:maxCount:inIndexRange:", indexes, -1, exposedRange);
    }
    var count = objj_msgSend(indexes, "count");
    if (!count)
        return;
    CGContextBeginPath(context);
    while (count--)
        CGContextAddRect(context, CGRectIntersection(objj_msgSend(self, rectSelector, indexes[count]), aRect));
    CGContextClosePath(context);
    CGContextFillPath(context);
}
},["void","CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPTableView__layoutSubviews(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "load");
}
},["void"]), new objj_method(sel_getUid("viewWillMoveToSuperview:"), function $CPTableView__viewWillMoveToSuperview_(self, _cmd, aView)
{ with(self)
{
    var superview = objj_msgSend(self, "superview"),
        defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (superview)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPViewFrameDidChangeNotification, superview);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPViewBoundsDidChangeNotification, superview);
    }
    if (aView)
    {
        objj_msgSend(aView, "setPostsFrameChangedNotifications:", YES);
        objj_msgSend(aView, "setPostsBoundsChangedNotifications:", YES);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("superviewFrameChanged:"), CPViewFrameDidChangeNotification, aView);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("superviewBoundsChanged:"), CPViewBoundsDidChangeNotification, aView);
    }
}
},["void","CPView"]), new objj_method(sel_getUid("superviewBoundsChanged:"), function $CPTableView__superviewBoundsChanged_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPNotification"]), new objj_method(sel_getUid("superviewFrameChanged:"), function $CPTableView__superviewFrameChanged_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "tile");
}
},["void","CPNotification"]), new objj_method(sel_getUid("tracksMouseOutsideOfFrame"), function $CPTableView__tracksMouseOutsideOfFrame(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("startTrackingAt:"), function $CPTableView__startTrackingAt_(self, _cmd, aPoint)
{ with(self)
{
    var row = objj_msgSend(self, "rowAtPoint:", aPoint);
    if (objj_msgSend(self, "mouseDownFlags") & CPShiftKeyMask)
        _selectionAnchorRow = (ABS(objj_msgSend(_selectedRowIndexes, "firstIndex") - row) < ABS(objj_msgSend(_selectedRowIndexes, "lastIndex") - row)) ?
            objj_msgSend(_selectedRowIndexes, "firstIndex") : objj_msgSend(_selectedRowIndexes, "lastIndex");
    else
        _selectionAnchorRow = row;
    _previouslySelectedRowIndexes = nil;
    objj_msgSend(self, "_updateSelectionWithMouseAtRow:", row);
    return YES;
}
},["BOOL","CGPoint"]), new objj_method(sel_getUid("continueTracking:at:"), function $CPTableView__continueTracking_at_(self, _cmd, lastPoint, aPoint)
{ with(self)
{
    objj_msgSend(self, "_updateSelectionWithMouseAtRow:", objj_msgSend(self, "rowAtPoint:", aPoint));
    return YES;
}
},["BOOL","CGPoint","CGPoint"]), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function $CPTableView__stopTracking_at_mouseIsUp_(self, _cmd, lastPoint, aPoint, mouseIsUp)
{ with(self)
{
    if (!objj_msgSend(_previouslySelectedRowIndexes, "isEqualToIndexSet:", _selectedRowIndexes))
        objj_msgSend(self, "_noteSelectionDidChange");
}
},["void","CGPoint","CGPoint","BOOL"]), new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"), function $CPTableView___updateSelectionWithMouseAtRow_(self, _cmd, aRow)
{ with(self)
{
    if (objj_msgSend(self, "mouseDownFlags") & (CPCommandKeyMask | CPControlKeyMask | CPAlternateKeyMask))
    {
        if (objj_msgSend(_selectedRowIndexes, "containsIndex:", aRow))
        {
            newSelection = objj_msgSend(_selectedRowIndexes, "copy");
            objj_msgSend(newSelection, "removeIndex:", aRow);
        }
        else if (_allowsMultipleSelection)
        {
            newSelection = objj_msgSend(_selectedRowIndexes, "copy");
            objj_msgSend(newSelection, "addIndex:", aRow);
        }
        else
            newSelection = objj_msgSend(CPIndexSet, "indexSetWithIndex:", aRow);
    }
    else if (_allowsMultipleSelection)
        newSelection = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(MIN(aRow, _selectionAnchorRow), ABS(aRow - _selectionAnchorRow) + 1));
    else if (aRow >= 0 && aRow < _numberOfRows)
        newSelection = objj_msgSend(CPIndexSet, "indexSetWithIndex:", aRow);
    else
        newSelection = objj_msgSend(CPIndexSet, "indexSet");
    if (objj_msgSend(newSelection, "isEqualToIndexSet:", _selectedRowIndexes))
        return;
    if (_implementedDelegateMethods & CPTableViewDelegate_selectionShouldChangeInTableView_ &&
        !objj_msgSend(_delegate, "selectionShouldChangeInTableView:", self))
        return;
    if (_implementedDelegateMethods & CPTableViewDelegate_tableView_selectionIndexesForProposedSelection_)
        newSelection = objj_msgSend(_delegate, "tableView:selectionIndexesForProposedSelection:", self, newSelection);
    if (_implementedDelegateMethods & CPTableViewDelegate_tableView_shouldSelectRow_)
    {
        var indexArray = [];
        objj_msgSend(newSelection, "getIndexes:maxCount:inIndexRange:", indexArray, -1, nil);
        var indexCount = indexArray.length;
        while (indexCount--)
        {
            var index = indexArray[indexCount];
            if (!objj_msgSend(_delegate, "tableView:shouldSelectRow:", self, index))
                objj_msgSend(newSelection, "removeIndex:", index);
        }
    }
    if (!_allowsEmptySelection && objj_msgSend(newSelection, "count") === 0)
        return;
    if (objj_msgSend(newSelection, "isEqualToIndexSet:", _selectedRowIndexes))
        return;
    if (!_previouslySelectedRowIndexes)
        _previouslySelectedRowIndexes = objj_msgSend(_selectedRowIndexes, "copy");
    objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", newSelection, NO);
    objj_msgSend(self, "_noteSelectionIsChanging");
}
},["void","CPInteger"]), new objj_method(sel_getUid("_noteSelectionIsChanging"), function $CPTableView___noteSelectionIsChanging(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewSelectionIsChangingNotification, self, nil);
}
},["void"]), new objj_method(sel_getUid("_noteSelectionDidChange"), function $CPTableView___noteSelectionDidChange(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewSelectionDidChangeNotification, self, nil);
}
},["void"])]);
}
var CPTableViewDataSourceKey = "CPTableViewDataSourceKey",
    CPTableViewDelegateKey = "CPTableViewDelegateKey",
    CPTableViewHeaderViewKey = "CPTableViewHeaderViewKey",
    CPTableViewTableColumnsKey = "CPTableViewTableColumnsKey",
    CPTableViewRowHeightKey = "CPTableViewRowHeightKey",
    CPTableViewIntercellSpacingKey = "CPTableViewIntercellSpacingKey",
    CPTableViewMultipleSelectionKey = "CPTableViewMultipleSelectionKey",
    CPTableViewEmptySelectionKey = "CPTableViewEmptySelectionKey";
{
var the_class = objj_getClass("CPTableView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTableView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTableView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _allowsColumnReordering = YES;
        _allowsColumnResizing = YES;
        _allowsMultipleSelection = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableViewMultipleSelectionKey);
        _allowsEmptySelection = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableViewEmptySelectionKey);
        _allowsColumnSelection = NO;
        _tableViewFlags = 0;
        _selectionHighlightMask = CPTableViewSelectionHighlightStyleRegular;
        objj_msgSend(self, "setUsesAlternatingRowBackgroundColors:", NO);
        objj_msgSend(self, "setAlternatingRowBackgroundColors:", [objj_msgSend(CPColor, "whiteColor"), objj_msgSend(CPColor, "colorWithHexString:", "e4e7ff")]);
        _tableColumns = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewTableColumnsKey);
        objj_msgSend(_tableColumns, "makeObjectsPerformSelector:withObject:", sel_getUid("setTableView:"), self);
        _tableColumnRanges = [];
        _dirtyTableColumnRangeIndex = 0;
        _numberOfHiddenColumns = 0;
        _objectValues = { };
        _dataViewsForTableColumns = { };
        _dataViews= [];
        _numberOfRows = 0;
        _exposedRows = objj_msgSend(CPIndexSet, "indexSet");
        _exposedColumns = objj_msgSend(CPIndexSet, "indexSet");
        _cachedDataViews = { };
        _rowHeight = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableViewRowHeightKey);
        _intercellSpacing = objj_msgSend(aCoder, "decodeSizeForKey:", CPTableViewIntercellSpacingKey);
        objj_msgSend(self, "setGridColor:", objj_msgSend(CPColor, "grayColor"));
        objj_msgSend(self, "setGridStyleMask:", CPTableViewGridNone);
        _headerView = objj_msgSend(objj_msgSend(CPTableHeaderView, "alloc"), "initWithFrame:", CGRectMake(0, 0, objj_msgSend(self, "bounds").size.width, _rowHeight));
        objj_msgSend(_headerView, "setTableView:", self);
        _cornerView = objj_msgSend(objj_msgSend(_CPCornerView, "alloc"), "initWithFrame:", CGRectMake(0, 0, objj_msgSend(CPScroller, "scrollerWidth"), CGRectGetHeight(objj_msgSend(_headerView, "frame"))));
        _selectedColumnIndexes = objj_msgSend(CPIndexSet, "indexSet");
        _selectedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
        objj_msgSend(self, "setDataSource:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewDataSourceKey));
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewDelegateKey));
        _tableDrawView = objj_msgSend(objj_msgSend(_CPTableDrawView, "alloc"), "initWithTableView:", self);
        objj_msgSend(_tableDrawView, "setBackgroundColor:", objj_msgSend(CPColor, "clearColor"));
        objj_msgSend(self, "addSubview:", _tableDrawView);
        objj_msgSend(self, "viewWillMoveToSuperview:", objj_msgSend(self, "superview"));
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTableView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _dataSource, CPTableViewDataSourceKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _delegate, CPTableViewDelegateKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _rowHeight, CPTableViewRowHeightKey);
    objj_msgSend(aCoder, "encodeSize:forKey:", _intercellSpacing, CPTableViewIntercellSpacingKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _allowsMultipleSelection, CPTableViewMultipleSelectionKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _allowsEmptySelection, CPTableViewEmptySelectionKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _tableColumns, CPTableViewTableColumnsKey);
}
},["void","CPCoder"])]);
}
{
var the_class = objj_getClass("CPColor")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPColor\""));
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("selectionColor"), function $CPColor__selectionColor(self, _cmd)
{ with(self)
{
 return objj_msgSend(CPColor, "colorWithHexString:", "5f83b9");
}
},["CPColor"]), new objj_method(sel_getUid("selectionColorSourceView"), function $CPColor__selectionColorSourceView(self, _cmd)
{ with(self)
{
 return objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initByReferencingFile:size:", "Resources/tableviewselection.png", CGSizeMake(6,22)));
}
},["CPColor"])]);
}

