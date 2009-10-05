c;1714;CPMakeRange= function(location, length)
{
    return { location: location, length: length };
}
CPCopyRange= function(aRange)
{
    return { location: aRange.location, length: aRange.length };
}
CPMakeRangeCopy= function(aRange)
{
    return { location:aRange.location, length:aRange.length };
}
CPEmptyRange= function(aRange)
{
    return aRange.length === 0;
}
CPMaxRange= function(aRange)
{
    return aRange.location + aRange.length;
}
CPEqualRanges= function(lhsRange, rhsRange)
{
    return ((lhsRange.location === rhsRange.location) && (lhsRange.length === rhsRange.length));
}
CPLocationInRange= function(aLocation, aRange)
{
    return (aLocation >= aRange.location) && (aLocation < CPMaxRange(aRange));
}
CPUnionRange= function(lhsRange, rhsRange)
{
    var location = MIN(lhsRange.location, rhsRange.location);
    return CPMakeRange(location, MAX(CPMaxRange(lhsRange), CPMaxRange(rhsRange)) - location);
}
CPIntersectionRange= function(lhsRange, rhsRange)
{
    if(CPMaxRange(lhsRange) < rhsRange.location || CPMaxRange(rhsRange) < lhsRange.location)
        return CPMakeRange(0, 0);
    var location = MAX(lhsRange.location, rhsRange.location);
    return CPMakeRange(location, MIN(CPMaxRange(lhsRange), CPMaxRange(rhsRange)) - location);
}
CPRangeInRange= function(lhsRange, rhsRange)
{
    return (lhsRange.location <= rhsRange.location && CPMaxRange(lhsRange) >= CPMaxRange(rhsRange));
}
CPStringFromRange= function(aRange)
{
    return "{" + aRange.location + ", " + aRange.length + "}";
}
CPRangeFromString= function(aString)
{
    var comma = aString.indexOf(',');
    return { location:parseInt(aString.substr(1, comma - 1)), length:parseInt(aString.substring(comma + 1, aString.length)) };
}

