I;21;Foundation/CPString.ji;18;CPPlatformString.jc;863;
{
var the_class = objj_getClass("CPString")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPString\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("cssString"), function $CPString__cssString(self, _cmd)
{ with(self)
{
    return self;
}
},["CPString"]), new objj_method(sel_getUid("sizeWithFont:"), function $CPString__sizeWithFont_(self, _cmd, aFont)
{ with(self)
{
    return objj_msgSend(self, "sizeWithFont:inWidth:", aFont, NULL);
}
},["CGSize","CPFont"]), new objj_method(sel_getUid("sizeWithFont:inWidth:"), function $CPString__sizeWithFont_inWidth_(self, _cmd, aFont, aWidth)
{ with(self)
{
    return objj_msgSend(CPPlatformString, "sizeOfString:withFont:forWidth:", self, aFont, aWidth);
}
},["CGSize","CPFont","float"])]);
}

