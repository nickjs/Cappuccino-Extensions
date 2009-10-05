i;10;CPWindow.jc;1738;
CPOKButton = 1;
CPCancelButton = 0;
{var the_class = objj_allocateClassPair(CPWindow, "CPPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_becomesKeyOnlyIfNeeded"), new objj_ivar("_worksWhenModal")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("isFloatingPanel"), function $CPPanel__isFloatingPanel(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "level") == CPFloatingWindowLevel;
}
},["BOOL"]), new objj_method(sel_getUid("setFloatingPanel:"), function $CPPanel__setFloatingPanel_(self, _cmd, isFloatingPanel)
{ with(self)
{
    objj_msgSend(self, "setLevel:", isFloatingPanel ? CPFloatingWindowLevel : CPNormalWindowLevel);
}
},["void","BOOL"]), new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"), function $CPPanel__becomesKeyOnlyIfNeeded(self, _cmd)
{ with(self)
{
    return _becomesKeyOnlyIfNeeded;
}
},["BOOL"]), new objj_method(sel_getUid("setBecomesKeyOnlyIfNeeded:"), function $CPPanel__setBecomesKeyOnlyIfNeeded_(self, _cmd, shouldBecomeKeyOnlyIfNeeded)
{ with(self)
{
    _becomesKeyOnlyIfNeeded = shouldBecomeKeyOnlyIfNeeded
}
},["void","BOOL"]), new objj_method(sel_getUid("worksWhenModal"), function $CPPanel__worksWhenModal(self, _cmd)
{ with(self)
{
    return _worksWhenModal;
}
},["BOOL"]), new objj_method(sel_getUid("setWorksWhenModal:"), function $CPPanel__setWorksWhenModal_(self, _cmd, shouldWorkWhenModal)
{ with(self)
{
    _worksWhenModal = shouldWorkWhenModal;
}
},["void","BOOL"]), new objj_method(sel_getUid("canBecomeMainWindow"), function $CPPanel__canBecomeMainWindow(self, _cmd)
{ with(self)
{
    return NO;
}
},["BOOL"])]);
}

