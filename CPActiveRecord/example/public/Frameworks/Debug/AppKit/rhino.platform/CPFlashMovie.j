I;21;Foundation/CPObject.jc;880;
{var the_class = objj_allocateClassPair(CPObject, "CPFlashMovie"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_fileName")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFile:"), function $CPFlashMovie__initWithFile_(self, _cmd, aFileName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _fileName = aFileName;
    return self;
}
},["id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("flashMovieWithFile:"), function $CPFlashMovie__flashMovieWithFile_(self, _cmd, aFileName)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithFile:", aFileName);
}
},["id","CPString"])]);
}

