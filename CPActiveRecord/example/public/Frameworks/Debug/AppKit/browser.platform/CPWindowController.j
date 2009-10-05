I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;13;CPResponder.ji;10;CPWindow.ji;12;CPDocument.jc;11212;
{var the_class = objj_allocateClassPair(CPResponder, "CPWindowController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_document"), new objj_ivar("_shouldCloseDocument"), new objj_ivar("_cibOwner"), new objj_ivar("_windowCibName"), new objj_ivar("_windowCibPath"), new objj_ivar("_viewController"), new objj_ivar("_viewControllerContainerView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPWindowController__init(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithWindow:", nil);
}
},["id"]), new objj_method(sel_getUid("initWithWindow:"), function $CPWindowController__initWithWindow_(self, _cmd, aWindow)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        objj_msgSend(self, "setWindow:", aWindow);
        objj_msgSend(self, "setShouldCloseDocument:", NO);
        objj_msgSend(self, "setNextResponder:", CPApp);
    }
    return self;
}
},["id","CPWindow"]), new objj_method(sel_getUid("initWithWindowCibName:"), function $CPWindowController__initWithWindowCibName_(self, _cmd, aWindowCibName)
{ with(self)
{
    return objj_msgSend(self, "initWithWindowCibName:owner:", aWindowCibName, self);
}
},["id","CPString"]), new objj_method(sel_getUid("initWithWindowCibName:owner:"), function $CPWindowController__initWithWindowCibName_owner_(self, _cmd, aWindowCibName, anOwner)
{ with(self)
{
    self = objj_msgSend(self, "initWithWindow:", nil);
    if (self)
    {
        _cibOwner = anOwner;
        _windowCibName = aWindowCibName;
    }
    return self;
}
},["id","CPString","id"]), new objj_method(sel_getUid("initWithWindowCibPath:owner:"), function $CPWindowController__initWithWindowCibPath_owner_(self, _cmd, aWindowCibPath, anOwner)
{ with(self)
{
    self = objj_msgSend(self, "initWithWindow:", nil);
    if (self)
    {
        _cibOwner = anOwner;
        _windowCibPath = aWindowCibPath;
    }
    return self;
}
},["id","CPString","id"]), new objj_method(sel_getUid("loadWindow"), function $CPWindowController__loadWindow(self, _cmd)
{ with(self)
{
    if (_window)
        return;
    objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_cibOwner, "class")), "loadCibFile:externalNameTable:", objj_msgSend(self, "windowCibPath"), objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", _cibOwner, CPCibOwner));
}
},["void"]), new objj_method(sel_getUid("showWindow:"), function $CPWindowController__showWindow_(self, _cmd, aSender)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window");
 if (objj_msgSend(theWindow, "respondsToSelector:", sel_getUid("becomesKeyOnlyIfNeeded")) && objj_msgSend(theWindow, "becomesKeyOnlyIfNeeded"))
        objj_msgSend(theWindow, "orderFront:", aSender);
    else
        objj_msgSend(theWindow, "makeKeyAndOrderFront:", aSender);
}
},["@action","id"]), new objj_method(sel_getUid("isWindowLoaded"), function $CPWindowController__isWindowLoaded(self, _cmd)
{ with(self)
{
    return _window !== nil;
}
},["BOOL"]), new objj_method(sel_getUid("window"), function $CPWindowController__window(self, _cmd)
{ with(self)
{
    if (!_window)
    {
        objj_msgSend(self, "windowWillLoad");
        objj_msgSend(_document, "windowControllerWillLoadCib:", self);
        objj_msgSend(self, "loadWindow");
        if (_window === nil && objj_msgSend(_cibOwner, "isKindOfClass:", objj_msgSend(CPDocument, "class")))
            objj_msgSend(self, "setWindow:", objj_msgSend(_cibOwner, "valueForKey:", "window"));
        objj_msgSend(self, "windowDidLoad");
        objj_msgSend(_document, "windowControllerDidLoadCib:", self);
        objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
    }
    return _window;
}
},["CPWindow"]), new objj_method(sel_getUid("setWindow:"), function $CPWindowController__setWindow_(self, _cmd, aWindow)
{ with(self)
{
    objj_msgSend(_window, "setWindowController:", nil);
    _window = aWindow;
    objj_msgSend(_window, "setWindowController:", self);
    objj_msgSend(_window, "setNextResponder:", self);
}
},["void","CPWindow"]), new objj_method(sel_getUid("windowDidLoad"), function $CPWindowController__windowDidLoad(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("windowWillLoad"), function $CPWindowController__windowWillLoad(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("setDocument:"), function $CPWindowController__setDocument_(self, _cmd, aDocument)
{ with(self)
{
    if (_document === aDocument)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_document)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentWillSaveNotification, _document);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentDidSaveNotification, _document);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentDidFailToSaveNotification, _document);
    }
    _document = aDocument;
    if (_document)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentWillSave:"), CPDocumentWillSaveNotification, _document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidSave:"), CPDocumentDidSaveNotification, _document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidFailToSave:"), CPDocumentDidFailToSaveNotification, _document);
        objj_msgSend(self, "setDocumentEdited:", objj_msgSend(_document, "isDocumentEdited"));
    }
    var viewController = objj_msgSend(_document, "viewControllerForWindowController:", self);
    if (viewController)
        objj_msgSend(self, "setViewController:", viewController);
    objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
}
},["void","CPDocument"]), new objj_method(sel_getUid("setViewController:"), function $CPWindowController__setViewController_(self, _cmd, aViewController)
{ with(self)
{
    var containerView = objj_msgSend(self, "viewControllerContainerView") || objj_msgSend(objj_msgSend(self, "window"), "contentView"),
        view = objj_msgSend(_viewController, "view"),
        frame = view ? objj_msgSend(view, "frame") : objj_msgSend(containerView, "bounds");
    objj_msgSend(view, "removeFromSuperview");
    _viewController = aViewController;
    view = objj_msgSend(_viewController, "view");
    if (view)
    {
        objj_msgSend(view, "setFrame:", frame);
        objj_msgSend(containerView, "addSubview:", view);
    }
}
},["void","CPViewController"]), new objj_method(sel_getUid("setViewControllerContainerView:"), function $CPWindowController__setViewControllerContainerView_(self, _cmd, aView)
{ with(self)
{
    _viewControllerContainerView = aView;
}
},["void","CPView"]), new objj_method(sel_getUid("viewControllerContainerView"), function $CPWindowController__viewControllerContainerView(self, _cmd)
{ with(self)
{
    return _viewControllerContainerView;
}
},["void"]), new objj_method(sel_getUid("setViewController:"), function $CPWindowController__setViewController_(self, _cmd, aViewController)
{ with(self)
{
    var containerView = objj_msgSend(self, "viewControllerContainerView") || objj_msgSend(objj_msgSend(self, "window"), "contentView"),
        view = objj_msgSend(_viewController, "view"),
        frame = view ? objj_msgSend(view, "frame") : objj_msgSend(containerView, "bounds");
    objj_msgSend(view, "removeFromSuperview");
    _viewController = aViewController;
    view = objj_msgSend(_viewController, "view");
    if (view)
    {
        objj_msgSend(view, "setFrame:", frame);
        objj_msgSend(containerView, "addSubview:", view);
    }
}
},["void","CPViewController"]), new objj_method(sel_getUid("viewController"), function $CPWindowController__viewController(self, _cmd)
{ with(self)
{
    return _viewController;
}
},["CPViewController"]), new objj_method(sel_getUid("_documentWillSave:"), function $CPWindowController___documentWillSave_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", YES);
}
},["void","CPNotification"]), new objj_method(sel_getUid("_documentDidSave:"), function $CPWindowController___documentDidSave_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
},["void","CPNotification"]), new objj_method(sel_getUid("_documentDidFailToSave:"), function $CPWindowController___documentDidFailToSave_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
},["void","CPNotification"]), new objj_method(sel_getUid("document"), function $CPWindowController__document(self, _cmd)
{ with(self)
{
    return _document;
}
},["CPDocument"]), new objj_method(sel_getUid("setDocumentEdited:"), function $CPWindowController__setDocumentEdited_(self, _cmd, isEdited)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentEdited:", isEdited);
}
},["void","BOOL"]), new objj_method(sel_getUid("close"), function $CPWindowController__close(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "close");
}
},["void"]), new objj_method(sel_getUid("setShouldCloseDocument:"), function $CPWindowController__setShouldCloseDocument_(self, _cmd, shouldCloseDocument)
{ with(self)
{
    _shouldCloseDocument = shouldCloseDocument;
}
},["void","BOOL"]), new objj_method(sel_getUid("shouldCloseDocument"), function $CPWindowController__shouldCloseDocument(self, _cmd)
{ with(self)
{
    return _shouldCloseDocument;
}
},["BOOL"]), new objj_method(sel_getUid("owner"), function $CPWindowController__owner(self, _cmd)
{ with(self)
{
    return _cibOwner;
}
},["id"]), new objj_method(sel_getUid("windowCibName"), function $CPWindowController__windowCibName(self, _cmd)
{ with(self)
{
    if (_windowCibName)
        return _windowCibName;
    return objj_msgSend(objj_msgSend(_windowCibPath, "lastPathComponent"), "stringByDeletingPathExtension");
}
},["CPString"]), new objj_method(sel_getUid("windowCibPath"), function $CPWindowController__windowCibPath(self, _cmd)
{ with(self)
{
    if (_windowCibPath)
        return _windowCibPath;
    return objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_cibOwner, "class")), "pathForResource:", _windowCibName + ".cib");
}
},["CPString"]), new objj_method(sel_getUid("synchronizeWindowTitleWithDocumentName"), function $CPWindowController__synchronizeWindowTitleWithDocumentName(self, _cmd)
{ with(self)
{
    if (!_document || !_window)
        return;
    objj_msgSend(_window, "setTitle:", objj_msgSend(self, "windowTitleForDocumentDisplayName:", objj_msgSend(_document, "displayName")));
}
},["void"]), new objj_method(sel_getUid("windowTitleForDocumentDisplayName:"), function $CPWindowController__windowTitleForDocumentDisplayName_(self, _cmd, aDisplayName)
{ with(self)
{
    return aDisplayName;
}
},["CPString","CPString"])]);
}

