I;21;Foundation/CPObject.jI;23;AppKit/CABackingStore.jI;18;AppKit/CGContext.jI;19;AppKit/CGGeometry.ji;12;CGGeometry.jc;37375;
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
var CALayerGeometryBoundsMask = 1,
    CALayerGeometryPositionMask = 2,
    CALayerGeometryAnchorPointMask = 4,
    CALayerGeometryAffineTransformMask = 8,
    CALayerGeometryParentSublayerTransformMask = 16;
var USE_BUFFER = NO;
var CALayerFrameOriginUpdateMask = 1,
    CALayerFrameSizeUpdateMask = 2,
    CALayerZPositionUpdateMask = 4,
    CALayerDisplayUpdateMask = 8,
    CALayerCompositeUpdateMask = 16,
    CALayerDOMUpdateMask = CALayerZPositionUpdateMask | CALayerFrameOriginUpdateMask | CALayerFrameSizeUpdateMask;
var CALayerRegisteredRunLoopUpdates = nil;
{var the_class = objj_allocateClassPair(CPObject, "CALayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_frame"), new objj_ivar("_bounds"), new objj_ivar("_position"), new objj_ivar("_zPosition"), new objj_ivar("_anchorPoint"), new objj_ivar("_affineTransform"), new objj_ivar("_sublayerTransform"), new objj_ivar("_sublayerTransformForSublayers"), new objj_ivar("_backingStoreFrame"), new objj_ivar("_standardBackingStoreFrame"), new objj_ivar("_hasSublayerTransform"), new objj_ivar("_hasCustomBackingStoreFrame"), new objj_ivar("_opacity"), new objj_ivar("_isHidden"), new objj_ivar("_backgroundColor"), new objj_ivar("_superlayer"), new objj_ivar("_sublayers"), new objj_ivar("_runLoopUpdateMask"), new objj_ivar("_needsDisplayOnBoundsChange"), new objj_ivar("_delegate"), new objj_ivar("_delegateRespondsToDisplayLayerSelector"), new objj_ivar("_delegateRespondsToDrawLayerInContextSelector"), new objj_ivar("_DOMElement"), new objj_ivar("_DOMContentsElement"), new objj_ivar("_contents"), new objj_ivar("_context"), new objj_ivar("_owningView"), new objj_ivar("_transformToLayer"), new objj_ivar("_transformFromLayer")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CALayer__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _frame = CGRectMakeZero();

        _backingStoreFrame = CGRectMakeZero();
        _standardBackingStoreFrame = CGRectMakeZero();

        _bounds = CGRectMakeZero();
        _position = CGPointMakeZero();
        _zPosition = 0.0;
        _anchorPoint = CGPointMake(0.5, 0.5);
        _affineTransform = CGAffineTransformMakeIdentity();
        _sublayerTransform = CGAffineTransformMakeIdentity();

        _transformToLayer = CGAffineTransformMakeIdentity();
        _transformFromLayer = CGAffineTransformMakeIdentity();

        _opacity = 1.0;
        _isHidden = NO;
        _masksToBounds = NO;

        _sublayers = [];

        _DOMElement = document.createElement("div");

        _DOMElement.style.overflow = "visible";
        _DOMElement.style.position = "absolute";
        _DOMElement.style.visibility = "visible";
        _DOMElement.style.top = "0px";
        _DOMElement.style.left = "0px";
        _DOMElement.style.zIndex = 0;
        _DOMElement.style.width = "0px";
        _DOMElement.style.height = "0px";
    }

    return self;
}
},["id"]), new objj_method(sel_getUid("setBounds:"), function $CALayer__setBounds_(self, _cmd, aBounds)
{ with(self)
{
    if (CGRectEqualToRect(_bounds, aBounds))
        return;

    var oldOrigin = _bounds.origin;

    _bounds = { origin: { x:aBounds.origin.x, y:aBounds.origin.y }, size: { width:aBounds.size.width, height:aBounds.size.height } };

    if (_hasSublayerTransform)
        _CALayerUpdateSublayerTransformForSublayers(self);
    _CALayerRecalculateGeometry(self, CALayerGeometryBoundsMask);
}
},["void","CGRect"]), new objj_method(sel_getUid("bounds"), function $CALayer__bounds(self, _cmd)
{ with(self)
{
    return _bounds;
}
},["CGRect"]), new objj_method(sel_getUid("setPosition:"), function $CALayer__setPosition_(self, _cmd, aPosition)
{ with(self)
{
    if (CGPointEqualToPoint(_position, aPosition))
        return;
    _position = { x:aPosition.x, y:aPosition.y };
    _CALayerRecalculateGeometry(self, CALayerGeometryPositionMask);
}
},["void","CGPoint"]), new objj_method(sel_getUid("position"), function $CALayer__position(self, _cmd)
{ with(self)
{
    return _position;
}
},["CGPoint"]), new objj_method(sel_getUid("setZPosition:"), function $CALayer__setZPosition_(self, _cmd, aZPosition)
{ with(self)
{
    if (_zPosition == aZPosition)
        return;
    _zPosition = aZPosition;
    objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerZPositionUpdateMask);
}
},["void","int"]), new objj_method(sel_getUid("setAnchorPoint:"), function $CALayer__setAnchorPoint_(self, _cmd, anAnchorPoint)
{ with(self)
{
    anAnchorPoint = { x:anAnchorPoint.x, y:anAnchorPoint.y };
    anAnchorPoint.x = MIN(1.0, MAX(0.0, anAnchorPoint.x));
    anAnchorPoint.y = MIN(1.0, MAX(0.0, anAnchorPoint.y));
    if (CGPointEqualToPoint(_anchorPoint, anAnchorPoint))
        return;
    _anchorPoint = anAnchorPoint;
    if (_hasSublayerTransform)
        _CALayerUpdateSublayerTransformForSublayers(self);
    if (_owningView)
        _position = CGPointMake((_bounds.size.width) * _anchorPoint.x, (_bounds.size.height) * _anchorPoint.y);
    _CALayerRecalculateGeometry(self, CALayerGeometryAnchorPointMask);
}
},["void","CGPoint"]), new objj_method(sel_getUid("anchorPoint"), function $CALayer__anchorPoint(self, _cmd)
{ with(self)
{
    return _anchorPoint;
}
},["CGPoint"]), new objj_method(sel_getUid("setAffineTransform:"), function $CALayer__setAffineTransform_(self, _cmd, anAffineTransform)
{ with(self)
{
    if (CGAffineTransformEqualToTransform(_affineTransform, anAffineTransform))
        return;
    _affineTransform = { a:anAffineTransform.a, b:anAffineTransform.b, c:anAffineTransform.c, d:anAffineTransform.d, tx:anAffineTransform.tx, ty:anAffineTransform.ty };
    _CALayerRecalculateGeometry(self, CALayerGeometryAffineTransformMask);
}
},["void","CGAffineTransform"]), new objj_method(sel_getUid("affineTransform"), function $CALayer__affineTransform(self, _cmd)
{ with(self)
{
    return _affineTransform;
}
},["CGAffineTransform"]), new objj_method(sel_getUid("setSublayerTransform:"), function $CALayer__setSublayerTransform_(self, _cmd, anAffineTransform)
{ with(self)
{
    if (CGAffineTransformEqualToTransform(_sublayerTransform, anAffineTransform))
        return;
    var hadSublayerTransform = _hasSublayerTransform;
    _sublayerTransform = { a:anAffineTransform.a, b:anAffineTransform.b, c:anAffineTransform.c, d:anAffineTransform.d, tx:anAffineTransform.tx, ty:anAffineTransform.ty };
    _hasSublayerTransform = !(_sublayerTransform.a == 1 && _sublayerTransform.b == 0 && _sublayerTransform.c == 0 && _sublayerTransform.d == 1 && _sublayerTransform.tx == 0 && _sublayerTransform.ty == 0);
    if (_hasSublayerTransform)
    {
        _CALayerUpdateSublayerTransformForSublayers(self);
        var index = _sublayers.length;
        while (index--)
            _CALayerRecalculateGeometry(_sublayers[index], CALayerGeometryParentSublayerTransformMask);
    }
}
},["void","CGAffineTransform"]), new objj_method(sel_getUid("sublayerTransform"), function $CALayer__sublayerTransform(self, _cmd)
{ with(self)
{
    return _sublayerTransform;
}
},["CGAffineTransform"]), new objj_method(sel_getUid("transformToLayer"), function $CALayer__transformToLayer(self, _cmd)
{ with(self)
{
    return _transformToLayer;
}
},["CGAffineTransform"]), new objj_method(sel_getUid("setFrame:"), function $CALayer__setFrame_(self, _cmd, aFrame)
{ with(self)
{
    alert("FIXME IMPLEMENT");
}
},["void","CGRect"]), new objj_method(sel_getUid("frame"), function $CALayer__frame(self, _cmd)
{ with(self)
{
    if (!_frame)
        _frame = objj_msgSend(self, "convertRect:toLayer:", _bounds, _superlayer);
    return _frame;
}
},["CGRect"]), new objj_method(sel_getUid("backingStoreFrame"), function $CALayer__backingStoreFrame(self, _cmd)
{ with(self)
{
    return _backingStoreFrame;
}
},["CGRect"]), new objj_method(sel_getUid("setBackingStoreFrame:"), function $CALayer__setBackingStoreFrame_(self, _cmd, aFrame)
{ with(self)
{
    _hasCustomBackingStoreFrame = (aFrame != nil);
    if (aFrame == nil)
        aFrame = CGRectMakeCopy(_standardBackingStoreFrame);
    else
    {
        if (_superlayer)
        {
            aFrame = objj_msgSend(_superlayer, "convertRect:toLayer:", aFrame, nil);
            var bounds = objj_msgSend(_superlayer, "bounds"),
                frame = objj_msgSend(_superlayer, "convertRect:toLayer:", bounds, nil);
            aFrame.origin.x -= (frame.origin.x);
            aFrame.origin.y -= (frame.origin.y);
        }
        else
            aFrame = CGRectMakeCopy(aFrame);
    }
    if (!CGPointEqualToPoint(_backingStoreFrame.origin, aFrame.origin))
        objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerFrameOriginUpdateMask);
    if (!CGSizeEqualToSize(_backingStoreFrame.size, aFrame.size))
        objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerFrameSizeUpdateMask);
    _backingStoreFrame = aFrame;
}
},["void","CGRect"]), new objj_method(sel_getUid("contents"), function $CALayer__contents(self, _cmd)
{ with(self)
{
    return _contents;
}
},["CGImage"]), new objj_method(sel_getUid("setContents:"), function $CALayer__setContents_(self, _cmd, contents)
{ with(self)
{
    if (_contents == contents)
        return;
    _contents = contents;
    objj_msgSend(self, "composite");
}
},["void","CGImage"]), new objj_method(sel_getUid("composite"), function $CALayer__composite(self, _cmd)
{ with(self)
{
    if (USE_BUFFER && !_contents || !_context)
        return;
    CGContextClearRect(_context, { origin: { x:0.0, y:0.0 }, size: { width:(_backingStoreFrame.size.width), height:(_backingStoreFrame.size.height) } });
    var transform = _transformFromLayer;
    if (_superlayer)
    {
        var superlayerTransform = _CALayerGetTransform(_superlayer, nil),
            superlayerOrigin = CGPointApplyAffineTransform(_superlayer._bounds.origin, superlayerTransform);
        transform = CGAffineTransformConcat(transform, superlayerTransform);
        transform.tx -= superlayerOrigin.x;
        transform.ty -= superlayerOrigin.y;
    }
    transform.tx -= (_backingStoreFrame.origin.x);
    transform.ty -= (_backingStoreFrame.origin.y);
    CGContextSaveGState(_context);
    CGContextConcatCTM(_context, transform);
    if (USE_BUFFER)
    {
        _context.drawImage(_contents.buffer, (_bounds.origin.x), (_bounds.origin.y));
    }
    else
        objj_msgSend(self, "drawInContext:", _context);
    CGContextRestoreGState(_context);
}
},["void"]), new objj_method(sel_getUid("display"), function $CALayer__display(self, _cmd)
{ with(self)
{
    if (!_context)
    {
        _context = CGBitmapGraphicsContextCreate();
        _DOMContentsElement = _context.DOMElement;
        _DOMContentsElement.style.zIndex = -100;
        _DOMContentsElement.style.overflow = "hidden";
        _DOMContentsElement.style.position = "absolute";
        _DOMContentsElement.style.visibility = "visible";
        _DOMContentsElement.width = ROUND((_backingStoreFrame.size.width));
        _DOMContentsElement.height = ROUND((_backingStoreFrame.size.height));
        _DOMContentsElement.style.top = "0px";
        _DOMContentsElement.style.left = "0px";
        _DOMContentsElement.style.width = ROUND((_backingStoreFrame.size.width)) + "px";
        _DOMContentsElement.style.height = ROUND((_backingStoreFrame.size.height)) + "px";
        _DOMElement.appendChild(_DOMContentsElement);
    }
    if (USE_BUFFER)
    {
        if (_delegateRespondsToDisplayLayerSelector)
            return objj_msgSend(_delegate, "displayInLayer:", self);
        if ((_backingStoreFrame.size.width) == 0.0 || (_backingStoreFrame.size.height) == 0.0)
            return;
        if (!_contents)
            _contents = CABackingStoreCreate();
        CABackingStoreSetSize(_contents, _bounds.size);
        objj_msgSend(self, "drawInContext:", CABackingStoreGetContext(_contents));
    }
    objj_msgSend(self, "composite");
}
},["void"]), new objj_method(sel_getUid("drawInContext:"), function $CALayer__drawInContext_(self, _cmd, aContext)
{ with(self)
{
    if (_backgroundColor)
    {
        CGContextSetFillColor(aContext, _backgroundColor);
        CGContextFillRect(aContext, _bounds);
    }
    if (_delegateRespondsToDrawLayerInContextSelector)
        objj_msgSend(_delegate, "drawLayer:inContext:", self, aContext);
}
},["void","CGContext"]), new objj_method(sel_getUid("opacity"), function $CALayer__opacity(self, _cmd)
{ with(self)
{
    return _opacity;
}
},["float"]), new objj_method(sel_getUid("setOpacity:"), function $CALayer__setOpacity_(self, _cmd, anOpacity)
{ with(self)
{
    if (_opacity == anOpacity)
        return;
    _opacity = anOpacity;
    _DOMElement.style.opacity = anOpacity;
    _DOMElement.style.filter = "alpha(opacity=" + anOpacity * 100 + ")";
}
},["void","float"]), new objj_method(sel_getUid("setHidden:"), function $CALayer__setHidden_(self, _cmd, isHidden)
{ with(self)
{
    _isHidden = isHidden;
    _DOMElement.style.display = isHidden ? "none" : "block";
}
},["void","BOOL"]), new objj_method(sel_getUid("hidden"), function $CALayer__hidden(self, _cmd)
{ with(self)
{
    return _isHidden;
}
},["BOOL"]), new objj_method(sel_getUid("isHidden"), function $CALayer__isHidden(self, _cmd)
{ with(self)
{
    return _isHidden;
}
},["BOOL"]), new objj_method(sel_getUid("setMasksToBounds:"), function $CALayer__setMasksToBounds_(self, _cmd, masksToBounds)
{ with(self)
{
    if (_masksToBounds == masksToBounds)
        return;
    _masksToBounds = masksToBounds;
    _DOMElement.style.overflow = _masksToBounds ? "hidden" : "visible";
}
},["void","BOOL"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CALayer__setBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    _backgroundColor = aColor;
    objj_msgSend(self, "setNeedsDisplay");
}
},["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CALayer__backgroundColor(self, _cmd)
{ with(self)
{
    return _backgroundColor;
}
},["CPColor"]), new objj_method(sel_getUid("sublayers"), function $CALayer__sublayers(self, _cmd)
{ with(self)
{
    return _sublayers;
}
},["CPArray"]), new objj_method(sel_getUid("superlayer"), function $CALayer__superlayer(self, _cmd)
{ with(self)
{
    return _superlayer;
}
},["CALayer"]), new objj_method(sel_getUid("addSublayer:"), function $CALayer__addSublayer_(self, _cmd, aLayer)
{ with(self)
{
    objj_msgSend(self, "insertSublayer:atIndex:", aLayer, _sublayers.length);
    return;
    if (_DOMContentsElement && aLayer._zPosition > _DOMContentsElement.style.zIndex) _DOMContentsElement.style.zIndex -= 100.0;;
    objj_msgSend(_sublayers, "addObject:", aLayer);
    _DOMElement.appendChild(aLayer._DOMElement);
}
},["void","CALayer"]), new objj_method(sel_getUid("removeFromSuperlayer"), function $CALayer__removeFromSuperlayer(self, _cmd)
{ with(self)
{
    if (_owningView)
        objj_msgSend(_owningView, "setLayer:", nil);
    if (!_superlayer)
        return;
    _superlayer._DOMElement.removeChild(_DOMElement);
    objj_msgSend(_superlayer._sublayers, "removeObject:", self);
    _superlayer = nil;
}
},["void"]), new objj_method(sel_getUid("insertSublayer:atIndex:"), function $CALayer__insertSublayer_atIndex_(self, _cmd, aLayer, anIndex)
{ with(self)
{
    if (!aLayer)
        return;
    var superlayer = objj_msgSend(aLayer, "superlayer");
    if (superlayer == self)
    {
        var index = objj_msgSend(_sublayers, "indexOfObjectIdenticalTo:", aLayer);
        if (index == anIndex)
            return;
        objj_msgSend(_sublayers, "removeObjectAtIndex:", index);
        if (index < anIndex)
            --anIndex;
    }
    else if (superlayer != nil)
        objj_msgSend(aLayer, "removeFromSuperlayer");
    if (_DOMContentsElement && aLayer._zPosition > _DOMContentsElement.style.zIndex) _DOMContentsElement.style.zIndex -= 100.0;;
    objj_msgSend(_sublayers, "insertObject:atIndex:", aLayer, anIndex);
    if (anIndex >= _sublayers.length - 1)
        _DOMElement.appendChild(aLayer._DOMElement);
    else
        _DOMElement.insertBefore(aLayer._DOMElement, _sublayers[anIndex + 1]._DOMElement);
    aLayer._superlayer = self;
    if (self != superlayer)
        _CALayerRecalculateGeometry(aLayer, 0xFFFFFFF);
}
},["void","CALayer","unsigned"]), new objj_method(sel_getUid("insertSublayer:below:"), function $CALayer__insertSublayer_below_(self, _cmd, aLayer, aSublayer)
{ with(self)
{
    var index = aSublayer ? objj_msgSend(_sublayers, "indexOfObjectIdenticalTo:", aSublayer) : 0;
    objj_msgSend(self, "insertSublayer:atIndex:", aLayer, index == CPNotFound ? _sublayers.length : index);
}
},["void","CALayer","CALayer"]), new objj_method(sel_getUid("insertSublayer:above:"), function $CALayer__insertSublayer_above_(self, _cmd, aLayer, aSublayer)
{ with(self)
{
    var index = aSublayer ? objj_msgSend(_sublayers, "indexOfObjectIdenticalTo:", aSublayer) : _sublayers.length;
    if (index == CPNotFound)
        objj_msgSend(CPException, "raise:reason:", "CALayerNotFoundException", "aSublayer is not a sublayer of this layer");
    objj_msgSend(_sublayers, "insertObject:atIndex:", aLayer, index == CPNotFound ? _sublayers.length : index + 1);
}
},["void","CALayer","CALayer"]), new objj_method(sel_getUid("replaceSublayer:with:"), function $CALayer__replaceSublayer_with_(self, _cmd, aSublayer, aLayer)
{ with(self)
{
    if (aSublayer == aLayer)
        return;
    if (aSublayer._superlayer != self)
    {
        alert("EXCEPTION");
        return;
    }
    if (_DOMContentsElement && aLayer._zPosition > _DOMContentsElement.style.zIndex) _DOMContentsElement.style.zIndex -= 100.0;;
    objj_msgSend(_sublayers, "replaceObjectAtIndex:withObject:", objj_msgSend(_sublayers, "indexOfObjectIdenticalTo:", aSublayer), aLayer);
    _DOMElement.replaceChild(aSublayer._DOMElement, aLayer._DOMElement);
}
},["void","CALayer","CALayer"]), new objj_method(sel_getUid("registerRunLoopUpdateWithMask:"), function $CALayer__registerRunLoopUpdateWithMask_(self, _cmd, anUpdateMask)
{ with(self)
{
    if (CALayerRegisteredRunLoopUpdates == nil)
    {
        CALayerRegisteredRunLoopUpdates = {};
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("runLoopUpdateLayers"), CALayer, nil, 0, [CPDefaultRunLoopMode]);
    }
    _runLoopUpdateMask |= anUpdateMask;
    CALayerRegisteredRunLoopUpdates[objj_msgSend(self, "UID")] = self;
}
},["void","unsigned"]), new objj_method(sel_getUid("setNeedsComposite"), function $CALayer__setNeedsComposite(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerCompositeUpdateMask);
}
},["void"]), new objj_method(sel_getUid("setNeedsDisplay"), function $CALayer__setNeedsDisplay(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerDisplayUpdateMask);
}
},["void"]), new objj_method(sel_getUid("setNeedsDisplayOnBoundsChange:"), function $CALayer__setNeedsDisplayOnBoundsChange_(self, _cmd, needsDisplayOnBoundsChange)
{ with(self)
{
    _needsDisplayOnBoundsChange = needsDisplayOnBoundsChange;
}
},["void","BOOL"]), new objj_method(sel_getUid("needsDisplayOnBoundsChange"), function $CALayer__needsDisplayOnBoundsChange(self, _cmd)
{ with(self)
{
    return _needsDisplayOnBoundsChange;
}
},["BOOL"]), new objj_method(sel_getUid("setNeedsDisplayInRect:"), function $CALayer__setNeedsDisplayInRect_(self, _cmd, aRect)
{ with(self)
{
    _dirtyRect = aRect;
    objj_msgSend(self, "display");
}
},["void","CGRect"]), new objj_method(sel_getUid("convertPoint:fromLayer:"), function $CALayer__convertPoint_fromLayer_(self, _cmd, aPoint, aLayer)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CALayerGetTransform(aLayer, self));
}
},["CGPoint","CGPoint","CALayer"]), new objj_method(sel_getUid("convertPoint:toLayer:"), function $CALayer__convertPoint_toLayer_(self, _cmd, aPoint, aLayer)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CALayerGetTransform(self, aLayer));
}
},["CGPoint","CGPoint","CALayer"]), new objj_method(sel_getUid("convertRect:fromLayer:"), function $CALayer__convertRect_fromLayer_(self, _cmd, aRect, aLayer)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CALayerGetTransform(aLayer, self));
}
},["CGRect","CGRect","CALayer"]), new objj_method(sel_getUid("convertRect:toLayer:"), function $CALayer__convertRect_toLayer_(self, _cmd, aRect, aLayer)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CALayerGetTransform(self, aLayer));
}
},["CGRect","CGRect","CALayer"]), new objj_method(sel_getUid("containsPoint:"), function $CALayer__containsPoint_(self, _cmd, aPoint)
{ with(self)
{
    return (aPoint.x >= (_bounds.origin.x) && aPoint.y >= (_bounds.origin.y) && aPoint.x < (_bounds.origin.x + _bounds.size.width) && aPoint.y < (_bounds.origin.y + _bounds.size.height));
}
},["BOOL","CGPoint"]), new objj_method(sel_getUid("hitTest:"), function $CALayer__hitTest_(self, _cmd, aPoint)
{ with(self)
{
    if (_isHidden)
        return nil;
    var point = CGPointApplyAffineTransform(aPoint, _transformToLayer);
    if (!(point.x >= (_bounds.origin.x) && point.y >= (_bounds.origin.y) && point.x < (_bounds.origin.x + _bounds.size.width) && point.y < (_bounds.origin.y + _bounds.size.height)))
        return nil;
    var layer = nil,
        index = _sublayers.length;
    while (index--)
        if (layer = objj_msgSend(_sublayers[index], "hitTest:", point))
            return layer;
    return self;
}
},["CALayer","CGPoint"]), new objj_method(sel_getUid("setDelegate:"), function $CALayer__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate == aDelegate)
        return;
    _delegate = aDelegate;
    _delegateRespondsToDisplayLayerSelector = objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("displayLayer:"));
    _delegateRespondsToDrawLayerInContextSelector = objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("drawLayer:inContext:"));
    if (_delegateRespondsToDisplayLayerSelector || _delegateRespondsToDrawLayerInContextSelector)
        objj_msgSend(self, "setNeedsDisplay");
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $CALayer__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("_setOwningView:"), function $CALayer___setOwningView_(self, _cmd, anOwningView)
{ with(self)
{
    _owningView = anOwningView;
    if (_owningView)
    {
        _owningView = anOwningView;
        _bounds.size = CGSizeMakeCopy(objj_msgSend(_owningView, "bounds").size);
        _position = CGPointMake((_bounds.size.width) * _anchorPoint.x, (_bounds.size.height) * _anchorPoint.y);
    }
    _CALayerRecalculateGeometry(self, CALayerGeometryPositionMask | CALayerGeometryBoundsMask);
}
},["void","CPView"]), new objj_method(sel_getUid("_owningViewBoundsChanged"), function $CALayer___owningViewBoundsChanged(self, _cmd)
{ with(self)
{
    _bounds.size = CGSizeMakeCopy(objj_msgSend(_owningView, "bounds").size);
    _position = CGPointMake((_bounds.size.width) * _anchorPoint.x, (_bounds.size.height) * _anchorPoint.y);
    _CALayerRecalculateGeometry(self, CALayerGeometryPositionMask | CALayerGeometryBoundsMask);
}
},["void"]), new objj_method(sel_getUid("_update"), function $CALayer___update(self, _cmd)
{ with(self)
{
    window.loop = true;
    var mask = _runLoopUpdateMask;
    if (mask & CALayerDOMUpdateMask)
        _CALayerUpdateDOM(self, mask);
    if (mask & CALayerDisplayUpdateMask)
        objj_msgSend(self, "display");
    else if (mask & CALayerFrameSizeUpdateMask || mask & CALayerCompositeUpdateMask)
        objj_msgSend(self, "composite");
    _runLoopUpdateMask = 0;
    window.loop = false;
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("layer"), function $CALayer__layer(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "init");
}
},["CALayer"]), new objj_method(sel_getUid("runLoopUpdateLayers"), function $CALayer__runLoopUpdateLayers(self, _cmd)
{ with(self)
{if (window.oops) {alert(window.latest); objj_debug_print_backtrace();}
    window.loop = true;
    for (UID in CALayerRegisteredRunLoopUpdates)
    {
        var layer = CALayerRegisteredRunLoopUpdates[UID],
            mask = layer._runLoopUpdateMask;
        if (mask & CALayerDOMUpdateMask)
            _CALayerUpdateDOM(layer, mask);
        if (mask & CALayerDisplayUpdateMask)
            objj_msgSend(layer, "display");
        else if (mask & CALayerFrameSizeUpdateMask || mask & CALayerCompositeUpdateMask)
            objj_msgSend(layer, "composite");
        layer._runLoopUpdateMask = 0;
    }
    window.loop= false;
    CALayerRegisteredRunLoopUpdates = nil;
}
},["void"])]);
}
_CALayerUpdateSublayerTransformForSublayers= function(aLayer)
{
    var bounds = aLayer._bounds,
        anchorPoint = aLayer._anchorPoint,
        translateX = (bounds.size.width) * anchorPoint.x,
        translateY = (bounds.size.height) * anchorPoint.y;
    aLayer._sublayerTransformForSublayers = CGAffineTransformConcat(
        CGAffineTransformMakeTranslation(-translateX, -translateY),
        CGAffineTransformConcat(aLayer._sublayerTransform,
        CGAffineTransformMakeTranslation(translateX, translateY)));
}
_CALayerUpdateDOM= function(aLayer, aMask)
{
    var DOMElementStyle = aLayer._DOMElement.style;
    if (aMask & CALayerZPositionUpdateMask)
        DOMElementStyle.zIndex = aLayer._zPosition;
    var frame = aLayer._backingStoreFrame;
    if (aMask & CALayerFrameOriginUpdateMask)
    {
        DOMElementStyle.top = ROUND((frame.origin.y)) + "px";
        DOMElementStyle.left = ROUND((frame.origin.x)) + "px";
    }
    if (aMask & CALayerFrameSizeUpdateMask)
    {
        var width = MAX(0.0, ROUND((frame.size.width))),
            height = MAX(0.0, ROUND((frame.size.height))),
            DOMContentsElement = aLayer._DOMContentsElement;
        DOMElementStyle.width = width + "px";
        DOMElementStyle.height = height + "px";
        if (DOMContentsElement)
        {
            DOMContentsElement.width = width;
            DOMContentsElement.height = height;
            DOMContentsElement.style.width = width + "px";
            DOMContentsElement.style.height = height + "px";
        }
    }
}
_CALayerRecalculateGeometry= function(aLayer, aGeometryChange)
{
    var bounds = aLayer._bounds,
        superlayer = aLayer._superlayer,
        width = (bounds.size.width),
        height = (bounds.size.height),
        position = aLayer._position,
        anchorPoint = aLayer._anchorPoint,
        affineTransform = aLayer._affineTransform,
        backingStoreFrameSize = { width:aLayer._backingStoreFrame.width, height:aLayer._backingStoreFrame.height },
        hasCustomBackingStoreFrame = aLayer._hasCustomBackingStoreFrame;
    aLayer._transformFromLayer = CGAffineTransformConcat(
        CGAffineTransformMakeTranslation(-width * anchorPoint.x - (aLayer._bounds.origin.x), -height * anchorPoint.y - (aLayer._bounds.origin.y)),
        CGAffineTransformConcat(affineTransform,
        CGAffineTransformMakeTranslation(position.x, position.y)));
    if (superlayer && superlayer._hasSublayerTransform)
    {
        var tx = aLayer._transformFromLayer.tx * superlayer._sublayerTransformForSublayers.a + aLayer._transformFromLayer.ty * superlayer._sublayerTransformForSublayers.c + superlayer._sublayerTransformForSublayers.tx;aLayer._transformFromLayer.ty = aLayer._transformFromLayer.tx * superlayer._sublayerTransformForSublayers.b + aLayer._transformFromLayer.ty * superlayer._sublayerTransformForSublayers.d + superlayer._sublayerTransformForSublayers.ty;aLayer._transformFromLayer.tx = tx;var a = aLayer._transformFromLayer.a * superlayer._sublayerTransformForSublayers.a + aLayer._transformFromLayer.b * superlayer._sublayerTransformForSublayers.c, b = aLayer._transformFromLayer.a * superlayer._sublayerTransformForSublayers.b + aLayer._transformFromLayer.b * superlayer._sublayerTransformForSublayers.d, c = aLayer._transformFromLayer.c * superlayer._sublayerTransformForSublayers.a + aLayer._transformFromLayer.d * superlayer._sublayerTransformForSublayers.c;aLayer._transformFromLayer.d = aLayer._transformFromLayer.c * superlayer._sublayerTransformForSublayers.b + aLayer._transformFromLayer.d * superlayer._sublayerTransformForSublayers.d;aLayer._transformFromLayer.a = a;aLayer._transformFromLayer.b = b;aLayer._transformFromLayer.c = c;;
    }
    aLayer._transformToLayer = CGAffineTransformInvert(aLayer._transformFromLayer);
    aLayer._frame = nil;
    aLayer._standardBackingStoreFrame = objj_msgSend(aLayer, "convertRect:toLayer:", bounds, nil);
    if (superlayer)
    {
        var bounds = objj_msgSend(superlayer, "bounds"),
            frame = objj_msgSend(superlayer, "convertRect:toLayer:", bounds, nil);
        aLayer._standardBackingStoreFrame.origin.x -= (frame.origin.x);
        aLayer._standardBackingStoreFrame.origin.y -= (frame.origin.y);
    }
    var origin = aLayer._standardBackingStoreFrame.origin,
        size = aLayer._standardBackingStoreFrame.size;
    origin.x = FLOOR(origin.x);
    origin.y = FLOOR(origin.y);
    size.width = CEIL(size.width) + 1.0;
    size.height = CEIL(size.height) + 1.0;
    if (!hasCustomBackingStoreFrame)
    {
        var backingStoreFrame = CGRectMakeCopy(aLayer._standardBackingStoreFrame);
        if (ROUND((backingStoreFrame.origin.x)) != ROUND((aLayer._backingStoreFrame.origin.x)) ||
            ROUND((backingStoreFrame.origin.y)) != ROUND((aLayer._backingStoreFrame.origin.y)))
            objj_msgSend(aLayer, "registerRunLoopUpdateWithMask:", CALayerFrameOriginUpdateMask);
        if (((backingStoreFrame.size.width) != ROUND((aLayer._backingStoreFrame.size.width)) ||
            (backingStoreFrame.size.height) != ROUND((aLayer._backingStoreFrame.size.height))))
            objj_msgSend(aLayer, "registerRunLoopUpdateWithMask:", CALayerFrameSizeUpdateMask);
        aLayer._backingStoreFrame = backingStoreFrame;
    }
    if (aGeometryChange & CALayerGeometryBoundsMask && aLayer._needsDisplayOnBoundsChange)
        objj_msgSend(aLayer, "setNeedsDisplay");
    else if (hasCustomBackingStoreFrame || (aGeometryChange & ~(CALayerGeometryPositionMask | CALayerGeometryAnchorPointMask)))
        objj_msgSend(aLayer, "setNeedsComposite");
    var sublayers = aLayer._sublayers,
        index = 0,
        count = sublayers.length;
    for (; index < count; ++index)
        _CALayerRecalculateGeometry(sublayers[index], aGeometryChange);
}
_CALayerGetTransform= function(fromLayer, toLayer)
{
    var transform = CGAffineTransformMakeIdentity();
    if (fromLayer)
    {
        var layer = fromLayer;
        while (layer && layer != toLayer)
        {
            var transformFromLayer = layer._transformFromLayer;
            var tx = transform.tx * transformFromLayer.a + transform.ty * transformFromLayer.c + transformFromLayer.tx;transform.ty = transform.tx * transformFromLayer.b + transform.ty * transformFromLayer.d + transformFromLayer.ty;transform.tx = tx;var a = transform.a * transformFromLayer.a + transform.b * transformFromLayer.c, b = transform.a * transformFromLayer.b + transform.b * transformFromLayer.d, c = transform.c * transformFromLayer.a + transform.d * transformFromLayer.c;transform.d = transform.c * transformFromLayer.b + transform.d * transformFromLayer.d;transform.a = a;transform.b = b;transform.c = c;;
            layer = layer._superlayer;
        }
        if (layer == toLayer)
            return transform;
    }
    var layers = [],
        layer = toLayer;
    while (layer)
    {
        layers.push(layer);
        layer = layer._superlayer;
    }
    var index = layers.length;
    while (index--)
    {
        var transformToLayer = layers[index]._transformToLayer;
        var tx = transform.tx * transformToLayer.a + transform.ty * transformToLayer.c + transformToLayer.tx;transform.ty = transform.tx * transformToLayer.b + transform.ty * transformToLayer.d + transformToLayer.ty;transform.tx = tx;var a = transform.a * transformToLayer.a + transform.b * transformToLayer.c, b = transform.a * transformToLayer.b + transform.b * transformToLayer.d, c = transform.c * transformToLayer.a + transform.d * transformToLayer.c;transform.d = transform.c * transformToLayer.b + transform.d * transformToLayer.d;transform.a = a;transform.b = b;transform.c = c;;
    }
    return transform;
}

