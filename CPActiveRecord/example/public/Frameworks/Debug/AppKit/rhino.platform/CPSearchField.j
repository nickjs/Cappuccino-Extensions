i;13;CPTextField.jc;24539;
CPSearchFieldRecentsTitleMenuItemTag = 1000;
CPSearchFieldRecentsMenuItemTag = 1001;
CPSearchFieldClearRecentsMenuItemTag = 1002;
CPSearchFieldNoRecentsMenuItemTag = 1003;
var CPSearchFieldSearchImage = nil,
    CPSearchFieldFindImage = nil,
    CPSearchFieldCancelImage = nil,
    CPSearchFieldCancelPressedImage = nil;
{var the_class = objj_allocateClassPair(CPTextField, "CPSearchField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_searchButton"), new objj_ivar("_cancelButton"), new objj_ivar("_searchMenuTemplate"), new objj_ivar("_searchMenu"), new objj_ivar("_recentsAutosaveName"), new objj_ivar("_recentSearches"), new objj_ivar("_maximumRecents"), new objj_ivar("_sendsWholeSearchString"), new objj_ivar("_sendsSearchStringImmediately"), new objj_ivar("_partialStringTimer")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPSearchField__initWithFrame_(self, _cmd, frame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "initWithFrame:", frame);
    if (self != nil)
      {
          _recentSearches = objj_msgSend(CPArray, "array");
          _maximumRecents = 10;
          _sendsWholeSearchString = NO;
          _sendsSearchStringImmediately = NO;
          objj_msgSend(self, "setBezeled:", YES);
          objj_msgSend(self, "setBezelStyle:", CPTextFieldRoundedBezel);
          objj_msgSend(self, "setBordered:", YES);
          objj_msgSend(self, "setEditable:", YES);
          objj_msgSend(self, "setDelegate:", self);
          _cancelButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CPMakeRect(frame.size.width - 27,(frame.size.height-22)/2,22,22));
          objj_msgSend(self, "resetCancelButton");
          objj_msgSend(_cancelButton, "setHidden:", YES);
          objj_msgSend(self, "addSubview:", _cancelButton);
          _searchButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CPMakeRect(5,(frame.size.height-25)/2,25,25));
          objj_msgSend(_searchButton, "setBezelStyle:", CPRegularSquareBezelStyle);
          objj_msgSend(_searchButton, "setBordered:", NO);
          objj_msgSend(_searchButton, "setImageScaling:", CPScaleToFit);
          objj_msgSend(self, "setSearchMenuTemplate:", objj_msgSend(self, "_searchMenuTemplate"));
          objj_msgSend(self, "addSubview:", _searchButton);
       }
    return self;
}
},["id","CPRect"]), new objj_method(sel_getUid("copy"), function $CPSearchField__copy(self, _cmd)
{ with(self)
{
    var copy = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "copy");
    objj_msgSend(copy, "setCancelButton:", objj_msgSend(_cancelButton, "copy"));
    objj_msgSend(copy, "setSearchButton:", objj_msgSend(_searchButton, "copy"));
    objj_msgSend(copy, "setrecentsAutosaveName:", objj_msgSend(_recentsAutosaveName, "copy"));
    objj_msgSend(copy, "setSendsWholeSearchString:", objj_msgSend(_sendsWholeSearchString, "copy"));
    objj_msgSend(copy, "setSendsSearchStringImmediately:", objj_msgSend(_sendsSearchStringImmediately, "copy"));
    objj_msgSend(copy, "setMaximumRecents:", _maximumRecents);
    objj_msgSend(copy, "setSearchMenutemplate:", objj_msgSend(_searchMenuTemplate, "copy"));
    return copy;
}
},["id"]), new objj_method(sel_getUid("setSearchButton:"), function $CPSearchField__setSearchButton_(self, _cmd, button)
{ with(self)
{
    _searchButton = button;
}
},["void","CPButton"]), new objj_method(sel_getUid("searchButton"), function $CPSearchField__searchButton(self, _cmd)
{ with(self)
{
    return _searchButton;
}
},["CPButton"]), new objj_method(sel_getUid("resetSearchButton"), function $CPSearchField__resetSearchButton(self, _cmd)
{ with(self)
{
    var searchButtonImage,
        action,
        target,
        button = objj_msgSend(self, "searchButton");
    if (_searchMenuTemplate == nil)
    {
        searchButtonImage = CPSearchFieldSearchImage;
        action = objj_msgSend(self, "action");
        target = objj_msgSend(self, "target");
    }
    else
    {
        searchButtonImage = CPSearchFieldFindImage;
        action = sel_getUid("_showMenu:");
        target = self;
    }
    objj_msgSend(button, "setImage:", searchButtonImage);
    objj_msgSend(button, "setTarget:", target);
    objj_msgSend(button, "setAction:", action);
}
},["void"]), new objj_method(sel_getUid("setCancelButton:"), function $CPSearchField__setCancelButton_(self, _cmd, button)
{ with(self)
{
    _cancelButton = button;
}
},["void","CPButton"]), new objj_method(sel_getUid("cancelButton"), function $CPSearchField__cancelButton(self, _cmd)
{ with(self)
{
    return _cancelButton;
}
},["CPButton"]), new objj_method(sel_getUid("resetCancelButton"), function $CPSearchField__resetCancelButton(self, _cmd)
{ with(self)
{
    var button = objj_msgSend(self, "cancelButton");
    objj_msgSend(button, "setBezelStyle:", CPRegularSquareBezelStyle);
    objj_msgSend(button, "setBordered:", NO);
    objj_msgSend(button, "setImageScaling:", CPScaleToFit);
    objj_msgSend(button, "setImage:", CPSearchFieldCancelImage);
    objj_msgSend(button, "setAlternateImage:", CPSearchFieldCancelPressedImage);
    objj_msgSend(button, "setTarget:", self);
    objj_msgSend(button, "setAction:", sel_getUid("_searchFieldCancel:"));
}
},["void"]), new objj_method(sel_getUid("searchTextRectForBounds:"), function $CPSearchField__searchTextRectForBounds_(self, _cmd, rect)
{ with(self)
{
    var leftOffset = 0, width = rect.size.width;
    if (_searchButton)
    {
        var searchRect = objj_msgSend(_searchButton, "frame");
        leftOffset = searchRect.origin.x + searchRect.size.width;
    }
    if (_cancelButton)
    {
        var cancelRect = objj_msgSend(_cancelButton, "frame");
        width = cancelRect.origin.x - leftOffset;
    }
    return CPMakeRect(leftOffset,rect.origin.y,width,rect.size.height);
}
},["CPRect","CPRect"]), new objj_method(sel_getUid("searchButtonRectForBounds:"), function $CPSearchField__searchButtonRectForBounds_(self, _cmd, rect)
{ with(self)
{
    return objj_msgSend(_searchButton, "frame");
}
},["CPRect","CPRect"]), new objj_method(sel_getUid("cancelButtonRectForBounds:"), function $CPSearchField__cancelButtonRectForBounds_(self, _cmd, rect)
{ with(self)
{
    return objj_msgSend(_cancelButton, "frame");
}
},["CPRect","CPRect"]), new objj_method(sel_getUid("searchMenuTemplate"), function $CPSearchField__searchMenuTemplate(self, _cmd)
{ with(self)
{
    return _searchMenuTemplate;
}
},["CPMenu"]), new objj_method(sel_getUid("setSearchMenuTemplate:"), function $CPSearchField__setSearchMenuTemplate_(self, _cmd, menu)
{ with(self)
{
    _searchMenuTemplate = menu;
    objj_msgSend(self, "resetSearchButton");
    objj_msgSend(self, "_updateSearchMenu");
}
},["void","CPMenu"]), new objj_method(sel_getUid("sendsWholeSearchString"), function $CPSearchField__sendsWholeSearchString(self, _cmd)
{ with(self)
{
    return _sendsWholeSearchString;
}
},["BOOL"]), new objj_method(sel_getUid("setSendsWholeSearchString:"), function $CPSearchField__setSendsWholeSearchString_(self, _cmd, flag)
{ with(self)
{
    _sendsWholeSearchString = flag;
}
},["void","BOOL"]), new objj_method(sel_getUid("sendsSearchStringImmediately"), function $CPSearchField__sendsSearchStringImmediately(self, _cmd)
{ with(self)
{
    return _sendsSearchStringImmediately;
}
},["BOOL"]), new objj_method(sel_getUid("setSendsSearchStringImmediately:"), function $CPSearchField__setSendsSearchStringImmediately_(self, _cmd, flag)
{ with(self)
{
    _sendsSearchStringImmediately = flag;
}
},["void","BOOL"]), new objj_method(sel_getUid("maximumRecents"), function $CPSearchField__maximumRecents(self, _cmd)
{ with(self)
{
    return _maximumRecents;
}
},["int"]), new objj_method(sel_getUid("setMaximumRecents:"), function $CPSearchField__setMaximumRecents_(self, _cmd, max)
{ with(self)
{
    if (max > 254)
        max = 254;
    else if (max < 0)
        max = 10;
    _maximumRecents = max;
}
},["void","int"]), new objj_method(sel_getUid("recentSearches"), function $CPSearchField__recentSearches(self, _cmd)
{ with(self)
{
    return _recentSearches;
}
},["CPArray"]), new objj_method(sel_getUid("setRecentSearches:"), function $CPSearchField__setRecentSearches_(self, _cmd, searches)
{ with(self)
{
    var max = MIN(objj_msgSend(self, "maximumRecents"),objj_msgSend(searches, "count"));
    var searches = objj_msgSend(searches, "subarrayWithRange:", CPMakeRange(0,max));
    _recentSearches = searches;
    objj_msgSend(self, "_autosaveRecentSearchList");
}
},["void","CPArray"]), new objj_method(sel_getUid("recentsAutosaveName"), function $CPSearchField__recentsAutosaveName(self, _cmd)
{ with(self)
{
    return _recentsAutosaveName;
}
},["CPString"]), new objj_method(sel_getUid("setRecentsAutosaveName:"), function $CPSearchField__setRecentsAutosaveName_(self, _cmd, name)
{ with(self)
{
    _recentsAutosaveName = name;
    if(name != nil)
      objj_msgSend(self, "_registerForAutosaveNotification");
    else
      objj_msgSend(self, "_deregisterForAutosaveNotification");
}
},["void","CPString"]), new objj_method(sel_getUid("contentRectForBounds:"), function $CPSearchField__contentRectForBounds_(self, _cmd, bounds)
{ with(self)
{
    var superbounds = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "contentRectForBounds:", bounds);
    return objj_msgSend(self, "searchTextRectForBounds:", superbounds);
}
},["CPRect","CPRect"]), new objj_method(sel_getUid("menu"), function $CPSearchField__menu(self, _cmd)
{ with(self)
{
    return _searchMenu;
}
},["CPMenu"]), new objj_method(sel_getUid("isOpaque"), function $CPSearchField__isOpaque(self, _cmd)
{ with(self)
{
  return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "isOpaque") && objj_msgSend(_cancelButton, "isOpaque") && objj_msgSend(_searchButton, "isOpaque");
}
},["BOOL"]), new objj_method(sel_getUid("_updateCancelButtonVisibility"), function $CPSearchField___updateCancelButtonVisibility(self, _cmd)
{ with(self)
{
    objj_msgSend(_cancelButton, "setHidden:", (objj_msgSend(objj_msgSend(self, "stringValue"), "length") == 0));
}
},["void"]), new objj_method(sel_getUid("controlTextDidChange:"), function $CPSearchField__controlTextDidChange_(self, _cmd, aNotification)
{ with(self)
{
    if(!_sendsWholeSearchString)
    {
        if(_sendsSearchStringImmediately)
            objj_msgSend(self, "_sendPartialString");
        else
        {
            objj_msgSend(_partialStringTimer, "invalidate");
            var timeInterval = objj_msgSend(CPSearchField, "_keyboardDelayForPartialSearchString:", objj_msgSend(self, "stringValue"));
            _partialStringTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", timeInterval, self, sel_getUid("_sendPartialString"), nil, NO);
        }
    }
    objj_msgSend(self, "_updateCancelButtonVisibility");
}
},["void","CPNotification"]), new objj_method(sel_getUid("sendAction:to:"), function $CPSearchField__sendAction_to_(self, _cmd, anAction, anObject)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "sendAction:to:", anAction, anObject);
    objj_msgSend(_partialStringTimer, "invalidate");
    var current_value = objj_msgSend(self, "objectValue");
    if(current_value != nil && current_value != "" && !objj_msgSend(_recentSearches, "containsObject:", current_value))
    {
        objj_msgSend(self, "_addStringToRecentSearches:", current_value);
        objj_msgSend(self, "_updateSearchMenu");
    }
    objj_msgSend(self, "_updateCancelButtonVisibility");
}
},["void","SEL","id"]), new objj_method(sel_getUid("_addStringToRecentSearches:"), function $CPSearchField___addStringToRecentSearches_(self, _cmd, string)
{ with(self)
{
    var newSearches = objj_msgSend(CPMutableArray, "arrayWithArray:", _recentSearches);
    objj_msgSend(newSearches, "addObject:", string);
    objj_msgSend(self, "setRecentSearches:", newSearches);
}
},["void","CPString"]), new objj_method(sel_getUid("trackMouse:"), function $CPSearchField__trackMouse_(self, _cmd, event)
{ with(self)
{
    var rect;
    var point;
    var location = objj_msgSend(event, "locationInWindow");
    point = objj_msgSend(self, "convertPoint:fromView:", location, nil);
    rect = objj_msgSend(self, "searchButtonRectForBounds:", objj_msgSend(self, "frame"));
    if (CPRectContainsPoint(rect,point))
      {
          return objj_msgSend(objj_msgSend(self, "searchButton"), "trackMouse:", event);
      }
    rect = objj_msgSend(self, "cancelButtonRectForBounds:", objj_msgSend(self, "frame"));
    if (CPRectContainsPoint(rect,point))
      {
          return objj_msgSend(objj_msgSend(self, "cancelButton"), "trackMouse:", event);
      }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "trackMouse:", event);
}
},["BOOL","CPEvent"]), new objj_method(sel_getUid("_searchMenuTemplate"), function $CPSearchField___searchMenuTemplate(self, _cmd)
{ with(self)
{
    var template, item;
    template = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "init");
    item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Recent searches", NULL, "");
    objj_msgSend(item, "setTag:", CPSearchFieldRecentsTitleMenuItemTag);
    objj_msgSend(item, "setEnabled:", NO);
    objj_msgSend(template, "addItem:", item);
    item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Recent search item", sel_getUid("_searchFieldSearch:"), "");
    objj_msgSend(item, "setTag:", CPSearchFieldRecentsMenuItemTag);
    objj_msgSend(item, "setTarget:", self);
    objj_msgSend(template, "addItem:", item);
    item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Clear recent searches", sel_getUid("_searchFieldClearRecents:"), "");
    objj_msgSend(item, "setTag:", CPSearchFieldClearRecentsMenuItemTag);
    objj_msgSend(item, "setTarget:", self);
    objj_msgSend(template, "addItem:", item);
    item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "No recent searches", NULL, "");
    objj_msgSend(item, "setTag:", CPSearchFieldNoRecentsMenuItemTag);
    objj_msgSend(item, "setEnabled:", NO);
    objj_msgSend(template, "addItem:", item);
    return template;
}
},["CPMenu"]), new objj_method(sel_getUid("_updateSearchMenu"), function $CPSearchField___updateSearchMenu(self, _cmd)
{ with(self)
{
    if(_searchMenuTemplate == nil)
        return;
    var i, menu = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "init");
    var countOfRecents = objj_msgSend(_recentSearches, "count");
    for (i = 0; i < objj_msgSend(_searchMenuTemplate, "numberOfItems"); i++)
    {
        var item = objj_msgSend(_searchMenuTemplate, "itemAtIndex:", i);
        var tag = objj_msgSend(item, "tag");
        if(tag == CPSearchFieldClearRecentsMenuItemTag && countOfRecents != 0)
        {
            var separator = objj_msgSend(CPMenuItem, "separatorItem");
            objj_msgSend(menu, "addItem:", separator);
        }
        if (!(tag == CPSearchFieldRecentsTitleMenuItemTag && countOfRecents == 0) &&
            !(tag == CPSearchFieldClearRecentsMenuItemTag && countOfRecents == 0) &&
            !(tag == CPSearchFieldNoRecentsMenuItemTag && countOfRecents != 0) &&
            !(tag == CPSearchFieldRecentsMenuItemTag))
        {
            var templateItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", objj_msgSend(item, "title"), objj_msgSend(item, "action"), objj_msgSend(item, "keyEquivalent"));
            objj_msgSend(templateItem, "setTarget:", objj_msgSend(item, "target"));
            objj_msgSend(templateItem, "setEnabled:", objj_msgSend(item, "isEnabled"));
            objj_msgSend(templateItem, "setTag:", objj_msgSend(item, "tag"));
            objj_msgSend(menu, "addItem:", templateItem);
        }
        else if (tag == CPSearchFieldRecentsMenuItemTag)
        {
            var j;
            for (j = 0; j < countOfRecents; j++)
            {
                var rencentItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", objj_msgSend(_recentSearches, "objectAtIndex:", j), objj_msgSend(item, "action"), objj_msgSend(item, "keyEquivalent"));
                objj_msgSend(rencentItem, "setTarget:", objj_msgSend(item, "target"));
                objj_msgSend(menu, "addItem:", rencentItem);
            }
        }
    }
    _searchMenu = menu;
}
},["void"]), new objj_method(sel_getUid("_showMenu:"), function $CPSearchField___showMenu_(self, _cmd, sender)
{ with(self)
{
    if(_searchMenu == nil || !objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "selectText:", nil);
    var origin = CPMakePoint(objj_msgSend(self, "frame").origin.x, objj_msgSend(self, "frame").origin.y + objj_msgSend(self, "frame").size.height);
    var anEvent = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPRightMouseDown, origin, 0, objj_msgSend(CPDate, "date"), 1, objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"), "", "", NO, 0);
    objj_msgSend(CPMenu, "popUpContextMenu:withEvent:forView:", _searchMenu, anEvent, sender);
}
},["void","id"]), new objj_method(sel_getUid("_sendPartialString"), function $CPSearchField___sendPartialString(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "target"), "performSelector:withObject:", objj_msgSend(self, "action"), self);
}
},["void"]), new objj_method(sel_getUid("_searchFieldCancel:"), function $CPSearchField___searchFieldCancel_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", nil);
    objj_msgSend(self, "_sendPartialString");
    objj_msgSend(self, "_updateCancelButtonVisibility");
    objj_msgSend(sender, "setHidden:", YES);
}
},["void","id"]), new objj_method(sel_getUid("_searchFieldSearch:"), function $CPSearchField___searchFieldSearch_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", objj_msgSend(sender, "title"));
    objj_msgSend(self, "_sendPartialString");
    objj_msgSend(self, "_updateCancelButtonVisibility");
}
},["void","id"]), new objj_method(sel_getUid("_searchFieldClearRecents:"), function $CPSearchField___searchFieldClearRecents_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "setRecentSearches:", objj_msgSend(CPArray, "array"));
    objj_msgSend(self, "_updateSearchMenu");
 }
},["void","id"]), new objj_method(sel_getUid("_registerForAutosaveNotification"), function $CPSearchField___registerForAutosaveNotification(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_updateAutosavedRecents:"), "CPAutosavedRecentsChangedNotification", nil);
}
},["void"]), new objj_method(sel_getUid("_deregisterForAutosaveNotification"), function $CPSearchField___deregisterForAutosaveNotification(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, "CPAutosavedRecentsChangedNotification", nil);
}
},["void"]), new objj_method(sel_getUid("_updateAutosavedRecents:"), function $CPSearchField___updateAutosavedRecents_(self, _cmd, notification)
{ with(self)
{
    var name = objj_msgSend(notification, "object");
    var list = objj_msgSend(self, "recentSearches");
    objj_msgSend(objj_msgSend(CPUserDefaults, "standardUserDefaults"), "setObject:forKey:", list, name);
}
},["void","id"]), new objj_method(sel_getUid("_autosaveRecentSearchList"), function $CPSearchField___autosaveRecentSearchList(self, _cmd)
{ with(self)
{
    if(_recentsAutosaveName != nil)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", "CPAutosavedRecentsChangedNotification", _recentsAutosaveName);
}
},["void"]), new objj_method(sel_getUid("_loadRecentSearchList"), function $CPSearchField___loadRecentSearchList(self, _cmd)
{ with(self)
{
    var list,
        name = objj_msgSend(self, "recentsAutosaveName");
    list = objj_msgSend(objj_msgSend(CPUserDefaults, "standardUserDefaults"), "objectForKey:", name);
    _recentSearches = list;
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPSearchField__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPSearchField, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    CPSearchFieldSearchImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "CPSearchField/CPSearchFieldSearch.png"));
    CPSearchFieldFindImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "CPSearchField/CPSearchFieldFind.png"));
    CPSearchFieldCancelImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "CPSearchField/CPSearchFieldCancel.png"));
    CPSearchFieldCancelPressedImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "CPSearchField/CPSearchFieldCancelPressed.png"));
}
},["void"]), new objj_method(sel_getUid("_keyboardDelayForPartialSearchString:"), function $CPSearchField___keyboardDelayForPartialSearchString_(self, _cmd, string)
{ with(self)
{
    return (6 - MIN(objj_msgSend(string, "length"),4))/10;
}
},["double","CPString"])]);
}
var CPSearchButtonKey = "CPSearchButtonKey",
    CPCancelButtonKey = "CPCancelButtonKey",
    CPRecentsAutosaveNameKey = "CPRecentsAutosaveNameKey",
    CPSendsWholeSearchStringKey = "CPSendsWholeSearchStringKey",
    CPSendsSearchStringImmediatelyKey = "CPSendsSearchStringImmediatelyKey",
    CPMaximumRecentsKey = "CPMaximumRecentsKey",
    CPSearchMenuTemplateKey = "CPSearchMenuTemplateKey";
{
var the_class = objj_getClass("CPSearchField")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSearchField\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("encodeWithCoder:"), function $CPSearchField__encodeWithCoder_(self, _cmd, coder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "encodeWithCoder:", coder);
    objj_msgSend(coder, "encodeObject:forKey:", _searchButton, CPSearchButtonKey);
    objj_msgSend(coder, "encodeObject:forKey:", _cancelButton, CPCancelButtonKey);
    objj_msgSend(coder, "encodeObject:forKey:", _recentsAutosaveName, CPRecentsAutosaveNameKey);
    objj_msgSend(coder, "encodeBool:forKey:", _sendsWholeSearchString, CPSendsWholeSearchStringKey);
    objj_msgSend(coder, "encodeBool:forKey:", _sendsSearchStringImmediately, CPSendsSearchStringImmediatelyKey);
    objj_msgSend(coder, "encodeInt:forKey:", _maximumRecents, CPMaximumRecentsKey);
    objj_msgSend(coder, "encodeObject:forKey:", _searchMenuTemplate, CPSearchMenuTemplateKey);
}
},["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $CPSearchField__initWithCoder_(self, _cmd, coder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "initWithCoder:", coder);
    _searchButton = objj_msgSend(coder, "decodeObjectForKey:", CPSearchButtonKey);
    _cancelButton = objj_msgSend(coder, "decodeObjectForKey:", CPCancelButtonKey);
    _recentsAutosaveName = objj_msgSend(coder, "decodeObjectForKey:", CPRecentsAutosaveNameKey);
    _sendsWholeSearchString = objj_msgSend(coder, "decodeBoolForKey:", CPSendsWholeSearchStringKey);
    _sendsSearchStringImmediately = objj_msgSend(coder, "decodeBoolForKey:", CPSendsSearchStringImmediatelyKey);
    _maximumRecents = objj_msgSend(coder, "decodeIntForKey:", CPMaximumRecentsKey);
    objj_msgSend(self, "setSearchMenuTemplate:", objj_msgSend(coder, "decodeObjectForKey:", CPSearchMenuTemplateKey));
    objj_msgSend(self, "resetCancelButton");
    objj_msgSend(self, "setDelegate:", self);
    return self;
}
},["id","CPCoder"])]);
}

