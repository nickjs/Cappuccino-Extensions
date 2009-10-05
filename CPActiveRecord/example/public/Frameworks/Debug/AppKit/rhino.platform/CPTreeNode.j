I;21;Foundation/CPObject.jc;3558;


{var the_class = objj_allocateClassPair(CPObject, "CPTreeNode"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_representedObject"), new objj_ivar("_parentNode"), new objj_ivar("_childNodes")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("representedObject"), function $CPTreeNode__representedObject(self, _cmd)
{ with(self)
{
return _representedObject;
}
},["id"]),
new objj_method(sel_getUid("parentNode"), function $CPTreeNode__parentNode(self, _cmd)
{ with(self)
{
return _parentNode;
}
},["id"]),
new objj_method(sel_getUid("childNodes"), function $CPTreeNode__childNodes(self, _cmd)
{ with(self)
{
return _childNodes;
}
},["id"]), new objj_method(sel_getUid("initWithRepresentedObject:"), function $CPTreeNode__initWithRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _representedObject = anObject;
        _childNodes = [];
    }

    return self;
}
},["id","id"]), new objj_method(sel_getUid("isLeaf"), function $CPTreeNode__isLeaf(self, _cmd)
{ with(self)
{
    return objj_msgSend(_childNodes, "count") <= 0;
}
},["BOOL"]), new objj_method(sel_getUid("mutableChildNodes"), function $CPTreeNode__mutableChildNodes(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "mutableArrayValueForKey:", "childNodes");
}
},["CPMutableArray"]), new objj_method(sel_getUid("insertObject:inChildNodesAtIndex:"), function $CPTreeNode__insertObject_inChildNodesAtIndex_(self, _cmd, anObject, anIndex)
{ with(self)
{
    anObject._parentNode = self;

    objj_msgSend(_childNodes, "addObject:", anObject);
}
},["void","id","CPInteger"]), new objj_method(sel_getUid("removeObjectFromChildNodesAtIndex:"), function $CPTreeNode__removeObjectFromChildNodesAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    anObject._parentNode = nil;

    objj_msgSend(_childNodes, "removeObjectAtIndex:", anIndex);
}
},["void","CPInteger"]), new objj_method(sel_getUid("replaceObjectFromChildNodesAtIndex:withObject:"), function $CPTreeNode__replaceObjectFromChildNodesAtIndex_withObject_(self, _cmd, anIndex, anObject)
{ with(self)
{
    var oldObject = objj_msgSend(_childNodes, "objectAtIndex:", anIndex);

    oldObject._parentNode = nil;

    objj_msgSend(_childNodes, "replaceObjectAtIndex:withObject:", anIndex, anObject);
}
},["void","CPInteger","id"]), new objj_method(sel_getUid("objectInChildNodesAtIndex:"), function $CPTreeNode__objectInChildNodesAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return _childNodes[anIndex];
}
},["id","CPInteger"]), new objj_method(sel_getUid("sortWithSortDescriptors:recursively:"), function $CPTreeNode__sortWithSortDescriptors_recursively_(self, _cmd, sortDescriptors, shouldSortRecursively)
{ with(self)
{
    objj_msgSend(_childNodes, "sortUsingDescriptors:", sortDescriptors);

    if (!shouldSortRecursively)
        return;

    var count = objj_msgSend(_childNodes, "count");

    while (count--)
        objj_msgSend(_childNodes[count], "sortWithSortDescriptors:recursively:", sortDescriptors, YES);
}
},["void","CPArray","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("treeNodeWithRepresentedObject:"), function $CPTreeNode__treeNodeWithRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithRepresentedObject:", anObject);
}
},["id","id"])]);
}

