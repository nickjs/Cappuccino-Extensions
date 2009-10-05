c;3864;var _CPFonts = {};
    _CPFontSystemFontFace = "Arial";
{var the_class = objj_allocateClassPair(CPObject, "CPFont"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_size"), new objj_ivar("_isBold"), new objj_ivar("_cssString")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithName:size:bold:"), function $CPFont___initWithName_size_bold_(self, _cmd, aName, aSize, isBold)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _name = aName;
        _size = aSize;
        _isBold = isBold;
        _cssString = (_isBold ? "bold " : "") + ROUND(aSize) + "px '" + aName + "'";
        _CPFonts[_cssString] = self;
    }
    return self;
}
},["id","CPString","float","BOOL"]), new objj_method(sel_getUid("size"), function $CPFont__size(self, _cmd)
{ with(self)
{
    return _size;
}
},["float"]), new objj_method(sel_getUid("cssString"), function $CPFont__cssString(self, _cmd)
{ with(self)
{
    return _cssString;
}
},["CPString"]), new objj_method(sel_getUid("familyName"), function $CPFont__familyName(self, _cmd)
{ with(self)
{
    return _name;
}
},["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("fontWithName:size:"), function $CPFont__fontWithName_size_(self, _cmd, aName, aSize)
{ with(self)
{
    return _CPFonts[(NO ? "bold " : "") + ROUND(aSize) + "px '" + aName + "'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", aName, aSize, NO);
}
},["CPFont","CPString","float"]), new objj_method(sel_getUid("boldFontWithName:size:"), function $CPFont__boldFontWithName_size_(self, _cmd, aName, aSize)
{ with(self)
{
    return _CPFonts[(YES ? "bold " : "") + ROUND(aSize) + "px '" + aName + "'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", aName, aSize, YES);
}
},["CPFont","CPString","float"]), new objj_method(sel_getUid("systemFontOfSize:"), function $CPFont__systemFontOfSize_(self, _cmd, aSize)
{ with(self)
{
    return _CPFonts[(NO ? "bold " : "") + ROUND(aSize) + "px '" + _CPFontSystemFontFace + "'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", _CPFontSystemFontFace, aSize, NO);
}
},["CPFont","CPSize"]), new objj_method(sel_getUid("boldSystemFontOfSize:"), function $CPFont__boldSystemFontOfSize_(self, _cmd, aSize)
{ with(self)
{
    return _CPFonts[(YES ? "bold " : "") + ROUND(aSize) + "px '" + _CPFontSystemFontFace + "'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", _CPFontSystemFontFace, aSize, YES);
}
},["CPFont","CPSize"])]);
}
var CPFontNameKey = "CPFontNameKey",
    CPFontSizeKey = "CPFontSizeKey",
    CPFontIsBoldKey = "CPFontIsBoldKey";
{
var the_class = objj_getClass("CPFont")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPFont\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPFont__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "_initWithName:size:bold:", objj_msgSend(aCoder, "decodeObjectForKey:", CPFontNameKey), objj_msgSend(aCoder, "decodeFloatForKey:", CPFontSizeKey), objj_msgSend(aCoder, "decodeBoolForKey:", CPFontIsBoldKey));
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPFont__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _name, CPFontNameKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _size, CPFontSizeKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isBold, CPFontIsBoldKey);
}
},["void","CPCoder"])]);
}

