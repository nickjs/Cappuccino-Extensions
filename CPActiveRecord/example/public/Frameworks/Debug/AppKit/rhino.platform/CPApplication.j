I;21;Foundation/CPBundle.ji;17;CPCompatibility.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;22;CPDocumentController.ji;14;CPThemeBlend.ji;14;CPCibLoading.ji;12;CPPlatform.jc;26578;
var CPMainCibFile = "CPMainCibFile",
    CPMainCibFileHumanFriendly = "Main cib file base name";
CPApp = nil;
CPApplicationWillFinishLaunchingNotification = "CPApplicationWillFinishLaunchingNotification";
CPApplicationDidFinishLaunchingNotification = "CPApplicationDidFinishLaunchingNotification";
CPRunStoppedResponse = -1000;
CPRunAbortedResponse = -1001;
CPRunContinuesResponse = -1002;
{var the_class = objj_allocateClassPair(CPResponder, "CPApplication"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_eventListeners"), new objj_ivar("_currentEvent"), new objj_ivar("_windows"), new objj_ivar("_keyWindow"), new objj_ivar("_mainWindow"), new objj_ivar("_mainMenu"), new objj_ivar("_documentController"), new objj_ivar("_currentSession"), new objj_ivar("_delegate"), new objj_ivar("_finishedLaunching"), new objj_ivar("_namedArgs"), new objj_ivar("_args"), new objj_ivar("_fullArgsString")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPApplication__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        _eventListeners = [];
        _windows = [];
        objj_msgSend(_windows, "addObject:", nil);
        _mainMenu = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", "MainMenu");
        objj_msgSend(_mainMenu, "setAutoenablesItems:", NO);
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPApplication, "class")),
            newMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "New", sel_getUid("newDocument:"), "N");
        objj_msgSend(newMenuItem, "setImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/New.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(newMenuItem, "setAlternateImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/NewHighlighted.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(_mainMenu, "addItem:", newMenuItem);
        var openMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Open", sel_getUid("openDocument:"), "O");
        objj_msgSend(openMenuItem, "setImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/Open.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(openMenuItem, "setAlternateImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/OpenHighlighted.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(_mainMenu, "addItem:", openMenuItem);
        var saveMenu = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", "Save"),
            saveMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Save", sel_getUid("saveDocument:"), nil);
        objj_msgSend(saveMenuItem, "setImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/Save.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(saveMenuItem, "setAlternateImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/SaveHighlighted.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(saveMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Save", sel_getUid("saveDocument:"), "S"));
        objj_msgSend(saveMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Save As", sel_getUid("saveDocumentAs:"), nil));
        objj_msgSend(saveMenuItem, "setSubmenu:", saveMenu);
        objj_msgSend(_mainMenu, "addItem:", saveMenuItem);
        var editMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Edit", nil, nil),
            editMenu = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", "Edit"),
            undoMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Undo", sel_getUid("undo:"), CPUndoKeyEquivalent),
            redoMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Redo", sel_getUid("redo:"), CPRedoKeyEquivalent);
        objj_msgSend(undoMenuItem, "setKeyEquivalentModifierMask:", CPUndoKeyEquivalentModifierMask);
        objj_msgSend(redoMenuItem, "setKeyEquivalentModifierMask:", CPRedoKeyEquivalentModifierMask);
        objj_msgSend(editMenu, "addItem:", undoMenuItem);
        objj_msgSend(editMenu, "addItem:", redoMenuItem);
        objj_msgSend(editMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Cut", sel_getUid("cut:"), "X")),
        objj_msgSend(editMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Copy", sel_getUid("copy:"), "C")),
        objj_msgSend(editMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Paste", sel_getUid("paste:"), "V"));
        objj_msgSend(editMenuItem, "setSubmenu:", editMenu);
        objj_msgSend(editMenuItem, "setHidden:", YES);
        objj_msgSend(_mainMenu, "addItem:", editMenuItem);
        objj_msgSend(_mainMenu, "addItem:", objj_msgSend(CPMenuItem, "separatorItem"));
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPApplication__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate == aDelegate)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_delegate)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPApplicationWillFinishLaunchingNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPApplicationDidFinishLaunchingNotification, self);
    }
    _delegate = aDelegate;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("applicationWillFinishLaunching:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("applicationWillFinishLaunching:"), CPApplicationWillFinishLaunchingNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("applicationDidFinishLaunching:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("applicationDidFinishLaunching:"), CPApplicationDidFinishLaunchingNotification, self);
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $CPApplication__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("finishLaunching"), function $CPApplication__finishLaunching(self, _cmd)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "mainBundle"),
        types = objj_msgSend(bundle, "objectForInfoDictionaryKey:", "CPBundleDocumentTypes");
    if (objj_msgSend(types, "count") > 0)
        _documentController = objj_msgSend(CPDocumentController, "sharedDocumentController");
    var delegateClassName = objj_msgSend(bundle, "objectForInfoDictionaryKey:", "CPApplicationDelegateClass");
    if (delegateClassName)
    {
        var delegateClass = objj_getClass(delegateClassName);
        if (delegateClass)
            if (objj_msgSend(_documentController, "class") == delegateClass)
                objj_msgSend(self, "setDelegate:", _documentController);
            else
                objj_msgSend(self, "setDelegate:", objj_msgSend(objj_msgSend(delegateClass, "alloc"), "init"));
    }
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPApplicationWillFinishLaunchingNotification, self);
    var filename = window.cpOpeningFilename && window.cpOpeningFilename(),
        needsUntitled = !!_documentController;
    if (objj_msgSend(filename, "length"))
    {
        needsUntitled = !objj_msgSend(self, "_openFile:", filename);
    }
    if (needsUntitled && objj_msgSend(_delegate, "respondsToSelector:",  sel_getUid("applicationShouldOpenUntitledFile:")))
        needsUntitled = objj_msgSend(_delegate, "applicationShouldOpenUntitledFile:", self);
    if (needsUntitled)
        objj_msgSend(_documentController, "newDocument:", self);
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPApplicationDidFinishLaunchingNotification, self);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    _finishedLaunching = YES;
}
},["void"]), new objj_method(sel_getUid("terminate:"), function $CPApplication__terminate_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(CPPlatform, "terminateApplication");
}
},["void","id"]), new objj_method(sel_getUid("run"), function $CPApplication__run(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "finishLaunching");
}
},["void"]), new objj_method(sel_getUid("runModalForWindow:"), function $CPApplication__runModalForWindow_(self, _cmd, aWindow)
{ with(self)
{
    objj_msgSend(self, "runModalSession:", objj_msgSend(self, "beginModalSessionForWindow:", aWindow));
}
},["void","CPWindow"]), new objj_method(sel_getUid("stopModalWithCode:"), function $CPApplication__stopModalWithCode_(self, _cmd, aCode)
{ with(self)
{
    if (!_currentSession)
    {
        return;
    }
    _currentSession._state = aCode;
    _currentSession = _currentSession._previous;
        objj_msgSend(self, "_removeRunModalLoop");
}
},["void","int"]), new objj_method(sel_getUid("_removeRunModalLoop"), function $CPApplication___removeRunModalLoop(self, _cmd)
{ with(self)
{
    var count = _eventListeners.length;
    while (count--)
        if (_eventListeners[count]._callback === _CPRunModalLoop)
        {
            _eventListeners.splice(count, 1);
            return;
        }
}
},["void"]), new objj_method(sel_getUid("stopModal"), function $CPApplication__stopModal(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "stopModalWithCode:", CPRunStoppedResponse)
}
},["void"]), new objj_method(sel_getUid("abortModal"), function $CPApplication__abortModal(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "stopModalWithCode:", CPRunAbortedResponse);
}
},["void"]), new objj_method(sel_getUid("beginModalSessionForWindow:"), function $CPApplication__beginModalSessionForWindow_(self, _cmd, aWindow)
{ with(self)
{
    return _CPModalSessionMake(aWindow, 0);
}
},["CPModalSession","CPWindow"]), new objj_method(sel_getUid("runModalSession:"), function $CPApplication__runModalSession_(self, _cmd, aModalSession)
{ with(self)
{
    aModalSession._previous = _currentSession;
    _currentSession = aModalSession;
    var theWindow = aModalSession._window;
    objj_msgSend(theWindow, "center");
    objj_msgSend(theWindow, "makeKeyAndOrderFront:", self);
    objj_msgSend(CPApp, "setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:", _CPRunModalLoop, CPAnyEventMask, nil, 0, NO);
}
},["void","CPModalSession"]), new objj_method(sel_getUid("modalWindow"), function $CPApplication__modalWindow(self, _cmd)
{ with(self)
{
    if (!_currentSession)
        return nil;
    return _currentSession._window;
}
},["CPWindow"]), new objj_method(sel_getUid("_handleKeyEquivalent:"), function $CPApplication___handleKeyEquivalent_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(_mainMenu, "performKeyEquivalent:", anEvent))
        return YES;
    return NO;
}
},["BOOL","CPEvent"]), new objj_method(sel_getUid("sendEvent:"), function $CPApplication__sendEvent_(self, _cmd, anEvent)
{ with(self)
{
    _currentEvent = anEvent;
    if (objj_msgSend(anEvent, "type") == CPKeyDown &&
        objj_msgSend(anEvent, "modifierFlags") & (CPCommandKeyMask | CPControlKeyMask) &&
        objj_msgSend(objj_msgSend(anEvent, "characters"), "length") > 0 &&
        objj_msgSend(self, "_handleKeyEquivalent:", anEvent))
        return;
    if (_eventListeners.length)
    {
        if (_eventListeners[_eventListeners.length - 1]._mask & (1 << objj_msgSend(anEvent, "type")))
            _eventListeners.pop()._callback(anEvent);
        return;
    }
    objj_msgSend(objj_msgSend(anEvent, "window"), "sendEvent:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("doCommandBySelector:"), function $CPApplication__doCommandBySelector_(self, _cmd, aSelector)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", aSelector))
        objj_msgSend(_delegate, "performSelector:", aSelector);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "doCommandBySelector:", aSelector);
}
},["void","SEL"]), new objj_method(sel_getUid("keyWindow"), function $CPApplication__keyWindow(self, _cmd)
{ with(self)
{
    return _keyWindow;
}
},["CPWindow"]), new objj_method(sel_getUid("mainWindow"), function $CPApplication__mainWindow(self, _cmd)
{ with(self)
{
    return _mainWindow;
}
},["CPWindow"]), new objj_method(sel_getUid("windowWithWindowNumber:"), function $CPApplication__windowWithWindowNumber_(self, _cmd, aWindowNumber)
{ with(self)
{
    return _windows[aWindowNumber];
}
},["CPWindow","int"]), new objj_method(sel_getUid("windows"), function $CPApplication__windows(self, _cmd)
{ with(self)
{
    return _windows;
}
},["CPArray"]), new objj_method(sel_getUid("mainMenu"), function $CPApplication__mainMenu(self, _cmd)
{ with(self)
{
    return _mainMenu;
}
},["CPMenu"]), new objj_method(sel_getUid("setMainMenu:"), function $CPApplication__setMainMenu_(self, _cmd, aMenu)
{ with(self)
{
    if (objj_msgSend(aMenu, "_menuName") === "CPMainMenu")
    {
        if (_mainMenu === aMenu)
            return;
        _mainMenu = aMenu;
        if (objj_msgSend(CPPlatform, "supportsNativeMainMenu"))
            window.cpSetMainMenu(_mainMenu);
    }
    else
        objj_msgSend(aMenu, "_setMenuName:", "CPMainMenu");
}
},["void","CPMenu"]), new objj_method(sel_getUid("orderFrontColorPanel:"), function $CPApplication__orderFrontColorPanel_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPColorPanel, "sharedColorPanel"), "orderFront:", self);
}
},["void","id"]), new objj_method(sel_getUid("orderFrontStandardAboutPanel:"), function $CPApplication__orderFrontStandardAboutPanel_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "orderFrontStandardAboutPanelWithOptions:", nil);
}
},["void","id"]), new objj_method(sel_getUid("orderFrontStandardAboutPanelWithOptions:"), function $CPApplication__orderFrontStandardAboutPanelWithOptions_(self, _cmd, aDictionary)
{ with(self)
{
}
},["void","CPDictionary"]), new objj_method(sel_getUid("tryToPerform:with:"), function $CPApplication__tryToPerform_with_(self, _cmd, anAction, anObject)
{ with(self)
{
    if (!anAction)
        return NO;
    if (objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "tryToPerform:with:", anAction, anObject))
        return YES;
    if(objj_msgSend(_delegate, "respondsToSelector:", anAction))
    {
        objj_msgSend(_delegate, "performSelector:withObject:", anAction, anObject);
        return YES;
    }
    return NO;
}
},["BOOL","SEL","id"]), new objj_method(sel_getUid("sendAction:to:from:"), function $CPApplication__sendAction_to_from_(self, _cmd, anAction, aTarget, aSender)
{ with(self)
{
    var target = objj_msgSend(self, "targetForAction:to:from:", anAction, aTarget, aSender);
    if (!target)
        return NO;
    objj_msgSend(target, "performSelector:withObject:", anAction, aSender);
    return YES;
}
},["BOOL","SEL","id","id"]), new objj_method(sel_getUid("targetForAction:to:from:"), function $CPApplication__targetForAction_to_from_(self, _cmd, anAction, aTarget, aSender)
{ with(self)
{
    if (!anAction)
        return nil;
    if (aTarget)
        return aTarget;
    return objj_msgSend(self, "targetForAction:", anAction);
}
},["id","SEL","id","id"]), new objj_method(sel_getUid("_targetForWindow:action:"), function $CPApplication___targetForWindow_action_(self, _cmd, aWindow, anAction)
{ with(self)
{
    var responder = objj_msgSend(aWindow, "firstResponder"),
        checkWindow = YES;
    while (responder)
    {
        if (objj_msgSend(responder, "respondsToSelector:", anAction))
            return responder;
        if (responder == aWindow)
            checkWindow = NO;
        responder = objj_msgSend(responder, "nextResponder");
    }
    if (checkWindow && objj_msgSend(aWindow, "respondsToSelector:", anAction))
        return aWindow;
    var delegate = objj_msgSend(aWindow, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", anAction))
        return delegate;
    var windowController = objj_msgSend(aWindow, "windowController");
    if (objj_msgSend(windowController, "respondsToSelector:", anAction))
        return windowController;
    var theDocument = objj_msgSend(windowController, "document");
    if (theDocument != delegate && objj_msgSend(theDocument, "respondsToSelector:", anAction))
        return theDocument;
    return nil;
}
},["id","CPWindow","SEL"]), new objj_method(sel_getUid("targetForAction:"), function $CPApplication__targetForAction_(self, _cmd, anAction)
{ with(self)
{
    if (!anAction)
        return nil;
    var target = objj_msgSend(self, "_targetForWindow:action:", objj_msgSend(self, "keyWindow"), anAction);
    if (target)
        return target;
    target = objj_msgSend(self, "_targetForWindow:action:", objj_msgSend(self, "mainWindow"), anAction);
    if (target)
        return target;
    if (objj_msgSend(self, "respondsToSelector:", anAction))
        return self;
    if (objj_msgSend(_delegate, "respondsToSelector:", anAction))
        return _delegate;
    if (objj_msgSend(_documentController, "respondsToSelector:", anAction))
        return _documentController;
    return nil;
}
},["id","SEL"]), new objj_method(sel_getUid("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"), function $CPApplication__setCallback_forNextEventMatchingMask_untilDate_inMode_dequeue_(self, _cmd, aCallback, aMask, anExpiration, aMode, shouldDequeue)
{ with(self)
{
    _eventListeners.push(_CPEventListenerMake(aMask, aCallback));
    if (_eventListeners.length == 3) objj_debug_print_backtrace();
}
},["void","Function","unsignedint","CPDate","CPString","BOOL"]), new objj_method(sel_getUid("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"), function $CPApplication__setTarget_selector_forNextEventMatchingMask_untilDate_inMode_dequeue_(self, _cmd, aTarget, aSelector, aMask, anExpiration, aMode, shouldDequeue)
{ with(self)
{
    _eventListeners.push(_CPEventListenerMake(aMask, function (anEvent) { objj_msgSend(aTarget, aSelector, anEvent); }));
}
},["CPEvent","id","SEL","unsignedint","CPDate","CPString","BOOL"]), new objj_method(sel_getUid("currentEvent"), function $CPApplication__currentEvent(self, _cmd)
{ with(self)
{
    return _currentEvent;
}
},["CPEvent"]), new objj_method(sel_getUid("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"), function $CPApplication__beginSheet_modalForWindow_modalDelegate_didEndSelector_contextInfo_(self, _cmd, aSheet, aWindow, aModalDelegate, aDidEndSelector, aContextInfo)
{ with(self)
{
    objj_msgSend(aWindow, "_attachSheet:modalDelegate:didEndSelector:contextInfo:", aSheet, aModalDelegate, aDidEndSelector, aContextInfo);
}
},["void","CPWindow","CPWindow","id","SEL","id"]), new objj_method(sel_getUid("arguments"), function $CPApplication__arguments(self, _cmd)
{ with(self)
{
    if(_fullArgsString != window.location.hash)
        objj_msgSend(self, "_reloadArguments");
    return _args;
}
},["CPArray"]), new objj_method(sel_getUid("setArguments:"), function $CPApplication__setArguments_(self, _cmd, args)
{ with(self)
{
    if(!args || args.length == 0)
    {
        _args = [];
        window.location.hash = "#";
        return;
    }
    if(objj_msgSend(args, "class") != CPArray)
        args = objj_msgSend(CPArray, "arrayWithObject:", args);
    _args = args;
    var toEncode = objj_msgSend(_args, "copy");
    for(var i=0, count = toEncode.length; i<count; i++)
        toEncode[i] = encodeURIComponent(toEncode[i]);
    var hash = objj_msgSend(toEncode, "componentsJoinedByString:", "/");
    window.location.hash = "#" + hash;
}
},["void","CPArray"]), new objj_method(sel_getUid("_reloadArguments"), function $CPApplication___reloadArguments(self, _cmd)
{ with(self)
{
    _fullArgsString = window.location.hash;
    var args = _fullArgsString.replace("#", "").split("/").slice(0);
    for(var i=0, count = args.length; i<count; i++)
        args[i] = decodeURIComponent(args[i]);
    _args = args;
}
},["void"]), new objj_method(sel_getUid("namedArguments"), function $CPApplication__namedArguments(self, _cmd)
{ with(self)
{
    return _namedArgs;
}
},["CPDictionary"]), new objj_method(sel_getUid("_openFile:"), function $CPApplication___openFile_(self, _cmd, aFilename)
{ with(self)
{
    if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("application:openFile:")))
        return objj_msgSend(_delegate, "application:openFile:", self, aFilename);
    else
        return objj_msgSend(_documentController, "openDocumentWithContentsOfURL:display:error:", aFilename, YES, NULL);
}
},["BOOL","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedApplication"), function $CPApplication__sharedApplication(self, _cmd)
{ with(self)
{
    if (!CPApp)
        CPApp = objj_msgSend(objj_msgSend(CPApplication, "alloc"), "init");
    return CPApp;
}
},["CPApplication"])]);
}
var _CPModalSessionMake = function(aWindow, aStopCode)
{
    return { _window:aWindow, _state:CPRunContinuesResponse , _previous:nil };
}
var _CPEventListenerMake = function(anEventMask, aCallback)
{
    return { _mask:anEventMask, _callback:aCallback };
}
var _CPRunModalLoop = function(anEvent)
{
    objj_msgSend(CPApp, "setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:", _CPRunModalLoop, CPAnyEventMask, nil, 0, NO);
    var theWindow = objj_msgSend(anEvent, "window"),
        modalSession = CPApp._currentSession;
    if (theWindow == modalSession._window || objj_msgSend(theWindow, "worksWhenModal"))
        objj_msgSend(theWindow, "sendEvent:", anEvent);
}
CPApplicationMain= function(args, namedArgs)
{
    var mainBundle = objj_msgSend(CPBundle, "mainBundle"),
        principalClass = objj_msgSend(mainBundle, "principalClass");
    if (!principalClass)
        principalClass = objj_msgSend(CPApplication, "class");
    objj_msgSend(principalClass, "sharedApplication");
    if (!args)
    {
        var args = objj_msgSend(CPApp, "arguments");
        if(objj_msgSend(args, "containsObject:", "debug"))
            CPLogRegister(CPLogPopup);
    }
    if (!namedArgs)
    {
        var searchParams = window.location.search.substring(1).split("&");
            namedArgs = objj_msgSend(CPDictionary, "dictionary");
        for(var i=0; i<searchParams.length; i++)
        {
            var index = searchParams[i].indexOf('=');
            if(index == -1)
                objj_msgSend(namedArgs, "setObject:forKey:",  "", searchParams[i]);
            else
                objj_msgSend(namedArgs, "setObject:forKey:",  searchParams[i].substring(index+1),  searchParams[i].substring(0, index));
        }
    }
    CPApp._args = args;
    CPApp._namedArgs = namedArgs;
    objj_msgSend(_CPAppBootstrapper, "performActions");
}
var _CPAppBootstrapperActions = nil;
{var the_class = objj_allocateClassPair(CPObject, "_CPAppBootstrapper"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("actions"), function $_CPAppBootstrapper__actions(self, _cmd)
{ with(self)
{
    return [sel_getUid("bootstrapPlatform"), sel_getUid("loadDefaultTheme"), sel_getUid("loadMainCibFile")];
}
},["void"]), new objj_method(sel_getUid("performActions"), function $_CPAppBootstrapper__performActions(self, _cmd)
{ with(self)
{
    if (!_CPAppBootstrapperActions)
        _CPAppBootstrapperActions = objj_msgSend(self, "actions");
    while (_CPAppBootstrapperActions.length)
    {
        var action = _CPAppBootstrapperActions.shift();
        if (objj_msgSend(self, action))
            return;
    }
    objj_msgSend(CPApp, "run");
}
},["void"]), new objj_method(sel_getUid("bootstrapPlatform"), function $_CPAppBootstrapper__bootstrapPlatform(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPPlatform, "bootstrap");
}
},["BOOL"]), new objj_method(sel_getUid("loadDefaultTheme"), function $_CPAppBootstrapper__loadDefaultTheme(self, _cmd)
{ with(self)
{
    var blend = objj_msgSend(objj_msgSend(CPThemeBlend, "alloc"), "initWithContentsOfURL:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPApplication, "class")), "pathForResource:", "Aristo.blend"));
    objj_msgSend(blend, "loadWithDelegate:", self);
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("blendDidFinishLoading:"), function $_CPAppBootstrapper__blendDidFinishLoading_(self, _cmd, aBundle)
{ with(self)
{
    objj_msgSend(CPTheme, "setDefaultTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo"));
    objj_msgSend(self, "performActions");
}
},["void","CPBundle"]), new objj_method(sel_getUid("loadMainCibFile"), function $_CPAppBootstrapper__loadMainCibFile(self, _cmd)
{ with(self)
{
    var mainBundle = objj_msgSend(CPBundle, "mainBundle"),
        mainCibFile = objj_msgSend(mainBundle, "objectForInfoDictionaryKey:", CPMainCibFile) || objj_msgSend(mainBundle, "objectForInfoDictionaryKey:", CPMainCibFileHumanFriendly);
    if (mainCibFile)
    {
        objj_msgSend(mainBundle, "loadCibFile:externalNameTable:loadDelegate:", mainCibFile, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", CPApp, CPCibOwner), self);
        return YES;
    }
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("cibDidFinishLoading:"), function $_CPAppBootstrapper__cibDidFinishLoading_(self, _cmd, aCib)
{ with(self)
{
    objj_msgSend(self, "performActions");
}
},["void","CPCib"])]);
}

