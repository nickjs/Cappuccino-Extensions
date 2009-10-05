I;21;Foundation/CPObject.jc;6283;
var ItemSizes = { },
    ThemedObjects = { },
    BackgroundColors = { },
    LightCheckersColor = nil,
    DarkCheckersColor = nil,
    WindowBackgroundColor = nil;
{var the_class = objj_allocateClassPair(CPObject, "BKThemeDescriptor"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("allThemeDescriptorClasses"), function(self, _cmd)
{ with(self)
{
    var themeDescriptorClasses = [];
    for (candidate in window)
    {
        var theClass = objj_getClass(candidate),
            theClassName = class_getName(theClass);
        if (theClassName === "BKThemeDescriptor")
            continue;
        var index = theClassName.indexOf("ThemeDescriptor");
        if ((index >= 0) && (index === theClassName.length - "ThemeDescriptor".length))
            themeDescriptorClasses.push(theClass);
    }
    objj_msgSend(themeDescriptorClasses, "sortUsingSelector:", sel_getUid("compare:"));
    return themeDescriptorClasses;
}
}), new objj_method(sel_getUid("lightCheckersColor"), function(self, _cmd)
{ with(self)
{
    if (!LightCheckersColor)
        LightCheckersColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(BKThemeDescriptor, "class")), "pathForResource:", "light-checkers.png"), CGSizeMake(12.0, 12.0)));
    return LightCheckersColor;
}
}), new objj_method(sel_getUid("darkCheckersColor"), function(self, _cmd)
{ with(self)
{
    if (!DarkCheckersColor)
        DarkCheckersColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(BKThemeDescriptor, "class")), "pathForResource:", "dark-checkers.png"), CGSizeMake(12.0, 12.0)));
    return DarkCheckersColor;
}
}), new objj_method(sel_getUid("windowBackgroundColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_CPStandardWindowView, "bodyBackgroundColor");
}
}), new objj_method(sel_getUid("defaultShowcaseBackgroundColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_CPStandardWindowView, "bodyBackgroundColor");
}
}), new objj_method(sel_getUid("showcaseBackgroundColor"), function(self, _cmd)
{ with(self)
{
    var className = objj_msgSend(self, "className");
    if (!BackgroundColors[className])
        BackgroundColors[className] = objj_msgSend(self, "defaultShowcaseBackgroundColor");
    return BackgroundColors[className];
}
}), new objj_method(sel_getUid("setShowcaseBackgroundColor:"), function(self, _cmd, aColor)
{ with(self)
{
    BackgroundColors[objj_msgSend(self, "className")] = aColor;
}
}), new objj_method(sel_getUid("itemSize"), function(self, _cmd)
{ with(self)
{
    var className = objj_msgSend(self, "className");
    if (!ItemSizes[className])
        objj_msgSend(self, "calculateThemedObjectTemplates");
    return CGSizeMakeCopy(ItemSizes[className]);
}
}), new objj_method(sel_getUid("themedObjectTemplates"), function(self, _cmd)
{ with(self)
{
    var className = objj_msgSend(self, "className");
    if (!ThemedObjects[className])
        objj_msgSend(self, "calculateThemedObjectTemplates");
    return ThemedObjects[className];
}
}), new objj_method(sel_getUid("calculateThemedObjectTemplates"), function(self, _cmd)
{ with(self)
{
    var templates = [],
        itemSize = CGSizeMake(0.0, 0.0),
        methods = class_copyMethodList(objj_msgSend(self, "class").isa),
        index = 0,
        count = objj_msgSend(methods, "count");
    for (; index < count; ++index)
    {
        var method = methods[index],
            selector = method_getName(method);
        if (selector.indexOf("themed") !== 0)
            continue;
        var impl = method_getImplementation(method),
            object = impl(self, selector);
        if (!object)
            continue;
        var template = objj_msgSend(objj_msgSend(BKThemedObjectTemplate, "alloc"), "init");
        objj_msgSend(template, "setValue:forKey:", object, "themedObject");
        objj_msgSend(template, "setValue:forKey:", BKLabelFromIdentifier(selector), "label");
        objj_msgSend(templates, "addObject:", template);
        if (objj_msgSend(object, "isKindOfClass:", objj_msgSend(CPView, "class")))
        {
            var size = objj_msgSend(object, "frame").size,
                labelWidth = objj_msgSend(objj_msgSend(template, "valueForKey:", "label"), "sizeWithFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12.0)).width + 20.0;
            if (size.width > itemSize.width)
                itemSize.width = size.width;
            if (labelWidth > itemSize.width)
                itemSize.width = labelWidth;
            if (size.height > itemSize.height)
                itemSize.height = size.height;
        }
    }
    var className = objj_msgSend(self, "className");
    ItemSizes[className] = itemSize;
    ThemedObjects[className] = templates;
}
}), new objj_method(sel_getUid("compare:"), function(self, _cmd, aThemeDescriptor)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "themeName"), "compare:", objj_msgSend(aThemeDescriptor, "themeName"));
}
})]);
}
BKLabelFromIdentifier= function(anIdentifier)
{
    var string = anIdentifier.substr("themed".length);
        index = 0,
        count = string.length,
        label = "",
        lastCapital = null,
        isLeadingCapital = YES;
    for (; index < count; ++index)
    {
        var character = string.charAt(index),
            isCapital = /^[A-Z]/.test(character);
        if (isCapital)
        {
            if (!isLeadingCapital)
            {
                if (lastCapital === null)
                    label += ' ' + character.toLowerCase();
                else
                    label += character;
            }
            lastCapital = character;
        }
        else
        {
            if (isLeadingCapital && lastCapital !== null)
                label += lastCapital;
            label += character;
            lastCapital = null;
            isLeadingCapital = NO;
        }
    }
    return label;
}

