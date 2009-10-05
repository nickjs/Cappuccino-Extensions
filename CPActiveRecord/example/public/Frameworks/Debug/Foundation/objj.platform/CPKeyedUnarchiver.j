i;8;CPNull.ji;9;CPCoder.jc;14379;
CPInvalidUnarchiveOperationException = "CPInvalidUnarchiveOperationException";
var _CPKeyedUnarchiverCannotDecodeObjectOfClassNameOriginalClassesSelector = 1 << 0,
    _CPKeyedUnarchiverDidDecodeObjectSelector = 1 << 1,
    _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector = 1 << 2,
    _CPKeyedUnarchiverWillFinishSelector = 1 << 3,
    _CPKeyedUnarchiverDidFinishSelector = 1 << 4,
    CPKeyedUnarchiverDelegate_unarchiver_cannotDecodeObjectOfClassName_originalClasses_ = 1 << 5;
var _CPKeyedArchiverNullString = "$null"
    _CPKeyedArchiverUIDKey = "CP$UID",
    _CPKeyedArchiverTopKey = "$top",
    _CPKeyedArchiverObjectsKey = "$objects",
    _CPKeyedArchiverArchiverKey = "$archiver",
    _CPKeyedArchiverVersionKey = "$version",
    _CPKeyedArchiverClassNameKey = "$classname",
    _CPKeyedArchiverClassesKey = "$classes",
    _CPKeyedArchiverClassKey = "$class";
var _CPKeyedUnarchiverArrayClass = Nil,
    _CPKeyedUnarchiverStringClass = Nil,
    _CPKeyedUnarchiverDictionaryClass = Nil,
    _CPKeyedUnarchiverNumberClass = Nil,
    _CPKeyedUnarchiverDataClass = Nil,
    _CPKeyedUnarchiverArchiverValueClass = Nil;
{var the_class = objj_allocateClassPair(CPCoder, "CPKeyedUnarchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_delegateSelectors"), new objj_ivar("_data"), new objj_ivar("_replacementClasses"), new objj_ivar("_objects"), new objj_ivar("_archive"), new objj_ivar("_plistObject"), new objj_ivar("_plistObjects")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithData:"), function $CPKeyedUnarchiver__initForReadingWithData_(self, _cmd, data)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCoder") }, "init");
    if (self)
    {
        _archive = objj_msgSend(data, "plistObject");
        _objects = objj_msgSend(CPArray, "arrayWithObject:", objj_msgSend(CPNull, "null"));
        _plistObject = objj_msgSend(_archive, "objectForKey:", _CPKeyedArchiverTopKey);
        _plistObjects = objj_msgSend(_archive, "objectForKey:", _CPKeyedArchiverObjectsKey);
        _replacementClasses = objj_msgSend(CPDictionary, "dictionary");
    }
    return self;
}
},["id","CPData"]), new objj_method(sel_getUid("containsValueForKey:"), function $CPKeyedUnarchiver__containsValueForKey_(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(_plistObject, "objectForKey:", aKey) != nil;
}
},["BOOL","CPString"]), new objj_method(sel_getUid("_decodeDictionaryOfObjectsForKey:"), function $CPKeyedUnarchiver___decodeDictionaryOfObjectsForKey_(self, _cmd, aKey)
{ with(self)
{
    var object = objj_msgSend(_plistObject, "objectForKey:", aKey);
    if (objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverDictionaryClass))
    {
        var key,
            keys = objj_msgSend(object, "keyEnumerator"),
            dictionary = objj_msgSend(CPDictionary, "dictionary");
        while (key = objj_msgSend(keys, "nextObject"))
            objj_msgSend(dictionary, "setObject:forKey:", _CPKeyedUnarchiverDecodeObjectAtIndex(self, objj_msgSend(objj_msgSend(object, "objectForKey:", key), "objectForKey:", _CPKeyedArchiverUIDKey)), key);
        return dictionary;
    }
    return nil;
}
},["void","CPString"]), new objj_method(sel_getUid("decodeBoolForKey:"), function $CPKeyedUnarchiver__decodeBoolForKey_(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(self, "decodeObjectForKey:", aKey);
}
},["BOOL","CPString"]), new objj_method(sel_getUid("decodeFloatForKey:"), function $CPKeyedUnarchiver__decodeFloatForKey_(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(self, "decodeObjectForKey:", aKey);
}
},["float","CPString"]), new objj_method(sel_getUid("decodeDoubleForKey:"), function $CPKeyedUnarchiver__decodeDoubleForKey_(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(self, "decodeObjectForKey:", aKey);
}
},["double","CPString"]), new objj_method(sel_getUid("decodeIntForKey:"), function $CPKeyedUnarchiver__decodeIntForKey_(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(self, "decodeObjectForKey:", aKey);
}
},["int","CPString"]), new objj_method(sel_getUid("decodePointForKey:"), function $CPKeyedUnarchiver__decodePointForKey_(self, _cmd, aKey)
{ with(self)
{
    var object = objj_msgSend(self, "decodeObjectForKey:", aKey);
    if(object)
        return CPPointFromString(object);
    else
        return CPPointMake(0.0, 0.0);
}
},["CGPoint","CPString"]), new objj_method(sel_getUid("decodeRectForKey:"), function $CPKeyedUnarchiver__decodeRectForKey_(self, _cmd, aKey)
{ with(self)
{
    var object = objj_msgSend(self, "decodeObjectForKey:", aKey);
    if(object)
        return CPRectFromString(object);
    else
        return CPRectMakeZero();
}
},["CGRect","CPString"]), new objj_method(sel_getUid("decodeSizeForKey:"), function $CPKeyedUnarchiver__decodeSizeForKey_(self, _cmd, aKey)
{ with(self)
{
    var object = objj_msgSend(self, "decodeObjectForKey:", aKey);
    if(object)
        return CPSizeFromString(object);
    else
        return CPSizeMake(0.0, 0.0);
}
},["CGSize","CPString"]), new objj_method(sel_getUid("decodeObjectForKey:"), function $CPKeyedUnarchiver__decodeObjectForKey_(self, _cmd, aKey)
{ with(self)
{
    var object = objj_msgSend(_plistObject, "objectForKey:", aKey);
    if (objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverDictionaryClass))
        return _CPKeyedUnarchiverDecodeObjectAtIndex(self, objj_msgSend(object, "objectForKey:", _CPKeyedArchiverUIDKey));
    else if (objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverNumberClass) || objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverDataClass) || objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverStringClass))
        return object;
    else if (objj_msgSend(object, "isKindOfClass:", _CPKeyedUnarchiverArrayClass))
    {
        var index = 0,
            count = object.length,
            array = [];
        for (; index < count; ++index)
            array[index] = _CPKeyedUnarchiverDecodeObjectAtIndex(self, objj_msgSend(object[index], "objectForKey:", _CPKeyedArchiverUIDKey));
        return array;
    }
    return nil;
}
},["id","CPString"]), new objj_method(sel_getUid("decodeBytesForKey:"), function $CPKeyedUnarchiver__decodeBytesForKey_(self, _cmd, aKey)
{ with(self)
{
    var data = objj_msgSend(self, "decodeObjectForKey:", aKey);
    if (objj_msgSend(data, "isKindOfClass:", objj_msgSend(CPData, "class")))
        return data.bytes;
    return nil;
}
},["id","CPString"]), new objj_method(sel_getUid("finishDecoding"), function $CPKeyedUnarchiver__finishDecoding(self, _cmd)
{ with(self)
{
    if (_delegateSelectors & _CPKeyedUnarchiverWillFinishSelector)
        objj_msgSend(_delegate, "unarchiverWillFinish:", self);
    if (_delegateSelectors & _CPKeyedUnarchiverDidFinishSelector)
        objj_msgSend(_delegate, "unarchiverDidFinish:", self);
}
},["void"]), new objj_method(sel_getUid("delegate"), function $CPKeyedUnarchiver__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPKeyedUnarchiver__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:")))
        _delegateSelectors |= _CPKeyedUnarchiverCannotDecodeObjectOfClassNameOriginalClassesSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiver:didDecodeObject:")))
        _delegateSelectors |= _CPKeyedUnarchiverDidDecodeObjectSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiver:willReplaceObject:withObject:")))
        _delegateSelectors |= _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiverWillFinish:")))
        _delegateSelectors |= _CPKeyedUnarchiverWilFinishSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiverDidFinish:")))
        _delegateSelectors |= _CPKeyedUnarchiverDidFinishSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:")))
        _delegateSelectors |= CPKeyedUnarchiverDelegate_unarchiver_cannotDecodeObjectOfClassName_originalClasses_;
}
},["void","id"]), new objj_method(sel_getUid("setClass:forClassName:"), function $CPKeyedUnarchiver__setClass_forClassName_(self, _cmd, aClass, aClassName)
{ with(self)
{
    objj_msgSend(_replacementClasses, "setObject:forKey:", aClass, aClassName);
}
},["void","Class","CPString"]), new objj_method(sel_getUid("classForClassName:"), function $CPKeyedUnarchiver__classForClassName_(self, _cmd, aClassName)
{ with(self)
{
    return objj_msgSend(_replacementClasses, "objectForKey:", aClassName);
}
},["Class","CPString"]), new objj_method(sel_getUid("allowsKeyedCoding"), function $CPKeyedUnarchiver__allowsKeyedCoding(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPKeyedUnarchiver__initialize(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(CPKeyedUnarchiver, "class"))
        return;
    _CPKeyedUnarchiverArrayClass = objj_msgSend(CPArray, "class");
    _CPKeyedUnarchiverStringClass = objj_msgSend(CPString, "class");
    _CPKeyedUnarchiverDictionaryClass = objj_msgSend(CPDictionary, "class");
    _CPKeyedUnarchiverNumberClass = objj_msgSend(CPNumber, "class");
    _CPKeyedUnarchiverDataClass = objj_msgSend(CPData, "class");
    _CPKeyedUnarchiverArchiverValueClass = objj_msgSend(_CPKeyedArchiverValue, "class");
}
},["void"]), new objj_method(sel_getUid("unarchiveObjectWithData:"), function $CPKeyedUnarchiver__unarchiveObjectWithData_(self, _cmd, data)
{ with(self)
{
    var unarchiver = objj_msgSend(objj_msgSend(self, "alloc"), "initForReadingWithData:", data),
        object = objj_msgSend(unarchiver, "decodeObjectForKey:", "root");
    objj_msgSend(unarchiver, "finishDecoding");
    return object;
}
},["id","CPData"]), new objj_method(sel_getUid("unarchiveObjectWithFile:"), function $CPKeyedUnarchiver__unarchiveObjectWithFile_(self, _cmd, aFilePath)
{ with(self)
{
}
},["id","CPString"]), new objj_method(sel_getUid("unarchiveObjectWithFile:asynchronously:"), function $CPKeyedUnarchiver__unarchiveObjectWithFile_asynchronously_(self, _cmd, aFilePath, aFlag)
{ with(self)
{
}
},["id","CPString","BOOL"])]);
}
var _CPKeyedUnarchiverDecodeObjectAtIndex = function(self, anIndex)
{
    var object = self._objects[anIndex];
    if (object)
        if (object == self._objects[0])
            return nil;
        else
            return object;
    var object,
        plistObject = self._plistObjects[anIndex];
    if (objj_msgSend(plistObject, "isKindOfClass:", _CPKeyedUnarchiverDictionaryClass))
    {
        var plistClass = self._plistObjects[objj_msgSend(objj_msgSend(plistObject, "objectForKey:", _CPKeyedArchiverClassKey), "objectForKey:", _CPKeyedArchiverUIDKey)],
            className = objj_msgSend(plistClass, "objectForKey:", _CPKeyedArchiverClassNameKey),
            classes = objj_msgSend(plistClass, "objectForKey:", _CPKeyedArchiverClassesKey),
            theClass = objj_msgSend(self, "classForClassName:", className);
        if (!theClass)
            theClass = CPClassFromString(className);
        if (!theClass && (self._delegateSelectors & CPKeyedUnarchiverDelegate_unarchiver_cannotDecodeObjectOfClassName_originalClasses_))
            theClass = objj_msgSend(_delegate, "unarchiver:cannotDecodeObjectOfClassName:originalClasses:", self, className, classes);
        if (!theClass)
            objj_msgSend(CPException, "raise:reason:", CPInvalidUnarchiveOperationException, "-[CPKeyedUnarchiver decodeObjectForKey:]: cannot decode object of class (" + className + ")");
        var savedPlistObject = self._plistObject;
        self._plistObject = plistObject;
        object = objj_msgSend(theClass, "allocWithCoder:", self);
        self._objects[anIndex] = object;
        var processedObject = objj_msgSend(object, "initWithCoder:", self);
        self._plistObject = savedPlistObject;
        if (processedObject != object)
        {
            if (self._delegateSelectors & _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector)
                objj_msgSend(self._delegate, "unarchiver:willReplaceObject:withObject:", self, object, processedObject);
            object = processedObject;
            self._objects[anIndex] = processedObject;
        }
        processedObject = objj_msgSend(object, "awakeAfterUsingCoder:", self);
        if (processedObject != object)
        {
            if (self._delegateSelectors & _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector)
                objj_msgSend(self._delegate, "unarchiver:willReplaceObject:withObject:", self, object, processedObject);
            object = processedObject;
            self._objects[anIndex] = processedObject;
        }
        if (self._delegate)
        {
            if (self._delegateSelectors & _CPKeyedUnarchiverDidDecodeObjectSelector)
                processedObject = objj_msgSend(self._delegate, "unarchiver:didDecodeObject:", self, object);
            if (processedObject != object)
            {
                if (self._delegateSelectors & _CPKeyedUnarchiverWillReplaceObjectWithObjectSelector)
                    objj_msgSend(self._delegate, "unarchiver:willReplaceObject:withObject:", self, object, processedObject);
                object = processedObject;
                self._objects[anIndex] = processedObject;
            }
        }
    }
    else
    {
        self._objects[anIndex] = object = plistObject;
        if (objj_msgSend(object, "class") == _CPKeyedUnarchiverStringClass)
        {
            if (object == _CPKeyedArchiverNullString)
            {
                self._objects[anIndex] = self._objects[0];
                return nil;
            }
            else
                self._objects[anIndex] = object = plistObject;
        }
    }
    if (objj_msgSend(object, "isMemberOfClass:", _CPKeyedUnarchiverArchiverValueClass))
        object = objj_msgSend(object, "JSObject");
    return object;
}

