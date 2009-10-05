I;15;AppKit/CPView.jI;16;AppKit/CPEvent.jI;21;AppKit/CPPasteboard.jI;20;AppKit/CPImageView.jc;17167;
CPDragOperationNone = 0,
CPDragOperationCopy = 1 << 1,
CPDragOperationLink = 1 << 1,
CPDragOperationGeneric = 1 << 2,
CPDragOperationPrivate = 1 << 3,
CPDragOperationMove = 1 << 4,
CPDragOperationDelete = 1 << 5,
CPDragOperationEvery = -1;
var CPDragServerPreviousEvent = nil,
CPDragServerAutoscrollInterval = nil;
var CPSharedDragServer = nil;
var CPDragServerSource = nil;
var CPDragServerDraggingInfo = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPDraggingInfo"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("draggingPasteboard"), function $CPDraggingInfo__draggingPasteboard(self, _cmd)
{ with(self)
{
    if (objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        return objj_msgSend(_CPDOMDataTransferPasteboard, "DOMDataTransferPasteboard");
    return objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingPasteboard");
}
},["CPPasteboard"]), new objj_method(sel_getUid("draggingSource"), function $CPDraggingInfo__draggingSource(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingSource");
}
},["id"]), new objj_method(sel_getUid("draggingLocation"), function $CPDraggingInfo__draggingLocation(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingLocation");
}
},["CPPoint"]), new objj_method(sel_getUid("draggingDestinationWindow"), function $CPDraggingInfo__draggingDestinationWindow(self, _cmd)
{ with(self)
{
    return (objj_msgSend(objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingDestination"), "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingDestination") : objj_msgSend(objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggingDestination"), "window"));
}
},["CPWindow"]), new objj_method(sel_getUid("draggedImage"), function $CPDraggingInfo__draggedImage(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "draggedView"), "image");
}
},["CPImage"]), new objj_method(sel_getUid("draggedImageLocation"), function $CPDraggingInfo__draggedImageLocation(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "draggedViewLocation");
}
},["CGPoint"]), new objj_method(sel_getUid("draggedView"), function $CPDraggingInfo__draggedView(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "draggedView");
}
},["CPView"]), new objj_method(sel_getUid("draggedViewLocation"), function $CPDraggingInfo__draggedViewLocation(self, _cmd)
{ with(self)
{
    var dragServer = objj_msgSend(CPDragServer, "sharedDragServer");
    return objj_msgSend((objj_msgSend(objj_msgSend(dragServer, "draggingDestination"), "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? objj_msgSend(dragServer, "draggingDestination") : objj_msgSend(objj_msgSend(dragServer, "draggingDestination"), "window")), "convertPlatformWindowToBase:", objj_msgSend(objj_msgSend(dragServer, "draggedView"), "frame").origin);
}
},["CGPoint"])]);
}
var CPDraggingSource_draggedImage_movedTo_ = 1 << 0,
    CPDraggingSource_draggedImage_endAt_operation_ = 1 << 1,
    CPDraggingSource_draggedView_movedTo_ = 1 << 2,
    CPDraggingSource_draggedView_endedAt_operation_ = 1 << 3;
{var the_class = objj_allocateClassPair(CPObject, "CPDragServer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isDragging"), new objj_ivar("_draggedWindow"), new objj_ivar("_draggedView"), new objj_ivar("_imageView"), new objj_ivar("_isDraggingImage"), new objj_ivar("_draggingOffset"), new objj_ivar("_draggingPasteboard"), new objj_ivar("_draggingSource"), new objj_ivar("_implementedDraggingSourceMethods"), new objj_ivar("_draggingLocation"), new objj_ivar("_draggingDestination")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("isDragging"), function $CPDragServer__isDragging(self, _cmd)
{ with(self)
{
return _isDragging;
}
},["id"]),
new objj_method(sel_getUid("draggedWindow"), function $CPDragServer__draggedWindow(self, _cmd)
{ with(self)
{
return _draggedWindow;
}
},["id"]),
new objj_method(sel_getUid("draggedView"), function $CPDragServer__draggedView(self, _cmd)
{ with(self)
{
return _draggedView;
}
},["id"]),
new objj_method(sel_getUid("draggingOffset"), function $CPDragServer__draggingOffset(self, _cmd)
{ with(self)
{
return _draggingOffset;
}
},["id"]),
new objj_method(sel_getUid("draggingPasteboard"), function $CPDragServer__draggingPasteboard(self, _cmd)
{ with(self)
{
return _draggingPasteboard;
}
},["id"]),
new objj_method(sel_getUid("draggingSource"), function $CPDragServer__draggingSource(self, _cmd)
{ with(self)
{
return _draggingSource;
}
},["id"]), new objj_method(sel_getUid("init"), function $CPDragServer__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _draggedWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } }, CPBorderlessWindowMask);
        objj_msgSend(_draggedWindow, "setLevel:", CPDraggingWindowLevel);
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("draggingLocation"), function $CPDragServer__draggingLocation(self, _cmd)
{ with(self)
{
    return _draggingLocation
}
},["CGPoint"]), new objj_method(sel_getUid("draggingStartedInPlatformWindow:globalLocation:"), function $CPDragServer__draggingStartedInPlatformWindow_globalLocation_(self, _cmd, aPlatformWindow, aLocation)
{ with(self)
{
    if (_isDraggingImage)
    {
        if (objj_msgSend(_draggingSource, "respondsToSelector:", sel_getUid("draggedImage:beganAt:")))
            objj_msgSend(_draggingSource, "draggedImage:beganAt:", objj_msgSend(_draggedView, "image"), aLocation);
    }
    else
    {
        if (objj_msgSend(_draggingSource, "respondsToSelector:", sel_getUid("draggedView:beganAt:")))
            objj_msgSend(_draggingSource, "draggedView:beganAt:", _draggedView, aLocation);
    }
    if (!objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        objj_msgSend(_draggedWindow, "orderFront:", self);
}
},["void","CPPlatformWindow","CGPoint"]), new objj_method(sel_getUid("draggingSourceUpdatedWithGlobalLocation:"), function $CPDragServer__draggingSourceUpdatedWithGlobalLocation_(self, _cmd, aGlobalLocation)
{ with(self)
{
    if (!objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        objj_msgSend(_draggedWindow, "setFrameOrigin:", { x:aGlobalLocation.x - _draggingOffset.width, y:aGlobalLocation.y - _draggingOffset.height });
    if (_implementedDraggingSourceMethods & CPDraggingSource_draggedImage_movedTo_)
        objj_msgSend(_draggingSource, "draggedImage:movedTo:", objj_msgSend(_draggedView, "image"), aGlobalLocation);
    else if (_implementedDraggingSourceMethods & CPDraggingSource_draggedView_movedTo_)
        objj_msgSend(_draggingSource, "draggedView:movedTo:", _draggedView, aGlobalLocation);
}
},["void","CGPoint"]), new objj_method(sel_getUid("draggingUpdatedInPlatformWindow:location:"), function $CPDragServer__draggingUpdatedInPlatformWindow_location_(self, _cmd, aPlatformWindow, aLocation)
{ with(self)
{
    var dragOperation = CPDragOperationCopy;
    var draggingDestination = objj_msgSend(aPlatformWindow, "_dragHitTest:pasteboard:", aLocation, objj_msgSend(CPDragServerDraggingInfo, "draggingPasteboard"));
    if (draggingDestination)
        _draggingLocation = objj_msgSend((objj_msgSend(draggingDestination, "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? draggingDestination : objj_msgSend(draggingDestination, "window")), "convertPlatformWindowToBase:", aLocation);
    if(draggingDestination !== _draggingDestination)
    {
        if (_draggingDestination && objj_msgSend(_draggingDestination, "respondsToSelector:", sel_getUid("draggingExited:")))
            objj_msgSend(_draggingDestination, "draggingExited:", CPDragServerDraggingInfo);
        _draggingDestination = draggingDestination;
        if (_draggingDestination && objj_msgSend(_draggingDestination, "respondsToSelector:", sel_getUid("draggingEntered:")))
            dragOperation = objj_msgSend(_draggingDestination, "draggingEntered:", CPDragServerDraggingInfo);
    }
    else if (_draggingDestination && objj_msgSend(_draggingDestination, "respondsToSelector:", sel_getUid("draggingUpdated:")))
        dragOperation = objj_msgSend(_draggingDestination, "draggingUpdated:", CPDragServerDraggingInfo);
    if (!_draggingDestination)
        dragOperation = CPDragOperationNone;
    return dragOperation;
}
},["CPDragOperation","CPPlatformWindow","CGPoint"]), new objj_method(sel_getUid("draggingEndedInPlatformWindow:globalLocation:"), function $CPDragServer__draggingEndedInPlatformWindow_globalLocation_(self, _cmd, aPlatformWindow, aLocation)
{ with(self)
{
    objj_msgSend(_draggedView, "removeFromSuperview");
    if (!objj_msgSend(CPPlatform, "supportsDragAndDrop"))
        objj_msgSend(_draggedWindow, "orderOut:", self);
    if (_implementedDraggingSourceMethods & CPDraggingSource_draggedImage_endAt_operation_)
        objj_msgSend(_draggingSource, "draggedImage:endedAt:operation:", objj_msgSend(_draggedView, "image"), aLocation, NO);
    else if (_implementedDraggingSourceMethods & CPDraggingSource_draggedView_endedAt_operation_)
        objj_msgSend(_draggingSource, "draggedView:endedAt:operation:", _draggedView, aLocation, NO);
    _isDragging = NO;
}
},["void","CPPlatformWindow","CGPoint"]), new objj_method(sel_getUid("performDragOperationInPlatformWindow:"), function $CPDragServer__performDragOperationInPlatformWindow_(self, _cmd, aPlatformWindow)
{ with(self)
{
    if (_draggingDestination &&
        (!objj_msgSend(_draggingDestination, "respondsToSelector:", sel_getUid("prepareForDragOperation:")) || objj_msgSend(_draggingDestination, "prepareForDragOperation:", CPDragServerDraggingInfo)) &&
        (!objj_msgSend(_draggingDestination, "respondsToSelector:", sel_getUid("performDragOperation:")) || objj_msgSend(_draggingDestination, "performDragOperation:", CPDragServerDraggingInfo)) &&
        objj_msgSend(_draggingDestination, "respondsToSelector:", sel_getUid("concludeDragOperation:")))
        objj_msgSend(_draggingDestination, "concludeDragOperation:", CPDragServerDraggingInfo);
}
},["void","CPPlatformWindow"]), new objj_method(sel_getUid("dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function $CPDragServer__dragView_fromWindow_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, aWindow, viewLocation, mouseOffset, mouseDownEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    _isDragging = YES;
    _draggedView = aView;
    _draggingPasteboard = aPasteboard || objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard);
    _draggingSource = aSourceObject;
    _draggingDestination = nil;
    var mouseDownWindow = objj_msgSend(mouseDownEvent, "window"),
        mouseDownEventLocation = objj_msgSend(mouseDownEvent, "locationInWindow");
    if (mouseDownEventLocation)
    {
        if (mouseDownWindow)
            mouseDownEventLocation = objj_msgSend(mouseDownWindow, "convertBaseToGlobal:", mouseDownEventLocation);
        _draggingOffset = { width:mouseDownEventLocation.x - viewLocation.x, height:mouseDownEventLocation.y - viewLocation.y };
    }
    else
        _draggingOffset = _CGSizeMakerZero();
    if (objj_msgSend(CPPlatform, "isBrowser"))
        objj_msgSend(_draggedWindow, "setPlatformWindow:", objj_msgSend(aWindow, "platformWindow"));
    objj_msgSend(aView, "setFrameOrigin:", { x:0.0, y:0.0 });
    var mouseLocation = objj_msgSend(CPEvent, "mouseLocation");
    objj_msgSend(_draggedWindow, "setFrameOrigin:", { x:mouseLocation.x - _draggingOffset.width, y:mouseLocation.y - _draggingOffset.height });
    objj_msgSend(_draggedWindow, "setFrameSize:", objj_msgSend(aView, "frame").size);
    objj_msgSend(objj_msgSend(_draggedWindow, "contentView"), "addSubview:", aView);
    _implementedDraggingSourceMethods = 0;
    if (_draggedView === _imageView)
    {
        if (objj_msgSend(_draggingSource, "respondsToSelector:", sel_getUid("draggedImage:movedTo:")))
            _implementedDraggingSourceMethods |= CPDraggingSource_draggedImage_movedTo_;
        if (objj_msgSend(_draggingSource, "respondsToSelector:", sel_getUid("draggedImage:endAt:operation:")))
            _implementedDraggingSourceMethods |= CPDraggingSource_draggedImage_endAt_operation_;
    }
    else
    {
        if (objj_msgSend(_draggingSource, "respondsToSelector:", sel_getUid("draggedView:movedTo:")))
            _implementedDraggingSourceMethods |= CPDraggingSource_draggedView_movedTo_;
        if (objj_msgSend(_draggingSource, "respondsToSelector:", sel_getUid("draggedView:endedAt:operation:")))
            _implementedDraggingSourceMethods |= CPDraggingSource_draggedView_endedAt_operation_;
    }
    if (!objj_msgSend(CPPlatform, "supportsDragAndDrop"))
    {
        objj_msgSend(self, "draggingStartedInPlatformWindow:globalLocation:", objj_msgSend(aWindow, "platformWindow"), mouseLocation);
        objj_msgSend(self, "trackDragging:", mouseDownEvent);
    }
}
},["void","CPView","CPWindow","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function $CPDragServer__dragImage_fromWindow_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    _isDraggingImage = YES;
    var imageSize = objj_msgSend(anImage, "size");
    if (!_imageView)
        _imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:imageSize.width, height:imageSize.height } });
    objj_msgSend(_imageView, "setImage:", anImage);
    objj_msgSend(self, "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", _imageView, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
},["void","CPImage","CPWindow","CGPoint","CGSize","CPEvent","CPPasteboard","id","BOOL"]), new objj_method(sel_getUid("trackDragging:"), function $CPDragServer__trackDragging_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        platformWindow = objj_msgSend(_draggedWindow, "platformWindow"),
        platformWindowLocation = objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToPlatformWindow:", objj_msgSend(anEvent, "locationInWindow"));
    if (type === CPLeftMouseUp)
    {
        objj_msgSend(self, "performDragOperationInPlatformWindow:", platformWindow);
        objj_msgSend(self, "draggingEndedInPlatformWindow:globalLocation:", platformWindow, platformWindowLocation);
        return;
    }
    objj_msgSend(self, "draggingSourceUpdatedWithGlobalLocation:", platformWindowLocation);
    objj_msgSend(self, "draggingUpdatedInPlatformWindow:location:", platformWindow, platformWindowLocation);
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackDragging:"), CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, 0, NO);
}
},["void","CPEvent"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPDragServer__initialize(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(CPDragServer, "class"))
        return;
    CPDragServerDraggingInfo = objj_msgSend(objj_msgSend(CPDraggingInfo, "alloc"), "init");
}
},["void"]), new objj_method(sel_getUid("sharedDragServer"), function $CPDragServer__sharedDragServer(self, _cmd)
{ with(self)
{
    if (!CPSharedDragServer)
        CPSharedDragServer = objj_msgSend(objj_msgSend(CPDragServer, "alloc"), "init");
    return CPSharedDragServer;
}
},["CPDragServer"])]);
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_dragHitTest:pasteboard:"), function $CPWindow___dragHitTest_pasteboard_(self, _cmd, aPoint, aPasteboard)
{ with(self)
{
    if (!_inclusiveRegisteredDraggedTypes)
        return nil;
    var adjustedPoint = objj_msgSend(self, "convertPlatformWindowToBase:", aPoint),
        hitView = objj_msgSend(_windowView, "hitTest:", adjustedPoint);
    while (hitView && !objj_msgSend(aPasteboard, "availableTypeFromArray:", objj_msgSend(hitView, "registeredDraggedTypes")))
        hitView = objj_msgSend(hitView, "superview");
    if (hitView)
        return hitView;
    if (objj_msgSend(aPasteboard, "availableTypeFromArray:", objj_msgSend(self, "registeredDraggedTypes")))
        return self;
    return nil;
}
},["id","CGPoint","CPPasteboard"])]);
}

