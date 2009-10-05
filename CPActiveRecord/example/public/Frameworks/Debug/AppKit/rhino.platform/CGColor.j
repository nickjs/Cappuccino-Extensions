i;14;CGColorSpace.jc;3028;
var CFTypeGlobalCount = 0;
CFHashCode= function(aCFObject)
{
    if (!aCFObject.hash)
        aCFObject.hash = ++CFTypeGlobalCount;
    return aCFObject;
}
kCGColorWhite = "kCGColorWhite";
kCGColorBlack = "kCGColorBlack";
kCGColorClear = "kCGColorClear";
var _CGColorMap = { };
CGColorGetConstantColor= function(aColorName)
{
    alert("FIX ME");
}
CGColorRetain= function(aColor)
{
    return aColor;
}
CGColorRelease= function()
{
}
CGColorCreate= function(aColorSpace, components)
{
    if (!aColorSpace || !components)
        return NULL;
    var components = components.slice();
    CGColorSpaceStandardizeComponents(aColorSpace, components);
    var UID = CFHashCode(aColorSpace) + components.join("");
    if (_CGColorMap[UID])
        return _CGColorMap[UID];
    return _CGColorMap[UID] = { colorspace:aColorSpace, pattern:NULL, components:components };
}
CGColorCreateCopy= function(aColor)
{
    return aColor;
}
CGColorCreateGenericGray= function(gray, alpha)
{
    return CGColorCreate(0, [gray, alpha]);
}
CGColorCreateGenericRGB= function(red, green, blue, alpha)
{
    return CGColorCreate(0, [red, green, blue, alpha]);
}
CGColorCreateGenericCMYK= function(cyan, magenta, yellow, black, alpha)
{
    return CGColorCreate(0, [cyan, magenta, yellow, black, alpha]);
}
CGColorCreateCopyWithAlpha= function(aColor, anAlpha)
{
    var components = aColor.components;
    if (!aColor || anAlpha == components[components.length - 1])
     return aColor;
    if (aColor.pattern)
        var copy = CGColorCreateWithPattern(aColor.colorspace, aColor.pattern, components);
    else
        var copy = CGColorCreate(aColor.colorspace, components);
    copy.components[components.length - 1] = anAlpha;
    return copy;
}
CGColorCreateWithPattern= function(aColorSpace, aPattern, components)
{
    if (!aColorSpace || !aPattern || !components)
        return NULL;
    return { colorspace:aColorSpace, pattern:aPattern, components:components.slice() };
}
CGColorEqualToColor= function(lhs, rhs)
{
    if (lhs == rhs)
        return true;
    if (!lhs || !rhs)
        return false;
    var lhsComponents = lhs.components,
        rhsComponents = rhs.components,
        lhsComponentCount = lhsComponents.length;
    if (lhsComponentCount != rhsComponents.length)
        return false;
    while (lhsComponentCount--)
        if (lhsComponents[lhsComponentCount] != rhsComponents[lhsComponentCount])
            return false;
    if (lhs.pattern != rhs.pattern)
        return false;
    if (CGColorSpaceEqualToColorSpace(lhs.colorspace, rhs.colorspace))
        return false;
    return true;
}
CGColorGetAlpha= function(aColor)
{
    var components = aColor.components;
    return components[components.length - 1];
}
CGColorGetColorSpace= function(aColor)
{
    return aColor.colorspace;
}
CGColorGetComponents= function(aColor)
{
    return aColor.components;
}
CGColorGetNumberOfComponents= function(aColor)
{
    return aColor.components.length;
}
CGColorGetPattern= function(aColor)
{
    return aColor.pattern;
}

