i;9;CGColor.ji;14;CGColorSpace.jc;750;
kCGGradientDrawsBeforeStartLocation = 1 << 0;
kCGGradientDrawsAfterEndLocation = 1 << 1;
CGGradientCreateWithColorComponents= function(aColorSpace, components, locations, count)
{
    if (arguments["count"] == NULL)
        var count = locations.length;
    var colors = [];
    while (count--)
    {
        var offset = count * 4;
        colors[count] = CGColorCreate(aColorSpace, components.slice(offset, offset + 4));
    }
    return CGGradientCreateWithColors(aColorSpace, colors, locations);
}
CGGradientCreateWithColors= function(aColorSpace, colors, locations)
{
    return { colorspace:aColorSpace, colors:colors, locations:locations };
}
CGGradientRelease= function()
{
}
CGGradientRetain= function(aGradient)
{
    return aGradient;
}

