i;12;CGGeometry.jc;4830;
CGAffineTransformMake= function(a, b, c, d, tx, ty) { return { a:a, b:b, c:c, d:d, tx:tx, ty:ty }; }
CGAffineTransformMakeIdentity= function() { return { a:1.0, b:0.0, c:0.0, d:1.0, tx:0.0, ty:0.0 }; }
CGAffineTransformMakeCopy= function(anAffineTransform) { return { a:anAffineTransform.a, b:anAffineTransform.b, c:anAffineTransform.c, d:anAffineTransform.d, tx:anAffineTransform.tx, ty:anAffineTransform.ty }; }
CGAffineTransformMakeScale= function(sx, sy) { return { a:sx, b:0.0, c:0.0, d:sy, tx:0.0, ty:0.0 }; }
CGAffineTransformMakeTranslation= function(tx, ty) { return { a:1.0, b:0.0, c:0.0, d:1.0, tx:tx, ty:ty }; }
CGAffineTransformTranslate= function(aTransform, tx, ty) { return { a:aTransform.a, b:aTransform.b, c:aTransform.c, d:aTransform.d, tx:aTransform.tx + aTransform.a * tx + aTransform.c * ty, ty:aTransform.ty + aTransform.b * tx + aTransform.d * ty }; }
CGAffineTransformScale= function(aTransform, sx, sy) { return { a:aTransform.a * sx, b:aTransform.b * sx, c:aTransform.c * sy, d:aTransform.d * sy, tx:aTransform.tx, ty:aTransform.ty }; }
CGAffineTransformConcat= function(lhs, rhs) { return { a:lhs.a * rhs.a + lhs.b * rhs.c, b:lhs.a * rhs.b + lhs.b * rhs.d, c:lhs.c * rhs.a + lhs.d * rhs.c, d:lhs.c * rhs.b + lhs.d * rhs.d, tx:lhs.tx * rhs.a + lhs.ty * rhs.c + rhs.tx, ty:lhs.tx * rhs.b + lhs.ty * rhs.d + rhs.ty }; }
CGPointApplyAffineTransform= function(aPoint, aTransform) { return { x:aPoint.x * aTransform.a + aPoint.y * aTransform.c + aTransform.tx, y:aPoint.x * aTransform.b + aPoint.y * aTransform.d + aTransform.ty }; }
CGSizeApplyAffineTransform= function(aSize, aTransform) { return { width:aSize.width * aTransform.a + aSize.height * aTransform.c, height:aSize.width * aTransform.b + aSize.height * aTransform.d }; }
CGAffineTransformIsIdentity= function(aTransform) { return (aTransform.a == 1 && aTransform.b == 0 && aTransform.c == 0 && aTransform.d == 1 && aTransform.tx == 0 && aTransform.ty == 0); }
CGAffineTransformEqualToTransform= function(lhs, rhs) { return (lhs.a == rhs.a && lhs.b == rhs.b && lhs.c == rhs.c && lhs.d == rhs.d && lhs.tx == rhs.tx && lhs.ty == rhs.ty); }
CGStringCreateWithCGAffineTransform= function(aTransform) { return (" [[ " + aTransform.a + ", " + aTransform.b + ", 0 ], [ " + aTransform.c + ", " + aTransform.d + ", 0 ], [ " + aTransform.tx + ", " + aTransform.ty + ", 1]]"); }
CGAffineTransformCreateCopy= function(aTransform)
{
    return { a:aTransform.a, b:aTransform.b, c:aTransform.c, d:aTransform.d, tx:aTransform.tx, ty:aTransform.ty };
}
CGAffineTransformMakeRotation= function(anAngle)
{
    var sin = SIN(anAngle),
        cos = COS(anAngle);
    return { a:cos, b:sin, c:-sin, d:cos, tx:0.0, ty:0.0 };
}
CGAffineTransformRotate= function(aTransform, anAngle)
{
    var sin = SIN(anAngle),
        cos = COS(anAngle);
    return {
            a:aTransform.a * cos + aTransform.c * sin,
            b:aTransform.b * cos + aTransform.d * sin,
            c:aTransform.c * cos - aTransform.a * sin,
            d:aTransform.d * cos - aTransform.b * sin,
            tx:aTransform.tx,
            ty:aTransform.ty
        };
}
CGAffineTransformInvert= function(aTransform)
{
    var determinant = 1 / (aTransform.a * aTransform.d - aTransform.b * aTransform.c);
    return {
        a:determinant * aTransform.d,
        b:-determinant * aTransform.b,
        c:-determinant * aTransform.c,
        d:determinant * aTransform.a,
        tx:determinant * (aTransform.c * aTransform.ty - aTransform.d * aTransform.tx),
        ty:determinant * (aTransform.b * aTransform.tx - aTransform.a * aTransform.ty)
    };
}
CGRectApplyAffineTransform= function(aRect, anAffineTransform)
{
    var top = (aRect.origin.y),
        left = (aRect.origin.x),
        right = (aRect.origin.x + aRect.size.width),
        bottom = (aRect.origin.y + aRect.size.height),
        topLeft = CGPointApplyAffineTransform({ x:left, y:top }, anAffineTransform),
        topRight = CGPointApplyAffineTransform({ x:right, y:top }, anAffineTransform),
        bottomLeft = CGPointApplyAffineTransform({ x:left, y:bottom }, anAffineTransform),
        bottomRight = CGPointApplyAffineTransform({ x:right, y:bottom }, anAffineTransform),
        minX = MIN(topLeft.x, topRight.x, bottomLeft.x, bottomRight.x),
        maxX = MAX(topLeft.x, topRight.x, bottomLeft.x, bottomRight.x),
        minY = MIN(topLeft.y, topRight.y, bottomLeft.y, bottomRight.y),
        maxY = MAX(topLeft.y, topRight.y, bottomLeft.y, bottomRight.y);
    return { origin: { x:minX, y:minY }, size: { width:(maxX - minX), height:(maxY - minY) } };
}
CPStringFromCGAffineTransform= function(anAffineTransform)
{
    return '{' + anAffineTransform.a + ", " + anAffineTransform.b + ", " + anAffineTransform.c + ", " + anAffineTransform.d + ", " + anAffineTransform.tx + ", " + anAffineTransform.ty + '}';
}

