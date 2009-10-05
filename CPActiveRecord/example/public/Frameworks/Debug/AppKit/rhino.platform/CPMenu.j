I;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;15;CPApplication.ji;12;CPClipView.ji;12;CPMenuItem.ji;9;CPPanel.jc;69154;
CPMenuDidAddItemNotification = "CPMenuDidAddItemNotification";
CPMenuDidChangeItemNotification = "CPMenuDidChangeItemNotification";
CPMenuDidRemoveItemNotification = "CPMenuDidRemoveItemNotification";
CPMenuDidEndTrackingNotification = "CPMenuDidEndTrackingNotification";
var MENUBAR_HEIGHT = 19.0;
var _CPMenuBarVisible = NO,
    _CPMenuBarTitle = "",
    _CPMenuBarIconImage = nil,
    _CPMenuBarIconImageAlphaValue = 1.0,
    _CPMenuBarAttributes = nil,
    _CPMenuBarSharedWindow = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPMenu"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_supermenu"), new objj_ivar("_title"), new objj_ivar("_name"), new objj_ivar("_items"), new objj_ivar("_attachedMenu"), new objj_ivar("_autoenablesItems"), new objj_ivar("_showsStateColumn"), new objj_ivar("_delegate"), new objj_ivar("_highlightedIndex"), new objj_ivar("_menuWindow")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("menuBarHeight"), function $CPMenu__menuBarHeight(self, _cmd)
{ with(self)
{
    if (self == objj_msgSend(CPApp, "mainMenu"))
        return MENUBAR_HEIGHT;
    return 0.0;
}
},["float"]), new objj_method(sel_getUid("initWithTitle:"), function $CPMenu__initWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _title = aTitle;
        _items = [];
        _autoenablesItems = YES;
        _showsStateColumn = YES;
    }
    return self;
}
},["id","CPString"]), new objj_method(sel_getUid("init"), function $CPMenu__init(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithTitle:", "");
}
},["id"]), new objj_method(sel_getUid("insertItem:atIndex:"), function $CPMenu__insertItem_atIndex_(self, _cmd, aMenuItem, anIndex)
{ with(self)
{
    var menu = objj_msgSend(aMenuItem, "menu");
    if (menu)
        if (menu !== self)
            objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Attempted to insert item into menu that was already in another menu.");
        else
            return;
    objj_msgSend(aMenuItem, "setMenu:", self);
    objj_msgSend(_items, "insertObject:atIndex:", aMenuItem, anIndex);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidAddItemNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anIndex, "CPMenuItemIndex"));
}
},["void","CPMenuItem","unsigned"]), new objj_method(sel_getUid("insertItemWithTitle:action:keyEquivalent:atIndex:"), function $CPMenu__insertItemWithTitle_action_keyEquivalent_atIndex_(self, _cmd, aTitle, anAction, aKeyEquivalent, anIndex)
{ with(self)
{
    var item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", aTitle, anAction, aKeyEquivalent);
    objj_msgSend(self, "insertItem:atIndex:", item, anIndex);
    return item;
}
},["CPMenuItem","CPString","SEL","CPString","unsigned"]), new objj_method(sel_getUid("addItem:"), function $CPMenu__addItem_(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "insertItem:atIndex:", aMenuItem, objj_msgSend(_items, "count"));
}
},["void","CPMenuItem"]), new objj_method(sel_getUid("addItemWithTitle:action:keyEquivalent:"), function $CPMenu__addItemWithTitle_action_keyEquivalent_(self, _cmd, aTitle, anAction, aKeyEquivalent)
{ with(self)
{
    return objj_msgSend(self, "insertItemWithTitle:action:keyEquivalent:atIndex:", aTitle, anAction, aKeyEquivalent, objj_msgSend(_items, "count"));
}
},["CPMenuItem","CPString","SEL","CPString"]), new objj_method(sel_getUid("removeItem:"), function $CPMenu__removeItem_(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "removeItemAtIndex:", objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem));
}
},["void","CPMenuItem"]), new objj_method(sel_getUid("removeItemAtIndex:"), function $CPMenu__removeItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    if (anIndex < 0 || anIndex >= _items.length)
        return;
    objj_msgSend(_items[anIndex], "setMenu:", nil);
    objj_msgSend(_items, "removeObjectAtIndex:", anIndex);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidRemoveItemNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anIndex, "CPMenuItemIndex"));
}
},["void","unsigned"]), new objj_method(sel_getUid("itemChanged:"), function $CPMenu__itemChanged_(self, _cmd, aMenuItem)
{ with(self)
{
    if (objj_msgSend(aMenuItem, "menu") != self)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidChangeItemNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem), "CPMenuItemIndex"));
}
},["void","CPMenuItem"]), new objj_method(sel_getUid("itemWithTag:"), function $CPMenu__itemWithTag_(self, _cmd, aTag)
{ with(self)
{
    var index = objj_msgSend(self, "indexOfItemWithTag:", aTag);
    if (index == CPNotFound)
        return nil;
    return _items[index];
}
},["CPMenuItem","int"]), new objj_method(sel_getUid("itemWithTitle:"), function $CPMenu__itemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    var index = objj_msgSend(self, "indexOfItemWithTitle:", aTitle);
    if (index == CPNotFound)
        return nil;
    return _items[index];
}
},["CPMenuItem","CPString"]), new objj_method(sel_getUid("itemAtIndex:"), function $CPMenu__itemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_items, "objectAtIndex:", anIndex);
}
},["CPMenuItem","int"]), new objj_method(sel_getUid("numberOfItems"), function $CPMenu__numberOfItems(self, _cmd)
{ with(self)
{
    return objj_msgSend(_items, "count");
}
},["unsigned"]), new objj_method(sel_getUid("itemArray"), function $CPMenu__itemArray(self, _cmd)
{ with(self)
{
    return _items;
}
},["CPArray"]), new objj_method(sel_getUid("indexOfItem:"), function $CPMenu__indexOfItem_(self, _cmd, aMenuItem)
{ with(self)
{
    if (objj_msgSend(aMenuItem, "menu") != self)
        return CPNotFound;
    return objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem);
}
},["int","CPMenuItem"]), new objj_method(sel_getUid("indexOfItemWithTitle:"), function $CPMenu__indexOfItemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "title") === aTitle)
            return index;
    return CPNotFound;
}
},["int","CPString"]), new objj_method(sel_getUid("indexOfItemWithTag:"), function $CPMenu__indexOfItemWithTag_(self, _cmd, aTag)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "tag") == aTag)
            return index;
    return CPNotFound;
}
},["int","int"]), new objj_method(sel_getUid("indexOfItemWithTarget:andAction:"), function $CPMenu__indexOfItemWithTarget_andAction_(self, _cmd, aTarget, anAction)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
    {
        var item = _items[index];
        if (objj_msgSend(item, "target") == aTarget && (!anAction || objj_msgSend(item, "action") == anAction))
            return index;
    }
    return CPNotFound;
}
},["int","id","SEL"]), new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"), function $CPMenu__indexOfItemWithRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(objj_msgSend(_items[index], "representedObject"), "isEqual:", anObject))
            return index;
    return CPNotFound;
}
},["int","id"]), new objj_method(sel_getUid("indexOfItemWithSubmenu:"), function $CPMenu__indexOfItemWithSubmenu_(self, _cmd, aMenu)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "submenu") == aMenu)
            return index;
    return CPNotFound;
}
},["int","CPMenu"]), new objj_method(sel_getUid("setSubmenu:forItem:"), function $CPMenu__setSubmenu_forItem_(self, _cmd, aMenu, aMenuItem)
{ with(self)
{
    objj_msgSend(aMenuItem, "setTarget:", aMenuItem);
    objj_msgSend(aMenuItem, "setAction:", sel_getUid("submenuAction:"));
    objj_msgSend(aMenuItem, "setSubmenu:", aMenu);
}
},["void","CPMenu","CPMenuItem"]), new objj_method(sel_getUid("submenuAction:"), function $CPMenu__submenuAction_(self, _cmd, aSender)
{ with(self)
{
}
},["void","id"]), new objj_method(sel_getUid("attachedMenu"), function $CPMenu__attachedMenu(self, _cmd)
{ with(self)
{
    return _attachedMenu;
}
},["CPMenu"]), new objj_method(sel_getUid("isAttached"), function $CPMenu__isAttached(self, _cmd)
{ with(self)
{
    return _isAttached;
}
},["BOOL"]), new objj_method(sel_getUid("locationOfSubmenu:"), function $CPMenu__locationOfSubmenu_(self, _cmd, aMenu)
{ with(self)
{
}
},["CGPoint","CPMenu"]), new objj_method(sel_getUid("supermenu"), function $CPMenu__supermenu(self, _cmd)
{ with(self)
{
    return _supermenu;
}
},["CPMenu"]), new objj_method(sel_getUid("setSupermenu:"), function $CPMenu__setSupermenu_(self, _cmd, aMenu)
{ with(self)
{
    _supermenu = aMenu;
}
},["void","CPMenu"]), new objj_method(sel_getUid("isTornOff"), function $CPMenu__isTornOff(self, _cmd)
{ with(self)
{
    return !_supermenu || self == objj_msgSend(CPApp, "mainMenu");
}
},["BOOL"]), new objj_method(sel_getUid("setAutoenablesItems:"), function $CPMenu__setAutoenablesItems_(self, _cmd, aFlag)
{ with(self)
{
    _autoenablesItems = aFlag;
}
},["void","BOOL"]), new objj_method(sel_getUid("autoenablesItems"), function $CPMenu__autoenablesItems(self, _cmd)
{ with(self)
{
    return _autoenablesItems;
}
},["BOOL"]), new objj_method(sel_getUid("update"), function $CPMenu__update(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("setTitle:"), function $CPMenu__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    _title = aTitle;
}
},["void","CPString"]), new objj_method(sel_getUid("title"), function $CPMenu__title(self, _cmd)
{ with(self)
{
    return _title;
}
},["CPString"]), new objj_method(sel_getUid("setShowsStateColumn:"), function $CPMenu__setShowsStateColumn_(self, _cmd, shouldShowStateColumn)
{ with(self)
{
    _showsStateColumn = shouldShowStateColumn;
}
},["void","BOOL"]), new objj_method(sel_getUid("showsStateColumn"), function $CPMenu__showsStateColumn(self, _cmd)
{ with(self)
{
    return _showsStateColumn;
}
},["BOOL"]), new objj_method(sel_getUid("highlightedItem"), function $CPMenu__highlightedItem(self, _cmd)
{ with(self)
{
    return _highlightedIndex >= 0 ? _items[_highlightedIndex] : nil;
}
},["CPMenuItem"]), new objj_method(sel_getUid("setDelegate:"), function $CPMenu__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $CPMenu__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("cancelTracking"), function $CPMenu__cancelTracking(self, _cmd)
{ with(self)
{
    objj_msgSend(_menuWindow, "cancelTracking");
}
},["void"]), new objj_method(sel_getUid("_setMenuWindow:"), function $CPMenu___setMenuWindow_(self, _cmd, aMenuWindow)
{ with(self)
{
    _menuWindow = aMenuWindow;
}
},["void","_CPMenuWindow"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $CPMenu__performKeyEquivalent_(self, _cmd, anEvent)
{ with(self)
{
    if (_autoenablesItems)
        objj_msgSend(self, "update");
    var index = 0,
        count = _items.length,
        characters = objj_msgSend(anEvent, "charactersIgnoringModifiers"),
        modifierFlags = objj_msgSend(anEvent, "modifierFlags");
    for(; index < count; ++index)
    {
        var item = _items[index],
            modifierMask = objj_msgSend(item, "keyEquivalentModifierMask");
        if ((modifierFlags & (CPShiftKeyMask | CPAlternateKeyMask | CPCommandKeyMask | CPControlKeyMask)) == modifierMask &&
            objj_msgSend(characters, "caseInsensitiveCompare:", objj_msgSend(item, "keyEquivalent")) == CPOrderedSame)
        {
            if (objj_msgSend(item, "isEnabled"))
                objj_msgSend(self, "performActionForItemAtIndex:", index);
            else
            {
            }
            return YES;
        }
        if (objj_msgSend(objj_msgSend(item, "submenu"), "performKeyEquivalent:", anEvent))
            return YES;
   }
   return NO;
}
},["BOOL","CPEvent"]), new objj_method(sel_getUid("performActionForItemAtIndex:"), function $CPMenu__performActionForItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    var item = _items[anIndex];
    objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(item, "action"), objj_msgSend(item, "target"), item);
}
},["void","unsigned"]), new objj_method(sel_getUid("_itemIsHighlighted:"), function $CPMenu___itemIsHighlighted_(self, _cmd, aMenuItem)
{ with(self)
{
    return _items[_highlightedIndex] == aMenuItem;
}
},["BOOL","CPMenuItem"]), new objj_method(sel_getUid("_highlightItemAtIndex:"), function $CPMenu___highlightItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    var previousHighlightedIndex = _highlightedIndex;
    _highlightedIndex = anIndex;
    if (previousHighlightedIndex != CPNotFound)
        objj_msgSend(objj_msgSend(_items[previousHighlightedIndex], "_menuItemView"), "highlight:", NO);
    if (_highlightedIndex != CPNotFound)
        objj_msgSend(objj_msgSend(_items[_highlightedIndex], "_menuItemView"), "highlight:", YES);
}
},["void","int"]), new objj_method(sel_getUid("_setMenuName:"), function $CPMenu___setMenuName_(self, _cmd, aName)
{ with(self)
{
    if (_name === aName)
        return;
    _name = aName;
    if (_name === "CPMainMenu")
        objj_msgSend(CPApp, "setMainMenu:", self);
}
},["void","CPString"]), new objj_method(sel_getUid("_menuName"), function $CPMenu___menuName(self, _cmd)
{ with(self)
{
    return _name;
}
},["CPString"]), new objj_method(sel_getUid("awakeFromCib"), function $CPMenu__awakeFromCib(self, _cmd)
{ with(self)
{
    if (_name === "_CPMainMenu")
    {
        objj_msgSend(self, "_setMenuName:", "CPMainMenu");
        objj_msgSend(CPMenu, "setMenuBarVisible:", YES);
    }
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPMenu__initialize(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "class"), "setMenuBarAttributes:", objj_msgSend(CPDictionary, "dictionary"));
}
},["void"]), new objj_method(sel_getUid("menuBarVisible"), function $CPMenu__menuBarVisible(self, _cmd)
{ with(self)
{
    return _CPMenuBarVisible;
}
},["BOOL"]), new objj_method(sel_getUid("setMenuBarVisible:"), function $CPMenu__setMenuBarVisible_(self, _cmd, menuBarShouldBeVisible)
{ with(self)
{
    if (_CPMenuBarVisible == menuBarShouldBeVisible)
        return;
    _CPMenuBarVisible = menuBarShouldBeVisible;
    if (objj_msgSend(CPPlatform, "supportsNativeMainMenu"))
        return;
    if (menuBarShouldBeVisible)
    {
        if (!_CPMenuBarSharedWindow)
            _CPMenuBarSharedWindow = objj_msgSend(objj_msgSend(_CPMenuBarWindow, "alloc"), "init");
        objj_msgSend(_CPMenuBarSharedWindow, "setMenu:", objj_msgSend(CPApp, "mainMenu"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitle:", _CPMenuBarTitle);
        objj_msgSend(_CPMenuBarSharedWindow, "setIconImage:", _CPMenuBarIconImage);
        objj_msgSend(_CPMenuBarSharedWindow, "setIconImageAlphaValue:", _CPMenuBarIconImageAlphaValue);
        objj_msgSend(_CPMenuBarSharedWindow, "setColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarBackgroundColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextShadowColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleShadowColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightTextShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextShadowColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "orderFront:", self);
    }
    else
        objj_msgSend(_CPMenuBarSharedWindow, "orderOut:", self);
}
},["void","BOOL"]), new objj_method(sel_getUid("setMenuBarTitle:"), function $CPMenu__setMenuBarTitle_(self, _cmd, aTitle)
{ with(self)
{
    _CPMenuBarTitle = aTitle;
    objj_msgSend(_CPMenuBarSharedWindow, "setTitle:", _CPMenuBarTitle);
}
},["void","CPString"]), new objj_method(sel_getUid("menuBarTitle"), function $CPMenu__menuBarTitle(self, _cmd)
{ with(self)
{
    return _CPMenuBarTitle;
}
},["CPString"]), new objj_method(sel_getUid("setMenuBarIconImage:"), function $CPMenu__setMenuBarIconImage_(self, _cmd, anImage)
{ with(self)
{
    _CPMenuBarImage = anImage;
    objj_msgSend(_CPMenuBarSharedWindow, "setIconImage:", anImage);
}
},["void","CPImage"]), new objj_method(sel_getUid("menuBarIconImage"), function $CPMenu__menuBarIconImage(self, _cmd)
{ with(self)
{
    return _CPMenuBarImage;
}
},["CPImage"]), new objj_method(sel_getUid("setMenuBarAttributes:"), function $CPMenu__setMenuBarAttributes_(self, _cmd, attributes)
{ with(self)
{
    if (_CPMenuBarAttributes == attributes)
        return;
    _CPMenuBarAttributes = objj_msgSend(attributes, "copy");
    var textColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTextColor"),
        titleColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTitleColor"),
        textShadowColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTextShadowColor"),
        titleShadowColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTitleShadowColor"),
        highlightColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarHighlightColor"),
        highlightTextColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarHighlightTextColor"),
        highlightTextShadowColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarHighlightTextShadowColor");
    if (!textColor && titleColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", titleColor, "CPMenuBarTextColor");
    else if (textColor && !titleColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", textColor, "CPMenuBarTitleColor");
    else if (!textColor && !titleColor)
    {
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", 0.051, 0.2, 0.275, 1.0), "CPMenuBarTextColor");
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", 0.051, 0.2, 0.275, 1.0), "CPMenuBarTitleColor");
    }
    if (!textShadowColor && titleShadowColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", titleShadowColor, "CPMenuBarTextShadowColor");
    else if (textShadowColor && !titleShadowColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", textShadowColor, "CPMenuBarTitleShadowColor");
    else if (!textShadowColor && !titleShadowColor)
    {
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", objj_msgSend(CPColor, "whiteColor"), "CPMenuBarTextShadowColor");
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", objj_msgSend(CPColor, "whiteColor"), "CPMenuBarTitleShadowColor");
    }
    if (!highlightColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 94.0/255.0, 130.0/255.0, 186.0/255.0, 1.0), "CPMenuBarHighlightColor");
    if (!highlightTextColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", objj_msgSend(CPColor, "whiteColor"), "CPMenuBarHighlightTextColor");
    if (!highlightTextShadowColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", objj_msgSend(CPColor, "blackColor"), "CPMenuBarHighlightTextShadowColor");
    if (_CPMenuBarSharedWindow)
    {
        objj_msgSend(_CPMenuBarSharedWindow, "setColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarBackgroundColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextShadowColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleShadowColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setHighlightTextShadowColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarHighlightTextShadowColor"));
    }
}
},["void","CPDictionary"]), new objj_method(sel_getUid("menuBarAttributes"), function $CPMenu__menuBarAttributes(self, _cmd)
{ with(self)
{
    return _CPMenuBarAttributes;
}
},["CPDictionary"]), new objj_method(sel_getUid("_setMenuBarIconImageAlphaValue:"), function $CPMenu___setMenuBarIconImageAlphaValue_(self, _cmd, anAlphaValue)
{ with(self)
{
    _CPMenuBarIconImageAlphaValue = anAlphaValue;
    objj_msgSend(_CPMenuBarSharedWindow, "setIconImageAlphaValue:", anAlphaValue);
}
},["void","float"]), new objj_method(sel_getUid("menuBarHeight"), function $CPMenu__menuBarHeight(self, _cmd)
{ with(self)
{
    return MENUBAR_HEIGHT;
}
},["float"]), new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:"), function $CPMenu__popUpContextMenu_withEvent_forView_(self, _cmd, aMenu, anEvent, aView)
{ with(self)
{
    objj_msgSend(self, "popUpContextMenu:withEvent:forView:withFont:", aMenu, anEvent, aView, nil);
}
},["void","CPMenu","CPEvent","CPView"]), new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:withFont:"), function $CPMenu__popUpContextMenu_withEvent_forView_withFont_(self, _cmd, aMenu, anEvent, aView, aFont)
{ with(self)
{
    objj_msgSend(self, "_popUpContextMenu:withEvent:forView:withFont:forMenuBar:", aMenu, anEvent, aView, aFont, NO);
}
},["void","CPMenu","CPEvent","CPView","CPFont"]), new objj_method(sel_getUid("_popUpContextMenu:withEvent:forView:withFont:forMenuBar:"), function $CPMenu___popUpContextMenu_withEvent_forView_withFont_forMenuBar_(self, _cmd, aMenu, anEvent, aView, aFont, isForMenuBar)
{ with(self)
{
    var delegate = objj_msgSend(aMenu, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("menuWillOpen:")))
        objj_msgSend(delegate, "menuWillOpen:", aMenu);
    if (!aFont)
        aFont = objj_msgSend(CPFont, "systemFontOfSize:", 12.0);
    var theWindow = objj_msgSend(aView, "window"),
        menuWindow = objj_msgSend(_CPMenuWindow, "menuWindowWithMenu:font:", aMenu, aFont);
    objj_msgSend(menuWindow, "setDelegate:", self);
    objj_msgSend(menuWindow, "setBackgroundStyle:", isForMenuBar ? _CPMenuWindowMenuBarBackgroundStyle : _CPMenuWindowPopUpBackgroundStyle);
    objj_msgSend(menuWindow, "setFrameOrigin:", objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToGlobal:", objj_msgSend(anEvent, "locationInWindow")));
    objj_msgSend(menuWindow, "orderFront:", self);
    objj_msgSend(menuWindow, "beginTrackingWithEvent:sessionDelegate:didEndSelector:", anEvent, self, sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"));
}
},["void","CPMenu","CPEvent","CPView","CPFont","BOOL"]), new objj_method(sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"), function $CPMenu___menuWindowDidFinishTracking_highlightedItem_(self, _cmd, aMenuWindow, aMenuItem)
{ with(self)
{
    var menu = objj_msgSend(aMenuWindow, "menu");
    objj_msgSend(_CPMenuWindow, "poolMenuWindow:", aMenuWindow);
    if(objj_msgSend(aMenuItem, "isEnabled"))
        objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(aMenuItem, "action"), objj_msgSend(aMenuItem, "target"), aMenuItem);
}
},["void","_CPMenuWindow","CPMenuItem"])]);
}
var CPMenuTitleKey = "CPMenuTitleKey",
    CPMenuNameKey = "CPMenuNameKey",
    CPMenuItemsKey = "CPMenuItemsKey",
    CPMenuShowsStateColumnKey = "CPMenuShowsStateColumnKey";
{
var the_class = objj_getClass("CPMenu")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPMenu\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPMenu__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _title = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuTitleKey);
        _items = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemsKey);
        objj_msgSend(self, "_setMenuName:", objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuNameKey));
        _showsStateColumn = !objj_msgSend(aCoder, "containsValueForKey:", CPMenuShowsStateColumnKey) || objj_msgSend(aCoder, "decodeBoolForKey:", CPMenuShowsStateColumnKey);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPMenu__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPMenuTitleKey);
    if (_name)
        objj_msgSend(aCoder, "encodeObject:forKey:", _name, CPMenuNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _items, CPMenuItemsKey);
    if (!_showsStateColumn)
        objj_msgSend(aCoder, "encodeBool:forKey:", _showsStateColumn, CPMenuShowsStateColumnKey);
}
},["void","CPCoder"])]);
}
var _CPMenuWindowPool = [],
    _CPMenuWindowPoolCapacity = 5,
    _CPMenuWindowBackgroundColors = [],
    _CPMenuWindowScrollingStateUp = -1,
    _CPMenuWindowScrollingStateDown = 1,
    _CPMenuWindowScrollingStateNone = 0;
_CPMenuWindowMenuBarBackgroundStyle = 0;
_CPMenuWindowPopUpBackgroundStyle = 1;
_CPMenuWindowAttachedMenuBackgroundStyle = 2;
var STICKY_TIME_INTERVAL = 500,
    TOP_MARGIN = 5.0,
    LEFT_MARGIN = 1.0,
    RIGHT_MARGIN = 1.0,
    BOTTOM_MARGIN = 5.0,
    SCROLL_INDICATOR_HEIGHT = 16.0;
{var the_class = objj_allocateClassPair(CPWindow, "_CPMenuWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuView"), new objj_ivar("_menuClipView"), new objj_ivar("_lastMouseOverMenuView"), new objj_ivar("_moreAboveView"), new objj_ivar("_moreBelowView"), new objj_ivar("_sessionDelegate"), new objj_ivar("_didEndSelector"), new objj_ivar("_startTime"), new objj_ivar("_scrollingState"), new objj_ivar("_lastGlobalLocation"), new objj_ivar("_isShowingTopScrollIndicator"), new objj_ivar("_isShowingBottomScrollIndicator"), new objj_ivar("_trackingCanceled"), new objj_ivar("_unconstrainedFrame")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPMenuWindow__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow") }, "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessWindowMask);
    if (self)
    {
        objj_msgSend(self, "setLevel:", CPPopUpMenuWindowLevel);
        objj_msgSend(self, "setHasShadow:", YES);
        objj_msgSend(self, "setAcceptsMouseMovedEvents:", YES);
        _unconstrainedFrame = CGRectMakeZero();
        var contentView = objj_msgSend(self, "contentView");
        _menuView = objj_msgSend(objj_msgSend(_CPMenuView, "alloc"), "initWithFrame:", CGRectMakeZero());
        _menuClipView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "initWithFrame:", CGRectMake(LEFT_MARGIN, TOP_MARGIN, 0.0, 0.0));
        objj_msgSend(_menuClipView, "setDocumentView:", _menuView);
        objj_msgSend(contentView, "addSubview:", _menuClipView);
        _moreAboveView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_moreAboveView, "setImage:", _CPMenuWindowMoreAboveImage);
        objj_msgSend(_moreAboveView, "setFrameSize:", objj_msgSend(_CPMenuWindowMoreAboveImage, "size"));
        objj_msgSend(contentView, "addSubview:", _moreAboveView);
        _moreBelowView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_moreBelowView, "setImage:", _CPMenuWindowMoreBelowImage);
        objj_msgSend(_moreBelowView, "setFrameSize:", objj_msgSend(_CPMenuWindowMoreBelowImage, "size"));
        objj_msgSend(contentView, "addSubview:", _moreBelowView);
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("overlapOffsetWidth"), function $_CPMenuWindow__overlapOffsetWidth(self, _cmd)
{ with(self)
{
    return LEFT_MARGIN;
}
},["CGFloat"]), new objj_method(sel_getUid("setFont:"), function $_CPMenuWindow__setFont_(self, _cmd, aFont)
{ with(self)
{
    objj_msgSend(_menuView, "setFont:", aFont);
}
},["void","CPFont"]), new objj_method(sel_getUid("setBackgroundStyle:"), function $_CPMenuWindow__setBackgroundStyle_(self, _cmd, aBackgroundStyle)
{ with(self)
{
    var color = _CPMenuWindowBackgroundColors[aBackgroundStyle];
    if (!color)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
        if (aBackgroundStyle == _CPMenuWindowPopUpBackgroundStyle)
            color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
                [
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded0.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow1.png"), CGSizeMake(1.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded2.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded6.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow7.png"), CGSizeMake(1.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded8.png"), CGSizeMake(4.0, 4.0))
                ]));
        else if (aBackgroundStyle == _CPMenuWindowMenuBarBackgroundStyle)
            color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
                [
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0, 0.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0, 0.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0, 0.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded6.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow7.png"), CGSizeMake(1.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded8.png"), CGSizeMake(4.0, 4.0))
                ]));
        _CPMenuWindowBackgroundColors[aBackgroundStyle] = color;
    }
    objj_msgSend(self, "setBackgroundColor:", color);
}
},["void","_CPMenuWindowBackgroundStyle"]), new objj_method(sel_getUid("setMenu:"), function $_CPMenuWindow__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    objj_msgSend(aMenu, "_setMenuWindow:", self);
    objj_msgSend(_menuView, "setMenu:", aMenu);
    var menuViewSize = objj_msgSend(_menuView, "frame").size;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(LEFT_MARGIN + menuViewSize.width + RIGHT_MARGIN, TOP_MARGIN + menuViewSize.height + BOTTOM_MARGIN));
    objj_msgSend(_menuView, "scrollPoint:", CGPointMake(0.0, 0.0));
    objj_msgSend(_menuClipView, "setFrame:", CGRectMake(LEFT_MARGIN, TOP_MARGIN, menuViewSize.width, menuViewSize.height));
}
},["void","CPMenu"]), new objj_method(sel_getUid("setMinWidth:"), function $_CPMenuWindow__setMinWidth_(self, _cmd, aWidth)
{ with(self)
{
    var size = objj_msgSend(self, "frame").size;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(MAX(size.width, aWidth), size.height));
}
},["void","float"]), new objj_method(sel_getUid("rectForItemAtIndex:"), function $_CPMenuWindow__rectForItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menuView, "convertRect:toView:", objj_msgSend(_menuView, "rectForItemAtIndex:", anIndex), nil);
}
},["CGPoint","int"]), new objj_method(sel_getUid("orderFront:"), function $_CPMenuWindow__orderFront_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "constrainToScreen");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow") }, "orderFront:", aSender);
}
},["void","id"]), new objj_method(sel_getUid("constrainToScreen"), function $_CPMenuWindow__constrainToScreen(self, _cmd)
{ with(self)
{
    _unconstrainedFrame = CGRectMakeCopy(objj_msgSend(self, "frame"));
    var isBrowser = objj_msgSend(CPPlatform, "isBrowser"),
        visibleFrame = CGRectInset(isBrowser ? objj_msgSend(objj_msgSend(self, "platformWindow"), "contentBounds") : objj_msgSend(objj_msgSend(self, "screen"), "visibleFrame"), 5.0, 5.0),
        constrainedFrame = CGRectIntersection(_unconstrainedFrame, visibleFrame);
    constrainedFrame.origin.x = CGRectGetMinX(_unconstrainedFrame);
    constrainedFrame.size.width = CGRectGetWidth(_unconstrainedFrame);
    if (CGRectGetWidth(constrainedFrame) > CGRectGetWidth(visibleFrame))
        constrainedFrame.size.width = CGRectGetWidth(visibleFrame);
    if (CGRectGetMaxX(constrainedFrame) > CGRectGetMaxX(visibleFrame))
        constrainedFrame.origin.x -= CGRectGetMaxX(constrainedFrame) - CGRectGetMaxX(visibleFrame);
    if (CGRectGetMinX(constrainedFrame) < CGRectGetMinX(visibleFrame))
        constrainedFrame.origin.x = CGRectGetMinX(visibleFrame);
    var menuViewOrigin = objj_msgSend(self, "convertBaseToGlobal:", CGPointMake(LEFT_MARGIN, TOP_MARGIN));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow") }, "setFrame:", constrainedFrame);
    var moreAbove = menuViewOrigin.y < CGRectGetMinY(constrainedFrame) + TOP_MARGIN,
        moreBelow = menuViewOrigin.y + CGRectGetHeight(objj_msgSend(_menuView, "frame")) > CGRectGetMaxY(constrainedFrame) - BOTTOM_MARGIN,
        topMargin = TOP_MARGIN,
        bottomMargin = BOTTOM_MARGIN,
        contentView = objj_msgSend(self, "contentView"),
        bounds = objj_msgSend(contentView, "bounds");
    if (moreAbove)
    {
        topMargin += SCROLL_INDICATOR_HEIGHT;
        var frame = objj_msgSend(_moreAboveView, "frame");
        objj_msgSend(_moreAboveView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(frame)) / 2.0, (TOP_MARGIN + SCROLL_INDICATOR_HEIGHT - CGRectGetHeight(frame)) / 2.0));
    }
    objj_msgSend(_moreAboveView, "setHidden:", !moreAbove);
    if (moreBelow)
    {
        bottomMargin += SCROLL_INDICATOR_HEIGHT;
        objj_msgSend(_moreBelowView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(objj_msgSend(_moreBelowView, "frame"))) / 2.0, CGRectGetHeight(bounds) - SCROLL_INDICATOR_HEIGHT - BOTTOM_MARGIN));
    }
    objj_msgSend(_moreBelowView, "setHidden:", !moreBelow);
    var clipFrame = CGRectMake(LEFT_MARGIN, topMargin, CGRectGetWidth(constrainedFrame) - LEFT_MARGIN - RIGHT_MARGIN, CGRectGetHeight(constrainedFrame) - topMargin - bottomMargin)
    objj_msgSend(_menuClipView, "setFrame:", clipFrame);
    objj_msgSend(_menuView, "setFrameSize:", CGSizeMake(CGRectGetWidth(clipFrame), CGRectGetHeight(objj_msgSend(_menuView, "frame"))));
    objj_msgSend(_menuView, "scrollPoint:", CGPointMake(0.0, objj_msgSend(self, "convertBaseToGlobal:", clipFrame.origin).y - menuViewOrigin.y));
}
},["void"]), new objj_method(sel_getUid("cancelTracking"), function $_CPMenuWindow__cancelTracking(self, _cmd)
{ with(self)
{
    _trackingCanceled = YES;
}
},["void"]), new objj_method(sel_getUid("beginTrackingWithEvent:sessionDelegate:didEndSelector:"), function $_CPMenuWindow__beginTrackingWithEvent_sessionDelegate_didEndSelector_(self, _cmd, anEvent, aSessionDelegate, aDidEndSelector)
{ with(self)
{
    _startTime = objj_msgSend(anEvent, "timestamp");
    _scrollingState = _CPMenuWindowScrollingStateNone;
    _trackingCanceled = NO;
    _sessionDelegate = aSessionDelegate;
    _didEndSelector = aDidEndSelector;
    objj_msgSend(self, "trackEvent:", anEvent);
}
},["void","CPEvent","id","SEL"]), new objj_method(sel_getUid("trackEvent:"), function $_CPMenuWindow__trackEvent_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        theWindow = objj_msgSend(anEvent, "window"),
        globalLocation = theWindow ? objj_msgSend(theWindow, "convertBaseToGlobal:", objj_msgSend(anEvent, "locationInWindow")) : objj_msgSend(anEvent, "locationInWindow");
    if (type === CPPeriodic)
    {
        var constrainedBounds = CGRectInset(objj_msgSend(CPPlatform, "isBrowser") ? objj_msgSend(objj_msgSend(self, "platformWindow"), "contentBounds") : objj_msgSend(objj_msgSend(self, "screen"), "visibleFrame"), 5.0, 5.0);
        if (_scrollingState == _CPMenuWindowScrollingStateUp)
        {
            if (CGRectGetMinY(_unconstrainedFrame) < CGRectGetMinY(constrainedBounds))
                _unconstrainedFrame.origin.y += 10;
        }
        else if (_scrollingState == _CPMenuWindowScrollingStateDown)
            if (CGRectGetMaxY(_unconstrainedFrame) > CGRectGetHeight(constrainedBounds))
                _unconstrainedFrame.origin.y -= 10;
        objj_msgSend(self, "setFrame:", _unconstrainedFrame);
        objj_msgSend(self, "constrainToScreen");
        globalLocation = _lastGlobalLocation;
    }
    _lastGlobalLocation = globalLocation;
    var menu = objj_msgSend(_menuView, "menu"),
        menuLocation = objj_msgSend(self, "convertGlobalToBase:", globalLocation),
        activeItemIndex = objj_msgSend(_menuView, "itemIndexAtPoint:", objj_msgSend(_menuView, "convertPoint:fromView:", menuLocation, nil)),
        mouseOverMenuView = objj_msgSend(objj_msgSend(menu, "itemAtIndex:", activeItemIndex), "view");
    if (mouseOverMenuView)
    {
        if (!_lastMouseOverMenuView)
            objj_msgSend(menu, "_highlightItemAtIndex:", CPNotFound);
        if (_lastMouseOverMenuView != mouseOverMenuView)
        {
            objj_msgSend(mouseOverMenuView, "mouseExited:", anEvent);
            objj_msgSend(_lastMouseOverMenuView, "mouseEntered:", anEvent);
            _lastMouseOverMenuView = mouseOverMenuView;
        }
        objj_msgSend(self, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", type, menuLocation, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), objj_msgSend(self, "windowNumber"), nil, 0, objj_msgSend(anEvent, "clickCount"), objj_msgSend(anEvent, "pressure")));
    }
    else
    {
        if (_lastMouseOverMenuView)
        {
            objj_msgSend(_lastMouseOverMenuView, "mouseExited:", anEvent);
            _lastMouseOverMenuView = nil;
        }
        objj_msgSend(menu, "_highlightItemAtIndex:", objj_msgSend(_menuView, "itemIndexAtPoint:", objj_msgSend(_menuView, "convertPoint:fromView:", objj_msgSend(self, "convertGlobalToBase:", globalLocation), nil)));
        if (type == CPMouseMoved || type == CPLeftMouseDragged || type == CPLeftMouseDown)
        {
            var frame = objj_msgSend(self, "frame"),
                oldScrollingState = _scrollingState;
            _scrollingState = _CPMenuWindowScrollingStateNone;
            if (globalLocation.y < CGRectGetMinY(frame) + TOP_MARGIN + SCROLL_INDICATOR_HEIGHT)
                _scrollingState = _CPMenuWindowScrollingStateUp;
            else if (globalLocation.y > CGRectGetMaxY(frame) - BOTTOM_MARGIN - SCROLL_INDICATOR_HEIGHT)
                _scrollingState = _CPMenuWindowScrollingStateDown;
            if (_scrollingState != oldScrollingState)
                if (_scrollingState == _CPMenuWindowScrollingStateNone)
                    objj_msgSend(CPEvent, "stopPeriodicEvents");
                else if (oldScrollingState == _CPMenuWindowScrollingStateNone)
                    objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.0, 0.04);
        }
        else if (type == CPLeftMouseUp && (objj_msgSend(anEvent, "timestamp") - _startTime > STICKY_TIME_INTERVAL))
        {
            if (_scrollingState != _CPMenuWindowScrollingStateNone)
                objj_msgSend(CPEvent, "stopPeriodicEvents");
            objj_msgSend(self, "cancelTracking");
        }
    }
    if (_trackingCanceled)
    {
        objj_msgSend(CPEvent, "stopPeriodicEvents");
        var highlightedItem = objj_msgSend(objj_msgSend(_menuView, "menu"), "highlightedItem");
        objj_msgSend(menu, "_highlightItemAtIndex:", CPNotFound);
        objj_msgSend(self, "orderOut:", self);
        var delegate = objj_msgSend(menu, "delegate");
        if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("menuDidClose:")))
            objj_msgSend(delegate, "menuDidClose:", menu);
        if (_sessionDelegate && _didEndSelector)
            objj_msgSend(_sessionDelegate, _didEndSelector, self, highlightedItem);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPMenuDidEndTrackingNotification, menu);
        objj_msgSend(_menuView, "setMenu:", nil);
        return;
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackEvent:"), CPPeriodicMask | CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
},["void","CPEvent"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("menuWindowWithMenu:font:"), function $_CPMenuWindow__menuWindowWithMenu_font_(self, _cmd, aMenu, aFont)
{ with(self)
{
    var menuWindow = nil;
    if (_CPMenuWindowPool.length)
        menuWindow = _CPMenuWindowPool.pop();
    else
        menuWindow = objj_msgSend(objj_msgSend(_CPMenuWindow, "alloc"), "init");
    objj_msgSend(menuWindow, "setFont:", aFont);
    objj_msgSend(menuWindow, "setMenu:", aMenu);
    return menuWindow;
}
},["id","CPMenu","CPFont"]), new objj_method(sel_getUid("poolMenuWindow:"), function $_CPMenuWindow__poolMenuWindow_(self, _cmd, aMenuWindow)
{ with(self)
{
    if (!aMenuWindow || _CPMenuWindowPool.length >= _CPMenuWindowPoolCapacity)
        return;
    _CPMenuWindowPool.push(aMenuWindow);
}
},["void","_CPMenuWindow"]), new objj_method(sel_getUid("initialize"), function $_CPMenuWindow__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuWindowMoreAboveImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowMoreAbove.png"), CGSizeMake(38.0, 18.0));
    _CPMenuWindowMoreBelowImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowMoreBelow.png"), CGSizeMake(38.0, 18.0));
}
},["void"])]);
}
{var the_class = objj_allocateClassPair(CPView, "_CPMenuView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuItemViews"), new objj_ivar("_visibleMenuItemInfos"), new objj_ivar("_font")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setFont:"), function $_CPMenuView__setFont_(self, _cmd, aFont)
{ with(self)
{
    _font = aFont;
}
},["void","CPFont"]), new objj_method(sel_getUid("rectForItemAtIndex:"), function $_CPMenuView__rectForItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menuItemViews[anIndex == CPNotFound ? 0 : anIndex], "frame");
}
},["CGRect","int"]), new objj_method(sel_getUid("itemIndexAtPoint:"), function $_CPMenuView__itemIndexAtPoint_(self, _cmd, aPoint)
{ with(self)
{
    var x = aPoint.x,
        bounds = objj_msgSend(self, "bounds");
    if (x < CGRectGetMinX(bounds) || x > CGRectGetMaxX(bounds))
        return CPNotFound;
    var y = aPoint.y,
        low = 0,
        high = _visibleMenuItemInfos.length - 1;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            info = _visibleMenuItemInfos[middle]
            frame = objj_msgSend(info.view, "frame");
        if (y < CGRectGetMinY(frame))
            high = middle - 1;
        else if (y > CGRectGetMaxY(frame))
            low = middle + 1;
        else
            return info.index;
   }
   return CPNotFound;
}
},["int","CGPoint"]), new objj_method(sel_getUid("setMenu:"), function $_CPMenuView__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setMenu:", aMenu);
    objj_msgSend(_menuItemViews, "makeObjectsPerformSelector:", sel_getUid("removeFromSuperview"));
    _menuItemViews = [];
    _visibleMenuItemInfos = [];
    var menu = objj_msgSend(self, "menu");
    if (!menu)
        return;
    var items = objj_msgSend(menu, "itemArray"),
        index = 0,
        count = objj_msgSend(items, "count"),
        maxWidth = 0,
        y = 0,
        showsStateColumn = objj_msgSend(menu, "showsStateColumn");
    for (; index < count; ++index)
    {
        var item = items[index],
            view = objj_msgSend(item, "_menuItemView");
        _menuItemViews.push(view);
        if (objj_msgSend(item, "isHidden"))
            continue;
        _visibleMenuItemInfos.push({ view:view, index:index });
        objj_msgSend(view, "setFont:", _font);
        objj_msgSend(view, "setShowsStateColumn:", showsStateColumn);
        objj_msgSend(view, "synchronizeWithMenuItem");
        objj_msgSend(view, "setFrameOrigin:", CGPointMake(0.0, y));
        objj_msgSend(self, "addSubview:", view);
        var size = objj_msgSend(view, "minSize"),
            width = size.width;
        if (maxWidth < width)
            maxWidth = width;
        y += size.height;
    }
    for (index = 0; index < count; ++index)
    {
        var view = _menuItemViews[index];
        objj_msgSend(view, "setFrameSize:", CGSizeMake(maxWidth, CGRectGetHeight(objj_msgSend(view, "frame"))));
    }
    objj_msgSend(self, "setAutoresizesSubviews:", NO);
    objj_msgSend(self, "setFrameSize:", CGSizeMake(maxWidth, y));
    objj_msgSend(self, "setAutoresizesSubviews:", YES);
}
},["void","CPMenu"])]);
}
var MENUBAR_HEIGHT = 29.0,
    MENUBAR_MARGIN = 10.0,
    MENUBAR_LEFT_MARGIN = 10.0,
    MENUBAR_RIGHT_MARGIN = 10.0;
var _CPMenuBarWindowBackgroundColor = nil,
    _CPMenuBarWindowFont = nil;
{var the_class = objj_allocateClassPair(CPPanel, "_CPMenuBarWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menu"), new objj_ivar("_highlightView"), new objj_ivar("_menuItemViews"), new objj_ivar("_trackingMenuItem"), new objj_ivar("_iconImageView"), new objj_ivar("_titleField"), new objj_ivar("_textColor"), new objj_ivar("_titleColor"), new objj_ivar("_textShadowColor"), new objj_ivar("_titleShadowColor"), new objj_ivar("_highlightColor"), new objj_ivar("_highlightTextColor"), new objj_ivar("_highlightTextShadowColor")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPMenuBarWindow__init(self, _cmd)
{ with(self)
{
    var contentRect = objj_msgSend(CPPlatform, "isBrowser") ? objj_msgSend(objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"), "contentBounds") : objj_msgSend(objj_msgSend(self, "screen"), "visibleFrame");
    contentRect.size.height = MENUBAR_HEIGHT;
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "initWithContentRect:styleMask:", contentRect, CPBorderlessWindowMask);
    if (self)
    {
        objj_msgSend(self, "setLevel:", -1);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowWidthSizable);
        var contentView = objj_msgSend(self, "contentView");
        objj_msgSend(contentView, "setAutoresizesSubviews:", NO);
        objj_msgSend(self, "setBecomesKeyOnlyIfNeeded:", YES);
        _iconImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 16.0, 16.0));
        objj_msgSend(contentView, "addSubview:", _iconImageView);
        _titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_titleField, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12.0));
        objj_msgSend(_titleField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(_titleField, "setTextShadowOffset:", CGSizeMake(0, 1));
        objj_msgSend(contentView, "addSubview:", _titleField);
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("setTitle:"), function $_CPMenuBarWindow__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_titleField, "setStringValue:", aTitle);
    objj_msgSend(_titleField, "sizeToFit");
    objj_msgSend(self, "tile");
}
},["void","CPString"]), new objj_method(sel_getUid("setIconImage:"), function $_CPMenuBarWindow__setIconImage_(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(_iconImageView, "setImage:", anImage);
    objj_msgSend(_iconImageView, "setHidden:", anImage == nil);
    objj_msgSend(self, "tile");
}
},["void","CPImage"]), new objj_method(sel_getUid("setIconImageAlphaValue:"), function $_CPMenuBarWindow__setIconImageAlphaValue_(self, _cmd, anAlphaValue)
{ with(self)
{
    objj_msgSend(_iconImageView, "setAlphaValue:", anAlphaValue);
}
},["void","float"]), new objj_method(sel_getUid("setColor:"), function $_CPMenuBarWindow__setColor_(self, _cmd, aColor)
{ with(self)
{
    if (!aColor)
    {
        if (!_CPMenuBarWindowBackgroundColor)
            _CPMenuBarWindowBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_CPMenuBarWindow, "class")), "pathForResource:", "_CPMenuBarWindow/_CPMenuBarWindowBackground.png"), CGSizeMake(1.0, 18.0)));
        objj_msgSend(objj_msgSend(self, "contentView"), "setBackgroundColor:", _CPMenuBarWindowBackgroundColor);
    }
    else
        objj_msgSend(objj_msgSend(self, "contentView"), "setBackgroundColor:", aColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("setTextColor:"), function $_CPMenuBarWindow__setTextColor_(self, _cmd, aColor)
{ with(self)
{
    if (_textColor == aColor)
        return;
    _textColor = aColor;
    objj_msgSend(_menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setTextColor:"), _textColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("setTitleColor:"), function $_CPMenuBarWindow__setTitleColor_(self, _cmd, aColor)
{ with(self)
{
    if (_titleColor == aColor)
        return;
    _titleColor = aColor;
    objj_msgSend(_titleField, "setTextColor:", aColor ? aColor : objj_msgSend(CPColor, "blackColor"));
}
},["void","CPColor"]), new objj_method(sel_getUid("setTextShadowColor:"), function $_CPMenuBarWindow__setTextShadowColor_(self, _cmd, aColor)
{ with(self)
{
    if (_textShadowColor == aColor)
        return;
    _textShadowColor = aColor;
    objj_msgSend(_menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setTextShadowColor:"), _textShadowColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("setTitleShadowColor:"), function $_CPMenuBarWindow__setTitleShadowColor_(self, _cmd, aColor)
{ with(self)
{
    if (_titleShadowColor == aColor)
        return;
    _titleShadowColor = aColor;
    objj_msgSend(_titleField, "setTextShadowColor:", aColor ? aColor : objj_msgSend(CPColor, "whiteColor"));
}
},["void","CPColor"]), new objj_method(sel_getUid("setHighlightColor:"), function $_CPMenuBarWindow__setHighlightColor_(self, _cmd, aColor)
{ with(self)
{
    if (_highlightColor == aColor)
        return;
    _highlightColor = aColor;
}
},["void","CPColor"]), new objj_method(sel_getUid("setHighlightTextColor:"), function $_CPMenuBarWindow__setHighlightTextColor_(self, _cmd, aColor)
{ with(self)
{
    if (_highlightTextColor == aColor)
        return;
    _highlightTextColor = aColor;
    objj_msgSend(_menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setActivateColor:"), _highlightTextColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("setHighlightTextShadowColor:"), function $_CPMenuBarWindow__setHighlightTextShadowColor_(self, _cmd, aColor)
{ with(self)
{
    if (_highlightTextShadowColor == aColor)
        return;
    _highlightTextShadowColor = aColor;
    objj_msgSend(_menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setActivateShadowColor:"), _highlightTextShadowColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("setMenu:"), function $_CPMenuBarWindow__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    if (_menu == aMenu)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_menu)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidRemoveItemNotification, _menu);
        var items = objj_msgSend(_menu, "itemArray"),
            count = items.length;
        while (count--)
            objj_msgSend(objj_msgSend(items[count], "_menuItemView"), "removeFromSuperview");
    }
    _menu = aMenu;
    if (_menu)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidAddItem:"), CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidChangeItem:"), CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidRemoveItem:"), CPMenuDidRemoveItemNotification, _menu);
    }
    _menuItemViews = [];
    var contentView = objj_msgSend(self, "contentView"),
        items = objj_msgSend(_menu, "itemArray"),
        count = items.length;
    for (index = 0; index < count; ++index)
    {
        var item = items[index],
            menuItemView = objj_msgSend(item, "_menuItemView");
        _menuItemViews.push(menuItemView);
        objj_msgSend(menuItemView, "setShowsStateColumn:", NO);
        objj_msgSend(menuItemView, "setBelongsToMenuBar:", YES);
        objj_msgSend(menuItemView, "setFont:", _CPMenuBarWindowFont);
        objj_msgSend(menuItemView, "setTextColor:", _textColor);
        objj_msgSend(menuItemView, "setHidden:", objj_msgSend(item, "isHidden"));
        objj_msgSend(menuItemView, "synchronizeWithMenuItem");
        objj_msgSend(contentView, "addSubview:", menuItemView);
    }
    objj_msgSend(self, "tile");
}
},["void","CPMenu"]), new objj_method(sel_getUid("menuDidChangeItem:"), function $_CPMenuBarWindow__menuDidChangeItem_(self, _cmd, aNotification)
{ with(self)
{
    var menuItem = objj_msgSend(_menu, "itemAtIndex:", objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex")),
        menuItemView = objj_msgSend(menuItem, "_menuItemView");
    objj_msgSend(menuItemView, "setHidden:", objj_msgSend(menuItem, "isHidden"));
    objj_msgSend(menuItemView, "synchronizeWithMenuItem");
    objj_msgSend(self, "tile");
}
},["void","CPNotification"]), new objj_method(sel_getUid("menuDidAddItem:"), function $_CPMenuBarWindow__menuDidAddItem_(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex"),
        menuItem = objj_msgSend(_menu, "itemAtIndex:", index),
        menuItemView = objj_msgSend(menuItem, "_menuItemView");
    objj_msgSend(_menuItemViews, "insertObject:atIndex:", menuItemView, index);
    objj_msgSend(menuItemView, "setShowsStateColumn:", NO);
    objj_msgSend(menuItemView, "setBelongsToMenuBar:", YES);
    objj_msgSend(menuItemView, "setFont:", _CPMenuBarWindowFont);
    objj_msgSend(menuItemView, "setTextColor:", _textColor);
    objj_msgSend(menuItemView, "setHidden:", objj_msgSend(menuItem, "isHidden"));
    objj_msgSend(menuItemView, "synchronizeWithMenuItem");
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:", menuItemView);
    objj_msgSend(self, "tile");
}
},["void","CPNotification"]), new objj_method(sel_getUid("menuDidRemoveItem:"), function $_CPMenuBarWindow__menuDidRemoveItem_(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex"),
        menuItemView = objj_msgSend(_menuItemViews, "objectAtIndex:", index);
    objj_msgSend(_menuItemViews, "removeObjectAtIndex:", index);
    objj_msgSend(menuItemView, "removeFromSuperview");
    objj_msgSend(self, "tile");
}
},["void","CPNotification"]), new objj_method(sel_getUid("frameForMenuItem:"), function $_CPMenuBarWindow__frameForMenuItem_(self, _cmd, aMenuItem)
{ with(self)
{
    var frame = objj_msgSend(objj_msgSend(aMenuItem, "_menuItemView"), "frame");
    frame.origin.x -= 5.0;
    frame.origin.y = 0;
    frame.size.width += 10.0;
    frame.size.height = MENUBAR_HEIGHT;
    return frame;
}
},["CGRect","CPMenuItem"]), new objj_method(sel_getUid("menuItemAtPoint:"), function $_CPMenuBarWindow__menuItemAtPoint_(self, _cmd, aPoint)
{ with(self)
{
    var items = objj_msgSend(_menu, "itemArray"),
        count = items.length;
    while (count--)
    {
        var item = items[count];
        if (objj_msgSend(item, "isHidden") || objj_msgSend(item, "isSeparatorItem"))
            continue;
        if (CGRectContainsPoint(objj_msgSend(self, "frameForMenuItem:", item), aPoint))
            return item;
    }
    return nil;
}
},["CPMenuItem","CGPoint"]), new objj_method(sel_getUid("mouseDown:"), function $_CPMenuBarWindow__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    _trackingMenuItem = objj_msgSend(self, "menuItemAtPoint:", objj_msgSend(anEvent, "locationInWindow"));
    if (!objj_msgSend(_trackingMenuItem, "isEnabled"))
        return;
    if (objj_msgSend(objj_msgSend(_trackingMenuItem, "_menuItemView"), "eventOnSubmenu:", anEvent))
        return objj_msgSend(self, "showMenu:", anEvent);
    if (objj_msgSend(_trackingMenuItem, "isEnabled"))
        objj_msgSend(self, "trackEvent:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("trackEvent:"), function $_CPMenuBarWindow__trackEvent_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPPeriodic)
        return objj_msgSend(self, "showMenu:", anEvent);
    var frame = objj_msgSend(self, "frameForMenuItem:", _trackingMenuItem),
        menuItemView = objj_msgSend(_trackingMenuItem, "_menuItemView"),
        onMenuItemView = CGRectContainsPoint(frame, objj_msgSend(anEvent, "locationInWindow"));
    if (type == CPLeftMouseDown)
    {
        if (objj_msgSend(_trackingMenuItem, "submenu") != nil)
        {
            var action = objj_msgSend(_trackingMenuItem, "action");
            if (!action || action === sel_getUid("submenuAction:"))
                return objj_msgSend(self, "showMenu:", anEvent);
            objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.0, 0.5);
        }
        objj_msgSend(menuItemView, "highlight:", onMenuItemView);
    }
    else if (type == CPLeftMouseDragged)
    {
        if (!onMenuItemView && objj_msgSend(_trackingMenuItem, "submenu"))
            return objj_msgSend(self, "showMenu:", anEvent);
        objj_msgSend(menuItemView, "highlight:", onMenuItemView);
    }
    else
    {
        objj_msgSend(CPEvent, "stopPeriodicEvents");
        objj_msgSend(menuItemView, "highlight:", NO);
        if (onMenuItemView)
            objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(_trackingMenuItem, "action"), objj_msgSend(_trackingMenuItem, "target"), _trackingMenuItem);
        return;
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackEvent:"), CPPeriodicMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("showMenu:"), function $_CPMenuBarWindow__showMenu_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(CPEvent, "stopPeriodicEvents");
    var frame = objj_msgSend(self, "frameForMenuItem:", _trackingMenuItem),
        menuItemView = objj_msgSend(_trackingMenuItem, "_menuItemView");
    if (!_highlightView)
    {
        _highlightView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", frame);
        objj_msgSend(_highlightView, "setBackgroundColor:", _highlightColor ? _highlightColor : objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", 95.0/255.0, 131.0/255.0, 185.0/255.0, 1.0));
    }
    else
        objj_msgSend(_highlightView, "setFrame:", frame);
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:positioned:relativeTo:", _highlightView, CPWindowBelow, menuItemView);
    objj_msgSend(menuItemView, "activate:", YES);
    var submenu = objj_msgSend(_trackingMenuItem, "submenu");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("menuDidEndTracking:"), CPMenuDidEndTrackingNotification, submenu);
    objj_msgSend(CPMenu, "_popUpContextMenu:withEvent:forView:withFont:forMenuBar:", submenu, objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame)), objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), objj_msgSend(self, "windowNumber"), nil, 0, objj_msgSend(anEvent, "clickCount"), objj_msgSend(anEvent, "pressure")), objj_msgSend(self, "contentView"), nil, YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("menuDidEndTracking:"), function $_CPMenuBarWindow__menuDidEndTracking_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(_highlightView, "removeFromSuperview");
    objj_msgSend(objj_msgSend(_trackingMenuItem, "_menuItemView"), "activate:", NO);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPMenuDidEndTrackingNotification, objj_msgSend(aNotification, "object"));
}
},["void","CPNotification"]), new objj_method(sel_getUid("tile"), function $_CPMenuBarWindow__tile(self, _cmd)
{ with(self)
{
    var items = objj_msgSend(_menu, "itemArray"),
        index = 0,
        count = items.length,
        x = MENUBAR_LEFT_MARGIN,
        y = 0.0,
        isLeftAligned = YES;
    for (; index < count; ++index)
    {
        var item = items[index];
        if (objj_msgSend(item, "isSeparatorItem"))
        {
            x = CGRectGetWidth(objj_msgSend(self, "frame")) - MENUBAR_RIGHT_MARGIN;
            isLeftAligned = NO;
            continue;
        }
         if (objj_msgSend(item, "isHidden"))
            continue;
        var menuItemView = objj_msgSend(item, "_menuItemView"),
            frame = objj_msgSend(menuItemView, "frame");
        if (isLeftAligned)
        {
            objj_msgSend(menuItemView, "setFrameOrigin:", CGPointMake(x, (MENUBAR_HEIGHT - 1.0 - CGRectGetHeight(frame)) / 2.0));
            x += CGRectGetWidth(objj_msgSend(menuItemView, "frame")) + MENUBAR_MARGIN;
        }
        else
        {
            objj_msgSend(menuItemView, "setFrameOrigin:", CGPointMake(x - CGRectGetWidth(frame), (MENUBAR_HEIGHT - 1.0 - CGRectGetHeight(frame)) / 2.0));
            x = CGRectGetMinX(objj_msgSend(menuItemView, "frame")) - MENUBAR_MARGIN;
        }
    }
    var bounds = objj_msgSend(objj_msgSend(self, "contentView"), "bounds"),
        titleFrame = objj_msgSend(_titleField, "frame");
    if (objj_msgSend(_iconImageView, "isHidden"))
        objj_msgSend(_titleField, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(titleFrame)) / 2.0, (CGRectGetHeight(bounds) - CGRectGetHeight(titleFrame)) / 2.0));
    else
    {
        var iconFrame = objj_msgSend(_iconImageView, "frame"),
            iconWidth = CGRectGetWidth(iconFrame),
            totalWidth = iconWidth + CGRectGetWidth(titleFrame);
        objj_msgSend(_iconImageView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - totalWidth) / 2.0, (CGRectGetHeight(bounds) - CGRectGetHeight(iconFrame)) / 2.0));
        objj_msgSend(_titleField, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - totalWidth) / 2.0 + iconWidth, (CGRectGetHeight(bounds) - CGRectGetHeight(titleFrame)) / 2.0));
    }
}
},["void"]), new objj_method(sel_getUid("setFrameSize:"), function $_CPMenuBarWindow__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "setFrameSize:", aSize);
    objj_msgSend(self, "tile");
}
},["void","CGSize"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $_CPMenuBarWindow__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuBarWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuBarWindowFont = objj_msgSend(CPFont, "systemFontOfSize:", 11.0);
}
},["void"])]);
}

