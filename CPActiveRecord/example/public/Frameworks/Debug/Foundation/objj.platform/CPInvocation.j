i;10;CPObject.ji;13;CPException.jc;3991;
{var the_class = objj_allocateClassPair(CPObject, "CPInvocation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_returnValue"), new objj_ivar("_arguments"), new objj_ivar("_methodSignature")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithMethodSignature:"), function $CPInvocation__initWithMethodSignature_(self, _cmd, aMethodSignature)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _arguments = [];
        _methodSignature = aMethodSignature;
    }
    return self;
}
},["id","CPMethodSignature"]), new objj_method(sel_getUid("setSelector:"), function $CPInvocation__setSelector_(self, _cmd, aSelector)
{ with(self)
{
    _arguments[1] = aSelector;
}
},["void","SEL"]), new objj_method(sel_getUid("selector"), function $CPInvocation__selector(self, _cmd)
{ with(self)
{
    return _arguments[1];
}
},["SEL"]), new objj_method(sel_getUid("setTarget:"), function $CPInvocation__setTarget_(self, _cmd, aTarget)
{ with(self)
{
    _arguments[0] = aTarget;
}
},["void","id"]), new objj_method(sel_getUid("target"), function $CPInvocation__target(self, _cmd)
{ with(self)
{
    return _arguments[0];
}
},["id"]), new objj_method(sel_getUid("setArgument:atIndex:"), function $CPInvocation__setArgument_atIndex_(self, _cmd, anArgument, anIndex)
{ with(self)
{
    _arguments[anIndex] = anArgument;
}
},["void","id","unsigned"]), new objj_method(sel_getUid("argumentAtIndex:"), function $CPInvocation__argumentAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return _arguments[anIndex];
}
},["id","unsigned"]), new objj_method(sel_getUid("setReturnValue:"), function $CPInvocation__setReturnValue_(self, _cmd, aReturnValue)
{ with(self)
{
    _returnValue = aReturnValue;
}
},["void","id"]), new objj_method(sel_getUid("returnValue"), function $CPInvocation__returnValue(self, _cmd)
{ with(self)
{
    return _returnValue;
}
},["id"]), new objj_method(sel_getUid("invoke"), function $CPInvocation__invoke(self, _cmd)
{ with(self)
{
    _returnValue = objj_msgSend.apply(objj_msgSend, _arguments);
}
},["void"]), new objj_method(sel_getUid("invokeWithTarget:"), function $CPInvocation__invokeWithTarget_(self, _cmd, aTarget)
{ with(self)
{
    _arguments[0] = aTarget;
    _returnValue = objj_msgSend.apply(objj_msgSend, _arguments);
}
},["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("invocationWithMethodSignature:"), function $CPInvocation__invocationWithMethodSignature_(self, _cmd, aMethodSignature)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithMethodSignature:", aMethodSignature);
}
},["id","CPMethodSignature"])]);
}
var CPInvocationArguments = "CPInvocationArguments",
    CPInvocationReturnValue = "CPInvocationReturnValue";
{
var the_class = objj_getClass("CPInvocation")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPInvocation\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPInvocation__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _returnValue = objj_msgSend(aCoder, "decodeObjectForKey:", CPInvocationReturnValue);
        _arguments = objj_msgSend(aCoder, "decodeObjectForKey:", CPInvocationArguments);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPInvocation__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _returnValue, CPInvocationReturnValue);
    objj_msgSend(aCoder, "encodeObject:forKey:", _arguments, CPInvocationArguments);
}
},["void","CPCoder"])]);
}

