I;23;Foundation/Foundation.jc;10740;
CPTableColumnNoResizing = 0;
CPTableColumnAutoresizingMask = 1;
CPTableColumnUserResizingMask = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPTableColumn"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_headerView"), new objj_ivar("_tableView"), new objj_ivar("_width"), new objj_ivar("_minWidth"), new objj_ivar("_maxWidth"), new objj_ivar("_resizingMask"), new objj_ivar("_dataView"), new objj_ivar("_dataViewData"), new objj_ivar("_dataViewForView"), new objj_ivar("_purgableInfosForDataView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithIdentifier:"), function $CPTableColumn__initWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        objj_msgSend(self, "_init");
        _identifier = anIdentifier;
        _width = 40.0;
        _minWidth = 8.0;
        _maxWidth = 1000.0;
        var dataView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMakeZero());
        objj_msgSend(dataView, "setValue:forThemeAttribute:inState:", objj_msgSend(CPColor, "whiteColor"), "text-color", CPThemeStateHighlighted);
        objj_msgSend(self, "setDataView:", dataView);
        _headerView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMakeZero());
        objj_msgSend(_headerView, "setBackgroundColor:", objj_msgSend(CPColor, "greenColor"));
    }
    return self;
}
},["id","CPString"]), new objj_method(sel_getUid("_init"), function $CPTableColumn___init(self, _cmd)
{ with(self)
{
    _dataViewData = {};
    _dataViewForView = {};
    _purgableInfosForDataView = {};
}
},["void"]), new objj_method(sel_getUid("setIdentifier:"), function $CPTableColumn__setIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    _identifier = anIdentifier;
}
},["void","CPString"]), new objj_method(sel_getUid("identifier"), function $CPTableColumn__identifier(self, _cmd)
{ with(self)
{
    return _identifier;
}
},["CPString"]), new objj_method(sel_getUid("setTableView:"), function $CPTableColumn__setTableView_(self, _cmd, aTableView)
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
    _width = aWidth;
}
},["void","float"]), new objj_method(sel_getUid("width"), function $CPTableColumn__width(self, _cmd)
{ with(self)
{
    return _width;
}
},["float"]), new objj_method(sel_getUid("setMinWidth:"), function $CPTableColumn__setMinWidth_(self, _cmd, aWidth)
{ with(self)
{
    if (_width < (_minWidth = aWidth))
        objj_msgSend(self, "setWidth:", _minWidth);
}
},["void","float"]), new objj_method(sel_getUid("minWidth"), function $CPTableColumn__minWidth(self, _cmd)
{ with(self)
{
    return _minWidth;
}
},["float"]), new objj_method(sel_getUid("setMaxWidth:"), function $CPTableColumn__setMaxWidth_(self, _cmd, aWidth)
{ with(self)
{
    if (_width > (_maxmimumWidth = aWidth))
        objj_msgSend(self, "setWidth:", _maxWidth);
}
},["void","float"]), new objj_method(sel_getUid("setResizingMask:"), function $CPTableColumn__setResizingMask_(self, _cmd, aMask)
{ with(self)
{
    _resizingMask = aMask;
}
},["void","unsigned"]), new objj_method(sel_getUid("resizingMask"), function $CPTableColumn__resizingMask(self, _cmd)
{ with(self)
{
    return _resizingMask;
}
},["unsigned"]), new objj_method(sel_getUid("sizeToFit"), function $CPTableColumn__sizeToFit(self, _cmd)
{ with(self)
{
    var width = CPRectGetWidth(objj_msgSend(_headerView, "frame"));
    if (width < _minWidth)
        objj_msgSend(self, "setMinWidth:", width);
    else if (width > _maxWidth)
        objj_msgSend(self, "setMaxWidth:", width)
    if (_width != width)
        objj_msgSend(self, "setWidth:", width);
}
},["void"]), new objj_method(sel_getUid("setEditable:"), function $CPTableColumn__setEditable_(self, _cmd, aFlag)
{ with(self)
{
    _isEditable = aFlag;
}
},["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPTableColumn__isEditable(self, _cmd)
{ with(self)
{
    return _isEditable;
}
},["BOOL"]), new objj_method(sel_getUid("setHeaderView:"), function $CPTableColumn__setHeaderView_(self, _cmd, aView)
{ with(self)
{
    _headerView = aView;
}
},["void","CPView"]), new objj_method(sel_getUid("headerView"), function $CPTableColumn__headerView(self, _cmd)
{ with(self)
{
    return _headerView;
}
},["CPView"]), new objj_method(sel_getUid("setDataCell:"), function $CPTableColumn__setDataCell_(self, _cmd, aView)
{ with(self)
{
    objj_msgSend(self, "setDataView:", aView);
}
},["void","CPView<CPCoding>"]), new objj_method(sel_getUid("setDataView:"), function $CPTableColumn__setDataView_(self, _cmd, aView)
{ with(self)
{
    if (_dataView)
        _dataViewData[objj_msgSend(_dataView, "UID")] = nil;
    _dataView = aView;
    _dataViewData[objj_msgSend(aView, "UID")] = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", aView);
}
},["void","CPView<CPCoding>"]), new objj_method(sel_getUid("dataCell"), function $CPTableColumn__dataCell(self, _cmd)
{ with(self)
{
    return _dataView;
}
},["CPCell"]), new objj_method(sel_getUid("dataView"), function $CPTableColumn__dataView(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "dataCell");
}
},["CPView"]), new objj_method(sel_getUid("dataCellForRow:"), function $CPTableColumn__dataCellForRow_(self, _cmd, aRowIndex)
{ with(self)
{
    return objj_msgSend(self, "dataView");
}
},["CPCell","int"]), new objj_method(sel_getUid("dataViewForRow:"), function $CPTableColumn__dataViewForRow_(self, _cmd, aRowIndex)
{ with(self)
{
    return objj_msgSend(self, "dataCellForRow:", aRowIndex);
}
},["CPView","int"]), new objj_method(sel_getUid("_markView:inRow:asPurgable:"), function $CPTableColumn___markView_inRow_asPurgable_(self, _cmd, aView, aRow, isPurgable)
{ with(self)
{
    var viewUID = objj_msgSend(aView, "UID"),
        dataViewUID = objj_msgSend(_dataViewForView[viewUID], "UID");
    if (!_purgableInfosForDataView[dataViewUID])
    {
        if (!isPurgable)
            return;
        _purgableInfosForDataView[dataViewUID] = {};
    }
    if (!isPurgable) {
        if (_purgableInfosForDataView[dataViewUID][viewUID])
            CPLog.warn("removing unpurgable " + _purgableInfosForDataView[dataViewUID][viewUID]);
        delete _purgableInfosForDataView[dataViewUID][viewUID];
    }
    else
        _purgableInfosForDataView[dataViewUID][viewUID] = { view:(aView), row:(aRow) };
}
},["void","CPView","unsigned","BOOL"]), new objj_method(sel_getUid("_newDataViewForRow:avoidingRows:"), function $CPTableColumn___newDataViewForRow_avoidingRows_(self, _cmd, aRowIndex, rows)
{ with(self)
{
    var view = objj_msgSend(self, "dataViewForRow:", aRowIndex),
        viewUID = objj_msgSend(view, "UID"),
        purgableInfos = _purgableInfosForDataView[viewUID];
    if (purgableInfos)
    {
        for (var key in purgableInfos)
        {
            var info = purgableInfos[key];
                delete purgableInfos[key];
                return ((info).view);
        }
    }
    if (!_dataViewData[viewUID])
        _dataViewData[viewUID] = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", view);
    var newView = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", _dataViewData[viewUID]);
    _dataViewForView[objj_msgSend(newView, "UID")] = view;
    CPLog.warn("creating cell: %s", newView);
    return newView;
}
},["CPView","int","CPRange"]), new objj_method(sel_getUid("_purge"), function $CPTableColumn___purge(self, _cmd)
{ with(self)
{
    for (var viewUID in _purgableInfosForDataView)
    {
        var purgableInfos = _purgableInfosForDataView[viewUID];
        for (var key in purgableInfos)
        {
            var view = ((purgableInfos[key]).view);
            if (!view)
                CPLog.info("key="+key+" view=" + view + " purgableInfos[key]="+purgableInfos[key])
            else if (view._superview) {
                objj_msgSend(view, "setHidden:", YES);
            }
        }
    }
}
},["void"])]);
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
    objj_msgSend(self, "_init");
    _identifier = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableColumnIdentifierKey);
    objj_msgSend(self, "setHeaderView:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableColumnHeaderViewKey));
    objj_msgSend(self, "setDataView:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableColumnDataViewKey));
    _width = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnWidthKey);
    _minWidth = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnMinWidthKey);
    _maxWidth = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnMaxWidthKey);
    _resizingMask = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableColumnResizingMaskKey);
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTableColumn__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifier, CPTableColumnIdentifierKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _headerView, CPTableColumnHeaderViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _dataView, CPTableColumnDataViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _width, CPTableColumnWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _minWidth, CPTableColumnMinWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _maxWidth, CPTableColumnMaxWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _resizingMask, CPTableColumnResizingMaskKey);
}
},["void","CPCoder"])]);
}

