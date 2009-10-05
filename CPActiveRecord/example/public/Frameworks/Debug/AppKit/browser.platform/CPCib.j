I;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.ji;20;_CPCibClassSwapper.ji;20;_CPCibCustomObject.ji;22;_CPCibCustomResource.ji;18;_CPCibCustomView.ji;23;_CPCibKeyedUnarchiver.ji;18;_CPCibObjectData.ji;19;_CPCibProxyObject.ji;22;_CPCibWindowTemplate.jc;6521;
CPCibOwner = "CPCibOwner",
CPCibTopLevelObjects = "CPCibTopLevelObjects",
CPCibReplacementClasses = "CPCibReplacementClasses",
CPCibExternalObjects = "CPCibExternalObjects";
var CPCibObjectDataKey = "CPCibObjectDataKey";
{var the_class = objj_allocateClassPair(CPObject, "CPCib"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_data"), new objj_ivar("_bundle"), new objj_ivar("_awakenCustomResources"), new objj_ivar("_loadDelegate")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentsOfURL:"), function $CPCib__initWithContentsOfURL_(self, _cmd, aURL)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _data = objj_msgSend(CPURLConnection, "sendSynchronousRequest:returningResponse:error:", objj_msgSend(CPURLRequest, "requestWithURL:", aURL), nil, nil);
        _awakenCustomResources = YES;
    }
    return self;
}
},["id","CPURL"]), new objj_method(sel_getUid("initWithContentsOfURL:loadDelegate:"), function $CPCib__initWithContentsOfURL_loadDelegate_(self, _cmd, aURL, aLoadDelegate)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", aURL), self);
        _awakenCustomResources = YES;
        _loadDelegate = aLoadDelegate;
    }
    return self;
}
},["id","CPURL","id"]), new objj_method(sel_getUid("initWithCibNamed:bundle:"), function $CPCib__initWithCibNamed_bundle_(self, _cmd, aName, aBundle)
{ with(self)
{
    if (!objj_msgSend(aName, "hasSuffix:", ".cib"))
        aName = objj_msgSend(aName, "stringByAppendingString:", ".cib");
    self = objj_msgSend(self, "initWithContentsOfURL:", objj_msgSend(aBundle || objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", aName));
    if (self)
        _bundle = aBundle;
    return self;
}
},["id","CPString","CPBundle"]), new objj_method(sel_getUid("initWithCibNamed:bundle:loadDelegate:"), function $CPCib__initWithCibNamed_bundle_loadDelegate_(self, _cmd, aName, aBundle, aLoadDelegate)
{ with(self)
{
    if (!objj_msgSend(aName, "hasSuffix:", ".cib"))
        aName = objj_msgSend(aName, "stringByAppendingString:", ".cib");
    self = objj_msgSend(self, "initWithContentsOfURL:loadDelegate:", objj_msgSend(aBundle || objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", aName), aLoadDelegate);
    if (self)
        _bundle = aBundle;
    return self;
}
},["id","CPString","CPBundle","id"]), new objj_method(sel_getUid("_setAwakenCustomResources:"), function $CPCib___setAwakenCustomResources_(self, _cmd, shouldAwakenCustomResources)
{ with(self)
{
    _awakenCustomResources = shouldAwakenCustomResources;
}
},["void","BOOL"]), new objj_method(sel_getUid("_awakenCustomResources"), function $CPCib___awakenCustomResources(self, _cmd)
{ with(self)
{
    return _awakenCustomResources;
}
},["BOOL"]), new objj_method(sel_getUid("instantiateCibWithExternalNameTable:"), function $CPCib__instantiateCibWithExternalNameTable_(self, _cmd, anExternalNameTable)
{ with(self)
{
    var bundle = _bundle,
        owner = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibOwner);
    if (!bundle && owner)
        bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(owner, "class"));
    var unarchiver = objj_msgSend(objj_msgSend(_CPCibKeyedUnarchiver, "alloc"), "initForReadingWithData:bundle:awakenCustomResources:", _data, bundle, _awakenCustomResources),
        replacementClasses = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibReplacementClasses);
    if (replacementClasses)
    {
        var key = nil,
            keyEnumerator = objj_msgSend(replacementClasses, "keyEnumerator");
        while (key = objj_msgSend(keyEnumerator, "nextObject"))
            objj_msgSend(unarchiver, "setClass:forClassName:", objj_msgSend(replacementClasses, "objectForKey:", key), key);
    }
    objj_msgSend(unarchiver, "setExternalObjectsForProxyIdentifiers:", objj_msgSend(anExternalNameTable, "objectForKey:", CPCibExternalObjects));
    var objectData = objj_msgSend(unarchiver, "decodeObjectForKey:", CPCibObjectDataKey);
    if (!objectData || !objj_msgSend(objectData, "isKindOfClass:", objj_msgSend(_CPCibObjectData, "class")))
        return NO;
    var topLevelObjects = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibTopLevelObjects);
    objj_msgSend(objectData, "instantiateWithOwner:topLevelObjects:", owner, topLevelObjects)
    objj_msgSend(objectData, "establishConnectionsWithOwner:topLevelObjects:", owner, topLevelObjects);
    objj_msgSend(objectData, "awakeWithOwner:topLevelObjects:", owner, topLevelObjects);
    objj_msgSend(objectData, "displayVisibleWindows");
    return YES;
}
},["BOOL","CPDictionary"]), new objj_method(sel_getUid("instantiateCibWithOwner:topLevelObjects:"), function $CPCib__instantiateCibWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{ with(self)
{
    return objj_msgSend(self, "instantiateCibWithExternalNameTable:", objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", anOwner, CPCibOwner, topLevelObjects, CPCibTopLevelObjects));
}
},["BOOL","id","CPArray"])]);
}
{
var the_class = objj_getClass("CPCib")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPCib\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("connection:didReceiveData:"), function $CPCib__connection_didReceiveData_(self, _cmd, aConnection, data)
{ with(self)
{
    _data = objj_msgSend(CPData, "dataWithString:", data);
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $CPCib__connection_didFailWithError_(self, _cmd, aConnection, anError)
{ with(self)
{
    alert("cib: connection failed.");
    _loadDelegate = nil;
}
},["void","CPURLConnection","CPError"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $CPCib__connectionDidFinishLoading_(self, _cmd, aConnection)
{ with(self)
{
    if (objj_msgSend(_loadDelegate, "respondsToSelector:", sel_getUid("cibDidFinishLoading:")))
        objj_msgSend(_loadDelegate, "cibDidFinishLoading:", self);
    _loadDelegate = nil;
}
},["void","CPURLConnection"])]);
}

