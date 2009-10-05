I;21;Foundation/CPObject.jc;17380;

CPURLNameKey = "CPURLNameKey";
CPURLLocalizedNameKey = "CPURLLocalizedNameKey";
CPURLIsRegularFileKey = "CPURLIsRegularFileKey";
CPURLIsDirectoryKey = "CPURLIsDirectoryKey";
CPURLIsSymbolicLinkKey = "CPURLIsSymbolicLinkKey";
CPURLIsVolumeKey = "CPURLIsVolumeKey";
CPURLIsPackageKey = "CPURLIsPackageKey";
CPURLIsSystemImmutableKey = "CPURLIsSystemImmutableKey";
CPURLIsUserImmutableKey = "CPURLIsUserImmutableKey";
CPURLIsHiddenKey = "CPURLIsHiddenKey";
CPURLHasHiddenExtensionKey = "CPURLHasHiddenExtensionKey";
CPURLCreationDateKey = "CPURLCreationDateKey";
CPURLContentAccessDateKey = "CPURLContentAccessDateKey";
CPURLContentModificationDateKey = "CPURLContentModificationDateKey";
CPURLAttributeModificationDateKey = "CPURLAttributeModificationDateKey";
CPURLLinkCountKey = "CPURLLinkCountKey";
CPURLParentDirectoryURLKey = "CPURLParentDirectoryURLKey";
CPURLVolumeURLKey = "CPURLTypeIdentifierKey";
CPURLTypeIdentifierKey = "CPURLTypeIdentifierKey";
CPURLLocalizedTypeDescriptionKey = "CPURLLocalizedTypeDescriptionKey";
CPURLLabelNumberKey = "CPURLLabelNumberKey";
CPURLLabelColorKey = "CPURLLabelColorKey";
CPURLLocalizedLabelKey = "CPURLLocalizedLabelKey";
CPURLEffectiveIconKey = "CPURLEffectiveIconKey";
CPURLCustomIconKey = "CPURLCustomIconKey";

{var the_class = objj_allocateClassPair(CPObject, "CPURL"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_base"), new objj_ivar("_relative"), new objj_ivar("_resourceValues")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("baseURL"), function $CPURL__baseURL(self, _cmd)
{ with(self)
{
return _base;
}
},["id"]),
new objj_method(sel_getUid("relativeString"), function $CPURL__relativeString(self, _cmd)
{ with(self)
{
return _relative;
}
},["id"]), new objj_method(sel_getUid("initWithScheme:host:path:"), function $CPURL__initWithScheme_host_path_(self, _cmd, scheme, host, path)
{ with(self)
{
    var uri = new URI();
    uri.scheme = scheme;
    uri.authority = host;
    uri.path = path;
    objj_msgSend(self, "initWithString:", uri.toString());
}
},["id","CPString","CPString","CPString"]), new objj_method(sel_getUid("initWithString:"), function $CPURL__initWithString_(self, _cmd, URLString)
{ with(self)
{
    return objj_msgSend(self, "initWithString:relativeToURL:", URLString, nil);
}
},["id","CPString"]), new objj_method(sel_getUid("initWithString:relativeToURL:"), function $CPURL__initWithString_relativeToURL_(self, _cmd, URLString, baseURL)
{ with(self)
{
    if (!URI_RE.test(URLString))
        return nil;

    if (self)
    {
        _base = baseURL;
        _relative = URLString;
        _resourceValues = objj_msgSend(CPDictionary, "dictionary");
    }

    return self;
}
},["id","CPString","CPURL"]), new objj_method(sel_getUid("absoluteURL"), function $CPURL__absoluteURL(self, _cmd)
{ with(self)
{
    var absStr = objj_msgSend(self, "absoluteString");

    if (absStr !== _relative)
        return objj_msgSend(objj_msgSend(CPURL, "alloc"), "initWithString:", absStr);

    return self;
}
},["CPURL"]), new objj_method(sel_getUid("absoluteString"), function $CPURL__absoluteString(self, _cmd)
{ with(self)
{
    return resolve(objj_msgSend(_base, "absoluteString") || "", _relative);
}
},["CPString"]), new objj_method(sel_getUid("relativeString"), function $CPURL__relativeString(self, _cmd)
{ with(self)
{
    return _relative;
}
},["CPString"]), new objj_method(sel_getUid("path"), function $CPURL__path(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).path || nil) : nil;
}
},["CPString"]), new objj_method(sel_getUid("relativePath"), function $CPURL__relativePath(self, _cmd)
{ with(self)
{
    return URI_RE.test(_relative) ? (parse(_relative).path || nil) : nil;
}
},["CPString"]), new objj_method(sel_getUid("scheme"), function $CPURL__scheme(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).protocol || nil) : nil;
}
},["CPString"]), new objj_method(sel_getUid("user"), function $CPURL__user(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).user || nil) : nil;
}
},["CPString"]), new objj_method(sel_getUid("password"), function $CPURL__password(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).password || nil) : nil;
}
},["CPString"]), new objj_method(sel_getUid("host"), function $CPURL__host(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).domain || nil) : nil;
}
},["CPString"]), new objj_method(sel_getUid("port"), function $CPURL__port(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    if (URI_RE.test(str)) {
        var port = parse(str).port;
        if (port)
            return parseInt(port, 10);
    }
    return nil;
}
},["CPString"]), new objj_method(sel_getUid("parameterString"), function $CPURL__parameterString(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).query || nil) : nil;
}
},["CPString"]), new objj_method(sel_getUid("fragment"), function $CPURL__fragment(self, _cmd)
{ with(self)
{
    var str = objj_msgSend(self, "absoluteString");
    return URI_RE.test(str) ? (parse(str).anchor || nil) : nil;
}
},["CPString"]), new objj_method(sel_getUid("isEqual:"), function $CPURL__isEqual_(self, _cmd, anObject)
{ with(self)
{

    return objj_msgSend(self, "relativeString") === objj_msgSend(anObject, "relativeString") &&
        (objj_msgSend(self, "baseURL") === objj_msgSend(anObject, "baseURL") || objj_msgSend(objj_msgSend(self, "baseURL"), "isEqual:", objj_msgSend(anObject, "baseURL")));
}
},["BOOL","id"]), new objj_method(sel_getUid("lastPathComponent"), function $CPURL__lastPathComponent(self, _cmd)
{ with(self)
{
    var path = objj_msgSend(self, "path");
    return path ? path.split("/").pop() : nil;
}
},["CPString"]), new objj_method(sel_getUid("pathExtension"), function $CPURL__pathExtension(self, _cmd)
{ with(self)
{
    var path = objj_msgSend(self, "path"),
        ext = path.match(/\.(\w+)$/);
    return ext ? ext[1] : "";
}
},["CPString"]), new objj_method(sel_getUid("standardizedURL"), function $CPURL__standardizedURL(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPURL, "URLWithString:relativeToURL:", format(parse(_relative)), _base);
}
},["CPURL"]), new objj_method(sel_getUid("isFileURL"), function $CPURL__isFileURL(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "scheme") === "file";
}
},["BOOL"]), new objj_method(sel_getUid("description"), function $CPURL__description(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "absoluteString");
}
},["CPString"]), new objj_method(sel_getUid("resourceValueForKey:"), function $CPURL__resourceValueForKey_(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(_resourceValues, "objectForKey:", aKey);
}
},["id","CPString"]), new objj_method(sel_getUid("setResourceValue:forKey:"), function $CPURL__setResourceValue_forKey_(self, _cmd, anObject, aKey)
{ with(self)
{
    objj_msgSend(_resourceValues, "setObject:forKey:", anObject, aKey);
}
},["id","id","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("URLWithString:"), function $CPURL__URLWithString_(self, _cmd, URLString)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithString:", URLString);
}
},["id","CPString"]), new objj_method(sel_getUid("URLWithString:relativeToURL:"), function $CPURL__URLWithString_relativeToURL_(self, _cmd, URLString, baseURL)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithString:relativeToURL:", URLString, baseURL);
}
},["id","CPString","CPURL"])]);
}

{
var the_class = objj_getClass("CPURL")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPURL\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPURL__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    _base = objj_msgSend(aCoder, "decodeObjectForKey:", "CPURLBaseKey");
    _relative = objj_msgSend(aCoder, "decodeObjectForKey:", "CPURLRelativeKey");
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPURL__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _base, "CPURLBaseKey");
    objj_msgSend(aCoder, "encodeObject:forKey:", _relative, "CPURLRelativeKey");
}
},["void","CPCoder"])]);
}




var URI_RE = /^(?:([^:\/?\#]+):)?(?:\/\/([^\/?\#]*))?([^?\#]*)(?:\?([^\#]*))?(?:\#(.*))?/;




var URI = function(str) {
    if (!str) str = "";
    var result = str.match(URI_RE);
    this.scheme = result[1] || null;
    this.authority = result[2] || null;
    this.path = result[3] || null;
    this.query = result[4] || null;
    this.fragment = result[5] || null;
}




URI.prototype.toString = function () {
    var str = "";

    if (this.scheme)
        str += this.scheme + ":";

    if (this.authority)
        str += "//" + this.authority;

    if (this.path)
        str += this.path;

    if (this.query)
        str += "?" + this.query;

    if (this.fragment)
        str += "#" + this.fragment;

    return str;
}

var parse = function(uri) {
    return new URI(uri);
}

var unescape = function(str, plus) {
    return decodeURI(str).replace(/\+/g, " ");
}

var unescapeComponent = function(str, plus) {
    return decodeURIComponent(str).replace(/\+/g, " ");
}






var keys = [
    "url",
    "protocol",
    "authorityRoot",
    "authority",
        "userInfo",
            "user",
            "password",
        "domain",
            "domains",
        "port",
    "path",
        "root",
        "directory",
            "directories",
        "file",
    "query",
    "anchor"
];





var expressionKeys = [
    "url",
    "protocol",
    "authorityRoot",
    "authority",
        "userInfo",
            "user",
            "password",
        "domain",
        "port",
    "path",
        "root",
        "directory",
        "file",
    "query",
    "anchor"
];



var strictExpression = new RegExp(
    "^" +
    "(?:" +
        "([^:/?#]+):" +
    ")?" +
    "(?:" +
        "(//)" +
        "(" +
            "(?:" +
                "(" +
                    "([^:@]*)" +
                    ":?" +
                    "([^:@]*)" +
                ")?" +
                "@" +
            ")?" +
            "([^:/?#]*)" +
            "(?::(\\d*))?" +
        ")" +
    ")?" +
    "(" +
        "(/?)" +
        "((?:[^?#/]*/)*)" +
        "([^?#]*)" +
    ")" +
    "(?:\\?([^#]*))?" +
    "(?:#(.*))?"
);







var Parser = function (expression) {
    return function (url) {
        if (typeof url == "undefined")
            throw new Error("HttpError: URL is undefined");
        if (typeof url != "string") return new Object(url);

        var items = {};
        var parts = expression.exec(url);

        for (var i = 0; i < parts.length; i++) {
            items[expressionKeys[i]] = parts[i] ? parts[i] : "";
        }

        items.root = (items.root || items.authorityRoot) ? '/' : '';

        items.directories = items.directory.split("/");
        if (items.directories[items.directories.length - 1] == "") {
            items.directories.pop();
        }


        var directories = [];
        for (var i = 0; i < items.directories.length; i++) {
            var directory = items.directories[i];
            if (directory == '.') {
            } else if (directory == '..') {
                if (directories.length && directories[directories.length - 1] != '..')
                    directories.pop();
                else
                    directories.push('..');
            } else {
                directories.push(directory);
            }
        }
        items.directories = directories;

        items.domains = items.domain.split(".");

        return items;
    };
};




var parse = Parser(strictExpression);





var format = function (object) {
    if (typeof(object) == 'undefined')
        throw new Error("UrlError: URL undefined for urls#format");
    if (object instanceof String || typeof(object) == 'string')
        return object;
    var domain =
        object.domains ?
        object.domains.join(".") :
        object.domain;
    var userInfo = (
            object.user ||
            object.password
        ) ?
        (
            (object.user || "") +
            (object.password ? ":" + object.password : "")
        ) :
        object.userInfo;
    var authority = (
            userInfo ||
            domain ||
            object.port
        ) ? (
            (userInfo ? userInfo + "@" : "") +
            (domain || "") +
            (object.port ? ":" + object.port : "")
        ) :
        object.authority;
    var directory =
        object.directories ?
        object.directories.join("/") :
        object.directory;
    var path =
        directory || object.file ?
        (
            (directory ? directory + "/" : "") +
            (object.file || "")
        ) :
        object.path;
    return (
        (object.protocol ? object.protocol + ":" : "") +
        (authority ? "//" + authority : "") +
        (object.root || (authority && path) ? "/" : "") +
        (path ? path : "") +
        (object.query ? "?" + object.query : "") +
        (object.anchor ? "#" + object.anchor : "")
    ) || object.url || "";
};





var resolveObject = function (source, relative) {
    if (!source)
        return relative;

    source = parse(source);
    relative = parse(relative);

    if (relative.url == "")
        return source;

    delete source.url;
    delete source.authority;
    delete source.domain;
    delete source.userInfo;
    delete source.path;
    delete source.directory;

    if (
        relative.protocol && relative.protocol != source.protocol ||
        relative.authority && relative.authority != source.authority
    ) {
        source = relative;
    } else {
        if (relative.root) {
            source.directories = relative.directories;
        } else {

            var directories = relative.directories;
            for (var i = 0; i < directories.length; i++) {
                var directory = directories[i];
                if (directory == ".") {
                } else if (directory == "..") {
                    if (source.directories.length) {
                        source.directories.pop();
                    } else {
                        source.directories.push('..');
                    }
                } else {
                    source.directories.push(directory);
                }
            }

            if (relative.file == ".") {
                relative.file = "";
            } else if (relative.file == "..") {
                source.directories.pop();
                relative.file = "";
            }
        }
    }

    if (relative.root)
        source.root = relative.root;
    if (relative.protcol)
        source.protocol = relative.protocol;
    if (!(!relative.path && relative.anchor))
        source.file = relative.file;
    source.query = relative.query;
    source.anchor = relative.anchor;

    return source;
};





var relativeObject = function (source, target) {
    target = parse(target);
    source = parse(source);

    delete target.url;

    if (
        target.protocol == source.protocol &&
        target.authority == source.authority
    ) {
        delete target.protocol;
        delete target.authority;
        delete target.userInfo;
        delete target.user;
        delete target.password;
        delete target.domain;
        delete target.domains;
        delete target.port;
        if (
            !!target.root == !!source.root && !(
                target.root &&
                target.directories[0] != source.directories[0]
            )
        ) {
            delete target.path;
            delete target.root;
            delete target.directory;
            while (
                source.directories.length &&
                target.directories.length &&
                target.directories[0] == source.directories[0]
            ) {
                target.directories.shift();
                source.directories.shift();
            }
            while (source.directories.length) {
                source.directories.shift();
                target.directories.unshift('..');
            }

            if (!target.root && !target.directories.length && !target.file && source.file)
                target.directories.push('.');

            if (source.file == target.file)
                delete target.file;
            if (source.query == target.query)
                delete target.query;
            if (source.anchor == target.anchor)
                delete target.anchor;
        }
    }

    return target;
};




var resolve = function (source, relative) {
    return format(resolveObject(source, relative));
};




var relative = function (source, target) {
    return format(relativeObject(source, target));
};

