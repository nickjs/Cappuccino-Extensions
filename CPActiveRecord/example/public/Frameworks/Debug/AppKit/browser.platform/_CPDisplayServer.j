c;2207;;
var displayObjects = [],
    displayObjectsByUID = { },
    layoutObjects = [],
    layoutObjectsByUID = { },
    runLoop = objj_msgSend(CPRunLoop, "mainRunLoop");
_CPDisplayServerAddDisplayObject= function(anObject)
{
    var UID = objj_msgSend(anObject, "UID");
    if (typeof displayObjectsByUID[UID] !== "undefined")
        return;
    var index = displayObjects.length;
    displayObjectsByUID[UID] = index;
    displayObjects[index] = anObject;
}
_CPDisplayServerAddLayoutObject= function(anObject)
{
    var UID = objj_msgSend(anObject, "UID");
    if (typeof layoutObjectsByUID[UID] !== "undefined")
        return;
    var index = layoutObjects.length;
    layoutObjectsByUID[UID] = index;
    layoutObjects[index] = anObject;
}
{var the_class = objj_allocateClassPair(CPObject, "_CPDisplayServer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("run"), function $_CPDisplayServer__run(self, _cmd)
{ with(self)
{
    while (layoutObjects.length || displayObjects.length)
    {
        var index = 0;
        for (; index < layoutObjects.length; ++index)
        {
            var object = layoutObjects[index];
            delete layoutObjectsByUID[objj_msgSend(object, "UID")];
            objj_msgSend(object, "layoutIfNeeded");
        }
        layoutObjects = [];
        layoutObjectsByUID = { };
        index = 0;
        for (; index < displayObjects.length; ++index)
        {
            if (layoutObjects.length)
                break;
            var object = displayObjects[index];
            delete displayObjectsByUID[objj_msgSend(object, "UID")];
            objj_msgSend(object, "displayIfNeeded");
        }
        if (index === displayObjects.length)
        {
            displayObjects = [];
            displayObjectsByUID = { };
        }
        else
            displayObjects = displayObjects.splice(0, index);
    }
    objj_msgSend(runLoop, "performSelector:target:argument:order:modes:", sel_getUid("run"), self, nil, 0, [CPDefaultRunLoopMode]);
}
},["void"])]);
}
objj_msgSend(_CPDisplayServer, "run");

