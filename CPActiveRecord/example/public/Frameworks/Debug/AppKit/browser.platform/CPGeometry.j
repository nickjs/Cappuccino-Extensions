i;12;CGGeometry.jc;5444;
CPMinXEdge = 0;
CPMinYEdge = 1;
CPMaxXEdge = 2;
CPMaxYEdge = 3;
CPMakePoint = CGPointMake;
CPMakeSize = CGSizeMake;
CPMakeRect = CGRectMake;
CPPointCreateCopy= function(aPoint)
{
    return { x: aPoint.x, y: aPoint.y };
}
CPPointMake= function(x, y)
{
    return { x: x, y: y };
}
CPRectInset= function(aRect, dX, dY)
{
    return CPRectMake( aRect.origin.x + dX, aRect.origin.y + dY,
                        aRect.size.width - 2 * dX, aRect.size.height - 2*dY);
}
CPRectIntegral= function(aRect)
{
    alert("CPRectIntegral unimplemented");
}
CPRectIntersection= function(lhsRect, rhsRect)
{
    var intersection = CPRectMake(
        Math.max(CPRectGetMinX(lhsRect), CPRectGetMinX(rhsRect)),
        Math.max(CPRectGetMinY(lhsRect), CPRectGetMinY(rhsRect)),
        0, 0);
    intersection.size.width = Math.min(CPRectGetMaxX(lhsRect), CPRectGetMaxX(rhsRect)) - CPRectGetMinX(intersection);
    intersection.size.height = Math.min(CPRectGetMaxY(lhsRect), CPRectGetMaxY(rhsRect)) - CPRectGetMinY(intersection);
    return CPRectIsEmpty(intersection) ? CPRectMakeZero() : intersection;
}
CPRectCreateCopy= function(aRect)
{
    return { origin: CPPointCreateCopy(aRect.origin), size: CPSizeCreateCopy(aRect.size) };
}
CPRectMake= function(x, y, width, height)
{
    return { origin: CPPointMake(x, y), size: CPSizeMake(width, height) };
}
CPRectOffset= function(aRect, dX, dY)
{
    return CPRectMake(aRect.origin.x + dX, aRect.origin.y + dY, aRect.size.width, aRect.size.height);
}
CPRectStandardize= function(aRect)
{
    var width = CPRectGetWidth(aRect),
        height = CPRectGetHeight(aRect),
        standardized = CPRectCreateCopy(aRect);
    if (width < 0.0)
    {
        standardized.origin.x += width;
        standardized.size.width = -width;
    }
    if (height < 0.0)
    {
        standardized.origin.y += height;
        standardized.size.height = -height;
    }
    return standardized;
}
CPRectUnion= function(lhsRect, rhsRect)
{
    var minX = Math.min(CPRectGetMinX(lhsRect), CPRectGetMinX(rhsRect)),
        minY = Math.min(CPRectGetMinY(lhsRect), CPRectGetMinY(rhsRect)),
        maxX = Math.max(CPRectGetMaxX(lhsRect), CPRectGetMaxX(rhsRect)),
        maxY = Math.max(CPRectGetMaxY(lhsRect), CPRectGetMaxY(rhsRect));
    return CPRectMake(minX, minY, maxX - minX, maxY - minY);
}
CPSizeCreateCopy= function(aSize)
{
    return { width: aSize.width, height: aSize.height };
}
CPSizeMake= function(width, height)
{
    return { width: width, height: height };
}
CPRectContainsPoint= function(aRect, aPoint)
{
    return aPoint.x >= CPRectGetMinX(aRect) &&
            aPoint.y >= CPRectGetMinY(aRect) &&
      aPoint.x < CPRectGetMaxX(aRect) &&
      aPoint.y < CPRectGetMaxY(aRect);
}
CPRectContainsRect= function(lhsRect, rhsRect)
{
    return CPRectEqualToRect(CPUnionRect(lhsRect, rhsRect), rhsRect);
}
CPPointEqualToPoint= function(lhsPoint, rhsPoint)
{
    return lhsPoint.x == rhsPoint.x && lhsPoint.y == rhsPoint.y;
}
CPRectEqualToRect= function(lhsRect, rhsRect)
{
    return CPPointEqualToPoint(lhsRect.origin, rhsRect.origin) &&
            CPSizeEqualToSize(lhsRect.size, rhsRect.size);
}
CPRectGetHeight= function(aRect)
{
    return aRect.size.height;
}
CPRectGetMaxX= function(aRect)
{
    return aRect.origin.x + aRect.size.width;
}
CPRectGetMaxY= function(aRect)
{
    return aRect.origin.y + aRect.size.height;
}
CPRectGetMidX= function(aRect)
{
    return aRect.origin.x + (aRect.size.width) / 2.0;
}
CPRectGetMidY= function(aRect)
{
    return aRect.origin.y + (aRect.size.height) / 2.0;
}
CPRectGetMinX= function(aRect)
{
    return aRect.origin.x;
}
CPRectGetMinY= function(aRect)
{
    return aRect.origin.y;
}
CPRectGetWidth= function(aRect)
{
    return aRect.size.width;
}
CPRectIntersectsRect= function(lhsRect, rhsRect)
{
    return !CPRectIsEmpty(CPRectIntersection(lhsRect, rhsRect));
}
CPRectIsEmpty= function(aRect)
{
    return aRect.size.width <= 0.0 || aRect.size.height <= 0.0;
}
CPRectIsNull= function(aRect)
{
    return aRect.size.width <= 0.0 || aRect.size.height <= 0.0;
}
CPSizeEqualToSize= function(lhsSize, rhsSize)
{
    return lhsSize.width == rhsSize.width && lhsSize.height == rhsSize.height;
}
CPStringFromPoint= function(aPoint)
{
    return "{" + aPoint.x + ", " + aPoint.y + "}";
}
CPStringFromSize= function(aSize)
{
    return "{" + aSize.width + ", " + aSize.height + "}";
}
CPStringFromRect= function(aRect)
{
    return "{" + CPStringFromPoint(aRect.origin) + ", " + CPStringFromSize(aRect.size) + "}";
}
CPPointFromString= function(aString)
{
    var comma = aString.indexOf(',');
    return { x:parseFloat(aString.substr(1, comma - 1), 10), y:parseFloat(aString.substring(comma + 1, aString.length), 10) };
}
CPSizeFromString= function(aString)
{
    var comma = aString.indexOf(',');
    return { width:parseFloat(aString.substr(1, comma - 1), 10), height:parseFloat(aString.substring(comma + 1, aString.length), 10) };
}
CPRectFromString= function(aString)
{
    var comma = aString.indexOf(',', aString.indexOf(',') + 1);
    return { origin:CPPointFromString(aString.substr(1, comma - 1)), size:CPSizeFromString(aString.substring(comma + 2, aString.length)) };
}
CPPointFromEvent= function(anEvent)
{
    return CPPointMake(anEvent.clientX, anEvent.clientY, 0);
}
CPSizeMakeZero= function()
{
    return CPSizeMake(0, 0);
}
CPRectMakeZero= function()
{
    return CPRectMake(0, 0, 0, 0);
}
CPPointMakeZero= function()
{
    return CPPointMake(0, 0, 0);
}

