I;21;Foundation/CPObject.ji;8;Person.jc;2183;
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("tableView"), new objj_ivar("people")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function(self, _cmd, aNotification)
{ with(self)
{
    var theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask),
        contentView = objj_msgSend(theWindow, "contentView");
    var nameColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "PersonName");
    objj_msgSend(nameColumn, "setWidth:", 150.0);
    tableView = objj_msgSend(objj_msgSend(CPTableView, "alloc"), "initWithFrame:", objj_msgSend(contentView, "bounds"));
    objj_msgSend(tableView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(tableView, "addTableColumn:", nameColumn);
    objj_msgSend(tableView, "setDelegate:", self);
    objj_msgSend(tableView, "setDataSource:", self);
    objj_msgSend(contentView, "addSubview:", tableView);
    objj_msgSend(theWindow, "orderFront:", self);
    objj_msgSend(Person, "addObserver:selector:", self, sel_getUid("peopleDidLoad:"));
}
}), new objj_method(sel_getUid("peopleDidLoad:"), function(self, _cmd, aNotification)
{ with(self)
{
    people = objj_msgSend(Person, "all");
    objj_msgSend(tableView, "reloadData");
}
})]);
}
{
var the_class = objj_getClass("AppController")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"AppController\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("numberOfRowsInTableView:"), function(self, _cmd, aTableView)
{ with(self)
{
    return objj_msgSend(people, "count");
}
}), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function(self, _cmd, aTableView, aColumn, aRow)
{ with(self)
{
    return objj_msgSend(people[aRow], "name");
}
})]);
}

