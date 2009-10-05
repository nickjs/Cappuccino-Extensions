i;12;CGGeometry.ji;19;CGAffineTransform.jc;12124;
kCGPathElementMoveToPoint = 0;
kCGPathElementAddLineToPoint = 1;
kCGPathElementAddQuadCurveToPoint = 2;
kCGPathElementAddCurveToPoint = 3;
kCGPathElementCloseSubpath = 4;
kCGPathElementAddArc = 5;
kCGPathElementAddArcToPoint = 6;
CGPathCreateMutable= function()
{
    return { count:0, start:NULL, current:NULL, elements:[] };
}
CGPathCreateMutableCopy= function(aPath)
{
    var path = CGPathCreateMutable();
    CGPathAddPath(path, aPath);
    return path;
}
CGPathCreateCopy= function(aPath)
{
    return CGPathCreateMutableCopy(aPath);
}
CGPathRelease= function(aPath)
{
}
CGPathRetain= function(aPath)
{
    return aPath;
}
CGPathAddArc= function(aPath, aTransform, x, y, aRadius, aStartAngle, anEndAngle, isClockwise)
{
    if (aTransform && !(aTransform.a == 1 && aTransform.b == 0 && aTransform.c == 0 && aTransform.d == 1 && aTransform.tx == 0 && aTransform.ty == 0))
    {
        var center = { x:x, y:y },
            end = { x:COS(anEndAngle), y:SIN(anEndAngle) },
            start = { x:COS(aStartAngle), y:SIN(aStartAngle) };
        end = { x:end.x * aTransform.a + end.y * aTransform.c + aTransform.tx, y:end.x * aTransform.b + end.y * aTransform.d + aTransform.ty };
        start = { x:start.x * aTransform.a + start.y * aTransform.c + aTransform.tx, y:start.x * aTransform.b + start.y * aTransform.d + aTransform.ty };
        center = { x:center.x * aTransform.a + center.y * aTransform.c + aTransform.tx, y:center.x * aTransform.b + center.y * aTransform.d + aTransform.ty };
        x = center.x;
        y = center.y;
        var oldEndAngle = anEndAngle,
            oldStartAngle = aStartAngle;
        anEndAngle = ATAN2(end.y - aTransform.ty, end.x - aTransform.tx);
        aStartAngle = ATAN2(start.y - aTransform.ty, start.x - aTransform.tx);
        if (anEndAngle == aStartAngle && oldEndAngle != oldStartAngle)
            if (oldStartAngle > oldEndAngle)
                anEndAngle = anEndAngle - PI2;
            else
                aStartAngle = aStartAngle - PI2;
        aRadius = { width:aRadius, height:0 };
        aRadius = { width:aRadius.width * aTransform.a + aRadius.height * aTransform.c, height:aRadius.width * aTransform.b + aRadius.height * aTransform.d };
        aRadius = SQRT(aRadius.width * aRadius.width + aRadius.height * aRadius.height);
    }
    aPath.current = { x:x + aRadius * COS(anEndAngle), y:y + aRadius * SIN(anEndAngle) };
    aPath.elements[aPath.count++] = { type:kCGPathElementAddArc, x:x, y:y, radius:aRadius, startAngle:aStartAngle, endAngle:anEndAngle };
}
CGPathAddArcToPoint= function(aPath, aTransform, x1, y1, x2, y2, aRadius)
{
}
CGPathAddCurveToPoint= function(aPath, aTransform, cp1x, cp1y, cp2x, cp2y, x, y)
{
    var cp1 = { x:cp1x, y:cp1y },
        cp2 = { x:cp2x, y:cp2y },
        end = { x:x, y:y };
    if (aTransform)
    {
        cp1 = { x:cp1.x * aTransform.a + cp1.y * aTransform.c + aTransform.tx, y:cp1.x * aTransform.b + cp1.y * aTransform.d + aTransform.ty };
        cp2 = { x:cp2.x * aTransform.a + cp2.y * aTransform.c + aTransform.tx, y:cp2.x * aTransform.b + cp2.y * aTransform.d + aTransform.ty };
        end = { x:end.x * aTransform.a + end.y * aTransform.c + aTransform.tx, y:end.x * aTransform.b + end.y * aTransform.d + aTransform.ty };
    }
   aPath.current = end;
   aPath.elements[aPath.count++] = { type:kCGPathElementAddCurveToPoint, cp1x:cp1.x, cp1y:cp1.y, cp2x:cp2.x, cp2y:cp2.y, x:end.x, y:end.y };
}
CGPathAddLines= function(aPath, aTransform, points, count)
{
    var i = 1;
    if (arguments["count"] == NULL)
        var count = points.length;
    if (!aPath || count < 2)
        return;
    CGPathMoveToPoint(aPath, aTransform, points[0].x, points[0].y);
    for (; i < count; ++i)
        CGPathAddLineToPoint(aPath, aTransform, points[i].x, points[i].y);
}
CGPathAddLineToPoint= function(aPath, aTransform, x, y)
{
    var point = { x:x, y:y };
    if (aTransform != NULL)
        point = { x:point.x * aTransform.a + point.y * aTransform.c + aTransform.tx, y:point.x * aTransform.b + point.y * aTransform.d + aTransform.ty };
    aPath.elements[aPath.count++] = { type: kCGPathElementAddLineToPoint, x:point.x, y:point.y };
    aPath.current = point;
}
CGPathAddPath= function(aPath, aTransform, anotherPath)
{
    for (var i = 0, count = anotherPath.count; i < count; ++i)
    {
        var element = anotherPath.elements[i];
        switch (element.type)
        {
            case kCGPathElementAddLineToPoint: CGPathAddLineToPoint(aPath, aTransform, element.x, element.y);
                                                    break;
            case kCGPathElementAddCurveToPoint: CGPathAddCurveToPoint(aPath, aTransform,
                                                                          element.cp1x, element.cp1y,
                                                                          element.cp2x, element.cp2y,
                                                                          element.x, element.y);
                                                    break;
            case kCGPathElementAddArc: CGPathAddArc(aPath, aTransform, element.x, element.y,
                                                                 element.radius, element.startAngle,
                                                                 element.endAngle, element.isClockwise);
                                                    break;
            case kCGPathElementAddQuadCurveToPoint: CGPathAddQuadCurveToPoint(aPath, aTransform,
                                                                              element.cpx, element.cpy,
                                                                              element.x, element.y);
                                                    break;
            case kCGPathElementMoveToPoint: CGPathMoveToPoint(aPath, aTransform, element.x, element.y);
                                                    break;
            case kCGPathElementCloseSubpath: CGPathCloseSubpath(aPath);
                                                    break;
        }
    }
}
CGPathAddQuadCurveToPoint= function(aPath, aTransform, cpx, cpy, x, y)
{
    var cp = { x:cpx, y:cpy },
        end = { x:x, y:y };
    if (aTransform)
    {
        cp = { x:control.x * aTransform.a + control.y * aTransform.c + aTransform.tx, y:control.x * aTransform.b + control.y * aTransform.d + aTransform.ty };
        end = { x:end.x * aTransform.a + end.y * aTransform.c + aTransform.tx, y:end.x * aTransform.b + end.y * aTransform.d + aTransform.ty };
    }
    aPath.elements[aPath.count++] = { type:kCGPathElementAddQuadCurveToPoint, cpx:cp.x, cpy:cp.y, x:end.x, y:end.y }
    aPath.current = end;
}
CGPathAddRect= function(aPath, aTransform, aRect)
{
    CGPathAddRects(aPath, aTransform, [aRect], 1);
}
CGPathAddRects= function(aPath, aTransform, rects, count)
{
    var i = 0;
    if (arguments["count"] == NULL)
        var count = rects.length;
    for (; i < count; ++i)
    {
        var rect = rects[i];
        CGPathMoveToPoint(aPath, aTransform, (rect.origin.x), (rect.origin.y));
        CGPathAddLineToPoint(aPath, aTransform, (rect.origin.x + rect.size.width), (rect.origin.y));
        CGPathAddLineToPoint(aPath, aTransform, (rect.origin.x + rect.size.width), (rect.origin.y + rect.size.height));
        CGPathAddLineToPoint(aPath, aTransform, (rect.origin.x), (rect.origin.y + rect.size.height));
        CGPathCloseSubpath(aPath);
    }
}
CGPathMoveToPoint= function(aPath, aTransform, x, y)
{
    var point = { x:x, y:y },
        count = aPath.count;
    if (aTransform != NULL)
        point = { x:point.x * aTransform.a + point.y * aTransform.c + aTransform.tx, y:point.x * aTransform.b + point.y * aTransform.d + aTransform.ty };
    aPath.start = point;
    aPath.current = point;
    var previous = aPath.elements[count - 1];
    if (count != 0 && previous.type == kCGPathElementMoveToPoint)
    {
        previous.x = point.x;
        previous.y = point.y;
    }
    else
        aPath.elements[aPath.count++] = { type:kCGPathElementMoveToPoint, x:point.x, y:point.y };
}
var KAPPA = 4.0 * ((SQRT2 - 1.0) / 3.0);
CGPathWithEllipseInRect= function(aRect)
{
    var path = CGPathCreateMutable();
 if ((aRect.size.width) == (aRect.size.height))
        CGPathAddArc(path, nil, (aRect.origin.x + (aRect.size.width) / 2.0), (aRect.origin.y + (aRect.size.height) / 2.0), (aRect.size.width) / 2.0, 0.0, 2 * PI, YES);
 else
 {
     var axis = { width:(aRect.size.width) / 2.0, height:(aRect.size.height) / 2.0 },
         center = { x:(aRect.origin.x) + axis.width, y:(aRect.origin.y) + axis.height };
        CGPathMoveToPoint(path, nil, center.x, center.y - axis.height);
     CGPathAddCurveToPoint(path, nil, center.x + (KAPPA * axis.width), center.y - axis.height, center.x + axis.width, center.y - (KAPPA * axis.height), center.x + axis.width, center.y);
     CGPathAddCurveToPoint(path, nil, center.x + axis.width, center.y + (KAPPA * axis.height), center.x + (KAPPA * axis.width), center.y + axis.height, center.x, center.y + axis.height);
     CGPathAddCurveToPoint(path, nil, center.x - (KAPPA * axis.width), center.y + axis.height, center.x - axis.width, center.y + (KAPPA * axis.height), center.x - axis.width, center.y);
     CGPathAddCurveToPoint(path, nil, center.x - axis.width, center.y - (KAPPA * axis.height), center.x - (KAPPA * axis.width), center.y - axis.height, center.x, center.y - axis.height);
 }
    CGPathCloseSubpath(path);
    return path;
}
CGPathWithRoundedRectangleInRect= function(aRect, xRadius, yRadius , ne, se, sw, nw)
{
    var path = CGPathCreateMutable(),
        xMin = (aRect.origin.x),
        xMax = (aRect.origin.x + aRect.size.width),
        yMin = (aRect.origin.y),
        yMax = (aRect.origin.y + aRect.size.height);
    CGPathMoveToPoint(path, nil, xMin + xRadius, yMin);
 if (ne)
 {
  CGPathAddLineToPoint(path, nil, xMax - xRadius, yMin);
  CGPathAddCurveToPoint(path, nil, xMax - xRadius, yMin, xMax, yMin, xMax, yMin + xRadius);
 }
 else
  CGPathAddLineToPoint(path, nil, xMax, yMin);
 if (se)
 {
  CGPathAddLineToPoint(path, nil, xMax, yMax - xRadius);
  CGPathAddCurveToPoint(path, nil, xMax, yMax - xRadius, xMax, yMax, xMax - xRadius, yMax);
 }
 else
  CGPathAddLineToPoint(path, nil, xMax, yMax);
 if (sw)
 {
  CGPathAddLineToPoint(path, nil, xMin + xRadius, yMax);
  CGPathAddCurveToPoint(path, nil, xMin + xRadius, yMax, xMin, yMax, xMin, yMax - xRadius);
 }
 else
  CGPathAddLineToPoint(path, nil, xMin, yMax);
 if (nw)
 {
  CGPathAddLineToPoint(path, nil, xMin, yMin + xRadius);
  CGPathAddCurveToPoint(path, nil, xMin, yMin + xRadius, xMin, yMin, xMin + xRadius, yMin);
 } else
  CGPathAddLineToPoint(path, nil, xMin, yMin);
    CGPathCloseSubpath(path);
    return path;
}
CGPathCloseSubpath= function(aPath)
{
    var count = aPath.count;
    if (count == 0 || aPath.elements[count - 1].type == kCGPathElementCloseSubpath)
        return;
    aPath.elements[aPath.count++] = { type:kCGPathElementCloseSubpath, points:[aPath.start] };
}
CGPathEqualToPath= function(aPath, anotherPath)
{
    if (aPath == anotherPath)
        return YES;
    if (aPath.count != anotherPath.count || !(aPath.start.x == anotherPath.start.x && aPath.start.y == anotherPath.start.y) || !(aPath.current.x == anotherPath.current.x && aPath.current.y == anotherPath.current.y))
        return NO;
    var i = 0,
        count = aPath.count;
    for (; i < count; ++i)
    {
        var element = aPath[i],
            anotherElement = anotherPath[i];
        if (element.type != anotherElement.type)
            return NO;
        if ((element.type == kCGPathElementAddArc || element.type == kCGPathElementAddArcToPoint) &&
            element.radius != anotherElement.radius)
            return NO;
        var j = element.points.length;
        while (j--)
            if (!(element.points[j].x == anotherElement.points[j].x && element.points[j].y == anotherElement.points[j].y))
                return NO;
    }
    return YES;
}
CGPathGetCurrentPoint= function(aPath)
{
    return { x:aPath.current.x, y:aPath.current.y };
}
CGPathIsEmpty= function(aPath)
{
    return !aPath || aPath.count == 0;
}

