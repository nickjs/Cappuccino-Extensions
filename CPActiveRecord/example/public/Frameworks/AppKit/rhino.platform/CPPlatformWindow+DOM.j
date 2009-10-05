I;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.ji;12;CPPlatform.ji;18;CPPlatformWindow.jc;23191;
var _1="dblclick",_2="mousedown",_3="mouseup",_4="mousemove",_5="mousedrag",_6="keyup",_7="keydown",_8="keypress",_9="copy",_a="paste",_b="resize",_c="mousewheel",_d="touchstart",_e="touchmove",_f="touchend",_10="touchcancel";
var _11=[];
_11["INPUT"]=YES;
_11["SELECT"]=YES;
_11["TEXTAREA"]=YES;
_11["OPTION"]=YES;
var _12,_13,_14;
var _15={},_16={},_17={"8":1,"9":1,"16":1,"37":1,"38":1,"39":1,"40":1,"46":1,"33":1,"34":1};
var _18=17;
var _19=objj_msgSend(CPPlatform,"supportsDragAndDrop");
var _1a=objj_getClass("CPPlatformWindow");
if(!_1a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPPlatformWindow\""));
}
var _1b=_1a.isa;
class_addMethods(_1a,[new objj_method(sel_getUid("_init"),function(_1c,_1d){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("CPObject")},"init");
if(_1c){
_DOMWindow=window;
_contentRect={origin:{x:0,y:0},size:{width:0,height:0}};
_windowLevels=[];
_windowLayers=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_1c,"registerDOMWindow");
objj_msgSend(_1c,"updateFromNativeContentRect");
_charCodes={};
}
return _1c;
}
}),new objj_method(sel_getUid("nativeContentRect"),function(_1e,_1f){
with(_1e){
if(!_DOMWindow){
return objj_msgSend(_1e,"contentRect");
}
if(_DOMWindow.cpFrame){
return _DOMWindow.cpFrame();
}
var _20={origin:{x:0,y:0},size:{width:0,height:0}};
if(window.screenTop){
_20.origin={x:_DOMWindow.screenLeft,y:_DOMWindow.screenTop};
}else{
if(window.screenX){
_20.origin={x:_DOMWindow.screenX,y:_DOMWindow.screenY};
}
}
if(_DOMWindow.innerWidth){
_20.size={width:_DOMWindow.innerWidth,height:_DOMWindow.innerHeight};
}else{
if(document.documentElement&&document.documentElement.clientWidth){
_20.size={width:_DOMWindow.document.documentElement.clientWidth,height:_DOMWindow.document.documentElement.clientHeight};
}else{
_20.size={width:_DOMWindow.document.body.clientWidth,height:_DOMWindow.document.body.clientHeight};
}
}
return _20;
}
}),new objj_method(sel_getUid("updateNativeContentRect"),function(_21,_22){
with(_21){
if(!_DOMWindow){
return;
}
if(typeof _DOMWindow["cpSetFrame"]==="function"){
return _DOMWindow.cpSetFrame(objj_msgSend(_21,"contentRect"));
}
var _23=objj_msgSend(_21,"contentRect").origin,_24=objj_msgSend(_21,"nativeContentRect").origin;
if(_23.x!==_24.x||_23.y!==_24.y){
_DOMWindow.moveBy(_23.x-_24.x,_23.y-_24.y);
}
var _25=objj_msgSend(_21,"contentRect").size,_26=objj_msgSend(_21,"nativeContentRect").size;
if(_25.width!==_26.width||_25.height!==_26.height){
_DOMWindow.resizeBy(_25.width-_26.width,_25.height-_26.height);
}
}
}),new objj_method(sel_getUid("orderBack:"),function(_27,_28,_29){
with(_27){
if(_DOMWindow){
_DOMWindow.blur();
}
}
}),new objj_method(sel_getUid("registerDOMWindow"),function(_2a,_2b){
with(_2a){
var _2c=_DOMWindow.document;
_DOMBodyElement=_2c.getElementsByTagName("body")[0];
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.style["-khtml-user-select"]="none";
}
_DOMBodyElement.webkitTouchCallout="none";
_DOMFocusElement=_2c.createElement("input");
_DOMFocusElement.style.position="absolute";
_DOMFocusElement.style.zIndex="-1000";
_DOMFocusElement.style.opacity="0";
_DOMFocusElement.style.filter="alpha(opacity=0)";
_DOMBodyElement.appendChild(_DOMFocusElement);
_DOMPasteboardElement=_2c.createElement("input");
_DOMPasteboardElement.style.position="absolute";
_DOMPasteboardElement.style.top="-10000px";
_DOMPasteboardElement.style.zIndex="99";
_DOMBodyElement.appendChild(_DOMPasteboardElement);
_DOMPasteboardElement.blur();
var _2d=objj_msgSend(_2a,"class"),_2e=class_getMethodImplementation(_2d,sel_getUid("dragEvent:")),_2f=function(_30){
_2e(_2a,nil,_30);
},_31=sel_getUid("resizeEvent:"),_32=class_getMethodImplementation(_2d,_31),_33=function(_34){
_32(_2a,nil,_34);
},_35=sel_getUid("keyEvent:"),_36=class_getMethodImplementation(_2d,_35),_37=function(_38){
_36(_2a,nil,_38);
},_39=sel_getUid("mouseEvent:"),_3a=class_getMethodImplementation(_2d,_39),_3b=function(_3c){
_3a(_2a,nil,_3c);
},_3d=sel_getUid("scrollEvent:"),_3e=class_getMethodImplementation(_2d,_3d),_3f=function(_40){
_3e(_2a,nil,_40);
},_41=sel_getUid("touchEvent:"),_42=class_getMethodImplementation(_2d,_41),_43=function(_44){
_42(_2a,nil,_44);
};
if(_2c.addEventListener){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_2c.addEventListener("dragstart",_2f,NO);
_2c.addEventListener("drag",_2f,NO);
_2c.addEventListener("dragend",_2f,NO);
_2c.addEventListener("dragover",_2f,NO);
_2c.addEventListener("dragleave",_2f,NO);
_2c.addEventListener("drop",_2f,NO);
}
_2c.addEventListener("mouseup",_3b,NO);
_2c.addEventListener("mousedown",_3b,NO);
_2c.addEventListener("mousemove",_3b,NO);
_2c.addEventListener("keyup",_37,NO);
_2c.addEventListener("keydown",_37,NO);
_2c.addEventListener("keypress",_37,NO);
_2c.addEventListener("touchstart",_43,NO);
_2c.addEventListener("touchend",_43,NO);
_2c.addEventListener("touchmove",_43,NO);
_2c.addEventListener("touchcancel",_43,NO);
_DOMWindow.addEventListener("DOMMouseScroll",_3f,NO);
_DOMWindow.addEventListener("mousewheel",_3f,NO);
_DOMWindow.addEventListener("resize",_33,NO);
_DOMWindow.addEventListener("unload",function(){
objj_msgSend(_2a,"updateFromNativeContentRect");
_2c.removeEventListener("mouseup",_3b,NO);
_2c.removeEventListener("mousedown",_3b,NO);
_2c.removeEventListener("mousemove",_3b,NO);
_2c.removeEventListener("keyup",_37,NO);
_2c.removeEventListener("keydown",_37,NO);
_2c.removeEventListener("keypress",_37,NO);
_2c.removeEventListener("touchstart",_43,NO);
_2c.removeEventListener("touchend",_43,NO);
_2c.removeEventListener("touchmove",_43,NO);
_DOMWindow.removeEventListener("resize",_33,NO);
_DOMWindow.removeEventListener("DOMMouseScroll",_3f,NO);
_DOMWindow.removeEventListener("mousewheel",_3f,NO);
_2a._DOMWindow=nil;
},NO);
}else{
_2c.attachEvent("onmouseup",_3b);
_2c.attachEvent("onmousedown",_3b);
_2c.attachEvent("onmousemove",_3b);
_2c.attachEvent("ondblclick",_3b);
_2c.attachEvent("onkeyup",_37);
_2c.attachEvent("onkeydown",_37);
_2c.attachEvent("onkeypress",_37);
_DOMWindow.attachEvent("onresize",_33);
_DOMWindow.onmousewheel=_3f;
_2c.onmousewheel=_3f;
_2c.body.ondrag=function(){
return NO;
};
_2c.body.onselectstart=function(){
return _DOMWindow.event.srcElement===_DOMPasteboardElement;
};
_DOMWindow.attachEvent("onbeforeunload",function(){
objj_msgSend(_2a,"updateFromNativeContentRect");
_2c.removeEvent("onmouseup",_3b);
_2c.removeEvent("onmousedown",_3b);
_2c.removeEvent("onmousemove",_3b);
_2c.removeEvent("ondblclick",_3b);
_2c.removeEvent("onkeyup",_37);
_2c.removeEvent("onkeydown",_37);
_2c.removeEvent("onkeypress",_37);
_DOMWindow.removeEvent("onresize",_33);
_DOMWindow.onmousewheel=NULL;
_2c.onmousewheel=NULL;
_2c.body.ondrag=NULL;
_2c.body.onselectstart=NULL;
_2a._DOMWindow=nil;
},NO);
}
}
}),new objj_method(sel_getUid("orderFront:"),function(_45,_46,_47){
with(_45){
if(_DOMWindow){
return _DOMWindow.focus();
}
_DOMWindow=window.open("","_blank","menubar=no,location=no,resizable=yes,scrollbars=no,status=no,left="+(_contentRect.origin.x)+",top="+(_contentRect.origin.y)+",width="+(_contentRect.size.width)+",height="+(_contentRect.size.height));
_DOMWindow.document.write("<html><head></head><body style = 'background-color:transparent;'></body></html>");
_DOMWindow.document.close();
if(!objj_msgSend(CPPlatform,"isBrowser")){
_DOMWindow.cpSetLevel(_level);
_DOMWindow.cpSetHasShadow(_hasShadow);
}
objj_msgSend(_45,"registerDOMWindow");
}
}),new objj_method(sel_getUid("orderOut:"),function(_48,_49,_4a){
with(_48){
if(!_DOMWindow){
return;
}
_DOMWindow.close();
}
}),new objj_method(sel_getUid("dragEvent:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=_4d.type,_4f=objj_msgSend(CPDragServer,"sharedDragServer"),_50={x:_4d.clientX,y:_4d.clientY},_51=objj_msgSend(_CPDOMDataTransferPasteboard,"DOMDataTransferPasteboard");
objj_msgSend(_51,"_setDataTransfer:",_4d.dataTransfer);
if(_4d.type==="dragstart"){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
objj_msgSend(_51,"_setPasteboard:",objj_msgSend(_4f,"draggingPasteboard"));
var _52=objj_msgSend(_4f,"draggedWindow"),_53=objj_msgSend(_52,"frame"),_54=_52._DOMElement;
_54.style.left=-(_53.size.width)+"px";
_54.style.top=-(_53.size.height)+"px";
document.getElementsByTagName("body")[0].appendChild(_54);
var _55=objj_msgSend(_4f,"draggingOffset");
_4d.dataTransfer.setDragImage(_54,_55.width,_55.height);
objj_msgSend(_4f,"draggingStartedInPlatformWindow:globalLocation:",_4b,objj_msgSend(CPPlatform,"isBrowser")?_50:{x:_4d.screenX,y:_4d.screenY});
}else{
if(_4e==="drag"){
objj_msgSend(_4f,"draggingSourceUpdatedWithGlobalLocation:",objj_msgSend(CPPlatform,"isBrowser")?_50:{x:_4d.screenX,y:_4d.screenY});
}else{
if(_4e==="dragover"||_4e==="dragleave"){
if(_4d.preventDefault){
_4d.preventDefault();
}
var _56="none",_57=objj_msgSend(_4f,"draggingUpdatedInPlatformWindow:location:",_4b,_50);
if(_57===CPDragOperationMove||_57===CPDragOperationGeneric||_57===CPDragOperationPrivate){
_56="move";
}else{
if(_57===CPDragOperationCopy){
_56="copy";
}else{
if(_57===CPDragOperationLink){
_56="link";
}
}
}
_4d.dataTransfer.dropEffect=_56;
}else{
if(_4e==="dragend"){
objj_msgSend(_4f,"draggingEndedInPlatformWindow:globalLocation:",_4b,objj_msgSend(CPPlatform,"isBrowser")?_50:{x:_4d.screenX,y:_4d.screenY});
}else{
objj_msgSend(_4f,"performDragOperationInPlatformWindow:",_4b);
if(_4d.preventDefault){
_4d.preventDefault();
}
if(_4d.stopPropagation){
_4d.stopPropagation();
}
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("keyEvent:"),function(_58,_59,_5a){
with(_58){
var _5b,_5c=_5a.timeStamp?_5a.timeStamp:new Date(),_5d=(_5a.target||_5a.srcElement),_5e=objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"windowNumber"),_5f=(_5a.shiftKey?CPShiftKeyMask:0)|(_5a.ctrlKey?CPControlKeyMask:0)|(_5a.altKey?CPAlternateKeyMask:0)|(_5a.metaKey?CPCommandKeyMask:0);
if(_11[_5d.tagName]&&_5d!=_DOMFocusElement&&_5d!=_DOMPasteboardElement){
return;
}
_14=!(_5f&(CPControlKeyMask|CPCommandKeyMask))||_16[String.fromCharCode(_5a.keyCode||_5a.charCode).toLowerCase()]||_15[_5a.keyCode];
var _60=NO,_61=NO;
switch(_5a.type){
case "keydown":
_keyCode=_5a.keyCode;
var _62=String.fromCharCode(_keyCode).toLowerCase();
if(_62=="v"&&(_5f&CPPlatformActionKeyMask)){
_DOMPasteboardElement.select();
_DOMPasteboardElement.value="";
_60=YES;
}else{
if((_62=="c"||_62=="x")&&(_5f&CPPlatformActionKeyMask)){
_61=YES;
}else{
if(!CPFeatureIsCompatible(CPJavascriptRemedialKeySupport)){
return;
}else{
if(!_17[_keyCode]&&(_keyCode==_18||!(_5f&CPControlKeyMask))){
return;
}
}
}
}
case "keypress":
if((_5a.target||_5a.srcElement)==_DOMPasteboardElement){
return;
}
var _63=_keyCode,_64=_5a.keyCode||_5a.charCode,_65=(_charCodes[_63]!=nil);
_charCodes[_63]=_64;
var _62=String.fromCharCode(_64),_66=_62.toLowerCase();
_5b=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyDown,location,_5f,_5c,_5e,nil,_62,_66,_65,_63);
if(_60){
_pasteboardKeyDownEvent=_5b;
window.setNativeTimeout(function(){
objj_msgSend(_58,"_checkPasteboardElement");
},0);
return;
}
break;
case "keyup":
var _63=_5a.keyCode,_64=_charCodes[_63];
_charCodes[_63]=nil;
var _62=String.fromCharCode(_64),_66=_62.toLowerCase();
if(!(_5f&CPShiftKeyMask)){
_62=_66;
}
_5b=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyUp,location,_5f,_5c,_5e,nil,_62,_66,NO,_63);
break;
}
if(_5b){
_5b._DOMEvent=_5a;
objj_msgSend(CPApp,"sendEvent:",_5b);
if(_61){
var _67=objj_msgSend(CPPasteboard,"generalPasteboard"),_68=objj_msgSend(_67,"types");
if(_68.length){
if(objj_msgSend(_68,"indexOfObjectIdenticalTo:",CPStringPboardType)!=CPNotFound){
_DOMPasteboardElement.value=objj_msgSend(_67,"stringForType:",CPStringPboardType);
}else{
_DOMPasteboardElement.value=objj_msgSend(_67,"_generateStateUID");
}
_DOMPasteboardElement.select();
window.setNativeTimeout(function(){
objj_msgSend(_58,"_clearPasteboardElement");
},0);
}
return;
}
}
if(_14){
_13(_5a,_58);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("scrollEvent:"),function(_69,_6a,_6b){
with(_69){
if(!_6b){
_6b=window.event;
}
if(CPFeatureIsCompatible(CPJavaScriptMouseWheelValues_8_15)){
var x=0,y=0,_6e=_6b.target;
while(_6e.nodeType!==1){
_6e=_6e.parentNode;
}
if(_6e.offsetParent){
do{
x+=_6e.offsetLeft;
y+=_6e.offsetTop;
}while(_6e=_6e.offsetParent);
}
var _6f={x:(x+((_6b.clientX-8)/15)),y:(y+((_6b.clientY-8)/15))};
}else{
var _6f={x:_6b.clientX,y:_6b.clientY};
}
var _70=0,_71=0,_72=0,_73=_6b.timeStamp?_6b.timeStamp:new Date(),_74=(_6b.shiftKey?CPShiftKeyMask:0)|(_6b.ctrlKey?CPControlKeyMask:0)|(_6b.altKey?CPAlternateKeyMask:0)|(_6b.metaKey?CPCommandKeyMask:0);
_14=YES;
var _75=objj_msgSend(_69,"hitTest:",_6f);
if(!_75){
return;
}
var _72=objj_msgSend(_75,"windowNumber");
_6f=objj_msgSend(_75,"convertBridgeToBase:",_6f);
if(typeof _6b.wheelDeltaX!="undefined"){
_70=_6b.wheelDeltaX/120;
_71=_6b.wheelDeltaY/120;
}else{
if(_6b.wheelDelta){
_71=_6b.wheelDelta/120;
}else{
if(_6b.detail){
_71=-_6b.detail/3;
}else{
return;
}
}
}
if(!CPFeatureIsCompatible(CPJavaScriptNegativeMouseWheelValues)){
_70=-_70;
_71=-_71;
}
var _76=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPScrollWheel,_6f,_74,_73,_72,nil,-1,1,0);
_76._DOMEvent=_6b;
_76._deltaX=_70;
_76._deltaY=_71;
objj_msgSend(CPApp,"sendEvent:",_76);
if(_14){
_13(_6b,_69);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("resizeEvent:"),function(_77,_78,_79){
with(_77){
var _7a=objj_msgSend(_77,"contentRect").size;
objj_msgSend(_77,"updateFromNativeContentRect");
var _7b=_windowLevels,_7c=_windowLayers,_7d=_7b.length;
while(_7d--){
var _7e=objj_msgSend(_7c,"objectForKey:",_7b[_7d])._windows,_7f=_7e.length;
while(_7f--){
objj_msgSend(_7e[_7f],"resizeWithOldPlatformWindowSize:",_7a);
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("touchEvent:"),function(_80,_81,_82){
with(_80){
if(_82.touches&&(_82.touches.length==1||(_82.touches.length==0&&_82.changedTouches.length==1))){
var _83={};
switch(_82.type){
case CPDOMEventTouchStart:
_83.type=CPDOMEventMouseDown;
break;
case CPDOMEventTouchEnd:
_83.type=CPDOMEventMouseUp;
break;
case CPDOMEventTouchMove:
_83.type=CPDOMEventMouseMoved;
break;
case CPDOMEventTouchCancel:
_83.type=CPDOMEventMouseUp;
break;
}
var _84=_82.touches.length?_82.touches[0]:_82.changedTouches[0];
_83.clientX=_84.clientX;
_83.clientY=_84.clientY;
_83.timestamp=_82.timestamp;
_83.target=_82.target;
_83.shiftKey=_83.ctrlKey=_83.altKey=_83.metaKey=false;
_83.preventDefault=function(){
if(_82.preventDefault){
_82.preventDefault();
}
};
_83.stopPropagation=function(){
if(_82.stopPropagation){
_82.stopPropagation();
}
};
objj_msgSend(_80,"_bridgeMouseEvent:",_83);
return;
}else{
if(_82.preventDefault){
_82.preventDefault();
}
if(_82.stopPropagation){
_82.stopPropagation();
}
}
}
}),new objj_method(sel_getUid("mouseEvent:"),function(_85,_86,_87){
with(_85){
var _88=_overriddenEventType||_87.type;
if(_88==="dblclick"){
_overriddenEventType=CPDOMEventMouseDown;
objj_msgSend(_85,"_bridgeMouseEvent:",_87);
_overriddenEventType=CPDOMEventMouseUp;
objj_msgSend(_85,"_bridgeMouseEvent:",_87);
_overriddenEventType=nil;
return;
}
var _89,_8a={x:_87.clientX,y:_87.clientY},_8b=_87.timeStamp?_87.timeStamp:new Date(),_8c=(_87.target||_87.srcElement),_8d=0,_8e=(_87.shiftKey?CPShiftKeyMask:0)|(_87.ctrlKey?CPControlKeyMask:0)|(_87.altKey?CPAlternateKeyMask:0)|(_87.metaKey?CPCommandKeyMask:0);
_14=YES;
if(_mouseDownWindow){
_8d=objj_msgSend(_mouseDownWindow,"windowNumber");
}else{
var _8f=objj_msgSend(_85,"hitTest:",_8a);
if((_87.type===CPDOMEventMouseDown)&&_8f){
_mouseDownWindow=_8f;
}
_8d=objj_msgSend(_8f,"windowNumber");
}
if(_8d){
_8a=objj_msgSend(CPApp._windows[_8d],"convertPlatformWindowToBase:",_8a);
}
if(_88==="mouseup"){
if(_mouseIsDown){
_89=_90(_87,CPLeftMouseUp,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseUp,_8b,_8a),0);
_mouseIsDown=NO;
_lastMouseUp=_89;
_mouseDownWindow=nil;
}
if(_DOMEventMode){
_DOMEventMode=NO;
return;
}
}else{
if(_88==="mousedown"){
if(_11[_8c.tagName]&&_8c!=_DOMFocusElement){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.setAttribute("draggable","false");
_DOMBodyElement.style["-khtml-user-drag"]="none";
}
_DOMEventMode=YES;
_mouseIsDown=YES;
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseDown,_8b,_8a),0));
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseUp,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseDown,_8b,_8a),0));
return;
}else{
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.setAttribute("draggable","true");
_DOMBodyElement.style["-khtml-user-drag"]="element";
}
}
_89=_90(_87,CPLeftMouseDown,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseDown,_8b,_8a),0);
_mouseIsDown=YES;
_lastMouseDown=_89;
}else{
if(_DOMEventMode){
return;
}
_89=_90(_87,_mouseIsDown?CPLeftMouseDragged:CPMouseMoved,_8a,_8e,_8b,_8d,nil,-1,1,0);
}
}
var _91=objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"isDragging");
if(_89&&(!_91||!_19)){
_89._DOMEvent=_87;
objj_msgSend(CPApp,"sendEvent:",_89);
}
if(_14&&(!_19||_88!=="mousedown"&&!_91)){
_13(_87,_85);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("layerAtLevel:create:"),function(_92,_93,_94,_95){
with(_92){
var _96=objj_msgSend(_windowLayers,"objectForKey:",_94);
if(!_96&&_95){
_96=objj_msgSend(objj_msgSend(CPDOMWindowLayer,"alloc"),"initWithLevel:",_94);
objj_msgSend(_windowLayers,"setObject:forKey:",_96,_94);
var low=0,_98=_windowLevels.length-1,_99;
while(low<=_98){
_99=FLOOR((low+_98)/2);
if(_windowLevels[_99]>_94){
_98=_99-1;
}else{
low=_99+1;
}
}
objj_msgSend(_windowLevels,"insertObject:atIndex:",_94,_windowLevels[_99]>_94?_99:_99+1);
_96._DOMElement.style.zIndex=_94;
_DOMBodyElement.appendChild(_96._DOMElement);
}
return _96;
}
}),new objj_method(sel_getUid("order:window:relativeTo:"),function(_9a,_9b,_9c,_9d,_9e){
with(_9a){
var _9f=objj_msgSend(_9a,"layerAtLevel:create:",objj_msgSend(_9d,"level"),_9c!=CPWindowOut);
if(_9c==CPWindowOut){
return objj_msgSend(_9f,"removeWindow:",_9d);
}
objj_msgSend(_9f,"insertWindow:atIndex:",_9d,(_9e?(_9c==CPWindowAbove?_9e._index+1:_9e._index):CPNotFound));
}
}),new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_a0,_a1,_a2,_a3){
with(_a0){
var _a4=_windowLevels,_a5=_windowLayers,_a6=_a4.length;
while(_a6--){
if(_a4[_a6]>=CPDraggingWindowLevel){
continue;
}
var _a7=objj_msgSend(_a5,"objectForKey:",_a4[_a6])._windows,_a8=_a7.length;
while(_a8--){
var _a9=_a7[_a8];
if(objj_msgSend(_a9,"_sharesChromeWithPlatformWindow")){
return objj_msgSend(_a9,"_dragHitTest:pasteboard:",_a2,_a3);
}
if(objj_msgSend(_a9,"containsPoint:",_a2)){
return objj_msgSend(_a9,"_dragHitTest:pasteboard:",_a2,_a3);
}
}
}
return nil;
}
}),new objj_method(sel_getUid("_propagateCurrentDOMEvent:"),function(_aa,_ab,_ac){
with(_aa){
_14=!_ac;
}
}),new objj_method(sel_getUid("hitTest:"),function(_ad,_ae,_af){
with(_ad){
if(_ad._only){
return _ad._only;
}
var _b0=_windowLevels,_b1=_windowLayers,_b2=_b0.length,_b3=nil;
while(_b2--&&!_b3){
var _b4=objj_msgSend(_b1,"objectForKey:",_b0[_b2])._windows,_b5=_b4.length;
while(_b5--&&!_b3){
var _b6=_b4[_b5];
if(!_b6._ignoresMouseEvents&&objj_msgSend(_b6,"containsPoint:",_af)){
_b3=_b6;
}
}
}
return _b3;
}
}),new objj_method(sel_getUid("_checkPasteboardElement"),function(_b7,_b8){
with(_b7){
var _b9=_DOMPasteboardElement.value;
if(objj_msgSend(_b9,"length")){
var _ba=objj_msgSend(CPPasteboard,"generalPasteboard");
if(objj_msgSend(_ba,"_stateUID")!=_b9){
objj_msgSend(_ba,"declareTypes:owner:",[CPStringPboardType],_b7);
objj_msgSend(_ba,"setString:forType:",_b9,CPStringPboardType);
}
}
objj_msgSend(_b7,"_clearPasteboardElement");
objj_msgSend(CPApp,"sendEvent:",_pasteboardKeyDownEvent);
_pasteboardKeyDownEvent=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_clearPasteboardElement"),function(_bb,_bc){
with(_bb){
_DOMPasteboardElement.value="";
_DOMPasteboardElement.blur();
}
})]);
class_addMethods(_1b,[new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"),function(_bd,_be,_bf){
with(_bd){
for(var i=_bf.length;i>0;i--){
_16[""+_bf[i-1].toLowerCase()]=YES;
}
}
}),new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"),function(_c1,_c2,_c3){
with(_c1){
_16[_c3.toLowerCase()]=YES;
}
}),new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"),function(_c4,_c5){
with(_c4){
_16={};
}
}),new objj_method(sel_getUid("preventKeyCodesFromPropagating:"),function(_c6,_c7,_c8){
with(_c6){
for(var i=_c8.length;i>0;i--){
_15[_c8[i-1]]=YES;
}
}
}),new objj_method(sel_getUid("preventKeyCodeFromPropagating:"),function(_ca,_cb,_cc){
with(_ca){
_15[_cc]=YES;
}
}),new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"),function(_cd,_ce){
with(_cd){
_15={};
}
})]);
var _cf=objj_msgSend(CPEvent,"class");
var _90=function(_d0,_d1,_d2,_d3,_d4,_d5,_d6,_d7,_d8,_d9){
_d0.isa=_cf;
_d0._type=_d1;
_d0._location=_d2;
_d0._modifierFlags=_d3;
_d0._timestamp=_d4;
_d0._windowNumber=_d5;
_d0._window=nil;
_d0._context=_d6;
_d0._eventNumber=_d7;
_d0._clickCount=_d8;
_d0._pressure=_d9;
return _d0;
};
var _da=5,_db=(typeof document!="undefined"&&document.addEventListener)?350:1000;
var _12=function(_dc,_dd,_de){
if(!_dc){
return 1;
}
var _df=objj_msgSend(_dc,"locationInWindow");
return (_dd-objj_msgSend(_dc,"timestamp")<_db&&ABS(_df.x-_de.x)<_da&&ABS(_df.y-_de.y)<_da)?objj_msgSend(_dc,"clickCount")+1:1;
};
var _13=function(_e0,_e1){
_e0.cancelBubble=true;
_e0.returnValue=false;
if(_e0.preventDefault){
_e0.preventDefault();
}
if(_e0.stopPropagation){
_e0.stopPropagation();
}
if(_e0.type===CPDOMEventMouseDown){
_e1._DOMFocusElement.focus();
_e1._DOMFocusElement.blur();
}
};
CPWindowObjectList=function(){
var _e2=objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),_e3=_e2._windowLevels,_e4=_e2._windowLayers,_e5=_e3.length,_e6=[];
while(_e5--){
var _e7=objj_msgSend(_e4,"objectForKey:",_e3[_e5])._windows,_e8=_e7.length;
while(_e8--){
_e6.push(_e7[_e8]);
}
}
return _e6;
};
CPWindowList=function(){
var _e9=objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),_ea=_e9._windowLevels,_eb=_e9._windowLayers,_ec=_ea.length,_ed=[];
while(_ec--){
var _ee=objj_msgSend(_eb,"objectForKey:",_ea[_ec])._windows,_ef=_ee.length;
while(_ef--){
_ed.push(objj_msgSend(_ee[_ef],"windowNumber"));
}
}
return _ed;
};
