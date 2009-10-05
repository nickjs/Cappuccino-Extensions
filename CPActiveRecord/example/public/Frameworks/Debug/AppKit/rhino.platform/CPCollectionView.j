I;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;23;Foundation/CPIndexSet.jI;28;Foundation/CPKeyedArchiver.jI;30;Foundation/CPKeyedUnarchiver.ji;8;CPView.ji;22;CPCollectionViewItem.jc;18345;
{var the_class = objj_allocateClassPair(CPView, "CPCollectionView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_content"), new objj_ivar("_items"), new objj_ivar("_itemData"), new objj_ivar("_itemPrototype"), new objj_ivar("_itemForDragging"), new objj_ivar("_cachedItems"), new objj_ivar("_maxNumberOfRows"), new objj_ivar("_maxNumberOfColumns"), new objj_ivar("_minItemSize"), new objj_ivar("_maxItemSize"), new objj_ivar("_backgroundColors"), new objj_ivar("_tileWidth"), new objj_ivar("_isSelectable"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_allowsEmptySelection"), new objj_ivar("_selectionIndexes"), new objj_ivar("_itemSize"), new objj_ivar("_horizontalMargin"), new objj_ivar("_verticalMargin"), new objj_ivar("_numberOfRows"), new objj_ivar("_numberOfColumns"), new objj_ivar("_delegate"), new objj_ivar("_mouseDownEvent")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPCollectionView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _items = [];
        _content = [];
        _cachedItems = [];
        _itemSize = CGSizeMakeZero();
        _minItemSize = CGSizeMakeZero();
        _maxItemSize = CGSizeMakeZero();
        objj_msgSend(self, "setBackgroundColors:", nil);
        _verticalMargin = 5.0;
        _tileWidth = -1.0;
        _selectionIndexes = objj_msgSend(CPIndexSet, "indexSet");
        _allowsEmptySelection = YES;
        _isSelectable = YES;
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setItemPrototype:"), function $CPCollectionView__setItemPrototype_(self, _cmd, anItem)
{ with(self)
{
    _cachedItems = [];
    _itemData = nil;
    _itemForDragging = nil;
    _itemPrototype = anItem;
    objj_msgSend(self, "reloadContent");
}
},["void","CPCollectionViewItem"]), new objj_method(sel_getUid("itemPrototype"), function $CPCollectionView__itemPrototype(self, _cmd)
{ with(self)
{
    return _itemPrototype;
}
},["CPCollectionViewItem"]), new objj_method(sel_getUid("newItemForRepresentedObject:"), function $CPCollectionView__newItemForRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    var item = nil;
    if (_cachedItems.length)
        item = _cachedItems.pop();
    else
    {
        if (!_itemData)
            if (_itemPrototype)
                _itemData = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", _itemPrototype);
        item = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", _itemData);
    }
    objj_msgSend(item, "setRepresentedObject:", anObject);
    objj_msgSend(objj_msgSend(item, "view"), "setFrameSize:", _itemSize);
    return item;
}
},["CPCollectionViewItem","id"]), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPCollectionView__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("isFirstResponder"), function $CPCollectionView__isFirstResponder(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "window"), "firstResponder") === self;
}
},["BOOL"]), new objj_method(sel_getUid("setContent:"), function $CPCollectionView__setContent_(self, _cmd, anArray)
{ with(self)
{
    if (_content == anArray)
        return;
    _content = anArray;
    objj_msgSend(self, "reloadContent");
}
},["void","CPArray"]), new objj_method(sel_getUid("content"), function $CPCollectionView__content(self, _cmd)
{ with(self)
{
    return _content;
}
},["CPArray"]), new objj_method(sel_getUid("items"), function $CPCollectionView__items(self, _cmd)
{ with(self)
{
    return _items;
}
},["CPArray"]), new objj_method(sel_getUid("setSelectable:"), function $CPCollectionView__setSelectable_(self, _cmd, isSelectable)
{ with(self)
{
    if (_isSelectable == isSelectable)
        return;
    _isSelectable = isSelectable;
    if (!_isSelectable)
    {
        var index = CPNotFound;
        while ((index = objj_msgSend(_selectionIndexes, "indexGreaterThanIndex:", index)) != CPNotFound)
            objj_msgSend(_items[index], "setSelected:", NO);
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("isSelected"), function $CPCollectionView__isSelected(self, _cmd)
{ with(self)
{
    return _isSelected;
}
},["BOOL"]), new objj_method(sel_getUid("setAllowsEmptySelection:"), function $CPCollectionView__setAllowsEmptySelection_(self, _cmd, shouldAllowEmptySelection)
{ with(self)
{
    _allowsEmptySelection = shouldAllowEmptySelection;
}
},["void","BOOL"]), new objj_method(sel_getUid("allowsEmptySelection"), function $CPCollectionView__allowsEmptySelection(self, _cmd)
{ with(self)
{
    return _allowsEmptySelection;
}
},["BOOL"]), new objj_method(sel_getUid("setAllowsMultipleSelection:"), function $CPCollectionView__setAllowsMultipleSelection_(self, _cmd, shouldAllowMultipleSelection)
{ with(self)
{
    _allowsMultipleSelection = shouldAllowMultipleSelection;
}
},["void","BOOL"]), new objj_method(sel_getUid("allowsMultipleSelection"), function $CPCollectionView__allowsMultipleSelection(self, _cmd)
{ with(self)
{
    return _allowsMultipleSelection;
}
},["BOOL"]), new objj_method(sel_getUid("setSelectionIndexes:"), function $CPCollectionView__setSelectionIndexes_(self, _cmd, anIndexSet)
{ with(self)
{
    if (_selectionIndexes == anIndexSet || !_isSelectable)
        return;
    var index = CPNotFound;
    while ((index = objj_msgSend(_selectionIndexes, "indexGreaterThanIndex:", index)) != CPNotFound)
        objj_msgSend(_items[index], "setSelected:", NO);
    _selectionIndexes = anIndexSet;
    var index = CPNotFound;
    while ((index = objj_msgSend(_selectionIndexes, "indexGreaterThanIndex:", index)) != CPNotFound)
        objj_msgSend(_items[index], "setSelected:", YES);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("collectionViewDidChangeSelection:")))
        objj_msgSend(_delegate, "collectionViewDidChangeSelection:", self)
}
},["void","CPIndexSet"]), new objj_method(sel_getUid("selectionIndexes"), function $CPCollectionView__selectionIndexes(self, _cmd)
{ with(self)
{
    return _selectionIndexes;
}
},["CPIndexSet"]), new objj_method(sel_getUid("reloadContent"), function $CPCollectionView__reloadContent(self, _cmd)
{ with(self)
{
    var count = _items.length;
    while (count--)
    {
        objj_msgSend(objj_msgSend(_items[count], "view"), "removeFromSuperview");
        _cachedItems.push(_items[count]);
    }
    _items = [];
    if (!_itemPrototype || !_content)
        return;
    var index = 0;
    count = _content.length;
    for (; index < count; ++index)
    {
        _items.push(objj_msgSend(self, "newItemForRepresentedObject:", _content[index]));
        objj_msgSend(self, "addSubview:", objj_msgSend(_items[index], "view"));
    }
    objj_msgSend(self, "tile");
}
},["void"]), new objj_method(sel_getUid("tile"), function $CPCollectionView__tile(self, _cmd)
{ with(self)
{
    var width = CGRectGetWidth(objj_msgSend(self, "bounds"));
    if (!objj_msgSend(_content, "count") || width == _tileWidth)
        return;
    var itemSize = CGSizeMakeCopy(_minItemSize);
    _numberOfColumns = MAX(1.0, FLOOR(width / itemSize.width));
    if (_maxNumberOfColumns > 0)
        _numberOfColumns = MIN(_maxNumberOfColumns, _numberOfColumns);
    var remaining = width - _numberOfColumns * itemSize.width,
        itemsNeedSizeUpdate = NO;
    if (remaining > 0 && itemSize.width < _maxItemSize.width)
        itemSize.width = MIN(_maxItemSize.width, itemSize.width + FLOOR(remaining / _numberOfColumns));
    if (_maxNumberOfColumns == 1 && itemSize.width < _maxItemSize.width && itemSize.width < width)
        itemSize.width = MIN(_maxItemSize.width, width);
    if (!CGSizeEqualToSize(_itemSize, itemSize))
    {
        _itemSize = itemSize;
        itemsNeedSizeUpdate = YES;
    }
    var index = 0,
        count = _items.length;
    if (_maxNumberOfColumns > 0 && _maxNumberOfRows > 0)
        count = MIN(count, _maxNumberOfColumns * _maxNumberOfRows);
    _numberOfRows = CEIL(count / _numberOfColumns);
    _horizontalMargin = FLOOR((width - _numberOfColumns * itemSize.width) / (_numberOfColumns + 1));
    var x = _horizontalMargin,
        y = -itemSize.height;
    for (; index < count; ++index)
    {
        if (index % _numberOfColumns == 0)
        {
            x = _horizontalMargin;
            y += _verticalMargin + itemSize.height;
        }
        var view = objj_msgSend(_items[index], "view");
        objj_msgSend(view, "setFrameOrigin:", CGPointMake(x, y));
        if (itemsNeedSizeUpdate)
            objj_msgSend(view, "setFrameSize:", _itemSize);
        x += itemSize.width + _horizontalMargin;
    }
    _tileWidth = width;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(width, y + itemSize.height + _verticalMargin));
    _tileWidth = -1.0;
}
},["void"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPCollectionView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "tile");
}
},["void","CGSize"]), new objj_method(sel_getUid("setMaxNumberOfRows:"), function $CPCollectionView__setMaxNumberOfRows_(self, _cmd, aMaxNumberOfRows)
{ with(self)
{
    if (_maxNumberOfRows == aMaxNumberOfRows)
        return;
    _maxNumberOfRows = aMaxNumberOfRows;
    objj_msgSend(self, "tile");
}
},["void","unsigned"]), new objj_method(sel_getUid("maxNumberOfRows"), function $CPCollectionView__maxNumberOfRows(self, _cmd)
{ with(self)
{
    return _maxNumberOfRows;
}
},["unsigned"]), new objj_method(sel_getUid("setMaxNumberOfColumns:"), function $CPCollectionView__setMaxNumberOfColumns_(self, _cmd, aMaxNumberOfColumns)
{ with(self)
{
    if (_maxNumberOfColumns == aMaxNumberOfColumns)
        return;
    _maxNumberOfColumns = aMaxNumberOfColumns;
    objj_msgSend(self, "tile");
}
},["void","unsigned"]), new objj_method(sel_getUid("maxNumberOfColumns"), function $CPCollectionView__maxNumberOfColumns(self, _cmd)
{ with(self)
{
    return _maxNumberOfColumns;
}
},["unsigned"]), new objj_method(sel_getUid("numberOfRows"), function $CPCollectionView__numberOfRows(self, _cmd)
{ with(self)
{
    return _numberOfRows;
}
},["unsigned"]), new objj_method(sel_getUid("numberOfColumns"), function $CPCollectionView__numberOfColumns(self, _cmd)
{ with(self)
{
    return _numberOfColumns;
}
},["unsigned"]), new objj_method(sel_getUid("setMinItemSize:"), function $CPCollectionView__setMinItemSize_(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_minItemSize, aSize))
        return;
    _minItemSize = CGSizeMakeCopy(aSize);
    objj_msgSend(self, "tile");
}
},["void","CGSize"]), new objj_method(sel_getUid("minItemSize"), function $CPCollectionView__minItemSize(self, _cmd)
{ with(self)
{
    return _minItemSize;
}
},["CGSize"]), new objj_method(sel_getUid("setMaxItemSize:"), function $CPCollectionView__setMaxItemSize_(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_maxItemSize, aSize))
        return;
    _maxItemSize = CGSizeMakeCopy(aSize);
    objj_msgSend(self, "tile");
}
},["void","CGSize"]), new objj_method(sel_getUid("maxItemSize"), function $CPCollectionView__maxItemSize(self, _cmd)
{ with(self)
{
    return _maxItemSize;
}
},["CGSize"]), new objj_method(sel_getUid("setBackgroundColors:"), function $CPCollectionView__setBackgroundColors_(self, _cmd, backgroundColors)
{ with(self)
{
    if (_backgroundColors === backgroundColors)
        return;
    _backgroundColors = backgroundColors;
    if (!_backgroundColors)
        _backgroundColors = objj_msgSend(CPColor, "whiteColor");
    if (objj_msgSend(_backgroundColors, "count") === 1)
        objj_msgSend(self, "setBackgroundColor:", _backgroundColors[0]);
    else
        objj_msgSend(self, "setBackgroundColor:", nil);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPArray"]), new objj_method(sel_getUid("backgroundColors"), function $CPCollectionView__backgroundColors(self, _cmd)
{ with(self)
{
    return _backgroundColors;
}
},["CPArray"]), new objj_method(sel_getUid("mouseUp:"), function $CPCollectionView__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(_selectionIndexes, "count") && objj_msgSend(anEvent, "clickCount") == 2 && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("collectionView:didDoubleClickOnItemAtIndex:")))
        objj_msgSend(_delegate, "collectionView:didDoubleClickOnItemAtIndex:", self, objj_msgSend(_selectionIndexes, "firstIndex"));
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $CPCollectionView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    _mouseDownEvent = anEvent;
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
        row = FLOOR(location.y / (_itemSize.height + _verticalMargin)),
        column = FLOOR(location.x / (_itemSize.width + _horizontalMargin)),
        index = row * _numberOfColumns + column;
    if (index >= 0 && index < _items.length)
        objj_msgSend(self, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", index));
    else if (_allowsEmptySelection)
        objj_msgSend(self, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSet"));
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $CPCollectionView__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("collectionView:dragTypesForItemsAtIndexes:")))
        return;
    if (!objj_msgSend(_selectionIndexes, "count"))
        return;
    var dragTypes = objj_msgSend(_delegate, "collectionView:dragTypesForItemsAtIndexes:", self, _selectionIndexes);
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", dragTypes, self);
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    if (!_itemForDragging)
        _itemForDragging = objj_msgSend(self, "newItemForRepresentedObject:", _content[objj_msgSend(_selectionIndexes, "firstIndex")]);
    else
        objj_msgSend(_itemForDragging, "setRepresentedObject:", _content[objj_msgSend(_selectionIndexes, "firstIndex")]);
    var view = objj_msgSend(_itemForDragging, "view");
    objj_msgSend(view, "setFrameSize:", _itemSize);
    objj_msgSend(view, "setAlphaValue:", 0.7);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", view, objj_msgSend(objj_msgSend(_items[objj_msgSend(_selectionIndexes, "firstIndex")], "view"), "frame").origin, CGSizeMakeZero(), _mouseDownEvent, nil, self, YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function $CPCollectionView__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{ with(self)
{
    objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(_delegate, "collectionView:dataForItemsAtIndexes:forType:", self, _selectionIndexes, aType), aType);
}
},["void","CPPasteboard","CPString"]), new objj_method(sel_getUid("setVerticalMargin:"), function $CPCollectionView__setVerticalMargin_(self, _cmd, aVerticalMargin)
{ with(self)
{
    if (_verticalMargin == aVerticalMargin)
        return;
    _verticalMargin = aVerticalMargin;
    objj_msgSend(self, "tile");
}
},["void","float"]), new objj_method(sel_getUid("verticalMargin"), function $CPCollectionView__verticalMargin(self, _cmd)
{ with(self)
{
    return _verticalMargin;
}
},["float"]), new objj_method(sel_getUid("setDelegate:"), function $CPCollectionView__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $CPCollectionView__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"])]);
}
var CPCollectionViewMinItemSizeKey = "CPCollectionViewMinItemSizeKey",
    CPCollectionViewMaxItemSizeKey = "CPCollectionViewMaxItemSizeKey",
    CPCollectionViewVerticalMarginKey = "CPCollectionViewVerticalMarginKey",
    CPCollectionViewBackgroundColorsKey = "CPCollectionViewBackgroundColorsKey";
{
var the_class = objj_getClass("CPCollectionView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPCollectionView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCollectionView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);
    if (self)
    {
        _items = [];
        _content = [];
        _cachedItems = [];
        _itemSize = CGSizeMakeZero();
        _minItemSize = objj_msgSend(aCoder, "decodeSizeForKey:", CPCollectionViewMinItemSizeKey) || CGSizeMakeZero();
        _maxItemSize = objj_msgSend(aCoder, "decodeSizeForKey:", CPCollectionViewMaxItemSizeKey) || CGSizeMakeZero();
        _verticalMargin = objj_msgSend(aCoder, "decodeFloatForKey:", CPCollectionViewVerticalMarginKey);
        objj_msgSend(self, "setBackgroundColors:", objj_msgSend(aCoder, "decodeObjectForKey:", CPCollectionViewBackgroundColorsKey));
        _tileWidth = -1.0;
        _selectionIndexes = objj_msgSend(CPIndexSet, "indexSet");
        _allowsEmptySelection = YES;
        _isSelectable = YES;
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCollectionView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    if (!CGSizeEqualToSize(_minItemSize, CGSizeMakeZero()))
      objj_msgSend(aCoder, "encodeSize:forKey:", _minItemSize, CPCollectionViewMinItemSizeKey);
    if (!CGSizeEqualToSize(_maxItemSize, CGSizeMakeZero()))
      objj_msgSend(aCoder, "encodeSize:forKey:", _maxItemSize, CPCollectionViewMaxItemSizeKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _verticalMargin, CPCollectionViewVerticalMarginKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _backgroundColors, CPCollectionViewBackgroundColorsKey);
}
},["void","CPCoder"])]);
}

