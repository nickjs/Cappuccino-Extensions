i;8;CPView.jc;627;

{var the_class = objj_allocateClassPair(CPView, "_CPCornerView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPCornerView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame))
    {
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "purpleColor"));
    }

    return self;
}
},["id","CGRect"])]);
}

