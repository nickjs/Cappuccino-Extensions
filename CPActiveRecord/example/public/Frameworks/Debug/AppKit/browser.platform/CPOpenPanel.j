I;16;AppKit/CPPanel.jc;3037;


var SharedOpenPanel = nil;

{var the_class = objj_allocateClassPair(CPPanel, "CPOpenPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_files"), new objj_ivar("_canChooseFiles"), new objj_ivar("_canChooseDirectories"), new objj_ivar("_allowsMultipleSelection")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("canChooseFiles"), function $CPOpenPanel__canChooseFiles(self, _cmd)
{ with(self)
{
return _canChooseFiles;
}
},["id"]),
new objj_method(sel_getUid("setCanChooseFiles:"), function $CPOpenPanel__setCanChooseFiles_(self, _cmd, newValue)
{ with(self)
{
_canChooseFiles = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("canChooseDirectories"), function $CPOpenPanel__canChooseDirectories(self, _cmd)
{ with(self)
{
return _canChooseDirectories;
}
},["id"]),
new objj_method(sel_getUid("setCanChooseDirectories:"), function $CPOpenPanel__setCanChooseDirectories_(self, _cmd, newValue)
{ with(self)
{
_canChooseDirectories = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("allowsMultipleSelection"), function $CPOpenPanel__allowsMultipleSelection(self, _cmd)
{ with(self)
{
return _allowsMultipleSelection;
}
},["id"]),
new objj_method(sel_getUid("setAllowsMultipleSelection:"), function $CPOpenPanel__setAllowsMultipleSelection_(self, _cmd, newValue)
{ with(self)
{
_allowsMultipleSelection = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $CPOpenPanel__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "init"))
    {
        _files = [];
        _canChooseFiles = YES;
    }

    return self;
}
},["id"]), new objj_method(sel_getUid("filenames"), function $CPOpenPanel__filenames(self, _cmd)
{ with(self)
{
    return _files;
}
},["void"]), new objj_method(sel_getUid("runModalForDirectory:file:types:"), function $CPOpenPanel__runModalForDirectory_file_types_(self, _cmd, absoluteDirectoryPath, filename, fileTypes)
{ with(self)
{

    if (window.Titanium)
    {
        _files = Titanium.Desktop.openFiles({
            path:absoluteDirectoryPath,
            types:fileTypes,
            multiple:_allowsMultipleSelection,
            filename:filename,
            directories:_canChooseDirectories,
            files:_canChooseFiles
        });
    }

}
},["unsigned","CPString","CPString","CPArray"]), new objj_method(sel_getUid("runModalForTypes:"), function $CPOpenPanel__runModalForTypes_(self, _cmd, fileTypes)
{ with(self)
{alert("HERE");
    objj_msgSend(self, "runModalForDirectory:file:types:", "/", nil, fileTypes);
}
},["unsigned","CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("openPanel"), function $CPOpenPanel__openPanel(self, _cmd)
{ with(self)
{
    if (!SharedOpenPanel)
        SharedOpenPanel = objj_msgSend(objj_msgSend(CPOpenPanel, "alloc"), "init");

    return SharedOpenPanel;
}
},["id"])]);
}

