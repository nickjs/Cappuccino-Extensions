I;21;Foundation/CPBundle.ji;17;CPCompatibility.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;22;CPDocumentController.ji;14;CPThemeBlend.ji;14;CPCibLoading.ji;12;CPPlatform.jc;18828;
var _1="CPMainCibFile",_2="Main cib file base name";
CPApp=nil;
CPApplicationWillFinishLaunchingNotification="CPApplicationWillFinishLaunchingNotification";
CPApplicationDidFinishLaunchingNotification="CPApplicationDidFinishLaunchingNotification";
CPRunStoppedResponse=-1000;
CPRunAbortedResponse=-1001;
CPRunContinuesResponse=-1002;
var _3=objj_allocateClassPair(CPResponder,"CPApplication"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_eventListeners"),new objj_ivar("_currentEvent"),new objj_ivar("_windows"),new objj_ivar("_keyWindow"),new objj_ivar("_mainWindow"),new objj_ivar("_mainMenu"),new objj_ivar("_documentController"),new objj_ivar("_currentSession"),new objj_ivar("_delegate"),new objj_ivar("_finishedLaunching"),new objj_ivar("_namedArgs"),new objj_ivar("_args"),new objj_ivar("_fullArgsString")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPResponder")},"init");
if(_5){
_eventListeners=[];
_windows=[];
objj_msgSend(_windows,"addObject:",nil);
_mainMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","MainMenu");
objj_msgSend(_mainMenu,"setAutoenablesItems:",NO);
var _7=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),_8=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","New",sel_getUid("newDocument:"),"N");
objj_msgSend(_8,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/New.png"),CGSizeMake(16,16)));
objj_msgSend(_8,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/NewHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_8);
var _9=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Open",sel_getUid("openDocument:"),"O");
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/Open.png"),CGSizeMake(16,16)));
objj_msgSend(_9,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/OpenHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_9);
var _a=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Save"),_b=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),nil);
objj_msgSend(_b,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/Save.png"),CGSizeMake(16,16)));
objj_msgSend(_b,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/SaveHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_a,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),"S"));
objj_msgSend(_a,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save As",sel_getUid("saveDocumentAs:"),nil));
objj_msgSend(_b,"setSubmenu:",_a);
objj_msgSend(_mainMenu,"addItem:",_b);
var _c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Edit",nil,nil),_d=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Edit"),_e=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Undo",sel_getUid("undo:"),CPUndoKeyEquivalent),_f=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Redo",sel_getUid("redo:"),CPRedoKeyEquivalent);
objj_msgSend(_e,"setKeyEquivalentModifierMask:",CPUndoKeyEquivalentModifierMask);
objj_msgSend(_f,"setKeyEquivalentModifierMask:",CPRedoKeyEquivalentModifierMask);
objj_msgSend(_d,"addItem:",_e);
objj_msgSend(_d,"addItem:",_f);
objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Cut",sel_getUid("cut:"),"X")),objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Copy",sel_getUid("copy:"),"C")),objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Paste",sel_getUid("paste:"),"V"));
objj_msgSend(_c,"setSubmenu:",_d);
objj_msgSend(_c,"setHidden:",YES);
objj_msgSend(_mainMenu,"addItem:",_c);
objj_msgSend(_mainMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
}
return _5;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_10,_11,_12){
with(_10){
if(_delegate==_12){
return;
}
var _13=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_13,"removeObserver:name:object:",_delegate,CPApplicationWillFinishLaunchingNotification,_10);
objj_msgSend(_13,"removeObserver:name:object:",_delegate,CPApplicationDidFinishLaunchingNotification,_10);
}
_delegate=_12;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationWillFinishLaunching:"))){
objj_msgSend(_13,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationWillFinishLaunching:"),CPApplicationWillFinishLaunchingNotification,_10);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationDidFinishLaunching:"))){
objj_msgSend(_13,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationDidFinishLaunching:"),CPApplicationDidFinishLaunchingNotification,_10);
}
}
}),new objj_method(sel_getUid("delegate"),function(_14,_15){
with(_14){
return _delegate;
}
}),new objj_method(sel_getUid("finishLaunching"),function(_16,_17){
with(_16){
var _18=objj_msgSend(CPBundle,"mainBundle"),_19=objj_msgSend(_18,"objectForInfoDictionaryKey:","CPBundleDocumentTypes");
if(objj_msgSend(_19,"count")>0){
_documentController=objj_msgSend(CPDocumentController,"sharedDocumentController");
}
var _1a=objj_msgSend(_18,"objectForInfoDictionaryKey:","CPApplicationDelegateClass");
if(_1a){
var _1b=objj_getClass(_1a);
if(_1b){
if(objj_msgSend(_documentController,"class")==_1b){
objj_msgSend(_16,"setDelegate:",_documentController);
}else{
objj_msgSend(_16,"setDelegate:",objj_msgSend(objj_msgSend(_1b,"alloc"),"init"));
}
}
}
var _1c=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_1c,"postNotificationName:object:",CPApplicationWillFinishLaunchingNotification,_16);
var _1d=window.cpOpeningFilename&&window.cpOpeningFilename(),_1e=!!_documentController;
if(objj_msgSend(_1d,"length")){
_1e=!objj_msgSend(_16,"_openFile:",_1d);
}
if(_1e&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationShouldOpenUntitledFile:"))){
_1e=objj_msgSend(_delegate,"applicationShouldOpenUntitledFile:",_16);
}
if(_1e){
objj_msgSend(_documentController,"newDocument:",_16);
}
objj_msgSend(_1c,"postNotificationName:object:",CPApplicationDidFinishLaunchingNotification,_16);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
_finishedLaunching=YES;
}
}),new objj_method(sel_getUid("terminate:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(CPPlatform,"terminateApplication");
}
}),new objj_method(sel_getUid("run"),function(_22,_23){
with(_22){
objj_msgSend(_22,"finishLaunching");
}
}),new objj_method(sel_getUid("runModalForWindow:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"runModalSession:",objj_msgSend(_24,"beginModalSessionForWindow:",_26));
}
}),new objj_method(sel_getUid("stopModalWithCode:"),function(_27,_28,_29){
with(_27){
if(!_currentSession){
return;
}
_currentSession._state=_29;
_currentSession=_currentSession._previous;
objj_msgSend(_27,"_removeRunModalLoop");
}
}),new objj_method(sel_getUid("_removeRunModalLoop"),function(_2a,_2b){
with(_2a){
var _2c=_eventListeners.length;
while(_2c--){
if(_eventListeners[_2c]._callback===_2d){
_eventListeners.splice(_2c,1);
return;
}
}
}
}),new objj_method(sel_getUid("stopModal"),function(_2e,_2f){
with(_2e){
objj_msgSend(_2e,"stopModalWithCode:",CPRunStoppedResponse);
}
}),new objj_method(sel_getUid("abortModal"),function(_30,_31){
with(_30){
objj_msgSend(_30,"stopModalWithCode:",CPRunAbortedResponse);
}
}),new objj_method(sel_getUid("beginModalSessionForWindow:"),function(_32,_33,_34){
with(_32){
return _35(_34,0);
}
}),new objj_method(sel_getUid("runModalSession:"),function(_36,_37,_38){
with(_36){
_38._previous=_currentSession;
_currentSession=_38;
var _39=_38._window;
objj_msgSend(_39,"center");
objj_msgSend(_39,"makeKeyAndOrderFront:",_36);
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_2d,CPAnyEventMask,nil,0,NO);
}
}),new objj_method(sel_getUid("modalWindow"),function(_3a,_3b){
with(_3a){
if(!_currentSession){
return nil;
}
return _currentSession._window;
}
}),new objj_method(sel_getUid("_handleKeyEquivalent:"),function(_3c,_3d,_3e){
with(_3c){
if(objj_msgSend(_mainMenu,"performKeyEquivalent:",_3e)){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendEvent:"),function(_3f,_40,_41){
with(_3f){
_currentEvent=_41;
if(objj_msgSend(_41,"type")==CPKeyDown&&objj_msgSend(_41,"modifierFlags")&(CPCommandKeyMask|CPControlKeyMask)&&objj_msgSend(objj_msgSend(_41,"characters"),"length")>0&&objj_msgSend(_3f,"_handleKeyEquivalent:",_41)){
return;
}
if(_eventListeners.length){
if(_eventListeners[_eventListeners.length-1]._mask&(1<<objj_msgSend(_41,"type"))){
_eventListeners.pop()._callback(_41);
}
return;
}
objj_msgSend(objj_msgSend(_41,"window"),"sendEvent:",_41);
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_42,_43,_44){
with(_42){
if(objj_msgSend(_delegate,"respondsToSelector:",_44)){
objj_msgSend(_delegate,"performSelector:",_44);
}else{
objj_msgSendSuper({receiver:_42,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_44);
}
}
}),new objj_method(sel_getUid("keyWindow"),function(_45,_46){
with(_45){
return _keyWindow;
}
}),new objj_method(sel_getUid("mainWindow"),function(_47,_48){
with(_47){
return _mainWindow;
}
}),new objj_method(sel_getUid("windowWithWindowNumber:"),function(_49,_4a,_4b){
with(_49){
return _windows[_4b];
}
}),new objj_method(sel_getUid("windows"),function(_4c,_4d){
with(_4c){
return _windows;
}
}),new objj_method(sel_getUid("mainMenu"),function(_4e,_4f){
with(_4e){
return _mainMenu;
}
}),new objj_method(sel_getUid("setMainMenu:"),function(_50,_51,_52){
with(_50){
if(objj_msgSend(_52,"_menuName")==="CPMainMenu"){
if(_mainMenu===_52){
return;
}
_mainMenu=_52;
if(objj_msgSend(CPPlatform,"supportsNativeMainMenu")){
window.cpSetMainMenu(_mainMenu);
}
}else{
objj_msgSend(_52,"_setMenuName:","CPMainMenu");
}
}
}),new objj_method(sel_getUid("orderFrontColorPanel:"),function(_53,_54,_55){
with(_53){
objj_msgSend(objj_msgSend(CPColorPanel,"sharedColorPanel"),"orderFront:",_53);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanel:"),function(_56,_57,_58){
with(_56){
objj_msgSend(_56,"orderFrontStandardAboutPanelWithOptions:",nil);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanelWithOptions:"),function(_59,_5a,_5b){
with(_59){
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_5c,_5d,_5e,_5f){
with(_5c){
if(!_5e){
return NO;
}
if(objj_msgSendSuper({receiver:_5c,super_class:objj_getClass("CPResponder")},"tryToPerform:with:",_5e,_5f)){
return YES;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_5e)){
objj_msgSend(_delegate,"performSelector:withObject:",_5e,_5f);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendAction:to:from:"),function(_60,_61,_62,_63,_64){
with(_60){
var _65=objj_msgSend(_60,"targetForAction:to:from:",_62,_63,_64);
if(!_65){
return NO;
}
objj_msgSend(_65,"performSelector:withObject:",_62,_64);
return YES;
}
}),new objj_method(sel_getUid("targetForAction:to:from:"),function(_66,_67,_68,_69,_6a){
with(_66){
if(!_68){
return nil;
}
if(_69){
return _69;
}
return objj_msgSend(_66,"targetForAction:",_68);
}
}),new objj_method(sel_getUid("_targetForWindow:action:"),function(_6b,_6c,_6d,_6e){
with(_6b){
var _6f=objj_msgSend(_6d,"firstResponder"),_70=YES;
while(_6f){
if(objj_msgSend(_6f,"respondsToSelector:",_6e)){
return _6f;
}
if(_6f==_6d){
_70=NO;
}
_6f=objj_msgSend(_6f,"nextResponder");
}
if(_70&&objj_msgSend(_6d,"respondsToSelector:",_6e)){
return _6d;
}
var _71=objj_msgSend(_6d,"delegate");
if(objj_msgSend(_71,"respondsToSelector:",_6e)){
return _71;
}
var _72=objj_msgSend(_6d,"windowController");
if(objj_msgSend(_72,"respondsToSelector:",_6e)){
return _72;
}
var _73=objj_msgSend(_72,"document");
if(_73!=_71&&objj_msgSend(_73,"respondsToSelector:",_6e)){
return _73;
}
return nil;
}
}),new objj_method(sel_getUid("targetForAction:"),function(_74,_75,_76){
with(_74){
if(!_76){
return nil;
}
var _77=objj_msgSend(_74,"_targetForWindow:action:",objj_msgSend(_74,"keyWindow"),_76);
if(_77){
return _77;
}
_77=objj_msgSend(_74,"_targetForWindow:action:",objj_msgSend(_74,"mainWindow"),_76);
if(_77){
return _77;
}
if(objj_msgSend(_74,"respondsToSelector:",_76)){
return _74;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_76)){
return _delegate;
}
if(objj_msgSend(_documentController,"respondsToSelector:",_76)){
return _documentController;
}
return nil;
}
}),new objj_method(sel_getUid("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_78,_79,_7a,_7b,_7c,_7d,_7e){
with(_78){
_eventListeners.push(_7f(_7b,_7a));
if(_eventListeners.length==3){
objj_debug_print_backtrace();
}
}
}),new objj_method(sel_getUid("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_80,_81,_82,_83,_84,_85,_86,_87){
with(_80){
_eventListeners.push(_7f(_84,function(_88){
objj_msgSend(_82,_83,_88);
}));
}
}),new objj_method(sel_getUid("currentEvent"),function(_89,_8a){
with(_89){
return _currentEvent;
}
}),new objj_method(sel_getUid("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"),function(_8b,_8c,_8d,_8e,_8f,_90,_91){
with(_8b){
objj_msgSend(_8e,"_attachSheet:modalDelegate:didEndSelector:contextInfo:",_8d,_8f,_90,_91);
}
}),new objj_method(sel_getUid("arguments"),function(_92,_93){
with(_92){
if(_fullArgsString!=window.location.hash){
objj_msgSend(_92,"_reloadArguments");
}
return _args;
}
}),new objj_method(sel_getUid("setArguments:"),function(_94,_95,_96){
with(_94){
if(!_96||_96.length==0){
_args=[];
window.location.hash="#";
return;
}
if(objj_msgSend(_96,"class")!=CPArray){
_96=objj_msgSend(CPArray,"arrayWithObject:",_96);
}
_args=_96;
var _97=objj_msgSend(_args,"copy");
for(var i=0,_99=_97.length;i<_99;i++){
_97[i]=encodeURIComponent(_97[i]);
}
var _9a=objj_msgSend(_97,"componentsJoinedByString:","/");
window.location.hash="#"+_9a;
}
}),new objj_method(sel_getUid("_reloadArguments"),function(_9b,_9c){
with(_9b){
_fullArgsString=window.location.hash;
var _9d=_fullArgsString.replace("#","").split("/").slice(0);
for(var i=0,_9f=_9d.length;i<_9f;i++){
_9d[i]=decodeURIComponent(_9d[i]);
}
_args=_9d;
}
}),new objj_method(sel_getUid("namedArguments"),function(_a0,_a1){
with(_a0){
return _namedArgs;
}
}),new objj_method(sel_getUid("_openFile:"),function(_a2,_a3,_a4){
with(_a2){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("application:openFile:"))){
return objj_msgSend(_delegate,"application:openFile:",_a2,_a4);
}else{
return objj_msgSend(_documentController,"openDocumentWithContentsOfURL:display:error:",_a4,YES,NULL);
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedApplication"),function(_a5,_a6){
with(_a5){
if(!CPApp){
CPApp=objj_msgSend(objj_msgSend(CPApplication,"alloc"),"init");
}
return CPApp;
}
})]);
var _35=function(_a7,_a8){
return {_window:_a7,_state:CPRunContinuesResponse,_previous:nil};
};
var _7f=function(_a9,_aa){
return {_mask:_a9,_callback:_aa};
};
var _2d=function(_ab){
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_2d,CPAnyEventMask,nil,0,NO);
var _ac=objj_msgSend(_ab,"window"),_ad=CPApp._currentSession;
if(_ac==_ad._window||objj_msgSend(_ac,"worksWhenModal")){
objj_msgSend(_ac,"sendEvent:",_ab);
}
};
CPApplicationMain=function(_ae,_af){
var _b0=objj_msgSend(CPBundle,"mainBundle"),_b1=objj_msgSend(_b0,"principalClass");
if(!_b1){
_b1=objj_msgSend(CPApplication,"class");
}
objj_msgSend(_b1,"sharedApplication");
if(!_ae){
var _ae=objj_msgSend(CPApp,"arguments");
if(objj_msgSend(_ae,"containsObject:","debug")){
CPLogRegister(CPLogPopup);
}
}
if(!_af){
var _b2=window.location.search.substring(1).split("&");
_af=objj_msgSend(CPDictionary,"dictionary");
for(var i=0;i<_b2.length;i++){
var _b4=_b2[i].indexOf("=");
if(_b4==-1){
objj_msgSend(_af,"setObject:forKey:","",_b2[i]);
}else{
objj_msgSend(_af,"setObject:forKey:",_b2[i].substring(_b4+1),_b2[i].substring(0,_b4));
}
}
}
CPApp._args=_ae;
CPApp._namedArgs=_af;
objj_msgSend(_CPAppBootstrapper,"performActions");
};
var _b5=nil;
var _3=objj_allocateClassPair(CPObject,"_CPAppBootstrapper"),_4=_3.isa;
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("actions"),function(_b6,_b7){
with(_b6){
return [sel_getUid("bootstrapPlatform"),sel_getUid("loadDefaultTheme"),sel_getUid("loadMainCibFile")];
}
}),new objj_method(sel_getUid("performActions"),function(_b8,_b9){
with(_b8){
if(!_b5){
_b5=objj_msgSend(_b8,"actions");
}
while(_b5.length){
var _ba=_b5.shift();
if(objj_msgSend(_b8,_ba)){
return;
}
}
objj_msgSend(CPApp,"run");
}
}),new objj_method(sel_getUid("bootstrapPlatform"),function(_bb,_bc){
with(_bb){
return objj_msgSend(CPPlatform,"bootstrap");
}
}),new objj_method(sel_getUid("loadDefaultTheme"),function(_bd,_be){
with(_bd){
var _bf=objj_msgSend(objj_msgSend(CPThemeBlend,"alloc"),"initWithContentsOfURL:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),"pathForResource:","Aristo.blend"));
objj_msgSend(_bf,"loadWithDelegate:",_bd);
return YES;
}
}),new objj_method(sel_getUid("blendDidFinishLoading:"),function(_c0,_c1,_c2){
with(_c0){
objj_msgSend(CPTheme,"setDefaultTheme:",objj_msgSend(CPTheme,"themeNamed:","Aristo"));
objj_msgSend(_c0,"performActions");
}
}),new objj_method(sel_getUid("loadMainCibFile"),function(_c3,_c4){
with(_c3){
var _c5=objj_msgSend(CPBundle,"mainBundle"),_c6=objj_msgSend(_c5,"objectForInfoDictionaryKey:",_1)||objj_msgSend(_c5,"objectForInfoDictionaryKey:",_2);
if(_c6){
objj_msgSend(_c5,"loadCibFile:externalNameTable:loadDelegate:",_c6,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPApp,CPCibOwner),_c3);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_c7,_c8,_c9){
with(_c7){
objj_msgSend(_c7,"performActions");
}
})]);
