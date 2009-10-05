i;7;CPSet.jc;1818;
{var the_class = objj_allocateClassPair(CPMutableSet, "CPCountedSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_counts")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("addObject:"), function $CPCountedSet__addObject_(self, _cmd, anObject)
{ with(self)
{
    if (!_counts)
        _counts = {};
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMutableSet") }, "addObject:", anObject);
    var UID = objj_msgSend(anObject, "UID");
    if (_counts[UID] === undefined)
        _counts[UID] = 1;
    else
        ++_counts[UID];
}
},["void","id"]), new objj_method(sel_getUid("removeObject:"), function $CPCountedSet__removeObject_(self, _cmd, anObject)
{ with(self)
{
    if (!_counts)
        return;
    var UID = objj_msgSend(anObject, "UID");
    if (_counts[UID] === undefined)
        return;
    else
    {
        --_counts[UID];
        if (_counts[UID] === 0)
        {
            delete _counts[UID];
            objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMutableSet") }, "removeObject:", anObject);
        }
    }
}
},["void","id"]), new objj_method(sel_getUid("removeAllObjects"), function $CPCountedSet__removeAllObjects(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMutableSet") }, "removeAllObjects");
    _counts = {};
}
},["void"]), new objj_method(sel_getUid("countForObject:"), function $CPCountedSet__countForObject_(self, _cmd, anObject)
{ with(self)
{
    if (!_counts)
        _counts = {};
    var UID = objj_msgSend(anObject, "UID");
    if (_counts[UID] === undefined)
        return 0;
    return _counts[UID];
}
},["unsigned","id"])]);
}

