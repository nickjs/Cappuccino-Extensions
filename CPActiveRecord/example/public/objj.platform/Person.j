i;16;CPActiveRecord.jc;890;
{var the_class = objj_allocateClassPair(CPActiveRecord, "Person"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("name"), new objj_ivar("email")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
return name;
}
}),
new objj_method(sel_getUid("setName:"), function(self, _cmd, newValue)
{ with(self)
{
name = newValue;
}
}), new objj_method(sel_getUid("attributes"), function(self, _cmd)
{ with(self)
{
    return {
        'person': {
            'name': name,
            'email': email
        }
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("resourcePath"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPURL, "URLWithString:", "/people");
}
})]);
}

