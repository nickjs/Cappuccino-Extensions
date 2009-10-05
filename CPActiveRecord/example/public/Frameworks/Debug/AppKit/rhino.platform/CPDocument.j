I;21;Foundation/CPString.jI;20;Foundation/CPArray.ji;13;CPResponder.ji;18;CPViewController.ji;20;CPWindowController.jc;22204;
CPSaveOperation = 0;
CPSaveAsOperation = 1;
CPSaveToOperation = 2;
CPAutosaveOperation = 3;
CPChangeDone = 0;
CPChangeUndone = 1;
CPChangeCleared = 2;
CPChangeReadOtherContents = 3;
CPChangeAutosaved = 4;
CPDocumentWillSaveNotification = "CPDocumentWillSaveNotification";
CPDocumentDidSaveNotification = "CPDocumentDidSaveNotification";
CPDocumentDidFailToSaveNotification = "CPDocumentDidFailToSaveNotification";
var CPDocumentUntitledCount = 0;
{var the_class = objj_allocateClassPair(CPResponder, "CPDocument"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_view"), new objj_ivar("_viewControllersForWindowControllers"), new objj_ivar("_fileURL"), new objj_ivar("_fileType"), new objj_ivar("_windowControllers"), new objj_ivar("_untitledDocumentIndex"), new objj_ivar("_hasUndoManager"), new objj_ivar("_undoManager"), new objj_ivar("_changeCount"), new objj_ivar("_readConnection"), new objj_ivar("_writeRequest")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPDocument__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        _windowControllers = [];
        _viewControllersForWindowControllers = objj_msgSend(CPDictionary, "dictionary");
        _hasUndoManager = YES;
        _changeCount = 0;
        objj_msgSend(self, "setNextResponder:", CPApp);
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("initWithType:error:"), function $CPDocument__initWithType_error_(self, _cmd, aType, anError)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (self)
        objj_msgSend(self, "setFileType:", aType);
    return self;
}
},["id","CPString","{CPError}"]), new objj_method(sel_getUid("initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocument__initWithContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        objj_msgSend(self, "setFileURL:", anAbsoluteURL);
        objj_msgSend(self, "setFileType:", aType);
        objj_msgSend(self, "readFromURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo);
    }
    return self;
}
},["id","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocument__initForURL_withContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        objj_msgSend(self, "setFileURL:", anAbsoluteURL);
        objj_msgSend(self, "setFileType:", aType);
        objj_msgSend(self, "readFromURL:ofType:delegate:didReadSelector:contextInfo:", absoluteContentsURL, aType, aDelegate, aDidReadSelector, aContextInfo);
    }
    return self;
}
},["id","CPURL","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("dataOfType:error:"), function $CPDocument__dataOfType_error_(self, _cmd, aType, anError)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "dataOfType:error: must be overridden by the document subclass.");
}
},["CPData","CPString","{CPError}"]), new objj_method(sel_getUid("readFromData:ofType:error:"), function $CPDocument__readFromData_ofType_error_(self, _cmd, aData, aType, anError)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "readFromData:ofType: must be overridden by the document subclass.");
}
},["void","CPData","CPString","CPError"]), new objj_method(sel_getUid("viewControllerWillLoadCib:"), function $CPDocument__viewControllerWillLoadCib_(self, _cmd, aViewController)
{ with(self)
{
}
},["void","CPViewController"]), new objj_method(sel_getUid("viewControllerDidLoadCib:"), function $CPDocument__viewControllerDidLoadCib_(self, _cmd, aViewController)
{ with(self)
{
}
},["void","CPViewController"]), new objj_method(sel_getUid("firstEligibleExistingWindowController"), function $CPDocument__firstEligibleExistingWindowController(self, _cmd)
{ with(self)
{
    return nil;
}
},["CPWindowController"]), new objj_method(sel_getUid("makeWindowControllers"), function $CPDocument__makeWindowControllers(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "makeViewAndWindowControllers");
}
},["void"]), new objj_method(sel_getUid("makeViewAndWindowControllers"), function $CPDocument__makeViewAndWindowControllers(self, _cmd)
{ with(self)
{
    var viewCibName = objj_msgSend(self, "viewCibName"),
        viewController = nil,
        windowController = nil;
    if (objj_msgSend(viewCibName, "length"))
        viewController = objj_msgSend(objj_msgSend(CPViewController, "alloc"), "initWithCibName:bundle:owner:", viewCibName, nil, self);
    if (viewController)
        windowController = objj_msgSend(self, "firstEligibleExistingWindowController");
    if (!windowController)
    {
        var windowCibName = objj_msgSend(self, "windowCibName");
        if (objj_msgSend(windowCibName, "length"))
            windowController = objj_msgSend(objj_msgSend(CPWindowController, "alloc"), "initWithWindowCibName:owner:", windowCibName, self);
        else if (viewController)
        {
            var view = objj_msgSend(viewController, "view"),
                theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", objj_msgSend(view, "frame"), CPTitledWindowMask | CPClosableWindowMask | CPMiniaturizableWindowMask | CPResizableWindowMask);
            objj_msgSend(theWindow, "setSupportsMultipleDocuments:", YES);
            windowController = objj_msgSend(objj_msgSend(CPWindowController, "alloc"), "initWithWindow:", theWindow);
        }
    }
    if (windowController)
        objj_msgSend(self, "addWindowController:", windowController);
    if (viewController)
        objj_msgSend(self, "addViewController:forWindowController:", viewController, windowController);
}
},["void"]), new objj_method(sel_getUid("windowControllers"), function $CPDocument__windowControllers(self, _cmd)
{ with(self)
{
    return _windowControllers;
}
},["CPArray"]), new objj_method(sel_getUid("addWindowController:"), function $CPDocument__addWindowController_(self, _cmd, aWindowController)
{ with(self)
{
    objj_msgSend(_windowControllers, "addObject:", aWindowController);
    if (objj_msgSend(aWindowController, "document") !== self)
    {
        objj_msgSend(aWindowController, "setNextResponder:", self);
        objj_msgSend(aWindowController, "setDocument:", self);
    }
}
},["void","CPWindowController"]), new objj_method(sel_getUid("view"), function $CPDocument__view(self, _cmd)
{ with(self)
{
    return _view;
}
},["CPView"]), new objj_method(sel_getUid("viewControllers"), function $CPDocument__viewControllers(self, _cmd)
{ with(self)
{
    return objj_msgSend(_viewControllersForWindowControllers, "allValues");
}
},["CPArray"]), new objj_method(sel_getUid("addViewController:forWindowController:"), function $CPDocument__addViewController_forWindowController_(self, _cmd, aViewController, aWindowController)
{ with(self)
{
    objj_msgSend(_viewControllersForWindowControllers, "setObject:forKey:", aViewController, objj_msgSend(aWindowController, "UID"));
    if (objj_msgSend(aWindowController, "document") === self)
        objj_msgSend(aWindowController, "setViewController:", aViewController);
}
},["void","CPViewController","CPWindowController"]), new objj_method(sel_getUid("removeViewController:"), function $CPDocument__removeViewController_(self, _cmd, aViewController)
{ with(self)
{
    objj_msgSend(_viewControllersForWindowControllers, "removeObject:", aViewController);
}
},["void","CPViewController"]), new objj_method(sel_getUid("viewControllerForWindowController:"), function $CPDocument__viewControllerForWindowController_(self, _cmd, aWindowController)
{ with(self)
{
    return objj_msgSend(_viewControllersForWindowControllers, "objectForKey:", objj_msgSend(aWindowController, "UID"));
}
},["CPViewController","CPWindowController"]), new objj_method(sel_getUid("showWindows"), function $CPDocument__showWindows(self, _cmd)
{ with(self)
{
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocument:"), self);
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("showWindow:"), self);
}
},["void"]), new objj_method(sel_getUid("displayName"), function $CPDocument__displayName(self, _cmd)
{ with(self)
{
    if (_fileURL)
        return objj_msgSend(_fileURL, "lastPathComponent");
    if (!_untitledDocumentIndex)
        _untitledDocumentIndex = ++CPDocumentUntitledCount;
 if (_untitledDocumentIndex == 1)
    return "Untitled";
 return "Untitled " + _untitledDocumentIndex;
}
},["CPString"]), new objj_method(sel_getUid("viewCibName"), function $CPDocument__viewCibName(self, _cmd)
{ with(self)
{
    return nil;
}
},["CPString"]), new objj_method(sel_getUid("windowCibName"), function $CPDocument__windowCibName(self, _cmd)
{ with(self)
{
    return nil;
}
},["CPString"]), new objj_method(sel_getUid("windowControllerDidLoadCib:"), function $CPDocument__windowControllerDidLoadCib_(self, _cmd, aWindowController)
{ with(self)
{
}
},["void","CPWindowController"]), new objj_method(sel_getUid("windowControllerWillLoadCib:"), function $CPDocument__windowControllerWillLoadCib_(self, _cmd, aWindowController)
{ with(self)
{
}
},["void","CPWindowController"]), new objj_method(sel_getUid("readFromURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocument__readFromURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{ with(self)
{
    objj_msgSend(_readConnection, "cancel");
    _readConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", anAbsoluteURL), self);
    _readConnection.session = _CPReadSessionMake(aType, aDelegate, aDidReadSelector, aContextInfo);
}
},["void","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("fileURL"), function $CPDocument__fileURL(self, _cmd)
{ with(self)
{
    return _fileURL;
}
},["CPURL"]), new objj_method(sel_getUid("setFileURL:"), function $CPDocument__setFileURL_(self, _cmd, aFileURL)
{ with(self)
{
    if (_fileURL === aFileURL)
        return;
    _fileURL = aFileURL;
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:", sel_getUid("synchronizeWindowTitleWithDocumentName"));
}
},["void","CPURL"]), new objj_method(sel_getUid("saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:"), function $CPDocument__saveToURL_ofType_forSaveOperation_delegate_didSaveSelector_contextInfo_(self, _cmd, anAbsoluteURL, aTypeName, aSaveOperation, aDelegate, aDidSaveSelector, aContextInfo)
{ with(self)
{
    var data = objj_msgSend(self, "dataOfType:error:", objj_msgSend(self, "fileType"), nil),
        oldChangeCount = _changeCount;
    _writeRequest = objj_msgSend(CPURLRequest, "requestWithURL:", anAbsoluteURL);
    objj_msgSend(_writeRequest, "setHTTPMethod:", "POST");
    objj_msgSend(_writeRequest, "setHTTPBody:", objj_msgSend(data, "string"));
    objj_msgSend(_writeRequest, "setValue:forHTTPHeaderField:", "close", "Connection");
    if (aSaveOperation == CPSaveOperation)
        objj_msgSend(_writeRequest, "setValue:forHTTPHeaderField:", "true", "x-cappuccino-overwrite");
    if (aSaveOperation != CPSaveToOperation)
        objj_msgSend(self, "updateChangeCount:", CPChangeCleared);
    var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", _writeRequest, self);
    connection.session = _CPSaveSessionMake(anAbsoluteURL, aSaveOperation, oldChangeCount, aDelegate, aDidSaveSelector, aContextInfo, connection);
}
},["void","CPURL","CPString","CPSaveOperationType","id","SEL","id"]), new objj_method(sel_getUid("connection:didReceiveResponse:"), function $CPDocument__connection_didReceiveResponse_(self, _cmd, aConnection, aResponse)
{ with(self)
{
    if (!objj_msgSend(aResponse, "isKindOfClass:", objj_msgSend(CPHTTPURLResponse, "class")))
        return;
    var statusCode = objj_msgSend(aResponse, "statusCode");
    if (statusCode === 200)
        return;
    var session = aConnection.session;
    if (aConnection == _readConnection)
    {
        objj_msgSend(aConnection, "cancel");
        alert("There was an error retrieving the document.");
        objj_msgSend(session.delegate, session.didReadSelector, self, NO, session.contextInfo);
    }
    else
    {
        if (statusCode == 409)
        {
            objj_msgSend(aConnection, "cancel");
            if (confirm("There already exists a file with that name, would you like to overwrite it?"))
            {
                objj_msgSend(_writeRequest, "setValue:forHTTPHeaderField:", "true", "x-cappuccino-overwrite");
                objj_msgSend(aConnection, "start");
            }
            else
            {
                if (session.saveOperation != CPSaveToOperation)
                {
                    _changeCount += session.changeCount;
                    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
                }
                _writeRequest = nil;
                objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
            }
        }
    }
}
},["void","CPURLConnection","CPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $CPDocument__connection_didReceiveData_(self, _cmd, aConnection, aData)
{ with(self)
{
    var session = aConnection.session;
    if (aConnection == _readConnection)
    {
        objj_msgSend(self, "readFromData:ofType:error:", objj_msgSend(CPData, "dataWithString:", aData), session.fileType, nil);
        objj_msgSend(session.delegate, session.didReadSelector, self, YES, session.contextInfo);
    }
    else
    {
        if (session.saveOperation != CPSaveToOperation)
            objj_msgSend(self, "setFileURL:", session.absoluteURL);
        _writeRequest = nil;
        objj_msgSend(session.delegate, session.didSaveSelector, self, YES, session.contextInfo);
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $CPDocument__connection_didFailWithError_(self, _cmd, aConnection, anError)
{ with(self)
{
    var session = aConnection.session;
    if (_readConnection == aConnection)
        objj_msgSend(session.delegate, session.didReadSelector, self, NO, session.contextInfo);
    else
    {
        if (session.saveOperation != CPSaveToOperation)
        {
            _changeCount += session.changeCount;
            objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
        }
        _writeRequest = nil;
        alert("There was an error saving the document.");
        objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
    }
}
},["void","CPURLConnection","CPError"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $CPDocument__connectionDidFinishLoading_(self, _cmd, aConnection)
{ with(self)
{
    if (_readConnection == aConnection)
        _readConnection = nil;
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("isDocumentEdited"), function $CPDocument__isDocumentEdited(self, _cmd)
{ with(self)
{
    return _changeCount != 0;
}
},["BOOL"]), new objj_method(sel_getUid("updateChangeCount:"), function $CPDocument__updateChangeCount_(self, _cmd, aChangeType)
{ with(self)
{
    if (aChangeType == CPChangeDone)
        ++_changeCount;
    else if (aChangeType == CPChangeUndone)
        --_changeCount;
    else if (aChangeType == CPChangeCleared)
        _changeCount = 0;
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
}
},["void","CPDocumentChangeType"]), new objj_method(sel_getUid("setFileType:"), function $CPDocument__setFileType_(self, _cmd, aType)
{ with(self)
{
    _fileType = aType;
}
},["void","CPString"]), new objj_method(sel_getUid("fileType"), function $CPDocument__fileType(self, _cmd)
{ with(self)
{
    return _fileType;
}
},["CPString"]), new objj_method(sel_getUid("hasUndoManager"), function $CPDocument__hasUndoManager(self, _cmd)
{ with(self)
{
    return _hasUndoManager;
}
},["BOOL"]), new objj_method(sel_getUid("setHasUndoManager:"), function $CPDocument__setHasUndoManager_(self, _cmd, aFlag)
{ with(self)
{
    if (_hasUndoManager == aFlag)
        return;
    _hasUndoManager = aFlag;
    if (!_hasUndoManager)
        objj_msgSend(self, "setUndoManager:", nil);
}
},["void","BOOL"]), new objj_method(sel_getUid("_undoManagerWillCloseGroup:"), function $CPDocument___undoManagerWillCloseGroup_(self, _cmd, aNotification)
{ with(self)
{
    var undoManager = objj_msgSend(aNotification, "object");
    if (objj_msgSend(undoManager, "isUndoing") || objj_msgSend(undoManager, "isRedoing"))
        return;
    objj_msgSend(self, "updateChangeCount:", CPChangeDone);
}
},["void","CPNotification"]), new objj_method(sel_getUid("_undoManagerDidUndoChange:"), function $CPDocument___undoManagerDidUndoChange_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "updateChangeCount:", CPChangeUndone);
}
},["void","CPNotification"]), new objj_method(sel_getUid("_undoManagerDidRedoChange:"), function $CPDocument___undoManagerDidRedoChange_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "updateChangeCount:", CPChangeDone);
}
},["void","CPNotification"]), new objj_method(sel_getUid("setUndoManager:"), function $CPDocument__setUndoManager_(self, _cmd, anUndoManager)
{ with(self)
{
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_undoManager)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerDidUndoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerDidRedoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerWillCloseUndoGroupNotification, _undoManager);
    }
    _undoManager = anUndoManager;
    if (_undoManager)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerDidUndoChange:"), CPUndoManagerDidUndoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerDidRedoChange:"), CPUndoManagerDidRedoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerWillCloseGroup:"), CPUndoManagerWillCloseUndoGroupNotification, _undoManager);
    }
}
},["void","CPUndoManager"]), new objj_method(sel_getUid("undoManager"), function $CPDocument__undoManager(self, _cmd)
{ with(self)
{
    if (_hasUndoManager && !_undoManager)
        objj_msgSend(self, "setUndoManager:", objj_msgSend(objj_msgSend(CPUndoManager, "alloc"), "init"));
    return _undoManager;
}
},["CPUndoManager"]), new objj_method(sel_getUid("windowWillReturnUndoManager:"), function $CPDocument__windowWillReturnUndoManager_(self, _cmd, aWindow)
{ with(self)
{
    return objj_msgSend(self, "undoManager");
}
},["CPUndoManager","CPWindow"]), new objj_method(sel_getUid("saveDocument:"), function $CPDocument__saveDocument_(self, _cmd, aSender)
{ with(self)
{
    if (_fileURL)
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentWillSaveNotification, self);
        objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", _fileURL, objj_msgSend(self, "fileType"), CPSaveOperation, self, sel_getUid("document:didSave:contextInfo:"), NULL);
    }
    else
        objj_msgSend(self, "saveDocumentAs:", self);
}
},["void","id"]), new objj_method(sel_getUid("saveDocumentAs:"), function $CPDocument__saveDocumentAs_(self, _cmd, aSender)
{ with(self)
{
    _documentName = window.prompt("Document Name:");
    if (!_documentName)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentWillSaveNotification, self);
    objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", objj_msgSend(self, "proposedFileURL"), objj_msgSend(self, "fileType"), CPSaveAsOperation, self, sel_getUid("document:didSave:contextInfo:"), NULL);
}
},["void","id"]), new objj_method(sel_getUid("document:didSave:contextInfo:"), function $CPDocument__document_didSave_contextInfo_(self, _cmd, aDocument, didSave, aContextInfo)
{ with(self)
{
    if (didSave)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentDidSaveNotification, self);
    else
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentDidFailToSaveNotification, self);
}
},["void","id","BOOL","id"])]);
}
var _CPReadSessionMake = function(aType, aDelegate, aDidReadSelector, aContextInfo)
{
    return { fileType:aType, delegate:aDelegate, didReadSelector:aDidReadSelector, contextInfo:aContextInfo };
}
var _CPSaveSessionMake = function(anAbsoluteURL, aSaveOperation, aChangeCount, aDelegate, aDidSaveSelector, aContextInfo, aConnection)
{
    return { absoluteURL:anAbsoluteURL, saveOperation:aSaveOperation, changeCount:aChangeCount, delegate:aDelegate, didSaveSelector:aDidSaveSelector, contextInfo:aContextInfo, connection:aConnection };
}

