I;21;Foundation/CPObject.jc;1421;


{var the_class = objj_allocateClassPair(CPObject, "_CPCibProxyObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}

var _CPCibProxyObjectIdentifierKey = "CPIdentifier";

{
var the_class = objj_getClass("_CPCibProxyObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibProxyObject\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPCibProxyObject__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
        _identifier = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibProxyObjectIdentifierKey);

    if (objj_msgSend(aCoder, "respondsToSelector:", sel_getUid("externalObjectForProxyIdentifier:")))
        return objj_msgSend(aCoder, "externalObjectForProxyIdentifier:", _identifier);

    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibProxyObject__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifier, _CPCibProxyObjectIdentifierKey);
}
},["void","CPCoder"])]);
}

