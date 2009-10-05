I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;13;CPResponder.ji;10;CPWindow.ji;12;CPDocument.jc;7752;
var _1=objj_allocateClassPair(CPResponder,"CPWindowController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_window"),new objj_ivar("_document"),new objj_ivar("_shouldCloseDocument"),new objj_ivar("_cibOwner"),new objj_ivar("_windowCibName"),new objj_ivar("_windowCibPath"),new objj_ivar("_viewController"),new objj_ivar("_viewControllerContainerView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithWindow:",nil);
}
}),new objj_method(sel_getUid("initWithWindow:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPResponder")},"init");
if(_5){
objj_msgSend(_5,"setWindow:",_7);
objj_msgSend(_5,"setShouldCloseDocument:",NO);
objj_msgSend(_5,"setNextResponder:",CPApp);
}
return _5;
}
}),new objj_method(sel_getUid("initWithWindowCibName:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"initWithWindowCibName:owner:",_a,_8);
}
}),new objj_method(sel_getUid("initWithWindowCibName:owner:"),function(_b,_c,_d,_e){
with(_b){
_b=objj_msgSend(_b,"initWithWindow:",nil);
if(_b){
_cibOwner=_e;
_windowCibName=_d;
}
return _b;
}
}),new objj_method(sel_getUid("initWithWindowCibPath:owner:"),function(_f,_10,_11,_12){
with(_f){
_f=objj_msgSend(_f,"initWithWindow:",nil);
if(_f){
_cibOwner=_12;
_windowCibPath=_11;
}
return _f;
}
}),new objj_method(sel_getUid("loadWindow"),function(_13,_14){
with(_13){
if(_window){
return;
}
objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_cibOwner,"class")),"loadCibFile:externalNameTable:",objj_msgSend(_13,"windowCibPath"),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_cibOwner,CPCibOwner));
}
}),new objj_method(sel_getUid("showWindow:"),function(_15,_16,_17){
with(_15){
var _18=objj_msgSend(_15,"window");
if(objj_msgSend(_18,"respondsToSelector:",sel_getUid("becomesKeyOnlyIfNeeded"))&&objj_msgSend(_18,"becomesKeyOnlyIfNeeded")){
objj_msgSend(_18,"orderFront:",_17);
}else{
objj_msgSend(_18,"makeKeyAndOrderFront:",_17);
}
}
}),new objj_method(sel_getUid("isWindowLoaded"),function(_19,_1a){
with(_19){
return _window!==nil;
}
}),new objj_method(sel_getUid("window"),function(_1b,_1c){
with(_1b){
if(!_window){
objj_msgSend(_1b,"windowWillLoad");
objj_msgSend(_document,"windowControllerWillLoadCib:",_1b);
objj_msgSend(_1b,"loadWindow");
if(_window===nil&&objj_msgSend(_cibOwner,"isKindOfClass:",objj_msgSend(CPDocument,"class"))){
objj_msgSend(_1b,"setWindow:",objj_msgSend(_cibOwner,"valueForKey:","window"));
}
objj_msgSend(_1b,"windowDidLoad");
objj_msgSend(_document,"windowControllerDidLoadCib:",_1b);
objj_msgSend(_1b,"synchronizeWindowTitleWithDocumentName");
}
return _window;
}
}),new objj_method(sel_getUid("setWindow:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_window,"setWindowController:",nil);
_window=_1f;
objj_msgSend(_window,"setWindowController:",_1d);
objj_msgSend(_window,"setNextResponder:",_1d);
}
}),new objj_method(sel_getUid("windowDidLoad"),function(_20,_21){
with(_20){
}
}),new objj_method(sel_getUid("windowWillLoad"),function(_22,_23){
with(_22){
}
}),new objj_method(sel_getUid("setDocument:"),function(_24,_25,_26){
with(_24){
if(_document===_26){
return;
}
var _27=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_document){
objj_msgSend(_27,"removeObserver:name:object:",_24,CPDocumentWillSaveNotification,_document);
objj_msgSend(_27,"removeObserver:name:object:",_24,CPDocumentDidSaveNotification,_document);
objj_msgSend(_27,"removeObserver:name:object:",_24,CPDocumentDidFailToSaveNotification,_document);
}
_document=_26;
if(_document){
objj_msgSend(_27,"addObserver:selector:name:object:",_24,sel_getUid("_documentWillSave:"),CPDocumentWillSaveNotification,_document);
objj_msgSend(_27,"addObserver:selector:name:object:",_24,sel_getUid("_documentDidSave:"),CPDocumentDidSaveNotification,_document);
objj_msgSend(_27,"addObserver:selector:name:object:",_24,sel_getUid("_documentDidFailToSave:"),CPDocumentDidFailToSaveNotification,_document);
objj_msgSend(_24,"setDocumentEdited:",objj_msgSend(_document,"isDocumentEdited"));
}
var _28=objj_msgSend(_document,"viewControllerForWindowController:",_24);
if(_28){
objj_msgSend(_24,"setViewController:",_28);
}
objj_msgSend(_24,"synchronizeWindowTitleWithDocumentName");
}
}),new objj_method(sel_getUid("setViewController:"),function(_29,_2a,_2b){
with(_29){
var _2c=objj_msgSend(_29,"viewControllerContainerView")||objj_msgSend(objj_msgSend(_29,"window"),"contentView"),_2d=objj_msgSend(_viewController,"view"),_2e=_2d?objj_msgSend(_2d,"frame"):objj_msgSend(_2c,"bounds");
objj_msgSend(_2d,"removeFromSuperview");
_viewController=_2b;
_2d=objj_msgSend(_viewController,"view");
if(_2d){
objj_msgSend(_2d,"setFrame:",_2e);
objj_msgSend(_2c,"addSubview:",_2d);
}
}
}),new objj_method(sel_getUid("setViewControllerContainerView:"),function(_2f,_30,_31){
with(_2f){
_viewControllerContainerView=_31;
}
}),new objj_method(sel_getUid("viewControllerContainerView"),function(_32,_33){
with(_32){
return _viewControllerContainerView;
}
}),new objj_method(sel_getUid("setViewController:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(_34,"viewControllerContainerView")||objj_msgSend(objj_msgSend(_34,"window"),"contentView"),_38=objj_msgSend(_viewController,"view"),_39=_38?objj_msgSend(_38,"frame"):objj_msgSend(_37,"bounds");
objj_msgSend(_38,"removeFromSuperview");
_viewController=_36;
_38=objj_msgSend(_viewController,"view");
if(_38){
objj_msgSend(_38,"setFrame:",_39);
objj_msgSend(_37,"addSubview:",_38);
}
}
}),new objj_method(sel_getUid("viewController"),function(_3a,_3b){
with(_3a){
return _viewController;
}
}),new objj_method(sel_getUid("_documentWillSave:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(objj_msgSend(_3c,"window"),"setDocumentSaving:",YES);
}
}),new objj_method(sel_getUid("_documentDidSave:"),function(_3f,_40,_41){
with(_3f){
objj_msgSend(objj_msgSend(_3f,"window"),"setDocumentSaving:",NO);
}
}),new objj_method(sel_getUid("_documentDidFailToSave:"),function(_42,_43,_44){
with(_42){
objj_msgSend(objj_msgSend(_42,"window"),"setDocumentSaving:",NO);
}
}),new objj_method(sel_getUid("document"),function(_45,_46){
with(_45){
return _document;
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_47,_48,_49){
with(_47){
objj_msgSend(objj_msgSend(_47,"window"),"setDocumentEdited:",_49);
}
}),new objj_method(sel_getUid("close"),function(_4a,_4b){
with(_4a){
objj_msgSend(objj_msgSend(_4a,"window"),"close");
}
}),new objj_method(sel_getUid("setShouldCloseDocument:"),function(_4c,_4d,_4e){
with(_4c){
_shouldCloseDocument=_4e;
}
}),new objj_method(sel_getUid("shouldCloseDocument"),function(_4f,_50){
with(_4f){
return _shouldCloseDocument;
}
}),new objj_method(sel_getUid("owner"),function(_51,_52){
with(_51){
return _cibOwner;
}
}),new objj_method(sel_getUid("windowCibName"),function(_53,_54){
with(_53){
if(_windowCibName){
return _windowCibName;
}
return objj_msgSend(objj_msgSend(_windowCibPath,"lastPathComponent"),"stringByDeletingPathExtension");
}
}),new objj_method(sel_getUid("windowCibPath"),function(_55,_56){
with(_55){
if(_windowCibPath){
return _windowCibPath;
}
return objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_cibOwner,"class")),"pathForResource:",_windowCibName+".cib");
}
}),new objj_method(sel_getUid("synchronizeWindowTitleWithDocumentName"),function(_57,_58){
with(_57){
if(!_document||!_window){
return;
}
objj_msgSend(_window,"setTitle:",objj_msgSend(_57,"windowTitleForDocumentDisplayName:",objj_msgSend(_document,"displayName")));
}
}),new objj_method(sel_getUid("windowTitleForDocumentDisplayName:"),function(_59,_5a,_5b){
with(_59){
return _5b;
}
})]);
