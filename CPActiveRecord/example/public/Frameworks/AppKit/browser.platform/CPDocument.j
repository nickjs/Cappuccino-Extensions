I;21;Foundation/CPString.jI;20;Foundation/CPArray.ji;13;CPResponder.ji;18;CPViewController.ji;20;CPWindowController.jc;14944;
CPSaveOperation=0;
CPSaveAsOperation=1;
CPSaveToOperation=2;
CPAutosaveOperation=3;
CPChangeDone=0;
CPChangeUndone=1;
CPChangeCleared=2;
CPChangeReadOtherContents=3;
CPChangeAutosaved=4;
CPDocumentWillSaveNotification="CPDocumentWillSaveNotification";
CPDocumentDidSaveNotification="CPDocumentDidSaveNotification";
CPDocumentDidFailToSaveNotification="CPDocumentDidFailToSaveNotification";
var _1=0;
var _2=objj_allocateClassPair(CPResponder,"CPDocument"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_window"),new objj_ivar("_view"),new objj_ivar("_viewControllersForWindowControllers"),new objj_ivar("_fileURL"),new objj_ivar("_fileType"),new objj_ivar("_windowControllers"),new objj_ivar("_untitledDocumentIndex"),new objj_ivar("_hasUndoManager"),new objj_ivar("_undoManager"),new objj_ivar("_changeCount"),new objj_ivar("_readConnection"),new objj_ivar("_writeRequest")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPResponder")},"init");
if(_4){
_windowControllers=[];
_viewControllersForWindowControllers=objj_msgSend(CPDictionary,"dictionary");
_hasUndoManager=YES;
_changeCount=0;
objj_msgSend(_4,"setNextResponder:",CPApp);
}
return _4;
}
}),new objj_method(sel_getUid("initWithType:error:"),function(_6,_7,_8,_9){
with(_6){
_6=objj_msgSend(_6,"init");
if(_6){
objj_msgSend(_6,"setFileType:",_8);
}
return _6;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_a,_b,_c,_d,_e,_f,_10){
with(_a){
_a=objj_msgSend(_a,"init");
if(_a){
objj_msgSend(_a,"setFileURL:",_c);
objj_msgSend(_a,"setFileType:",_d);
objj_msgSend(_a,"readFromURL:ofType:delegate:didReadSelector:contextInfo:",_c,_d,_e,_f,_10);
}
return _a;
}
}),new objj_method(sel_getUid("initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_11,_12,_13,_14,_15,_16,_17,_18){
with(_11){
_11=objj_msgSend(_11,"init");
if(_11){
objj_msgSend(_11,"setFileURL:",_13);
objj_msgSend(_11,"setFileType:",_15);
objj_msgSend(_11,"readFromURL:ofType:delegate:didReadSelector:contextInfo:",_14,_15,_16,_17,_18);
}
return _11;
}
}),new objj_method(sel_getUid("dataOfType:error:"),function(_19,_1a,_1b,_1c){
with(_19){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataOfType:error: must be overridden by the document subclass.");
}
}),new objj_method(sel_getUid("readFromData:ofType:error:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"readFromData:ofType: must be overridden by the document subclass.");
}
}),new objj_method(sel_getUid("viewControllerWillLoadCib:"),function(_22,_23,_24){
with(_22){
}
}),new objj_method(sel_getUid("viewControllerDidLoadCib:"),function(_25,_26,_27){
with(_25){
}
}),new objj_method(sel_getUid("firstEligibleExistingWindowController"),function(_28,_29){
with(_28){
return nil;
}
}),new objj_method(sel_getUid("makeWindowControllers"),function(_2a,_2b){
with(_2a){
objj_msgSend(_2a,"makeViewAndWindowControllers");
}
}),new objj_method(sel_getUid("makeViewAndWindowControllers"),function(_2c,_2d){
with(_2c){
var _2e=objj_msgSend(_2c,"viewCibName"),_2f=nil,_30=nil;
if(objj_msgSend(_2e,"length")){
_2f=objj_msgSend(objj_msgSend(CPViewController,"alloc"),"initWithCibName:bundle:owner:",_2e,nil,_2c);
}
if(_2f){
_30=objj_msgSend(_2c,"firstEligibleExistingWindowController");
}
if(!_30){
var _31=objj_msgSend(_2c,"windowCibName");
if(objj_msgSend(_31,"length")){
_30=objj_msgSend(objj_msgSend(CPWindowController,"alloc"),"initWithWindowCibName:owner:",_31,_2c);
}else{
if(_2f){
var _32=objj_msgSend(_2f,"view"),_33=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(_32,"frame"),CPTitledWindowMask|CPClosableWindowMask|CPMiniaturizableWindowMask|CPResizableWindowMask);
objj_msgSend(_33,"setSupportsMultipleDocuments:",YES);
_30=objj_msgSend(objj_msgSend(CPWindowController,"alloc"),"initWithWindow:",_33);
}
}
}
if(_30){
objj_msgSend(_2c,"addWindowController:",_30);
}
if(_2f){
objj_msgSend(_2c,"addViewController:forWindowController:",_2f,_30);
}
}
}),new objj_method(sel_getUid("windowControllers"),function(_34,_35){
with(_34){
return _windowControllers;
}
}),new objj_method(sel_getUid("addWindowController:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_windowControllers,"addObject:",_38);
if(objj_msgSend(_38,"document")!==_36){
objj_msgSend(_38,"setNextResponder:",_36);
objj_msgSend(_38,"setDocument:",_36);
}
}
}),new objj_method(sel_getUid("view"),function(_39,_3a){
with(_39){
return _view;
}
}),new objj_method(sel_getUid("viewControllers"),function(_3b,_3c){
with(_3b){
return objj_msgSend(_viewControllersForWindowControllers,"allValues");
}
}),new objj_method(sel_getUid("addViewController:forWindowController:"),function(_3d,_3e,_3f,_40){
with(_3d){
objj_msgSend(_viewControllersForWindowControllers,"setObject:forKey:",_3f,objj_msgSend(_40,"UID"));
if(objj_msgSend(_40,"document")===_3d){
objj_msgSend(_40,"setViewController:",_3f);
}
}
}),new objj_method(sel_getUid("removeViewController:"),function(_41,_42,_43){
with(_41){
objj_msgSend(_viewControllersForWindowControllers,"removeObject:",_43);
}
}),new objj_method(sel_getUid("viewControllerForWindowController:"),function(_44,_45,_46){
with(_44){
return objj_msgSend(_viewControllersForWindowControllers,"objectForKey:",objj_msgSend(_46,"UID"));
}
}),new objj_method(sel_getUid("showWindows"),function(_47,_48){
with(_47){
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocument:"),_47);
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("showWindow:"),_47);
}
}),new objj_method(sel_getUid("displayName"),function(_49,_4a){
with(_49){
if(_fileURL){
return objj_msgSend(_fileURL,"lastPathComponent");
}
if(!_untitledDocumentIndex){
_untitledDocumentIndex=++_1;
}
if(_untitledDocumentIndex==1){
return "Untitled";
}
return "Untitled "+_untitledDocumentIndex;
}
}),new objj_method(sel_getUid("viewCibName"),function(_4b,_4c){
with(_4b){
return nil;
}
}),new objj_method(sel_getUid("windowCibName"),function(_4d,_4e){
with(_4d){
return nil;
}
}),new objj_method(sel_getUid("windowControllerDidLoadCib:"),function(_4f,_50,_51){
with(_4f){
}
}),new objj_method(sel_getUid("windowControllerWillLoadCib:"),function(_52,_53,_54){
with(_52){
}
}),new objj_method(sel_getUid("readFromURL:ofType:delegate:didReadSelector:contextInfo:"),function(_55,_56,_57,_58,_59,_5a,_5b){
with(_55){
objj_msgSend(_readConnection,"cancel");
_readConnection=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",_57),_55);
_readConnection.session=_5c(_58,_59,_5a,_5b);
}
}),new objj_method(sel_getUid("fileURL"),function(_5d,_5e){
with(_5d){
return _fileURL;
}
}),new objj_method(sel_getUid("setFileURL:"),function(_5f,_60,_61){
with(_5f){
if(_fileURL===_61){
return;
}
_fileURL=_61;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:",sel_getUid("synchronizeWindowTitleWithDocumentName"));
}
}),new objj_method(sel_getUid("saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:"),function(_62,_63,_64,_65,_66,_67,_68,_69){
with(_62){
var _6a=objj_msgSend(_62,"dataOfType:error:",objj_msgSend(_62,"fileType"),nil),_6b=_changeCount;
_writeRequest=objj_msgSend(CPURLRequest,"requestWithURL:",_64);
objj_msgSend(_writeRequest,"setHTTPMethod:","POST");
objj_msgSend(_writeRequest,"setHTTPBody:",objj_msgSend(_6a,"string"));
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","close","Connection");
if(_66==CPSaveOperation){
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","true","x-cappuccino-overwrite");
}
if(_66!=CPSaveToOperation){
objj_msgSend(_62,"updateChangeCount:",CPChangeCleared);
}
var _6c=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_writeRequest,_62);
_6c.session=_6d(_64,_66,_6b,_67,_68,_69,_6c);
}
}),new objj_method(sel_getUid("connection:didReceiveResponse:"),function(_6e,_6f,_70,_71){
with(_6e){
if(!objj_msgSend(_71,"isKindOfClass:",objj_msgSend(CPHTTPURLResponse,"class"))){
return;
}
var _72=objj_msgSend(_71,"statusCode");
if(_72===200){
return;
}
var _73=_70.session;
if(_70==_readConnection){
objj_msgSend(_70,"cancel");
alert("There was an error retrieving the document.");
objj_msgSend(_73.delegate,_73.didReadSelector,_6e,NO,_73.contextInfo);
}else{
if(_72==409){
objj_msgSend(_70,"cancel");
if(confirm("There already exists a file with that name, would you like to overwrite it?")){
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","true","x-cappuccino-overwrite");
objj_msgSend(_70,"start");
}else{
if(_73.saveOperation!=CPSaveToOperation){
_changeCount+=_73.changeCount;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_6e,"isDocumentEdited"));
}
_writeRequest=nil;
objj_msgSend(_73.delegate,_73.didSaveSelector,_6e,NO,_73.contextInfo);
}
}
}
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_74,_75,_76,_77){
with(_74){
var _78=_76.session;
if(_76==_readConnection){
objj_msgSend(_74,"readFromData:ofType:error:",objj_msgSend(CPData,"dataWithString:",_77),_78.fileType,nil);
objj_msgSend(_78.delegate,_78.didReadSelector,_74,YES,_78.contextInfo);
}else{
if(_78.saveOperation!=CPSaveToOperation){
objj_msgSend(_74,"setFileURL:",_78.absoluteURL);
}
_writeRequest=nil;
objj_msgSend(_78.delegate,_78.didSaveSelector,_74,YES,_78.contextInfo);
}
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_79,_7a,_7b,_7c){
with(_79){
var _7d=_7b.session;
if(_readConnection==_7b){
objj_msgSend(_7d.delegate,_7d.didReadSelector,_79,NO,_7d.contextInfo);
}else{
if(_7d.saveOperation!=CPSaveToOperation){
_changeCount+=_7d.changeCount;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_79,"isDocumentEdited"));
}
_writeRequest=nil;
alert("There was an error saving the document.");
objj_msgSend(_7d.delegate,_7d.didSaveSelector,_79,NO,_7d.contextInfo);
}
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_7e,_7f,_80){
with(_7e){
if(_readConnection==_80){
_readConnection=nil;
}
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(_81,_82){
with(_81){
return _changeCount!=0;
}
}),new objj_method(sel_getUid("updateChangeCount:"),function(_83,_84,_85){
with(_83){
if(_85==CPChangeDone){
++_changeCount;
}else{
if(_85==CPChangeUndone){
--_changeCount;
}else{
if(_85==CPChangeCleared){
_changeCount=0;
}
}
}
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_83,"isDocumentEdited"));
}
}),new objj_method(sel_getUid("setFileType:"),function(_86,_87,_88){
with(_86){
_fileType=_88;
}
}),new objj_method(sel_getUid("fileType"),function(_89,_8a){
with(_89){
return _fileType;
}
}),new objj_method(sel_getUid("hasUndoManager"),function(_8b,_8c){
with(_8b){
return _hasUndoManager;
}
}),new objj_method(sel_getUid("setHasUndoManager:"),function(_8d,_8e,_8f){
with(_8d){
if(_hasUndoManager==_8f){
return;
}
_hasUndoManager=_8f;
if(!_hasUndoManager){
objj_msgSend(_8d,"setUndoManager:",nil);
}
}
}),new objj_method(sel_getUid("_undoManagerWillCloseGroup:"),function(_90,_91,_92){
with(_90){
var _93=objj_msgSend(_92,"object");
if(objj_msgSend(_93,"isUndoing")||objj_msgSend(_93,"isRedoing")){
return;
}
objj_msgSend(_90,"updateChangeCount:",CPChangeDone);
}
}),new objj_method(sel_getUid("_undoManagerDidUndoChange:"),function(_94,_95,_96){
with(_94){
objj_msgSend(_94,"updateChangeCount:",CPChangeUndone);
}
}),new objj_method(sel_getUid("_undoManagerDidRedoChange:"),function(_97,_98,_99){
with(_97){
objj_msgSend(_97,"updateChangeCount:",CPChangeDone);
}
}),new objj_method(sel_getUid("setUndoManager:"),function(_9a,_9b,_9c){
with(_9a){
var _9d=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_undoManager){
objj_msgSend(_9d,"removeObserver:name:object:",_9a,CPUndoManagerDidUndoChangeNotification,_undoManager);
objj_msgSend(_9d,"removeObserver:name:object:",_9a,CPUndoManagerDidRedoChangeNotification,_undoManager);
objj_msgSend(_9d,"removeObserver:name:object:",_9a,CPUndoManagerWillCloseUndoGroupNotification,_undoManager);
}
_undoManager=_9c;
if(_undoManager){
objj_msgSend(_9d,"addObserver:selector:name:object:",_9a,sel_getUid("_undoManagerDidUndoChange:"),CPUndoManagerDidUndoChangeNotification,_undoManager);
objj_msgSend(_9d,"addObserver:selector:name:object:",_9a,sel_getUid("_undoManagerDidRedoChange:"),CPUndoManagerDidRedoChangeNotification,_undoManager);
objj_msgSend(_9d,"addObserver:selector:name:object:",_9a,sel_getUid("_undoManagerWillCloseGroup:"),CPUndoManagerWillCloseUndoGroupNotification,_undoManager);
}
}
}),new objj_method(sel_getUid("undoManager"),function(_9e,_9f){
with(_9e){
if(_hasUndoManager&&!_undoManager){
objj_msgSend(_9e,"setUndoManager:",objj_msgSend(objj_msgSend(CPUndoManager,"alloc"),"init"));
}
return _undoManager;
}
}),new objj_method(sel_getUid("windowWillReturnUndoManager:"),function(_a0,_a1,_a2){
with(_a0){
return objj_msgSend(_a0,"undoManager");
}
}),new objj_method(sel_getUid("saveDocument:"),function(_a3,_a4,_a5){
with(_a3){
if(_fileURL){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentWillSaveNotification,_a3);
objj_msgSend(_a3,"saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:",_fileURL,objj_msgSend(_a3,"fileType"),CPSaveOperation,_a3,sel_getUid("document:didSave:contextInfo:"),NULL);
}else{
objj_msgSend(_a3,"saveDocumentAs:",_a3);
}
}
}),new objj_method(sel_getUid("saveDocumentAs:"),function(_a6,_a7,_a8){
with(_a6){
_documentName=window.prompt("Document Name:");
if(!_documentName){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentWillSaveNotification,_a6);
objj_msgSend(_a6,"saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:",objj_msgSend(_a6,"proposedFileURL"),objj_msgSend(_a6,"fileType"),CPSaveAsOperation,_a6,sel_getUid("document:didSave:contextInfo:"),NULL);
}
}),new objj_method(sel_getUid("document:didSave:contextInfo:"),function(_a9,_aa,_ab,_ac,_ad){
with(_a9){
if(_ac){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentDidSaveNotification,_a9);
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentDidFailToSaveNotification,_a9);
}
}
})]);
var _5c=function(_ae,_af,_b0,_b1){
return {fileType:_ae,delegate:_af,didReadSelector:_b0,contextInfo:_b1};
};
var _6d=function(_b2,_b3,_b4,_b5,_b6,_b7,_b8){
return {absoluteURL:_b2,saveOperation:_b3,changeCount:_b4,delegate:_b5,didSaveSelector:_b6,contextInfo:_b7,connection:_b8};
};
