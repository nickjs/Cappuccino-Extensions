I;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;32;Foundation/CPKeyValueObserving.jI;23;Foundation/CPIndexSet.jI;21;Foundation/CPString.jI;15;AppKit/CPView.jc;14074;
{var the_class = objj_allocateClassPair(CPObject, "CPAccordionViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_view"), new objj_ivar("_label")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("identifier"), function $CPAccordionViewItem__identifier(self, _cmd)
{ with(self)
{
return _identifier;
}
},["id"]),
new objj_method(sel_getUid("setIdentifier:"), function $CPAccordionViewItem__setIdentifier_(self, _cmd, newValue)
{ with(self)
{
_identifier = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("view"), function $CPAccordionViewItem__view(self, _cmd)
{ with(self)
{
return _view;
}
},["id"]),
new objj_method(sel_getUid("setView:"), function $CPAccordionViewItem__setView_(self, _cmd, newValue)
{ with(self)
{
_view = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("label"), function $CPAccordionViewItem__label(self, _cmd)
{ with(self)
{
return _label;
}
},["id"]),
new objj_method(sel_getUid("setLabel:"), function $CPAccordionViewItem__setLabel_(self, _cmd, newValue)
{ with(self)
{
_label = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $CPAccordionViewItem__init(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithIdentifier:", "");
}
},["id"]), new objj_method(sel_getUid("initWithIdentifier:"), function $CPAccordionViewItem__initWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        objj_msgSend(self, "setIdentifier:", anIdentifier);
    return self;
}
},["id","CPString"])]);
}
{var the_class = objj_allocateClassPair(CPView, "CPAccordionView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dirtyItemIndex"), new objj_ivar("_itemHeaderPrototype"), new objj_ivar("_items"), new objj_ivar("_itemViews"), new objj_ivar("_expandedItemIndexes")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPAccordionView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _items = [];
        _itemViews = [];
        _expandedItemIndexes = objj_msgSend(CPIndexSet, "indexSet");
        objj_msgSend(self, "setItemHeaderPrototype:", objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:100.0, height:24.0 } }));
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setItemHeaderPrototype:"), function $CPAccordionView__setItemHeaderPrototype_(self, _cmd, aView)
{ with(self)
{
    _itemHeaderPrototype = aView;
}
},["void","CPView"]), new objj_method(sel_getUid("itemHeaderPrototype"), function $CPAccordionView__itemHeaderPrototype(self, _cmd)
{ with(self)
{
    return _itemHeaderPrototype;
}
},["CPView"]), new objj_method(sel_getUid("items"), function $CPAccordionView__items(self, _cmd)
{ with(self)
{
    return _items;
}
},["CPArray"]), new objj_method(sel_getUid("addItem:"), function $CPAccordionView__addItem_(self, _cmd, anItem)
{ with(self)
{
    objj_msgSend(self, "insertItem:atIndex:", anItem, _items.length);
}
},["void","CPAccordionItem"]), new objj_method(sel_getUid("insertItem:atIndex:"), function $CPAccordionView__insertItem_atIndex_(self, _cmd, anItem, anIndex)
{ with(self)
{
    objj_msgSend(_expandedItemIndexes, "addIndex:", anIndex);
    var itemView = objj_msgSend(objj_msgSend(_CPAccordionItemView, "alloc"), "initWithAccordionView:", self);
    objj_msgSend(itemView, "setIndex:", anIndex);
    objj_msgSend(itemView, "setLabel:", objj_msgSend(anItem, "label"));
    objj_msgSend(itemView, "setContentView:", objj_msgSend(anItem, "view"));
    objj_msgSend(self, "addSubview:", itemView);
    objj_msgSend(_items, "insertObject:atIndex:", anItem, anIndex);
    objj_msgSend(_itemViews, "insertObject:atIndex:", itemView, anIndex);
    objj_msgSend(self, "_invalidateItemsStartingAtIndex:", anIndex);
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPAccordionItem","CPInteger"]), new objj_method(sel_getUid("removeItem:"), function $CPAccordionView__removeItem_(self, _cmd, anItem)
{ with(self)
{
    objj_msgSend(self, "removeItemAtIndex:", objj_msgSend(_items, "indexOfObjectIdenticalTo:", anItem));
}
},["void","CPAccordionItem"]), new objj_method(sel_getUid("removeItemAtIndex:"), function $CPAccordionView__removeItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(_expandedItemIndexes, "removeIndex:", anIndex);
    objj_msgSend(_itemViews[anIndex], "removeFromSuperview");
    objj_msgSend(_items, "removeObjectAtIndex:", anIndex);
    objj_msgSend(_itemViews, "removeObjectAtIndex:", anIndex);
    objj_msgSend(self, "_invalidateItemsStartingAtIndex:", anIndex);
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPInteger"]), new objj_method(sel_getUid("removeAllItems"), function $CPAccordionView__removeAllItems(self, _cmd)
{ with(self)
{
    var count = _items.length;
    while (count--)
        objj_msgSend(self, "removeItemAtIndex:", count);
}
},["void"]), new objj_method(sel_getUid("expandItemAtIndex:"), function $CPAccordionView__expandItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    if (!objj_msgSend(_itemViews[anIndex], "isCollapsed"))
        return;
    objj_msgSend(_expandedItemIndexes, "addIndex:", anIndex);
    objj_msgSend(_itemViews[anIndex], "setCollapsed:", NO);
    objj_msgSend(self, "_invalidateItemsStartingAtIndex:", anIndex);
}
},["void","CPInteger"]), new objj_method(sel_getUid("collapseItemAtIndex:"), function $CPAccordionView__collapseItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    if (objj_msgSend(_itemViews[anIndex], "isCollapsed"))
        return;
    objj_msgSend(_expandedItemIndexes, "removeIndex:", anIndex);
    objj_msgSend(_itemViews[anIndex], "setCollapsed:", YES);
    objj_msgSend(self, "_invalidateItemsStartingAtIndex:", anIndex);
}
},["void","CPInteger"]), new objj_method(sel_getUid("toggleItemAtIndex:"), function $CPAccordionView__toggleItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    var itemView = _itemViews[anIndex];
    if (objj_msgSend(itemView, "isCollapsed"))
        objj_msgSend(self, "expandItemAtIndex:", anIndex);
    else
        objj_msgSend(self, "collapseItemAtIndex:", anIndex);
}
},["void","CPInteger"]), new objj_method(sel_getUid("expandedItemIndexes"), function $CPAccordionView__expandedItemIndexes(self, _cmd)
{ with(self)
{
    return _expandedItemIndexes;
}
},["CPIndexSet"]), new objj_method(sel_getUid("collapsedItemIndexes"), function $CPAccordionView__collapsedItemIndexes(self, _cmd)
{ with(self)
{
    var indexSet = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, _items.length));
    objj_msgSend(indexSet, "removeIndexes:", _expandedIndexes);
    return indexSet;
}
},["CPIndexSet"]), new objj_method(sel_getUid("_invalidateItemsStartingAtIndex:"), function $CPAccordionView___invalidateItemsStartingAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    if (_dirtyItemIndex === CPNotFound)
        _dirtyItemIndex = anIndex;
    _dirtyItemIndex = MIN(_dirtyItemIndex, anIndex);
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPInteger"]), new objj_method(sel_getUid("setFrameSize:"), function $CPAccordionView__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    var width = (objj_msgSend(self, "frame").size.width);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    if (width !== (objj_msgSend(self, "frame").size.width))
        objj_msgSend(self, "_invalidateItemsStartingAtIndex:", 0);
}
},["void","CGSize"]), new objj_method(sel_getUid("layoutSubviews"), function $CPAccordionView__layoutSubviews(self, _cmd)
{ with(self)
{
    if (_items.length <= 0)
        return objj_msgSend(self, "setFrameSize:", { width:(objj_msgSend(self, "frame").size.width), height:0.0 });
    if (_dirtyItemIndex === CPNotFound)
        return;
    _dirtyItemIndex = MIN(_dirtyItemIndex, _items.length - 1);
    var index = _dirtyItemIndex,
        count = _itemViews.length,
        width = (objj_msgSend(self, "bounds").size.width),
        y = index > 0 ? CGRectGetMaxY(objj_msgSend(_itemViews[index - 1], "frame")) : 0.0;
    _dirtyItemIndex = CPNotFound;
    for (; index < count; ++index)
    {
        var itemView = _itemViews[index];
        objj_msgSend(itemView, "setFrameY:width:", y, width);
        y = CGRectGetMaxY(objj_msgSend(itemView, "frame"));
    }
    objj_msgSend(self, "setFrameSize:", { width:(objj_msgSend(self, "frame").size.width), height:y });
}
},["void"])]);
}
{var the_class = objj_allocateClassPair(CPView, "_CPAccordionItemView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_accordionView"), new objj_ivar("_isCollapsed"), new objj_ivar("_index"), new objj_ivar("_headerView"), new objj_ivar("_contentView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("isCollapsed"), function $_CPAccordionItemView__isCollapsed(self, _cmd)
{ with(self)
{
return _isCollapsed;
}
},["id"]),
new objj_method(sel_getUid("setCollapsed:"), function $_CPAccordionItemView__setCollapsed_(self, _cmd, newValue)
{ with(self)
{
_isCollapsed = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("index"), function $_CPAccordionItemView__index(self, _cmd)
{ with(self)
{
return _index;
}
},["id"]),
new objj_method(sel_getUid("setIndex:"), function $_CPAccordionItemView__setIndex_(self, _cmd, newValue)
{ with(self)
{
_index = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithAccordionView:"), function $_CPAccordionItemView__initWithAccordionView_(self, _cmd, anAccordionView)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    if (self)
    {
        _accordionView = anAccordionView;
        _isCollapsed = NO;
        var bounds = objj_msgSend(self, "bounds");
        _headerView = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", objj_msgSend(_accordionView, "itemHeaderPrototype")));
        if (objj_msgSend(_headerView, "respondsToSelector:", sel_getUid("setTarget:")) && objj_msgSend(_headerView, "respondsToSelector:", sel_getUid("setAction:")))
        {
            objj_msgSend(_headerView, "setTarget:", self);
            objj_msgSend(_headerView, "setAction:", sel_getUid("toggle:"));
        }
        objj_msgSend(self, "addSubview:", _headerView);
    }
    return self;
}
},["id","CPAccordionView"]), new objj_method(sel_getUid("toggle:"), function $_CPAccordionItemView__toggle_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(_accordionView, "toggleItemAtIndex:", objj_msgSend(self, "index"));
}
},["void","id"]), new objj_method(sel_getUid("setLabel:"), function $_CPAccordionItemView__setLabel_(self, _cmd, aLabel)
{ with(self)
{
    if (objj_msgSend(_headerView, "respondsToSelector:", sel_getUid("setTitle:")))
        objj_msgSend(_headerView, "setTitle:", aLabel);
    else if (objj_msgSend(_headerView, "respondsToSelector:", sel_getUid("setLabel:")))
        objj_msgSend(_headerView, "setLabel:", aLabel);
    else if (objj_msgSend(_headerView, "respondsToSelector:", sel_getUid("setStringValue:")))
        objj_msgSend(_headerView, "setStringValue:", aLabel);
}
},["void","CPString"]), new objj_method(sel_getUid("setContentView:"), function $_CPAccordionItemView__setContentView_(self, _cmd, aView)
{ with(self)
{
    if (_contentView === aView)
        return;
    objj_msgSend(_contentView, "removeObserver:forKeyPath:", self, "frame");
    objj_msgSend(_contentView, "removeFromSuperview");
    _contentView = aView;
    objj_msgSend(_contentView, "addObserver:forKeyPath:options:context:", self, "frame", 0, NULL);
    objj_msgSend(self, "addSubview:", _contentView);
    objj_msgSend(_accordionView, "_invalidateItemsStartingAtIndex:", objj_msgSend(self, "index"));
}
},["void","CPView"]), new objj_method(sel_getUid("setFrameY:width:"), function $_CPAccordionItemView__setFrameY_width_(self, _cmd, aY, aWidth)
{ with(self)
{
    var headerHeight = (objj_msgSend(_headerView, "frame").size.height);
    objj_msgSend(_headerView, "setFrameSize:", { width:aWidth, height:headerHeight });
    objj_msgSend(_contentView, "setFrameOrigin:", { x:0.0, y:headerHeight });
    if (objj_msgSend(self, "isCollapsed"))
        objj_msgSend(self, "setFrame:", { origin: { x:0.0, y:aY }, size: { width:aWidth, height:headerHeight } });
    else
    {
        var contentHeight = (objj_msgSend(_contentView, "frame").size.height);
        objj_msgSend(_contentView, "setFrameSize:", { width:aWidth, height:contentHeight });
        objj_msgSend(self, "setFrame:", { origin: { x:0.0, y:aY }, size: { width:aWidth, height:contentHeight + headerHeight } });
    }
}
},["void","float","float"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $_CPAccordionItemView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
}
},["void","CGSize"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPAccordionItemView__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, aChange, aContext)
{ with(self)
{
    if (aKeyPath === "frame" && !CGRectEqualToRect(objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeOldKey), objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeNewKey)))
        objj_msgSend(_accordionView, "_invalidateItemsStartingAtIndex:", objj_msgSend(self, "index"));
}
},["void","CPString","id","CPDictionary","id"])]);
}

