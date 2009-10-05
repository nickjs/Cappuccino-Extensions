i;9;CALayer.ji;14;CPFlashMovie.jc;1149;
{var the_class = objj_allocateClassPair(CALayer, "CAFlashLayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_flashMovie")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setFlashMovie:"), function $CAFlashLayer__setFlashMovie_(self, _cmd, aFlashMovie)
{ with(self)
{
    if (_flashMovie == aFlashMovie)
        return;
    _flashMovie = aFlashMovie;
    _DOMElement.innerHTML = "<object width = \"100%\" height = \"100%\"><param name = \"movie\" value = \"" +
                            aFlashMovie._fileName +
                            "\"></param><param name = \"wmode\" value = \"transparent\"></param><embed src = \"" +
                            aFlashMovie._fileName + "\" type = \"application/x-shockwave-flash\" wmode = \"transparent\" width = \"100%\" height = \"100%\"></embed></object>";
}
},["void","CPFlashMovie"]), new objj_method(sel_getUid("flashMovie"), function $CAFlashLayer__flashMovie(self, _cmd)
{ with(self)
{
    return _flashMovie;
}
},["CPFlashMovie"])]);
}

