i;12;CGGeometry.ji;17;CPCompatibility.jc;841;
CABackingStoreGetContext= function(aBackingStore)
{
    return aBackingStore.context;
}
if (CPFeatureIsCompatible(CPHTMLCanvasFeature))
{
CABackingStoreCreate = function()
{
    var DOMElement = document.createElement("canvas");
    DOMElement.style.position = "absolute";
    return { context:DOMElement.getContext("2d"), buffer:DOMElement, _image:DOMElement };
}
CABackingStoreSetSize = function(aBackingStore, aSize)
{
    var buffer = aBackingStore.buffer;
    buffer.width = aSize.width;
    buffer.height = aSize.height;
    buffer.style.width = aSize.width + "px";;
    buffer.style.height = aSize.height + "px";;
}
}
else
{
CABackingStoreCreate = function()
{
    var context = CGBitmapGraphicsContextCreate();
    context.buffer = "";
    return { context:context };
}
CABackingStoreSetSize = function(aBackingStore, aSize)
{
}
}

