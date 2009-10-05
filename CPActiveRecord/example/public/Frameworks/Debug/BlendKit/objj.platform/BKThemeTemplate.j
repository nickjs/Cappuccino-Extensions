I;21;Foundation/CPObject.jc;1025;
{var the_class = objj_allocateClassPair(CPObject, "BKThemeTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_description")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _name = objj_msgSend(aCoder, "decodeObjectForKey:", "BKThemeTemplateName");
        _description = objj_msgSend(aCoder, "decodeObjectForKey:", "BKThemeTemplateDescription");
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _name, "BKThemeTemplateName");
    objj_msgSend(aCoder, "encodeObject:forKey:", _description, "BKThemeTemplateDescription");
}
})]);
}

