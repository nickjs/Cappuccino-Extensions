I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;23;CAMediaTimingFunction.jc;5758;
{var the_class = objj_allocateClassPair(CPObject, "CAAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isRemovedOnCompletion"), new objj_ivar("_delegate")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CAAnimation__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _isRemovedOnCompletion = YES;
    return self;
}
},["id"]), new objj_method(sel_getUid("shouldArchiveValueForKey:"), function $CAAnimation__shouldArchiveValueForKey_(self, _cmd, aKey)
{ with(self)
{
    return YES;
}
},["void","CPString"]), new objj_method(sel_getUid("setRemovedOnCompletion:"), function $CAAnimation__setRemovedOnCompletion_(self, _cmd, isRemovedOnCompletion)
{ with(self)
{
    _isRemovedOnCompletion = isRemovedOnCompletion;
}
},["void","BOOL"]), new objj_method(sel_getUid("removedOnCompletion"), function $CAAnimation__removedOnCompletion(self, _cmd)
{ with(self)
{
    return _isRemovedOnCompletion;
}
},["BOOL"]), new objj_method(sel_getUid("isRemovedOnCompletion"), function $CAAnimation__isRemovedOnCompletion(self, _cmd)
{ with(self)
{
    return _isRemovedOnCompletion;
}
},["BOOL"]), new objj_method(sel_getUid("timingFunction"), function $CAAnimation__timingFunction(self, _cmd)
{ with(self)
{
    return nil;
}
},["CAMediaTimingFunction"]), new objj_method(sel_getUid("setDelegate:"), function $CAAnimation__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $CAAnimation__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("runActionForKey:object:arguments:"), function $CAAnimation__runActionForKey_object_arguments_(self, _cmd, aKey, anObject, arguments)
{ with(self)
{
    objj_msgSend(anObject, "addAnimation:forKey:", self, aKey);
}
},["void","CPString","id","CPDictionary"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("animation"), function $CAAnimation__animation(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
},["id"]), new objj_method(sel_getUid("defaultValueForKey:"), function $CAAnimation__defaultValueForKey_(self, _cmd, aKey)
{ with(self)
{
    return nil;
}
},["id","CPString"])]);
}
{var the_class = objj_allocateClassPair(CAAnimation, "CAPropertyAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyPath"), new objj_ivar("_isCumulative"), new objj_ivar("_isAdditive")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setKeyPath:"), function $CAPropertyAnimation__setKeyPath_(self, _cmd, aKeyPath)
{ with(self)
{
    _keyPath = aKeyPath;
}
},["void","CPString"]), new objj_method(sel_getUid("keyPath"), function $CAPropertyAnimation__keyPath(self, _cmd)
{ with(self)
{
    return _keyPath;
}
},["CPString"]), new objj_method(sel_getUid("setCumulative:"), function $CAPropertyAnimation__setCumulative_(self, _cmd, isCumulative)
{ with(self)
{
    _isCumulative = isCumulative;
}
},["void","BOOL"]), new objj_method(sel_getUid("cumulative"), function $CAPropertyAnimation__cumulative(self, _cmd)
{ with(self)
{
    return _isCumulative;
}
},["BOOL"]), new objj_method(sel_getUid("isCumulative"), function $CAPropertyAnimation__isCumulative(self, _cmd)
{ with(self)
{
    return _isCumulative;
}
},["BOOL"]), new objj_method(sel_getUid("setAdditive:"), function $CAPropertyAnimation__setAdditive_(self, _cmd, isAdditive)
{ with(self)
{
    _isAdditive = isAdditive;
}
},["void","BOOL"]), new objj_method(sel_getUid("additive"), function $CAPropertyAnimation__additive(self, _cmd)
{ with(self)
{
    return _isAdditive;
}
},["BOOL"]), new objj_method(sel_getUid("isAdditive"), function $CAPropertyAnimation__isAdditive(self, _cmd)
{ with(self)
{
    return _isAdditive;
}
},["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("animationWithKeyPath:"), function $CAPropertyAnimation__animationWithKeyPath_(self, _cmd, aKeyPath)
{ with(self)
{
    var animation = objj_msgSend(self, "animation");
    objj_msgSend(animation, "setKeyPath:", aKeyPath);
    return animation;
}
},["id","CPString"])]);
}
{var the_class = objj_allocateClassPair(CAPropertyAnimation, "CABasicAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_fromValue"), new objj_ivar("_toValue"), new objj_ivar("_byValue")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setFromValue:"), function $CABasicAnimation__setFromValue_(self, _cmd, aValue)
{ with(self)
{
    _fromValue = aValue;
}
},["void","id"]), new objj_method(sel_getUid("fromValue"), function $CABasicAnimation__fromValue(self, _cmd)
{ with(self)
{
    return _fromValue;
}
},["id"]), new objj_method(sel_getUid("setToValue:"), function $CABasicAnimation__setToValue_(self, _cmd, aValue)
{ with(self)
{
    _toValue = aValue;
}
},["void","id"]), new objj_method(sel_getUid("toValue"), function $CABasicAnimation__toValue(self, _cmd)
{ with(self)
{
    return _toValue;
}
},["id"]), new objj_method(sel_getUid("setByValue:"), function $CABasicAnimation__setByValue_(self, _cmd, aValue)
{ with(self)
{
    _byValue = aValue;
}
},["void","id"]), new objj_method(sel_getUid("byValue"), function $CABasicAnimation__byValue(self, _cmd)
{ with(self)
{
    return _byValue;
}
},["id"])]);
}

