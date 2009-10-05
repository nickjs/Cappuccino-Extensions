c;1609;var CPGraphicsContextCurrent = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPGraphicsContext"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_graphicsPort")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithGraphicsPort:"), function $CPGraphicsContext__initWithGraphicsPort_(self, _cmd, aGraphicsPort)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _graphicsPort = aGraphicsPort;
    return self;
}
},["id","CPContext"]), new objj_method(sel_getUid("graphicsPort"), function $CPGraphicsContext__graphicsPort(self, _cmd)
{ with(self)
{
    return _graphicsPort;
}
},["CGContext"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("currentContext"), function $CPGraphicsContext__currentContext(self, _cmd)
{ with(self)
{
    return CPGraphicsContextCurrent;
}
},["CPGraphicsContext"]), new objj_method(sel_getUid("setCurrentContext:"), function $CPGraphicsContext__setCurrentContext_(self, _cmd, aGraphicsContext)
{ with(self)
{
    CPGraphicsContextCurrent = aGraphicsContext;
}
},["void","CPGraphicsContext"]), new objj_method(sel_getUid("graphicsContextWithGraphicsPort:flipped:"), function $CPGraphicsContext__graphicsContextWithGraphicsPort_flipped_(self, _cmd, aContext, aFlag)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithGraphicsPort:", aContext);
}
},["CPGraphicsContext","CGContext","BOOL"])]);
}

