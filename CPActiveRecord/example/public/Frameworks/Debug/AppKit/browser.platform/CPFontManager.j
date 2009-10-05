I;21;Foundation/CPObject.jI;15;AppKit/CPFont.jc;4905;
var CPSharedFontManager = nil,
    CPFontManagerFactory = Nil;
{var the_class = objj_allocateClassPair(CPObject, "CPFontManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_availableFonts")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("availableFonts"), function $CPFontManager__availableFonts(self, _cmd)
{ with(self)
{
    if (!_availableFonts)
    {
        _CPFontDetectSpan = document.createElement("span");
        _CPFontDetectSpan.fontSize = "24px";
        _CPFontDetectSpan.appendChild(document.createTextNode("mmmmmmmmmml"));
        var div = document.createElement("div");
        div.style.position = "absolute";
        div.style.top = "-1000px";
        div.appendChild(_CPFontDetectSpan);
        document.getElementsByTagName("body")[0].appendChild(div);
    _CPFontDetectReferenceFonts = _CPFontDetectPickTwoDifferentFonts(["monospace", "serif", "sans-serif", "cursive"]);
        _availableFonts = [];
        for (var i = 0; i < _CPFontDetectAllFonts.length; i++) {
            var available = _CPFontDetectFontAvailable(_CPFontDetectAllFonts[i]);
      if (available)
                _availableFonts.push(_CPFontDetectAllFonts[i]);
        }
    }
    return _availableFonts;
}
},["CPArray"]), new objj_method(sel_getUid("fontWithNameIsAvailable:"), function $CPFontManager__fontWithNameIsAvailable_(self, _cmd, aFontName)
{ with(self)
{
    return _CPFontDetectFontAvailable(aFontName);
}
},["CPArray","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedFontManager"), function $CPFontManager__sharedFontManager(self, _cmd)
{ with(self)
{
    if (!CPSharedFontManager)
        CPSharedFontManager = objj_msgSend(objj_msgSend(CPFontManagerFactory, "alloc"), "init");
    return CPSharedFontManager;
}
},["CPFontManager"]), new objj_method(sel_getUid("setFontManagerFactory:"), function $CPFontManager__setFontManagerFactory_(self, _cmd, aClass)
{ with(self)
{
    CPFontManagerFactory = aClass;
}
},["void","Class"])]);
}
var _CPFontDetectSpan,
    _CPFontDetectReferenceFonts,
    _CPFontDetectAllFonts = [
        "American Typewriter",
        "Apple Chancery","Arial","Arial Black","Arial Narrow","Arial Rounded MT Bold","Arial Unicode MS",
        "Big Caslon","Bitstream Vera Sans","Bitstream Vera Sans Mono","Bitstream Vera Serif",
        "Brush Script MT",
        "Cambria",
        "Caslon","Castellar","Cataneo BT","Centaur","Century Gothic","Century Schoolbook","Century Schoolbook L",
        "Comic Sans", "Comic Sans MS","Consolas","Constantia","Cooper Black","Copperplate","Copperplate Gothic Bold","Copperplate Gothic Light","Corbel","Courier","Courier New",
        "Futura",
        "Geneva","Georgia","Georgia Ref", "Geeza Pro", "Gigi","Gill Sans","Gill Sans MT","Gill Sans MT Condensed","Gill Sans MT Ext Condensed Bold","Gill Sans Ultra Bold","Gill Sans Ultra Bold Condensed",
        "Helvetica","Helvetica Narrow","Helvetica Neue","Herculanum","High Tower Text","Highlight LET","Hoefler Text","Impact","Imprint MT Shadow",
        "Lucida","Lucida Bright","Lucida Calligraphy","Lucida Console","Lucida Fax","Lucida Grande","Lucida Handwriting","Lucida Sans","Lucida Sans Typewriter","Lucida Sans Unicode",
        "Marker Felt",
        "Microsoft Sans Serif","Milano LET","Minion Web","MisterEarl BT","Mistral","Monaco","Monotype Corsiva","Monotype.com","New Century Schoolbook","New York","News Gothic MT",
        "Papyrus",
        "Tahoma","Techno","Tempus Sans ITC","Terminal","Textile","Times","Times New Roman","Tiranti Solid LET","Trebuchet MS",
        "Verdana","Verdana Ref",
        "Zapfino"];
var _CPFontDetectFontAvailable = function(font) {
 for (var i = 0; i < _CPFontDetectReferenceFonts.length; i++)
  if (_CPFontDetectCompareFonts(_CPFontDetectReferenceFonts[i], font))
   return true;
 return false;
}
var _CPFontDetectCache = {};
var _CPFontDetectCompareFonts = function(fontA, fontB) {
    var a;
    if (_CPFontDetectCache[fontA]) {
        a = _CPFontDetectCache[fontA];
    } else {
     _CPFontDetectSpan.style.fontFamily = '"' + fontA + '"';
        _CPFontDetectCache[fontA] = a = { w: _CPFontDetectSpan.offsetWidth, h: _CPFontDetectSpan.offsetHeight };
    }
 _CPFontDetectSpan.style.fontFamily= '"' + fontB + '", "' + fontA + '"';
 var bWidth = _CPFontDetectSpan.offsetWidth;
 var bHeight = _CPFontDetectSpan.offsetHeight;
 return (a.w != bWidth || a.h != bHeight);
}
var _CPFontDetectPickTwoDifferentFonts = function(candidates) {
 for (var i = 0; i < candidates.length; i++)
  for (var j = 0; j < i; j++)
   if (_CPFontDetectCompareFonts(candidates[i], candidates[j]))
    return [candidates[i], candidates[j]];
 return [candidates[0]];
}
objj_msgSend(CPFontManager, "setFontManagerFactory:", objj_msgSend(CPFontManager, "class"));

