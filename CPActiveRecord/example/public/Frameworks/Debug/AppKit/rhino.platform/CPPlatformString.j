I;21;Foundation/CPObject.jc;632;
{var the_class = objj_allocateClassPair(CPObject, "CPPlatformString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("bootstrap"), function $CPPlatformString__bootstrap(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"), function $CPPlatformString__sizeOfString_withFont_forWidth_(self, _cmd, aString, aFont, aWidth)
{ with(self)
{
    return { width:0.0, height:0.0 };
}
},["CGSize","CPString","CPFont","float"])]);
}

