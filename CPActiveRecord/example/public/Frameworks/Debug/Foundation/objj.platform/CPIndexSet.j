i;9;CPRange.ji;10;CPObject.jc;20859;
{var the_class = objj_allocateClassPair(CPObject, "CPIndexSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_count"), new objj_ivar("_ranges")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPIndexSet__init(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithIndexesInRange:", { location:(0), length:0 });
}
},["id"]), new objj_method(sel_getUid("initWithIndex:"), function $CPIndexSet__initWithIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(self, "initWithIndexesInRange:", { location:(anIndex), length:1 });
}
},["id","CPInteger"]), new objj_method(sel_getUid("initWithIndexesInRange:"), function $CPIndexSet__initWithIndexesInRange_(self, _cmd, aRange)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _count = MAX(0, aRange.length);
        if (_count > 0)
            _ranges = [aRange];
        else
            _ranges = [];
    }
    return self;
}
},["id","CPRange"]), new objj_method(sel_getUid("initWithIndexSet:"), function $CPIndexSet__initWithIndexSet_(self, _cmd, anIndexSet)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _count = objj_msgSend(anIndexSet, "count");
        _ranges = [];
        var otherRanges = anIndexSet._ranges,
            otherRangesCount = otherRanges.length;
        while (otherRangesCount--)
            _ranges[otherRangesCount] = { location:(otherRanges[otherRangesCount]).location, length:(otherRanges[otherRangesCount]).length };
    }
    return self;
}
},["id","CPIndexSet"]), new objj_method(sel_getUid("isEqualToIndexSet:"), function $CPIndexSet__isEqualToIndexSet_(self, _cmd, anIndexSet)
{ with(self)
{
    if (!anIndexSet)
        return NO;
    if (self === anIndexSet)
       return YES;
    var rangesCount = _ranges.length,
        otherRanges = anIndexSet._ranges;
    if (rangesCount !== otherRanges.length || _count !== anIndexSet._count)
        return NO;
    while (rangesCount--)
        if (!CPEqualRanges(_ranges[rangesCount], otherRanges[rangesCount]))
            return NO;
    return YES;
}
},["BOOL","CPIndexSet"]), new objj_method(sel_getUid("containsIndex:"), function $CPIndexSet__containsIndex_(self, _cmd, anIndex)
{ with(self)
{
    return positionOfIndex(_ranges, anIndex) !== CPNotFound;
}
},["BOOL","CPInteger"]), new objj_method(sel_getUid("containsIndexesInRange:"), function $CPIndexSet__containsIndexesInRange_(self, _cmd, aRange)
{ with(self)
{
    if (aRange.length <= 0)
        return NO;
    if(_count < aRange.length)
        return NO;
    var rangeIndex = positionOfIndex(_ranges, aRange.location);
    if (rangeIndex === CPNotFound)
        return NO;
    var range = _ranges[rangeIndex];
    return CPIntersectionRange(range, aRange).length === aRange.length;
}
},["BOOL","CPRange"]), new objj_method(sel_getUid("containsIndexes:"), function $CPIndexSet__containsIndexes_(self, _cmd, anIndexSet)
{ with(self)
{
    var otherCount = anIndexSet._count;
    if(otherCount <= 0)
        return YES;
    if (_count < otherCount)
        return NO;
    var otherRanges = anIndexSet._ranges,
        otherRangesCount = otherRanges.length;
    while (otherRangesCount--)
        if (!objj_msgSend(self, "containsIndexesInRange:", otherRanges[otherRangesCount]))
            return NO;
    return YES;
}
},["BOOL","CPIndexSet"]), new objj_method(sel_getUid("intersectsIndexesInRange:"), function $CPIndexSet__intersectsIndexesInRange_(self, _cmd, aRange)
{ with(self)
{
    if (_count <= 0)
        return NO;
    var lhsRangeIndex = assumedPositionOfIndex(_ranges, aRange.location);
    if (FLOOR(lhsRangeIndex) === lhsRangeIndex)
        return YES;
    var rhsRangeIndex = assumedPositionOfIndex(_ranges, ((aRange).location + (aRange).length) - 1);
    if (FLOOR(rhsRangeIndex) === rhsRangeIndex)
        return YES;
    return lhsRangeIndex !== rhsRangeIndex;
}
},["BOOL","CPRange"]), new objj_method(sel_getUid("count"), function $CPIndexSet__count(self, _cmd)
{ with(self)
{
    return _count;
}
},["int"]), new objj_method(sel_getUid("firstIndex"), function $CPIndexSet__firstIndex(self, _cmd)
{ with(self)
{
    if (_count > 0)
        return _ranges[0].location;
    return CPNotFound;
}
},["CPInteger"]), new objj_method(sel_getUid("lastIndex"), function $CPIndexSet__lastIndex(self, _cmd)
{ with(self)
{
    if (_count > 0)
        return ((_ranges[_ranges.length - 1]).location + (_ranges[_ranges.length - 1]).length) - 1;
    return CPNotFound;
}
},["CPInteger"]), new objj_method(sel_getUid("indexGreaterThanIndex:"), function $CPIndexSet__indexGreaterThanIndex_(self, _cmd, anIndex)
{ with(self)
{
    ++anIndex;
    var rangeIndex = assumedPositionOfIndex(_ranges, anIndex);
    if (rangeIndex === CPNotFound)
        return CPNotFound;
    rangeIndex = CEIL(rangeIndex);
    if (rangeIndex >= _ranges.length)
        return CPNotFound;
    var range = _ranges[rangeIndex];
    if (CPLocationInRange(anIndex, range))
        return anIndex;
    return range.location;
}
},["CPInteger","CPInteger"]), new objj_method(sel_getUid("indexLessThanIndex:"), function $CPIndexSet__indexLessThanIndex_(self, _cmd, anIndex)
{ with(self)
{
    --anIndex;
    var rangeIndex = assumedPositionOfIndex(_ranges, anIndex);
    if (rangeIndex === CPNotFound)
        return CPNotFound;
    rangeIndex = FLOOR(rangeIndex);
    if (rangeIndex < 0)
        return CPNotFound;
    var range = _ranges[rangeIndex];
    if (CPLocationInRange(anIndex, range))
        return anIndex;
    return ((range).location + (range).length) - 1;
}
},["CPInteger","CPInteger"]), new objj_method(sel_getUid("indexGreaterThanOrEqualToIndex:"), function $CPIndexSet__indexGreaterThanOrEqualToIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(self, "indexGreaterThanIndex:", anIndex - 1);
}
},["CPInteger","CPInteger"]), new objj_method(sel_getUid("indexLessThanOrEqualToIndex:"), function $CPIndexSet__indexLessThanOrEqualToIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(self, "indexLessThanIndex:", anIndex + 1);
}
},["CPInteger","CPInteger"]), new objj_method(sel_getUid("getIndexes:maxCount:inIndexRange:"), function $CPIndexSet__getIndexes_maxCount_inIndexRange_(self, _cmd, anArray, aMaxCount, aRange)
{ with(self)
{
    if (!_count || aMaxCount === 0 || aRange && !aRange.length)
    {
        if (aRange)
            aRange.length = 0;
        return 0;
    }
    var total = 0;
    if (aRange)
    {
        var firstIndex = aRange.location,
            lastIndex = ((aRange).location + (aRange).length) - 1,
            rangeIndex = CEIL(assumedPositionOfIndex(_ranges, firstIndex)),
            lastRangeIndex = FLOOR(assumedPositionOfIndex(_ranges, lastIndex));
    }
    else
    {
        var firstIndex = objj_msgSend(self, "firstIndex"),
            lastIndex = objj_msgSend(self, "lastIndex"),
            rangeIndex = 0,
            lastRangeIndex = _ranges.length - 1;
    }
    while (rangeIndex <= lastRangeIndex)
    {
        var range = _ranges[rangeIndex],
            index = MAX(firstIndex, range.location),
            maxRange = MIN(lastIndex + 1, ((range).location + (range).length));
        for (; index < maxRange; ++index)
        {
            anArray[total++] = index;
            if (total === aMaxCount)
            {
                if (aRange)
                {
                    aRange.location = index + 1;
                    aRange.length = lastIndex + 1 - index - 1;
                }
                return aMaxCount;
            }
        }
        ++rangeIndex;
    }
    if (aRange)
    {
        aRange.location = CPNotFound;
        aRange.length = 0;
    }
    return total;
}
},["CPInteger","CPArray","CPInteger","CPRange"]), new objj_method(sel_getUid("description"), function $CPIndexSet__description(self, _cmd)
{ with(self)
{
    var description = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "description");
    if (_count)
    {
        var index = 0,
            count = _ranges.length;
        description += "[number of indexes: " + _count + " (in " + count;
        if (count === 1)
            description += " range), indexes: (";
        else
            description += " ranges), indexes: (";
        for (; index < count; ++index)
        {
            var range = _ranges[index];
            description += range.location;
            if (range.length > 1)
                description += "-" + (CPMaxRange(range) - 1);
            if (index + 1 < count)
                description += " ";
        }
        description += ")]";
    }
    else
        description += "(no indexes)";
    return description;
}
},["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("indexSet"), function $CPIndexSet__indexSet(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
},["id"]), new objj_method(sel_getUid("indexSetWithIndex:"), function $CPIndexSet__indexSetWithIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithIndex:", anIndex);
}
},["id","int"]), new objj_method(sel_getUid("indexSetWithIndexesInRange:"), function $CPIndexSet__indexSetWithIndexesInRange_(self, _cmd, aRange)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithIndexesInRange:", aRange);
}
},["id","CPRange"])]);
}
{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPIndexSet\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("addIndex:"), function $CPIndexSet__addIndex_(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(self, "addIndexesInRange:", { location:(anIndex), length:1 });
}
},["void","CPInteger"]), new objj_method(sel_getUid("addIndexes:"), function $CPIndexSet__addIndexes_(self, _cmd, anIndexSet)
{ with(self)
{
    var otherRanges = anIndexSet._ranges,
        otherRangesCount = otherRanges.length;
    while (otherRangesCount--)
        objj_msgSend(self, "addIndexesInRange:", otherRanges[otherRangesCount]);
}
},["void","CPIndexSet"]), new objj_method(sel_getUid("addIndexesInRange:"), function $CPIndexSet__addIndexesInRange_(self, _cmd, aRange)
{ with(self)
{
    if (aRange.length <= 0)
        return;
    if (_count <= 0)
    {
        _count = aRange.length;
        _ranges = [aRange];
        return;
    }
    var rangeCount = _ranges.length,
        lhsRangeIndex = assumedPositionOfIndex(_ranges, aRange.location - 1),
        lhsRangeIndexCEIL = CEIL(lhsRangeIndex);
    if (lhsRangeIndexCEIL === lhsRangeIndex && lhsRangeIndexCEIL < rangeCount)
        aRange = CPUnionRange(aRange, _ranges[lhsRangeIndexCEIL]);
    var rhsRangeIndex = assumedPositionOfIndex(_ranges, CPMaxRange(aRange)),
        rhsRangeIndexFLOOR = FLOOR(rhsRangeIndex);
    if (rhsRangeIndexFLOOR === rhsRangeIndex && rhsRangeIndexFLOOR >= 0)
        aRange = CPUnionRange(aRange, _ranges[rhsRangeIndexFLOOR]);
    var removalCount = rhsRangeIndexFLOOR - lhsRangeIndexCEIL + 1;
    if (removalCount === _ranges.length)
    {
        _ranges = [aRange];
        _count = aRange.length;
    }
    else if (removalCount === 1)
    {
        if (lhsRangeIndexCEIL < _ranges.length)
            _count -= _ranges[lhsRangeIndexCEIL].length;
        _count += aRange.length;
        _ranges[lhsRangeIndexCEIL] = aRange;
    }
    else
    {
        if (removalCount > 0)
        {
            var removal = lhsRangeIndexCEIL,
                lastRemoval = lhsRangeIndexCEIL + removalCount - 1;
            for (; removal <= lastRemoval; ++removal)
                _count -= _ranges[removal].length;
            objj_msgSend(_ranges, "removeObjectsInRange:", { location:(lhsRangeIndexCEIL), length:removalCount });
        }
        objj_msgSend(_ranges, "insertObject:atIndex:", aRange, lhsRangeIndexCEIL);
        _count += aRange.length;
    }
}
},["void","CPRange"]), new objj_method(sel_getUid("removeIndex:"), function $CPIndexSet__removeIndex_(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(self, "removeIndexesInRange:", { location:(anIndex), length:1 });
}
},["void","CPInteger"]), new objj_method(sel_getUid("removeIndexes:"), function $CPIndexSet__removeIndexes_(self, _cmd, anIndexSet)
{ with(self)
{
    var otherRanges = anIndexSet._ranges,
        otherRangesCount = otherRanges.length;
    while (otherRangesCount--)
        objj_msgSend(self, "removeIndexesInRange:", otherRanges[otherRangesCount]);
}
},["void","CPIndexSet"]), new objj_method(sel_getUid("removeAllIndexes"), function $CPIndexSet__removeAllIndexes(self, _cmd)
{ with(self)
{
    _ranges = [];
    _count = 0;
}
},["void"]), new objj_method(sel_getUid("removeIndexesInRange:"), function $CPIndexSet__removeIndexesInRange_(self, _cmd, aRange)
{ with(self)
{
    if (aRange.length <= 0)
        return;
    if (_count <= 0)
        return;
    var rangeCount = _ranges.length,
        lhsRangeIndex = assumedPositionOfIndex(_ranges, aRange.location),
        lhsRangeIndexCEIL = CEIL(lhsRangeIndex);
    if (lhsRangeIndex === lhsRangeIndexCEIL && lhsRangeIndexCEIL < rangeCount)
    {
        var existingRange = _ranges[lhsRangeIndexCEIL];
        if (aRange.location !== existingRange.location)
        {
            var maxRange = CPMaxRange(aRange),
                existingMaxRange = CPMaxRange(existingRange);
            existingRange.length = aRange.location - existingRange.location;
            if (maxRange < existingMaxRange)
            {
                _count -= aRange.length;
                objj_msgSend(_ranges, "insertObject:atIndex:", { location:(maxRange), length:existingMaxRange - maxRange }, lhsRangeIndexCEIL + 1);
                return;
            }
            else
            {
                _count -= existingMaxRange - aRange.location;
                lhsRangeIndexCEIL += 1;
            }
        }
    }
    var rhsRangeIndex = assumedPositionOfIndex(_ranges, CPMaxRange(aRange) - 1),
        rhsRangeIndexFLOOR = FLOOR(rhsRangeIndex);
    if (rhsRangeIndex === rhsRangeIndexFLOOR && rhsRangeIndexFLOOR >= 0)
    {
        var maxRange = CPMaxRange(aRange),
            existingRange = _ranges[rhsRangeIndexFLOOR],
            existingMaxRange = CPMaxRange(existingRange);
        if (maxRange !== existingMaxRange)
        {
            _count -= maxRange - existingRange.location;
            rhsRangeIndexFLOOR -= 1;
            existingRange.location = maxRange;
            existingRange.length = existingMaxRange - maxRange;
        }
    }
    var removalCount = rhsRangeIndexFLOOR - lhsRangeIndexCEIL + 1;
    if (removalCount > 0)
    {
        var removal = lhsRangeIndexCEIL,
            lastRemoval = lhsRangeIndexCEIL + removalCount - 1;
        for (; removal <= lastRemoval; ++removal)
            _count -= _ranges[removal].length;
        objj_msgSend(_ranges, "removeObjectsInRange:", { location:(lhsRangeIndexCEIL), length:removalCount });
    }
}
},["void","CPRange"]), new objj_method(sel_getUid("shiftIndexesStartingAtIndex:by:"), function $CPIndexSet__shiftIndexesStartingAtIndex_by_(self, _cmd, anIndex, aDelta)
{ with(self)
{
    if (!_count || aDelta == 0)
       return;
    var i = _ranges.length - 1,
        shifted = CPMakeRange(CPNotFound, 0);
    for(; i >= 0; --i)
    {
        var range = _ranges[i],
            maximum = CPMaxRange(range);
        if (anIndex > maximum)
            break;
        if (anIndex > range.location && anIndex < maximum)
        {
            shifted = CPMakeRange(anIndex + aDelta, maximum - anIndex);
            range.length = anIndex - range.location;
            if (aDelta > 0)
                objj_msgSend(_ranges, "insertObject:atIndex:", shifted, i + 1);
            else if (shifted.location < 0)
            {
                shifted.length = CPMaxRange(shifted);
                shifted.location = 0;
            }
            break;
        }
        if ((range.location += aDelta) < 0)
        {
            range.length = CPMaxRange(range);
            range.location = 0;
        }
    }
    if (aDelta < 0)
    {
        var j = i + 1,
            count = _ranges.length,
            shifts = [];
        for (; j < count; ++j)
            objj_msgSend(shifts, "addObject:", _ranges[j]);
        if ((j = i + 1) < count)
        {
            objj_msgSend(_ranges, "removeObjectsInRange:", CPMakeRange(j, count - j));
            for (j = 0, count = shifts.length; j < count; ++j)
                objj_msgSend(self, "addIndexesInRange:", shifts[j]);
        }
        if (shifted.location != CPNotFound)
            objj_msgSend(self, "addIndexesInRange:", shifted);
    }
}
},["void","CPInteger","int"])]);
}
var CPIndexSetCountKey = "CPIndexSetCountKey",
    CPIndexSetRangeStringsKey = "CPIndexSetRangeStringsKey";
{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPIndexSet\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPIndexSet__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _count = objj_msgSend(aCoder, "decodeIntForKey:", CPIndexSetCountKey);
        _ranges = [];
        var rangeStrings = objj_msgSend(aCoder, "decodeObjectForKey:", CPIndexSetRangeStringsKey),
            index = 0,
            count = rangeStrings.length;
        for (; index < count; ++index)
            _ranges.push(CPRangeFromString(rangeStrings[index]));
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPIndexSet__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeInt:forKey:", _count, CPIndexSetCountKey);
    var index = 0,
        count = _ranges.length,
        rangeStrings = [];
    for (; index < count; ++index)
        rangeStrings[index] = CPStringFromRange(_ranges[index]);
    objj_msgSend(aCoder, "encodeObject:forKey:", rangeStrings, CPIndexSetRangeStringsKey);
}
},["void","CPCoder"])]);
}
{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPIndexSet\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPIndexSet__copy(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithIndexSet:", self);
}
},["id"]), new objj_method(sel_getUid("mutableCopy"), function $CPIndexSet__mutableCopy(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithIndexSet:", self);
}
},["id"])]);
}
{var the_class = objj_allocateClassPair(CPIndexSet, "CPMutableIndexSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}
var positionOfIndex = function(ranges, anIndex)
{
    var low = 0,
        high = ranges.length - 1;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            range = ranges[middle];
        if (anIndex < range.location)
            high = middle - 1;
        else if (anIndex >= CPMaxRange(range))
            low = middle + 1;
        else
            return middle;
   }
   return CPNotFound;
}
var assumedPositionOfIndex = function(ranges, anIndex)
{
    var count = ranges.length;
    if (count <= 0)
        return CPNotFound;
    var low = 0,
        high = count * 2;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            position = middle / 2,
            positionFLOOR = FLOOR(position);
        if (position === positionFLOOR)
        {
            if (positionFLOOR - 1 >= 0 && anIndex < CPMaxRange(ranges[positionFLOOR - 1]))
                high = middle - 1;
            else if (positionFLOOR < count && anIndex >= ranges[positionFLOOR].location)
                low = middle + 1;
            else
                return positionFLOOR - 0.5;
        }
        else
        {
            var range = ranges[positionFLOOR];
            if (anIndex < range.location)
                high = middle - 1;
            else if (anIndex >= CPMaxRange(range))
                low = middle + 1;
            else
                return positionFLOOR;
        }
    }
   return CPNotFound;
}

