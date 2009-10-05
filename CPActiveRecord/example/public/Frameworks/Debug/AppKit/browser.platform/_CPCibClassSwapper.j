I;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;2066;
var _CPCibClassSwapperClassNameKey = "_CPCibClassSwapperClassNameKey",
    _CPCibClassSwapperOriginalClassNameKey = "_CPCibClassSwapperOriginalClassNameKey";
{var the_class = objj_allocateClassPair(CPObject, "_CPCibClassSwapper"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("allocObjectWithCoder:className:"), function $_CPCibClassSwapper__allocObjectWithCoder_className_(self, _cmd, aCoder, aClassName)
{ with(self)
{
    var theClass = objj_msgSend(aCoder, "classForClassName:", aClassName);
    if (!theClass)
    {
        theClass = objj_lookUpClass(aClassName);
        if (!theClass)
            return nil;
    }
    return objj_msgSend(theClass, "alloc");
}
},["void","CPCoder","CPString"]), new objj_method(sel_getUid("allocWithCoder:"), function $_CPCibClassSwapper__allocWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (objj_msgSend(aCoder, "respondsToSelector:", sel_getUid("usesOriginalClasses")) && objj_msgSend(aCoder, "usesOriginalClasses"))
    {
        var theClassName = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibClassSwapperOriginalClassNameKey),
            object = objj_msgSend(self, "allocObjectWithCoder:className:", aCoder, theClassName);
    }
    else
    {
        var theClassName = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibClassSwapperClassNameKey),
            object = objj_msgSend(self, "allocObjectWithCoder:className:", aCoder, theClassName);
        if (!object)
        {
            CPLog.error("Unable to find class " + theClassName + " in cib file.");
            object = objj_msgSend(self, "allocObjectWithCoder:className:", aCoder, objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibClassSwapperOriginalClassNameKey));
        }
    }
    if (!object)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Unable to find class " + theClassName + " in cib file.");
    return object;
}
},["id","CPCoder"])]);
}

