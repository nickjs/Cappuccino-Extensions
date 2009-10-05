i;10;CPObject.ji;9;CPArray.ji;10;CPNumber.ji;14;CPEnumerator.jc;11321;
{var the_class = objj_allocateClassPair(CPObject, "CPSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contents"), new objj_ivar("_count")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPSet__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        _count = 0;
        _contents = {};
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("initWithArray:"), function $CPSet__initWithArray_(self, _cmd, anArray)
{ with(self)
{
    if (self = objj_msgSend(self, "init"))
    {
        var count = anArray.length;
        while (count--)
            objj_msgSend(self, "addObject:", anArray[count]);
    }
    return self;
}
},["id","CPArray"]), new objj_method(sel_getUid("initWithObjects:count:"), function $CPSet__initWithObjects_count_(self, _cmd, objects, count)
{ with(self)
{
    return objj_msgSend(self, "initWithArray:", objects.splice(0, count));
}
},["id","id","unsigned"]), new objj_method(sel_getUid("initWithObjects:"), function $CPSet__initWithObjects_(self, _cmd, anObject)
{ with(self)
{
    if (self = objj_msgSend(self, "init"))
    {
  var argLength = arguments.length,
   i = 2;
        for(; i < argLength && (argument = arguments[i]) != nil; ++i)
            objj_msgSend(self, "addObject:", argument);
    }
    return self;
}
},["id","id"]), new objj_method(sel_getUid("initWithSet:"), function $CPSet__initWithSet_(self, _cmd, aSet)
{ with(self)
{
    return objj_msgSend(self, "initWithSet:copyItems:", aSet, NO);
}
},["id","CPSet"]), new objj_method(sel_getUid("initWithSet:copyItems:"), function $CPSet__initWithSet_copyItems_(self, _cmd, aSet, shouldCopyItems)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (!aSet)
        return self;
    var contents = aSet._contents;
    for (var property in contents)
    {
        if (contents.hasOwnProperty(property))
        {
            if (shouldCopyItems)
                objj_msgSend(self, "addObject:", objj_msgSend(contents[property], "copy"));
            else
                objj_msgSend(self, "addObject:", contents[property]);
        }
    }
    return self;
}
},["id","CPSet","BOOL"]), new objj_method(sel_getUid("allObjects"), function $CPSet__allObjects(self, _cmd)
{ with(self)
{
    var array = [];
    for (var property in _contents)
    {
        if (_contents.hasOwnProperty(property))
            array.push(_contents[property]);
    }
    return array;
}
},["CPArray"]), new objj_method(sel_getUid("anyObject"), function $CPSet__anyObject(self, _cmd)
{ with(self)
{
    for (var property in _contents)
    {
        if (_contents.hasOwnProperty(property))
            return _contents[property];
    }
    return nil;
}
},["id"]), new objj_method(sel_getUid("containsObject:"), function $CPSet__containsObject_(self, _cmd, anObject)
{ with(self)
{
    if (_contents[objj_msgSend(anObject, "UID")] && objj_msgSend(_contents[objj_msgSend(anObject, "UID")], "isEqual:", anObject))
        return YES;
    return NO;
}
},["BOOL","id"]), new objj_method(sel_getUid("count"), function $CPSet__count(self, _cmd)
{ with(self)
{
    return _count;
}
},["unsigned"]), new objj_method(sel_getUid("intersectsSet:"), function $CPSet__intersectsSet_(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(set, "allObjects");
    for (var i = items.length; i > 0; i--)
    {
        if (objj_msgSend(self, "containsObject:", items[i]))
            return YES;
    }
    return NO;
}
},["BOOL","CPSet"]), new objj_method(sel_getUid("isEqualToSet:"), function $CPSet__isEqualToSet_(self, _cmd, set)
{ with(self)
{
    return self === set || (objj_msgSend(self, "count") === objj_msgSend(set, "count") && objj_msgSend(set, "isSubsetOfSet:", self));
}
},["BOOL","CPSet"]), new objj_method(sel_getUid("isSubsetOfSet:"), function $CPSet__isSubsetOfSet_(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(self, "allObjects");
    for (var i = 0; i < items.length; i++)
    {
        if (!objj_msgSend(set, "containsObject:", items[i]))
            return NO;
    }
    return YES;
}
},["BOOL","CPSet"]), new objj_method(sel_getUid("makeObjectsPerformSelector:"), function $CPSet__makeObjectsPerformSelector_(self, _cmd, aSelector)
{ with(self)
{
    objj_msgSend(self, "makeObjectsPerformSelector:withObject:", aSelector, nil);
}
},["void","SEL"]), new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"), function $CPSet__makeObjectsPerformSelector_withObject_(self, _cmd, aSelector, argument)
{ with(self)
{
    var items = objj_msgSend(self, "allObjects");
    for (var i = 0; i < items.length; i++)
    {
        objj_msgSend(items[i], "performSelector:withObject:", aSelector, argument);
    }
}
},["void","SEL","id"]), new objj_method(sel_getUid("member:"), function $CPSet__member_(self, _cmd, object)
{ with(self)
{
    if (objj_msgSend(self, "containsObject:", object))
        return object;
    return nil;
}
},["id","id"]), new objj_method(sel_getUid("objectEnumerator"), function $CPSet__objectEnumerator(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "allObjects"), "objectEnumerator");
}
},["CPEnumerator"]), new objj_method(sel_getUid("initWithCapacity:"), function $CPSet__initWithCapacity_(self, _cmd, numItems)
{ with(self)
{
    self = objj_msgSend(self, "init");
    return self;
}
},["id","unsigned"]), new objj_method(sel_getUid("setSet:"), function $CPSet__setSet_(self, _cmd, set)
{ with(self)
{
    objj_msgSend(self, "removeAllObjects");
    objj_msgSend(self, "addObjectsFromArray:", objj_msgSend(set, "allObjects"));
}
},["void","CPSet"]), new objj_method(sel_getUid("addObject:"), function $CPSet__addObject_(self, _cmd, anObject)
{ with(self)
{
    if (objj_msgSend(self, "containsObject:", anObject))
        return;
    _contents[objj_msgSend(anObject, "UID")] = anObject;
    _count++;
}
},["void","id"]), new objj_method(sel_getUid("addObjectsFromArray:"), function $CPSet__addObjectsFromArray_(self, _cmd, objects)
{ with(self)
{
    var count = objj_msgSend(objects, "count");
    while (count--)
        objj_msgSend(self, "addObject:", objects[count]);
}
},["void","CPArray"]), new objj_method(sel_getUid("removeObject:"), function $CPSet__removeObject_(self, _cmd, anObject)
{ with(self)
{
    if (objj_msgSend(self, "containsObject:", anObject))
    {
        delete _contents[objj_msgSend(anObject, "UID")];
        _count--;
    }
}
},["void","id"]), new objj_method(sel_getUid("removeObjectsInArray:"), function $CPSet__removeObjectsInArray_(self, _cmd, objects)
{ with(self)
{
    var count = objj_msgSend(objects, "count");
    while (count--)
        objj_msgSend(self, "removeObject:", objects[count]);
}
},["void","CPArray"]), new objj_method(sel_getUid("removeAllObjects"), function $CPSet__removeAllObjects(self, _cmd)
{ with(self)
{
    _contents = {};
    _count = 0;
}
},["void"]), new objj_method(sel_getUid("intersectSet:"), function $CPSet__intersectSet_(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(self, "allObjects");
    for (var i = 0, count = items.length; i < count; i++)
    {
        if (!objj_msgSend(set, "containsObject:", items[i]))
            objj_msgSend(self, "removeObject:", items[i]);
    }
}
},["void","CPSet"]), new objj_method(sel_getUid("minusSet:"), function $CPSet__minusSet_(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(set, "allObjects");
    for (var i = 0; i < items.length; i++)
    {
        if (objj_msgSend(self, "containsObject:", items[i]))
            objj_msgSend(self, "removeObject:", items[i]);
    }
}
},["void","CPSet"]), new objj_method(sel_getUid("unionSet:"), function $CPSet__unionSet_(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(set, "allObjects");
    for (var i = 0, count = items.length; i < count; i++)
    {
        objj_msgSend(self, "addObject:", items[i]);
    }
}
},["void","CPSet"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("set"), function $CPSet__set(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
},["id"]), new objj_method(sel_getUid("setWithArray:"), function $CPSet__setWithArray_(self, _cmd, array)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithArray:", array);
}
},["id","CPArray"]), new objj_method(sel_getUid("setWithObject:"), function $CPSet__setWithObject_(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithArray:", [anObject]);
}
},["id","id"]), new objj_method(sel_getUid("setWithObjects:count:"), function $CPSet__setWithObjects_count_(self, _cmd, objects, count)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:count:", objects, count);
}
},["id","id","unsigned"]), new objj_method(sel_getUid("setWithObjects:"), function $CPSet__setWithObjects_(self, _cmd, anObject)
{ with(self)
{
    var set = objj_msgSend(objj_msgSend(self, "alloc"), "init"),
        argLength = arguments.length,
        i = 2;
    for(; i < argLength && ((argument = arguments[i]) !== nil); ++i)
        objj_msgSend(set, "addObject:", argument);
    return set;
}
},["id","id"]), new objj_method(sel_getUid("setWithSet:"), function $CPSet__setWithSet_(self, _cmd, set)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithSet:", set);
}
},["id","CPSet"]), new objj_method(sel_getUid("setWithCapacity:"), function $CPSet__setWithCapacity_(self, _cmd, numItems)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithCapacity:", numItems);
}
},["id","unsigned"])]);
}
{
var the_class = objj_getClass("CPSet")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSet\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPSet__copy(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPSet, "alloc"), "initWithSet:", self);
}
},["id"]), new objj_method(sel_getUid("mutableCopy"), function $CPSet__mutableCopy(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "copy");
}
},["id"])]);
}
var CPSetObjectsKey = "CPSetObjectsKey";
{
var the_class = objj_getClass("CPSet")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSet\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPSet__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "initWithArray:", objj_msgSend(aCoder, "decodeObjectForKey:", CPSetObjectsKey));
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPSet__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "allObjects"), CPSetObjectsKey);
}
},["void","CPCoder"])]);
}
{var the_class = objj_allocateClassPair(CPSet, "CPMutableSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}

