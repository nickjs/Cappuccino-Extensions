i;10;CPObject.ji;10;CPString.jc;3094;
{var the_class = objj_allocateClassPair(CPObject, "CPData"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_plistObject")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithString:"), function $CPData__initWithString_(self, _cmd, aString)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        string = aString;
    return self;
}
},["id","CPString"]), new objj_method(sel_getUid("initWithPlistObject:"), function $CPData__initWithPlistObject_(self, _cmd, aPlistObject)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _plistObject = aPlistObject;
    return self;
}
},["id","id"]), new objj_method(sel_getUid("length"), function $CPData__length(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "string"), "length");
}
},["int"]), new objj_method(sel_getUid("description"), function $CPData__description(self, _cmd)
{ with(self)
{
    return string;
}
},["CPString"]), new objj_method(sel_getUid("string"), function $CPData__string(self, _cmd)
{ with(self)
{
    if (!string && _plistObject)
        string = objj_msgSend(objj_msgSend(CPPropertyListSerialization, "dataFromPropertyList:format:errorDescription:", _plistObject, CPPropertyList280NorthFormat_v1_0, NULL), "string");
    return string;
}
},["CPString"]), new objj_method(sel_getUid("setString:"), function $CPData__setString_(self, _cmd, aString)
{ with(self)
{
    string = aString;
    _plistObject = nil;
}
},["void","CPString"]), new objj_method(sel_getUid("plistObject"), function $CPData__plistObject(self, _cmd)
{ with(self)
{
    if (string && !_plistObject)
        _plistObject = objj_msgSend(CPPropertyListSerialization, "propertyListFromData:format:errorDescription:", self, 0, NULL);
    return _plistObject;
}
},["id"]), new objj_method(sel_getUid("setPlistObject:"), function $CPData__setPlistObject_(self, _cmd, aPlistObject)
{ with(self)
{
    string = nil;
    _plistObject = aPlistObject;
}
},["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPData__alloc(self, _cmd)
{ with(self)
{
    return new objj_data();
}
},["id"]), new objj_method(sel_getUid("data"), function $CPData__data(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithPlistObject:", nil);
}
},["CPData"]), new objj_method(sel_getUid("dataWithString:"), function $CPData__dataWithString_(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithString:", aString);
}
},["CPData","CPString"]), new objj_method(sel_getUid("dataWithPlistObject:"), function $CPData__dataWithPlistObject_(self, _cmd, aPlistObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithPlistObject:", aPlistObject);
}
},["CPData","id"])]);
}
objj_data.prototype.isa = CPData;

