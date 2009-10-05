I;25;Foundation/CPURLRequest.jc;1191;
{
var the_class = objj_getClass("CPURLRequest")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPURLRequest\""));
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("requestJSONWithURL:"), function(self, _cmd, aURL)
{ with(self)
{
    var request = objj_msgSend(self, "requestWithURL:", aURL);
    objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/json", "Accept");
    objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/json", "Content-Type");
    return request;
}
}), new objj_method(sel_getUid("parseJSON:"), function(self, _cmd, aString)
{ with(self)
{
    try
    {
        var obj = JSON.parse(aString);
    }
    catch (anException)
    {
        CPLog.info("Could not parse JSON: " + aString);
    }
    if (obj)
        return obj;
}
}), new objj_method(sel_getUid("stringifyJSON:"), function(self, _cmd, anObject)
{ with(self)
{
    try
    {
        var string = JSON.stringify(anObject);
    }
    catch (anException)
    {
        CPLog.info("Could not stringify JSON.");
    }
    if (string)
        return string;
}
})]);
}
I;25;Foundation/CPURLRequest.jc;1192;
{
var the_class = objj_getClass("CPURLRequest")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPURLRequest\""));
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("requestJSONWithURL:"), function(self, _cmd, aURL)
{ with(self)
{
    var request = objj_msgSend(self, "requestWithURL:", aURL);
    objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/json", "Accept");
    objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/json", "Content-Type");
    return request;
}
}), new objj_method(sel_getUid("parseJSON:"), function(self, _cmd, aString)
{ with(self)
{
    try
    {
        var obj = JSON.parse(aString);
    }
    catch (anException)
    {
        CPLog.info("Could not parse JSON: " + aString);
    }
    if (obj)
        return obj;
}
}), new objj_method(sel_getUid("stringifyJSON:"), function(self, _cmd, anObject)
{ with(self)
{
    try
    {
        var string = JSON.stringify(anObject);
    }
    catch (anException)
    {
        CPLog.info("Could not stringify JSON.");
    }
    if (string)
        return string;
}
})]);
}

