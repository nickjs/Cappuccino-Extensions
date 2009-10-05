i;16;CPCibConnector.jc;2102;
{var the_class = objj_allocateClassPair(CPCibConnector, "CPCibControlConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("establishConnection"), function $CPCibControlConnector__establishConnection(self, _cmd)
{ with(self)
{
    var selectorName = _label,
        selectorNameLength = objj_msgSend(selectorName, "length");
    if (selectorNameLength && selectorName[selectorNameLength - 1] !== ':')
        selectorName += ':';
    var selector = CPSelectorFromString(selectorName);
    if (!selector)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + objj_msgSend(self, "className") + ' ' + _cmd + "] selector " + selectorName + " does not exist.");
    if (_destination && !objj_msgSend(_destination, "respondsToSelector:", selector))
    {
        CPLog.warn("Could not connect the action " + selector + " to target of class " + objj_msgSend(_destination, "className"));
        return;
    }
    if (objj_msgSend(_source, "respondsToSelector:", sel_getUid("setAction:")))
        objj_msgSend(_source, sel_getUid("setAction:"), selector);
    else
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + objj_msgSend(self, "className") + ' ' + _cmd + "] " + objj_msgSend(_source, "description") + " does not respond to setAction:");
    if (objj_msgSend(_source, "respondsToSelector:", sel_getUid("setTarget:")))
        objj_msgSend(_source, sel_getUid("setTarget:"), _destination);
    else
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + objj_msgSend(self, "className") + ' ' + _cmd + "] " + objj_msgSend(_source, "description") + " does not respond to setTarget:");
}
},["void"])]);
}
{var the_class = objj_allocateClassPair(CPCibControlConnector, "_CPCibControlConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}

