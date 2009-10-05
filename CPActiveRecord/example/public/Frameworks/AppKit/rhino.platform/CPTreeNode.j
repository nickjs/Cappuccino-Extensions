I;21;Foundation/CPObject.jc;2368;
var _1=objj_allocateClassPair(CPObject,"CPTreeNode"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_representedObject"),new objj_ivar("_parentNode"),new objj_ivar("_childNodes")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("representedObject"),function(_3,_4){
with(_3){
return _representedObject;
}
}),new objj_method(sel_getUid("parentNode"),function(_5,_6){
with(_5){
return _parentNode;
}
}),new objj_method(sel_getUid("childNodes"),function(_7,_8){
with(_7){
return _childNodes;
}
}),new objj_method(sel_getUid("initWithRepresentedObject:"),function(_9,_a,_b){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"init");
if(_9){
_representedObject=_b;
_childNodes=[];
}
return _9;
}
}),new objj_method(sel_getUid("isLeaf"),function(_c,_d){
with(_c){
return objj_msgSend(_childNodes,"count")<=0;
}
}),new objj_method(sel_getUid("mutableChildNodes"),function(_e,_f){
with(_e){
return objj_msgSend(_e,"mutableArrayValueForKey:","childNodes");
}
}),new objj_method(sel_getUid("insertObject:inChildNodesAtIndex:"),function(_10,_11,_12,_13){
with(_10){
_12._parentNode=_10;
objj_msgSend(_childNodes,"addObject:",_12);
}
}),new objj_method(sel_getUid("removeObjectFromChildNodesAtIndex:"),function(_14,_15,_16){
with(_14){
anObject._parentNode=nil;
objj_msgSend(_childNodes,"removeObjectAtIndex:",_16);
}
}),new objj_method(sel_getUid("replaceObjectFromChildNodesAtIndex:withObject:"),function(_17,_18,_19,_1a){
with(_17){
var _1b=objj_msgSend(_childNodes,"objectAtIndex:",_19);
_1b._parentNode=nil;
objj_msgSend(_childNodes,"replaceObjectAtIndex:withObject:",_19,_1a);
}
}),new objj_method(sel_getUid("objectInChildNodesAtIndex:"),function(_1c,_1d,_1e){
with(_1c){
return _childNodes[_1e];
}
}),new objj_method(sel_getUid("sortWithSortDescriptors:recursively:"),function(_1f,_20,_21,_22){
with(_1f){
objj_msgSend(_childNodes,"sortUsingDescriptors:",_21);
if(!_22){
return;
}
var _23=objj_msgSend(_childNodes,"count");
while(_23--){
objj_msgSend(_childNodes[_23],"sortWithSortDescriptors:recursively:",_21,YES);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("treeNodeWithRepresentedObject:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(objj_msgSend(_24,"alloc"),"initWithRepresentedObject:",_26);
}
})]);
