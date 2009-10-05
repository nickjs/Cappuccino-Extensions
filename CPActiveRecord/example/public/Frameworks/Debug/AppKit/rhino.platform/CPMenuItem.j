I;20;Foundation/CPCoder.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPMenu.jI;15;AppKit/CPView.jc;33226;
{var the_class = objj_allocateClassPair(CPObject, "CPMenuItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isSeparator"), new objj_ivar("_title"), new objj_ivar("_font"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_isEnabled"), new objj_ivar("_isHidden"), new objj_ivar("_tag"), new objj_ivar("_state"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_onStateImage"), new objj_ivar("_offStateImage"), new objj_ivar("_mixedStateImage"), new objj_ivar("_submenu"), new objj_ivar("_menu"), new objj_ivar("_keyEquivalent"), new objj_ivar("_keyEquivalentModifierMask"), new objj_ivar("_mnemonicLocation"), new objj_ivar("_isAlternate"), new objj_ivar("_indentationLevel"), new objj_ivar("_toolTip"), new objj_ivar("_representedObject"), new objj_ivar("_view"), new objj_ivar("_menuItemView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTitle:action:keyEquivalent:"), function $CPMenuItem__initWithTitle_action_keyEquivalent_(self, _cmd, aTitle, anAction, aKeyEquivalent)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _isSeparator = NO;
        _title = aTitle;
        _action = anAction;
        _isEnabled = YES;
        _tag = 0;
        _state = CPOffState;
        _keyEquivalent = aKeyEquivalent || "";
        _keyEquivalentModifierMask = CPPlatformActionKeyMask;
        _mnemonicLocation = CPNotFound;
    }
    return self;
}
},["id","CPString","SEL","CPString"]), new objj_method(sel_getUid("setEnabled:"), function $CPMenuItem__setEnabled_(self, _cmd, isEnabled)
{ with(self)
{
    if (objj_msgSend(_menu, "autoenablesItems"))
        return;
    _isEnabled = isEnabled;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
},["void","BOOL"]), new objj_method(sel_getUid("isEnabled"), function $CPMenuItem__isEnabled(self, _cmd)
{ with(self)
{
    return _isEnabled;
}
},["BOOL"]), new objj_method(sel_getUid("setHidden:"), function $CPMenuItem__setHidden_(self, _cmd, isHidden)
{ with(self)
{
    if (_isHidden == isHidden)
        return;
    _isHidden = isHidden;
    objj_msgSend(_menu, "itemChanged:", self);
}
},["void","BOOL"]), new objj_method(sel_getUid("isHidden"), function $CPMenuItem__isHidden(self, _cmd)
{ with(self)
{
    return _isHidden;
}
},["BOOL"]), new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"), function $CPMenuItem__isHiddenOrHasHiddenAncestor(self, _cmd)
{ with(self)
{
    if (_isHidden)
        return YES;
    var supermenu = objj_msgSend(_menu, "supermenu");
    if (objj_msgSend(objj_msgSend(supermenu, "itemAtIndex:", objj_msgSend(supermenu, "indexOfItemWithSubmenu:", _menu)), "isHiddenOrHasHiddenAncestor"))
        return YES;
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("setTarget:"), function $CPMenuItem__setTarget_(self, _cmd, aTarget)
{ with(self)
{
    _target = aTarget;
}
},["void","id"]), new objj_method(sel_getUid("target"), function $CPMenuItem__target(self, _cmd)
{ with(self)
{
    return _target;
}
},["id"]), new objj_method(sel_getUid("setAction:"), function $CPMenuItem__setAction_(self, _cmd, anAction)
{ with(self)
{
    _action = anAction;
}
},["void","SEL"]), new objj_method(sel_getUid("action"), function $CPMenuItem__action(self, _cmd)
{ with(self)
{
    return _action;
}
},["SEL"]), new objj_method(sel_getUid("setTitle:"), function $CPMenuItem__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    _mnemonicLocation = CPNotFound;
    if (_title == aTitle)
        return;
    _title = aTitle;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
},["void","CPString"]), new objj_method(sel_getUid("title"), function $CPMenuItem__title(self, _cmd)
{ with(self)
{
    return _title;
}
},["CPString"]), new objj_method(sel_getUid("setTextColor:"), function $CPMenuItem__setTextColor_(self, _cmd, aColor)
{ with(self)
{
}
},["void","CPString"]), new objj_method(sel_getUid("setFont:"), function $CPMenuItem__setFont_(self, _cmd, aFont)
{ with(self)
{
    if (_font == aFont)
        return;
    _font = aFont;
    objj_msgSend(_menu, "itemChanged:", self);
    objj_msgSend(_menuItemView, "setDirty");
}
},["void","CPFont"]), new objj_method(sel_getUid("font"), function $CPMenuItem__font(self, _cmd)
{ with(self)
{
    return _font;
}
},["CPFont"]), new objj_method(sel_getUid("setTag:"), function $CPMenuItem__setTag_(self, _cmd, aTag)
{ with(self)
{
    _tag = aTag;
}
},["void","int"]), new objj_method(sel_getUid("tag"), function $CPMenuItem__tag(self, _cmd)
{ with(self)
{
    return _tag;
}
},["int"]), new objj_method(sel_getUid("setState:"), function $CPMenuItem__setState_(self, _cmd, aState)
{ with(self)
{
    if (_state == aState)
        return;
    _state = aState;
    objj_msgSend(_menu, "itemChanged:", self);
    objj_msgSend(_menuItemView, "setDirty");
}
},["void","int"]), new objj_method(sel_getUid("state"), function $CPMenuItem__state(self, _cmd)
{ with(self)
{
    return _state;
}
},["int"]), new objj_method(sel_getUid("setImage:"), function $CPMenuItem__setImage_(self, _cmd, anImage)
{ with(self)
{
    if (_image == anImage)
        return;
    _image = anImage;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
},["void","CPImage"]), new objj_method(sel_getUid("image"), function $CPMenuItem__image(self, _cmd)
{ with(self)
{
    return _image;
}
},["CPImage"]), new objj_method(sel_getUid("setAlternateImage:"), function $CPMenuItem__setAlternateImage_(self, _cmd, anImage)
{ with(self)
{
    _alternateImage = anImage;
}
},["void","CPImage"]), new objj_method(sel_getUid("alternateImage"), function $CPMenuItem__alternateImage(self, _cmd)
{ with(self)
{
    return _alternateImage;
}
},["CPImage"]), new objj_method(sel_getUid("setOnStateImage:"), function $CPMenuItem__setOnStateImage_(self, _cmd, anImage)
{ with(self)
{
    if (_onStateImage == anImage)
        return;
    _onStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
},["void","CPImage"]), new objj_method(sel_getUid("onStateImage"), function $CPMenuItem__onStateImage(self, _cmd)
{ with(self)
{
    return _onStateImage;
}
},["CPImage"]), new objj_method(sel_getUid("setOffStateImage:"), function $CPMenuItem__setOffStateImage_(self, _cmd, anImage)
{ with(self)
{
    if (_offStateImage == anImage)
        return;
    _offStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
},["void","CPImage"]), new objj_method(sel_getUid("offStateImage"), function $CPMenuItem__offStateImage(self, _cmd)
{ with(self)
{
    return _offStateImage;
}
},["CPImage"]), new objj_method(sel_getUid("setMixedStateImage:"), function $CPMenuItem__setMixedStateImage_(self, _cmd, anImage)
{ with(self)
{
    if (_mixedStateImage == anImage)
        return;
    _mixedStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
},["void","CPImage"]), new objj_method(sel_getUid("mixedStateImage"), function $CPMenuItem__mixedStateImage(self, _cmd)
{ with(self)
{
    return _mixedStateImage;
}
},["CPImage"]), new objj_method(sel_getUid("setSubmenu:"), function $CPMenuItem__setSubmenu_(self, _cmd, aMenu)
{ with(self)
{
    var supermenu = objj_msgSend(_submenu, "supermenu");
    if (supermenu == self)
        return;
    if (supermenu)
        return alert("bad");
    objj_msgSend(_submenu, "setSupermenu:", _menu);
    _submenu = aMenu;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
},["void","CPMenu"]), new objj_method(sel_getUid("submenu"), function $CPMenuItem__submenu(self, _cmd)
{ with(self)
{
    return _submenu;
}
},["CPMenu"]), new objj_method(sel_getUid("hasSubmenu"), function $CPMenuItem__hasSubmenu(self, _cmd)
{ with(self)
{
    return _submenu ? YES : NO;
}
},["BOOL"]), new objj_method(sel_getUid("isSeparatorItem"), function $CPMenuItem__isSeparatorItem(self, _cmd)
{ with(self)
{
    return _isSeparator;
}
},["BOOL"]), new objj_method(sel_getUid("setMenu:"), function $CPMenuItem__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    _menu = aMenu;
}
},["void","CPMenu"]), new objj_method(sel_getUid("menu"), function $CPMenuItem__menu(self, _cmd)
{ with(self)
{
    return _menu;
}
},["CPMenu"]), new objj_method(sel_getUid("setKeyEquivalent:"), function $CPMenuItem__setKeyEquivalent_(self, _cmd, aString)
{ with(self)
{
    _keyEquivalent = aString || "";
}
},["void","CPString"]), new objj_method(sel_getUid("keyEquivalent"), function $CPMenuItem__keyEquivalent(self, _cmd)
{ with(self)
{
    return _keyEquivalent;
}
},["CPString"]), new objj_method(sel_getUid("setKeyEquivalentModifierMask:"), function $CPMenuItem__setKeyEquivalentModifierMask_(self, _cmd, aMask)
{ with(self)
{
    _keyEquivalentModifierMask = aMask;
}
},["void","unsigned"]), new objj_method(sel_getUid("keyEquivalentModifierMask"), function $CPMenuItem__keyEquivalentModifierMask(self, _cmd)
{ with(self)
{
    return _keyEquivalentModifierMask;
}
},["unsigned"]), new objj_method(sel_getUid("setMnemonicLocation:"), function $CPMenuItem__setMnemonicLocation_(self, _cmd, aLocation)
{ with(self)
{
    _mnemonicLocation = aLocation;
}
},["void","unsigned"]), new objj_method(sel_getUid("mnemonicLocation"), function $CPMenuItem__mnemonicLocation(self, _cmd)
{ with(self)
{
    return _mnemonicLocation;
}
},["unsigned"]), new objj_method(sel_getUid("setTitleWithMnemonicLocation:"), function $CPMenuItem__setTitleWithMnemonicLocation_(self, _cmd, aTitle)
{ with(self)
{
    var location = objj_msgSend(aTitle, "rangeOfString:", "&").location;
    if (location == CPNotFound)
        objj_msgSend(self, "setTitle:", aTitle);
    else
    {
        objj_msgSend(self, "setTitle:", objj_msgSend(aTitle, "substringToIndex:", location) + objj_msgSend(aTitle, "substringFromIndex:", location + 1));
        objj_msgSend(self, "setMnemonicLocation:", location);
    }
}
},["void","CPString"]), new objj_method(sel_getUid("mnemonic"), function $CPMenuItem__mnemonic(self, _cmd)
{ with(self)
{
    return _mnemonicLocation == CPNotFound ? "" : objj_msgSend(_title, "characterAtIndex:", _mnemonicLocation);
}
},["CPString"]), new objj_method(sel_getUid("setAlternate:"), function $CPMenuItem__setAlternate_(self, _cmd, isAlternate)
{ with(self)
{
    _isAlternate = isAlternate;
}
},["void","BOOL"]), new objj_method(sel_getUid("isAlternate"), function $CPMenuItem__isAlternate(self, _cmd)
{ with(self)
{
    return _isAlternate;
}
},["BOOL"]), new objj_method(sel_getUid("setIndentationLevel:"), function $CPMenuItem__setIndentationLevel_(self, _cmd, aLevel)
{ with(self)
{
    if (aLevel < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "setIndentationLevel: argument must be greater than 0.");
    _indentationLevel = MIN(15, aLevel);
}
},["void","unsigned"]), new objj_method(sel_getUid("indentationLevel"), function $CPMenuItem__indentationLevel(self, _cmd)
{ with(self)
{
    return _indentationLevel;
}
},["unsigned"]), new objj_method(sel_getUid("setToolTip:"), function $CPMenuItem__setToolTip_(self, _cmd, aToolTip)
{ with(self)
{
    _toolTip = aToolTip;
}
},["void","CPString"]), new objj_method(sel_getUid("toolTip"), function $CPMenuItem__toolTip(self, _cmd)
{ with(self)
{
    return _toolTip;
}
},["CPString"]), new objj_method(sel_getUid("setRepresentedObject:"), function $CPMenuItem__setRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    _representedObject = anObject;
}
},["void","id"]), new objj_method(sel_getUid("representedObject"), function $CPMenuItem__representedObject(self, _cmd)
{ with(self)
{
    return _representedObject;
}
},["id"]), new objj_method(sel_getUid("setView:"), function $CPMenuItem__setView_(self, _cmd, aView)
{ with(self)
{
    if (_view === aView)
        return;
    _view = aView;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
},["void","CPView"]), new objj_method(sel_getUid("view"), function $CPMenuItem__view(self, _cmd)
{ with(self)
{
    return _view;
}
},["CPView"]), new objj_method(sel_getUid("isHighlighted"), function $CPMenuItem__isHighlighted(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "menu"), "highlightedItem") == self;
}
},["BOOL"]), new objj_method(sel_getUid("_menuItemView"), function $CPMenuItem___menuItemView(self, _cmd)
{ with(self)
{
    if (!_menuItemView)
        _menuItemView = objj_msgSend(objj_msgSend(_CPMenuItemView, "alloc"), "initWithFrame:forMenuItem:", CGRectMakeZero(), self);
    return _menuItemView;
}
},["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("separatorItem"), function $CPMenuItem__separatorItem(self, _cmd)
{ with(self)
{
    var separatorItem = objj_msgSend(objj_msgSend(self, "alloc"), "initWithTitle:action:keyEquivalent:", "", nil, nil);
    separatorItem._isSeparator = YES;
    return separatorItem;
}
},["CPMenuItem"])]);
}
var CPMenuItemIsSeparatorKey = "CPMenuItemIsSeparatorKey",
    CPMenuItemTitleKey = "CPMenuItemTitleKey",
    CPMenuItemTargetKey = "CPMenuItemTargetKey",
    CPMenuItemActionKey = "CPMenuItemActionKey",
    CPMenuItemIsEnabledKey = "CPMenuItemIsEnabledKey",
    CPMenuItemIsHiddenKey = "CPMenuItemIsHiddenKey",
    CPMenuItemTagKey = "CPMenuItemTagKey",
    CPMenuItemStateKey = "CPMenuItemStateKey",
    CPMenuItemImageKey = "CPMenuItemImageKey",
    CPMenuItemAlternateImageKey = "CPMenuItemAlternateImageKey",
    CPMenuItemSubmenuKey = "CPMenuItemSubmenuKey",
    CPMenuItemMenuKey = "CPMenuItemMenuKey",
    CPMenuItemRepresentedObjectKey = "CPMenuItemRepresentedObjectKey",
    CPMenuItemViewKey = "CPMenuItemViewKey";
{
var the_class = objj_getClass("CPMenuItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPMenuItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPMenuItem__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _isSeparator = objj_msgSend(aCoder, "containsValueForKey:", CPMenuItemIsSeparatorKey) && objj_msgSend(aCoder, "decodeBoolForKey:", CPMenuItemIsSeparatorKey);
        _title = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemTitleKey);
        _target = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemTargetKey);
        _action = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemActionKey);
        _isEnabled = objj_msgSend(aCoder, "containsValueForKey:", (CPMenuItemIsEnabledKey)) ? objj_msgSend(aCoder, "decodeObjectForKey:", (CPMenuItemIsEnabledKey)) : (YES);
        _isHidden = objj_msgSend(aCoder, "containsValueForKey:", (CPMenuItemIsHiddenKey)) ? objj_msgSend(aCoder, "decodeObjectForKey:", (CPMenuItemIsHiddenKey)) : (NO);
        _tag = objj_msgSend(aCoder, "containsValueForKey:", (CPMenuItemTagKey)) ? objj_msgSend(aCoder, "decodeObjectForKey:", (CPMenuItemTagKey)) : (0);
        _state = objj_msgSend(aCoder, "containsValueForKey:", (CPMenuItemStateKey)) ? objj_msgSend(aCoder, "decodeObjectForKey:", (CPMenuItemStateKey)) : (CPOffState);
        _image = objj_msgSend(aCoder, "containsValueForKey:", (CPMenuItemImageKey)) ? objj_msgSend(aCoder, "decodeObjectForKey:", (CPMenuItemImageKey)) : (nil);
        _alternateImage = objj_msgSend(aCoder, "containsValueForKey:", (CPMenuItemAlternateImageKey)) ? objj_msgSend(aCoder, "decodeObjectForKey:", (CPMenuItemAlternateImageKey)) : (nil);
        _submenu = objj_msgSend(aCoder, "containsValueForKey:", (CPMenuItemSubmenuKey)) ? objj_msgSend(aCoder, "decodeObjectForKey:", (CPMenuItemSubmenuKey)) : (nil);
        _menu = objj_msgSend(aCoder, "containsValueForKey:", (CPMenuItemMenuKey)) ? objj_msgSend(aCoder, "decodeObjectForKey:", (CPMenuItemMenuKey)) : (nil);
        _representedObject = objj_msgSend(aCoder, "containsValueForKey:", (CPMenuItemRepresentedObjectKey)) ? objj_msgSend(aCoder, "decodeObjectForKey:", (CPMenuItemRepresentedObjectKey)) : (nil);
        _view = objj_msgSend(aCoder, "containsValueForKey:", (CPMenuItemViewKey)) ? objj_msgSend(aCoder, "decodeObjectForKey:", (CPMenuItemViewKey)) : (nil);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPMenuItem__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (_isSeparator)
        objj_msgSend(aCoder, "encodeBool:forKey:", _isSeparator, CPMenuItemIsSeparatorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPMenuItemTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _target, CPMenuItemTargetKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _action, CPMenuItemActionKey);
    if ((_isEnabled) !== (YES)) objj_msgSend(aCoder, "encodeObject:forKey:", (_isEnabled), (CPMenuItemIsEnabledKey));;
    if ((_isHidden) !== (NO)) objj_msgSend(aCoder, "encodeObject:forKey:", (_isHidden), (CPMenuItemIsHiddenKey));;
    if ((_tag) !== (0)) objj_msgSend(aCoder, "encodeObject:forKey:", (_tag), (CPMenuItemTagKey));;
    if ((_state) !== (CPOffState)) objj_msgSend(aCoder, "encodeObject:forKey:", (_state), (CPMenuItemStateKey));;
    if ((_image) !== (nil)) objj_msgSend(aCoder, "encodeObject:forKey:", (_image), (CPMenuItemImageKey));;
    if ((_alternateImage) !== (nil)) objj_msgSend(aCoder, "encodeObject:forKey:", (_alternateImage), (CPMenuItemAlternateImageKey));;
    if ((_submenu) !== (nil)) objj_msgSend(aCoder, "encodeObject:forKey:", (_submenu), (CPMenuItemSubmenuKey));;
    if ((_menu) !== (nil)) objj_msgSend(aCoder, "encodeObject:forKey:", (_menu), (CPMenuItemMenuKey));;
    if ((_representedObject) !== (nil)) objj_msgSend(aCoder, "encodeObject:forKey:", (_representedObject), (CPMenuItemRepresentedObjectKey));;
    if ((_view) !== (nil)) objj_msgSend(aCoder, "encodeObject:forKey:", (_view), (CPMenuItemViewKey));;
}
},["void","CPCoder"])]);
}
var LEFT_MARGIN = 3.0,
    RIGHT_MARGIN = 16.0,
    STATE_COLUMN_WIDTH = 14.0,
    INDENTATION_WIDTH = 17.0,
    VERTICAL_MARGIN = 4.0;
var _CPMenuItemSelectionColor = nil,
    _CPMenuItemTextShadowColor = nil,
    _CPMenuItemDefaultStateImages = [],
    _CPMenuItemDefaultStateHighlightedImages = [];
{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuItem"), new objj_ivar("_font"), new objj_ivar("_textColor"), new objj_ivar("_textShadowColor"), new objj_ivar("_activateColor"), new objj_ivar("_activateShadowColor"), new objj_ivar("_minSize"), new objj_ivar("_isDirty"), new objj_ivar("_showsStateColumn"), new objj_ivar("_belongsToMenuBar"), new objj_ivar("_stateView"), new objj_ivar("_imageAndTextView"), new objj_ivar("_submenuView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:forMenuItem:"), function $_CPMenuItemView__initWithFrame_forMenuItem_(self, _cmd, aFrame, aMenuItem)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _menuItem = aMenuItem;
        _showsStateColumn = YES;
        _isDirty = YES;
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self, "synchronizeWithMenuItem");
    }
    return self;
}
},["id","CGRect","CPMenuItem"]), new objj_method(sel_getUid("minSize"), function $_CPMenuItemView__minSize(self, _cmd)
{ with(self)
{
    return _minSize;
}
},["CGSize"]), new objj_method(sel_getUid("setDirty"), function $_CPMenuItemView__setDirty(self, _cmd)
{ with(self)
{
    _isDirty = YES;
}
},["void"]), new objj_method(sel_getUid("synchronizeWithMenuItem"), function $_CPMenuItemView__synchronizeWithMenuItem(self, _cmd)
{ with(self)
{
    if (!_isDirty)
        return;
    _isDirty = NO;
    var view = objj_msgSend(_menuItem, "view");
    if (objj_msgSend(_menuItem, "isSeparatorItem"))
    {
        var line = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 5.0, 10.0, 1.0));
        view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 10.0));
        objj_msgSend(view, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(line, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(line, "setBackgroundColor:", objj_msgSend(CPColor, "lightGrayColor"));
        objj_msgSend(view, "addSubview:", line);
    }
    if (view)
    {
        objj_msgSend(_imageAndTextView, "removeFromSuperview");
        _imageAndTextView = nil;
        objj_msgSend(_stateView, "removeFromSuperview");
        _stateView = nil;
        objj_msgSend(_submenuView, "removeFromSuperview");
        _submenuView = nil;
        _minSize = objj_msgSend(view, "frame").size;
        objj_msgSend(self, "setFrameSize:", _minSize);
        objj_msgSend(self, "addSubview:", view);
        return;
    }
    var x = _belongsToMenuBar ? 0.0 : (LEFT_MARGIN + objj_msgSend(_menuItem, "indentationLevel") * INDENTATION_WIDTH);
    if (_showsStateColumn)
    {
        if (!_stateView)
        {
            _stateView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(x, (CGRectGetHeight(objj_msgSend(self, "frame")) - STATE_COLUMN_WIDTH) / 2.0, STATE_COLUMN_WIDTH, STATE_COLUMN_WIDTH));
            objj_msgSend(_stateView, "setAutoresizingMask:", CPViewMinYMargin | CPViewMaxYMargin);
            objj_msgSend(self, "addSubview:", _stateView);
        }
        var state = objj_msgSend(_menuItem, "state");
        switch (state)
        {
            case CPOffState:
            case CPOnState:
            case CPMixedState: objj_msgSend(_stateView, "setImage:", _CPMenuItemDefaultStateImages[state]);
                                break;
            default: objj_msgSend(_stateView, "setImage:", nil);
        }
        x += STATE_COLUMN_WIDTH;
    }
    else
    {
        objj_msgSend(_stateView, "removeFromSuperview");
        _stateView = nil;
    }
    if (!_imageAndTextView)
    {
        _imageAndTextView = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 0.0));
        objj_msgSend(_imageAndTextView, "setImagePosition:", CPImageLeft);
        objj_msgSend(_imageAndTextView, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(self, "addSubview:", _imageAndTextView);
    }
    var font = objj_msgSend(_menuItem, "font");
    if (!font)
        font = _font;
    objj_msgSend(_imageAndTextView, "setFont:", font);
    objj_msgSend(_imageAndTextView, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
    objj_msgSend(_imageAndTextView, "setImage:", objj_msgSend(_menuItem, "image"));
    objj_msgSend(_imageAndTextView, "setText:", objj_msgSend(_menuItem, "title"));
    objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
    objj_msgSend(_imageAndTextView, "setTextShadowColor:", objj_msgSend(self, "textShadowColor"));
    objj_msgSend(_imageAndTextView, "setTextShadowOffset:", CGSizeMake(0, 1));
    objj_msgSend(_imageAndTextView, "setFrameOrigin:", CGPointMake(x, VERTICAL_MARGIN));
    objj_msgSend(_imageAndTextView, "sizeToFit");
    var frame = objj_msgSend(_imageAndTextView, "frame");
    frame.size.height += 2 * VERTICAL_MARGIN;
    x += CGRectGetWidth(frame);
    if (objj_msgSend(_menuItem, "hasSubmenu"))
    {
        x += 3.0;
        if (!_submenuView)
        {
            _submenuView = objj_msgSend(objj_msgSend(_CPMenuItemArrowView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 10.0, 10.0));
            objj_msgSend(self, "addSubview:", _submenuView);
        }
        objj_msgSend(_submenuView, "setHidden:", NO);
        objj_msgSend(_submenuView, "setColor:", _belongsToMenuBar ? objj_msgSend(self, "textColor") : nil);
        objj_msgSend(_submenuView, "setFrameOrigin:", CGPointMake(x, (CGRectGetHeight(frame) - 10.0) / 2.0));
        x += 10.0;
    }
    else
        objj_msgSend(_submenuView, "setHidden:", YES);
    _minSize = CGSizeMake(x + (_belongsToMenuBar ? 0.0 : RIGHT_MARGIN) + 3.0, CGRectGetHeight(frame));
    objj_msgSend(self, "setFrameSize:", _minSize);
}
},["void"]), new objj_method(sel_getUid("overlapOffsetWidth"), function $_CPMenuItemView__overlapOffsetWidth(self, _cmd)
{ with(self)
{
    return LEFT_MARGIN + (objj_msgSend(objj_msgSend(_menuItem, "menu"), "showsStateColumn") ? STATE_COLUMN_WIDTH : 0.0);
}
},["CGFloat"]), new objj_method(sel_getUid("setShowsStateColumn:"), function $_CPMenuItemView__setShowsStateColumn_(self, _cmd, shouldShowStateColumn)
{ with(self)
{
    _showsStateColumn = shouldShowStateColumn;
}
},["void","BOOL"]), new objj_method(sel_getUid("setBelongsToMenuBar:"), function $_CPMenuItemView__setBelongsToMenuBar_(self, _cmd, shouldBelongToMenuBar)
{ with(self)
{
    _belongsToMenuBar = shouldBelongToMenuBar;
}
},["void","BOOL"]), new objj_method(sel_getUid("highlight:"), function $_CPMenuItemView__highlight_(self, _cmd, shouldHighlight)
{ with(self)
{
    if (_belongsToMenuBar)
        objj_msgSend(_imageAndTextView, "setImage:", shouldHighlight ? objj_msgSend(_menuItem, "alternateImage") : objj_msgSend(_menuItem, "image"));
    else if (objj_msgSend(_menuItem, "isEnabled"))
    {
        if (shouldHighlight)
        {
            objj_msgSend(self, "setBackgroundColor:", _CPMenuItemSelectionColor);
            objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
            objj_msgSend(_imageAndTextView, "setTextShadowColor:", _CPMenuItemTextShadowColor);
        }
        else
        {
            objj_msgSend(self, "setBackgroundColor:", nil);
            objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
            objj_msgSend(_imageAndTextView, "setTextShadowColor:", objj_msgSend(self, "textShadowColor"));
        }
        var state = objj_msgSend(_menuItem, "state");
        switch (state)
        {
            case CPOffState:
            case CPOnState:
            case CPMixedState: objj_msgSend(_stateView, "setImage:", shouldHighlight ? _CPMenuItemDefaultStateHighlightedImages[state] : _CPMenuItemDefaultStateImages[state]);
                            break;
            default: objj_msgSend(_stateView, "setImage:", nil);
        }
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("activate:"), function $_CPMenuItemView__activate_(self, _cmd, shouldActivate)
{ with(self)
{
    objj_msgSend(_imageAndTextView, "setImage:", objj_msgSend(_menuItem, "image"));
    if (shouldActivate)
    {
        objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "activateColor") || objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(_imageAndTextView, "setTextShadowColor:", objj_msgSend(self, "activateShadowColor") || objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(_submenuView, "setColor:", objj_msgSend(self, "activateColor") || objj_msgSend(CPColor, "whiteColor"));
    }
    else
    {
        objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
        objj_msgSend(_imageAndTextView, "setTextShadowColor:", objj_msgSend(self, "textShadowColor"));
        objj_msgSend(_submenuView, "setColor:", objj_msgSend(self, "textColor"));
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("eventOnSubmenu:"), function $_CPMenuItemView__eventOnSubmenu_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(_menuItem, "hasSubmenu"))
        return NO;
    return CGRectContainsPoint(objj_msgSend(_submenuView, "frame"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil));
}
},["BOOL","CPEvent"]), new objj_method(sel_getUid("isHidden"), function $_CPMenuItemView__isHidden(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menuItem, "isHidden");
}
},["BOOL"]), new objj_method(sel_getUid("menuItem"), function $_CPMenuItemView__menuItem(self, _cmd)
{ with(self)
{
    return _menuItem;
}
},["CPMenuItem"]), new objj_method(sel_getUid("setFont:"), function $_CPMenuItemView__setFont_(self, _cmd, aFont)
{ with(self)
{
    if (_font == aFont)
        return;
    _font = aFont;
    objj_msgSend(self, "setDirty");
}
},["void","CPFont"]), new objj_method(sel_getUid("setTextColor:"), function $_CPMenuItemView__setTextColor_(self, _cmd, aColor)
{ with(self)
{
    if (_textColor == aColor)
        return;
    _textColor = aColor;
    objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
    objj_msgSend(_submenuView, "setColor:", objj_msgSend(self, "textColor"));
}
},["void","CPColor"]), new objj_method(sel_getUid("textColor"), function $_CPMenuItemView__textColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menuItem, "isEnabled") ? (_textColor ? _textColor : objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 70.0 / 255.0, 69.0 / 255.0, 69.0 / 255.0, 1.0)) : objj_msgSend(CPColor, "lightGrayColor");
}
},["CPColor"]), new objj_method(sel_getUid("setTextShadowColor:"), function $_CPMenuItemView__setTextShadowColor_(self, _cmd, aColor)
{ with(self)
{
    if (_textShadowColor == aColor)
        return;
    _textShadowColor = aColor;
    objj_msgSend(_imageAndTextView, "setTextShadowColor:", objj_msgSend(self, "textShadowColor"));
}
},["void","CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $_CPMenuItemView__textShadowColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menuItem, "isEnabled") ? (_textShadowColor ? _textShadowColor : objj_msgSend(CPColor, "colorWithWhite:alpha:", 1.0, 0.8)) : objj_msgSend(CPColor, "colorWithWhite:alpha:", 0.8, 0.8);
}
},["CPColor"]), new objj_method(sel_getUid("setActivateColor:"), function $_CPMenuItemView__setActivateColor_(self, _cmd, aColor)
{ with(self)
{
    _activateColor = aColor;
}
},["void","CPColor"]), new objj_method(sel_getUid("activateColor"), function $_CPMenuItemView__activateColor(self, _cmd)
{ with(self)
{
    return _activateColor;
}
},["CPColor"]), new objj_method(sel_getUid("setActivateShadowColor:"), function $_CPMenuItemView__setActivateShadowColor_(self, _cmd, aColor)
{ with(self)
{
    _activateShadowColor = aColor;
}
},["void","CPColor"]), new objj_method(sel_getUid("activateShadowColor"), function $_CPMenuItemView__activateShadowColor(self, _cmd)
{ with(self)
{
    return _activateShadowColor;
}
},["CPColor"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $_CPMenuItemView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuItemView, "class"))
        return;
    _CPMenuItemSelectionColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 95.0 / 255.0, 131.0 / 255.0, 185.0 / 255.0, 1.0);
    _CPMenuItemTextShadowColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 26.0 / 255.0,  73.0 / 255.0, 109.0 / 255.0, 1.0)
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuItemDefaultStateImages[CPOffState] = nil;
    _CPMenuItemDefaultStateHighlightedImages[CPOffState] = nil;
    _CPMenuItemDefaultStateImages[CPOnState] = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPMenuItem/CPMenuItemOnState.png"), CGSizeMake(14.0, 14.0));
    _CPMenuItemDefaultStateHighlightedImages[CPOnState] = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPMenuItem/CPMenuItemOnStateHighlighted.png"), CGSizeMake(14.0, 14.0));
    _CPMenuItemDefaultStateImages[CPMixedState] = nil;
    _CPMenuItemDefaultStateHighlightedImages[CPMixedState] = nil;
}
},["void"]), new objj_method(sel_getUid("leftMargin"), function $_CPMenuItemView__leftMargin(self, _cmd)
{ with(self)
{
    return LEFT_MARGIN + STATE_COLUMN_WIDTH;
}
},["float"])]);
}
{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemArrowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_color")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setColor:"), function $_CPMenuItemArrowView__setColor_(self, _cmd, aColor)
{ with(self)
{
    if (_color == aColor)
        return;
    _color = aColor;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPColor"]), new objj_method(sel_getUid("drawRect:"), function $_CPMenuItemArrowView__drawRect_(self, _cmd, aRect)
{ with(self)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 1.0, 4.0);
    CGContextAddLineToPoint(context, 9.0, 4.0);
    CGContextAddLineToPoint(context, 5.0, 8.0);
    CGContextAddLineToPoint(context, 1.0, 4.0);
    CGContextClosePath(context);
    CGContextSetFillColor(context, _color);
    CGContextFillPath(context);
}
},["void","CGRect"])]);
}

