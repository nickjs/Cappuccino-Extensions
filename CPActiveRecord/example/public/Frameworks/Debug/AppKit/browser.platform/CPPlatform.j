I;21;Foundation/CPObject.jc;1547;




{var the_class = objj_allocateClassPair(CPObject, "CPPlatform"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("bootstrap"), function $CPPlatform__bootstrap(self, _cmd)
{ with(self)
{

    var body = document.getElementsByTagName("body")[0];

    body.innerHTML = "";
    body.style.overflow = "hidden";

    if (document.documentElement)
        document.documentElement.style.overflow = "hidden";


    objj_msgSend(CPPlatformString, "bootstrap");
    objj_msgSend(CPPlatformWindow, "setPrimaryPlatformWindow:", objj_msgSend(objj_msgSend(CPPlatformWindow, "alloc"), "_init"));
}
},["void"]), new objj_method(sel_getUid("isBrowser"), function $CPPlatform__isBrowser(self, _cmd)
{ with(self)
{
    return typeof window.cpIsDesktop === "undefined";
}
},["BOOL"]), new objj_method(sel_getUid("supportsDragAndDrop"), function $CPPlatform__supportsDragAndDrop(self, _cmd)
{ with(self)
{
    return CPFeatureIsCompatible(CPHTMLDragAndDropFeature);
}
},["BOOL"]), new objj_method(sel_getUid("supportsNativeMainMenu"), function $CPPlatform__supportsNativeMainMenu(self, _cmd)
{ with(self)
{
    return (typeof window["cpSetMainMenu"] === "function");
}
},["BOOL"]), new objj_method(sel_getUid("terminateApplication"), function $CPPlatform__terminateApplication(self, _cmd)
{ with(self)
{
    if (typeof window["cpTerminate"] === "function")
        window.cpTerminate();
}
},["void"])]);
}

