i;10;CPObject.ji;14;CPDictionary.ji;14;CPURLRequest.jc;5481;
{var the_class = objj_allocateClassPair(CPObject, "CPBundle"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPath:"), function $CPBundle__initWithPath_(self, _cmd, aPath)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        path = aPath;
        objj_setBundleForPath(path, self);
    }
    return self;
}
},["id","CPString"]), new objj_method(sel_getUid("classNamed:"), function $CPBundle__classNamed_(self, _cmd, aString)
{ with(self)
{
}
},["Class","CPString"]), new objj_method(sel_getUid("bundlePath"), function $CPBundle__bundlePath(self, _cmd)
{ with(self)
{
    return objj_msgSend(path, "stringByDeletingLastPathComponent");
}
},["CPString"]), new objj_method(sel_getUid("resourcePath"), function $CPBundle__resourcePath(self, _cmd)
{ with(self)
{
    var resourcePath = objj_msgSend(self, "bundlePath");
    if (resourcePath.length)
        resourcePath += '/';
    return resourcePath + "Resources";
}
},["CPString"]), new objj_method(sel_getUid("principalClass"), function $CPBundle__principalClass(self, _cmd)
{ with(self)
{
    var className = objj_msgSend(self, "objectForInfoDictionaryKey:", "CPPrincipalClass");
    return className ? CPClassFromString(className) : Nil;
}
},["Class"]), new objj_method(sel_getUid("pathForResource:"), function $CPBundle__pathForResource_(self, _cmd, aFilename)
{ with(self)
{
    return objj_msgSend(self, "resourcePath") + '/' + aFilename;
}
},["CPString","CPString"]), new objj_method(sel_getUid("infoDictionary"), function $CPBundle__infoDictionary(self, _cmd)
{ with(self)
{
    return info;
}
},["CPDictionary"]), new objj_method(sel_getUid("objectForInfoDictionaryKey:"), function $CPBundle__objectForInfoDictionaryKey_(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(info, "objectForKey:", aKey);
}
},["id","CPString"]), new objj_method(sel_getUid("loadWithDelegate:"), function $CPBundle__loadWithDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    self._delegate = aDelegate;
    self._infoConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", objj_msgSend(self, "bundlePath") + "/Info.plist"), self);
}
},["void","id"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $CPBundle__connection_didReceiveData_(self, _cmd, aConnection, data)
{ with(self)
{
    if (aConnection === self._infoConnection)
    {
        info = CPPropertyListCreateFromData(objj_msgSend(CPData, "dataWithString:", data));
        var platform = '/',
            platforms = objj_msgSend(self, "objectForInfoDictionaryKey:", "CPBundlePlatforms");
        if (platforms)
        {
            platform = objj_msgSend(platforms, "firstObjectCommonWithArray:", OBJJ_PLATFORMS);
            platform = platform ? '/' + platform + ".platform/" : '/';
        }
        objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", objj_msgSend(self, "bundlePath") + platform + objj_msgSend(self, "objectForInfoDictionaryKey:", "CPBundleExecutable")), self);
    }
    else
    {
        objj_decompile(objj_msgSend(data, "string"), self);
        var context = new objj_context();
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("bundleDidFinishLoading:")))
            context.didCompleteCallback = function() { objj_msgSend(_delegate, "bundleDidFinishLoading:", self); };
        var files = objj_msgSend(self, "objectForInfoDictionaryKey:", "CPBundleReplacedFiles"),
            count = files.length,
            bundlePath = objj_msgSend(self, "bundlePath");
        while (count--)
        {
            var fileName = files[count];
            if (fileName.indexOf(".j") === fileName.length - 2)
                context.pushFragment(fragment_create_file(bundlePath + '/' + fileName, new objj_bundle(""), YES, NULL));
        }
        if (context.fragments.length)
            context.evaluate();
        else
            objj_msgSend(_delegate, "bundleDidFinishLoading:", self);
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $CPBundle__connection_didFailWithError_(self, _cmd, aConnection, anError)
{ with(self)
{
    alert("Couldnot find bundle:" + anError)
}
},["void","CPURLConnection","CPError"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $CPBundle__connectionDidFinishLoading_(self, _cmd, aConnection)
{ with(self)
{
}
},["void","CPURLConnection"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPBundle__alloc(self, _cmd)
{ with(self)
{
    return new objj_bundle;
}
},["id"]), new objj_method(sel_getUid("bundleWithPath:"), function $CPBundle__bundleWithPath_(self, _cmd, aPath)
{ with(self)
{
    return objj_getBundleWithPath(aPath);
}
},["CPBundle","CPString"]), new objj_method(sel_getUid("bundleForClass:"), function $CPBundle__bundleForClass_(self, _cmd, aClass)
{ with(self)
{
    return objj_bundleForClass(aClass);
}
},["CPBundle","Class"]), new objj_method(sel_getUid("mainBundle"), function $CPBundle__mainBundle(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPBundle, "bundleWithPath:", "Info.plist");
}
},["CPBundle"])]);
}
objj_bundle.prototype.isa = CPBundle;

