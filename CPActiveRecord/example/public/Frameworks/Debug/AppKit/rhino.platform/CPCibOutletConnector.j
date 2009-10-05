i;16;CPCibConnector.jc;1021;
{var the_class = objj_allocateClassPair(CPCibConnector, "CPCibOutletConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("establishConnection"), function $CPCibOutletConnector__establishConnection(self, _cmd)
{ with(self)
{
    try
    {
        objj_msgSend(_source, "setValue:forKey:", _destination, _label);
    }
    catch (anException)
    {
        if (objj_msgSend(anException, "name") === CPUndefinedKeyException)
            CPLog.warn("Could not connect the outlet " + _label + " of target of class " + objj_msgSend(_source, "className"));
        else
            throw anException;
    }
}
},["void"])]);
}
{var the_class = objj_allocateClassPair(CPCibOutletConnector, "_CPCibOutletConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}

