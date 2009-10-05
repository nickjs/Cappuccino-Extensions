I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;40;Foundation/CPPropertyListSerialization.jc;9140;
CPGeneralPboard = "CPGeneralPboard";
CPFontPboard = "CPFontPboard";
CPRulerPboard = "CPRulerPboard";
CPFindPboard = "CPFindPboard";
CPDragPboard = "CPDragPboard";
CPColorPboardType = "CPColorPboardType";
CPFilenamesPboardType = "CPFilenamesPboardType";
CPFontPboardType = "CPFontPboardType";
CPHTMLPboardType = "CPHTMLPboardType";
CPStringPboardType = "CPStringPboardType";
CPURLPboardType = "CPURLPboardType";
CPImagesPboardType = "CPImagesPboardType";
CPVideosPboardType = "CPVideosPboardType";
CPImagePboardType = "CPImagePboardType";
var CPPasteboards = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPPasteboard"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_types"), new objj_ivar("_owners"), new objj_ivar("_provided"), new objj_ivar("_changeCount"), new objj_ivar("_stateUID")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithName:"), function $CPPasteboard___initWithName_(self, _cmd, aName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _name = aName;
        _types = [];
        _owners = objj_msgSend(CPDictionary, "dictionary");
        _provided = objj_msgSend(CPDictionary, "dictionary");
        _changeCount = 0;
    }
    return self;
}
},["id","CPString"]), new objj_method(sel_getUid("addTypes:owner:"), function $CPPasteboard__addTypes_owner_(self, _cmd, types, anOwner)
{ with(self)
{
    var i = 0,
        count = types.length;
    for (; i < count; ++i)
    {
        var type = types[i];
        if(!objj_msgSend(_owners, "objectForKey:", type))
        {
            objj_msgSend(_types, "addObject:", type);
            objj_msgSend(_provided, "removeObjectForKey:", type);
        }
        objj_msgSend(_owners, "setObject:forKey:", anOwner, type);
    }
    return ++_changeCount;
}
},["unsigned","CPArray","id"]), new objj_method(sel_getUid("declareTypes:owner:"), function $CPPasteboard__declareTypes_owner_(self, _cmd, types, anOwner)
{ with(self)
{
    objj_msgSend(_types, "setArray:", types);
    _owners = objj_msgSend(CPDictionary, "dictionary");
    _provided = objj_msgSend(CPDictionary, "dictionary");
    var count = _types.length;
    while (count--)
        objj_msgSend(_owners, "setObject:forKey:", anOwner, _types[count]);
    return ++_changeCount;
}
},["unsigned","CPArray","id"]), new objj_method(sel_getUid("setData:forType:"), function $CPPasteboard__setData_forType_(self, _cmd, aData, aType)
{ with(self)
{
    objj_msgSend(_provided, "setObject:forKey:", aData, aType);
    return YES;
}
},["BOOL","CPData","CPString"]), new objj_method(sel_getUid("setPropertyList:forType:"), function $CPPasteboard__setPropertyList_forType_(self, _cmd, aPropertyList, aType)
{ with(self)
{
    return objj_msgSend(self, "setData:forType:", objj_msgSend(CPPropertyListSerialization, "dataFromPropertyList:format:errorDescription:", aPropertyList, CPPropertyListXMLFormat_v1_0, nil), aType);
}
},["BOOL","id","CPString"]), new objj_method(sel_getUid("setString:forType:"), function $CPPasteboard__setString_forType_(self, _cmd, aString, aType)
{ with(self)
{
    return objj_msgSend(self, "setPropertyList:forType:", aString, aType);
}
},["void","CPString","CPString"]), new objj_method(sel_getUid("availableTypeFromArray:"), function $CPPasteboard__availableTypeFromArray_(self, _cmd, anArray)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "types"), "firstObjectCommonWithArray:", anArray);
}
},["CPString","CPArray"]), new objj_method(sel_getUid("types"), function $CPPasteboard__types(self, _cmd)
{ with(self)
{
    return _types;
}
},["CPArray"]), new objj_method(sel_getUid("changeCount"), function $CPPasteboard__changeCount(self, _cmd)
{ with(self)
{
    return _changeCount;
}
},["unsigned"]), new objj_method(sel_getUid("dataForType:"), function $CPPasteboard__dataForType_(self, _cmd, aType)
{ with(self)
{
    var data = objj_msgSend(_provided, "objectForKey:", aType);
    if (data)
        return data;
    var owner = objj_msgSend(_owners, "objectForKey:", aType);
    if (owner)
    {
        objj_msgSend(owner, "pasteboard:provideDataForType:", self, aType);
        ++_changeCount;
        return objj_msgSend(_provided, "objectForKey:", aType);
    }
    return nil;
}
},["CPData","CPString"]), new objj_method(sel_getUid("propertyListForType:"), function $CPPasteboard__propertyListForType_(self, _cmd, aType)
{ with(self)
{
    var data = objj_msgSend(self, "dataForType:", aType);
    if (data)
        return objj_msgSend(CPPropertyListSerialization, "propertyListFromData:format:errorDescription:", data, CPPropertyListXMLFormat_v1_0, nil);
    return nil;
}
},["id","CPString"]), new objj_method(sel_getUid("stringForType:"), function $CPPasteboard__stringForType_(self, _cmd, aType)
{ with(self)
{
    return objj_msgSend(self, "propertyListForType:", aType);
}
},["CPString","CPString"]), new objj_method(sel_getUid("_generateStateUID"), function $CPPasteboard___generateStateUID(self, _cmd)
{ with(self)
{
    var bits = 32;
    _stateUID = "";
    while (bits--)
        _stateUID += FLOOR(RAND() * 16.0).toString(16).toUpperCase();
    return _stateUID;
}
},["CPString"]), new objj_method(sel_getUid("_stateUID"), function $CPPasteboard___stateUID(self, _cmd)
{ with(self)
{
    return _stateUID;
}
},["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPPasteboard__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPPasteboard, "class"))
        return;
    objj_msgSend(self, "setVersion:", 1.0);
    CPPasteboards = objj_msgSend(CPDictionary, "dictionary");
}
},["void"]), new objj_method(sel_getUid("generalPasteboard"), function $CPPasteboard__generalPasteboard(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPPasteboard, "pasteboardWithName:", CPGeneralPboard);
}
},["id"]), new objj_method(sel_getUid("pasteboardWithName:"), function $CPPasteboard__pasteboardWithName_(self, _cmd, aName)
{ with(self)
{
    var pasteboard = objj_msgSend(CPPasteboards, "objectForKey:", aName);
    if (pasteboard)
        return pasteboard;
    pasteboard = objj_msgSend(objj_msgSend(CPPasteboard, "alloc"), "_initWithName:", aName);
    objj_msgSend(CPPasteboards, "setObject:forKey:", pasteboard, aName);
    return pasteboard;
}
},["id","CPString"])]);
}
var DOMDataTransferPasteboard = nil;
{var the_class = objj_allocateClassPair(CPPasteboard, "_CPDOMDataTransferPasteboard"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dataTransfer")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_setDataTransfer:"), function $_CPDOMDataTransferPasteboard___setDataTransfer_(self, _cmd, aDataTransfer)
{ with(self)
{
    _dataTransfer = aDataTransfer;
}
},["void","DataTransfer"]), new objj_method(sel_getUid("_setPasteboard:"), function $_CPDOMDataTransferPasteboard___setPasteboard_(self, _cmd, aPasteboard)
{ with(self)
{
    _dataTransfer.clearData();
    var types = objj_msgSend(aPasteboard, "types"),
        count = types.length;
    while (count--)
    {
        var type = types[count];
        if (type === CPStringPboardType)
            _dataTransfer.setData(type, objj_msgSend(aPasteboard, "stringForType:", type));
        else
            _dataTransfer.setData(type, objj_msgSend(objj_msgSend(aPasteboard, "dataForType:", type), "string"));
    }
}
},["void","CPPasteboard"]), new objj_method(sel_getUid("types"), function $_CPDOMDataTransferPasteboard__types(self, _cmd)
{ with(self)
{
    return Array.prototype.slice.apply(_dataTransfer.types);
}
},["CPArray"]), new objj_method(sel_getUid("dataForType:"), function $_CPDOMDataTransferPasteboard__dataForType_(self, _cmd, aType)
{ with(self)
{
    var dataString = _dataTransfer.getData(aType);
    if (aType === CPStringPboardType)
        return objj_msgSend(CPData, "dataFromPropertyList:format:errorDescription:", dataString, kCFPropertyList280NorthFormat_v1_0, 0);
    return objj_msgSend(CPData, "dataWithString:", dataString);
}
},["CPData","CPString"]), new objj_method(sel_getUid("propertyListForType:"), function $_CPDOMDataTransferPasteboard__propertyListForType_(self, _cmd, aType)
{ with(self)
{
    if (aType === CPStringPboardType)
        return _dataTransfer.getData(aType);
    return objj_msgSend(CPPropertyListSerialization, "propertyListFromData:format:errorDescription:", objj_msgSend(self, "dataForType:", aType), CPPropertyListUnknownFormat, nil);
}
},["id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("DOMDataTransferPasteboard"), function $_CPDOMDataTransferPasteboard__DOMDataTransferPasteboard(self, _cmd)
{ with(self)
{
    if (!DOMDataTransferPasteboard)
        DOMDataTransferPasteboard = objj_msgSend(objj_msgSend(_CPDOMDataTransferPasteboard, "alloc"), "init");
    return DOMDataTransferPasteboard;
}
},["_CPDOMDataTransferPasteboard"])]);
}

