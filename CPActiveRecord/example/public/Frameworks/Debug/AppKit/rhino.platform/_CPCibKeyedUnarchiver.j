I;30;Foundation/CPKeyedUnarchiver.jc;2342;


{var the_class = objj_allocateClassPair(CPKeyedUnarchiver, "_CPCibKeyedUnarchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle"), new objj_ivar("_awakenCustomResources"), new objj_ivar("_externalObjectsForProxyIdentifiers")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithData:bundle:awakenCustomResources:"), function $_CPCibKeyedUnarchiver__initForReadingWithData_bundle_awakenCustomResources_(self, _cmd, data, aBundle, shouldAwakenCustomResources)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyedUnarchiver") }, "initForReadingWithData:", data);

    if (self)
    {
        _bundle = aBundle;
        _awakenCustomResources = shouldAwakenCustomResources;

        objj_msgSend(self, "setDelegate:", self);
    }

    return self;
}
},["id","CPData","CPBundle","BOOL"]), new objj_method(sel_getUid("bundle"), function $_CPCibKeyedUnarchiver__bundle(self, _cmd)
{ with(self)
{
    return _bundle;
}
},["CPBundle"]), new objj_method(sel_getUid("awakenCustomResources"), function $_CPCibKeyedUnarchiver__awakenCustomResources(self, _cmd)
{ with(self)
{
    return _awakenCustomResources;
}
},["BOOL"]), new objj_method(sel_getUid("setExternalObjectsForProxyIdentifiers:"), function $_CPCibKeyedUnarchiver__setExternalObjectsForProxyIdentifiers_(self, _cmd, externalObjectsForProxyIdentifiers)
{ with(self)
{
    _externalObjectsForProxyIdentifiers = externalObjectsForProxyIdentifiers;
}
},["void","CPDictionary"]), new objj_method(sel_getUid("externalObjectForProxyIdentifier:"), function $_CPCibKeyedUnarchiver__externalObjectForProxyIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    return objj_msgSend(_externalObjectsForProxyIdentifiers, "objectForKey:", anIdentifier);
}
},["id","CPString"]), new objj_method(sel_getUid("replaceObjectAtUID:withObject:"), function $_CPCibKeyedUnarchiver__replaceObjectAtUID_withObject_(self, _cmd, aUID, anObject)
{ with(self)
{
    _objects[aUID] = anObject;
}
},["void","int","id"]), new objj_method(sel_getUid("objectAtUID:"), function $_CPCibKeyedUnarchiver__objectAtUID_(self, _cmd, aUID)
{ with(self)
{
    return _objects[aUID];
}
},["id","int"])]);
}

