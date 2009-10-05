c;7052;


var setURLResourceValuesForKeysFromProperties = function(aURL, keys, properties)
{
    var resourceType = objj_msgSend(properties, "objectForKey:", "resourcetype");

    if (resourceType === CPWebDAVManagerCollectionResourceType)
    {
        objj_msgSend(aURL, "setResourceValue:forKey:", YES, CPURLIsDirectoryKey);
        objj_msgSend(aURL, "setResourceValue:forKey:", NO, CPURLIsRegularFileKey);
    }
    else if (resourceType === CPWebDAVManagerNonCollectionResourceType)
    {
        objj_msgSend(aURL, "setResourceValue:forKey:", NO, CPURLIsDirectoryKey);
        objj_msgSend(aURL, "setResourceValue:forKey:", YES, CPURLIsRegularFileKey);
    }

    var displayName = objj_msgSend(properties, "objectForKey:", "displayname");

    if (displayName !== nil)
    {
        objj_msgSend(aURL, "setResourceValue:forKey:", displayName, CPURLNameKey);
        objj_msgSend(aURL, "setResourceValue:forKey:", displayName, CPURLLocalizedNameKey);
    }
}

CPWebDAVManagerCollectionResourceType = 1;
CPWebDAVManagerNonCollectionResourceType = 0;

{var the_class = objj_allocateClassPair(CPObject, "CPWebDAVManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_blocksForConnections")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPWebDAVManager__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
        _blocksForConnections = objj_msgSend(CPDictionary, "dictionary");

    return self;
}
},["id"]), new objj_method(sel_getUid("contentsOfDirectoryAtURL:includingPropertiesForKeys:options:block:"), function $CPWebDAVManager__contentsOfDirectoryAtURL_includingPropertiesForKeys_options_block_(self, _cmd, aURL, keys, aMask, aBlock)
{ with(self)
{
    var properties = [],
        count = objj_msgSend(keys, "count");

    while (count--)
        properties.push(WebDAVPropertiesForURLKeys[keys[count]]);

    var makeContents = function(aURL, response)
    {
        var contents = [],
            URLString = nil,
            URLStrings = objj_msgSend(response, "keyEnumerator");

        while (URLString = objj_msgSend(URLStrings, "nextObject"))
        {
            var URL = objj_msgSend(CPURL, "URLWithString:", URLString),
                properties = objj_msgSend(response, "objectForKey:", URLString);


            if (!objj_msgSend(objj_msgSend(URL, "absoluteString"), "isEqual:", objj_msgSend(aURL, "absoluteString")))
            {
                contents.push(URL);

                setURLResourceValuesForKeysFromProperties(URL, keys, properties);
            }
        }

        return contents;
    }

    if (!aBlock)
        return makeContents(aURL, response);

    objj_msgSend(self, "PROPFIND:properties:depth:block:", aURL, properties, 1, function(aURL, response)
    {
        aBlock(aURL, makeContents(aURL, response));
    });
}
},["CPArray","CPURL","CPArray","CPDirectoryEnumerationOptions","Function"]), new objj_method(sel_getUid("PROPFIND:properties:depth:block:"), function $CPWebDAVManager__PROPFIND_properties_depth_block_(self, _cmd, aURL, properties, aDepth, aBlock)
{ with(self)
{
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);

    objj_msgSend(request, "setHTTPMethod:", "PROPFIND");
    objj_msgSend(request, "setValue:forHTTPHeaderField:", aDepth, "Depth");

    var HTTPBody = ["<?xml version=\"1.0\"?><a:propfind xmlns:a=\"DAV:\">"],
        index = 0,
        count = properties.length;

    for (; index < count; ++index)
        HTTPBody.push("<a:prop><a:", properties[index], "/></a:prop>");

    HTTPBody.push("</a:propfind>");

    objj_msgSend(request, "setHTTPBody:", HTTPBody.join(""));

    if (!aBlock)
        return parsePROPFINDResponse(objj_msgSend(objj_msgSend(CPURLConnection, "sendSynchronousRequest:returningResponse:error:", request, nil, nil), "string"));

    else
    {
        var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);

        objj_msgSend(_blocksForConnections, "setObject:forKey:", aBlock, objj_msgSend(connection, "UID"));
    }
}
},["CPDictionary","CPURL","CPDictionary","CPString","Function"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $CPWebDAVManager__connection_didReceiveData_(self, _cmd, aURLConnection, aString)
{ with(self)
{
    var block = objj_msgSend(_blocksForConnections, "objectForKey:", objj_msgSend(aURLConnection, "UID"));


    block(objj_msgSend(aURLConnection._request, "URL"), parsePROPFINDResponse(aString));
}
},["void","CPURLConnection","CPString"])]);
}

var WebDAVPropertiesForURLKeys = { };

WebDAVPropertiesForURLKeys[CPURLNameKey] = "displayname";
WebDAVPropertiesForURLKeys[CPURLLocalizedNameKey] = "displayname";
WebDAVPropertiesForURLKeys[CPURLIsRegularFileKey] = "resourcetype";
WebDAVPropertiesForURLKeys[CPURLIsDirectoryKey] = "resourcetype";
var XMLDocumentFromString = function(anXMLString)
{
    if (typeof window["ActiveXObject"] !== "undefined")
    {
        var XMLDocument = new ActiveXObject("Microsoft.XMLDOM");
        XMLDocument.async = false;
        XMLDocument.loadXML(anXMLString);
        return XMLDocument;
    }
    return new DOMParser().parseFromString(anXMLString,"text/xml");
}
var parsePROPFINDResponse = function(anXMLString)
{
    var XMLDocument = XMLDocumentFromString(anXMLString),
        responses = XMLDocument.getElementsByTagNameNS("*", "response"),
        responseIndex = 0,
        responseCount = responses.length;
    var propertiesForURLs = objj_msgSend(CPDictionary, "dictionary");
    for (; responseIndex < responseCount; ++responseIndex)
    {
        var response = responses[responseIndex],
            elements = response.getElementsByTagNameNS("*", "prop").item(0).childNodes,
            index = 0,
            count = elements.length,
            properties = objj_msgSend(CPDictionary, "dictionary");
        for (; index < count; ++index)
        {
            var element = elements[index];
            if (element.nodeType === 8 || element.nodeType === 3)
                continue;
            var nodeName = element.nodeName,
                colonIndex = nodeName.lastIndexOf(':');
            if (colonIndex > -1)
                nodeName = nodeName.substr(colonIndex + 1);
            if (nodeName === "resourcetype")
                objj_msgSend(properties, "setObject:forKey:", element.firstChild ? CPWebDAVManagerCollectionResourceType : CPWebDAVManagerNonCollectionResourceType, nodeName);
            else
                objj_msgSend(properties, "setObject:forKey:", element.firstChild.nodeValue, nodeName);
        }
        var href = response.getElementsByTagNameNS("*", "href").item(0);
        objj_msgSend(propertiesForURLs, "setObject:forKey:", properties, href.firstChild.nodeValue);
    }
    return propertiesForURLs;
}
var mapURLsAndProperties = function( properties, ignoredURL)
{
}

