I;15;AppKit/CPView.jc;2337;




{var the_class = objj_allocateClassPair(CPControl, "CPButtonBar"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPButtonBar__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
        return objj_msgSend(self, "bounds");

    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "rectForEphemeralSubviewNamed:", aName);
}
},["CGRect","CPString"]), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPButtonBar__createEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });

        objj_msgSend(view, "setHitTests:", NO);

        return view;
    }

    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "createEphemeralSubviewNamed:", aName);
}
},["CPView","CPString"]), new objj_method(sel_getUid("layoutSubviews"), function $CPButtonBar__layoutSubviews(self, _cmd)
{ with(self)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "");

    if (bezelView)
        objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-color"));
}
},["void"]), new objj_method(sel_getUid("addSubview:"), function $CPButtonBar__addSubview_(self, _cmd, aSubview)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "addSubview:", aSubview);

    objj_msgSend(aSubview, "setAutoresizingMask:", CPViewMinXMargin);
}
},["void","CPView"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeClass"), function $CPButtonBar__themeClass(self, _cmd)
{ with(self)
{
    return "button-bar";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPButtonBar__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [nil], ["bezel-color"]);
}
},["id"])]);
}

