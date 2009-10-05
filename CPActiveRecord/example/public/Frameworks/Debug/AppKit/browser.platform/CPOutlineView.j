i;15;CPTableColumn.ji;13;CPTableView.jc;30283;
CPOutlineViewColumnDidMoveNotification = "CPOutlineViewColumnDidMoveNotification";
CPOutlineViewColumnDidResizeNotification = "CPOutlineViewColumnDidResizeNotification";
CPOutlineViewItemDidCollapseNotification = "CPOutlineViewItemDidCollapseNotification";
CPOutlineViewItemDidExpandNotification = "CPOutlineViewItemDidExpandNotification";
CPOutlineViewItemWillCollapseNotification = "CPOutlineViewItemWillCollapseNotification";
CPOutlineViewItemWillExpandNotification = "CPOutlineViewItemWillExpandNotification";
CPOutlineViewSelectionDidChangeNotification = "CPOutlineViewSelectionDidChangeNotification";
CPOutlineViewSelectionIsChangingNotification = "CPOutlineViewSelectionIsChangingNotification";
var CPOutlineViewDataSource_outlineView_setObjectValue_forTableColumn_byItem_ = 1 << 1,
    CPOutlineViewDataSource_outlineView_shouldDeferDisplayingChildrenOfItem_ = 1 << 2,
    CPOutlineViewDataSource_outlineView_acceptDrop_item_childIndex_ = 1 << 3,
    CPOutlineViewDataSource_outlineView_validateDrop_proposedItem_proposedChildIndex_ = 1 << 4,
    CPOutlineViewDataSource_outlineView_validateDrop_proposedRow_proposedDropOperation_ = 1 << 5,
    CPOutlineViewDataSource_outlineView_namesOfPromisedFilesDroppedAtDestination_forDraggedItems_ = 1 << 6,
    CPOutlineViewDataSource_outlineView_itemForPersistentObject_ = 1 << 7,
    CPOutlineViewDataSource_outlineView_persistentObjectForItem_ = 1 << 8,
    CPOutlineViewDataSource_outlineView_writeItems_toPasteboard_ = 1 << 9,
    CPOutlineViewDataSource_outlineView_sortDescriptorsDidChange_ = 1 << 10;
{var the_class = objj_allocateClassPair(CPTableView, "CPOutlineView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_outlineViewDataSource"), new objj_ivar("_outlineViewDelegate"), new objj_ivar("_outlineTableColumn"), new objj_ivar("_indentationPerLevel"), new objj_ivar("_indentationMarkerFollowsDataView"), new objj_ivar("_implementedOutlineViewDataSourceMethods"), new objj_ivar("_rootItemInfo"), new objj_ivar("_itemsForRows"), new objj_ivar("_itemInfosForItems"), new objj_ivar("_disclosureControlPrototype"), new objj_ivar("_disclosureControlsForRows"), new objj_ivar("_disclosureControlData"), new objj_ivar("_disclosureControlQueue")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPOutlineView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _rootItemInfo = { isExpanded:YES, isExpandable:NO, level:-1, row:-1, children:[], weight:0 };
        _itemsForRows = [];
        _itemInfosForItems = { };
        _disclosureControlsForRows = [];
        objj_msgSend(self, "setIndentationPerLevel:", 16.0);
        objj_msgSend(self, "setIndentationMarkerFollowsDataView:", YES);
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView") }, "setDataSource:", objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDataSource, "alloc"), "initWithOutlineView:", self));
        objj_msgSend(self, "setDisclosureControlPrototype:", objj_msgSend(objj_msgSend(CPDisclosureButton, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 10.0, 10.0)));
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setDataSource:"), function $CPOutlineView__setDataSource_(self, _cmd, aDataSource)
{ with(self)
{
    if (_outlineViewDataSource === aDataSource)
        return;
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:child:ofItem:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:child:ofItem:'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:isItemExpandable:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:isItemExpandable:'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:numberOfChildrenOfItem:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:numberOfChildrenOfItem:'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:objectValueForTableColumn:byItem:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:objectValueForTableColumn:byItem:'");
    _outlineViewDataSource = aDataSource;
    _implementedOutlineViewDataSourceMethods = 0;
    if (objj_msgSend(_outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:setObjectValue:forTableColumn:byItem:")))
        _implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_setObjectValue_forTableColumn_byItem_;
    if (objj_msgSend(_outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:shouldDeferDisplayingChildrenOfItem:")))
        _implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_shouldDeferDisplayingChildrenOfItem_;
    if (objj_msgSend(_outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:acceptDrop:item:childIndex:")))
        _implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_acceptDrop_item_childIndex_;
    if (objj_msgSend(_outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:validateDrop:proposedItem:proposedChildIndex:")))
        _implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_validateDrop_proposedItem_proposedChildIndex_;
    if (objj_msgSend(_outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:validateDrop:proposedRow:proposedDropOperation:")))
        _implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_validateDrop_proposedRow_proposedDropOperation_;
    if (objj_msgSend(_outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:namesOfPromisedFilesDroppedAtDestination:forDraggedItems:")))
        _implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_namesOfPromisedFilesDroppedAtDestination_forDraggedItems_;
    if (objj_msgSend(_outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:itemForPersistentObject:")))
        _implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_itemForPersistentObject_;
    if (objj_msgSend(_outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:persistentObjectForItem:")))
        _implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_persistentObjectForItem_;
    if (objj_msgSend(_outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:writeItems:toPasteboard:")))
        _implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_writeItems_toPasteboard_;
    if (objj_msgSend(_outlineViewDataSource, "respondsToSelector:", sel_getUid("outlineView:sortDescriptorsDidChange:")))
        _implementedOutlineViewDataSourceMethods |= CPOutlineViewDataSource_outlineView_sortDescriptorsDidChange_;
    objj_msgSend(self, "reloadData");
}
},["void","id"]), new objj_method(sel_getUid("dataSource"), function $CPOutlineView__dataSource(self, _cmd)
{ with(self)
{
    return _outlineViewDataSource;
}
},["id"]), new objj_method(sel_getUid("isExpandable:"), function $CPOutlineView__isExpandable_(self, _cmd, anItem)
{ with(self)
{
    if (!anItem)
        return YES;
    var itemInfo = _itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return NO;
    return itemInfo.isExpandable;
}
},["BOOL","id"]), new objj_method(sel_getUid("isItemExpanded:"), function $CPOutlineView__isItemExpanded_(self, _cmd, anItem)
{ with(self)
{
    if (!anItem)
        return YES;
    var itemInfo = _itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return NO;
    return itemInfo.isExpanded;
}
},["void","id"]), new objj_method(sel_getUid("expandItem:"), function $CPOutlineView__expandItem_(self, _cmd, anItem)
{ with(self)
{
    if (!anItem)
        return;
    var itemInfo = _itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return;
    if (itemInfo.isExpanded)
        return;
    itemInfo.isExpanded = YES;
    objj_msgSend(self, "reloadItem:reloadChildren:", anItem, YES);
}
},["void","id"]), new objj_method(sel_getUid("collapseItem:"), function $CPOutlineView__collapseItem_(self, _cmd, anItem)
{ with(self)
{
    if (!anItem)
        return;
    var itemInfo = _itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return;
    if (!itemInfo.isExpanded)
        return;
    itemInfo.isExpanded = NO;
    objj_msgSend(self, "reloadItem:reloadChildren:", anItem, YES);
}
},["void","id"]), new objj_method(sel_getUid("reloadItem:"), function $CPOutlineView__reloadItem_(self, _cmd, anItem)
{ with(self)
{
    objj_msgSend(self, "reloadItem:reloadChildren:", anItem, NO);
}
},["void","id"]), new objj_method(sel_getUid("reloadItem:reloadChildren:"), function $CPOutlineView__reloadItem_reloadChildren_(self, _cmd, anItem, shouldReloadChildren)
{ with(self)
{
    if (!!shouldReloadChildren || !anItem)
        _loadItemInfoForItem(self, anItem);
    else
        _reloadItem(self, anItem);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView") }, "reloadData");
}
},["void","id","BOOL"]), new objj_method(sel_getUid("itemAtRow:"), function $CPOutlineView__itemAtRow_(self, _cmd, aRow)
{ with(self)
{
    return _itemsForRows[aRow] || nil;
}
},["id","CPInteger"]), new objj_method(sel_getUid("rowForItem:"), function $CPOutlineView__rowForItem_(self, _cmd, aItem)
{ with(self)
{
    if (!anItem)
        return _rootItemInfo.row;
    var itemInfo = _itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return CPNotFound;
    return itemInfo.row;
}
},["CPInteger","id"]), new objj_method(sel_getUid("setOutlineTableColumn:"), function $CPOutlineView__setOutlineTableColumn_(self, _cmd, aTableColumn)
{ with(self)
{
    if (_outlineTableColumn === aTableColumn)
        return;
    _outlineTableColumn = aTableColumn;
    objj_msgSend(self, "reloadData");
}
},["void","CPTableColumn"]), new objj_method(sel_getUid("outlineTableColumn"), function $CPOutlineView__outlineTableColumn(self, _cmd)
{ with(self)
{
    return _outlineTableColumn;
}
},["CPTableColumn"]), new objj_method(sel_getUid("levelForItem:"), function $CPOutlineView__levelForItem_(self, _cmd, anItem)
{ with(self)
{
    if (!anItem)
        return _rootItemInfo.level;
    var itemInfo = _itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return CPNotFound;
    return itemInfo.level;
}
},["CPInteger","id"]), new objj_method(sel_getUid("levelForRow:"), function $CPOutlineView__levelForRow_(self, _cmd, aRow)
{ with(self)
{
    return objj_msgSend(self, "levelForItem:", objj_msgSend(self, "itemAtRow:", aRow));
}
},["CPInteger","CPInteger"]), new objj_method(sel_getUid("setIndentationPerLevel:"), function $CPOutlineView__setIndentationPerLevel_(self, _cmd, anIndentationWidth)
{ with(self)
{
    if (_indentationPerLevel === anIndentationWidth)
        return;
    _indentationPerLevel = anIndentationWidth;
    objj_msgSend(self, "reloadData");
}
},["void","float"]), new objj_method(sel_getUid("indentationPerLevel"), function $CPOutlineView__indentationPerLevel(self, _cmd)
{ with(self)
{
    return _indentationPerLevel;
}
},["float"]), new objj_method(sel_getUid("setIndentationMarkerFollowsDataView:"), function $CPOutlineView__setIndentationMarkerFollowsDataView_(self, _cmd, indentationMarkerShouldFollowDataView)
{ with(self)
{
    if (_indentationMarkerFollowsDataView === indentationMarkerShouldFollowDataView)
        return;
    _indentationMarkerFollowsDataView = indentationMarkerShouldFollowDataView;
    objj_msgSend(self, "reloadData");
}
},["void","BOOL"]), new objj_method(sel_getUid("indentationMarkerFollowsDataView"), function $CPOutlineView__indentationMarkerFollowsDataView(self, _cmd)
{ with(self)
{
    return _indentationMarkerFollowsDataView;
}
},["BOOL"]), new objj_method(sel_getUid("parentForItem:"), function $CPOutlineView__parentForItem_(self, _cmd, anItem)
{ with(self)
{
    if (!anItem)
        return nil;
    var itemInfo = _itemInfosForItems[objj_msgSend(anItem, "UID")];
    if (!itemInfo)
        return nil;
    return itemInfo.parent;
}
},["id","id"]), new objj_method(sel_getUid("frameOfOutlineDataViewAtColumn:row:"), function $CPOutlineView__frameOfOutlineDataViewAtColumn_row_(self, _cmd, aColumn, aRow)
{ with(self)
{
    var frame = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView") }, "frameOfDataViewAtColumn:row:", aColumn, aRow),
        indentationWidth = (objj_msgSend(self, "levelForRow:", aRow) + 1) * objj_msgSend(self, "indentationPerLevel");
    frame.origin.x += indentationWidth;
    frame.size.width -= indentationWidth;
    return frame;
}
},["CGRect","CPInteger","CPInteger"]), new objj_method(sel_getUid("setDelegate:"), function $CPOutlineView__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_outlineViewDelegate === aDelegate)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_outlineViewDelegate)
    {
        if (objj_msgSend(_outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewColumnDidMove:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _outlineViewDelegate, CPOutlineViewColumnDidMoveNotification, self);
        if (objj_msgSend(_outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewColumnDidResize:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _outlineViewDelegate, CPOutlineViewColumnDidResizeNotification, self);
        if (objj_msgSend(_outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewSelectionDidChange:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _outlineViewDelegate, CPOutlineViewSelectionDidChangeNotification, self);
        if (objj_msgSend(_outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewSelectionIsChanging:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _outlineViewDelegate, CPOutlineViewSelectionIsChangingNotification, self);
    }
    _outlineViewDelegate = aDelegate;
    if (objj_msgSend(_outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewColumnDidMove:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _outlineViewDelegate, sel_getUid("outlineViewColumnDidMove:"), CPOutlineViewColumnDidMoveNotification, self);
    if (objj_msgSend(_outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewColumnDidResize:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _outlineViewDelegate, sel_getUid("outlineViewColumnDidMove:"), CPOutlineViewColumnDidResizeNotification, self);
    if (objj_msgSend(_outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewSelectionDidChange:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _outlineViewDelegate, sel_getUid("outlineViewSelectionDidChange:"), CPOutlineViewSelectionDidChangeNotification, self);
    if (objj_msgSend(_outlineViewDelegate, "respondsToSelector:", sel_getUid("outlineViewSelectionIsChanging:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _outlineViewDelegate, sel_getUid("outlineViewSelectionIsChanging:"), CPOutlineViewSelectionIsChangingNotification, self);
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $CPOutlineView__delegate(self, _cmd)
{ with(self)
{
    return _outlineViewDelegate;
}
},["id"]), new objj_method(sel_getUid("setDisclosureControlPrototype:"), function $CPOutlineView__setDisclosureControlPrototype_(self, _cmd, aControl)
{ with(self)
{
    _disclosureControlPrototype = aControl;
    _disclosureControlData = nil;
    _disclosureControlQueue = [];
    objj_msgSend(self, "reloadData");
}
},["void","CPControl"]), new objj_method(sel_getUid("reloadData"), function $CPOutlineView__reloadData(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "reloadItem:reloadChildren:", nil, YES);
}
},["void"]), new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"), function $CPOutlineView__frameOfDataViewAtColumn_row_(self, _cmd, aColumn, aRow)
{ with(self)
{
    var tableColumn = objj_msgSend(self, "tableColumns")[aColumn];
    if (tableColumn === _outlineTableColumn)
        return objj_msgSend(self, "frameOfOutlineDataViewAtColumn:row:", aColumn, aRow);
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView") }, "frameOfDataViewAtColumn:row:", aColumn, aRow);
}
},["CGRect","CPInteger","CPInteger"]), new objj_method(sel_getUid("_loadDataViewsInRows:columns:"), function $CPOutlineView___loadDataViewsInRows_columns_(self, _cmd, rows, columns)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView") }, "_loadDataViewsInRows:columns:", rows, columns);
    var outlineColumn = objj_msgSend(objj_msgSend(self, "tableColumns"), "indexOfObjectIdenticalTo:", objj_msgSend(self, "outlineTableColumn"));
    if (!objj_msgSend(columns, "containsIndex:", outlineColumn))
        return;
    var rowArray = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil);
    var rowIndex = 0,
        rowsCount = rowArray.length;
    for (; rowIndex < rowsCount; ++rowIndex)
    {
        var row = rowArray[rowIndex],
            item = _itemsForRows[row],
            isExpandable = objj_msgSend(self, "isExpandable:", item);
       if (!isExpandable)
            continue;
        var control = objj_msgSend(self, "_dequeueDisclosureControl"),
            frame = objj_msgSend(control, "frame"),
            dataViewFrame = objj_msgSend(self, "frameOfDataViewAtColumn:row:", outlineColumn, row);
        frame.origin.x = _indentationMarkerFollowsDataView ? (dataViewFrame.origin.x) - (frame.size.width) : 0.0;
        frame.origin.y = (dataViewFrame.origin.y);
        frame.size.height = (dataViewFrame.size.height);
        _disclosureControlsForRows[row] = control;
        objj_msgSend(control, "setState:", objj_msgSend(self, "isItemExpanded:", item) ? CPOnState : CPOffState);
        objj_msgSend(control, "setFrame:", frame);
        objj_msgSend(self, "addSubview:", control);
    }
}
},["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"), function $CPOutlineView___unloadDataViewsInRows_columns_(self, _cmd, rows, columns)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView") }, "_unloadDataViewsInRows:columns:", rows, columns);
    var outlineColumn = objj_msgSend(objj_msgSend(self, "tableColumns"), "indexOfObjectIdenticalTo:", objj_msgSend(self, "outlineTableColumn"));
    if (!objj_msgSend(columns, "containsIndex:", outlineColumn))
        return;
    var rowArray = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil);
    var rowIndex = 0,
        rowsCount = rowArray.length;
    for (; rowIndex < rowsCount; ++rowIndex)
    {
        var row = rowArray[rowIndex],
            control = _disclosureControlsForRows[row];
        if (!control)
            continue;
        objj_msgSend(control, "removeFromSuperview");
        objj_msgSend(self, "_enqueueDisclosureControl:", control);
        _disclosureControlsForRows[row] = nil;
    }
}
},["void","CPIndexSet","CPIndexSet"]), new objj_method(sel_getUid("_toggleFromDisclosureControl:"), function $CPOutlineView___toggleFromDisclosureControl_(self, _cmd, aControl)
{ with(self)
{
    var controlFrame = objj_msgSend(aControl, "frame"),
        item = objj_msgSend(self, "itemAtRow:", objj_msgSend(self, "rowAtPoint:", { x:(controlFrame.origin.x), y:(controlFrame.origin.y + (controlFrame.size.height) / 2.0) }));
    if (objj_msgSend(self, "isItemExpanded:", item))
        objj_msgSend(self, "collapseItem:", item);
    else
        objj_msgSend(self, "expandItem:", item);
}
},["void","CPControl"]), new objj_method(sel_getUid("_enqueueDisclosureControl:"), function $CPOutlineView___enqueueDisclosureControl_(self, _cmd, aControl)
{ with(self)
{
    _disclosureControlQueue.push(aControl);
}
},["void","CPControl"]), new objj_method(sel_getUid("_dequeueDisclosureControl"), function $CPOutlineView___dequeueDisclosureControl(self, _cmd)
{ with(self)
{
    if (_disclosureControlQueue.length)
        return _disclosureControlQueue.pop();
    if (!_disclosureControlData)
        if (!_disclosureControlPrototype)
            return nil;
        else
            _disclosureControlData = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", _disclosureControlPrototype);
    var disclosureControl = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", _disclosureControlData);
    objj_msgSend(disclosureControl, "setTarget:", self);
    objj_msgSend(disclosureControl, "setAction:", sel_getUid("_toggleFromDisclosureControl:"));
    return disclosureControl;
}
},["CPControl"]), new objj_method(sel_getUid("_noteSelectionIsChanging"), function $CPOutlineView___noteSelectionIsChanging(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPOutlineViewSelectionIsChangingNotification, self, nil);
}
},["void"]), new objj_method(sel_getUid("_noteSelectionDidChange"), function $CPOutlineView___noteSelectionDidChange(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPOutlineViewSelectionDidChangeNotification, self, nil);
}
},["void"])]);
}
var _reloadItem = function( anOutlineView, anItem)
{
    if (!anItem)
        return;
    var itemInfosForItems = anOutlineView._itemInfosForItems,
        dataSource = anOutlineView._outlineViewDataSource,
        itemUID = objj_msgSend(anItem, "UID"),
        itemInfo = itemInfosForItems[itemUID];
    if (!itemInfo)
        return [];
    var parent = itemInfo.parent,
        parentItemInfo = parent ? itemInfosForItems[objj_msgSend(parent, "UID")] : anOutlineView._rootItemInfo,
        parentChildren = parentItemInfo.children,
        index = objj_msgSend(parentChildren, "indexOfObjectIdenticalTo:", anItem),
        newItem = objj_msgSend(dataSource, "outlineView:child:ofItem:", anOutlineView, index, parent);
    if (anItem !== newItem)
    {
        itemInfosForItems[objj_msgSend(anItem, "UID")] = nil;
        itemInfosForItems[objj_msgSend(newItem, "UID")] = itemInfo;
        parentChildren[index] = newItem;
        anOutlineView._itemsForRows[itemInfo.row] = newItem;
    }
    itemInfo.isExpandable = objj_msgSend(dataSource, "outlineView:isItemExpandable:", anOutlineView, newItem);
    itemInfo.isExpanded = itemInfo.isExpandable && itemInfo.isExpanded;
}
var _loadItemInfoForItem = function( anOutlineView, anItem, isIntermediate)
{
    var itemInfosForItems = anOutlineView._itemInfosForItems,
        dataSource = anOutlineView._outlineViewDataSource;
    if (!anItem)
        var itemInfo = anOutlineView._rootItemInfo;
    else
    {
        var itemUID = objj_msgSend(anItem, "UID"),
            itemInfo = itemInfosForItems[itemUID];
        if (!itemInfo)
            return [];
        itemInfo.isExpandable = objj_msgSend(dataSource, "outlineView:isItemExpandable:", anOutlineView, anItem);
        if (!itemInfo.isExpandable && itemInfo.isExpanded)
        {
            itemInfo.isExpanded = NO;
            itemInfo.children = [];
        }
    }
    var weight = itemInfo.weight,
        descendants = anItem ? [anItem] : [];
    if (itemInfo.isExpanded && (!(anOutlineView._implementedOutlineViewDataSourceMethods & CPOutlineViewDataSource_outlineView_shouldDeferDisplayingChildrenOfItem_) ||
        !objj_msgSend(dataSource, "outlineView:shouldDeferDisplayingChildrenOfItem:", anOutlineView, anItem)))
    {
        var index = 0,
            count = objj_msgSend(dataSource, "outlineView:numberOfChildrenOfItem:", anOutlineView, anItem),
            level = itemInfo.level + 1;
        itemInfo.children = [];
        for (; index < count; ++index)
        {
            var childItem = objj_msgSend(dataSource, "outlineView:child:ofItem:", anOutlineView, index, anItem),
                childItemInfo = itemInfosForItems[objj_msgSend(childItem, "UID")];
            if (!childItemInfo)
            {
                childItemInfo = { isExpanded:NO, isExpandable:NO, children:[], weight:1 };
                itemInfosForItems[objj_msgSend(childItem, "UID")] = childItemInfo;
            }
            itemInfo.children[index] = childItem;
            var childDescendants = _loadItemInfoForItem(anOutlineView, childItem, YES);
            childItemInfo.parent = anItem;
            childItemInfo.level = level;
            descendants = descendants.concat(childDescendants);
        }
    }
    itemInfo.weight = descendants.length;
    if (!isIntermediate)
    {
        var index = MAX(itemInfo.row, 0),
            itemsForRows = anOutlineView._itemsForRows;
        descendants.unshift(index, weight);
        itemsForRows.splice.apply(itemsForRows, descendants);
        var count = itemsForRows.length;
        for (; index < count; ++index)
            itemInfosForItems[objj_msgSend(itemsForRows[index], "UID")].row = index;
        var deltaWeight = itemInfo.weight - weight;
        if (deltaWeight !== 0)
        {
            var parent = itemInfo.parent;
            while (parent)
            {
                var parentItemInfo = itemInfosForItems[objj_msgSend(parent, "UID")];
                parentItemInfo.weight += deltaWeight;
                parent = parentItemInfo.parent;
            }
            if (anItem)
                anOutlineView._rootItemInfo.weight += deltaWeight;
        }
    }
    return descendants;
}
{var the_class = objj_allocateClassPair(CPObject, "_CPOutlineViewTableViewDataSource"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_outlineView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithOutlineView:"), function $_CPOutlineViewTableViewDataSource__initWithOutlineView_(self, _cmd, anOutlineView)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _outlineView = anOutlineView;
    return self;
}
},["id","CPOutlineView"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $_CPOutlineViewTableViewDataSource__numberOfRowsInTableView_(self, _cmd, anOutlineView)
{ with(self)
{
    return _outlineView._itemsForRows.length;
}
},["CPInteger","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $_CPOutlineViewTableViewDataSource__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, aTableColumn, aRow)
{ with(self)
{
    return objj_msgSend(_outlineView._outlineViewDataSource, "outlineView:objectValueForTableColumn:byItem:", _outlineView, aTableColumn, _outlineView._itemsForRows[aRow]);
}
},["id","CPTableView","CPTableColumn","CPInteger"])]);
}
{var the_class = objj_allocateClassPair(CPObject, "_CPOutlineViewTableViewDelegate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_outlineView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithOutlineView:"), function $_CPOutlineViewTableViewDelegate__initWithOutlineView_(self, _cmd, anOutlineView)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _outlineView = anOutlineView;
    return self;
}
},["id","CPOutlineView"])]);
}
{var the_class = objj_allocateClassPair(CPButton, "CPDisclosureButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_angle")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPDisclosureButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "initWithFrame:", aFrame);
    if (self)
        objj_msgSend(self, "setBordered:", NO);
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setState:"), function $CPDisclosureButton__setState_(self, _cmd, aState)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "setState:", aState);
    if (objj_msgSend(self, "state") === CPOnState)
        _angle = 0.0;
    else
        _angle = -PI_2;
}
},["void","CPState"]), new objj_method(sel_getUid("drawRect:"), function $CPDisclosureButton__drawRect_(self, _cmd, aRect)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextBeginPath(context);
    CGContextTranslateCTM(context, (bounds.size.width) / 2.0, (bounds.size.height) / 2.0);
    CGContextRotateCTM(context, _angle);
    CGContextTranslateCTM(context, -(bounds.size.width) / 2.0, -(bounds.size.height) / 2.0);
    CGContextTranslateCTM(context, FLOOR(((bounds.size.width) - 9.0) / 2.0), FLOOR(((bounds.size.height) - 8.0) / 2.0));
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 9.0, 0.0);
    CGContextAddLineToPoint(context, 4.5, 8.0);
    CGContextAddLineToPoint(context, 0.0, 0.0);
    CGContextClosePath(context);
    CGContextSetFillColor(context, (objj_msgSend(self, "themeState") & CPThemeState("highlighted")) ? objj_msgSend(CPColor, "blackColor") : objj_msgSend(CPColor, "grayColor"));
    CGContextFillPath(context);
}
},["void","CGRect"])]);
}

