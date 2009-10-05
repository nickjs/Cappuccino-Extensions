I;20;AppKit/CPResponder.jc;5771;
{var the_class = objj_allocateClassPair(CPResponder, "CPViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_view"), new objj_ivar("_representedObject"), new objj_ivar("_title"), new objj_ivar("_cibName"), new objj_ivar("_cibBundle"), new objj_ivar("_cibExternalNameTable")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("representedObject"), function $CPViewController__representedObject(self, _cmd)
{ with(self)
{
return _representedObject;
}
},["id"]),
new objj_method(sel_getUid("setRepresentedObject:"), function $CPViewController__setRepresentedObject_(self, _cmd, newValue)
{ with(self)
{
_representedObject = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("title"), function $CPViewController__title(self, _cmd)
{ with(self)
{
return _title;
}
},["id"]),
new objj_method(sel_getUid("setTitle:"), function $CPViewController__setTitle_(self, _cmd, newValue)
{ with(self)
{
_title = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("cibName"), function $CPViewController__cibName(self, _cmd)
{ with(self)
{
return _cibName;
}
},["id"]),
new objj_method(sel_getUid("cibBundle"), function $CPViewController__cibBundle(self, _cmd)
{ with(self)
{
return _cibBundle;
}
},["id"]),
new objj_method(sel_getUid("cibExternalNameTable"), function $CPViewController__cibExternalNameTable(self, _cmd)
{ with(self)
{
return _cibExternalNameTable;
}
},["id"]), new objj_method(sel_getUid("init"), function $CPViewController__init(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithCibName:bundle:", nil, nil);
}
},["id"]), new objj_method(sel_getUid("initWithCibName:bundle:"), function $CPViewController__initWithCibName_bundle_(self, _cmd, aCibNameOrNil, aCibBundleOrNil)
{ with(self)
{
    return objj_msgSend(self, "initWithCibName:bundle:externalNameTable:", aCibNameOrNil, aCibBundleOrNil, nil);
}
},["id","CPString","CPBundle"]), new objj_method(sel_getUid("initWithCibName:bundle:owner:"), function $CPViewController__initWithCibName_bundle_owner_(self, _cmd, aCibNameOrNil, aCibBundleOrNil, anOwner)
{ with(self)
{
    return objj_msgSend(self, "initWithCibName:bundle:externalNameTable:", aCibNameOrNil, aCibBundleOrNil, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anOwner, CPCibOwner));
}
},["id","CPString","CPBundle","id"]), new objj_method(sel_getUid("initWithCibName:bundle:externalNameTable:"), function $CPViewController__initWithCibName_bundle_externalNameTable_(self, _cmd, aCibNameOrNil, aCibBundleOrNil, anExternalNameTable)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        _cibName = aCibNameOrNil;
        _cibBundle = aCibBundleOrNil || objj_msgSend(CPBundle, "mainBundle");
        _cibExternalNameTable = anExternalNameTable || objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", self, CPCibOwner);
    }
    return self;
}
},["id","CPString","CPBundle","CPDictionary"]), new objj_method(sel_getUid("loadView"), function $CPViewController__loadView(self, _cmd)
{ with(self)
{
    if (_view)
        return;
    var cib = objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithContentsOfURL:", objj_msgSend(_cibBundle, "pathForResource:", _cibName + ".cib"));
    objj_msgSend(cib, "instantiateCibWithExternalNameTable:", _cibExternalNameTable);
}
},["void"]), new objj_method(sel_getUid("view"), function $CPViewController__view(self, _cmd)
{ with(self)
{
    if (!_view)
    {
        var cibOwner = objj_msgSend(_cibExternalNameTable, "objectForKey:", CPCibOwner);
        if (objj_msgSend(cibOwner, "respondsToSelector:", sel_getUid("viewControllerWillLoadCib:")))
            objj_msgSend(cibOwner, "viewControllerWillLoadCib:", self);
        objj_msgSend(self, "loadView");
        if (_view === nil && objj_msgSend(cibOwner, "isKindOfClass:", objj_msgSend(CPDocument, "class")))
            objj_msgSend(self, "setView:", objj_msgSend(cibOwner, "valueForKey:", "view"));
        if (objj_msgSend(cibOwner, "respondsToSelector:", sel_getUid("viewControllerDidLoadCib:")))
            objj_msgSend(cibOwner, "viewControllerDidLoadCib:", self);
    }
    return _view;
}
},["CPView"]), new objj_method(sel_getUid("setView:"), function $CPViewController__setView_(self, _cmd, aView)
{ with(self)
{
    _view = aView;
}
},["void","CPView"])]);
}
var CPViewControllerViewKey = "CPViewControllerViewKey",
    CPViewControllerTitleKey = "CPViewControllerTitleKey";
{
var the_class = objj_getClass("CPViewController")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPViewController\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPViewController__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "initWithCoder:", aCoder);
    if (self)
    {
        _view = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewControllerViewKey);
        _title = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewControllerTitleKey);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPViewController__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _view, CPViewControllerViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPViewControllerTitleKey);
}
},["void","CPCoder"])]);
}

