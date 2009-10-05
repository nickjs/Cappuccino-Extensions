@STATIC;1.0;p;15;AppController.jI;21;Foundation/CPObject.ji;8;Person.jc;2183;
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tableView"), new objj_ivar("people")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function(self, _cmd, aNotification)
{ with(self)
{
    var theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask),
        contentView = objj_msgSend(theWindow, "contentView");
    var nameColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "PersonName");
    objj_msgSend(nameColumn, "setWidth:", 150.0);
    tableView = objj_msgSend(objj_msgSend(CPTableView, "alloc"), "initWithFrame:", objj_msgSend(contentView, "bounds"));
    objj_msgSend(tableView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(tableView, "addTableColumn:", nameColumn);
    objj_msgSend(tableView, "setDelegate:", self);
    objj_msgSend(tableView, "setDataSource:", self);
    objj_msgSend(contentView, "addSubview:", tableView);
    objj_msgSend(theWindow, "orderFront:", self);
    objj_msgSend(Person, "addObserver:selector:", self, sel_getUid("peopleDidLoad:"));
}
}), new objj_method(sel_getUid("peopleDidLoad:"), function(self, _cmd, aNotification)
{ with(self)
{
    people = objj_msgSend(Person, "all");
    objj_msgSend(tableView, "reloadData");
}
})]);
}
{
var the_class = objj_getClass("AppController")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"AppController\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("numberOfRowsInTableView:"), function(self, _cmd, aTableView)
{ with(self)
{
    return objj_msgSend(people, "count");
}
}), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function(self, _cmd, aTableView, aColumn, aRow)
{ with(self)
{
    return objj_msgSend(people[aRow], "name");
}
})]);
}

p;16;CPActiveRecord.jI;21;Foundation/CPObject.ji;38;CPURLRequest+CPActiveRecordAdditions.jc;18757;
CPActiveRecordCollectionWillLoad = "CPActiveRecordCollectionWillLoad";
CPActiveRecordCollectionDidLoad = "CPActiveRecordCollectionDidLoad";
CPActiveRecordRecordWillLoad = "CPActiveRecordRecordWillLoad";
CPActiveRecordRecordDidLoad = "CPActiveRecordRecordDidLoad";
CPActiveRecordRecordWillSave = "CPActiveRecordRecordWillSave";
CPActiveRecordRecordDidSave = "CPActiveRecordRecordDidSave";
CPActiveRecordRecordWillDestroy = "CPActiveRecordRecordWillDestroy";
CPActiveRecordRecordDidDestroy = "CPActiveRecordRecordDidDestroy";
var CPActiveRecordModels;
{var the_class = objj_allocateClassPair(CPObject, "CPActiveRecord"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("identifier"), new objj_ivar("_lastSync")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("identifier"), function(self, _cmd)
{ with(self)
{
return identifier;
}
}),
new objj_method(sel_getUid("setIdentifier:"), function(self, _cmd, newValue)
{ with(self)
{
identifier = newValue;
}
}), new objj_method(sel_getUid("setIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    if (identifier === anIdentifier)
        return;
    var records = objj_msgSend(CPActiveRecord, "_recordsForClass:", objj_msgSend(self, "class"));
    if (identifier)
        objj_msgSend(records, "removeObjectForKey:", identifier);
    identifier = anIdentifier;
    if (identifier)
        objj_msgSend(records, "setObject:forKey:", self, identifier);
}
}), new objj_method(sel_getUid("attributes:"), function(self, _cmd, attr)
{ with(self)
{
    var ret = {};
    if (objj_msgSend(self, "identifier"))
        ret['id'] = objj_msgSend(self, "identifier");
    ret[objj_msgSend(objj_msgSend(self, "className"), "lowercaseString")] = attr;
    return ret;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    self._CPActiveRecordLastSync = 0;
}
}), new objj_method(sel_getUid("_recordsForClass:"), function(self, _cmd, aModel)
{ with(self)
{
    if (!CPActiveRecordModels)
        CPActiveRecordModels = objj_msgSend(CPDictionary, "dictionary");
    var records = objj_msgSend(CPActiveRecordModels, "objectForKey:", objj_msgSend(aModel, "className"));
    if (!records)
    {
        records = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(CPActiveRecordModels, "setObject:forKey:", records, objj_msgSend(aModel, "className"));
    }
    return records;
}
}), new objj_method(sel_getUid("_recordForClass:identifier:"), function(self, _cmd, aModel, anIdentifier)
{ with(self)
{
    if (!anIdentifier)
        return objj_msgSend(objj_msgSend(aModel, "alloc"), "init");
    var records = objj_msgSend(CPActiveRecord, "_recordsForClass:", aModel),
        record = objj_msgSend(records, "objectForKey:", anIdentifier);
    if (!record)
    {
        record = objj_msgSend(objj_msgSend(aModel, "alloc"), "init");
        objj_msgSend(record, "setIdentifier:", anIdentifier);
        objj_msgSend(records, "setObject:forKey:", record, anIdentifier);
    }
    return record;
}
}), new objj_method(sel_getUid("new"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "new:", nil);
}
}), new objj_method(sel_getUid("new:"), function(self, _cmd, attributes)
{ with(self)
{
    if (!attributes)
        attributes = {};
    var record = objj_msgSend(CPActiveRecord, "_recordForClass:identifier:", self, attributes.id);
    for (var attribute in attributes)
    {
        if (attribute == 'id')
            continue;
        try
        {
            objj_msgSend(record, "setValue:forKey:", attributes[attribute], attribute);
        }
        catch (anException)
        {
            if (objj_msgSend(anException, "name") === CPUndefinedKeyException)
                CPLog.info("Could not connect the remote property " + attribute + " of record of model " + objj_msgSend(record, "className"));
            else
                throw anException;
        }
    }
    return record;
}
}), new objj_method(sel_getUid("resourcePath"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPURL, "URLWithString:", "/" + objj_msgSend(objj_msgSend(self, "className"), "lowercaseString") + "s");
}
})]);
}
{
var the_class = objj_getClass("CPActiveRecord")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPActiveRecord\""));
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("all"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "findAll");
}
}), new objj_method(sel_getUid("first"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "findFirst");
}
}), new objj_method(sel_getUid("last"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "findLast");
}
}), new objj_method(sel_getUid("find:"), function(self, _cmd, options)
{ with(self)
{
    if (options.isa)
        return objj_msgSend(self, "_find_by_ids:", options);
    var records = objj_msgSend(objj_msgSend(CPActiveRecord, "_recordsForClass:", self), "allValues"),
        count = objj_msgSend(records, "count");
    if (options.conditions)
    {
        var matches = [];
        for (var i = 0; i < count; i++)
        {
            var record = records[i],
                matched = NO;
            for (conditionName in options.conditions)
            {
                var conditionValue = options.conditions[conditionName];
                if (conditionValue.isa && objj_msgSend(conditionValue, "class") === CPArray)
                {
                    if (!objj_msgSend(conditionValue, "containsObject:", objj_msgSend(record, "valueForKey:", conditionName)))
                        break;
                }
                else if (objj_msgSend(record, "valueForKey:", conditionName) != conditionValue)
                    break;
                objj_msgSend(matches, "addObject:", record);
                matched = YES;
            }
            if (matched && options.first)
                break;
        }
    }
    else
        var matches = records;
    if (!options.all)
    {
        var first = matches[0],
            last = matches[0];
        var count = objj_msgSend(matches, "count");
        for (var i = 0; i < count; i++)
        {
            var record = matches[i];
            if (objj_msgSend(record, "identifier") < objj_msgSend(first, "identifier"))
                first = record;
            if (objj_msgSend(record, "identifier") > objj_msgSend(last, "identifier"))
                last = record;
        }
    }
    if (options.last)
        return last;
    else if (options.all)
        return matches;
    else
        return first;
}
}), new objj_method(sel_getUid("_find_by_ids:"), function(self, _cmd, ids)
{ with(self)
{
    var records = objj_msgSend(CPActiveRecord, "_recordsForClass:", self);
    switch (objj_msgSend(ids, "class"))
    {
        case CPNumber:
        case CPString:
                        var record = objj_msgSend(records, "objectForKey:", ids);
                        if (!record)
                            objj_msgSend(self, "new:", {'id':ids});
                        return record;
        case CPArray:
                        var count = objj_msgSend(ids, "count"), found = [];
                        for (var i = 0; i < count; i++)
                        {
                            var record = objj_msgSend(records, "objectForKey:", ids[i]);
                            if (record)
                                objj_msgSend(found, "addObject:", record);
                        }
                        return found;
    }
}
}), new objj_method(sel_getUid("forwardInvocation:"), function(self, _cmd, anInvocation)
{ with(self)
{
    var selector = objj_msgSend(objj_msgSend(anInvocation, "selector"), "substringFromIndex:", 4),
        options = {};
    var scope;
    if (objj_msgSend(selector, "hasPrefix:", "All"))
        scope = "all";
    else if (objj_msgSend(selector, "hasPrefix:", "First"))
        scope = "first";
    else if (objj_msgSend(selector, "hasPrefix:", "Last"))
        scope = "last";
    if (scope)
        options[scope] = YES;
    selector = objj_msgSend(selector, "substringFromIndex:", objj_msgSend(scope, "length"));
    var attributes = objj_msgSend(selector, "componentsSeparatedByString:", ":");
    objj_msgSend(attributes, "removeLastObject");
    var count = objj_msgSend(attributes, "count");
    for (var i = 0; i < count; i++)
    {
        var attribute = attributes[i],
            passedOption = objj_msgSend(anInvocation, "argumentAtIndex:", i+2);
        if (objj_msgSend(attribute, "hasPrefix:", "By") || objj_msgSend(attribute, "hasPrefix:", "by"))
        {
            attribute = objj_msgSend(attribute, "substringFromIndex:", 2);
            attribute = objj_msgSend(objj_msgSend(attribute, "characterAtIndex:", 0), "lowercaseString") + objj_msgSend(attribute, "substringFromIndex:", 1);
            if (!options.conditions)
                options.conditions = {};
            options.conditions[attribute] = passedOption;
        }
        else if (objj_msgSend(attribute, "length") === 0)
        {
            for (var option in passedOption)
                options[option] = passedOption[option];
        }
    }
    objj_msgSend(anInvocation, "setSelector:", sel_getUid("find:"));
    objj_msgSend(anInvocation, "setArgument:atIndex:", options, 2);
    objj_msgSend(anInvocation, "invoke");
}
}), new objj_method(sel_getUid("methodSignatureForSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return objj_msgSend(aSelector, "hasPrefix:", sel_getUid("find"));
}
})]);
}
{
var the_class = objj_getClass("CPActiveRecord")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPActiveRecord\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("addObserver:selector:"), function(self, _cmd, anObserver, aSelector)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", anObserver, aSelector, CPActiveRecordRecordDidLoad, self);
    if (!objj_msgSend(self, "loadIfNeeded"))
        objj_msgSend(anObserver, aSelector, objj_msgSend(CPNotification, "notificationWithName:object:", CPActiveRecordRecordDidLoad, self));
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("addObserver:selector:"), function(self, _cmd, anObserver, aSelector)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", anObserver, aSelector, CPActiveRecordCollectionDidLoad, self);
    if (!objj_msgSend(self, "loadIfNeeded"))
        objj_msgSend(anObserver, aSelector, objj_msgSend(CPNotification, "notificationWithName:object:", CPActiveRecordCollectionDidLoad, self));
}
}), new objj_method(sel_getUid("setAutoRefresh:"), function(self, _cmd, shouldRefresh)
{ with(self)
{
    if (self._CPActiveRecordAutoRefresh)
        window.clearInterval(self._CPActiveRecordAutoRefresh);
    if (shouldRefresh)
        self._CPActiveRecordAutoRefresh = window.setInterval(function(){
            objj_msgSend(self, "loadIfNeeded");
        }, objj_msgSend(self, "syncFrequency")+1);
}
}), new objj_method(sel_getUid("autoRefresh"), function(self, _cmd)
{ with(self)
{
    return self._CPActiveRecordAutoRefresh;
}
})]);
}
{
var the_class = objj_getClass("CPActiveRecord")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPActiveRecord\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("loadIfNeeded"), function(self, _cmd)
{ with(self)
{
    if (!identifier)
        return;
    var now = (new Date()).getTime();
    if (now > _lastSync + objj_msgSend(objj_msgSend(self, "class"), "syncFrequency"))
    {
        _lastSync = now;
        var request = objj_msgSend(self, "recordWillLoad");
        if (!request)
            return;
        var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, objj_msgSend(self, "class"));
        connection.postTarget = self;
        connection.postAction = sel_getUid("recordDidLoad");
        return true;
    }
}
}), new objj_method(sel_getUid("reload"), function(self, _cmd)
{ with(self)
{
    _lastSync = 0;
    objj_msgSend(self, "loadIfNeeded");
}
}), new objj_method(sel_getUid("save"), function(self, _cmd)
{ with(self)
{
    var request = objj_msgSend(self, "recordWillSave");
    if (!request)
        return;
    var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, objj_msgSend(self, "class"));
    connection.postTarget = self;
    connection.postAction = sel_getUid("recordDidSave");
}
}), new objj_method(sel_getUid("destroy:"), function(self, _cmd, confirm)
{ with(self)
{
    if (!confirm)
        return;
    var request = objj_msgSend(self, "recordWillDestroy");
    if (!request)
        return;
    var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, objj_msgSend(self, "class"));
    connection.postTarget = self;
    connection.postAction = sel_getUid("recordDidDestroy");
}
}), new objj_method(sel_getUid("recordWillLoad"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPActiveRecordRecordWillLoad, self);
    var path = objj_msgSend(CPURL, "URLWithString:", objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "resourcePath"), "absoluteString") + "/" + identifier),
        request = objj_msgSend(CPURLRequest, "requestJSONWithURL:", path);
    return request;
}
}), new objj_method(sel_getUid("recordDidLoad"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPActiveRecordRecordDidLoad, self);
}
}), new objj_method(sel_getUid("recordWillSave"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPActiveRecordRecordWillSave, self);
    var request = objj_msgSend(CPURLRequest, "requestJSONWithURL:", objj_msgSend(objj_msgSend(self, "class"), "resourcePath") + (identifier ? "/" + objj_msgSend(self, "identifier") : ""));
    objj_msgSend(request, "setHTTPMethod:", identifier ? "PUT" : "POST");
    objj_msgSend(request, "setHTTPBody:", objj_msgSend(CPURLRequest, "stringifyJSON:", objj_msgSend(self, "attributes")));
    return request;
}
}), new objj_method(sel_getUid("recordDidSave"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPActiveRecordRecordDidSave, self);
    objj_msgSend(self, "recordDidLoad");
}
}), new objj_method(sel_getUid("recordWillDestroy"), function(self, _cmd)
{ with(self)
{
    if (!identifier)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPActiveRecordRecordWillDestroy, self);
    var request = objj_msgSend(CPURLRequest, "requestJSONWithURL:", objj_msgSend(objj_msgSend(self, "class"), "resourcePath") + "/" + identifier);
    objj_msgSend(request, "setHTTPMethod:", "DELETE");
    return request;
}
}), new objj_method(sel_getUid("recordDidDestroy"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPActiveRecord, "_recordsForClass:", objj_msgSend(self, "class")), "removeObjectForKey:", identifier);
    identifier = nil;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPActiveRecordRecordDidDestroy, self);
    if (objj_msgSend(objj_msgSend(self, "class"), "destroyPostsLoadNotification"))
        objj_msgSend(self, "recordDidLoad");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("syncFrequency"), function(self, _cmd)
{ with(self)
{
    return 5000;
}
}), new objj_method(sel_getUid("loadIfNeeded"), function(self, _cmd)
{ with(self)
{
    var now = (new Date()).getTime();
    if (now > self._CPActiveRecordLastSync + objj_msgSend(self, "syncFrequency"))
    {
        self._CPActiveRecordLastSync = now;
        var request = objj_msgSend(self, "collectionWillLoad");
        if (!request)
            return;
        var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
        connection.postTarget = self;
        connection.postAction = sel_getUid("collectionDidLoad");
        return true;
    }
}
}), new objj_method(sel_getUid("reload"), function(self, _cmd)
{ with(self)
{
    self._CPActiveRecordLastSync = 0;
    objj_msgSend(self, "loadIfNeeded");
}
}), new objj_method(sel_getUid("destroyPostsLoadNotification"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("connection:didReceiveData:"), function(self, _cmd, aConnection, aResponse)
{ with(self)
{
    try
    {
        var data = objj_msgSend(CPURLRequest, "parseJSON:", aResponse);
    }
    catch (anException)
    {
        CPLog.info("Could not load resource");
        return;
    }
    objj_msgSend(CPActiveRecord, "parseData:", data);
    if (aConnection.postTarget && aConnection.postAction && objj_msgSend(aConnection.postTarget, "respondsToSelector:", aConnection.postAction))
        objj_msgSend(aConnection.postTarget, aConnection.postAction);
}
}), new objj_method(sel_getUid("parseData:"), function(self, _cmd, data)
{ with(self)
{
    if (!data)
        return;
    if (data.isa)
    {
        if (objj_msgSend(data, "class") === CPArray)
        {
            var count = objj_msgSend(data, "count");
            for (var i = 0; i < count; i++)
                objj_msgSend(CPActiveRecord, "parseData:", data[i]);
        }
    }
    else
    {
        for (var key in data)
        {
            var model = objj_getClass(objj_msgSend(key, "capitalizedString"));
            objj_msgSend(model, "new:", data[key]);
        }
    }
}
}), new objj_method(sel_getUid("collectionWillLoad"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPActiveRecordCollectionWillLoad, self);
    return objj_msgSend(CPURLRequest, "requestJSONWithURL:", objj_msgSend(self, "resourcePath"));
}
}), new objj_method(sel_getUid("collectionDidLoad"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPActiveRecordCollectionDidLoad, self);
}
})]);
}

p;38;CPURLRequest+CPActiveRecordAdditions.jI;25;Foundation/CPURLRequest.jc;1191;
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

p;6;main.jI;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jc;78;
main= function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}

p;8;Person.ji;16;CPActiveRecord.jc;890;
{var the_class = objj_allocateClassPair(CPActiveRecord, "Person"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("name"), new objj_ivar("email")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
return name;
}
}),
new objj_method(sel_getUid("setName:"), function(self, _cmd, newValue)
{ with(self)
{
name = newValue;
}
}), new objj_method(sel_getUid("attributes"), function(self, _cmd)
{ with(self)
{
    return {
        'person': {
            'name': name,
            'email': email
        }
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("resourcePath"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPURL, "URLWithString:", "/people");
}
})]);
}

