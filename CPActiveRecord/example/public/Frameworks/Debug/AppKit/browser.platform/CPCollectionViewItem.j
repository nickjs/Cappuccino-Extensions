i;18;CPViewController.jc;1673;
{var the_class = objj_allocateClassPair(CPViewController, "CPCollectionViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isSelected")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setRepresentedObject:"), function $CPCollectionViewItem__setRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPViewController") }, "setRepresentedObject:", anObject);
    var view = objj_msgSend(self, "view");
    if (objj_msgSend(view, "respondsToSelector:", sel_getUid("setRepresentedObject:")))
        objj_msgSend(view, "setRepresentedObject:", objj_msgSend(self, "representedObject"));
}
},["void","id"]), new objj_method(sel_getUid("setSelected:"), function $CPCollectionViewItem__setSelected_(self, _cmd, shouldBeSelected)
{ with(self)
{
    shouldBeSelected = !!shouldBeSelected;
    if (_isSelected === shouldBeSelected)
        return;
    _isSelected = shouldBeSelected;
    var view = objj_msgSend(self, "view");
    if (objj_msgSend(view, "respondsToSelector:", sel_getUid("setSelected:")))
        objj_msgSend(view, "setSelected:", objj_msgSend(self, "isSelected"));
}
},["void","BOOL"]), new objj_method(sel_getUid("isSelected"), function $CPCollectionViewItem__isSelected(self, _cmd)
{ with(self)
{
    return _isSelected;
}
},["BOOL"]), new objj_method(sel_getUid("collectionView"), function $CPCollectionViewItem__collectionView(self, _cmd)
{ with(self)
{
    return objj_msgSend(_view, "superview");
}
},["CPCollectionView"])]);
}

