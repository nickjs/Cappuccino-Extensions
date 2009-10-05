I;15;AppKit/CPView.jc;18234;
CPWebViewProgressStartedNotification = "CPWebViewProgressStartedNotification";
CPWebViewProgressFinishedNotification = "CPWebViewProgressFinishedNotification";
CPWebViewScrollAppKit = 1;
CPWebViewScrollNative = 2;
{var the_class = objj_allocateClassPair(CPView, "CPWebView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_scrollView"), new objj_ivar("_frameView"), new objj_ivar("_iframe"), new objj_ivar("_mainFrameURL"), new objj_ivar("_backwardStack"), new objj_ivar("_forwardStack"), new objj_ivar("_ignoreLoadStart"), new objj_ivar("_ignoreLoadEnd"), new objj_ivar("_downloadDelegate"), new objj_ivar("_frameLoadDelegate"), new objj_ivar("_policyDelegate"), new objj_ivar("_resourceLoadDelegate"), new objj_ivar("_UIDelegate"), new objj_ivar("_wso"), new objj_ivar("_url"), new objj_ivar("_html"), new objj_ivar("_loadCallback"), new objj_ivar("_scrollMode"), new objj_ivar("_scrollSize")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:frameName:groupName:"), function $CPWebView__initWithFrame_frameName_groupName_(self, _cmd, frameRect, frameName, groupName)
{ with(self)
{
    if (self = objj_msgSend(self, "initWithFrame:", frameRect))
    {
        _iframe.name = frameName;
    }
    return self
}
},["id","CPRect","CPString","CPString"]), new objj_method(sel_getUid("initWithFrame:"), function $CPWebView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame))
    {
        _mainFrameURL = nil;
        _backwardStack = [];
        _forwardStack = [];
        _scrollMode = CPWebViewScrollNative;
        objj_msgSend(self, "_initDOMWithFrame:", aFrame);
    }
    return self;
}
},["id","CPRect"]), new objj_method(sel_getUid("_initDOMWithFrame:"), function $CPWebView___initDOMWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    _ignoreLoadStart = YES;
    _ignoreLoadEnd = YES;
    _iframe = document.createElement("iframe");
    _iframe.name = "iframe_" + Math.floor(Math.random()*10000);
    _iframe.style.width = "100%";
    _iframe.style.height = "100%";
    _iframe.style.borderWidth = "0px";
    objj_msgSend(self, "setDrawsBackground:", YES);
    _loadCallback = function() {
     if (!_ignoreLoadStart)
     {
         objj_msgSend(self, "_startedLoading");
         if (_mainFrameURL)
             objj_msgSend(_backwardStack, "addObject:", _mainFrameURL);
            _mainFrameURL = _iframe.src;
            _mainFrameURL = _iframe.src;
         objj_msgSend(_forwardStack, "removeAllObjects");
     }
     else
            _ignoreLoadStart = NO;
     if (!_ignoreLoadEnd)
     {
            objj_msgSend(self, "_finishedLoading");
     }
     else
         _ignoreLoadEnd = NO;
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
 }
 if (_iframe.addEventListener)
     _iframe.addEventListener("load", _loadCallback, false);
 else if (_iframe.attachEvent)
  _iframe.attachEvent("onload", _loadCallback);
    _frameView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
    _scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
    objj_msgSend(_scrollView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    objj_msgSend(_scrollView, "setDocumentView:", _frameView);
    _frameView._DOMElement.appendChild(_iframe);
    objj_msgSend(self, "_setScrollMode:", _scrollMode);
    objj_msgSend(self, "addSubview:", _scrollView);
}
},["id","CPRect"]), new objj_method(sel_getUid("setFrameSize:"), function $CPWebView__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "_resizeWebFrame");
}
},["void","CPSize"]), new objj_method(sel_getUid("_resizeWebFrame"), function $CPWebView___resizeWebFrame(self, _cmd)
{ with(self)
{
    if (_scrollMode === CPWebViewScrollAppKit)
    {
        if (_scrollSize)
        {
            objj_msgSend(_frameView, "setFrameSize:", _scrollSize);
        }
        else
        {
            objj_msgSend(_frameView, "setFrameSize:", objj_msgSend(_scrollView, "bounds").size);
            var win = null;
            try { win = objj_msgSend(self, "DOMWindow"); } catch (e) {}
            if (win && win.document)
            {
                var width = win.document.body.scrollWidth,
                    height = win.document.body.scrollHeight;
                _iframe.setAttribute("width", width);
                _iframe.setAttribute("height", height);
                objj_msgSend(_frameView, "setFrameSize:", CGSizeMake(width, height));
            }
            else
            {
                CPLog.warn("using default size 800*1600");
                objj_msgSend(_frameView, "setFrameSize:", CGSizeMake(800, 1600));
            }
        }
    }
}
},["BOOL"]), new objj_method(sel_getUid("setScrollMode:"), function $CPWebView__setScrollMode_(self, _cmd, aScrollMode)
{ with(self)
{
    if (_scrollMode == aScrollMode)
        return;
    objj_msgSend(self, "_setScrollMode:", aScrollMode);
}
},["void","int"]), new objj_method(sel_getUid("_setScrollMode:"), function $CPWebView___setScrollMode_(self, _cmd, aScrollMode)
{ with(self)
{
    _scrollMode = aScrollMode;
    _ignoreLoadStart = YES;
    _ignoreLoadEnd = YES;
    var parent = _iframe.parentNode;
    parent.removeChild(_iframe);
    if (_scrollMode === CPWebViewScrollAppKit)
    {
        objj_msgSend(_scrollView, "setHasHorizontalScroller:", YES);
        objj_msgSend(_scrollView, "setHasVerticalScroller:", YES);
        _iframe.setAttribute("scrolling", "no");
    }
    else
    {
        objj_msgSend(_scrollView, "setHasHorizontalScroller:", NO);
        objj_msgSend(_scrollView, "setHasVerticalScroller:", NO);
        _iframe.setAttribute("scrolling", "auto");
        objj_msgSend(_frameView, "setFrameSize:", objj_msgSend(_scrollView, "bounds").size);
    }
    parent.appendChild(_iframe);
}
},["void","int"]), new objj_method(sel_getUid("loadHTMLString:"), function $CPWebView__loadHTMLString_(self, _cmd, aString)
{ with(self)
{
    objj_msgSend(self, "loadHTMLString:baseURL:", aString, nil);
}
},["void","CPString"]), new objj_method(sel_getUid("loadHTMLString:baseURL:"), function $CPWebView__loadHTMLString_baseURL_(self, _cmd, aString, URL)
{ with(self)
{
    objj_msgSend(self, "_setScrollMode:", CPWebViewScrollAppKit);
    objj_msgSend(self, "_startedLoading");
    _ignoreLoadStart = YES;
    _ignoreLoadEnd = NO;
    _url = null;
    _html = aString;
    objj_msgSend(self, "_load");
}
},["void","CPString","CPURL"]), new objj_method(sel_getUid("_loadMainFrameURL"), function $CPWebView___loadMainFrameURL(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_setScrollMode:", CPWebViewScrollNative);
    objj_msgSend(self, "_startedLoading");
    _ignoreLoadStart = YES;
    _ignoreLoadEnd = NO;
    _url = _mainFrameURL;
    _html = null;
    objj_msgSend(self, "_load");
}
},["void"]), new objj_method(sel_getUid("_load"), function $CPWebView___load(self, _cmd)
{ with(self)
{
    if (_url)
    {
        _iframe.src = _url;
    }
    else if (_html)
    {
        _iframe.src = "";
        window.setTimeout(function() {
            var win = objj_msgSend(self, "DOMWindow");
            win.document.write(_html);
            window.setTimeout(_loadCallback, 1);
        }, 0);
    }
}
},["void"]), new objj_method(sel_getUid("_startedLoading"), function $CPWebView___startedLoading(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWebViewProgressStartedNotification, self);
    if (objj_msgSend(_frameLoadDelegate, "respondsToSelector:", sel_getUid("webView:didStartProvisionalLoadForFrame:")))
        objj_msgSend(_frameLoadDelegate, "webView:didStartProvisionalLoadForFrame:", self, nil);
}
},["void"]), new objj_method(sel_getUid("_finishedLoading"), function $CPWebView___finishedLoading(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_resizeWebFrame");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWebViewProgressFinishedNotification, self);
    if (objj_msgSend(_frameLoadDelegate, "respondsToSelector:", sel_getUid("webView:didFinishLoadForFrame:")))
        objj_msgSend(_frameLoadDelegate, "webView:didFinishLoadForFrame:", self, nil);
}
},["void"]), new objj_method(sel_getUid("mainFrameURL"), function $CPWebView__mainFrameURL(self, _cmd)
{ with(self)
{
    return _mainFrameURL;
}
},["CPString"]), new objj_method(sel_getUid("setMainFrameURL:"), function $CPWebView__setMainFrameURL_(self, _cmd, URLString)
{ with(self)
{
    if (_mainFrameURL)
        objj_msgSend(_backwardStack, "addObject:", _mainFrameURL);
    _mainFrameURL = URLString;
    objj_msgSend(_forwardStack, "removeAllObjects");
    objj_msgSend(self, "_loadMainFrameURL");
}
},["void","CPString"]), new objj_method(sel_getUid("goBack"), function $CPWebView__goBack(self, _cmd)
{ with(self)
{
    if (_backwardStack.length > 0)
    {
        if (_mainFrameURL)
            objj_msgSend(_forwardStack, "addObject:", _mainFrameURL);
        _mainFrameURL = objj_msgSend(_backwardStack, "lastObject");
        objj_msgSend(_backwardStack, "removeLastObject");
        objj_msgSend(self, "_loadMainFrameURL");
        return YES;
    }
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("goForward"), function $CPWebView__goForward(self, _cmd)
{ with(self)
{
    if (_forwardStack.length > 0)
    {
        if (_mainFrameURL)
            objj_msgSend(_backwardStack, "addObject:", _mainFrameURL);
        _mainFrameURL = objj_msgSend(_forwardStack, "lastObject");
        objj_msgSend(_forwardStack, "removeLastObject");
        objj_msgSend(self, "_loadMainFrameURL");
        return YES;
    }
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("canGoBack"), function $CPWebView__canGoBack(self, _cmd)
{ with(self)
{
    return (_backwardStack.length > 0);
}
},["BOOL"]), new objj_method(sel_getUid("canGoForward"), function $CPWebView__canGoForward(self, _cmd)
{ with(self)
{
    return (_forwardStack.length > 0);
}
},["BOOL"]), new objj_method(sel_getUid("backForwardList"), function $CPWebView__backForwardList(self, _cmd)
{ with(self)
{
    return { back: _backwardStack, forward: _forwardStack };
}
},["WebBackForwardList"]), new objj_method(sel_getUid("close"), function $CPWebView__close(self, _cmd)
{ with(self)
{
    _iframe.parentNode.removeChild(_iframe);
}
},["void"]), new objj_method(sel_getUid("DOMWindow"), function $CPWebView__DOMWindow(self, _cmd)
{ with(self)
{
    return (_iframe.contentDocument && _iframe.contentDocument.defaultView) || _iframe.contentWindow;
}
},["DOMWindow"]), new objj_method(sel_getUid("windowScriptObject"), function $CPWebView__windowScriptObject(self, _cmd)
{ with(self)
{
    var win = objj_msgSend(self, "DOMWindow");
    if (!_wso || win != objj_msgSend(_wso, "window"))
    {
        if (win)
            _wso = objj_msgSend(objj_msgSend(CPWebScriptObject, "alloc"), "initWithWindow:", win);
        else
            _wso = nil;
    }
    return _wso;
}
},["CPWebScriptObject"]), new objj_method(sel_getUid("stringByEvaluatingJavaScriptFromString:"), function $CPWebView__stringByEvaluatingJavaScriptFromString_(self, _cmd, script)
{ with(self)
{
    var result = objj_msgSend(self, "objectByEvaluatingJavaScriptFromString:", script);
    return result ? String(result) : nil;
}
},["CPString","CPString"]), new objj_method(sel_getUid("objectByEvaluatingJavaScriptFromString:"), function $CPWebView__objectByEvaluatingJavaScriptFromString_(self, _cmd, script)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "windowScriptObject"), "evaluateWebScript:", script);
}
},["JSObject","CPString"]), new objj_method(sel_getUid("computedStyleForElement:pseudoElement:"), function $CPWebView__computedStyleForElement_pseudoElement_(self, _cmd, element, pseudoElement)
{ with(self)
{
    var win = objj_msgSend(objj_msgSend(self, "windowScriptObject"), "window");
    if (win)
    {
        return win.document.defaultView.getComputedStyle(element, pseudoElement);
    }
    return nil;
}
},["DOMCSSStyleDeclaration","DOMElement","CPString"]), new objj_method(sel_getUid("drawsBackground"), function $CPWebView__drawsBackground(self, _cmd)
{ with(self)
{
    return _iframe.style.backgroundColor != "";
}
},["BOOL"]), new objj_method(sel_getUid("setDrawsBackground:"), function $CPWebView__setDrawsBackground_(self, _cmd, drawsBackround)
{ with(self)
{
    _iframe.style.backgroundColor = drawsBackround ? "white" : "";
}
},["void","BOOL"]), new objj_method(sel_getUid("takeStringURLFrom:"), function $CPWebView__takeStringURLFrom_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "setMainFrameURL:", objj_msgSend(sender, "stringValue"));
}
},["IBAction","id"]), new objj_method(sel_getUid("goBack:"), function $CPWebView__goBack_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "goBack");
}
},["IBAction","id"]), new objj_method(sel_getUid("goForward:"), function $CPWebView__goForward_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "goForward");
}
},["IBAction","id"]), new objj_method(sel_getUid("stopLoading:"), function $CPWebView__stopLoading_(self, _cmd, sender)
{ with(self)
{
}
},["IBAction","id"]), new objj_method(sel_getUid("reload:"), function $CPWebView__reload_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "_loadMainFrameURL");
}
},["IBAction","id"]), new objj_method(sel_getUid("print:"), function $CPWebView__print_(self, _cmd, sender)
{ with(self)
{
    try
    {
        objj_msgSend(self, "DOMWindow").print();
    }
    catch (e)
    {
        alert('Please click the webpage and select "Print" from the "File" menu');
    }
}
},["IBAction","id"]), new objj_method(sel_getUid("downloadDelegate"), function $CPWebView__downloadDelegate(self, _cmd)
{ with(self)
{
    return _downloadDelegate;
}
},["id"]), new objj_method(sel_getUid("setDownloadDelegate:"), function $CPWebView__setDownloadDelegate_(self, _cmd, anObject)
{ with(self)
{
    _downloadDelegate = anObject;
}
},["void","id"]), new objj_method(sel_getUid("frameLoadDelegate"), function $CPWebView__frameLoadDelegate(self, _cmd)
{ with(self)
{
    return _frameLoadDelegate;
}
},["id"]), new objj_method(sel_getUid("setFrameLoadDelegate:"), function $CPWebView__setFrameLoadDelegate_(self, _cmd, anObject)
{ with(self)
{
    _frameLoadDelegate = anObject;
}
},["void","id"]), new objj_method(sel_getUid("policyDelegate"), function $CPWebView__policyDelegate(self, _cmd)
{ with(self)
{
    return _policyDelegate;
}
},["id"]), new objj_method(sel_getUid("setPolicyDelegate:"), function $CPWebView__setPolicyDelegate_(self, _cmd, anObject)
{ with(self)
{
    _policyDelegate = anObject;
}
},["void","id"]), new objj_method(sel_getUid("resourceLoadDelegate"), function $CPWebView__resourceLoadDelegate(self, _cmd)
{ with(self)
{
    return _resourceLoadDelegate;
}
},["id"]), new objj_method(sel_getUid("setResourceLoadDelegate:"), function $CPWebView__setResourceLoadDelegate_(self, _cmd, anObject)
{ with(self)
{
    _resourceLoadDelegate = anObject;
}
},["void","id"]), new objj_method(sel_getUid("UIDelegate"), function $CPWebView__UIDelegate(self, _cmd)
{ with(self)
{
    return _UIDelegate;
}
},["id"]), new objj_method(sel_getUid("setUIDelegate:"), function $CPWebView__setUIDelegate_(self, _cmd, anObject)
{ with(self)
{
    _UIDelegate = anObject;
}
},["void","id"])]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPWebScriptObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithWindow:"), function $CPWebScriptObject__initWithWindow_(self, _cmd, aWindow)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        _window = aWindow;
    }
    return self;
}
},["id","Window"]), new objj_method(sel_getUid("callWebScriptMethod:withArguments:"), function $CPWebScriptObject__callWebScriptMethod_withArguments_(self, _cmd, methodName, args)
{ with(self)
{
    if (typeof _window[methodName] == "function")
    {
        try {
            return _window[methodName].apply(args);
        } catch (e) {
        }
    }
    return undefined;
}
},["id","CPString","CPArray"]), new objj_method(sel_getUid("evaluateWebScript:"), function $CPWebScriptObject__evaluateWebScript_(self, _cmd, script)
{ with(self)
{
    try {
        return _window.eval(script);
    } catch (e) {
    }
    return undefined;
}
},["id","CPString"]), new objj_method(sel_getUid("window"), function $CPWebScriptObject__window(self, _cmd)
{ with(self)
{
    return _window;
}
},["Window"])]);
}
{
var the_class = objj_getClass("CPWebView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWebView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPWebView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);
    if (self)
    {
        _mainFrameURL = nil;
        _backwardStack = [];
        _forwardStack = [];
        _scrollMode = CPWebViewScrollNative;
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPWebView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    var actualSubviews = _subviews;
    _subviews = [];
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    _subviews = actualSubviews;
}
},["void","CPCoder"])]);
}

