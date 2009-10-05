i;13;CPTextField.jc;397;




{var the_class = objj_allocateClassPair(CPTextField, "CPSecureTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("isSecure"), function $CPSecureTextField__isSecure(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"])]);
}

