I;21;Foundation/CPObject.ji;15;CPPopUpButton.ji;15;CPToolbarItem.jc;25570;
CPToolbarDisplayModeDefault = 0;
CPToolbarDisplayModeIconAndLabel = 1;
CPToolbarDisplayModeIconOnly = 2;
CPToolbarDisplayModeLabelOnly = 3;
var CPToolbarsByIdentifier = nil;
var CPToolbarConfigurationsByIdentifier = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPToolbar"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_displayMode"), new objj_ivar("_showsBaselineSeparator"), new objj_ivar("_allowsUserCustomization"), new objj_ivar("_isVisible"), new objj_ivar("_delegate"), new objj_ivar("_itemIdentifiers"), new objj_ivar("_identifiedItems"), new objj_ivar("_defaultItems"), new objj_ivar("_allowedItems"), new objj_ivar("_selectableItems"), new objj_ivar("_items"), new objj_ivar("_itemsSortedByVisibilityPriority"), new objj_ivar("_toolbarView"), new objj_ivar("_window")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithIdentifier:"), function $CPToolbar__initWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _items = [];
        _identifier = anIdentifier;
        _isVisible = YES;
        objj_msgSend(CPToolbar, "_addToolbar:forIdentifier:", self, _identifier);
    }
    return self;
}
},["id","CPString"]), new objj_method(sel_getUid("setDisplayMode:"), function $CPToolbar__setDisplayMode_(self, _cmd, aDisplayMode)
{ with(self)
{
}
},["void","CPToolbarDisplayMode"]), new objj_method(sel_getUid("identifier"), function $CPToolbar__identifier(self, _cmd)
{ with(self)
{
    return _identifier;
}
},["CPString"]), new objj_method(sel_getUid("delegate"), function $CPToolbar__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("isVisible"), function $CPToolbar__isVisible(self, _cmd)
{ with(self)
{
    return _isVisible;
}
},["BOOL"]), new objj_method(sel_getUid("setVisible:"), function $CPToolbar__setVisible_(self, _cmd, aFlag)
{ with(self)
{
    if (_isVisible === aFlag)
        return;
    _isVisible = aFlag;
    objj_msgSend(_window, "_noteToolbarChanged");
}
},["void","BOOL"]), new objj_method(sel_getUid("_window"), function $CPToolbar___window(self, _cmd)
{ with(self)
{
    return _window;
}
},["CPWindow"]), new objj_method(sel_getUid("_setWindow:"), function $CPToolbar___setWindow_(self, _cmd, aWindow)
{ with(self)
{
    _window = aWindow;
}
},["void","CPWindow"]), new objj_method(sel_getUid("setDelegate:"), function $CPToolbar__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate == aDelegate)
        return;
    _delegate = aDelegate;
    objj_msgSend(self, "_reloadToolbarItems");
}
},["void","id"]), new objj_method(sel_getUid("_loadConfiguration"), function $CPToolbar___loadConfiguration(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("_toolbarView"), function $CPToolbar___toolbarView(self, _cmd)
{ with(self)
{
    if (!_toolbarView)
    {
        _toolbarView = objj_msgSend(objj_msgSend(_CPToolbarView, "alloc"), "initWithFrame:", CPRectMake(0.0, 0.0, 1200.0, 59.0));
        objj_msgSend(_toolbarView, "setToolbar:", self);
        objj_msgSend(_toolbarView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_toolbarView, "reloadToolbarItems");
    }
    return _toolbarView;
}
},["CPView"]), new objj_method(sel_getUid("_reloadToolbarItems"), function $CPToolbar___reloadToolbarItems(self, _cmd)
{ with(self)
{
    if (!_delegate)
        return;
    var count = objj_msgSend(_itemIdentifiers, "count");
    if (!count)
    {
         _itemIdentifiers = objj_msgSend(objj_msgSend(_delegate, "toolbarDefaultItemIdentifiers:", self), "mutableCopy");
         count = objj_msgSend(_itemIdentifiers, "count");
    }
    _items = [];
    var index = 0;
    for (; index < count; ++index)
    {
        var identifier = _itemIdentifiers[index],
            item = objj_msgSend(CPToolbarItem, "_standardItemWithItemIdentifier:", identifier);
        if (!item)
            item = objj_msgSend(_delegate, "toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:", self, identifier, YES);
        item = objj_msgSend(item, "copy");
        if (item == nil)
            objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, sprintf("_delegate %s returned nil toolbar item returned for identifier %s", _delegate, identifier));
        objj_msgSend(_items, "addObject:", item);
    }
    _itemsSortedByVisibilityPriority = objj_msgSend(_items, "sortedArrayUsingFunction:context:", _CPToolbarItemVisibilityPriorityCompare, NULL);
    objj_msgSend(_toolbarView, "reloadToolbarItems");
}
},["void"]), new objj_method(sel_getUid("items"), function $CPToolbar__items(self, _cmd)
{ with(self)
{
    return _items;
}
},["CPArray"]), new objj_method(sel_getUid("visibleItems"), function $CPToolbar__visibleItems(self, _cmd)
{ with(self)
{
    return objj_msgSend(_toolbarView, "visibleItems");
}
},["CPArray"]), new objj_method(sel_getUid("itemsSortedByVisibilityPriority"), function $CPToolbar__itemsSortedByVisibilityPriority(self, _cmd)
{ with(self)
{
    return _itemsSortedByVisibilityPriority;
}
},["CPArray"]), new objj_method(sel_getUid("_itemForItemIdentifier:willBeInsertedIntoToolbar:"), function $CPToolbar___itemForItemIdentifier_willBeInsertedIntoToolbar_(self, _cmd, identifier, toolbar)
{ with(self)
{
    var item = objj_msgSend(_identifiedItems, "objectForKey:", identifier);
    if (!item)
    {
        item = objj_msgSend(CPToolbarItem, "_standardItemWithItemIdentifier:", identifier);
        if (_delegate && !item)
        {
            item = objj_msgSend(objj_msgSend(_delegate, "toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:", self, identifier, toolbar), "copy");
            if (!item)
                objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, sprintf("_delegate %s returned nil toolbar item returned for identifier %s", _delegate, identifier));
        }
        objj_msgSend(_identifiedItems, "setObject:forKey:", item, identifier);
    }
    return item;
}
},["id","CPString","BOOL"]), new objj_method(sel_getUid("_itemsWithIdentifiers:"), function $CPToolbar___itemsWithIdentifiers_(self, _cmd, identifiers)
{ with(self)
{
    var items = [];
    for (var i = 0; i < identifiers.length; i++)
        objj_msgSend(items, "addObject:", objj_msgSend(self, "_itemForItemIdentifier:willBeInsertedIntoToolbar:", identifiers[i], NO));
    return items;
}
},["id","CPArray"]), new objj_method(sel_getUid("_defaultToolbarItems"), function $CPToolbar___defaultToolbarItems(self, _cmd)
{ with(self)
{
    if (!_defaultItems)
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("toolbarDefaultItemIdentifiers:")))
            _defaultItems = objj_msgSend(self, "_itemsWithIdentifiers:", objj_msgSend(_delegate, "toolbarDefaultItemIdentifiers:", self));
    return _defaultItems;
}
},["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPToolbar__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPToolbar, "class"))
        return;
    CPToolbarsByIdentifier = objj_msgSend(CPDictionary, "dictionary");
    CPToolbarConfigurationsByIdentifier = objj_msgSend(CPDictionary, "dictionary");
}
},["void"]), new objj_method(sel_getUid("_addToolbar:forIdentifier:"), function $CPToolbar___addToolbar_forIdentifier_(self, _cmd, toolbar, identifier)
{ with(self)
{
    var toolbarsSharingIdentifier = objj_msgSend(CPToolbarsByIdentifier, "objectForKey:", identifier);
    if (!toolbarsSharingIdentifier)
    {
        toolbarsSharingIdentifier = []
        objj_msgSend(CPToolbarsByIdentifier, "setObject:forKey:", toolbarsSharingIdentifier, identifier);
    }
    objj_msgSend(toolbarsSharingIdentifier, "addObject:", toolbar);
}
},["void","CPToolbar","CPString"])]);
}
var CPToolbarIdentifierKey = "CPToolbarIdentifierKey",
    CPToolbarDisplayModeKey = "CPToolbarDisplayModeKey",
    CPToolbarShowsBaselineSeparatorKey = "CPToolbarShowsBaselineSeparatorKey",
    CPToolbarAllowsUserCustomizationKey = "CPToolbarAllowsUserCustomizationKey",
    CPToolbarIsVisibleKey = "CPToolbarIsVisibleKey",
    CPToolbarDelegateKey = "CPToolbarDelegateKey",
    CPToolbarIdentifiedItemsKey = "CPToolbarIdentifiedItemsKey",
    CPToolbarDefaultItemsKey = "CPToolbarDefaultItemsKey",
    CPToolbarAllowedItemsKey = "CPToolbarAllowedItemsKey",
    CPToolbarSelectableItemsKey = "CPToolbarSelectableItemsKey";
{
var the_class = objj_getClass("CPToolbar")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPToolbar\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPToolbar__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _identifier = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarIdentifierKey);
        _displayMode = objj_msgSend(aCoder, "decodeIntForKey:", CPToolbarDisplayModeKey);
        _showsBaselineSeparator = objj_msgSend(aCoder, "decodeBoolForKey:", CPToolbarShowsBaselineSeparatorKey);
        _allowsUserCustomization = objj_msgSend(aCoder, "decodeBoolForKey:", CPToolbarAllowsUserCustomizationKey);
        _isVisible = objj_msgSend(aCoder, "decodeBoolForKey:", CPToolbarIsVisibleKey);
        _identifiedItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarIdentifiedItemsKey);
        _defaultItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarDefaultItemsKey);
        _allowedItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarAllowedItemsKey);
        _selectableItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarSelectableItemsKey);
        _items = [];
        objj_msgSend(CPToolbar, "_addToolbar:forIdentifier:", self, _identifier);
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarDelegateKey));
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPToolbar__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifier, CPToolbarIdentifierKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _displayMode, CPToolbarDisplayModeKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _showsBaselineSeparator, CPToolbarShowsBaselineSeparatorKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _allowsUserCustomization, CPToolbarAllowsUserCustomizationKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isVisible, CPToolbarIsVisibleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifiedItems, CPToolbarIdentifiedItemsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _defaultItems, CPToolbarDefaultItemsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _allowedItems, CPToolbarAllowedItemsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _selectableItems, CPToolbarSelectableItemsKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _delegate, CPToolbarDelegateKey);
}
},["void","CPCoder"])]);
}
var _CPToolbarViewBackgroundColor = nil,
    _CPToolbarViewExtraItemsImage = nil,
    _CPToolbarViewExtraItemsAlternateImage = nil;
var TOOLBAR_TOP_MARGIN = 5.0,
    TOOLBAR_ITEM_MARGIN = 10.0,
    TOOLBAR_EXTRA_ITEMS_WIDTH = 20.0;
var _CPToolbarItemInfoMake = function(anIndex, aView, aLabel, aMinWidth)
{
    return { index:anIndex, view:aView, label:aLabel, minWidth:aMinWidth };
}
{var the_class = objj_allocateClassPair(CPView, "_CPToolbarView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbar"), new objj_ivar("_flexibleWidthIndexes"), new objj_ivar("_visibleFlexibleWidthIndexes"), new objj_ivar("_itemInfos"), new objj_ivar("_visibleItems"), new objj_ivar("_invisibleItems"), new objj_ivar("_additionalItemsButton"), new objj_ivar("_labelColor"), new objj_ivar("_labelShadowColor"), new objj_ivar("_minWidth")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPToolbarView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _minWidth = 0;
        _labelColor = objj_msgSend(CPColor, "blackColor");
        _labelShadowColor = objj_msgSend(CPColor, "colorWithWhite:alpha:", 1.0, 0.75);
        _additionalItemsButton = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:pullsDown:", CGRectMake(0.0, 0.0, 10.0, 15.0), YES);
        objj_msgSend(_additionalItemsButton, "setBordered:", NO);
        objj_msgSend(_additionalItemsButton, "setImagePosition:", CPImageOnly);
        objj_msgSend(objj_msgSend(_additionalItemsButton, "menu"), "setShowsStateColumn:", NO);
        objj_msgSend(_additionalItemsButton, "setAlternateImage:", _CPToolbarViewExtraItemsAlternateImage);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setToolbar:"), function $_CPToolbarView__setToolbar_(self, _cmd, aToolbar)
{ with(self)
{
    _toolbar = aToolbar;
}
},["void","CPToolbar"]), new objj_method(sel_getUid("toolbar"), function $_CPToolbarView__toolbar(self, _cmd)
{ with(self)
{
    return _toolbar;
}
},["CPToolbar"]), new objj_method(sel_getUid("setLabelColor:"), function $_CPToolbarView__setLabelColor_(self, _cmd, aColor)
{ with(self)
{
    if (_labelColor === aColor)
        return;
    _labelColor = aColor;
    var items = objj_msgSend(_toolbar, "items"),
        count = objj_msgSend(items, "count");
    while (count--)
        objj_msgSend(objj_msgSend(self, "labelForItem:", items[count]), "setTextColor:", _labelColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("setLabelShadowColor:"), function $_CPToolbarView__setLabelShadowColor_(self, _cmd, aColor)
{ with(self)
{
    if (_labelShadowColor === aColor)
        return;
    _labelShadowColor = aColor;
    var items = objj_msgSend(_toolbar, "items"),
        count = objj_msgSend(items, "count");
    while (count--)
        objj_msgSend(objj_msgSend(self, "labelForItem:", items[count]), "setTextShadowColor:", _labelShadowColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $_CPToolbarView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "layoutSubviews");
}
},["void","CGSize"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPToolbarView__layoutSubviews(self, _cmd)
{ with(self)
{
    var items = objj_msgSend(_toolbar, "items"),
        width = CGRectGetWidth(objj_msgSend(self, "bounds")),
        minWidth = _minWidth,
        flexibleItemIndexes = objj_msgSend(CPIndexSet, "indexSet"),
        invisibleItemsSortedByPriority = [];
    _visibleItems = items;
    if (width < minWidth)
    {
        width -= TOOLBAR_EXTRA_ITEMS_WIDTH;
        _visibleItems = objj_msgSend(_visibleItems, "copy");
        var itemsSortedByVisibilityPriority = objj_msgSend(_toolbar, "itemsSortedByVisibilityPriority"),
            count = itemsSortedByVisibilityPriority.length;
        while (minWidth > width)
        {
            var item = itemsSortedByVisibilityPriority[count--];
            minWidth -= objj_msgSend(self, "minWidthForItem:", item) + TOOLBAR_ITEM_MARGIN;
            objj_msgSend(_visibleItems, "removeObjectIdenticalTo:", item);
            objj_msgSend(invisibleItemsSortedByPriority, "addObject:", item);
            objj_msgSend(objj_msgSend(self, "viewForItem:", item), "setHidden:", YES);
            objj_msgSend(objj_msgSend(self, "labelForItem:", item), "setHidden:", YES);
        }
    }
    var index = _visibleItems.length,
        height = 0.0;
    while (index--)
    {
        var item = _visibleItems[index],
            minSize = objj_msgSend(item, "minSize"),
            view = objj_msgSend(self, "viewForItem:", item);
        if (minSize.width != objj_msgSend(item, "maxSize").width)
            objj_msgSend(flexibleItemIndexes, "addIndex:", index);
        else
            objj_msgSend(view, "setFrameSize:", CGSizeMake(objj_msgSend(item, "minSize").width, CGRectGetHeight(objj_msgSend(view, "frame"))));
        objj_msgSend(view, "setHidden:", NO);
        objj_msgSend(objj_msgSend(self, "labelForItem:", item), "setHidden:", NO);
        if (height < minSize.height)
            height = minSize.height;
    }
    var remainingSpace = width - minWidth,
        proportionate = 0.0;
    while (remainingSpace && objj_msgSend(flexibleItemIndexes, "count"))
    {
        proportionate += remainingSpace / objj_msgSend(flexibleItemIndexes, "count");
        remainingSpace = 0.0;
        var index = CPNotFound;
        while ((index = objj_msgSend(flexibleItemIndexes, "indexGreaterThanIndex:", index)) != CPNotFound)
        {
            var item = _visibleItems[index];
                view = objj_msgSend(self, "viewForItem:", item),
                viewFrame = objj_msgSend(view, "frame"),
                proposedWidth = objj_msgSend(item, "minSize").width + proportionate,
                constrainedWidth = MIN(proposedWidth, objj_msgSend(item, "maxSize").width);
            if (constrainedWidth < proposedWidth)
            {
                objj_msgSend(flexibleItemIndexes, "removeIndex:", index);
                remainingSpace += proposedWidth - constrainedWidth;
            }
            objj_msgSend(view, "setFrameSize:", CGSizeMake(constrainedWidth, CGRectGetHeight(viewFrame)));
        }
    }
    var count = _visibleItems.length,
        x = TOOLBAR_ITEM_MARGIN,
        fullHeightItems = [];
    for (index = 0; index < count; ++index)
    {
        var item = _visibleItems[index],
            view = objj_msgSend(self, "viewForItem:", item),
            viewFrame = objj_msgSend(view, "frame"),
            viewWidth = CGRectGetWidth(viewFrame),
            label = objj_msgSend(self, "labelForItem:", item),
            labelFrame = objj_msgSend(label, "frame"),
            labelWidth = CGRectGetWidth(labelFrame),
            itemWidth = MAX(objj_msgSend(self, "minWidthForItem:", item), viewWidth),
            viewHeight = CGRectGetHeight(viewFrame);
        objj_msgSend(view, "setFrame:", CGRectMake(x + (itemWidth - viewWidth) / 2.0, TOOLBAR_TOP_MARGIN + (height - viewHeight) / 2.0, viewWidth, viewHeight));
        objj_msgSend(label, "setFrameOrigin:", CGPointMake(x + (itemWidth - labelWidth) / 2.0, TOOLBAR_TOP_MARGIN + height + 2.0));
        x += itemWidth + TOOLBAR_ITEM_MARGIN;
        if (objj_msgSend(item, "itemIdentifier") == CPToolbarSeparatorItemIdentifier)
            fullHeightItems.push(item);
    }
    for (index = 0, count = fullHeightItems.length; index < count; ++index)
    {
        var view = objj_msgSend(self, "viewForItem:", fullHeightItems[index]),
            viewHeight = 53.0;
        objj_msgSend(view, "setFrame:", CGRectMake(CGRectGetMinX(objj_msgSend(view, "frame")), (59.0 - viewHeight) / 2.0, CGRectGetWidth(objj_msgSend(view, "frame")), viewHeight));
    }
    if (objj_msgSend(invisibleItemsSortedByPriority, "count"))
    {
        var index = 0,
            count = objj_msgSend(items, "count");
        _invisibleItems = [];
        for (; index < count; ++index)
        {
            var item = items[index];
            if (objj_msgSend(invisibleItemsSortedByPriority, "indexOfObjectIdenticalTo:", item) != CPNotFound)
                objj_msgSend(_invisibleItems, "addObject:", item);
        }
        objj_msgSend(_additionalItemsButton, "setFrameOrigin:", CGPointMake(width + 5.0, (CGRectGetHeight(objj_msgSend(self, "bounds")) - CGRectGetHeight(objj_msgSend(_additionalItemsButton, "frame"))) / 2.0));
        objj_msgSend(self, "addSubview:", _additionalItemsButton);
        objj_msgSend(_additionalItemsButton, "removeAllItems");
        var index = 0,
            count = objj_msgSend(_invisibleItems, "count");
        objj_msgSend(_additionalItemsButton, "addItemWithTitle:", "Additional Items");
        objj_msgSend(objj_msgSend(_additionalItemsButton, "itemArray")[0], "setImage:", _CPToolbarViewExtraItemsImage);
        for (; index < count; ++index)
        {
            var item = _invisibleItems[index];
            objj_msgSend(_additionalItemsButton, "addItemWithTitle:", objj_msgSend(item, "label"));
            var menuItem = objj_msgSend(_additionalItemsButton, "itemArray")[index + 1];
            objj_msgSend(menuItem, "setImage:", objj_msgSend(item, "image"));
            objj_msgSend(menuItem, "setTarget:", objj_msgSend(item, "target"));
            objj_msgSend(menuItem, "setAction:", objj_msgSend(item, "action"));
        }
    }
    else
        objj_msgSend(_additionalItemsButton, "removeFromSuperview");
}
},["void"]), new objj_method(sel_getUid("viewForItem:"), function $_CPToolbarView__viewForItem_(self, _cmd, anItem)
{ with(self)
{
    var info = objj_msgSend(_itemInfos, "objectForKey:", objj_msgSend(anItem, "UID"));
    if (!info)
        return nil;
    return info.view;
}
},["CPView","CPToolbarItem"]), new objj_method(sel_getUid("labelForItem:"), function $_CPToolbarView__labelForItem_(self, _cmd, anItem)
{ with(self)
{
    var info = objj_msgSend(_itemInfos, "objectForKey:", objj_msgSend(anItem, "UID"));
    if (!info)
        return nil;
    return info.label;
}
},["CPTextField","CPToolbarItem"]), new objj_method(sel_getUid("minWidthForItem:"), function $_CPToolbarView__minWidthForItem_(self, _cmd, anItem)
{ with(self)
{
    var info = objj_msgSend(_itemInfos, "objectForKey:", objj_msgSend(anItem, "UID"));
    if (!info)
        return 0;
    return info.minWidth;
}
},["float","CPToolbarItem"]), new objj_method(sel_getUid("reloadToolbarItems"), function $_CPToolbarView__reloadToolbarItems(self, _cmd)
{ with(self)
{
    var subviews = objj_msgSend(self, "subviews"),
        count = subviews.length;
    while (count--)
        objj_msgSend(subviews[count], "removeFromSuperview");
    var items = objj_msgSend(_toolbar, "items"),
        index = 0;
    count = items.length;
    _itemInfos = objj_msgSend(CPDictionary, "dictionary");
    _minWidth = TOOLBAR_ITEM_MARGIN;
    for (; index < count; ++index)
    {
        var item = items[index],
            view = objj_msgSend(item, "view");
        if (!view)
        {
            view = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 32.0, 32.0));
            objj_msgSend(view, "setBordered:", NO);
            objj_msgSend(view, "setImage:", objj_msgSend(item, "image"));
            objj_msgSend(view, "setAlternateImage:", objj_msgSend(item, "alternateImage"));
            objj_msgSend(view, "setTarget:", objj_msgSend(item, "target"));
            objj_msgSend(view, "setAction:", objj_msgSend(item, "action"));
            objj_msgSend(view, "setTag:", objj_msgSend(item, "tag"));
            objj_msgSend(view, "setImagePosition:", CPImageOnly);
        }
        objj_msgSend(self, "addSubview:", view);
        var label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(label, "setStringValue:", objj_msgSend(item, "label"));
        objj_msgSend(label, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
        objj_msgSend(label, "setTextColor:", _labelColor);
        objj_msgSend(label, "setTextShadowColor:", _labelShadowColor);
        objj_msgSend(label, "setTextShadowOffset:", CGSizeMake(0, 1));
        objj_msgSend(label, "sizeToFit");
        objj_msgSend(label, "setTarget:", objj_msgSend(item, "target"));
        objj_msgSend(label, "setAction:", objj_msgSend(item, "action"));
        objj_msgSend(self, "addSubview:", label);
        var minSize = objj_msgSend(item, "minSize"),
            minWidth = MAX(minSize.width, CGRectGetWidth(objj_msgSend(label, "frame")));
        objj_msgSend(_itemInfos, "setObject:forKey:", _CPToolbarItemInfoMake(index, view, label, minWidth), objj_msgSend(item, "UID"));
        _minWidth += minWidth + TOOLBAR_ITEM_MARGIN;
    }
    objj_msgSend(self, "layoutSubviews");
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $_CPToolbarView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPToolbarView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPToolbarViewExtraItemsImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:",  objj_msgSend(bundle, "pathForResource:", "_CPToolbarView/_CPToolbarViewExtraItemsImage.png"),  CPSizeMake(10.0, 15.0));
    _CPToolbarViewExtraItemsAlternateImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:",  objj_msgSend(bundle, "pathForResource:", "_CPToolbarView/_CPToolbarViewExtraItemsAlternateImage.png"), CGSizeMake(10.0, 15.0));
}
},["void"])]);
}
var _CPToolbarItemVisibilityPriorityCompare = function(lhs, rhs)
{
    var lhsVisibilityPriority = objj_msgSend(lhs, "visibilityPriority"),
        rhsVisibilityPriority = objj_msgSend(rhs, "visibilityPriority");
    if (lhsVisibilityPriority == rhsVisibilityPriority)
        return CPOrderedSame;
    if (lhsVisibilityPriority > rhsVisibilityPriority)
        return CPOrderedAscending;
    return CPOrderedDescending;
}

