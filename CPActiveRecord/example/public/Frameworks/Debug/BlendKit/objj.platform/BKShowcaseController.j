I;16;AppKit/CPTheme.jI;15;AppKit/CPView.jc;19823;
var LEFT_PANEL_WIDTH = 176.0;
var BKLearnMoreToolbarItemIdentifier = "BKLearnMoreToolbarItemIdentifier",
    BKStateToolbarItemIdentifier = "BKStateToolbarItemIdentifier",
    BKBackgroundColorToolbarItemIdentifier = "BKBackgroundColorToolbarItemIdentifier";
{var the_class = objj_allocateClassPair(CPObject, "BKShowcaseController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_themeDescriptorClasses"), new objj_ivar("_themesCollectionView"), new objj_ivar("_themedObjectsCollectionView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function(self, _cmd, aNotification)
{ with(self)
{
    _themeDescriptorClasses = objj_msgSend(BKThemeDescriptor, "allThemeDescriptorClasses");
    var theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask),
        toolbar = objj_msgSend(objj_msgSend(CPToolbar, "alloc"), "initWithIdentifier:", "Toolbar");
    objj_msgSend(toolbar, "setDelegate:", self);
    objj_msgSend(theWindow, "setToolbar:", toolbar);
    var contentView = objj_msgSend(theWindow, "contentView"),
        bounds = objj_msgSend(contentView, "bounds"),
        splitView = objj_msgSend(objj_msgSend(CPSplitView, "alloc"), "initWithFrame:", bounds);
    objj_msgSend(splitView, "setIsPaneSplitter:", YES);
    objj_msgSend(splitView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(contentView, "addSubview:", splitView);
    var label = objj_msgSend(CPTextField, "labelWithTitle:", "THEMES");
    objj_msgSend(label, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 11.0));
    objj_msgSend(label, "setTextColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 93.0 / 255.0, 93.0 / 255.0, 93.0 / 255.0, 1.0));
    objj_msgSend(label, "setTextShadowColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 225.0 / 255.0, 255.0 / 255.0, 255.0 / 255.0, 0.7));
    objj_msgSend(label, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
    objj_msgSend(label, "sizeToFit");
    objj_msgSend(label, "setFrameOrigin:", CGPointMake(5.0, 4.0));
    var themeDescriptorItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
    objj_msgSend(themeDescriptorItem, "setView:", objj_msgSend(objj_msgSend(BKThemeDescriptorCell, "alloc"), "init"));
    _themesCollectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, LEFT_PANEL_WIDTH, CGRectGetHeight(bounds)));
    objj_msgSend(_themesCollectionView, "setDelegate:", self);
    objj_msgSend(_themesCollectionView, "setItemPrototype:", themeDescriptorItem);
    objj_msgSend(_themesCollectionView, "setMinItemSize:", CGSizeMake(20.0, 36.0));
    objj_msgSend(_themesCollectionView, "setMaxItemSize:", CGSizeMake(10000000.0, 36.0));
    objj_msgSend(_themesCollectionView, "setMaxNumberOfColumns:", 1);
    objj_msgSend(_themesCollectionView, "setContent:", _themeDescriptorClasses);
    objj_msgSend(_themesCollectionView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(_themesCollectionView, "setVerticalMargin:", 0.0);
    objj_msgSend(_themesCollectionView, "setSelectable:", YES);
    objj_msgSend(_themesCollectionView, "setFrameOrigin:", CGPointMake(0.0, 20.0));
    objj_msgSend(_themesCollectionView, "setAutoresizingMask:", CPViewWidthSizable);
    var scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, LEFT_PANEL_WIDTH, CGRectGetHeight(bounds))),
        contentView = objj_msgSend(scrollView, "contentView");
    objj_msgSend(scrollView, "setAutohidesScrollers:", YES);
    objj_msgSend(scrollView, "setDocumentView:", _themesCollectionView);
    objj_msgSend(contentView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", 212.0 / 255.0, 221.0 / 255.0, 230.0 / 255.0, 1.0));
    objj_msgSend(contentView, "addSubview:", label);
    objj_msgSend(splitView, "addSubview:", scrollView);
    _themedObjectsCollectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds) - LEFT_PANEL_WIDTH - 1.0, 10.0));
    var collectionViewItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
    objj_msgSend(collectionViewItem, "setView:", objj_msgSend(objj_msgSend(BKShowcaseCell, "alloc"), "init"));
    objj_msgSend(_themedObjectsCollectionView, "setItemPrototype:", collectionViewItem);
    objj_msgSend(_themedObjectsCollectionView, "setVerticalMargin:", 20.0);
    objj_msgSend(_themedObjectsCollectionView, "setAutoresizingMask:", CPViewWidthSizable);
    var scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMake(LEFT_PANEL_WIDTH + 1.0, 0.0, CGRectGetWidth(bounds) - LEFT_PANEL_WIDTH - 1.0, CGRectGetHeight(bounds)));
    objj_msgSend(scrollView, "setHasHorizontalScroller:", NO);
    objj_msgSend(scrollView, "setAutohidesScrollers:", YES);
    objj_msgSend(scrollView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(scrollView, "setDocumentView:", _themedObjectsCollectionView);
    objj_msgSend(splitView, "addSubview:", scrollView);
    objj_msgSend(_themesCollectionView, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", 0));
    objj_msgSend(theWindow, "setFullBridge:", YES);
    objj_msgSend(theWindow, "makeKeyAndOrderFront:", self);
}
}), new objj_method(sel_getUid("collectionViewDidChangeSelection:"), function(self, _cmd, aCollectionView)
{ with(self)
{
    var themeDescriptorClass = _themeDescriptorClasses[objj_msgSend(objj_msgSend(aCollectionView, "selectionIndexes"), "firstIndex")],
        itemSize = objj_msgSend(themeDescriptorClass, "itemSize");
    itemSize.width = MAX(100.0, itemSize.width + 20.0);
    itemSize.height = MAX(100.0, itemSize.height + 30.0);
    objj_msgSend(_themedObjectsCollectionView, "setMinItemSize:", itemSize);
    objj_msgSend(_themedObjectsCollectionView, "setMaxItemSize:", itemSize);
    objj_msgSend(_themedObjectsCollectionView, "setContent:", objj_msgSend(themeDescriptorClass, "themedObjectTemplates"));
    objj_msgSend(BKShowcaseCell, "setBackgroundColor:", objj_msgSend(themeDescriptorClass, "showcaseBackgroundColor"));
}
}), new objj_method(sel_getUid("hasLearnMoreURL"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "BKLearnMoreURL");
}
}), new objj_method(sel_getUid("toolbarAllowedItemIdentifiers:"), function(self, _cmd, aToolbar)
{ with(self)
{
    return [BKLearnMoreToolbarItemIdentifier, CPToolbarSpaceItemIdentifier, CPToolbarFlexibleSpaceItemIdentifier, BKBackgroundColorToolbarItemIdentifier, BKStateToolbarItemIdentifier];
}
}), new objj_method(sel_getUid("toolbarDefaultItemIdentifiers:"), function(self, _cmd, aToolbar)
{ with(self)
{
    var itemIdentifiers = [CPToolbarFlexibleSpaceItemIdentifier, BKBackgroundColorToolbarItemIdentifier, BKStateToolbarItemIdentifier];
    if (objj_msgSend(self, "hasLearnMoreURL"))
        itemIdentifiers = [BKLearnMoreToolbarItemIdentifier].concat(itemIdentifiers);
    return itemIdentifiers;
}
}), new objj_method(sel_getUid("toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:"), function(self, _cmd, aToolbar, anItemIdentifier, aFlag)
{ with(self)
{
    var toolbarItem = objj_msgSend(objj_msgSend(CPToolbarItem, "alloc"), "initWithItemIdentifier:", anItemIdentifier);
    objj_msgSend(toolbarItem, "setTarget:", self);
    if (anItemIdentifier === BKStateToolbarItemIdentifier)
    {
        var popUpButton = objj_msgSend(CPPopUpButton, "buttonWithTitle:", "Enabled");
        objj_msgSend(popUpButton, "addItemWithTitle:", "Disabled");
        objj_msgSend(toolbarItem, "setView:", popUpButton);
        objj_msgSend(toolbarItem, "setTarget:", nil);
        objj_msgSend(toolbarItem, "setAction:", sel_getUid("changeState:"));
        objj_msgSend(toolbarItem, "setLabel:", "State");
        var width = CGRectGetWidth(objj_msgSend(popUpButton, "frame"));
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(width + 20.0, 32.0));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(width + 20.0, 32.0));
    }
    else if (anItemIdentifier === BKBackgroundColorToolbarItemIdentifier)
    {
        var popUpButton = objj_msgSend(CPPopUpButton, "buttonWithTitle:", "Window Background");
        objj_msgSend(popUpButton, "addItemWithTitle:", "Light Checkers");
        objj_msgSend(popUpButton, "addItemWithTitle:", "Dark Checkers");
        objj_msgSend(popUpButton, "addItemWithTitle:", "White");
        objj_msgSend(popUpButton, "addItemWithTitle:", "Black");
        objj_msgSend(popUpButton, "addItemWithTitle:", "More Choices...");
        var itemArray = objj_msgSend(popUpButton, "itemArray");
        objj_msgSend(itemArray[0], "setRepresentedObject:", objj_msgSend(BKThemeDescriptor, "windowBackgroundColor"));
        objj_msgSend(itemArray[1], "setRepresentedObject:", objj_msgSend(BKThemeDescriptor, "lightCheckersColor"));
        objj_msgSend(itemArray[2], "setRepresentedObject:", objj_msgSend(BKThemeDescriptor, "darkCheckersColor"));
        objj_msgSend(itemArray[3], "setRepresentedObject:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(itemArray[4], "setRepresentedObject:", objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(toolbarItem, "setView:", popUpButton);
        objj_msgSend(toolbarItem, "setTarget:", nil);
        objj_msgSend(toolbarItem, "setAction:", sel_getUid("changeColor:"));
        objj_msgSend(toolbarItem, "setLabel:", "Background Color");
        var width = CGRectGetWidth(objj_msgSend(popUpButton, "frame"));
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(width, 32.0));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(width, 32.0));
    }
    else if (anItemIdentifier === BKLearnMoreToolbarItemIdentifier)
    {
        var title = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "BKLearnMoreButtonTitle");
        if (!title)
            title = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "CPBundleName") || "Home Page";
        var button = objj_msgSend(CPButton, "buttonWithTitle:", title);
        objj_msgSend(button, "setDefaultButton:", YES);
        objj_msgSend(toolbarItem, "setView:", button);
        objj_msgSend(toolbarItem, "setLabel:", "Learn More");
        objj_msgSend(toolbarItem, "setTarget:", nil);
        objj_msgSend(toolbarItem, "setAction:", sel_getUid("learnMore:"));
        var width = CGRectGetWidth(objj_msgSend(button, "frame"));
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(width, 32.0));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(width, 32.0));
    }
    return toolbarItem;
}
}), new objj_method(sel_getUid("learnMore:"), function(self, _cmd, aSender)
{ with(self)
{
    window.location.href = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "BKLearnMoreURL");
}
}), new objj_method(sel_getUid("selectedThemeDescriptor"), function(self, _cmd)
{ with(self)
{
    return _themeDescriptorClasses[objj_msgSend(objj_msgSend(_themesCollectionView, "selectionIndexes"), "firstIndex")];
}
}), new objj_method(sel_getUid("changeState:"), function(self, _cmd, aSender)
{ with(self)
{
    var themedObjectTemplates = objj_msgSend(objj_msgSend(self, "selectedThemeDescriptor"), "themedObjectTemplates"),
        count = objj_msgSend(themedObjectTemplates, "count");
    while (count--)
    {
        var themedObject = objj_msgSend(themedObjectTemplates[count], "valueForKey:", "themedObject");
        if (objj_msgSend(themedObject, "respondsToSelector:", sel_getUid("setEnabled:")))
            objj_msgSend(themedObject, "setEnabled:", objj_msgSend(aSender, "title") === "Enabled" ? YES : NO);
    }
}
}), new objj_method(sel_getUid("changeColor:"), function(self, _cmd, aSender)
{ with(self)
{
    var color = nil;
    if (objj_msgSend(aSender, "isKindOfClass:", objj_msgSend(CPColorPanel, "class")))
        color = objj_msgSend(aSender, "color");
    else
    {
        if (objj_msgSend(aSender, "titleOfSelectedItem") === "More Choices...")
        {
            objj_msgSend(aSender, "addItemWithTitle:", "Other");
            objj_msgSend(aSender, "selectItemWithTitle:", "Other");
            objj_msgSend(CPApp, "orderFrontColorPanel:", self);
        }
        else
        {
            color = objj_msgSend(objj_msgSend(aSender, "selectedItem"), "representedObject");
            objj_msgSend(aSender, "removeItemWithTitle:", "Other");
        }
    }
    if (color)
    {
        objj_msgSend(objj_msgSend(self, "selectedThemeDescriptor"), "setShowcaseBackgroundColor:", color);
        objj_msgSend(BKShowcaseCell, "setBackgroundColor:", color);
    }
}
})]);
}
var SelectionColor = nil;
{var the_class = objj_allocateClassPair(CPView, "BKThemeDescriptorCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_label")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setRepresentedObject:"), function(self, _cmd, aThemeDescriptor)
{ with(self)
{
    if (!_label)
    {
        _label = objj_msgSend(CPTextField, "labelWithTitle:", "hello");
        objj_msgSend(_label, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
        objj_msgSend(_label, "setFrame:", CGRectMake(10.0, 0.0, CGRectGetWidth(objj_msgSend(self, "bounds")) - 20.0, CGRectGetHeight(objj_msgSend(self, "bounds"))));
        objj_msgSend(_label, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
        objj_msgSend(_label, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "addSubview:", _label);
    }
    objj_msgSend(_label, "setStringValue:", objj_msgSend(aThemeDescriptor, "themeName") + " (" + objj_msgSend(objj_msgSend(aThemeDescriptor, "themedObjectTemplates"), "count") + ")");
}
}), new objj_method(sel_getUid("setSelected:"), function(self, _cmd, isSelected)
{ with(self)
{
    objj_msgSend(self, "setBackgroundColor:", isSelected ? objj_msgSend(objj_msgSend(self, "class"), "selectionColor") : nil);
    objj_msgSend(_label, "setTextShadowOffset:", isSelected ? CGSizeMake(0.0, 1.0) : CGSizeMakeZero());
    objj_msgSend(_label, "setTextShadowColor:", isSelected ? objj_msgSend(CPColor, "blackColor") : nil);
    objj_msgSend(_label, "setFont:", isSelected ? objj_msgSend(CPFont, "boldSystemFontOfSize:", 11.0) : objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
    objj_msgSend(_label, "setTextColor:", isSelected ? objj_msgSend(CPColor, "whiteColor") : objj_msgSend(CPColor, "blackColor"));
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("selectionColor"), function(self, _cmd)
{ with(self)
{
    if (!SelectionColor)
        SelectionColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(BKThemeDescriptorCell, "class")), "pathForResource:", "selection.png"), CGSizeMake(1.0, 36.0)));
    return SelectionColor;
}
})]);
}
var ShowcaseCellBackgroundColor = nil;
var BKShowcaseCellBackgroundColorDidChangeNotification = "BKShowcaseCellBackgroundColorDidChangeNotification";
{var the_class = objj_allocateClassPair(CPView, "BKShowcaseCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_backgroundView"), new objj_ivar("_view"), new objj_ivar("_label")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "init");
    if (self)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("showcaseBackgroundDidChange:"), BKShowcaseCellBackgroundColorDidChangeNotification, nil);
    return self;
}
}), new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);
    if (self)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("showcaseBackgroundDidChange:"), BKShowcaseCellBackgroundColorDidChangeNotification, nil);
    return self;
}
}), new objj_method(sel_getUid("showcaseBackgroundDidChange:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(_backgroundView, "setBackgroundColor:", objj_msgSend(BKShowcaseCell, "backgroundColor"));
}
}), new objj_method(sel_getUid("setSelected:"), function(self, _cmd, isSelected)
{ with(self)
{
}
}), new objj_method(sel_getUid("setRepresentedObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (!_label)
    {
        _label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_label, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(_label, "setAutoresizingMask:", CPViewMinYMargin | CPViewWidthSizable);
        objj_msgSend(_label, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 11.0));
        objj_msgSend(self, "addSubview:", _label);
    }
    objj_msgSend(_label, "setStringValue:", objj_msgSend(anObject, "valueForKey:", "label"));
    objj_msgSend(_label, "sizeToFit");
    objj_msgSend(_label, "setFrame:", CGRectMake(0.0, CGRectGetHeight(objj_msgSend(self, "bounds")) - CGRectGetHeight(objj_msgSend(_label, "frame")),
        CGRectGetWidth(objj_msgSend(self, "bounds")), CGRectGetHeight(objj_msgSend(_label, "frame"))));
    if (!_backgroundView)
    {
        _backgroundView = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
        objj_msgSend(self, "addSubview:", _backgroundView);
    }
    objj_msgSend(_backgroundView, "setFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(objj_msgSend(self, "bounds")), CGRectGetMinY(objj_msgSend(_label, "frame"))));
    objj_msgSend(_backgroundView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    if (_view)
        objj_msgSend(_view, "removeFromSuperview");
    _view = objj_msgSend(anObject, "valueForKey:", "themedObject");
    objj_msgSend(_view, "setTheme:", nil);
    objj_msgSend(_view, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin);
    objj_msgSend(_view, "setFrameOrigin:", CGPointMake((CGRectGetWidth(objj_msgSend(_backgroundView, "bounds")) - CGRectGetWidth(objj_msgSend(_view, "frame"))) / 2.0,
        (CGRectGetHeight(objj_msgSend(_backgroundView, "bounds")) - CGRectGetHeight(objj_msgSend(_view, "frame"))) / 2.0));
    objj_msgSend(_backgroundView, "addSubview:", _view);
    objj_msgSend(_backgroundView, "setBackgroundColor:", objj_msgSend(BKShowcaseCell, "backgroundColor"));
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("setBackgroundColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (ShowcaseCellBackgroundColor === aColor)
        return;
    ShowcaseCellBackgroundColor = aColor;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", BKShowcaseCellBackgroundColorDidChangeNotification, nil);
}
}), new objj_method(sel_getUid("backgroundColor"), function(self, _cmd)
{ with(self)
{
    return ShowcaseCellBackgroundColor;
}
})]);
}

