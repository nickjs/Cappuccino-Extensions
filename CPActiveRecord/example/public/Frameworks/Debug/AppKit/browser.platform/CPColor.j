I;21;Foundation/CPObject.ji;9;CGColor.ji;17;CPCompatibility.ji;9;CPImage.jc;22892;
var _redComponent = 0,
    _greenComponent = 1,
    _blueComponent = 2,
    _alphaCompnent = 3;
var _hueComponent = 0,
    _saturationComponent = 1,
    _brightnessComponent = 2;
var cachedBlackColor,
    cachedRedColor,
    cachedGreenColor,
    cachedBlueColor,
    cachedYellowColor,
    cachedGrayColor,
    cachedLightGrayColor,
    cachedDarkGrayColor,
    cachedWhiteColor,
    cachedBrownColor,
    cachedCyanColor,
    cachedMagentaColor,
    cachedOrangeColor,
    cachedPurpleColor,
    cachedShadowColor,
    cachedClearColor;
{var the_class = objj_allocateClassPair(CPObject, "CPColor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_components"), new objj_ivar("_patternImage"), new objj_ivar("_cssString")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithCSSString:"), function $CPColor___initWithCSSString_(self, _cmd, aString)
{ with(self)
{
    if(aString.indexOf("rgb") == CPNotFound)
        return nil;
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    var startingIndex = aString.indexOf("(");
    var parts = aString.substring(startingIndex+1).split(',');
    _components = [
        parseInt(parts[0], 10) / 255.0,
        parseInt(parts[1], 10) / 255.0,
        parseInt(parts[2], 10) / 255.0,
        parts[3] ? parseInt(parts[3], 10) / 255.0 : 1.0
    ]
    _cssString = aString;
    return self;
}
},["id","CPString"]), new objj_method(sel_getUid("_initWithRGBA:"), function $CPColor___initWithRGBA_(self, _cmd, components)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _components = components;
  if (!CPFeatureIsCompatible(CPCSSRGBAFeature) && _components[3] != 1.0 && window.Base64 && window.CRC32)
  {
   var bytes = [0x89,0x50,0x4e,0x47,0xd,0xa,0x1a,0xa,0x0,0x0,0x0,0xd,0x49,0x48,0x44,0x52,0x0,0x0,0x0,0x1,0x0,0x0,0x0,0x1,0x8,0x3,0x0,0x0,0x0,0x28,0xcb,0x34,0xbb,0x0,0x0,0x3,0x0,0x50,0x4c,0x54,0x45,0xff,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x17,0x89,0x99,0x55,0x0,0x0,0x0,0x1,0x74,0x52,0x4e,0x53,0x0,0x40,0xe6,0xd8,0x66,0x0,0x0,0x0,0x10,0x49,0x44,0x41,0x54,0x78,0xda,0x62,0x60,0x0,0x0,0x0,0x0,0xff,0xff,0x3,0x0,0x0,0x2,0x0,0x1,0x24,0x7f,0x24,0xf1,0x0,0x0,0x0,0x0,0x49,0x45,0x4e,0x44,0xae,0x42,0x60,0x82,0xff];
   var r_off = 41;
   var g_off = 42;
   var b_off = 43;
   var a_off = 821;
   var plte_crc_off = 809;
   var trns_crc_off = 822;
   var plte_type_off = 37;
   var trns_type_off = 817;
   bytes[r_off] = Math.round(_components[0]*255);
   bytes[g_off] = Math.round(_components[1]*255);
   bytes[b_off] = Math.round(_components[2]*255);
   bytes[a_off] = Math.round(_components[3]*255);
   var new_plte_crc = integerToBytes(CRC32.getCRC(bytes, plte_type_off, 4+768), 4);
   var new_trns_crc = integerToBytes(CRC32.getCRC(bytes, trns_type_off, 4+1), 4);
   for (var i = 0; i < 4; i++)
   {
    bytes[plte_crc_off+i] = new_plte_crc[i];
    bytes[trns_crc_off+i] = new_trns_crc[i];
   }
   var base64image = Base64.encode(bytes);
   _cssString = "url(\"data:image/png;base64," + base64image + "\")";
  }
  else
  {
         var hasAlpha = CPFeatureIsCompatible(CPCSSRGBAFeature) && _components[3] != 1.0;
         _cssString = (hasAlpha ? "rgba(" : "rgb(") +
             parseInt(_components[0] * 255.0) + ", " +
             parseInt(_components[1] * 255.0) + ", " +
             parseInt(_components[2] * 255.0) +
             (hasAlpha ? (", " + _components[3]) : "") + ")";
  }
    }
    return self;
}
},["id","CPArray"]), new objj_method(sel_getUid("_initWithPatternImage:"), function $CPColor___initWithPatternImage_(self, _cmd, anImage)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _patternImage = anImage;
        _cssString = "url(\"" + objj_msgSend(_patternImage, "filename") + "\")";
    }
    return self;
}
},["id","CPImage"]), new objj_method(sel_getUid("patternImage"), function $CPColor__patternImage(self, _cmd)
{ with(self)
{
    return _patternImage;
}
},["CPImage"]), new objj_method(sel_getUid("alphaComponent"), function $CPColor__alphaComponent(self, _cmd)
{ with(self)
{
    return _components[3];
}
},["float"]), new objj_method(sel_getUid("blueComponent"), function $CPColor__blueComponent(self, _cmd)
{ with(self)
{
    return _components[2];
}
},["float"]), new objj_method(sel_getUid("greenComponent"), function $CPColor__greenComponent(self, _cmd)
{ with(self)
{
    return _components[1];
}
},["float"]), new objj_method(sel_getUid("redComponent"), function $CPColor__redComponent(self, _cmd)
{ with(self)
{
    return _components[0];
}
},["float"]), new objj_method(sel_getUid("components"), function $CPColor__components(self, _cmd)
{ with(self)
{
    return _components;
}
},["CPArray"]), new objj_method(sel_getUid("colorWithAlphaComponent:"), function $CPColor__colorWithAlphaComponent_(self, _cmd, anAlphaComponent)
{ with(self)
{
    var components = _components.slice();
    components[components.length - 1] = anAlphaComponent;
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "_initWithRGBA:", components);
}
},["CPColor","float"]), new objj_method(sel_getUid("hsbComponents"), function $CPColor__hsbComponents(self, _cmd)
{ with(self)
{
    var red = ROUND(_components[_redComponent] * 255.0),
        green = ROUND(_components[_greenComponent] * 255.0),
        blue = ROUND(_components[_blueComponent] * 255.0);
    var max = MAX(red, green, blue),
        min = MIN(red, green, blue),
        delta = max - min;
    var brightness = max / 255.0,
        saturation = (max != 0) ? delta / max : 0;
    var hue;
    if(saturation == 0)
        hue = 0;
    else
    {
        var rr = (max - red) / delta;
        var gr = (max - green) / delta;
        var br = (max - blue) / delta;
        if (red == max)
            hue = br - gr;
        else if (green == max)
            hue = 2 + rr - br;
        else
            hue = 4 + gr - rr;
        hue /= 6;
        if (hue < 0)
            hue++;
    }
    return [
        ROUND(hue * 360.0),
        ROUND(saturation * 100.0),
        ROUND(brightness * 100.0)
    ];
}
},["CPArray"]), new objj_method(sel_getUid("cssString"), function $CPColor__cssString(self, _cmd)
{ with(self)
{
    return _cssString;
}
},["CPString"]), new objj_method(sel_getUid("hexString"), function $CPColor__hexString(self, _cmd)
{ with(self)
{
    return rgbToHex(objj_msgSend(self, "redComponent"), objj_msgSend(self, "greenComponent"), objj_msgSend(self, "blueComponent"))
}
},["CPString"]), new objj_method(sel_getUid("isEqual:"), function $CPColor__isEqual_(self, _cmd, aColor)
{ with(self)
{
    if (!aColor)
        return NO;
    if (aColor === self)
        return YES;
    return objj_msgSend(aColor, "isKindOfClass:", CPColor) && objj_msgSend(aColor, "cssString") === objj_msgSend(self, "cssString");
}
},["BOOL","CPColor"]), new objj_method(sel_getUid("description"), function $CPColor__description(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "description")+" "+objj_msgSend(self, "cssString");
}
},["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("colorWithRed:green:blue:alpha:"), function $CPColor__colorWithRed_green_blue_alpha_(self, _cmd, red, green, blue, alpha)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [red, green, blue, alpha]);
}
},["CPColor","float","float","float","float"]), new objj_method(sel_getUid("colorWithCalibratedRed:green:blue:alpha:"), function $CPColor__colorWithCalibratedRed_green_blue_alpha_(self, _cmd, red, green, blue, alpha)
{ with(self)
{
    return objj_msgSend(self, "colorWithRed:green:blue:alpha:", red, green, blue, alpha);
}
},["CPColor","float","float","float","float"]), new objj_method(sel_getUid("colorWithWhite:alpha:"), function $CPColor__colorWithWhite_alpha_(self, _cmd, white, alpha)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [white, white, white, alpha]);
}
},["CPColor","float","float"]), new objj_method(sel_getUid("colorWithCalibratedWhite:alpha:"), function $CPColor__colorWithCalibratedWhite_alpha_(self, _cmd, white, alpha)
{ with(self)
{
    return objj_msgSend(self, "colorWithWhite:alpha:", white, alpha);
}
},["CPColor","float","float"]), new objj_method(sel_getUid("colorWithHue:saturation:brightness:"), function $CPColor__colorWithHue_saturation_brightness_(self, _cmd, hue, saturation, brightness)
{ with(self)
{
    return objj_msgSend(self, "colorWithHue:saturation:brightness:alpha:", hue, saturation, brightness, 1.0);
}
},["CPColor","float","float","float"]), new objj_method(sel_getUid("colorWithHue:saturation:brightness:alpha:"), function $CPColor__colorWithHue_saturation_brightness_alpha_(self, _cmd, hue, saturation, brightness, alpha)
{ with(self)
{
    if(saturation === 0.0)
        return objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", brightness / 100.0, alpha);
    var f = hue % 60,
        p = (brightness * (100 - saturation)) / 10000,
        q = (brightness * (6000 - saturation * f)) / 600000,
        t = (brightness * (6000 - saturation * (60 -f))) / 600000,
        b = brightness / 100.0;
    switch(FLOOR(hue / 60))
    {
        case 0: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  b,  t,  p,  alpha);
        case 1: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  q,  b,  p,  alpha);
        case 2: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  p,  b,  t,  alpha);
        case 3: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  p,  q,  b,  alpha);
        case 4: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  t,  p,  b,  alpha);
        case 5: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  b,  p,  q,  alpha);
    }
}
},["CPColor","float","float","float","float"]), new objj_method(sel_getUid("colorWithHexString:"), function $CPColor__colorWithHexString_(self, _cmd, hex)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:",  hexToRGB(hex));
}
},["CPColor","string"]), new objj_method(sel_getUid("blackColor"), function $CPColor__blackColor(self, _cmd)
{ with(self)
{
    if (!cachedBlackColor)
        cachedBlackColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 0.0, 0.0, 1.0]);
    return cachedBlackColor;
}
},["CPColor"]), new objj_method(sel_getUid("blueColor"), function $CPColor__blueColor(self, _cmd)
{ with(self)
{
    if (!cachedBlueColor)
        cachedBlueColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 0.0, 1.0, 1.0]);
    return cachedBlueColor;
}
},["CPColor"]), new objj_method(sel_getUid("darkGrayColor"), function $CPColor__darkGrayColor(self, _cmd)
{ with(self)
{
    if (!cachedDarkGrayColor)
        cachedDarkGrayColor = objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 1.0 / 3.0, 1.0);
    return cachedDarkGrayColor;
}
},["CPColor"]), new objj_method(sel_getUid("grayColor"), function $CPColor__grayColor(self, _cmd)
{ with(self)
{
    if (!cachedGrayColor)
        cachedGrayColor = objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 0.5,  1.0);
    return cachedGrayColor;
}
},["CPColor"]), new objj_method(sel_getUid("greenColor"), function $CPColor__greenColor(self, _cmd)
{ with(self)
{
    if (!cachedGreenColor)
        cachedGreenColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 1.0, 0.0, 1.0]);
    return cachedGreenColor;
}
},["CPColor"]), new objj_method(sel_getUid("lightGrayColor"), function $CPColor__lightGrayColor(self, _cmd)
{ with(self)
{
    if (!cachedLightGrayColor)
        cachedLightGrayColor = objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 2.0 / 3.0, 1.0);
    return cachedLightGrayColor;
}
},["CPColor"]), new objj_method(sel_getUid("redColor"), function $CPColor__redColor(self, _cmd)
{ with(self)
{
    if (!cachedRedColor)
        cachedRedColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 0.0, 0.0, 1.0]);
    return cachedRedColor;
}
},["CPColor"]), new objj_method(sel_getUid("whiteColor"), function $CPColor__whiteColor(self, _cmd)
{ with(self)
{
    if (!cachedWhiteColor)
        cachedWhiteColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 1.0, 1.0, 1.0]);
    return cachedWhiteColor;
}
},["CPColor"]), new objj_method(sel_getUid("yellowColor"), function $CPColor__yellowColor(self, _cmd)
{ with(self)
{
    if (!cachedYellowColor)
        cachedYellowColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 1.0, 0.0, 1.0]);
    return cachedYellowColor;
}
},["CPColor"]), new objj_method(sel_getUid("brownColor"), function $CPColor__brownColor(self, _cmd)
{ with(self)
{
    if (!cachedBrownColor)
        cachedBrownColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.6, 0.4, 0.2, 1.0]);
    return cachedBrownColor;
}
},["CPColor"]), new objj_method(sel_getUid("cyanColor"), function $CPColor__cyanColor(self, _cmd)
{ with(self)
{
    if (!cachedCyanColor)
        cachedCyanColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 1.0, 1.0, 1.0]);
    return cachedCyanColor;
}
},["CPColor"]), new objj_method(sel_getUid("magentaColor"), function $CPColor__magentaColor(self, _cmd)
{ with(self)
{
    if (!cachedMagentaColor)
        cachedMagentaColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 0.0, 1.0, 1.0]);
    return cachedMagentaColor;
}
},["CPColor"]), new objj_method(sel_getUid("orangeColor"), function $CPColor__orangeColor(self, _cmd)
{ with(self)
{
    if (!cachedOrangeColor)
        cachedOrangeColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 0.5, 0.0, 1.0]);
    return cachedOrangeColor;
}
},["CPColor"]), new objj_method(sel_getUid("purpleColor"), function $CPColor__purpleColor(self, _cmd)
{ with(self)
{
    if (!cachedPurpleColor)
        cachedPurpleColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.5, 0.0, 0.5, 1.0]);
    return cachedPurpleColor;
}
},["CPColor"]), new objj_method(sel_getUid("shadowColor"), function $CPColor__shadowColor(self, _cmd)
{ with(self)
{
    if (!cachedShadowColor)
        cachedShadowColor = objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 0.0, 0.0, 1.0 / 3.0]);
    return cachedShadowColor;
}
},["CPColor"]), new objj_method(sel_getUid("clearColor"), function $CPColor__clearColor(self, _cmd)
{ with(self)
{
    if (!cachedClearColor)
        cachedClearColor = objj_msgSend(self, "colorWithCalibratedWhite:alpha:", 0.0, 0.0);
    return cachedClearColor;
}
},["CPColor"]), new objj_method(sel_getUid("alternateSelectedControlColor"), function $CPColor__alternateSelectedControlColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.22, 0.46, 0.84, 1.0]);
}
},["CPColor"]), new objj_method(sel_getUid("secondarySelectedControlColor"), function $CPColor__secondarySelectedControlColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.83, 0.83, 0.83, 1.0]);
}
},["CPColor"]), new objj_method(sel_getUid("colorWithPatternImage:"), function $CPColor__colorWithPatternImage_(self, _cmd, anImage)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithPatternImage:", anImage);
}
},["CPColor","CPImage"]), new objj_method(sel_getUid("colorWithCSSString:"), function $CPColor__colorWithCSSString_(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithCSSString:",  aString);
}
},["CPColor","CPString"])]);
}
{
var the_class = objj_getClass("CPColor")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPColor\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("set"), function $CPColor__set(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setFill");
    objj_msgSend(self, "setStroke");
}
},["void"]), new objj_method(sel_getUid("setFill"), function $CPColor__setFill(self, _cmd)
{ with(self)
{
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetFillColor(ctx, self);
}
},["void"]), new objj_method(sel_getUid("setStroke"), function $CPColor__setStroke(self, _cmd)
{ with(self)
{
    var ctx = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetStrokeColor(ctx, self);
}
},["void"])]);
}
{
var the_class = objj_getClass("CPColor")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPColor\""));
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("randomColor"), function $CPColor__randomColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", RAND(), RAND(), RAND(), 1.0);
}
},["CPColor"])]);
}
var CPColorComponentsKey = "CPColorComponentsKey",
    CPColorPatternImageKey = "CPColorPatternImageKey";
{
var the_class = objj_getClass("CPColor")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPColor\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPColor__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (objj_msgSend(aCoder, "containsValueForKey:", CPColorPatternImageKey))
        return objj_msgSend(self, "_initWithPatternImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPColorPatternImageKey));
    return objj_msgSend(self, "_initWithRGBA:", objj_msgSend(aCoder, "decodeObjectForKey:", CPColorComponentsKey));
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPColor__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (_patternImage)
        objj_msgSend(aCoder, "encodeObject:forKey:", _patternImage, CPColorPatternImageKey);
    else
        objj_msgSend(aCoder, "encodeObject:forKey:", _components, CPColorComponentsKey);
}
},["void","CPCoder"])]);
}
var hexCharacters = "0123456789ABCDEF";
hexToRGB= function(hex)
{
    if ( hex.length == 3 )
        hex = hex.charAt(0) + hex.charAt(0) + hex.charAt(1) + hex.charAt(1) + hex.charAt(2) + hex.charAt(2);
    if(hex.length != 6)
        return null;
    hex = hex.toUpperCase();
    for(var i=0; i<hex.length; i++)
        if(hexCharacters.indexOf(hex.charAt(i)) == -1)
            return null;
    var red = (hexCharacters.indexOf(hex.charAt(0)) * 16 + hexCharacters.indexOf(hex.charAt(1))) / 255.0;
    var green = (hexCharacters.indexOf(hex.charAt(2)) * 16 + hexCharacters.indexOf(hex.charAt(3))) / 255.0;
    var blue = (hexCharacters.indexOf(hex.charAt(4)) * 16 + hexCharacters.indexOf(hex.charAt(5))) / 255.0;
    return [red, green, blue, 1.0];
}
integerToBytes= function(integer, length) {
 if (!length)
  length = (integer == 0) ? 1 : Math.round((Math.log(integer)/Math.log(2))/8+0.5);
 var bytes = new Array(length);
 for (var i = length-1; i >= 0; i--) {
  bytes[i] = integer & 255;
  integer = integer >> 8
 }
 return bytes;
}
rgbToHex= function(r,g,b) {
    return byteToHex(r) + byteToHex(g) + byteToHex(b);
}
byteToHex= function(n) {
    if (!n || isNaN(n)) return "00";
    n = ROUND(MIN(255,MAX(0,256*n)));
    return hexCharacters.charAt((n - n % 16) / 16) +
            hexCharacters.charAt(n % 16);
}

