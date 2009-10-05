I;21;Foundation/CPObject.jc;2561;


var _CPCibCustomObjectClassName = "_CPCibCustomObjectClassName";

{var the_class = objj_allocateClassPair(CPObject, "_CPCibCustomObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("customClassName"), function $_CPCibCustomObject__customClassName(self, _cmd)
{ with(self)
{
    return _className;
}
},["CPString"]), new objj_method(sel_getUid("setCustomClassName:"), function $_CPCibCustomObject__setCustomClassName_(self, _cmd, aClassName)
{ with(self)
{
    _className = aClassName;
}
},["void","CPString"]), new objj_method(sel_getUid("description"), function $_CPCibCustomObject__description(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "description") + " (" + objj_msgSend(self, "customClassName") + ')';
}
},["CPString"])]);
}

{
var the_class = objj_getClass("_CPCibCustomObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibCustomObject\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPCibCustomObject__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
        _className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomObjectClassName);

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibCustomObject__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _className, _CPCibCustomObjectClassName);
}
},["void","CPCoder"]), new objj_method(sel_getUid("_cibInstantiate"), function $_CPCibCustomObject___cibInstantiate(self, _cmd)
{ with(self)
{
    var theClass = CPClassFromString(_className);


    if (theClass === objj_msgSend(self, "class"))
    {
        _className = "CPObject";

        return self;
    }

    if (!theClass)
    {

        CPLog("Unknown class \"" + _className + "\" in cib file");

        theClass = objj_msgSend(CPObject, "class");
    }

    if (theClass === objj_msgSend(CPApplication, "class"))
        return objj_msgSend(CPApplication, "sharedApplication");

    return objj_msgSend(objj_msgSend(theClass, "alloc"), "init");
}
},["id"])]);
}

