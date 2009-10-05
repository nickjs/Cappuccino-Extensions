I;20;Foundation/CPArray.jI;21;Foundation/CPObject.jc;2929;
{var the_class = objj_allocateClassPair(CPObject, "CPDOMWindowLayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_level"), new objj_ivar("_windows"), new objj_ivar("_DOMElement")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithLevel:"), function $CPDOMWindowLayer__initWithLevel_(self, _cmd, aLevel)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _level = aLevel;
        _windows = [];
        _DOMElement = document.createElement("div");
        _DOMElement.style.position = "absolute";
        _DOMElement.style.top = "0px";
        _DOMElement.style.left = "0px";
        _DOMElement.style.width = "1px";
        _DOMElement.style.height = "1px";
    }
    return self;
}
},["id","int"]), new objj_method(sel_getUid("level"), function $CPDOMWindowLayer__level(self, _cmd)
{ with(self)
{
    return _level;
}
},["int"]), new objj_method(sel_getUid("removeWindow:"), function $CPDOMWindowLayer__removeWindow_(self, _cmd, aWindow)
{ with(self)
{
    if (!aWindow._isVisible)
        return;
    var index = aWindow._index,
        count = _windows.length - 1;
    _DOMElement.removeChild(aWindow._DOMElement);
    objj_msgSend(_windows, "removeObjectAtIndex:", aWindow._index);
    for (; index < count; ++index)
    {
        _windows[index]._index = index;
        _windows[index]._DOMElement.style.zIndex = index;
    }
    aWindow._isVisible = NO;
}
},["void","CPWindow"]), new objj_method(sel_getUid("insertWindow:atIndex:"), function $CPDOMWindowLayer__insertWindow_atIndex_(self, _cmd, aWindow, anIndex)
{ with(self)
{
    var count = objj_msgSend(_windows, "count"),
        zIndex = (anIndex == CPNotFound ? count : anIndex),
        isVisible = aWindow._isVisible;
    if (isVisible)
    {
        zIndex = MIN(zIndex, aWindow._index);
        objj_msgSend(_windows, "removeObjectAtIndex:", aWindow._index);
    }
    else
        ++count;
    if (anIndex == CPNotFound || anIndex >= count)
        objj_msgSend(_windows, "addObject:", aWindow);
    else
        objj_msgSend(_windows, "insertObject:atIndex:", aWindow, anIndex);
    for (; zIndex < count; ++zIndex)
    {
        _windows[zIndex]._index = zIndex;
        _windows[zIndex]._DOMElement.style.zIndex = zIndex;
    }
    if (!isVisible)
    {
        _DOMElement.appendChild(aWindow._DOMElement);
        aWindow._isVisible = YES;
        if (objj_msgSend(aWindow, "isFullBridge"))
            objj_msgSend(aWindow, "setFrame:", objj_msgSend(aWindow._platformWindow, "usableContentFrame"));
    }
}
},["void","CPWindow","unsigned"]), new objj_method(sel_getUid("orderedWindows"), function $CPDOMWindowLayer__orderedWindows(self, _cmd)
{ with(self)
{
    return _windows;
}
},["CPArray"])]);
}

