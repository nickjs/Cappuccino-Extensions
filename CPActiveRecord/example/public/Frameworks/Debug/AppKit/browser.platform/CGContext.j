i;12;CGGeometry.ji;19;CGAffineTransform.ji;8;CGPath.jc;31400;
kCGLineCapButt = 0;
kCGLineCapRound = 1;
kCGLineCapSquare = 2;
kCGLineJoinMiter = 0;
kCGLineJoinRound = 1;
kCGLineJoinBevel = 2;
kCGPathFill = 0;
kCGPathEOFill = 1;
kCGPathStroke = 2;
kCGPathFillStroke = 3;
kCGPathEOFillStroke = 4;
kCGBlendModeNormal = 0;
kCGBlendModeMultiply = 1;
kCGBlendModeScreen = 2;
kCGBlendModeOverlay = 3;
kCGBlendModeDarken = 4;
kCGBlendModeLighten = 5;
kCGBlendModeColorDodge = 6;
kCGBlendModeColorBurn = 7;
kCGBlendModeSoftLight = 8;
kCGBlendModeHardLight = 9;
kCGBlendModeDifference = 10;
kCGBlendModeExclusion = 11;
kCGBlendModeHue = 12;
kCGBlendModeSaturation = 13;
kCGBlendModeColor = 14;
kCGBlendModeLuminosity = 15;
kCGBlendModeClear = 16;
kCGBlendModeCopy = 17;
kCGBlendModeSourceIn = 18;
kCGBlendModeSourceOut = 19;
kCGBlendModeSourceAtop = 20;
kCGBlendModeDestinationOver = 21;
kCGBlendModeDestinationIn = 22;
kCGBlendModeDestinationOut = 23;
kCGBlendModeDestinationAtop = 24;
kCGBlendModeXOR = 25;
kCGBlendModePlusDarker = 26;
kCGBlendModePlusLighter = 27;
CGContextRelease= function()
{
}
CGContextRetain= function(aContext)
{
    return aContext;
}
if (!CPFeatureIsCompatible(CPHTMLCanvasFeature))
{
CGGStateCreate= function()
{
    return { alpha:1.0, strokeStyle:"#000", fillStyle:"#ccc", lineWidth:1.0, lineJoin:kCGLineJoinMiter, lineCap:kCGLineCapButt, miterLimit:10.0, globalAlpha:1.0,
        blendMode:kCGBlendModeNormal,
        shadowOffset:{ width:0.0, height:0.0 }, shadowBlur:0.0, shadowColor:NULL, CTM:{ a:1.0, b:0.0, c:0.0, d:1.0, tx:0.0, ty:0.0 } };
}
CGGStateCreateCopy= function(aGState)
{
    return { alpha:aGState.alpha, strokeStyle:aGState.strokeStyle, fillStyle:aGState.fillStyle, lineWidth:aGState.lineWidth,
        lineJoin:aGState.lineJoin, lineCap:aGState.lineCap, miterLimit:aGState.miterLimit, globalAlpha:aGState.globalAlpha,
        blendMode:aGState.blendMode,
        shadowOffset:aGState.shadowOffset, shadowBlur:aGState.shadowBlur, shadowColor:aGState.shadowColor, CTM:{ a:aGState.CTM.a, b:aGState.CTM.b, c:aGState.CTM.c, d:aGState.CTM.d, tx:aGState.CTM.tx, ty:aGState.CTM.ty } };
}
CGBitmapGraphicsContextCreate= function()
{
    return { DOMElement:document.createElement("div"), path:NULL, gState:CGGStateCreate(), gStateStack:[] };
}
CGContextSaveGState= function(aContext)
{
    aContext.gStateStack.push(CGGStateCreateCopy(aContext.gState));
}
CGContextRestoreGState= function(aContext)
{
    aContext.gState = aContext.gStateStack.pop();
}
CGContextSetLineCap= function(aContext, aLineCap)
{
    aContext.gState.lineCap = aLineCap;
}
CGContextSetLineJoin= function(aContext, aLineJoin)
{
    aContext.gState.lineJoin = aLineJoin;
}
CGContextSetLineWidth= function(aContext, aLineWidth)
{
    aContext.gState.lineWidth = aLineWidth;
}
CGContextSetMiterLimit= function(aContext, aMiterLimit)
{
    aContext.gState.miterLimit = aMiterLimit;
}
CGContextSetBlendMode= function(aContext, aBlendMode)
{
    aContext.gState.blendMode = aBlendMode;
}
CGContextAddArc= function(aContext, x, y, radius, startAngle, endAngle, clockwise)
{
    CGPathAddArc(aContext.path, aContext.gState.CTM, x, y, radius, startAngle, endAngle, clockwise);
}
CGContextAddArcToPoint= function(aContext, x1, y1, x2, y2, radius)
{
    CGPathAddArcToPoint(aContext.path, aContext.gState.CTM, x1, y1, x2, y2, radius);
}
CGContextAddCurveToPoint= function(aContext, cp1x, cp1y, cp2x, cp2y, x, y)
{
    CGPathAddCurveToPoint(aContext.path, aContext.gState.CTM, cp1x, cp1y, cp2x, cp2y, x, y);
}
CGContextAddLines= function(aContext, points, count)
{
    CGPathAddLines(aContext.path, aContext.gState.CTM, points, count);
}
CGContextAddLineToPoint= function(aContext, x, y)
{
    CGPathAddLineToPoint(aContext.path, aContext.gState.CTM, x, y);
}
CGContextAddPath= function(aContext, aPath)
{
    if (!aContext || CGPathIsEmpty(aPath))
        return;
    if (!aContext.path)
        aContext.path = CGPathCreateMutable();
    CGPathAddPath(aContext.path, aContext.gState.CTM, aPath);
}
CGContextAddQuadCurveToPoint= function(aContext, cpx, cpy, x, y)
{
    CGPathAddQuadCurveToPoint(aContext.path, aContext.gState.CTM, cpx, cpy, x, y);
}
CGContextAddRect= function(aContext, aRect)
{
    CGPathAddRect(aContext.path, aContext.gState.CTM, aRect);
}
CGContextAddRects= function(aContext, rects, count)
{
    CGPathAddRects(aContext.path, aContext.gState.CTM, rects, count);
}
CGContextBeginPath= function(aContext)
{
    aContext.path = CGPathCreateMutable();
}
CGContextClosePath= function(aContext)
{
    CGPathCloseSubpath(aContext.path);
}
CGContextMoveToPoint= function(aContext, x, y)
{
    if (!aContext.path)
        aContext.path = CGPathCreateMutable();
    CGPathMoveToPoint(aContext.path, aContext.gState.CTM, x, y);
}
CGContextFillRect= function(aContext, aRect)
{
    CGContextFillRects(aContext, [aRect], 1);
}
CGContextFillRects= function(aContext, rects, count)
{
    if (arguments[2] === undefined)
        var count = rects.length;
    CGContextBeginPath(aContext);
    CGContextAddRects(aContext, rects, count);
    CGContextClosePath(aContext);
    CGContextDrawPath(aContext, kCGPathFill);
}
CGContextStrokeRect= function(aContext, aRect)
{
    CGContextBeginPath(aContext);
    CGContextAddRect(aContext, aRect);
    CGContextClosePath(aContext);
    CGContextDrawPath(aContext, kCGPathStroke);
}
CGContextStrokeRectWithWidth= function(aContext, aRect, aWidth)
{
    CGContextSaveGState(aContext);
    CGContextSetLineWidth(aContext, aWidth);
    CGContextStrokeRect(aContext, aRect);
    CGContextRestoreGState(aContext);
}
CGContextConcatCTM= function(aContext, aTransform)
{
    var CTM = aContext.gState.CTM;
    var tx = CTM.tx * aTransform.a + CTM.ty * aTransform.c + aTransform.tx;CTM.ty = CTM.tx * aTransform.b + CTM.ty * aTransform.d + aTransform.ty;CTM.tx = tx;var a = CTM.a * aTransform.a + CTM.b * aTransform.c, b = CTM.a * aTransform.b + CTM.b * aTransform.d, c = CTM.c * aTransform.a + CTM.d * aTransform.c;CTM.d = CTM.c * aTransform.b + CTM.d * aTransform.d;CTM.a = a;CTM.b = b;CTM.c = c;;
}
CGContextGetCTM= function(aContext)
{
    return aContext.gState.CTM;
}
CGContextRotateCTM= function(aContext, anAngle)
{
    var gState = aContext.gState;
    gState.CTM = CGAffineTransformRotate(gState.CTM, anAngle);
}
CGContextScaleCTM= function(aContext, sx, sy)
{
    var gState = aContext.gState;
    gState.CTM = { a:gState.CTM.a * sx, b:gState.CTM.b * sx, c:gState.CTM.c * sy, d:gState.CTM.d * sy, tx:gState.CTM.tx, ty:gState.CTM.ty };
}
CGContextTranslateCTM= function(aContext, tx, ty)
{
    var gState = aContext.gState;
    gState.CTM = { a:gState.CTM.a, b:gState.CTM.b, c:gState.CTM.c, d:gState.CTM.d, tx:gState.CTM.tx + gState.CTM.a * tx + gState.CTM.c * ty, ty:gState.CTM.ty + gState.CTM.b * tx + gState.CTM.d * ty };
}
CGContextSetShadow= function(aContext, aSize, aBlur)
{
    var gState = aContext.gState;
    gState.shadowOffset = { width:aSize.width, height:aSize.height };
    gState.shadowBlur = aBlur;
    gState.shadowColor = objj_msgSend(CPColor, "shadowColor");
}
CGContextSetShadowWithColor= function(aContext, aSize, aBlur, aColor)
{
    var gState = aContext.gState;
    gState.shadowOffset = { width:aSize.width, height:aSize.height };
    gState.shadowBlur = aBlur;
    gState.shadowColor = aColor;
}
CGContextSetAlpha= function(aContext, anAlpha)
{
    aContext.gState.alpha = MAX(MIN(anAlpha, 1.0), 0.0);
}
}
CGContextEOFillPath= function(aContext)
{
    CGContextDrawPath(aContext, kCGPathEOFill);
}
CGContextFillPath= function(aContext)
{
    CGContextDrawPath(aContext, kCGPathFill);
}
var KAPPA = 4.0 * ((SQRT2 - 1.0) / 3.0);
CGContextAddEllipseInRect= function(aContext, aRect)
{
    CGContextBeginPath(aContext);
    CGContextAddPath(aContext, CGPathWithEllipseInRect(aRect));
    CGContextClosePath(aContext);
}
CGContextFillEllipseInRect= function(aContext, aRect)
{
    CGContextBeginPath(aContext);
    CGContextAddEllipseInRect(aContext, aRect);
    CGContextClosePath(aContext);
    CGContextFillPath(aContext);
}
CGContextStrokeEllipseInRect= function(aContext, aRect)
{
    CGContextBeginPath(aContext);
    CGContextAddEllipseInRect(aContext, aRect);
    CGContextClosePath(aContext);
    CGContextStrokePath(aContext);
}
CGContextStrokePath= function(aContext)
{
    CGContextDrawPath(aContext, kCGPathStroke);
}
CGContextStrokeLineSegments= function(aContext, points, count)
{
    var i = 0;
    if (arguments["count"] == NULL)
        var count = points.length;
    CGContextBeginPath(aContext);
    for (; i < count; i += 2)
    {
        CGContextMoveToPoint(aContext, points[i].x, points[i].y);
        CGContextAddLineToPoint(aContext, points[i + 1].x, points[i + 1].y);
    }
    CGContextStrokePath(aContext);
}
CGContextSetFillColor= function(aContext, aColor)
{
    if (aColor)
        aContext.gState.fillStyle = objj_msgSend(aColor, "cssString");
}
CGContextSetStrokeColor= function(aContext, aColor)
{
    if (aColor)
        aContext.gState.strokeStyle = objj_msgSend(aColor, "cssString");
}
CGContextFillRoundedRectangleInRect= function(aContext, aRect, aRadius, ne, se, sw, nw)
{
    CGContextBeginPath(aContext);
    CGContextAddPath(aContext, CGPathWithRoundedRectangleInRect(aRect, aRadius, aRadius, ne, se, sw, nw));
    CGContextClosePath(aContext);
    CGContextFillPath(aContext);
}
CGContextStrokeRoundedRectangleInRect= function(aContext, aRect, aRadius, ne, se, sw, nw)
{
    CGContextBeginPath(aContext);
    CGContextAddPath(aContext, CGPathWithRoundedRectangleInRect(aRect, aRadius, aRadius, ne, se, sw, nw));
    CGContextClosePath(aContext);
    CGContextStrokePath(aContext);
}
if (CPFeatureIsCompatible(CPHTMLCanvasFeature))
{
var CANVAS_LINECAP_TABLE = [ "butt", "round", "square" ],
    CANVAS_LINEJOIN_TABLE = [ "miter", "round", "bevel" ],
    CANVAS_COMPOSITE_TABLE = [ "source-over", "source-over", "source-over", "source-over", "darker",
                                "lighter", "source-over", "source-over", "source-over", "source-over",
                                "source-over", "source-over", "source-over", "source-over", "source-over",
                                "source-over", "source-over",
                                "copy", "source-in", "source-out", "source-atop",
                                "destination-over", "destination-in", "destination-out", "destination-atop",
                                "xor", "source-over", "source-over" ];
CGContextSaveGState= function(aContext)
{
    aContext.save();
}
CGContextRestoreGState= function(aContext)
{
    aContext.restore();
}
CGContextSetLineCap= function(aContext, aLineCap)
{
    aContext.lineCap = CANVAS_LINECAP_TABLE[aLineCap];
}
CGContextSetLineJoin= function(aContext, aLineJoin)
{
    aContext.lineJoin = CANVAS_LINEJOIN_TABLE[aLineJoin];
}
CGContextSetLineWidth= function(aContext, aLineWidth)
{
    aContext.lineWidth = aLineWidth;
}
CGContextSetMiterLimit= function(aContext, aMiterLimit)
{
    aContext.miterLimit = aMiterLimit;
}
CGContextSetBlendMode= function(aContext, aBlendMode)
{
    aContext.globalCompositeOperation = CANVAS_COMPOSITE_TABLE[aBlendMode];
}
CGContextAddArc= function(aContext, x, y, radius, startAngle, endAngle, clockwise)
{
    aContext.arc(x, y, radius, startAngle, endAngle, !clockwise);
}
CGContextAddArcToPoint= function(aContext, x1, y1, x2, y2, radius)
{
    aContext.arcTo(x1, y1, x2, y2, radius);
}
CGContextAddCurveToPoint= function(aContext, cp1x, cp1y, cp2x, cp2y, x, y)
{
    aContext.bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x, y);
}
CGContextAddLineToPoint= function(aContext, x, y)
{
    aContext.lineTo(x, y);
}
CGContextAddPath= function(aContext, aPath)
{
    if (!aContext || CGPathIsEmpty(aPath))
        return;
    var elements = aPath.elements,
        i = 0,
        count = aPath.count;
    for (; i < count; ++i)
    {
        var element = elements[i],
            type = element.type;
        switch (type)
        {
            case kCGPathElementMoveToPoint: aContext.moveTo(element.x, element.y);
                                                    break;
            case kCGPathElementAddLineToPoint: aContext.lineTo(element.x, element.y);
                                                    break;
            case kCGPathElementAddQuadCurveToPoint: aContext.quadraticCurveTo(element.cpx, element.cpy, element.x, element.y);
                                                    break;
            case kCGPathElementAddCurveToPoint: aContext.bezierCurveTo(element.cp1x, element.cp1y, element.cp2x, element.cp2y, element.x, element.y);
                                                    break;
            case kCGPathElementCloseSubpath: aContext.closePath();
                                                    break;
            case kCGPathElementAddArc: aContext.arc(element.x, element.y, element.radius, element.startAngle, element.endAngle, element.clockwise);
                                                    break;
            case kCGPathElementAddArcTo:
                                                    break;
        }
    }
}
CGContextAddRect= function(aContext, aRect)
{
    aContext.rect((aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
}
CGContextAddRects= function(aContext, rects, count)
{
    var i = 0;
    if (arguments["count"] == NULL)
        var count = rects.length;
    for (; i < count; ++i)
    {
        var rect = rects[i];
        aContext.rect((rect.origin.x), (rect.origin.y), (rect.size.width), (rect.size.height));
    }
}
CGContextBeginPath= function(aContext)
{
    aContext.beginPath();
}
CGContextClosePath= function(aContext)
{
    aContext.closePath();
}
CGContextMoveToPoint= function(aContext, x, y)
{
    aContext.moveTo(x, y);
}
CGContextClearRect= function(aContext, aRect)
{
    aContext.clearRect((aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
}
CGContextDrawPath= function(aContext, aMode)
{
    if (aMode == kCGPathFill || aMode == kCGPathFillStroke)
        aContext.fill();
    else if (aMode == kCGPathEOFill || aMode == kCGPathEOFillStroke)
        alert("not implemented!!!");
    if (aMode == kCGPathStroke || aMode == kCGPathFillStroke || aMode == kCGPathEOFillStroke)
        aContext.stroke();
}
CGContextFillRect= function(aContext, aRect)
{
    aContext.fillRect((aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
}
CGContextFillRects= function(aContext, rects, count)
{
    var i = 0;
    if (arguments["count"] == NULL)
        var count = rects.length;
    for (; i < count; ++i)
    {
        var rect = rects[i];
        aContext.fillRect((rect.origin.x), (rect.origin.y), (rect.size.width), (rect.size.height));
    }
}
CGContextStrokeRect= function(aContext, aRect)
{
    aContext.strokeRect((aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
}
CGContextClip= function(aContext)
{
    aContext.clip();
}
CGContextClipToRect= function(aContext, aRect)
{
    aContext.beginPath();
    aContext.rect((aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
    aContext.closePath();
    aContext.clip();
}
CGContextClipToRects= function(aContext, rects, count)
{
    if (arguments["count"] == NULL)
        var count = rects.length;
    aContext.beginPath();
    CGContextAddRects(aContext, rects, count);
    aContext.clip();
}
CGContextSetAlpha= function(aContext, anAlpha)
{
    aContext.globalAlpha = anAlpha;
}
CGContextSetFillColor= function(aContext, aColor)
{
    aContext.fillStyle = objj_msgSend(aColor, "cssString");
}
CGContextSetStrokeColor= function(aContext, aColor)
{
    aContext.strokeStyle = objj_msgSend(aColor, "cssString");
}
CGContextSetShadow= function(aContext, aSize, aBlur)
{
    aContext.shadowOffsetX = aSize.width;
    aContext.shadowOffsetY = aSize.height;
    aContext.shadowBlur = aBlur;
}
CGContextSetShadowWithColor= function(aContext, aSize, aBlur, aColor)
{
    aContext.shadowOffsetX = aSize.width;
    aContext.shadowOffsetY = aSize.height;
    aContext.shadowBlur = aBlur;
    aContext.shadowColor = objj_msgSend(aColor, "cssString");
}
CGContextRotateCTM= function(aContext, anAngle)
{
    aContext.rotate(anAngle);
}
CGContextScaleCTM= function(aContext, sx, sy)
{
    aContext.scale(sx, sy);
}
CGContextTranslateCTM= function(aContext, tx, ty)
{
    aContext.translate(tx, ty);
}
eigen= function(anAffineTransform)
{
    alert("IMPLEMENT ME!");
}
if (CPFeatureIsCompatible(CPJavaScriptCanvasTransformFeature))
{
CGContextConcatCTM = function(aContext, anAffineTransform)
{
    aContext.transform(anAffineTransform.a, anAffineTransform.b, anAffineTransform.c, anAffineTransform.d, anAffineTransform.tx, anAffineTransform.ty);
}
}
else
{
CGContextConcatCTM = function(aContext, anAffineTransform)
{
    var a = anAffineTransform.a,
        b = anAffineTransform.b,
        c = anAffineTransform.c,
        d = anAffineTransform.d,
        tx = anAffineTransform.tx,
        ty = anAffineTransform.ty,
        sx = 1.0,
        sy = 1.0,
        a1 = 0.0,
        a2 = 0.0;
    if (b == 0.0 && c == 0.0)
    {
        sx = a;
        sy = d;
    }
    else if (a * b == -c * d)
    {
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0, a2 = (ATAN2(b, d) + ATAN2(-sign * c, sign * a)) / 2.0, cos = COS(a2), sin = SIN(a2); if (cos == 0) { sx = -c / sin; sy = b / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * b / sin) / (abs_cos + abs_sin); }
    }
    else if (a * c == -b * d)
    {
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0; a1 = (Math.atan2(sign * b, sign * a) + Math.atan2(-c, d)) / 2.0, cos = COS(a1), sin = SIN(a1); if (cos == 0) { sx = b / sin; sy = -c / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * b / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); }
    }
    else
    {
        var transpose = CGAffineTransformMake(a, c, b, d, 0.0, 0.0),
            u = eigen(CGAffineTransformConcat(anAffineTransform, transpose)),
            v = eigen(CGAffineTransformConcat(transpose, anAffineTransform)),
            U = CGAffineTransformMake(u.vector_1.x, u.vector_2.x, u.vector_1.y, u.vector_2.y, 0.0, 0.0),
            VT = CGAffineTransformMake(v.vector_1.x, v.vector_1.y, v.vector_2.x, v.vector_2.y, 0.0, 0.0),
            S = CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformInvert(U), anAffineTransform), CGAffineTransformInvert(VT));
        a = VT.a;
        b = VT.b;
        c = VT.c;
        d = VT.d;
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0, a2 = (ATAN2(b, d) + ATAN2(-sign * c, sign * a)) / 2.0, cos = COS(a2), sin = SIN(a2); if (cos == 0) { sx = -c / sin; sy = b / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * b / sin) / (abs_cos + abs_sin); }
        S.a *= sx;
        S.d *= sy;
        a = U.a;
        b = U.b;
        c = U.c;
        d = U.d;
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0; a1 = (Math.atan2(sign * b, sign * a) + Math.atan2(-c, d)) / 2.0, cos = COS(a1), sin = SIN(a1); if (cos == 0) { sx = b / sin; sy = -c / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * b / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); }
        sx = S.a * sx;
        sy = S.d * sy;
    }
    if (tx != 0 || ty != 0)
        CGContextTranslateCTM(aContext, tx, ty);
    if (a1 != 0.0)
        CGContextRotateCTM(aContext, a1);
    if (sx != 1.0 || sy != 1.0)
        CGContextScaleCTM(aContext, sx, sy);
    if (a2 != 0.0)
        CGContextRotateCTM(aContext, a2);
}
}
CGContextDrawImage= function(aContext, aRect, anImage)
{
    aContext.drawImage(anImage._image, (aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
}
to_string= function(aColor)
{
    return "rgba(" + ROUND(aColor.components[0] * 255) + ", " + ROUND(aColor.components[1] * 255) + ", " + ROUND(255 * aColor.components[2]) + ", " + aColor.components[3] + ")";
}
CGContextDrawLinearGradient= function(aContext, aGradient, aStartPoint, anEndPoint, options)
{
    var colors = aGradient.colors,
        count = colors.length,
        linearGradient = aContext.createLinearGradient(aStartPoint.x, aStartPoint.y, anEndPoint.x, anEndPoint.y);
    while (count--)
        linearGradient.addColorStop(aGradient.locations[count], to_string(colors[count]));
    aContext.fillStyle = linearGradient;
    aContext.fill();
}
CGBitmapGraphicsContextCreate= function()
{
    var DOMElement = document.createElement("canvas"),
        context = DOMElement.getContext("2d");
    context.DOMElement = DOMElement;
    return context;
}
}
else if (CPFeatureIsCompatible(CPVMLFeature))
{
var VML_TRUTH_TABLE = [ "f", "t"],
    VML_LINECAP_TABLE = [ "flat", "round", "square" ],
    VML_LINEJOIN_TABLE = [ "miter", "round", "bevel" ],
    VML_ELEMENT_TABLE = [ " m ", " l ", "qb", " c ", " x ", [" at ", " wa "]];
var _CGBitmapGraphicsContextCreate = CGBitmapGraphicsContextCreate;
CGBitmapGraphicsContextCreate= function()
{
    document.namespaces.add("cg_vml_", "urn:schemas-microsoft-com:vml");
    document.createStyleSheet().cssText = "cg_vml_\\:*{behavior:url(#default#VML)}";
    CGBitmapGraphicsContextCreate = _CGBitmapGraphicsContextCreate;
    return _CGBitmapGraphicsContextCreate();
}
CGContextClearRect= function(aContext, aRect)
{
    if (aContext.buffer != nil)
        aContext.buffer = "";
    else
        aContext.DOMElement.innerHTML = "";
    aContext.path = NULL;
}
var W = 10.0,
    H = 10.0,
    Z = 10.0,
    Z_2 = Z / 2.0;
CGContextDrawImage= function(aContext, aRect, anImage)
{
    var string = "";
    if (anImage.buffer != nil)
        string = anImage.buffer;
    else
    {
        var ctm = aContext.gState.CTM,
            origin = CGPointApplyAffineTransform(aRect.origin, ctm),
            similarity = ctm.a == ctm.d && ctm.b == -ctm.c,
            vml = ["<cg_vml_:group coordsize=\"1,1\" coordorigin=\"0,0\" style=\"width:1;height:1;position:absolute"];
        {
            var transformedRect = CGRectApplyAffineTransform(aRect, ctm);
            vml.push( ";padding:0 ", ROUND((transformedRect.origin.x + transformedRect.size.width)), "px ", ROUND((transformedRect.origin.y + transformedRect.size.height)),
                        "px 0;filter:progid:DXImageTransform.Microsoft.Matrix(",
                        "M11='", ctm.a, "',M12='", ctm.c, "',M21='", ctm.b, "',M22='", ctm.d, "',",
                        "Dx='", ROUND(origin.x), "', Dy='", ROUND(origin.y), "', sizingmethod='clip');");
        }
        vml.push( "\"><cg_vml_:image src=\"", anImage._image.src,
                    "\" style=\"width:", (aRect.size.width), "px;height:", (aRect.size.height),
                    "px;\"/></g_vml_:group>");
        string = vml.join("");
    }
    if (aContext.buffer != nil)
        aContext.buffer += string;
    else
        aContext.DOMElement.insertAdjacentHTML("BeforeEnd", string);
}
CGContextDrawPath= function(aContext, aMode)
{
    if (!aContext || CGPathIsEmpty(aContext.path))
        return;
    var elements = aContext.path.elements,
        i = 0,
        count = aContext.path.count,
        gState = aContext.gState,
        fill = (aMode == kCGPathFill || aMode == kCGPathFillStroke) ? 1 : 0,
        stroke = (aMode == kCGPathStroke || aMode == kCGPathFillStroke) ? 1 : 0,
        opacity = gState.alpha,
        vml = [ "<cg_vml_:shape",
                " fillcolor=\"", gState.fillStyle,
                "\" filled=\"", VML_TRUTH_TABLE[fill],
                "\" style=\"position:absolute;width:", W, ";height:", H,
                ";\" coordorigin=\"0 0\" coordsize=\"", Z * W, " ", Z * H,
                "\" stroked=\"", VML_TRUTH_TABLE[stroke],
                "\" strokeweight=\"", gState.lineWidth,
                "\" strokecolor=\"", gState.strokeStyle,
                "\" path=\""];
    for (; i < count; ++i)
    {
        var element = elements[i],
            type = element.type;
        switch(type)
        {
            case kCGPathElementMoveToPoint:
            case kCGPathElementAddLineToPoint: vml.push(VML_ELEMENT_TABLE[type], (ROUND(Z * (element.x) - Z_2)), ',', (ROUND(Z * (element.y) - Z_2)));
                                                    break;
            case kCGPathElementAddQuadCurveToPoint: vml.push(VML_ELEMENT_TABLE[type],
                                                        (ROUND(Z * (element.cpx) - Z_2)), ',', (ROUND(Z * (element.cpy) - Z_2)), ',',
                                                        (ROUND(Z * (element.x) - Z_2)), ',', (ROUND(Z * (element.y) - Z_2)));
                                                    break;
            case kCGPathElementAddCurveToPoint: vml.push(VML_ELEMENT_TABLE[type],
                                                        (ROUND(Z * (element.cp1x) - Z_2)), ',', (ROUND(Z * (element.cp1y) - Z_2)), ',',
                                                        (ROUND(Z * (element.cp2x) - Z_2)), ',', (ROUND(Z * (element.cp2y) - Z_2)), ',',
                                                        (ROUND(Z * (element.x) - Z_2)), ',', (ROUND(Z * (element.y) - Z_2)));
                                                    break;
            case kCGPathElementCloseSubpath: vml.push(VML_ELEMENT_TABLE[type]);
                                                    break;
            case kCGPathElementAddArc: var x = element.x,
                                                        y = element.y,
                                                        radius = element.radius,
                                                        clockwise = element.clockwise ? 1 : 0,
                                                        endAngle = element.endAngle,
                                                        startAngle = element.startAngle,
                                                        start = { x:x + radius * COS(startAngle), y:y + radius * SIN(startAngle) };
                                                    if (startAngle == endAngle && !clockwise)
                                                    {
                                                        vml.push(VML_ELEMENT_TABLE[kCGPathElementMoveToPoint], (ROUND(Z * (start.x) - Z_2)), ',', (ROUND(Z * (start.y) - Z_2)));
                                                        continue;
                                                    }
                                                    var end = { x:x + radius * COS(endAngle), y:y + radius * SIN(endAngle) };
                                                    if (clockwise && startAngle != endAngle && (start.x == end.x && start.y == end.y))
                                                        if (start.x >= x)
                                                        {
                                                            if (start.y < y)
                                                                start.x += 0.125;
                                                            else
                                                                start.y += 0.125;
                                                        }
                                                        else
                                                        {
                                                            if (end.y <= y)
                                                                end.x += 0.125;
                                                            else
                                                                end.y += 0.125;
                                                        }
                                                    vml.push(VML_ELEMENT_TABLE[type][clockwise],
                                                        (ROUND(Z * (x - radius) - Z_2)), ',', (ROUND(Z * (y - radius) - Z_2)), " ",
                                                        (ROUND(Z * (x + radius) - Z_2)), ',', (ROUND(Z * (y + radius) - Z_2)), " ",
                                                        (ROUND(Z * (start.x) - Z_2)), ',', (ROUND(Z * (start.y) - Z_2)), " ",
                                                        (ROUND(Z * (end.x) - Z_2)), ',', (ROUND(Z * (end.y) - Z_2)));
                                                    break;
            case kCGPathElementAddArcTo: break;
        }
    }
    vml.push("\">");
    if (gState.gradient)
        vml.push(gState.gradient)
    else if (fill)
        vml.push("<cg_vml_:fill color=\"", gState.fillStyle, "\" opacity=\"", opacity, "\" />");
    if (stroke)
        vml.push( "<cg_vml_:stroke opacity=\"", opacity,
                    "\" joinstyle=\"", VML_LINEJOIN_TABLE[gState.lineJoin],
                    "\" miterlimit=\"", gState.miterLimit,
                    "\" endcap=\"", VML_LINECAP_TABLE[gState.lineCap],
                    "\" weight=\"", gState.lineWidth, "",
                    "px\" color=\"", gState.strokeStyle,"\" />");
    var shadowColor = gState.shadowColor;
    if (shadowColor)
    {
        var shadowOffset = gState.shadowOffset;
        vml.push("<cg_vml_:shadow on=\"t\" offset=\"",
            shadowOffset.width, "pt ", shadowOffset.height, "pt\" opacity=\"", objj_msgSend(shadowColor, "alphaComponent"), "\" color=black />");
    }
    vml.push("</cg_vml_:shape>");
    aContext.path = NULL;
    if (aContext.buffer != nil)
        aContext.buffer += vml.join("");
    else
        aContext.DOMElement.insertAdjacentHTML("BeforeEnd", vml.join(""));
}
to_string= function(aColor)
{
    return "rgb(" + ROUND(aColor.components[0] * 255) + ", " + ROUND(aColor.components[1] * 255) + ", " + ROUND(255 * aColor.components[2]) + ")";
}
CGContextDrawLinearGradient= function(aContext, aGradient, aStartPoint, anEndPoint, options)
{
    if (!aContext || !aGradient)
        return;
    var vml = nil;
    if (aGradient.vml_gradient)
    {
        var stops = objj_msgSend(objj_msgSend(aGradient.vml_gradient, "stops"), "sortedArrayUsingSelector:", sel_getUid("comparePosition:")),
            count = objj_msgSend(stops, "count");
        vml = ["<cg_vml_:fill type=\"gradient\" method=\"linear sigma\" "];
        vml.push("angle=\"" + (objj_msgSend(aGradient.vml_gradient, "angle") + 90) +"\" ");
        vml.push("colors=\"");
        for (var i = 0; i < count; i++)
        {
            vml.push((objj_msgSend(stops[i], "position")*100).toFixed(0)+"% ");
            vml.push(objj_msgSend(objj_msgSend(objj_msgSend(stops[i], "color"), "colorForSlideBase:", nil), "cssString"));
            if (i < count-1)
                vml.push(",");
        }
        vml.push("\" />");
    }
    else
    {
        var colors = aGradient.colors,
            count = colors.length;
        vml = ["<cg_vml_:fill type=\"gradient\" "];
        vml.push("colors=\"");
        for (var i = 0; i < count; i++)
            vml.push((aGradient.locations[i]*100).toFixed(0)+"% "+to_string(colors[i])+(i<count-1 ? "," : ""));
        vml.push("\" />");
    }
    aContext.gState.gradient = vml.join("");
    console.log(vml.join(""));
}
}

