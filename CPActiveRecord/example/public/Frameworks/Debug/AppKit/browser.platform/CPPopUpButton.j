i;10;CPButton.ji;12;CPGeometry.ji;8;CPMenu.ji;12;CPMenuItem.jc;19767;
var VISIBLE_MARGIN = 7.0;
CPPopUpButtonStatePullsDown = CPThemeState("pulls-down");
{var the_class = objj_allocateClassPair(CPButton, "CPPopUpButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_selectedIndex"), new objj_ivar("_preferredEdge"), new objj_ivar("_menu")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:pullsDown:"), function $CPPopUpButton__initWithFrame_pullsDown_(self, _cmd, aFrame, shouldPullDown)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "initWithFrame:", aFrame);
    if (self)
    {
        _selectedIndex = CPNotFound;
        _preferredEdge = CPMaxYEdge;
        objj_msgSend(self, "setValue:forThemeAttribute:", CPImageLeft, "image-position");
        objj_msgSend(self, "setValue:forThemeAttribute:", CPLeftTextAlignment, "alignment");
        objj_msgSend(self, "setValue:forThemeAttribute:", CPLineBreakByTruncatingTail, "line-break-mode");
        objj_msgSend(self, "setMenu:", objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", ""));
        objj_msgSend(self, "setPullsDown:", shouldPullDown);
    }
    return self;
}
},["id","CGRect","BOOL"]), new objj_method(sel_getUid("initWithFrame:"), function $CPPopUpButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(self, "initWithFrame:pullsDown:", aFrame, NO);
}
},["id","CGRect"]), new objj_method(sel_getUid("setPullsDown:"), function $CPPopUpButton__setPullsDown_(self, _cmd, shouldPullDown)
{ with(self)
{
    if (shouldPullDown)
        var changed = objj_msgSend(self, "setThemeState:", CPPopUpButtonStatePullsDown);
    else
        var changed = objj_msgSend(self, "unsetThemeState:", CPPopUpButtonStatePullsDown);
    if (!changed)
        return;
    var items = objj_msgSend(_menu, "itemArray");
    if (objj_msgSend(items, "count") <= 0)
        return;
    objj_msgSend(items[0], "setHidden:", objj_msgSend(self, "pullsDown"));
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
},["void","BOOL"]), new objj_method(sel_getUid("pullsDown"), function $CPPopUpButton__pullsDown(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "hasThemeState:", CPPopUpButtonStatePullsDown);
}
},["BOOL"]), new objj_method(sel_getUid("addItem:"), function $CPPopUpButton__addItem_(self, _cmd, anItem)
{ with(self)
{
    objj_msgSend(_menu, "addItem:", anItem);
}
},["void","CPMenuItem"]), new objj_method(sel_getUid("addItemWithTitle:"), function $CPPopUpButton__addItemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_menu, "addItemWithTitle:action:keyEquivalent:", aTitle, NULL, nil);
}
},["void","CPString"]), new objj_method(sel_getUid("addItemsWithTitles:"), function $CPPopUpButton__addItemsWithTitles_(self, _cmd, titles)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(titles, "count");
    for (; index < count; ++index)
        objj_msgSend(self, "addItemWithTitle:", titles[index]);
}
},["void","CPArray"]), new objj_method(sel_getUid("insertItemWithTitle:atIndex:"), function $CPPopUpButton__insertItemWithTitle_atIndex_(self, _cmd, aTitle, anIndex)
{ with(self)
{
    var items = objj_msgSend(self, "itemArray"),
        count = objj_msgSend(items, "count");
    while (count--)
        if (objj_msgSend(items[count], "title") == aTitle)
            objj_msgSend(self, "removeItemAtIndex:", count);
    objj_msgSend(_menu, "insertItemWithTitle:action:keyEquivalent:atIndex:", aTitle, NULL, nil, anIndex);
}
},["void","CPString","int"]), new objj_method(sel_getUid("removeAllItems"), function $CPPopUpButton__removeAllItems(self, _cmd)
{ with(self)
{
    var count = objj_msgSend(_menu, "numberOfItems");
    while (count--)
        objj_msgSend(_menu, "removeItemAtIndex:", 0);
}
},["void"]), new objj_method(sel_getUid("removeItemWithTitle:"), function $CPPopUpButton__removeItemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(self, "removeItemAtIndex:", objj_msgSend(self, "indexOfItemWithTitle:", aTitle));
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
},["void","CPString"]), new objj_method(sel_getUid("removeItemAtIndex:"), function $CPPopUpButton__removeItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(_menu, "removeItemAtIndex:", anIndex);
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
},["void","int"]), new objj_method(sel_getUid("selectedItem"), function $CPPopUpButton__selectedItem(self, _cmd)
{ with(self)
{
    if (_selectedIndex < 0 || _selectedIndex > objj_msgSend(self, "numberOfItems") - 1)
        return nil;
    return objj_msgSend(_menu, "itemAtIndex:", _selectedIndex);
}
},["CPMenuItem"]), new objj_method(sel_getUid("titleOfSelectedItem"), function $CPPopUpButton__titleOfSelectedItem(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "selectedItem"), "title");
}
},["CPString"]), new objj_method(sel_getUid("indexOfSelectedItem"), function $CPPopUpButton__indexOfSelectedItem(self, _cmd)
{ with(self)
{
    return _selectedIndex;
}
},["int"]), new objj_method(sel_getUid("objectValue"), function $CPPopUpButton__objectValue(self, _cmd)
{ with(self)
{
    return _selectedIndex;
}
},["id"]), new objj_method(sel_getUid("selectItem:"), function $CPPopUpButton__selectItem_(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItem:", aMenuItem));
}
},["void","CPMenuItem"]), new objj_method(sel_getUid("selectItemAtIndex:"), function $CPPopUpButton__selectItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    if (_selectedIndex == anIndex)
        return;
    if (_selectedIndex >= 0 && !objj_msgSend(self, "pullsDown"))
        objj_msgSend(objj_msgSend(self, "selectedItem"), "setState:", CPOffState);
    _selectedIndex = anIndex;
    if (_selectedIndex >= 0 && !objj_msgSend(self, "pullsDown"))
        objj_msgSend(objj_msgSend(self, "selectedItem"), "setState:", CPOnState);
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
},["void","int"]), new objj_method(sel_getUid("selectItemWithTag:"), function $CPPopUpButton__selectItemWithTag_(self, _cmd, aTag)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItemWithTag:", aTag));
}
},["void","int"]), new objj_method(sel_getUid("selectItemWithTitle:"), function $CPPopUpButton__selectItemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItemWithTitle:", aTitle));
}
},["void","CPString"]), new objj_method(sel_getUid("setObjectValue:"), function $CPPopUpButton__setObjectValue_(self, _cmd, aValue)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(aValue, "intValue"));
}
},["void","id"]), new objj_method(sel_getUid("menu"), function $CPPopUpButton__menu(self, _cmd)
{ with(self)
{
    return _menu;
}
},["CPMenu"]), new objj_method(sel_getUid("setMenu:"), function $CPPopUpButton__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    if (_menu === aMenu)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_menu)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidRemoveItemNotification, _menu);
    }
    _menu = aMenu;
    if (_menu)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidAddItem:"), CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidChangeItem:"), CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidRemoveItem:"), CPMenuDidRemoveItemNotification, _menu);
    }
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
},["void","CPMenu"]), new objj_method(sel_getUid("numberOfItems"), function $CPPopUpButton__numberOfItems(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menu, "numberOfItems");
}
},["int"]), new objj_method(sel_getUid("itemArray"), function $CPPopUpButton__itemArray(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menu, "itemArray");
}
},["CPArray"]), new objj_method(sel_getUid("itemAtIndex:"), function $CPPopUpButton__itemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menu, "itemAtIndex:", anIndex);
}
},["CPMenuItem","unsigned"]), new objj_method(sel_getUid("itemTitleAtIndex:"), function $CPPopUpButton__itemTitleAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_menu, "itemAtIndex:", anIndex), "title");
}
},["CPString","unsigned"]), new objj_method(sel_getUid("itemTitles"), function $CPPopUpButton__itemTitles(self, _cmd)
{ with(self)
{
    var titles = [],
        items = objj_msgSend(self, "itemArray"),
        index = 0,
        count = objj_msgSend(items, "count");
    for (; index < count; ++index)
        items.push(objj_msgSend(items[index], "title"));
}
},["CPArray"]), new objj_method(sel_getUid("itemWithTitle:"), function $CPPopUpButton__itemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(_menu, "itemAtIndex:", objj_msgSend(_menu, "indexOfItemWithTitle:", aTitle));
}
},["CPMenuItem","CPString"]), new objj_method(sel_getUid("lastItem"), function $CPPopUpButton__lastItem(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_menu, "itemArray"), "lastObject");
}
},["CPMenuItem"]), new objj_method(sel_getUid("indexOfItem:"), function $CPPopUpButton__indexOfItem_(self, _cmd, aMenuItem)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItem:", aMenuItem);
}
},["int","CPMenuItem"]), new objj_method(sel_getUid("indexOfItemWithTag:"), function $CPPopUpButton__indexOfItemWithTag_(self, _cmd, aTag)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTag:", aTag);
}
},["int","int"]), new objj_method(sel_getUid("indexOfItemWithTitle:"), function $CPPopUpButton__indexOfItemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTitle:", aTitle);
}
},["int","CPString"]), new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"), function $CPPopUpButton__indexOfItemWithRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithRepresentedObject:", anObject);
}
},["int","id"]), new objj_method(sel_getUid("indexOfItemWithTarget:action:"), function $CPPopUpButton__indexOfItemWithTarget_action_(self, _cmd, aTarget, anAction)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTarget:action:", aTarget, anAction);
}
},["int","id","SEL"]), new objj_method(sel_getUid("preferredEdge"), function $CPPopUpButton__preferredEdge(self, _cmd)
{ with(self)
{
    return _preferredEdge;
}
},["CPRectEdge"]), new objj_method(sel_getUid("setPreferredEdge:"), function $CPPopUpButton__setPreferredEdge_(self, _cmd, aRectEdge)
{ with(self)
{
    _preferredEdge = aRectEdge;
}
},["void","CPRectEdge"]), new objj_method(sel_getUid("setTitle:"), function $CPPopUpButton__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    if (objj_msgSend(self, "title") === aTitle)
        return;
    if (objj_msgSend(self, "pullsDown"))
    {
        var items = objj_msgSend(_menu, "itemArray");
        if (objj_msgSend(items, "count") <= 0)
            objj_msgSend(self, "addItemWithTitle:", aTitle);
        else
        {
            objj_msgSend(items[0], "setTitle:", aTitle);
            objj_msgSend(self, "synchronizeTitleAndSelectedItem");
        }
    }
    else
    {
        var index = objj_msgSend(self, "indexOfItemWithTitle:", aTitle);
        if (index < 0)
        {
            objj_msgSend(self, "addItemWithTitle:", aTitle);
            index = objj_msgSend(self, "numberOfItems") - 1;
        }
        objj_msgSend(self, "selectItemAtIndex:", index);
    }
}
},["void","CPString"]), new objj_method(sel_getUid("setImage:"), function $CPPopUpButton__setImage_(self, _cmd, anImage)
{ with(self)
{
}
},["void","CPImage"]), new objj_method(sel_getUid("synchronizeTitleAndSelectedItem"), function $CPPopUpButton__synchronizeTitleAndSelectedItem(self, _cmd)
{ with(self)
{
    var item = nil;
    if (objj_msgSend(self, "pullsDown"))
    {
        var items = objj_msgSend(_menu, "itemArray");
        if (objj_msgSend(items, "count") > 0)
            item = items[0];
    }
    else
        item = objj_msgSend(self, "selectedItem");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "setImage:", objj_msgSend(item, "image"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "setTitle:", objj_msgSend(item, "title"));
}
},["void"]), new objj_method(sel_getUid("menuDidAddItem:"), function $CPPopUpButton__menuDidAddItem_(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex");
    if (_selectedIndex < 0)
        objj_msgSend(self, "selectItemAtIndex:", 0);
    else if (index == _selectedIndex)
        objj_msgSend(self, "synchronizeTitleAndSelectedItem");
    else if (index < _selectedIndex)
        ++_selectedIndex;
    if (index == 0 && objj_msgSend(self, "pullsDown"))
    {
        var items = objj_msgSend(_menu, "itemArray");
        objj_msgSend(items[0], "setHidden:", YES);
        if (items.length > 0)
            objj_msgSend(items[1], "setHidden:", NO);
    }
    var item = objj_msgSend(_menu, "itemArray")[index],
        action = objj_msgSend(item, "action");
    if (!action || (action === sel_getUid("_popUpItemAction:")))
    {
        objj_msgSend(item, "setTarget:", self);
        objj_msgSend(item, "setAction:", sel_getUid("_popUpItemAction:"));
    }
}
},["void","CPNotification"]), new objj_method(sel_getUid("menuDidChangeItem:"), function $CPPopUpButton__menuDidChangeItem_(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex");
    if (objj_msgSend(self, "pullsDown") && index != 0)
        return;
    if (!objj_msgSend(self, "pullsDown") && index != _selectedIndex)
        return;
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
},["void","CPNotification"]), new objj_method(sel_getUid("menuDidRemoveItem:"), function $CPPopUpButton__menuDidRemoveItem_(self, _cmd, aNotification)
{ with(self)
{
    var numberOfItems = objj_msgSend(self, "numberOfItems");
    if (numberOfItems <= _selectedIndex && numberOfItems > 0)
        objj_msgSend(self, "selectItemAtIndex:", numberOfItems - 1);
    else
        objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
},["void","CPNotification"]), new objj_method(sel_getUid("mouseDown:"), function $CPPopUpButton__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled") || !objj_msgSend(self, "numberOfItems"))
        return;
    objj_msgSend(self, "highlight:", YES);
    var menu = objj_msgSend(self, "menu"),
        theWindow = objj_msgSend(self, "window"),
        menuWindow = objj_msgSend(_CPMenuWindow, "menuWindowWithMenu:font:", menu, objj_msgSend(self, "font"));
    objj_msgSend(menuWindow, "setDelegate:", self);
    objj_msgSend(menuWindow, "setBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle);
    if (objj_msgSend(self, "pullsDown"))
        var menuOrigin = objj_msgSend(theWindow, "convertBaseToGlobal:", objj_msgSend(self, "convertPoint:toView:", CGPointMake(0.0, CGRectGetMaxY(objj_msgSend(self, "bounds"))), nil));
    else
    {
        var contentRect = objj_msgSend(self, "convertRect:toView:", objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds")), nil),
            menuOrigin = objj_msgSend(theWindow, "convertBaseToGlobal:", contentRect.origin),
            menuItemRect = objj_msgSend(menuWindow, "rectForItemAtIndex:", _selectedIndex);
        menuOrigin.x -= CGRectGetMinX(menuItemRect) + objj_msgSend(menuWindow, "overlapOffsetWidth") + objj_msgSend(objj_msgSend(objj_msgSend(menu, "itemAtIndex:", _selectedIndex), "_menuItemView"), "overlapOffsetWidth");
        menuOrigin.y -= CGRectGetMinY(menuItemRect) + (CGRectGetHeight(menuItemRect) - CGRectGetHeight(contentRect)) / 2.0;
    }
    objj_msgSend(menuWindow, "setFrameOrigin:", menuOrigin);
    var menuMaxX = CGRectGetMaxX(objj_msgSend(menuWindow, "frame")),
        buttonMaxX = objj_msgSend(theWindow, "convertBaseToGlobal:", CGPointMake(CGRectGetMaxX(objj_msgSend(self, "convertRect:toView:", objj_msgSend(self, "bounds"), nil)), 0.0)).x;
    if (menuMaxX < buttonMaxX)
        objj_msgSend(menuWindow, "setMinWidth:", CGRectGetWidth(objj_msgSend(menuWindow, "frame")) + buttonMaxX - menuMaxX - (objj_msgSend(self, "pullsDown") ? 0.0 : VISIBLE_MARGIN));
    objj_msgSend(menuWindow, "orderFront:", self);
    objj_msgSend(menuWindow, "beginTrackingWithEvent:sessionDelegate:didEndSelector:", anEvent, self, sel_getUid("menuWindowDidFinishTracking:highlightedItem:"));
}
},["void","CPEvent"]), new objj_method(sel_getUid("menuWindowDidFinishTracking:highlightedItem:"), function $CPPopUpButton__menuWindowDidFinishTracking_highlightedItem_(self, _cmd, aMenuWindow, aMenuItem)
{ with(self)
{
    objj_msgSend(_CPMenuWindow, "poolMenuWindow:", aMenuWindow);
    objj_msgSend(self, "highlight:", NO);
    var index = objj_msgSend(_menu, "indexOfItem:", aMenuItem);
    if (index == CPNotFound)
        return;
    objj_msgSend(self, "selectItemAtIndex:", index);
    objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(aMenuItem, "action"), objj_msgSend(aMenuItem, "target"), aMenuItem);
}
},["void","_CPMenuWindow","CPMenuItem"]), new objj_method(sel_getUid("_popUpItemAction:"), function $CPPopUpButton___popUpItemAction_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
},["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeClass"), function $CPPopUpButton__themeClass(self, _cmd)
{ with(self)
{
    return "popup-button";
}
},["CPString"])]);
}
var CPPopUpButtonMenuKey = "CPPopUpButtonMenuKey",
    CPPopUpButtonSelectedIndexKey = "CPPopUpButtonSelectedIndexKey",
    CPPopUpButtonPullsDownKey = "CPPopUpButtonPullsDownKey";
{
var the_class = objj_getClass("CPPopUpButton")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPPopUpButton\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPPopUpButton__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "initWithCoder:", aCoder);
    if (self)
    {
        _selectedIndex = -1;
        objj_msgSend(self, "setMenu:", objj_msgSend(aCoder, "decodeObjectForKey:", CPPopUpButtonMenuKey));
        objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(aCoder, "decodeObjectForKey:", CPPopUpButtonSelectedIndexKey));
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPPopUpButton__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _menu, CPPopUpButtonMenuKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _selectedIndex, CPPopUpButtonSelectedIndexKey);
}
},["void","CPCoder"])]);
}

