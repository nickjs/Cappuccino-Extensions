c;9770;{var the_class = objj_allocateClassPair(Nil, "CPObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("isa")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPObject__init(self, _cmd)
{ with(self)
{
    return self;
}
},["id"]), new objj_method(sel_getUid("copy"), function $CPObject__copy(self, _cmd)
{ with(self)
{
    return self;
}
},["id"]), new objj_method(sel_getUid("mutableCopy"), function $CPObject__mutableCopy(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "copy");
}
},["id"]), new objj_method(sel_getUid("dealloc"), function $CPObject__dealloc(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("class"), function $CPObject__class(self, _cmd)
{ with(self)
{
    return isa;
}
},["Class"]), new objj_method(sel_getUid("isKindOfClass:"), function $CPObject__isKindOfClass_(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(isa, "isSubclassOfClass:", aClass);
}
},["BOOL","Class"]), new objj_method(sel_getUid("isMemberOfClass:"), function $CPObject__isMemberOfClass_(self, _cmd, aClass)
{ with(self)
{
    return self.isa === aClass;
}
},["BOOL","Class"]), new objj_method(sel_getUid("isProxy"), function $CPObject__isProxy(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("respondsToSelector:"), function $CPObject__respondsToSelector_(self, _cmd, aSelector)
{ with(self)
{
    return !!class_getInstanceMethod(isa, aSelector);
}
},["BOOL","SEL"]), new objj_method(sel_getUid("methodForSelector:"), function $CPObject__methodForSelector_(self, _cmd, aSelector)
{ with(self)
{
    return class_getMethodImplementation(isa, aSelector);
}
},["IMP","SEL"]), new objj_method(sel_getUid("methodSignatureForSelector:"), function $CPObject__methodSignatureForSelector_(self, _cmd, aSelector)
{ with(self)
{
    return nil;
}
},["CPMethodSignature","SEL"]), new objj_method(sel_getUid("description"), function $CPObject__description(self, _cmd)
{ with(self)
{
    return "<" + isa.name + " 0x" + objj_msgSend(CPString, "stringWithHash:", objj_msgSend(self, "UID")) + ">";
}
},["CPString"]), new objj_method(sel_getUid("performSelector:"), function $CPObject__performSelector_(self, _cmd, aSelector)
{ with(self)
{
    return objj_msgSend(self, aSelector);
}
},["id","SEL"]), new objj_method(sel_getUid("performSelector:withObject:"), function $CPObject__performSelector_withObject_(self, _cmd, aSelector, anObject)
{ with(self)
{
    return objj_msgSend(self, aSelector, anObject);
}
},["id","SEL","id"]), new objj_method(sel_getUid("performSelector:withObject:withObject:"), function $CPObject__performSelector_withObject_withObject_(self, _cmd, aSelector, anObject, anotherObject)
{ with(self)
{
    return objj_msgSend(self, aSelector, anObject, anotherObject);
}
},["id","SEL","id","id"]), new objj_method(sel_getUid("forwardInvocation:"), function $CPObject__forwardInvocation_(self, _cmd, anInvocation)
{ with(self)
{
    objj_msgSend(self, "doesNotRecognizeSelector:", objj_msgSend(anInvocation, "selector"));
}
},["void","CPInvocation"]), new objj_method(sel_getUid("forward::"), function $CPObject__forward__(self, _cmd, aSelector, args)
{ with(self)
{
    var signature = objj_msgSend(self, "methodSignatureForSelector:", aSelector);
    if (signature)
    {
        invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", signature);
        objj_msgSend(invocation, "setTarget:", self);
        objj_msgSend(invocation, "setSelector:", aSelector);
        var index = 2,
            count = args.length;
        for (; index < count; ++index)
            objj_msgSend(invocation, "setArgument:atIndex:", args[index], index);
        objj_msgSend(self, "forwardInvocation:", invocation);
        return objj_msgSend(invocation, "returnValue");
    }
    objj_msgSend(self, "doesNotRecognizeSelector:", aSelector);
}
},["void","SEL","marg_list"]), new objj_method(sel_getUid("doesNotRecognizeSelector:"), function $CPObject__doesNotRecognizeSelector_(self, _cmd, aSelector)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, 
        (class_isMetaClass(isa) ? "+" : "-") + " [" + objj_msgSend(self, "className") + " " + aSelector + "] unrecognized selector sent to " +
        (class_isMetaClass(isa) ? "class" : "instance") + " 0x" + objj_msgSend(CPString, "stringWithHash:", objj_msgSend(self, "UID")));
}
},["void","SEL"]), new objj_method(sel_getUid("awakeAfterUsingCoder:"), function $CPObject__awakeAfterUsingCoder_(self, _cmd, aCoder)
{ with(self)
{
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $CPObject__classForKeyedArchiver(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "classForCoder");
}
},["Class"]), new objj_method(sel_getUid("classForCoder"), function $CPObject__classForCoder(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "class");
}
},["Class"]), new objj_method(sel_getUid("replacementObjectForArchiver:"), function $CPObject__replacementObjectForArchiver_(self, _cmd, anArchiver)
{ with(self)
{
    return objj_msgSend(self, "replacementObjectForCoder:", anArchiver);
}
},["id","CPArchiver"]), new objj_method(sel_getUid("replacementObjectForKeyedArchiver:"), function $CPObject__replacementObjectForKeyedArchiver_(self, _cmd, anArchiver)
{ with(self)
{
    return objj_msgSend(self, "replacementObjectForCoder:", anArchiver);
}
},["id","CPKeyedArchiver"]), new objj_method(sel_getUid("replacementObjectForCoder:"), function $CPObject__replacementObjectForCoder_(self, _cmd, aCoder)
{ with(self)
{
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("className"), function $CPObject__className(self, _cmd)
{ with(self)
{
    return isa.name;
}
},["CPString"]), new objj_method(sel_getUid("autorelease"), function $CPObject__autorelease(self, _cmd)
{ with(self)
{
    return self;
}
},["id"]), new objj_method(sel_getUid("hash"), function $CPObject__hash(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "UID");
}
},["unsigned"]), new objj_method(sel_getUid("UID"), function $CPObject__UID(self, _cmd)
{ with(self)
{
    if (typeof self.__address === "undefined")
        self.__address = _objj_generateObjectHash();
    return __address;
}
},["unsigned"]), new objj_method(sel_getUid("isEqual:"), function $CPObject__isEqual_(self, _cmd, anObject)
{ with(self)
{
    return self === anObject || objj_msgSend(self, "UID") === objj_msgSend(anObject, "UID");
}
},["BOOL","id"]), new objj_method(sel_getUid("retain"), function $CPObject__retain(self, _cmd)
{ with(self)
{
    return self;
}
},["id"]), new objj_method(sel_getUid("release"), function $CPObject__release(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("self"), function $CPObject__self(self, _cmd)
{ with(self)
{
    return self;
}
},["id"]), new objj_method(sel_getUid("superclass"), function $CPObject__superclass(self, _cmd)
{ with(self)
{
    return isa.super_class;
}
},["Class"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("load"), function $CPObject__load(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("initialize"), function $CPObject__initialize(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("new"), function $CPObject__new(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
},["id"]), new objj_method(sel_getUid("alloc"), function $CPObject__alloc(self, _cmd)
{ with(self)
{
    return class_createInstance(self);
}
},["id"]), new objj_method(sel_getUid("allocWithCoder:"), function $CPObject__allocWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "alloc");
}
},["id","CPCoder"]), new objj_method(sel_getUid("class"), function $CPObject__class(self, _cmd)
{ with(self)
{
    return self;
}
},["Class"]), new objj_method(sel_getUid("superclass"), function $CPObject__superclass(self, _cmd)
{ with(self)
{
    return super_class;
}
},["Class"]), new objj_method(sel_getUid("isSubclassOfClass:"), function $CPObject__isSubclassOfClass_(self, _cmd, aClass)
{ with(self)
{
    var theClass = self;
    for(; theClass; theClass = theClass.super_class)
        if(theClass === aClass)
            return YES;
    return NO;
}
},["BOOL","Class"]), new objj_method(sel_getUid("isKindOfClass:"), function $CPObject__isKindOfClass_(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(self, "isSubclassOfClass:", aClass);
}
},["BOOL","Class"]), new objj_method(sel_getUid("isMemberOfClass:"), function $CPObject__isMemberOfClass_(self, _cmd, aClass)
{ with(self)
{
    return self === aClass;
}
},["BOOL","Class"]), new objj_method(sel_getUid("instancesRespondToSelector:"), function $CPObject__instancesRespondToSelector_(self, _cmd, aSelector)
{ with(self)
{
    return !!class_getInstanceMethod(self, aSelector);
}
},["BOOL","SEL"]), new objj_method(sel_getUid("instanceMethodForSelector:"), function $CPObject__instanceMethodForSelector_(self, _cmd, aSelector)
{ with(self)
{
    return class_getMethodImplementation(self, aSelector);
}
},["IMP","SEL"]), new objj_method(sel_getUid("setVersion:"), function $CPObject__setVersion_(self, _cmd, aVersion)
{ with(self)
{
    version = aVersion;
    return self;
}
},["id","int"]), new objj_method(sel_getUid("version"), function $CPObject__version(self, _cmd)
{ with(self)
{
    return version;
}
},["int"])]);
}
objj_object.prototype.toString = function()
{
    if (this.isa && class_getInstanceMethod(this.isa, "description") != NULL)
        return objj_msgSend(this, "description")
    else
        return String(this) + " (-description not implemented)";
}

