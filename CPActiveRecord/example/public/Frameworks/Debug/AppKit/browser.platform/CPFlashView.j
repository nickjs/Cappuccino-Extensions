i;14;CPFlashMovie.ji;8;CPView.jc;2920;
{var the_class = objj_allocateClassPair(CPView, "CPFlashView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_flashMovie"), new objj_ivar("_DOMEmbedElement"), new objj_ivar("_DOMMParamElement"), new objj_ivar("_DOMObjectElement")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPFlashView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _DOMObjectElement = document.createElement("object");
        _DOMObjectElement.width = "100%";
        _DOMObjectElement.height = "100%";
        _DOMObjectElement.style.top = "0px";
        _DOMObjectElement.style.left = "0px";
        _DOMParamElement = document.createElement("param");
        _DOMParamElement.name = "movie";
        _DOMObjectElement.appendChild(_DOMParamElement);
        var param = document.createElement("param");
        param.name = "wmode";
        param.value = "transparent";
        _DOMObjectElement.appendChild(param);
        _DOMEmbedElement = document.createElement("embed");
        _DOMEmbedElement.type = "application/x-shockwave-flash";
        _DOMEmbedElement.setAttribute("wmode", "transparent");
        _DOMEmbedElement.width = "100%";
        _DOMEmbedElement.height = "100%";
        _DOMElement.appendChild(_DOMEmbedElement);
        _DOMElement.appendChild(_DOMObjectElement);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setFlashMovie:"), function $CPFlashView__setFlashMovie_(self, _cmd, aFlashMovie)
{ with(self)
{
    if (_flashMovie == aFlashMovie)
        return;
    _flashMovie = aFlashMovie;
    _DOMParamElement.value = aFlashMovie._fileName;
    if (_DOMEmbedElement)
       _DOMEmbedElement.src = aFlashMovie._fileName;
}
},["void","CPFlashMovie"]), new objj_method(sel_getUid("flashMovie"), function $CPFlashView__flashMovie(self, _cmd)
{ with(self)
{
    return _flashMovie;
}
},["CPFlashMovie"]), new objj_method(sel_getUid("mouseDragged:"), function $CPFlashView__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $CPFlashView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseUp:"), function $CPFlashView__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
},["void","CPEvent"])]);
}

