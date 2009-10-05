I;21;Foundation/CPObject.jI;15;AppKit/CPView.jc;3911;
CPSelectedTab = 0;
CPBackgroundTab = 1;
CPPressedTab = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPTabViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_label"), new objj_ivar("_view"), new objj_ivar("_auxiliaryView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithIdentifier:"), function $CPTabViewItem__initWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _identifier = anIdentifier;
    return self;
}
},["id","id"]), new objj_method(sel_getUid("setLabel:"), function $CPTabViewItem__setLabel_(self, _cmd, aLabel)
{ with(self)
{
    _label = aLabel;
}
},["void","CPString"]), new objj_method(sel_getUid("label"), function $CPTabViewItem__label(self, _cmd)
{ with(self)
{
    return _label;
}
},["CPString"]), new objj_method(sel_getUid("tabState"), function $CPTabViewItem__tabState(self, _cmd)
{ with(self)
{
    return _tabState;
}
},["CPTabState"]), new objj_method(sel_getUid("setIdentifier:"), function $CPTabViewItem__setIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    _identifier = anIdentifier;
}
},["void","id"]), new objj_method(sel_getUid("identifier"), function $CPTabViewItem__identifier(self, _cmd)
{ with(self)
{
    return _identifier;
}
},["id"]), new objj_method(sel_getUid("setView:"), function $CPTabViewItem__setView_(self, _cmd, aView)
{ with(self)
{
    _view = aView;
}
},["void","CPView"]), new objj_method(sel_getUid("view"), function $CPTabViewItem__view(self, _cmd)
{ with(self)
{
    return _view;
}
},["CPView"]), new objj_method(sel_getUid("setAuxiliaryView:"), function $CPTabViewItem__setAuxiliaryView_(self, _cmd, anAuxiliaryView)
{ with(self)
{
    _auxiliaryView = anAuxiliaryView;
}
},["void","CPView"]), new objj_method(sel_getUid("auxiliaryView"), function $CPTabViewItem__auxiliaryView(self, _cmd)
{ with(self)
{
    return _auxiliaryView;
}
},["CPView"]), new objj_method(sel_getUid("tabView"), function $CPTabViewItem__tabView(self, _cmd)
{ with(self)
{
    return _tabView;
}
},["CPTabView"])]);
}
var CPTabViewItemIdentifierKey = "CPTabViewItemIdentifierKey",
    CPTabViewItemLabelKey = "CPTabViewItemLabelKey",
    CPTabViewItemViewKey = "CPTabViewItemViewKey",
    CPTabViewItemAuxViewKey = "CPTabViewItemAuxViewKey";
{
var the_class = objj_getClass("CPTabViewItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTabViewItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTabViewItem__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _identifier = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemIdentifierKey);
        _label = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemLabelKey);
        _view = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemViewKey);
        _auxiliaryView = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemAuxViewKey);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTabViewItem__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifier, CPTabViewItemIdentifierKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _label, CPTabViewItemLabelKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _view, CPTabViewItemViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _auxiliaryView, CPTabViewItemAuxViewKey);
}
},["void","CPCoder"])]);
}

