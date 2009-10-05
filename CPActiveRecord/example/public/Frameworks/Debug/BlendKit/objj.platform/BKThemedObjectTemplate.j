I;15;AppKit/CPView.jc;1066;
{var the_class = objj_allocateClassPair(CPView, "BKThemedObjectTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_label"), new objj_ivar("_themedObject")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "init");
    if (self)
    {
        _label = objj_msgSend(aCoder, "decodeObjectForKey:", "BKThemedObjectTemplateLabel");
        _themedObject = objj_msgSend(aCoder, "decodeObjectForKey:", "BKThemedObjectTemplateThemedObject");
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _label, "BKThemedObjectTemplateLabel");
    objj_msgSend(aCoder, "encodeObject:forKey:", _themedObject, "BKThemedObjectTemplateThemedObject");
}
})]);
}

