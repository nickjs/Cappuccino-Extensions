I;26;AppKit/CPGraphicsContext.jI;21;Foundation/CPObject.jc;6544;
var DefaultLineWidth = 1.0;
{var the_class = objj_allocateClassPair(CPObject, "CPBezierPath"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_path"), new objj_ivar("_lineWidth")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPBezierPath__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        _path = CGPathCreateMutable();
        _lineWidth = objj_msgSend(objj_msgSend(self, "class"), "defaultLineWidth");
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("moveToPoint:"), function $CPBezierPath__moveToPoint_(self, _cmd, point)
{ with(self)
{
    CGPathMoveToPoint(_path, nil, point.x, point.y);
}
},["void","CGPoint"]), new objj_method(sel_getUid("lineToPoint:"), function $CPBezierPath__lineToPoint_(self, _cmd, point)
{ with(self)
{
    CGPathAddLineToPoint(_path, nil, point.x, point.y);
}
},["void","CGPoint"]), new objj_method(sel_getUid("curveToPoint:controlPoint1:controlPoint2:"), function $CPBezierPath__curveToPoint_controlPoint1_controlPoint2_(self, _cmd, endPoint, controlPoint1, controlPoint2)
{ with(self)
{
    CGPathAddCurveToPoint(_path, nil, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, endPoint.x, endPoint.y);
}
},["void","CGPoint","CGPoint","CGPoint"]), new objj_method(sel_getUid("closePath"), function $CPBezierPath__closePath(self, _cmd)
{ with(self)
{
    CGPathCloseSubpath(_path);
}
},["void"]), new objj_method(sel_getUid("stroke"), function $CPBezierPath__stroke(self, _cmd)
{ with(self)
{
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextBeginPath(ctx);
    CGContextAddPath(ctx, _path);
    CGContextSetLineWidth(ctx, objj_msgSend(self, "lineWidth"));
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
}
},["void"]), new objj_method(sel_getUid("fill"), function $CPBezierPath__fill(self, _cmd)
{ with(self)
{
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextBeginPath(ctx);
    CGContextAddPath(ctx, _path);
    CGContextSetLineWidth(ctx, objj_msgSend(self, "lineWidth"));
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}
},["void"]), new objj_method(sel_getUid("lineWidth"), function $CPBezierPath__lineWidth(self, _cmd)
{ with(self)
{
    return _lineWidth;
}
},["float"]), new objj_method(sel_getUid("setLineWidth:"), function $CPBezierPath__setLineWidth_(self, _cmd, lineWidth)
{ with(self)
{
    _lineWidth = lineWidth;
}
},["void","float"]), new objj_method(sel_getUid("elementCount"), function $CPBezierPath__elementCount(self, _cmd)
{ with(self)
{
    return _path.count;
}
},["unsigned"]), new objj_method(sel_getUid("isEmpty"), function $CPBezierPath__isEmpty(self, _cmd)
{ with(self)
{
    return CGPathIsEmpty(_path);
}
},["BOOL"]), new objj_method(sel_getUid("currentPoint"), function $CPBezierPath__currentPoint(self, _cmd)
{ with(self)
{
    return CGPathGetCurrentPoint(_path);
}
},["CGPoint"]), new objj_method(sel_getUid("appendBezierPathWithPoints:count:"), function $CPBezierPath__appendBezierPathWithPoints_count_(self, _cmd, points, count)
{ with(self)
{
    CGPathAddLines(_path, nil, points, count);
}
},["void","CPArray","unsigned"]), new objj_method(sel_getUid("appendBezierPathWithRect:"), function $CPBezierPath__appendBezierPathWithRect_(self, _cmd, rect)
{ with(self)
{
    CGPathAddRect(_path, nil, rect);
}
},["void","CGRect"]), new objj_method(sel_getUid("appendBezierPathWithOvalInRect:"), function $CPBezierPath__appendBezierPathWithOvalInRect_(self, _cmd, rect)
{ with(self)
{
    CGPathAddPath(_path, nil, CGPathWithEllipseInRect(rect));
}
},["void","CGRect"]), new objj_method(sel_getUid("appendBezierPathWithRoundedRect:xRadius:yRadius:"), function $CPBezierPath__appendBezierPathWithRoundedRect_xRadius_yRadius_(self, _cmd, rect, xRadius, yRadius)
{ with(self)
{
    CGPathAddPath(_path, nil, CGPathWithRoundedRectangleInRect(rect, xRadius, yRadius, YES, YES, YES, YES));
}
},["void","CGRect","float","float"]), new objj_method(sel_getUid("appendBezierPath:"), function $CPBezierPath__appendBezierPath_(self, _cmd, other)
{ with(self)
{
    CGPathAddPath(_path, nil, other._path);
}
},["void","NSBezierPath*"]), new objj_method(sel_getUid("removeAllPoints"), function $CPBezierPath__removeAllPoints(self, _cmd)
{ with(self)
{
    _path = CGPathCreateMutable();
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("bezierPath"), function $CPBezierPath__bezierPath(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
},["CPBezierPath"]), new objj_method(sel_getUid("bezierPathWithOvalInRect:"), function $CPBezierPath__bezierPathWithOvalInRect_(self, _cmd, rect)
{ with(self)
{
    var path = objj_msgSend(self, "bezierPath");
    objj_msgSend(path, "appendBezierPathWithOvalInRect:", rect);
    return path;
}
},["CPBezierPath","CGRect"]), new objj_method(sel_getUid("bezierPathWithRect:"), function $CPBezierPath__bezierPathWithRect_(self, _cmd, rect)
{ with(self)
{
    var path = objj_msgSend(self, "bezierPath");
    objj_msgSend(path, "appendBezierPathWithRect:", rect);
    return path;
}
},["CPBezierPath","CGRect"]), new objj_method(sel_getUid("defaultLineWidth"), function $CPBezierPath__defaultLineWidth(self, _cmd)
{ with(self)
{
    return DefaultLineWidth;
}
},["float"]), new objj_method(sel_getUid("setDefaultLineWidth:"), function $CPBezierPath__setDefaultLineWidth_(self, _cmd, width)
{ with(self)
{
    DefaultLineWidth = width;
}
},["void","float"]), new objj_method(sel_getUid("fillRect:"), function $CPBezierPath__fillRect_(self, _cmd, aRect)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "bezierPathWithRect:", aRect), "fill");
}
},["void","CGRect"]), new objj_method(sel_getUid("strokeRect:"), function $CPBezierPath__strokeRect_(self, _cmd, aRect)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "bezierPathWithRect:", aRect), "stroke");
}
},["void","CGRect"]), new objj_method(sel_getUid("strokeLineFromPoint:toPoint:"), function $CPBezierPath__strokeLineFromPoint_toPoint_(self, _cmd, point1, point2)
{ with(self)
{
    var path = objj_msgSend(self, "bezierPath");
    objj_msgSend(path, "moveToPoint:", point1);
    objj_msgSend(path, "lineToPoint:", point2);
    objj_msgSend(path, "stroke");
}
},["void","CGPoint","CGPoint"])]);
}

