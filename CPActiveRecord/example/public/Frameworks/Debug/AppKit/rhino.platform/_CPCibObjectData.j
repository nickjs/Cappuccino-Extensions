I;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;7;CPCib.ji;16;CPCibConnector.ji;23;CPCibControlConnector.ji;22;CPCibOutletConnector.jc;9331;
{var the_class = objj_allocateClassPair(CPObject, "_CPCibObjectData"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_namesKeys"), new objj_ivar("_namesValues"), new objj_ivar("_accessibilityConnectors"), new objj_ivar("_accessibilityOidsKeys"), new objj_ivar("_accessibilityOidsValues"), new objj_ivar("_classesKeys"), new objj_ivar("_classesValues"), new objj_ivar("_connections"), new objj_ivar("_fontManager"), new objj_ivar("_framework"), new objj_ivar("_nextOid"), new objj_ivar("_objectsKeys"), new objj_ivar("_objectsValues"), new objj_ivar("_oidKeys"), new objj_ivar("_oidValues"), new objj_ivar("_fileOwner"), new objj_ivar("_visibleWindows"), new objj_ivar("_replacementObjects")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPCibObjectData__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _namesKeys = [];
        _namesValues = [];
        _classesKeys = [];
        _classesValues = [];
        _connections = [];
        _framework = "";
        _nextOid = [];
        _objectsKeys = [];
        _objectsValues = [];
        _oidKeys = [];
        _oidValues = [];
        _fileOwner = nil;
        _visibleWindows = objj_msgSend(CPSet, "set");
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("displayVisibleWindows"), function $_CPCibObjectData__displayVisibleWindows(self, _cmd)
{ with(self)
{
    var object = nil,
        objectEnumerator = objj_msgSend(_visibleWindows, "objectEnumerator");
    while (object = objj_msgSend(objectEnumerator, "nextObject"))
        objj_msgSend(_replacementObjects[objj_msgSend(object, "UID")], "makeKeyAndOrderFront:", self);
}
},["void"])]);
}
var _CPCibObjectDataNamesKeysKey = "_CPCibObjectDataNamesKeysKey",
    _CPCibObjectDataNamesValuesKey = "_CPCibObjectDataNamesValuesKey",
    _CPCibObjectDataAccessibilityConnectorsKey = "_CPCibObjectDataAccessibilityConnectors",
    _CPCibObjectDataAccessibilityOidsKeysKey = "_CPCibObjectDataAccessibilityOidsKeys",
    _CPCibObjectDataAccessibilityOidsValuesKey = "_CPCibObjectDataAccessibilityOidsValues",
    _CPCibObjectDataClassesKeysKey = "_CPCibObjectDataClassesKeysKey",
    _CPCibObjectDataClassesValuesKey = "_CPCibObjectDataClassesValuesKey",
    _CPCibObjectDataConnectionsKey = "_CPCibObjectDataConnectionsKey",
    _CPCibObjectDataFontManagerKey = "_CPCibObjectDataFontManagerKey",
    _CPCibObjectDataFrameworkKey = "_CPCibObjectDataFrameworkKey",
    _CPCibObjectDataNextOidKey = "_CPCibObjectDataNextOidKey",
    _CPCibObjectDataObjectsKeysKey = "_CPCibObjectDataObjectsKeysKey",
    _CPCibObjectDataObjectsValuesKey = "_CPCibObjectDataObjectsValuesKey",
    _CPCibObjectDataOidKeysKey = "_CPCibObjectDataOidKeysKey",
    _CPCibObjectDataOidValuesKey = "_CPCibObjectDataOidValuesKey",
    _CPCibObjectDataFileOwnerKey = "_CPCibObjectDataFileOwnerKey",
    _CPCibObjectDataVisibleWindowsKey = "_CPCibObjectDataVisibleWindowsKey";
{
var the_class = objj_getClass("_CPCibObjectData")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibObjectData\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPCibObjectData__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _replacementObjects = {};
        _namesKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataNamesKeysKey);
        _namesValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataNamesValuesKey);
        _classesKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataClassesKeysKey);
        _classesValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataClassesValuesKey);
        _connections = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataConnectionsKey);
        _framework = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataFrameworkKey);
        _nextOid = objj_msgSend(aCoder, "decodeIntForKey:", _CPCibObjectDataNextOidKey);
        _objectsKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataObjectsKeysKey);
        _objectsValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataObjectsValuesKey);
        _oidKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataOidKeysKey);
        _oidValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataOidValuesKey);
        _fileOwner = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataFileOwnerKey);
        _visibleWindows = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataVisibleWindowsKey);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibObjectData__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _namesKeys, _CPCibObjectDataNamesKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _namesValues, _CPCibObjectDataNamesValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _classesKeys, _CPCibObjectDataClassesKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _classesValues, _CPCibObjectDataClassesValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _connections, _CPCibObjectDataConnectionsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _framework, _CPCibObjectDataFrameworkKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _nextOid, _CPCibObjectDataNextOidKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _objectsKeys, _CPCibObjectDataObjectsKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _objectsValues, _CPCibObjectDataObjectsValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _oidKeys, _CPCibObjectDataOidKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _oidValues, _CPCibObjectDataOidValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _fileOwner, _CPCibObjectDataFileOwnerKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _visibleWindows, _CPCibObjectDataVisibleWindowsKey);
}
},["void","CPCoder"]), new objj_method(sel_getUid("instantiateWithOwner:topLevelObjects:"), function $_CPCibObjectData__instantiateWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{ with(self)
{
    var count = objj_msgSend(_objectsKeys, "count");
    while (count--)
    {
        var object = _objectsKeys[count],
            parent = _objectsValues[count],
            instantiatedObject = object;
        if (objj_msgSend(object, "respondsToSelector:", sel_getUid("_cibInstantiate")))
        {
            var instantiatedObject = objj_msgSend(object, "_cibInstantiate");
            if (instantiatedObject !== object)
            {
                _replacementObjects[objj_msgSend(object, "UID")] = instantiatedObject;
                if (objj_msgSend(instantiatedObject, "isKindOfClass:", objj_msgSend(CPView, "class")))
                {
                    var clipView = objj_msgSend(instantiatedObject, "superview");
                    if (objj_msgSend(clipView, "isKindOfClass:", objj_msgSend(CPClipView, "class")))
                    {
                        var scrollView = objj_msgSend(clipView, "superview");
                        if (objj_msgSend(scrollView, "isKindOfClass:", objj_msgSend(CPScrollView, "class")))
                            objj_msgSend(scrollView, "setDocumentView:", instantiatedObject);
                    }
                }
            }
        }
        if (topLevelObjects && parent === _fileOwner && object !== _fileOwner)
            topLevelObjects.push(instantiatedObject);
    }
}
},["void","id","CPMutableArray"]), new objj_method(sel_getUid("establishConnectionsWithOwner:topLevelObjects:"), function $_CPCibObjectData__establishConnectionsWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{ with(self)
{
    _replacementObjects[objj_msgSend(_fileOwner, "UID")] = anOwner;
    var index = 0,
        count = _connections.length;
    for (; index < count; ++index)
    {
        var connection = _connections[index];
        objj_msgSend(connection, "replaceObjects:", _replacementObjects);
        objj_msgSend(connection, "establishConnection");
    }
}
},["void","id","CPMutableArray"]), new objj_method(sel_getUid("awakeWithOwner:topLevelObjects:"), function $_CPCibObjectData__awakeWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{ with(self)
{
    var count = objj_msgSend(_objectsKeys, "count");
    while (count--)
    {
        var object = _objectsKeys[count],
            instantiatedObject = _replacementObjects[objj_msgSend(object, "UID")];
        if (instantiatedObject)
            object = instantiatedObject;
        if (object !== anOwner && objj_msgSend(object, "respondsToSelector:", sel_getUid("awakeFromCib")))
            objj_msgSend(object, "awakeFromCib");
    }
    if (objj_msgSend(anOwner, "respondsToSelector:", sel_getUid("awakeFromCib")))
        objj_msgSend(anOwner, "awakeFromCib");
}
},["void","id","CPMutableArray"])]);
}

