I;21;Foundation/CPObject.jI;16;AppKit/CPTheme.jI;29;AppKit/_CPCibCustomResource.jI;30;AppKit/_CPCibKeyedUnarchiver.jc;2048;
{var the_class = objj_allocateClassPair(CPObject, "CPThemeBlend"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle"), new objj_ivar("_themes"), new objj_ivar("_loadDelegate")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("themes"), function $CPThemeBlend__themes(self, _cmd)
{ with(self)
{
return _themes;
}
},["id"]), new objj_method(sel_getUid("initWithContentsOfURL:"), function $CPThemeBlend__initWithContentsOfURL_(self, _cmd, aURL)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _bundle = objj_msgSend(objj_msgSend(CPBundle, "alloc"), "initWithPath:", aURL + "/Info.plist");
    }
    return self;
}
},["id","CPURL"]), new objj_method(sel_getUid("loadWithDelegate:"), function $CPThemeBlend__loadWithDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _loadDelegate = aDelegate;
    objj_msgSend(_bundle, "loadWithDelegate:", self);
}
},["void","id"]), new objj_method(sel_getUid("bundleDidFinishLoading:"), function $CPThemeBlend__bundleDidFinishLoading_(self, _cmd, aBundle)
{ with(self)
{
    var paths = objj_msgSend(_bundle, "objectForInfoDictionaryKey:", "CPBundleReplacedFiles"),
        index = 0,
        count = paths.length,
        bundlePath = objj_msgSend(_bundle, "bundlePath");
    while (count--)
    {
        var path = paths[count];
        if (objj_msgSend(path, "pathExtension") === "keyedtheme")
        {
            var unarchiver = objj_msgSend(objj_msgSend(_CPThemeKeyedUnarchiver, "alloc"), "initForReadingWithData:bundle:", objj_msgSend(CPData, "dataWithString:", objj_files[bundlePath + '/' + path].contents), _bundle);
            objj_msgSend(unarchiver, "decodeObjectForKey:", "root");
            objj_msgSend(unarchiver, "finishDecoding");
        }
    }
    objj_msgSend(_loadDelegate, "blendDidFinishLoading:", self);
}
},["void","CPBundle"])]);
}

