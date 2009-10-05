i;10;CPObject.ji;9;CPRange.ji;14;CPEnumerator.ji;18;CPSortDescriptor.ji;13;CPException.jc;27017;
{var the_class = objj_allocateClassPair(CPEnumerator, "_CPArrayEnumerator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_array"), new objj_ivar("_index")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithArray:"), function $_CPArrayEnumerator__initWithArray_(self, _cmd, anArray)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPEnumerator") }, "init");
    if (self)
    {
        _array = anArray;
        _index = -1;
    }
    return self;
}
},["id","CPArray"]), new objj_method(sel_getUid("nextObject"), function $_CPArrayEnumerator__nextObject(self, _cmd)
{ with(self)
{
    if (++_index >= objj_msgSend(_array, "count"))
        return nil;
    return objj_msgSend(_array, "objectAtIndex:", _index);
}
},["id"])]);
}
{var the_class = objj_allocateClassPair(CPEnumerator, "_CPReverseArrayEnumerator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_array"), new objj_ivar("_index")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithArray:"), function $_CPReverseArrayEnumerator__initWithArray_(self, _cmd, anArray)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPEnumerator") }, "init");
    if (self)
    {
        _array = anArray;
        _index = objj_msgSend(_array, "count");
    }
    return self;
}
},["id","CPArray"]), new objj_method(sel_getUid("nextObject"), function $_CPReverseArrayEnumerator__nextObject(self, _cmd)
{ with(self)
{
    if (--_index < 0)
        return nil;
    return objj_msgSend(_array, "objectAtIndex:", _index);
}
},["id"])]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPArray"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPArray__init(self, _cmd)
{ with(self)
{
    return self;
}
},["id"]), new objj_method(sel_getUid("initWithArray:"), function $CPArray__initWithArray_(self, _cmd, anArray)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        objj_msgSend(self, "setArray:", anArray);
    return self;
}
},["id","CPArray"]), new objj_method(sel_getUid("initWithArray:copyItems:"), function $CPArray__initWithArray_copyItems_(self, _cmd, anArray, copyItems)
{ with(self)
{
    if (!copyItems)
        return objj_msgSend(self, "initWithArray:", anArray);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        var index = 0,
            count = objj_msgSend(anArray, "count");
        for(; index < count; ++i)
        {
            if (anArray[i].isa)
                self[i] = objj_msgSend(anArray, "copy");
            else
                self[i] = anArray;
        }
    }
    return self;
}
},["id","CPArray","BOOL"]), new objj_method(sel_getUid("initWithObjects:"), function $CPArray__initWithObjects_(self, _cmd, anArray)
{ with(self)
{
    var i = 2,
        argument;
    for(; i < arguments.length && (argument = arguments[i]) != nil; ++i)
        push(argument);
    return self;
}
},["id","Array"]), new objj_method(sel_getUid("initWithObjects:count:"), function $CPArray__initWithObjects_count_(self, _cmd, objects, aCount)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        var index = 0;
        for(; index < aCount; ++index)
            push(objects[index]);
    }
    return self;
}
},["id","id","unsigned"]), new objj_method(sel_getUid("containsObject:"), function $CPArray__containsObject_(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:", anObject) != CPNotFound;
}
},["BOOL","id"]), new objj_method(sel_getUid("count"), function $CPArray__count(self, _cmd)
{ with(self)
{
    return length;
}
},["int"]), new objj_method(sel_getUid("indexOfObject:"), function $CPArray__indexOfObject_(self, _cmd, anObject)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    var i = 0,
        count = length;
    if (anObject.isa)
    {
        for(; i < count; ++i)
            if(objj_msgSend(self[i], "isEqual:", anObject))
                return i;
    }
    else if (self.indexOf)
        return indexOf(anObject);
    else
        for(; i < count; ++i)
            if(self[i] == anObject)
                return i;
    return CPNotFound;
}
},["int","id"]), new objj_method(sel_getUid("indexOfObject:inRange:"), function $CPArray__indexOfObject_inRange_(self, _cmd, anObject, aRange)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    var i = aRange.location,
        count = MIN(CPMaxRange(aRange), length);
    if (anObject.isa)
    {
        for(; i < count; ++i)
            if(objj_msgSend(self[i], "isEqual:", anObject))
                return i;
    }
    else
        for(; i < count; ++i)
            if(self[i] == anObject)
                return i;
    return CPNotFound;
}
},["int","id","CPRange"]), new objj_method(sel_getUid("indexOfObjectIdenticalTo:"), function $CPArray__indexOfObjectIdenticalTo_(self, _cmd, anObject)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    if (self.indexOf)
        return indexOf(anObject);
    else
    {
        var index = 0,
            count = length;
        for(; index < count; ++index)
            if(self[index] == anObject)
                return index;
    }
    return CPNotFound;
}
},["int","id"]), new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"), function $CPArray__indexOfObjectIdenticalTo_inRange_(self, _cmd, anObject, aRange)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    if (self.indexOf)
    {
        var index = indexOf(anObject, aRange.location);
        if (CPLocationInRange(index, aRange))
            return index;
    }
    else
    {
        var index = aRange.location,
            count = MIN(CPMaxRange(aRange), length);
        for(; index < count; ++index)
            if(self[index] == anObject)
                return index;
    }
    return CPNotFound;
}
},["int","id","CPRange"]), new objj_method(sel_getUid("indexOfObject:sortedBySelector:"), function $CPArray__indexOfObject_sortedBySelector_(self, _cmd, anObject, aSelector)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:sortedByFunction:", anObject,  function(lhs, rhs) { objj_msgSend(lhs, aSelector, rhs); });
}
},["unsigned","id","SEL"]), new objj_method(sel_getUid("indexOfObject:sortedByFunction:"), function $CPArray__indexOfObject_sortedByFunction_(self, _cmd, anObject, aFunction)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:sortedByFunction:context:", anObject, aFunction, nil);
}
},["unsigned","id","Function"]), new objj_method(sel_getUid("indexOfObject:sortedByFunction:context:"), function $CPArray__indexOfObject_sortedByFunction_context_(self, _cmd, anObject, aFunction, aContext)
{ with(self)
{
    if (!aFunction || anObject === undefined)
        return CPNotFound;
    var mid, c, first = 0, last = length - 1;
    while (first <= last)
    {
        mid = FLOOR((first + last) / 2);
          c = aFunction(anObject, self[mid], aContext);
        if (c > 0)
            first = mid + 1;
        else if (c < 0)
            last = mid - 1;
        else
        {
            while (mid < length - 1 && aFunction(anObject, self[mid+1], aContext) == CPOrderedSame)
                mid++;
            return mid;
        }
    }
    return CPNotFound;
}
},["unsigned","id","Function","id"]), new objj_method(sel_getUid("indexOfObject:sortedByDescriptors:"), function $CPArray__indexOfObject_sortedByDescriptors_(self, _cmd, anObject, descriptors)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:sortedByFunction:", anObject, function(lhs, rhs)
    {
        var i = 0,
            count = objj_msgSend(descriptors, "count"),
            result = CPOrderedSame;
        while (i < count)
            if((result = objj_msgSend(descriptors[i++], "compareObject:withObject:", lhs, rhs)) != CPOrderedSame)
                return result;
        return result;
    });
}
},["unsigned","id","CPArray"]), new objj_method(sel_getUid("lastObject"), function $CPArray__lastObject(self, _cmd)
{ with(self)
{
    var count = objj_msgSend(self, "count");
    if (!count) return nil;
    return self[count - 1];
}
},["id"]), new objj_method(sel_getUid("objectAtIndex:"), function $CPArray__objectAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    if (anIndex >= length)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "index (" + anIndex + ") beyond bounds (" + length + ")");
    return self[anIndex];
}
},["id","int"]), new objj_method(sel_getUid("objectsAtIndexes:"), function $CPArray__objectsAtIndexes_(self, _cmd, indexes)
{ with(self)
{
    var index = objj_msgSend(indexes, "firstIndex"),
        objects = [];
    while(index != CPNotFound)
    {
        objj_msgSend(objects, "addObject:", self[index]);
        index = objj_msgSend(indexes, "indexGreaterThanIndex:", index);
    }
    return objects;
}
},["CPArray","CPIndexSet"]), new objj_method(sel_getUid("objectEnumerator"), function $CPArray__objectEnumerator(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPArrayEnumerator, "alloc"), "initWithArray:", self);
}
},["CPEnumerator"]), new objj_method(sel_getUid("reverseObjectEnumerator"), function $CPArray__reverseObjectEnumerator(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPReverseArrayEnumerator, "alloc"), "initWithArray:", self);
}
},["CPEnumerator"]), new objj_method(sel_getUid("makeObjectsPerformSelector:"), function $CPArray__makeObjectsPerformSelector_(self, _cmd, aSelector)
{ with(self)
{
    if (!aSelector)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "makeObjectsPerformSelector: 'aSelector' can't be nil");
    var index = 0,
        count = length;
    for(; index < count; ++index)
        objj_msgSend(self[index], aSelector);
}
},["void","SEL"]), new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"), function $CPArray__makeObjectsPerformSelector_withObject_(self, _cmd, aSelector, anObject)
{ with(self)
{
    if (!aSelector)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "makeObjectsPerformSelector:withObject 'aSelector' can't be nil");
    var index = 0,
        count = length;
    for(; index < count; ++index)
        objj_msgSend(self[index], aSelector, anObject);
}
},["void","SEL","id"]), new objj_method(sel_getUid("firstObjectCommonWithArray:"), function $CPArray__firstObjectCommonWithArray_(self, _cmd, anArray)
{ with(self)
{
    if (!objj_msgSend(anArray, "count") || !objj_msgSend(self, "count"))
        return nil;
    var i = 0,
        count = objj_msgSend(self, "count");
    for(; i < count; ++i)
        if(objj_msgSend(anArray, "containsObject:", self[i]))
            return self[i];
    return nil;
}
},["id","CPArray"]), new objj_method(sel_getUid("isEqualToArray:"), function $CPArray__isEqualToArray_(self, _cmd, anArray)
{ with(self)
{
    if (self === anArray)
        return YES;
    if(length != anArray.length)
        return NO;
    var index = 0,
        count = objj_msgSend(self, "count");
    for(; index < count; ++index)
    {
        var lhs = self[index],
            rhs = anArray[index];
        if (lhs !== rhs && (!lhs.isa || !rhs.isa || !objj_msgSend(lhs, "isEqual:", rhs)))
            return NO;
    }
    return YES;
}
},["BOOL","id"]), new objj_method(sel_getUid("isEqual:"), function $CPArray__isEqual_(self, _cmd, anObject)
{ with(self)
{
    if (self === anObject)
        return YES;
    if(!objj_msgSend(anObject, "isKindOfClass:", objj_msgSend(CPArray, "class")))
        return NO;
    return objj_msgSend(self, "isEqualToArray:", anObject);
}
},["BOOL","id"]), new objj_method(sel_getUid("arrayByAddingObject:"), function $CPArray__arrayByAddingObject_(self, _cmd, anObject)
{ with(self)
{
    if (anObject === nil || anObject === undefined)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "arrayByAddingObject: object can't be nil");
    var array = objj_msgSend(self, "copy");
    array.push(anObject);
    return array;
}
},["CPArray","id"]), new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"), function $CPArray__arrayByAddingObjectsFromArray_(self, _cmd, anArray)
{ with(self)
{
    return slice(0).concat(anArray);
}
},["CPArray","CPArray"]), new objj_method(sel_getUid("subarrayWithRange:"), function $CPArray__subarrayWithRange_(self, _cmd, aRange)
{ with(self)
{
    if (aRange.location < 0 || CPMaxRange(aRange) > length)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "subarrayWithRange: aRange out of bounds");
    return slice(aRange.location, CPMaxRange(aRange));
}
},["CPArray","CPRange"]), new objj_method(sel_getUid("sortedArrayUsingDescriptors:"), function $CPArray__sortedArrayUsingDescriptors_(self, _cmd, descriptors)
{ with(self)
{
    var sorted = objj_msgSend(self, "copy");
    objj_msgSend(sorted, "sortUsingDescriptors:", descriptors);
    return sorted;
}
},["CPArray","CPArray"]), new objj_method(sel_getUid("sortedArrayUsingFunction:"), function $CPArray__sortedArrayUsingFunction_(self, _cmd, aFunction)
{ with(self)
{
    return objj_msgSend(self, "sortedArrayUsingFunction:context:", aFunction, nil);
}
},["CPArray","Function"]), new objj_method(sel_getUid("sortedArrayUsingFunction:context:"), function $CPArray__sortedArrayUsingFunction_context_(self, _cmd, aFunction, aContext)
{ with(self)
{
    var sorted = objj_msgSend(self, "copy");
    objj_msgSend(sorted, "sortUsingFunction:context:", aFunction, aContext);
    return sorted;
}
},["CPArray","Function","id"]), new objj_method(sel_getUid("sortedArrayUsingSelector:"), function $CPArray__sortedArrayUsingSelector_(self, _cmd, aSelector)
{ with(self)
{
    var sorted = objj_msgSend(self, "copy")
    objj_msgSend(sorted, "sortUsingSelector:", aSelector);
    return sorted;
}
},["CPArray","SEL"]), new objj_method(sel_getUid("componentsJoinedByString:"), function $CPArray__componentsJoinedByString_(self, _cmd, aString)
{ with(self)
{
    return join(aString);
}
},["CPString","CPString"]), new objj_method(sel_getUid("description"), function $CPArray__description(self, _cmd)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(self, "count"),
        description = '(';
    for(; index < count; ++index)
    {
        var object = self[index];
        if (object && object.isa)
            description += objj_msgSend(object, "description");
        else
            description += object;
        if (index !== count - 1)
            description += ", ";
    }
    return description + ')';
}
},["CPString"]), new objj_method(sel_getUid("pathsMatchingExtensions:"), function $CPArray__pathsMatchingExtensions_(self, _cmd, filterTypes)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(self, "count"),
        array = [];
    for(; index < count; ++index)
        if (self[index].isa && objj_msgSend(self[index], "isKindOfClass:", objj_msgSend(CPString, "class")) && objj_msgSend(filterTypes, "containsObject:", objj_msgSend(self[index], "pathExtension")))
            array.push(self[index]);
    return array;
}
},["CPArray","CPArray"]), new objj_method(sel_getUid("setValue:forKey:"), function $CPArray__setValue_forKey_(self, _cmd, aValue, aKey)
{ with(self)
{
    var i = 0,
        count = objj_msgSend(self, "count");
    for(; i < count; ++i)
        objj_msgSend(self[i], "setValue:forKey:", aValue, aKey);
}
},["void","id","CPString"]), new objj_method(sel_getUid("valueForKey:"), function $CPArray__valueForKey_(self, _cmd, aKey)
{ with(self)
{
    var i = 0,
        count = objj_msgSend(self, "count"),
        array = [];
    for(; i < count; ++i)
        array.push(objj_msgSend(self[i], "valueForKey:", aKey));
    return array;
}
},["CPArray","CPString"]), new objj_method(sel_getUid("copy"), function $CPArray__copy(self, _cmd)
{ with(self)
{
    return slice(0);
}
},["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPArray__alloc(self, _cmd)
{ with(self)
{
    return [];
}
},["id"]), new objj_method(sel_getUid("array"), function $CPArray__array(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
},["id"]), new objj_method(sel_getUid("arrayWithArray:"), function $CPArray__arrayWithArray_(self, _cmd, anArray)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithArray:", anArray);
}
},["id","CPArray"]), new objj_method(sel_getUid("arrayWithObject:"), function $CPArray__arrayWithObject_(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:", anObject);
}
},["id","id"]), new objj_method(sel_getUid("arrayWithObjects:"), function $CPArray__arrayWithObjects_(self, _cmd, anObject)
{ with(self)
{
    var i = 2,
        array = objj_msgSend(objj_msgSend(self, "alloc"), "init"),
        argument;
    for(; i < arguments.length && (argument = arguments[i]) != nil; ++i)
        array.push(argument);
    return array;
}
},["id","id"]), new objj_method(sel_getUid("arrayWithObjects:count:"), function $CPArray__arrayWithObjects_count_(self, _cmd, objects, aCount)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:count:", objects, aCount);
}
},["id","id","unsigned"])]);
}
{
var the_class = objj_getClass("CPArray")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPArray\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCapacity:"), function $CPArray__initWithCapacity_(self, _cmd, aCapacity)
{ with(self)
{
    return self;
}
},["id","unsigned"]), new objj_method(sel_getUid("addObject:"), function $CPArray__addObject_(self, _cmd, anObject)
{ with(self)
{
    push(anObject);
}
},["void","id"]), new objj_method(sel_getUid("addObjectsFromArray:"), function $CPArray__addObjectsFromArray_(self, _cmd, anArray)
{ with(self)
{
    splice.apply(self, [length, 0].concat(anArray));
}
},["void","CPArray"]), new objj_method(sel_getUid("insertObject:atIndex:"), function $CPArray__insertObject_atIndex_(self, _cmd, anObject, anIndex)
{ with(self)
{
    splice(anIndex, 0, anObject);
}
},["void","id","int"]), new objj_method(sel_getUid("insertObjects:atIndexes:"), function $CPArray__insertObjects_atIndexes_(self, _cmd, objects, indexes)
{ with(self)
{
    var indexesCount = objj_msgSend(indexes, "count"),
        objectsCount = objj_msgSend(objects, "count");
    if(indexesCount !== objectsCount)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "the counts of the passed-in array (" + objectsCount + ") and index set (" + indexesCount + ") must be identical.");
    var lastIndex = objj_msgSend(indexes, "lastIndex");
    if(lastIndex >= objj_msgSend(self, "count") + indexesCount)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "the last index (" + lastIndex + ") must be less than the sum of the original count (" + objj_msgSend(self, "count") + ") and the insertion count (" + indexesCount + ").");
    var index = 0,
        currentIndex = objj_msgSend(indexes, "firstIndex");
    for (; index < objectsCount; ++index, currentIndex = objj_msgSend(indexes, "indexGreaterThanIndex:", currentIndex))
        objj_msgSend(self, "insertObject:atIndex:", objects[index], currentIndex);
}
},["void","CPArray","CPIndexSet"]), new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"), function $CPArray__replaceObjectAtIndex_withObject_(self, _cmd, anIndex, anObject)
{ with(self)
{
    self[anIndex] = anObject;
}
},["void","int","id"]), new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"), function $CPArray__replaceObjectsAtIndexes_withObjects_(self, _cmd, anIndexSet, objects)
{ with(self)
{
    var i = 0,
        index = objj_msgSend(anIndexSet, "firstIndex");
    while(index != CPNotFound)
    {
        objj_msgSend(self, "replaceObjectAtIndex:withObject:", index, objects[i++]);
        index = objj_msgSend(anIndexSet, "indexGreaterThanIndex:", index);
    }
}
},["void","CPIndexSet","CPArray"]), new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"), function $CPArray__replaceObjectsInRange_withObjectsFromArray_range_(self, _cmd, aRange, anArray, otherRange)
{ with(self)
{
    if (!otherRange.location && otherRange.length == objj_msgSend(anArray, "count"))
        objj_msgSend(self, "replaceObjectsInRange:withObjectsFromArray:", aRange, anArray);
    else
        splice.apply(self, [aRange.location, aRange.length].concat(objj_msgSend(anArray, "subarrayWithRange:", otherRange)));
}
},["void","CPRange","CPArray","CPRange"]), new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:"), function $CPArray__replaceObjectsInRange_withObjectsFromArray_(self, _cmd, aRange, anArray)
{ with(self)
{
    splice.apply(self, [aRange.location, aRange.length].concat(anArray));
}
},["void","CPRange","CPArray"]), new objj_method(sel_getUid("setArray:"), function $CPArray__setArray_(self, _cmd, anArray)
{ with(self)
{
    if(self == anArray) return;
    splice.apply(self, [0, length].concat(anArray));
}
},["void","CPArray"]), new objj_method(sel_getUid("removeAllObjects"), function $CPArray__removeAllObjects(self, _cmd)
{ with(self)
{
    splice(0, length);
}
},["void"]), new objj_method(sel_getUid("removeLastObject"), function $CPArray__removeLastObject(self, _cmd)
{ with(self)
{
    pop();
}
},["void"]), new objj_method(sel_getUid("removeObject:"), function $CPArray__removeObject_(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "removeObject:inRange:", anObject, CPMakeRange(0, length));
}
},["void","id"]), new objj_method(sel_getUid("removeObject:inRange:"), function $CPArray__removeObject_inRange_(self, _cmd, anObject, aRange)
{ with(self)
{
    var index;
    while ((index = objj_msgSend(self, "indexOfObject:inRange:", anObject, aRange)) != CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        aRange = CPIntersectionRange(CPMakeRange(index, length - index), aRange);
    }
}
},["void","id","CPRange"]), new objj_method(sel_getUid("removeObjectAtIndex:"), function $CPArray__removeObjectAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    splice(anIndex, 1);
}
},["void","int"]), new objj_method(sel_getUid("removeObjectsAtIndexes:"), function $CPArray__removeObjectsAtIndexes_(self, _cmd, anIndexSet)
{ with(self)
{
    var index = objj_msgSend(anIndexSet, "lastIndex");
    while (index != CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        index = objj_msgSend(anIndexSet, "indexLessThanIndex:", index);
    }
}
},["void","CPIndexSet"]), new objj_method(sel_getUid("removeObjectIdenticalTo:"), function $CPArray__removeObjectIdenticalTo_(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "removeObjectIdenticalTo:inRange:", anObject, CPMakeRange(0, length));
}
},["void","id"]), new objj_method(sel_getUid("removeObjectIdenticalTo:inRange:"), function $CPArray__removeObjectIdenticalTo_inRange_(self, _cmd, anObject, aRange)
{ with(self)
{
    var index;
    while ((index = objj_msgSend(self, "indexOfObjectIdenticalTo:inRange:", anObject, aRange)) != CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        aRange = CPIntersectionRange(CPMakeRange(index, length - index), aRange);
    }
}
},["void","id","CPRange"]), new objj_method(sel_getUid("removeObjectsInArray:"), function $CPArray__removeObjectsInArray_(self, _cmd, anArray)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(anArray, "count");
    for (; index < count; ++index)
        objj_msgSend(self, "removeObject:", anArray[index]);
}
},["void","CPArray"]), new objj_method(sel_getUid("removeObjectsInRange:"), function $CPArray__removeObjectsInRange_(self, _cmd, aRange)
{ with(self)
{
    splice(aRange.location, aRange.length);
}
},["void","CPRange"]), new objj_method(sel_getUid("exchangeObjectAtIndex:withObjectAtIndex:"), function $CPArray__exchangeObjectAtIndex_withObjectAtIndex_(self, _cmd, anIndex, otherIndex)
{ with(self)
{
    var temporary = self[anIndex];
    self[anIndex] = self[otherIndex];
    self[otherIndex] = temporary;
}
},["void","unsigned","unsigned"]), new objj_method(sel_getUid("sortUsingDescriptors:"), function $CPArray__sortUsingDescriptors_(self, _cmd, descriptors)
{ with(self)
{
    sort(function(lhs, rhs)
    {
        var i = 0,
            count = objj_msgSend(descriptors, "count"),
            result = CPOrderedSame;
        while(i < count)
            if((result = objj_msgSend(descriptors[i++], "compareObject:withObject:", lhs, rhs)) != CPOrderedSame)
                return result;
        return result;
    });
}
},["CPArray","CPArray"]), new objj_method(sel_getUid("sortUsingFunction:context:"), function $CPArray__sortUsingFunction_context_(self, _cmd, aFunction, aContext)
{ with(self)
{
    sort(function(lhs, rhs) { return aFunction(lhs, rhs, aContext); });
}
},["void","Function","id"]), new objj_method(sel_getUid("sortUsingSelector:"), function $CPArray__sortUsingSelector_(self, _cmd, aSelector)
{ with(self)
{
    sort(function(lhs, rhs) { return objj_msgSend(lhs, aSelector, rhs); });
}
},["void","SEL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("arrayWithCapacity:"), function $CPArray__arrayWithCapacity_(self, _cmd, aCapacity)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithCapacity:", aCapacity);
}
},["CPArray","unsigned"])]);
}
{
var the_class = objj_getClass("CPArray")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPArray\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPArray__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(aCoder, "decodeObjectForKey:", "CP.objects");
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPArray__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "_encodeArrayOfObjects:forKey:", self, "CP.objects");
}
},["void","CPCoder"])]);
}
{var the_class = objj_allocateClassPair(CPArray, "CPMutableArray"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}
Array.prototype.isa = CPArray;
objj_msgSend(CPArray, "initialize");

