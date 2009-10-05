i;10;CPObject.ji;14;CPInvocation.jc;13713;
var _1=0,_2=1,_3=2;
CPUndoManagerCheckpointNotification="CPUndoManagerCheckpointNotification";
CPUndoManagerDidOpenUndoGroupNotification="CPUndoManagerDidOpenUndoGroupNotification";
CPUndoManagerDidRedoChangeNotification="CPUndoManagerDidRedoChangeNotification";
CPUndoManagerDidUndoChangeNotification="CPUndoManagerDidUndoChangeNotification";
CPUndoManagerWillCloseUndoGroupNotification="CPUndoManagerWillCloseUndoGroupNotification";
CPUndoManagerWillRedoChangeNotification="CPUndoManagerWillRedoChangeNotification";
CPUndoManagerWillUndoChangeNotification="CPUndoManagerWillUndoChangeNotification";
CPUndoCloseGroupingRunLoopOrdering=350000;
var _4=[],_5=5;
var _6=objj_allocateClassPair(CPObject,"_CPUndoGrouping"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_parent"),new objj_ivar("_invocations")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("initWithParent:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPObject")},"init");
if(_8){
_parent=_a;
_invocations=[];
}
return _8;
}
}),new objj_method(sel_getUid("parent"),function(_b,_c){
with(_b){
return _parent;
}
}),new objj_method(sel_getUid("addInvocation:"),function(_d,_e,_f){
with(_d){
_invocations.push(_f);
}
}),new objj_method(sel_getUid("addInvocationsFromArray:"),function(_10,_11,_12){
with(_10){
objj_msgSend(_invocations,"addObjectsFromArray:",_12);
}
}),new objj_method(sel_getUid("removeInvocationsWithTarget:"),function(_13,_14,_15){
with(_13){
var _16=_invocations.length;
while(_16--){
if(objj_msgSend(_invocations[_16],"target")==_15){
_invocations.splice(_16,1);
}
}
}
}),new objj_method(sel_getUid("invocations"),function(_17,_18){
with(_17){
return _invocations;
}
}),new objj_method(sel_getUid("invoke"),function(_19,_1a){
with(_19){
var _1b=_invocations.length;
while(_1b--){
objj_msgSend(_invocations[_1b],"invoke");
}
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("_poolUndoGrouping:"),function(_1c,_1d,_1e){
with(_1c){
if(!_1e||_4.length>=_5){
return;
}
_4.push(_1e);
}
}),new objj_method(sel_getUid("undoGroupingWithParent:"),function(_1f,_20,_21){
with(_1f){
if(_4.length){
var _22=_4.pop();
_22._parent=_21;
if(_22._invocations.length){
_22._invocations=[];
}
return _22;
}
return objj_msgSend(objj_msgSend(_1f,"alloc"),"initWithParent:",_21);
}
})]);
var _23="_CPUndoGroupingParentKey",_24="_CPUndoGroupingInvocationsKey";
var _6=objj_getClass("_CPUndoGrouping");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPUndoGrouping\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_25,_26,_27){
with(_25){
_25=objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPObject")},"init");
if(_25){
_parent=objj_msgSend(_27,"decodeObjectForKey:",_23);
_invocations=objj_msgSend(_27,"decodeObjectForKey:",_24);
}
return _25;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_2a,"encodeObject:forKey:",_parent,_23);
objj_msgSend(_2a,"encodeObject:forKey:",_invocations,_24);
}
})]);
var _6=objj_allocateClassPair(CPObject,"CPUndoManager"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_redoStack"),new objj_ivar("_undoStack"),new objj_ivar("_groupsByEvent"),new objj_ivar("_disableCount"),new objj_ivar("_levelsOfUndo"),new objj_ivar("_currentGrouping"),new objj_ivar("_state"),new objj_ivar("_actionName"),new objj_ivar("_preparedTarget"),new objj_ivar("_runLoopModes"),new objj_ivar("_registeredWithRunLoop")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("init"),function(_2b,_2c){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("CPObject")},"init");
if(_2b){
_redoStack=[];
_undoStack=[];
_state=_1;
objj_msgSend(_2b,"setRunLoopModes:",[CPDefaultRunLoopMode]);
objj_msgSend(_2b,"setGroupsByEvent:",YES);
_performRegistered=NO;
}
return _2b;
}
}),new objj_method(sel_getUid("registerUndoWithTarget:selector:object:"),function(_2d,_2e,_2f,_30,_31){
with(_2d){
if(!_currentGrouping){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"No undo group is currently open");
}
if(_disableCount>0){
return;
}
var _32=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",nil);
objj_msgSend(_32,"setTarget:",_2f);
objj_msgSend(_32,"setSelector:",_30);
objj_msgSend(_32,"setArgument:atIndex:",_31,2);
objj_msgSend(_currentGrouping,"addInvocation:",_32);
if(_state==_1){
objj_msgSend(_redoStack,"removeAllObjects");
}
}
}),new objj_method(sel_getUid("prepareWithInvocationTarget:"),function(_33,_34,_35){
with(_33){
_preparedTarget=_35;
return _33;
}
}),new objj_method(sel_getUid("methodSignatureForSelector:"),function(_36,_37,_38){
with(_36){
if(objj_msgSend(_preparedTarget,"respondsToSelector:",_38)){
return 1;
}
return nil;
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_39,_3a,_3b){
with(_39){
if(_disableCount>0){
return;
}
objj_msgSend(_3b,"setTarget:",_preparedTarget);
objj_msgSend(_currentGrouping,"addInvocation:",_3b);
if(_state==_1){
objj_msgSend(_redoStack,"removeAllObjects");
}
_preparedTarget=nil;
}
}),new objj_method(sel_getUid("canRedo"),function(_3c,_3d){
with(_3c){
return _redoStack.length>0;
}
}),new objj_method(sel_getUid("canUndo"),function(_3e,_3f){
with(_3e){
if(_undoStack.length>0){
return YES;
}
return objj_msgSend(_currentGrouping,"actions").length>0;
}
}),new objj_method(sel_getUid("undo"),function(_40,_41){
with(_40){
if(objj_msgSend(_40,"groupingLevel")==1){
objj_msgSend(_40,"endUndoGrouping");
}
objj_msgSend(_40,"undoNestedGroup");
}
}),new objj_method(sel_getUid("undoNestedGroup"),function(_42,_43){
with(_42){
if(_undoStack.length==0){
return;
}
var _44=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_44,"postNotificationName:object:",CPUndoManagerWillUndoChangeNotification,_42);
var _45=_undoStack.pop();
_state=_2;
objj_msgSend(_42,"beginUndoGrouping");
objj_msgSend(_45,"invoke");
objj_msgSend(_42,"endUndoGrouping");
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_45);
_state=_1;
objj_msgSend(_44,"postNotificationName:object:",CPUndoManagerDidUndoChangeNotification,_42);
}
}),new objj_method(sel_getUid("redo"),function(_46,_47){
with(_46){
if(_redoStack.length==0){
return;
}
var _48=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_48,"postNotificationName:object:",CPUndoManagerWillRedoChangeNotification,_46);
var _49=_currentGrouping,_4a=_redoStack.pop();
_currentGrouping=nil;
_state=_3;
objj_msgSend(_46,"beginUndoGrouping");
objj_msgSend(_4a,"invoke");
objj_msgSend(_46,"endUndoGrouping");
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_4a);
_currentGrouping=_49;
_state=_1;
objj_msgSend(_48,"postNotificationName:object:",CPUndoManagerDidRedoChangeNotification,_46);
}
}),new objj_method(sel_getUid("beginUndoGrouping"),function(_4b,_4c){
with(_4b){
_currentGrouping=objj_msgSend(_CPUndoGrouping,"undoGroupingWithParent:",_currentGrouping);
}
}),new objj_method(sel_getUid("endUndoGrouping"),function(_4d,_4e){
with(_4d){
if(!_currentGrouping){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"endUndoGrouping. No undo group is currently open.");
}
var _4f=objj_msgSend(_currentGrouping,"parent");
if(!_4f&&objj_msgSend(_currentGrouping,"invocations").length>0){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPUndoManagerWillCloseUndoGroupNotification,_4d);
var _50=_state==_2?_redoStack:_undoStack;
_50.push(_currentGrouping);
if(_levelsOfUndo>0&&_50.length>_levelsOfUndo){
_50.splice(0,1);
}
}else{
objj_msgSend(_4f,"addInvocationsFromArray:",objj_msgSend(_currentGrouping,"invocations"));
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_currentGrouping);
}
_currentGrouping=_4f;
}
}),new objj_method(sel_getUid("enableUndoRegistration"),function(_51,_52){
with(_51){
if(_disableCount<=0){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"enableUndoRegistration. There are no disable messages in effect right now.");
}
_disableCount--;
}
}),new objj_method(sel_getUid("groupsByEvent"),function(_53,_54){
with(_53){
return _groupsByEvent;
}
}),new objj_method(sel_getUid("setGroupsByEvent:"),function(_55,_56,_57){
with(_55){
if(_groupsByEvent==_57){
return;
}
_groupsByEvent=_57;
if(_groupsByEvent){
objj_msgSend(_55,"_registerWithRunLoop");
if(!_currentGrouping){
objj_msgSend(_55,"beginUndoGrouping");
}
}else{
objj_msgSend(_55,"_unregisterWithRunLoop");
}
}
}),new objj_method(sel_getUid("groupingLevel"),function(_58,_59){
with(_58){
var _5a=_currentGrouping,_5b=_currentGrouping!=nil;
while(_5a=objj_msgSend(_5a,"parent")){
++_5b;
}
return _5b;
}
}),new objj_method(sel_getUid("disableUndoRegistration"),function(_5c,_5d){
with(_5c){
++_disableCount;
}
}),new objj_method(sel_getUid("isUndoRegistrationEnabled"),function(_5e,_5f){
with(_5e){
return _disableCount==0;
}
}),new objj_method(sel_getUid("isUndoing"),function(_60,_61){
with(_60){
return _state==_2;
}
}),new objj_method(sel_getUid("isRedoing"),function(_62,_63){
with(_62){
return _state==_3;
}
}),new objj_method(sel_getUid("removeAllActions"),function(_64,_65){
with(_64){
_redoStack=[];
_undoStack=[];
_disableCount=0;
}
}),new objj_method(sel_getUid("removeAllActionsWithTarget:"),function(_66,_67,_68){
with(_66){
objj_msgSend(_currentGrouping,"removeInvocationsWithTarget:",_68);
var _69=_redoStack.length;
while(_69--){
var _6a=_redoStack[_69];
objj_msgSend(_6a,"removeInvocationsWithTarget:",_68);
if(!objj_msgSend(_6a,"invocations").length){
_redoStack.splice(_69,1);
}
}
_69=_undoStack.length;
while(_69--){
var _6a=_undoStack[_69];
objj_msgSend(_6a,"removeInvocationsWithTarget:",_68);
if(!objj_msgSend(_6a,"invocations").length){
_undoStack.splice(_69,1);
}
}
}
}),new objj_method(sel_getUid("setActionName:"),function(_6b,_6c,_6d){
with(_6b){
_actionName=_6d;
}
}),new objj_method(sel_getUid("redoActionName"),function(_6e,_6f){
with(_6e){
return objj_msgSend(_6e,"canRedo")?_actionName:nil;
}
}),new objj_method(sel_getUid("undoActionName"),function(_70,_71){
with(_70){
return objj_msgSend(_70,"canUndo")?_actionName:nil;
}
}),new objj_method(sel_getUid("runLoopModes"),function(_72,_73){
with(_72){
return _runLoopModes;
}
}),new objj_method(sel_getUid("setRunLoopModes:"),function(_74,_75,_76){
with(_74){
_runLoopModes=_76;
objj_msgSend(_74,"_unregisterWithRunLoop");
if(_groupsByEvent){
objj_msgSend(_74,"_registerWithRunLoop");
}
}
}),new objj_method(sel_getUid("beginUndoGroupingForEvent"),function(_77,_78){
with(_77){
if(!_groupsByEvent){
return;
}
if(_currentGrouping!=nil){
objj_msgSend(_77,"endUndoGrouping");
}
objj_msgSend(_77,"beginUndoGrouping");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("beginUndoGroupingForEvent"),_77,nil,CPUndoCloseGroupingRunLoopOrdering,_runLoopModes);
}
}),new objj_method(sel_getUid("_registerWithRunLoop"),function(_79,_7a){
with(_79){
if(_registeredWithRunLoop){
return;
}
_registeredWithRunLoop=YES;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("beginUndoGroupingForEvent"),_79,nil,CPUndoCloseGroupingRunLoopOrdering,_runLoopModes);
}
}),new objj_method(sel_getUid("_unregisterWithRunLoop"),function(_7b,_7c){
with(_7b){
if(!_registeredWithRunLoop){
return;
}
_registeredWithRunLoop=NO;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"cancelPerformSelector:target:argument:",sel_getUid("beginUndoGroupingForEvent"),_7b,nil);
}
})]);
var _7d="CPUndoManagerRedoStackKey",_7e="CPUndoManagerUndoStackKey";
CPUndoManagerLevelsOfUndoKey="CPUndoManagerLevelsOfUndoKey";
CPUndoManagerActionNameKey="CPUndoManagerActionNameKey";
CPUndoManagerCurrentGroupingKey="CPUndoManagerCurrentGroupingKey";
CPUndoManagerRunLoopModesKey="CPUndoManagerRunLoopModesKey";
CPUndoManagerGroupsByEventKey="CPUndoManagerGroupsByEventKey";
var _6=objj_getClass("CPUndoManager");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPUndoManager\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_7f,_80,_81){
with(_7f){
_7f=objj_msgSendSuper({receiver:_7f,super_class:objj_getClass("CPObject")},"init");
if(_7f){
_redoStack=objj_msgSend(_81,"decodeObjectForKey:",_7d);
_undoStack=objj_msgSend(_81,"decodeObjectForKey:",_7e);
_levelsOfUndo=objj_msgSend(_81,"decodeObjectForKey:",CPUndoManagerLevelsOfUndoKey);
_actionName=objj_msgSend(_81,"decodeObjectForKey:",CPUndoManagerActionNameKey);
_currentGrouping=objj_msgSend(_81,"decodeObjectForKey:",CPUndoManagerCurrentGroupingKey);
_state=_1;
objj_msgSend(_7f,"setRunLoopModes:",objj_msgSend(_81,"decodeObjectForKey:",CPUndoManagerRunLoopModesKey));
objj_msgSend(_7f,"setGroupsByEvent:",objj_msgSend(_81,"decodeBoolForKey:",CPUndoManagerGroupsByEventKey));
}
return _7f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_82,_83,_84){
with(_82){
objj_msgSend(_84,"encodeObject:forKey:",_redoStack,_7d);
objj_msgSend(_84,"encodeObject:forKey:",_undoStack,_7e);
objj_msgSend(_84,"encodeInt:forKey:",_levelsOfUndo,CPUndoManagerLevelsOfUndoKey);
objj_msgSend(_84,"encodeObject:forKey:",_actionName,CPUndoManagerActionNameKey);
objj_msgSend(_84,"encodeObject:forKey:",_currentGrouping,CPUndoManagerCurrentGroupingKey);
objj_msgSend(_84,"encodeObject:forKey:",_runLoopModes,CPUndoManagerRunLoopModesKey);
objj_msgSend(_84,"encodeBool:forKey:",_groupsByEvent,CPUndoManagerGroupsByEventKey);
}
})]);
