I;21;Foundation/CPObject.jc;526;




{var the_class = objj_allocateClassPair(CPObject, "CPScreen"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("visibleFrame"), function $CPScreen__visibleFrame(self, _cmd)
{ with(self)
{
    return { origin: { x:window.screen.availLeft, y:window.screen.availTop }, size: { width:window.screen.availWidth, height:window.screen.availHeight } };
}
},["CGRect"])]);
}

