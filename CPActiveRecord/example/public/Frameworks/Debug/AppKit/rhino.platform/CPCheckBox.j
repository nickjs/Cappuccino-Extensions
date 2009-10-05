i;10;CPButton.jc;1496;
{var the_class = objj_allocateClassPair(CPButton, "CPCheckBox"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPCheckBox__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setHighlightsBy:", CPContentsCellMask);
        objj_msgSend(self, "setShowsStateBy:", CPContentsCellMask);
        objj_msgSend(self, "setImagePosition:", CPImageLeft);
        objj_msgSend(self, "setAlignment:", CPLeftTextAlignment);
        objj_msgSend(self, "setBordered:", YES);
    }
    return self;
}
},["id","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("checkBoxWithTitle:theme:"), function $CPCheckBox__checkBoxWithTitle_theme_(self, _cmd, aTitle, aTheme)
{ with(self)
{
    return objj_msgSend(self, "buttonWithTitle:theme:", aTitle, aTheme);
}
},["id","CPString","CPTheme"]), new objj_method(sel_getUid("checkBoxWithTitle:"), function $CPCheckBox__checkBoxWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(self, "buttonWithTitle:", aTitle);
}
},["id","CPString"]), new objj_method(sel_getUid("themeClass"), function $CPCheckBox__themeClass(self, _cmd)
{ with(self)
{
    return "check-box";
}
},["CPString"])]);
}

