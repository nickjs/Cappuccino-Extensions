I;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jc;11901;
CPScaleProportionally = 0;
CPScaleToFit = 1;
CPScaleNone = 2;
var CPImageViewShadowBackgroundColor = nil;
var LEFT_SHADOW_INSET = 3.0,
    RIGHT_SHADOW_INSET = 3.0,
    TOP_SHADOW_INSET = 3.0,
    BOTTOM_SHADOW_INSET = 5.0,
    VERTICAL_SHADOW_INSET = TOP_SHADOW_INSET + BOTTOM_SHADOW_INSET,
    HORIZONTAL_SHADOW_INSET = LEFT_SHADOW_INSET + RIGHT_SHADOW_INSET;
{var the_class = objj_allocateClassPair(CPControl, "CPImageView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_DOMImageElement"), new objj_ivar("_hasShadow"), new objj_ivar("_shadowView"), new objj_ivar("_isEditable"), new objj_ivar("_imageRect")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPImageView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _DOMImageElement = document.createElement("img");
        _DOMImageElement.style.position = "absolute";
        _DOMImageElement.style.left = "0px";
        _DOMImageElement.style.top = "0px";
        if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        {
            _DOMImageElement.setAttribute("draggable", "true");
            _DOMImageElement.style["-khtml-user-drag"] = "element";
        }
        _DOMElement.appendChild(_DOMImageElement);
        _DOMImageElement.style.visibility = "hidden";
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("image"), function $CPImageView__image(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "objectValue");
}
},["CPImage"]), new objj_method(sel_getUid("setImage:"), function $CPImageView__setImage_(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", anImage);
}
},["void","CPImage"]), new objj_method(sel_getUid("setObjectValue:"), function $CPImageView__setObjectValue_(self, _cmd, anImage)
{ with(self)
{
    var oldImage = objj_msgSend(self, "objectValue");
    if (oldImage === anImage)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setObjectValue:", anImage);
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (oldImage)
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPImageDidLoadNotification, oldImage);
    var newImage = objj_msgSend(self, "objectValue");
    _DOMImageElement.src = newImage ? objj_msgSend(newImage, "filename") : "";
    var size = objj_msgSend(newImage, "size");
    if (size && size.width === -1 && size.height === -1)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, newImage);
        _DOMImageElement.width = 0;
        _DOMImageElement.height = 0;
        objj_msgSend(_shadowView, "setHidden:", YES);
    }
    else
    {
        objj_msgSend(self, "hideOrDisplayContents");
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
}
},["void","CPImage"]), new objj_method(sel_getUid("imageDidLoad:"), function $CPImageView__imageDidLoad_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "hideOrDisplayContents");
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPNotification"]), new objj_method(sel_getUid("hasShadow"), function $CPImageView__hasShadow(self, _cmd)
{ with(self)
{
    return _hasShadow;
}
},["BOOL"]), new objj_method(sel_getUid("setHasShadow:"), function $CPImageView__setHasShadow_(self, _cmd, shouldHaveShadow)
{ with(self)
{
    if (_hasShadow == shouldHaveShadow)
        return;
    _hasShadow = shouldHaveShadow;
    if (_hasShadow)
    {
        _shadowView = objj_msgSend(objj_msgSend(CPShadowView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self, "addSubview:", _shadowView);
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    else
    {
        objj_msgSend(_shadowView, "removeFromSuperview");
        _shadowView = nil;
    }
    objj_msgSend(self, "hideOrDisplayContents");
}
},["void","BOOL"]), new objj_method(sel_getUid("setImageScaling:"), function $CPImageView__setImageScaling_(self, _cmd, anImageScaling)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setImageScaling:", anImageScaling);
    if (objj_msgSend(self, "currentValueForThemeAttribute:", "image-scaling") === CPScaleToFit)
    {
        if (NULL) var ____p = _CGPointApplyAffineTransform(CGPointMake(0.0, 0.0), NULL); else var ____p = { x:0.0, y:0.0 }; _DOMImageElement.style.left = ROUND(____p.x) + "px";_DOMImageElement.style.top = ROUND(____p.y) + "px";;
    }
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPImageScaling"]), new objj_method(sel_getUid("hideOrDisplayContents"), function $CPImageView__hideOrDisplayContents(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "image"))
    {
        _DOMImageElement.style.visibility = "hidden";
        objj_msgSend(_shadowView, "setHidden:", YES);
    }
    else
    {
        _DOMImageElement.style.visibility = "visible";
        objj_msgSend(_shadowView, "setHidden:", NO);
    }
}
},["void"]), new objj_method(sel_getUid("imageRect"), function $CPImageView__imageRect(self, _cmd)
{ with(self)
{
    return _imageRect;
}
},["CGRect"]), new objj_method(sel_getUid("layoutSubviews"), function $CPImageView__layoutSubviews(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "image"))
        return;
    var bounds = objj_msgSend(self, "bounds"),
        image = objj_msgSend(self, "image"),
        imageScaling = objj_msgSend(self, "currentValueForThemeAttribute:", "image-scaling"),
        x = 0.0,
        y = 0.0,
        insetWidth = (_hasShadow ? HORIZONTAL_SHADOW_INSET : 0.0),
        insetHeight = (_hasShadow ? VERTICAL_SHADOW_INSET : 0.0),
        boundsWidth = (bounds.size.width),
        boundsHeight = (bounds.size.height),
        width = boundsWidth - insetWidth,
        height = boundsHeight - insetHeight;
    if (imageScaling === CPScaleToFit)
    {
        _DOMImageElement.width = ROUND(width);
        _DOMImageElement.height = ROUND(height);
    }
    else
    {
        var size = objj_msgSend(image, "size");
        if (size.width == -1 && size.height == -1)
            return;
        if (imageScaling === CPScaleProportionally)
        {
            if (width >= size.width && height >= size.height)
            {
                width = size.width;
                height = size.height;
            }
            else
            {
                var imageRatio = size.width / size.height,
                    viewRatio = width / height;
                if (viewRatio > imageRatio)
                    width = height * imageRatio;
                else
                    height = width / imageRatio;
            }
            _DOMImageElement.width = ROUND(width);
            _DOMImageElement.height = ROUND(height);
        }
        else
        {
            width = size.width;
            height = size.height;
        }
        if (imageScaling == CPScaleNone)
        {
            _DOMImageElement.width = ROUND(size.width);
            _DOMImageElement.height = ROUND(size.height);
        }
        var x = (boundsWidth - width) / 2.0,
            y = (boundsHeight - height) / 2.0;
        if (NULL) var ____p = _CGPointApplyAffineTransform(CGPointMake(x, y), NULL); else var ____p = { x:x, y:y }; _DOMImageElement.style.left = ROUND(____p.x) + "px";_DOMImageElement.style.top = ROUND(____p.y) + "px";;
    }
    _imageRect = { origin: { x:x, y:y }, size: { width:width, height:height } };
    if (_hasShadow)
        objj_msgSend(_shadowView, "setFrame:", { origin: { x:x - LEFT_SHADOW_INSET, y:y - TOP_SHADOW_INSET }, size: { width:width + insetWidth, height:height + insetHeight } });
}
},["void"]), new objj_method(sel_getUid("mouseDown:"), function $CPImageView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDown:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("setEditable:"), function $CPImageView__setEditable_(self, _cmd, shouldBeEditable)
{ with(self)
{
    if (_isEditable === shouldBeEditable)
        return;
    _isEditable = shouldBeEditable;
    if (_isEditable)
        objj_msgSend(self, "registerForDraggedTypes:", [CPImagesPboardType]);
    else
    {
        var draggedTypes = objj_msgSend(self, "registeredDraggedTypes");
        objj_msgSend(self, "unregisterDraggedTypes");
        objj_msgSend(draggedTypes, "removeObjectIdenticalTo:", CPImagesPboardType);
        objj_msgSend(self, "registerForDraggedTypes:", draggedTypes);
    }
}
},["void","BOOL"]), new objj_method(sel_getUid("isEditable"), function $CPImageView__isEditable(self, _cmd)
{ with(self)
{
    return _isEditable;
}
},["BOOL"]), new objj_method(sel_getUid("performDragOperation:"), function $CPImageView__performDragOperation_(self, _cmd, aSender)
{ with(self)
{
    var images = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(objj_msgSend(aSender, "draggingPasteboard"), "dataForType:", CPImagesPboardType));
    if (objj_msgSend(images, "count"))
        objj_msgSend(self, "setImage:", images[0]);
}
},["void","CPDraggingInfo"])]);
}
var CPImageViewImageKey = "CPImageViewImageKey",
    CPImageViewImageScalingKey = "CPImageViewImageScalingKey",
    CPImageViewHasShadowKey = "CPImageViewHasShadowKey",
    CPImageViewIsEditableKey = "CPImageViewIsEditableKey";
{
var the_class = objj_getClass("CPImageView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPImageView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPImageView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    _DOMImageElement = document.createElement("img");
    _DOMImageElement.style.position = "absolute";
    _DOMImageElement.style.left = "0px";
    _DOMImageElement.style.top = "0px";
    _DOMImageElement.style.visibility = "hidden";
    if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
    {
        _DOMImageElement.setAttribute("draggable", "true");
        _DOMImageElement.style["-khtml-user-drag"] = "element";
    }
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _DOMElement.appendChild(_DOMImageElement);
        objj_msgSend(self, "setHasShadow:", objj_msgSend(aCoder, "decodeBoolForKey:", CPImageViewHasShadowKey));
        if (objj_msgSend(aCoder, "decodeBoolForKey:", CPImageViewIsEditableKey) || NO)
            objj_msgSend(self, "setEditable:", YES);
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPImageView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (_shadowView)
    {
        var actualSubviews = _subviews;
        _subviews = objj_msgSend(_subviews, "copy");
        objj_msgSend(_subviews, "removeObjectIdenticalTo:", _shadowView);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    if (_shadowView)
        _subviews = actualSubviews;
    objj_msgSend(aCoder, "encodeBool:forKey:", _hasShadow, CPImageViewHasShadowKey);
    if (_isEditable)
        objj_msgSend(aCoder, "encodeBool:forKey:", _isEditable, CPImageViewIsEditableKey);
}
},["void","CPCoder"])]);
}

