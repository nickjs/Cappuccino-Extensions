I;25;Foundation/CPDictionary.jI;21;Foundation/CPObject.jI;29;Foundation/CPSortDescriptor.jI;21;Foundation/CPString.ji;19;CPTableHeaderView.jc;12185;
CPTableColumnNoResizing = 0;
CPTableColumnAutoresizingMask = 1;
CPTableColumnUserResizingMask = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPTableColumn"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tableView"), new objj_ivar("_headerView"), new objj_ivar("_dataView"), new objj_ivar("_dataViewData"), new objj_ivar("_width"), new objj_ivar("_minWidth"), new objj_ivar("_maxWidth"), new objj_ivar("_identifier"), new objj_ivar("_isEditable"), new objj_ivar("_sortDescriptorPrototype"), new objj_ivar("_isHidden"), new objj_ivar("_headerToolTip")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithIdentifier:"), function $CPTableColumn__initWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _dataViewData = { };
        _width = 100.0;
        _minWidth = 10.0;
        _maxWidth = 1000000.0;
        objj_msgSend(self, "setIdentifier:", anIdentifier);
        objj_msgSend(self, "setHeaderView:", objj_msgSend(CPTextField, "new"));
        objj_msgSend(self, "setDataView:", objj_msgSend(CPTextField, "new"));
    }
    return self;
}
},["id","id"]), new objj_method(sel_getUid("setTableView:"), function $CPTableColumn__setTableView_(self, _cmd, aTableView)
{ with(self)
{
    _tableView = aTableView;
}
},["void","CPTableView"]), new objj_method(sel_getUid("tableView"), function $CPTableColumn__tableView(self, _cmd)
{ with(self)
{
    return _tableView;
}
},["CPTableView"]), new objj_method(sel_getUid("setWidth:"), function $CPTableColumn__setWidth_(self, _cmd, aWidth)
{ with(self)
{
    aWidth = +aWidth;
    if (_width === aWidth)
        return;
    var newWidth = MIN(MAX(aWidth, objj_msgSend(self, "minWidth")), objj_msgSend(self, "maxWidth"));
    if (_width === newWidth)
        return;
    var oldWidth = _width;
    _width = newWidth;
    var tableView = objj_msgSend(self, "tableView");
    if (tableView)
    {
        var index = objj_msgSend(objj_msgSend(tableView, "tableColumns"), "indexOfObjectIdenticalTo:", self);
        tableView._reloadAllRows = YES;
        tableView._dirtyTableColumnRangeIndex = tableView._dirtyTableColumnRangeIndex < 0 ? index : MIN(index, tableView._dirtyTableColumnRangeIndex);
        objj_msgSend(tableView, "tile");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewColumnDidResizeNotification, tableView, objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [self, oldWidth], ["CPTableColumn", "CPOldWidth"]));
    }
}
},["void","float"]), new objj_method(sel_getUid("width"), function $CPTableColumn__width(self, _cmd)
{ with(self)
{
    return _width;
}
},["float"]), new objj_method(sel_getUid("setMinWidth:"), function $CPTableColumn__setMinWidth_(self, _cmd, aMinWidth)
{ with(self)
{
    aMinWidth = +aMinWidth;
    if (_minWidth === aMinWidth)
        return;
    _minWidth = aMinWidth;
    var width = objj_msgSend(self, "width"),
        newWidth = MAX(width, objj_msgSend(self, "minWidth"));
    if (width !== newWidth)
        objj_msgSend(self, "setWidth:", newWidth);
}
},["void","float"]), new objj_method(sel_getUid("minWidth"), function $CPTableColumn__minWidth(self, _cmd)
{ with(self)
{
    return _minWidth;
}
},["float"]), new objj_method(sel_getUid("setMaxWidth:"), function $CPTableColumn__setMaxWidth_(self, _cmd, aMaxWidth)
{ with(self)
{
    aMaxWidth = +aMaxWidth;
    if (_maxWidth === aMaxWidth)
        return;
    _maxWidth = aMaxWidth;
    var width = objj_msgSend(self, "width"),
        newWidth = MAX(width, objj_msgSend(self, "maxWidth"));
    if (width !== newWidth)
        objj_msgSend(self, "setWidth:", newWidth);
}
},["void","float"]), new objj_method(sel_getUid("maxWidth"), function $CPTableColumn__maxWidth(self, _cmd)
{ with(self)
{
    return _maxWidth;
}
},["float"]), new objj_method(sel_getUid("setResizingMask:"), function $CPTableColumn__setResizingMask_(self, _cmd, aResizingMask)
{ with(self)
{
    _resizingMask = aResizingMask;
}
},["void","unsigned"]), new objj_method(sel_getUid("resizingMask"), function $CPTableColumn__resizingMask(self, _cmd)
{ with(self)
{
    return _resizingMask;
}
},["float"]), new objj_method(sel_getUid("sizeToFit"), function $CPTableColumn__sizeToFit(self, _cmd)
{ with(self)
{
    var width = _CGRectGetWidth(objj_msgSend(_headerView, "frame"));
    if (width < objj_msgSend(self, "minWidth"))
        objj_msgSend(self, "setMinWidth:", width);
    else if (width > objj_msgSend(self, "maxWidth"))
        objj_msgSend(self, "setMaxWidth:", width)
    if (_width !== width)
        objj_msgSend(self, "setWidth:", width);
}
},["void"]), new objj_method(sel_getUid("setHeaderView:"), function $CPTableColumn__setHeaderView_(self, _cmd, aView)
{ with(self)
{
    if (!aView)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Attempt to set nil header view on " + objj_msgSend(self, "description"));
    _headerView = aView;
}
},["void","CPView"]), new objj_method(sel_getUid("headerView"), function $CPTableColumn__headerView(self, _cmd)
{ with(self)
{
    return _headerView;
}
},["CPView"]), new objj_method(sel_getUid("setDataView:"), function $CPTableColumn__setDataView_(self, _cmd, aView)
{ with(self)
{
    if (_dataView === aView)
        return;
    if (_dataView)
        _dataViewData[objj_msgSend(_dataView, "UID")] = nil;
    _dataView = aView;
    _dataViewData[objj_msgSend(aView, "UID")] = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", aView);
}
},["void","CPView"]), new objj_method(sel_getUid("dataView"), function $CPTableColumn__dataView(self, _cmd)
{ with(self)
{
    return _dataView;
}
},["CPView"]), new objj_method(sel_getUid("dataViewForRow:"), function $CPTableColumn__dataViewForRow_(self, _cmd, aRowIndex)
{ with(self)
{
    return objj_msgSend(self, "dataView");
}
},["id","int"]), new objj_method(sel_getUid("_newDataViewForRow:"), function $CPTableColumn___newDataViewForRow_(self, _cmd, aRowIndex)
{ with(self)
{
    var dataView = objj_msgSend(self, "dataViewForRow:", aRowIndex),
        dataViewUID = objj_msgSend(dataView, "UID");
var x = objj_msgSend(self, "tableView")._cachedDataViews[dataViewUID];
if (x && x.length)
return x.pop();
    if (!_dataViewData[dataViewUID])
        _dataViewData[dataViewUID] = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", dataView);
    var newDataView = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", _dataViewData[dataViewUID]);
newDataView.identifier = dataViewUID;
    return newDataView;
}
},["id","int"]), new objj_method(sel_getUid("setIdentifier:"), function $CPTableColumn__setIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    _identifier = anIdentifier;
}
},["void","id"]), new objj_method(sel_getUid("identifier"), function $CPTableColumn__identifier(self, _cmd)
{ with(self)
{
    return _identifier;
}
},["id"]), new objj_method(sel_getUid("setEditable:"), function $CPTableColumn__setEditable_(self, _cmd, shouldBeEditable)
{ with(self)
{
    _isEditable = shouldBeEditable;
}
},["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPTableColumn__isEditable(self, _cmd)
{ with(self)
{
    return _isEditable;
}
},["BOOL"]), new objj_method(sel_getUid("setSortDescriptorPrototype:"), function $CPTableColumn__setSortDescriptorPrototype_(self, _cmd, aSortDescriptor)
{ with(self)
{
    _sortDescriptorPrototype = aSortDescriptor;
}
},["void","CPSortDescriptor"]), new objj_method(sel_getUid("sortDescriptorPrototype"), function $CPTableColumn__sortDescriptorPrototype(self, _cmd)
{ with(self)
{
    return _sortDescriptorPrototype;
}
},["CPSortDescriptor"]), new objj_method(sel_getUid("setHidden:"), function $CPTableColumn__setHidden_(self, _cmd, shouldBeHidden)
{ with(self)
{
    _isHidden = shouldBeHidden;
}
},["void","BOOL"]), new objj_method(sel_getUid("isHidden"), function $CPTableColumn__isHidden(self, _cmd)
{ with(self)
{
    return _isHidden;
}
},["BOOL"]), new objj_method(sel_getUid("setHeaderToolTip:"), function $CPTableColumn__setHeaderToolTip_(self, _cmd, aToolTip)
{ with(self)
{
    _headerToolTip = aToolTip;
}
},["void","CPString"]), new objj_method(sel_getUid("headerToolTip"), function $CPTableColumn__headerToolTip(self, _cmd)
{ with(self)
{
    return _headerToolTip;
}
},["CPString"])]);
}
var CPTableColumnIdentifierKey = "CPTableColumnIdentifierKey",
    CPTableColumnHeaderViewKey = "CPTableColumnHeaderViewKey",
    CPTableColumnDataViewKey = "CPTableColumnDataViewKey",
    CPTableColumnWidthKey = "CPTableColumnWidthKey",
    CPTableColumnMinWidthKey = "CPTableColumnMinWidthKey",
    CPTableColumnMaxWidthKey = "CPTableColumnMaxWidthKey",
    CPTableColumnResizingMaskKey = "CPTableColumnResizingMaskKey";
{
var the_class = objj_getClass("CPTableColumn")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTableColumn\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTableColumn__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _dataViewData = { };
        _width = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnWidthKey);
        _minWidth = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnMinWidthKey);
        _maxWidth = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnMaxWidthKey);
        objj_msgSend(self, "setIdentifier:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableColumnIdentifierKey));
        objj_msgSend(self, "setHeaderView:", objj_msgSend(CPTextField, "new"));
        objj_msgSend(self, "setDataView:", objj_msgSend(CPTextField, "new"));
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTableColumn__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifier, CPTableColumnIdentifierKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _width, CPTableColumnWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _minWidth, CPTableColumnMinWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _maxWidth, CPTableColumnMaxWidthKey);
}
},["void","CPCoder"])]);
}
{
var the_class = objj_getClass("CPTableColumn")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTableColumn\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setHeaderCell:"), function $CPTableColumn__setHeaderCell_(self, _cmd, aView)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "setHeaderCell: is not supported. -setHeaderCell:aView instead.");
}
},["void","CPView"]), new objj_method(sel_getUid("headerCell"), function $CPTableColumn__headerCell(self, _cmd)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "headCell is not supported. -headerView instead.");
}
},["CPView"]), new objj_method(sel_getUid("setDataCell:"), function $CPTableColumn__setDataCell_(self, _cmd, aView)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "setDataCell: is not supported. Use -setHeaderCell:aView instead.");
}
},["void","CPView"]), new objj_method(sel_getUid("dataCell"), function $CPTableColumn__dataCell(self, _cmd)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "dataCell is not supported. Use -dataCell instead.");
}
},["CPView"]), new objj_method(sel_getUid("dataCellForRow:"), function $CPTableColumn__dataCellForRow_(self, _cmd, row)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "dataCellForRow: is not supported. Use -dataViewForRow:row instead.");
}
},["id","int"])]);
}

