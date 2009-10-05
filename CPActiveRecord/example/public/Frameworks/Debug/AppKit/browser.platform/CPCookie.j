I;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;1941;
{var the_class = objj_allocateClassPair(CPObject, "CPCookie"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_cookieName"), new objj_ivar("_cookieValue"), new objj_ivar("_expires")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:"), function $CPCookie__initWithName_(self, _cmd, aName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _cookieName = aName;
    _cookieValue = objj_msgSend(self, "_readCookieValue");
    return self;
}
},["id","CPString"]), new objj_method(sel_getUid("value"), function $CPCookie__value(self, _cmd)
{ with(self)
{
    return _cookieValue;
}
},["CPString"]), new objj_method(sel_getUid("name"), function $CPCookie__name(self, _cmd)
{ with(self)
{
    return _cookieName;
}
},["CPString"]), new objj_method(sel_getUid("expires"), function $CPCookie__expires(self, _cmd)
{ with(self)
{
    return _expires;
}
},["CPString"]), new objj_method(sel_getUid("setValue:expires:domain:"), function $CPCookie__setValue_expires_domain_(self, _cmd, value, date, domain)
{ with(self)
{
    if(date)
        var expires = "; expires="+date.toGMTString();
    else
        var expires = "";
    if(domain)
        domain = "; domain="+domain;
    else
        domain = "";
 document.cookie = _cookieName+"="+value+expires+"; path=/"+domain;
}
},["void","CPString","CPDate","CPString"]), new objj_method(sel_getUid("_readCookieValue"), function $CPCookie___readCookieValue(self, _cmd)
{ with(self)
{
 var nameEQ = _cookieName + "=";
 var ca = document.cookie.split(';');
 for(var i=0;i < ca.length;i++) {
  var c = ca[i];
  while (c.charAt(0)==' ') c = c.substring(1,c.length);
  if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
 }
 return "";
}
},["CPString"])]);
}

