I;21;Foundation/CPObject.jI;29;Foundation/CPKeyValueCoding.jc;3643;
var _CPCibConnectorSourceKey = "_CPCibConnectorSourceKey",
    _CPCibConnectorDestinationKey = "_CPCibConnectorDestinationKey",
    _CPCibConnectorLabelKey = "_CPCibConnectorLabelKey";
{var the_class = objj_allocateClassPair(CPObject, "CPCibConnector"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_source"), new objj_ivar("_destination"), new objj_ivar("_label")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("source"), function $CPCibConnector__source(self, _cmd)
{ with(self)
{
return _source;
}
},["id"]),
new objj_method(sel_getUid("setSource:"), function $CPCibConnector__setSource_(self, _cmd, newValue)
{ with(self)
{
_source = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("destination"), function $CPCibConnector__destination(self, _cmd)
{ with(self)
{
return _destination;
}
},["id"]),
new objj_method(sel_getUid("setDestination:"), function $CPCibConnector__setDestination_(self, _cmd, newValue)
{ with(self)
{
_destination = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("label"), function $CPCibConnector__label(self, _cmd)
{ with(self)
{
return _label;
}
},["id"]),
new objj_method(sel_getUid("setLabel:"), function $CPCibConnector__setLabel_(self, _cmd, newValue)
{ with(self)
{
_label = newValue;
}
},["void","id"]), new objj_method(sel_getUid("replaceObject:withObject:"), function $CPCibConnector__replaceObject_withObject_(self, _cmd, anObject, anotherObject)
{ with(self)
{
    if (_source === anObject)
        _source = anotherObject;
    if (_destination === anObject)
        _destination = anotherObject;
}
},["void","id","id"]), new objj_method(sel_getUid("replaceObjects:"), function $CPCibConnector__replaceObjects_(self, _cmd, replacementObjects)
{ with(self)
{
    var replacement = replacementObjects[objj_msgSend(_source, "UID")];
    if (replacement !== undefined)
        _source = replacement;
    replacement = replacementObjects[objj_msgSend(_destination, "UID")];
    if (replacement !== undefined)
        _destination = replacement;
}
},["void","Object"])]);
}
{
var the_class = objj_getClass("CPCibConnector")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPCibConnector\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPCibConnector__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _source = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibConnectorSourceKey);
        _destination = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibConnectorDestinationKey);
        _label = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibConnectorLabelKey);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPCibConnector__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _source, _CPCibConnectorSourceKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _destination, _CPCibConnectorDestinationKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _label, _CPCibConnectorLabelKey);
}
},["void","CPCoder"])]);
}
{var the_class = objj_allocateClassPair(CPCibConnector, "_CPCibConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}

