i;15;CPTableColumn.ji;13;CPTableView.jc;20462;
CPOutlineViewColumnDidMoveNotification="CPOutlineViewColumnDidMoveNotification";
CPOutlineViewColumnDidResizeNotification="CPOutlineViewColumnDidResizeNotification";
CPOutlineViewItemDidCollapseNotification="CPOutlineViewItemDidCollapseNotification";
CPOutlineViewItemDidExpandNotification="CPOutlineViewItemDidExpandNotification";
CPOutlineViewItemWillCollapseNotification="CPOutlineViewItemWillCollapseNotification";
CPOutlineViewItemWillExpandNotification="CPOutlineViewItemWillExpandNotification";
CPOutlineViewSelectionDidChangeNotification="CPOutlineViewSelectionDidChangeNotification";
CPOutlineViewSelectionIsChangingNotification="CPOutlineViewSelectionIsChangingNotification";
var _1=1<<1,_2=1<<2,_3=1<<3,_4=1<<4,_5=1<<5,_6=1<<6,_7=1<<7,_8=1<<8,_9=1<<9,_a=1<<10;
var _b=objj_allocateClassPair(CPTableView,"CPOutlineView"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_outlineViewDataSource"),new objj_ivar("_outlineViewDelegate"),new objj_ivar("_outlineTableColumn"),new objj_ivar("_indentationPerLevel"),new objj_ivar("_indentationMarkerFollowsDataView"),new objj_ivar("_implementedOutlineViewDataSourceMethods"),new objj_ivar("_rootItemInfo"),new objj_ivar("_itemsForRows"),new objj_ivar("_itemInfosForItems"),new objj_ivar("_disclosureControlPrototype"),new objj_ivar("_disclosureControlsForRows"),new objj_ivar("_disclosureControlData"),new objj_ivar("_disclosureControlQueue")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPTableView")},"initWithFrame:",_f);
if(_d){
_rootItemInfo={isExpanded:YES,isExpandable:NO,level:-1,row:-1,children:[],weight:0};
_itemsForRows=[];
_itemInfosForItems={};
_disclosureControlsForRows=[];
objj_msgSend(_d,"setIndentationPerLevel:",16);
objj_msgSend(_d,"setIndentationMarkerFollowsDataView:",YES);
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPTableView")},"setDataSource:",objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDataSource,"alloc"),"initWithOutlineView:",_d));
objj_msgSend(_d,"setDisclosureControlPrototype:",objj_msgSend(objj_msgSend(CPDisclosureButton,"alloc"),"initWithFrame:",CGRectMake(0,0,10,10)));
}
return _d;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_10,_11,_12){
with(_10){
if(_outlineViewDataSource===_12){
return;
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:child:ofItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:child:ofItem:'");
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:isItemExpandable:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:isItemExpandable:'");
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:numberOfChildrenOfItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:numberOfChildrenOfItem:'");
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:objectValueForTableColumn:byItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:objectValueForTableColumn:byItem:'");
}
_outlineViewDataSource=_12;
_implementedOutlineViewDataSourceMethods=0;
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:setObjectValue:forTableColumn:byItem:"))){
_implementedOutlineViewDataSourceMethods|=_1;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:shouldDeferDisplayingChildrenOfItem:"))){
_implementedOutlineViewDataSourceMethods|=_2;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:acceptDrop:item:childIndex:"))){
_implementedOutlineViewDataSourceMethods|=_3;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:validateDrop:proposedItem:proposedChildIndex:"))){
_implementedOutlineViewDataSourceMethods|=_4;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:validateDrop:proposedRow:proposedDropOperation:"))){
_implementedOutlineViewDataSourceMethods|=_5;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:namesOfPromisedFilesDroppedAtDestination:forDraggedItems:"))){
_implementedOutlineViewDataSourceMethods|=_6;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:itemForPersistentObject:"))){
_implementedOutlineViewDataSourceMethods|=_7;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:persistentObjectForItem:"))){
_implementedOutlineViewDataSourceMethods|=_8;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:writeItems:toPasteboard:"))){
_implementedOutlineViewDataSourceMethods|=_9;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:sortDescriptorsDidChange:"))){
_implementedOutlineViewDataSourceMethods|=_a;
}
objj_msgSend(_10,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_13,_14){
with(_13){
return _outlineViewDataSource;
}
}),new objj_method(sel_getUid("isExpandable:"),function(_15,_16,_17){
with(_15){
if(!_17){
return YES;
}
var _18=_itemInfosForItems[objj_msgSend(_17,"UID")];
if(!_18){
return NO;
}
return _18.isExpandable;
}
}),new objj_method(sel_getUid("isItemExpanded:"),function(_19,_1a,_1b){
with(_19){
if(!_1b){
return YES;
}
var _1c=_itemInfosForItems[objj_msgSend(_1b,"UID")];
if(!_1c){
return NO;
}
return _1c.isExpanded;
}
}),new objj_method(sel_getUid("expandItem:"),function(_1d,_1e,_1f){
with(_1d){
if(!_1f){
return;
}
var _20=_itemInfosForItems[objj_msgSend(_1f,"UID")];
if(!_20){
return;
}
if(_20.isExpanded){
return;
}
_20.isExpanded=YES;
objj_msgSend(_1d,"reloadItem:reloadChildren:",_1f,YES);
}
}),new objj_method(sel_getUid("collapseItem:"),function(_21,_22,_23){
with(_21){
if(!_23){
return;
}
var _24=_itemInfosForItems[objj_msgSend(_23,"UID")];
if(!_24){
return;
}
if(!_24.isExpanded){
return;
}
_24.isExpanded=NO;
objj_msgSend(_21,"reloadItem:reloadChildren:",_23,YES);
}
}),new objj_method(sel_getUid("reloadItem:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_25,"reloadItem:reloadChildren:",_27,NO);
}
}),new objj_method(sel_getUid("reloadItem:reloadChildren:"),function(_28,_29,_2a,_2b){
with(_28){
if(!!_2b||!_2a){
_2c(_28,_2a);
}else{
_2d(_28,_2a);
}
objj_msgSendSuper({receiver:_28,super_class:objj_getClass("CPTableView")},"reloadData");
}
}),new objj_method(sel_getUid("itemAtRow:"),function(_2e,_2f,_30){
with(_2e){
return _itemsForRows[_30]||nil;
}
}),new objj_method(sel_getUid("rowForItem:"),function(_31,_32,_33){
with(_31){
if(!anItem){
return _rootItemInfo.row;
}
var _34=_itemInfosForItems[objj_msgSend(anItem,"UID")];
if(!_34){
return CPNotFound;
}
return _34.row;
}
}),new objj_method(sel_getUid("setOutlineTableColumn:"),function(_35,_36,_37){
with(_35){
if(_outlineTableColumn===_37){
return;
}
_outlineTableColumn=_37;
objj_msgSend(_35,"reloadData");
}
}),new objj_method(sel_getUid("outlineTableColumn"),function(_38,_39){
with(_38){
return _outlineTableColumn;
}
}),new objj_method(sel_getUid("levelForItem:"),function(_3a,_3b,_3c){
with(_3a){
if(!_3c){
return _rootItemInfo.level;
}
var _3d=_itemInfosForItems[objj_msgSend(_3c,"UID")];
if(!_3d){
return CPNotFound;
}
return _3d.level;
}
}),new objj_method(sel_getUid("levelForRow:"),function(_3e,_3f,_40){
with(_3e){
return objj_msgSend(_3e,"levelForItem:",objj_msgSend(_3e,"itemAtRow:",_40));
}
}),new objj_method(sel_getUid("setIndentationPerLevel:"),function(_41,_42,_43){
with(_41){
if(_indentationPerLevel===_43){
return;
}
_indentationPerLevel=_43;
objj_msgSend(_41,"reloadData");
}
}),new objj_method(sel_getUid("indentationPerLevel"),function(_44,_45){
with(_44){
return _indentationPerLevel;
}
}),new objj_method(sel_getUid("setIndentationMarkerFollowsDataView:"),function(_46,_47,_48){
with(_46){
if(_indentationMarkerFollowsDataView===_48){
return;
}
_indentationMarkerFollowsDataView=_48;
objj_msgSend(_46,"reloadData");
}
}),new objj_method(sel_getUid("indentationMarkerFollowsDataView"),function(_49,_4a){
with(_49){
return _indentationMarkerFollowsDataView;
}
}),new objj_method(sel_getUid("parentForItem:"),function(_4b,_4c,_4d){
with(_4b){
if(!_4d){
return nil;
}
var _4e=_itemInfosForItems[objj_msgSend(_4d,"UID")];
if(!_4e){
return nil;
}
return _4e.parent;
}
}),new objj_method(sel_getUid("frameOfOutlineDataViewAtColumn:row:"),function(_4f,_50,_51,_52){
with(_4f){
var _53=objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("CPTableView")},"frameOfDataViewAtColumn:row:",_51,_52),_54=(objj_msgSend(_4f,"levelForRow:",_52)+1)*objj_msgSend(_4f,"indentationPerLevel");
_53.origin.x+=_54;
_53.size.width-=_54;
return _53;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_55,_56,_57){
with(_55){
if(_outlineViewDelegate===_57){
return;
}
var _58=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_outlineViewDelegate){
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidMove:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewColumnDidMoveNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidResize:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewColumnDidResizeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionDidChange:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewSelectionDidChangeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionIsChanging:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewSelectionIsChangingNotification,_55);
}
}
_outlineViewDelegate=_57;
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidMove:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewColumnDidMove:"),CPOutlineViewColumnDidMoveNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidResize:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewColumnDidMove:"),CPOutlineViewColumnDidResizeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionDidChange:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewSelectionDidChange:"),CPOutlineViewSelectionDidChangeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionIsChanging:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewSelectionIsChanging:"),CPOutlineViewSelectionIsChangingNotification,_55);
}
}
}),new objj_method(sel_getUid("delegate"),function(_59,_5a){
with(_59){
return _outlineViewDelegate;
}
}),new objj_method(sel_getUid("setDisclosureControlPrototype:"),function(_5b,_5c,_5d){
with(_5b){
_disclosureControlPrototype=_5d;
_disclosureControlData=nil;
_disclosureControlQueue=[];
objj_msgSend(_5b,"reloadData");
}
}),new objj_method(sel_getUid("reloadData"),function(_5e,_5f){
with(_5e){
objj_msgSend(_5e,"reloadItem:reloadChildren:",nil,YES);
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(_60,_61,_62,_63){
with(_60){
var _64=objj_msgSend(_60,"tableColumns")[_62];
if(_64===_outlineTableColumn){
return objj_msgSend(_60,"frameOfOutlineDataViewAtColumn:row:",_62,_63);
}
return objj_msgSendSuper({receiver:_60,super_class:objj_getClass("CPTableView")},"frameOfDataViewAtColumn:row:",_62,_63);
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(_65,_66,_67,_68){
with(_65){
objj_msgSendSuper({receiver:_65,super_class:objj_getClass("CPTableView")},"_loadDataViewsInRows:columns:",_67,_68);
var _69=objj_msgSend(objj_msgSend(_65,"tableColumns"),"indexOfObjectIdenticalTo:",objj_msgSend(_65,"outlineTableColumn"));
if(!objj_msgSend(_68,"containsIndex:",_69)){
return;
}
var _6a=[];
objj_msgSend(_67,"getIndexes:maxCount:inIndexRange:",_6a,-1,nil);
var _6b=0,_6c=_6a.length;
for(;_6b<_6c;++_6b){
var row=_6a[_6b],_6e=_itemsForRows[row],_6f=objj_msgSend(_65,"isExpandable:",_6e);
if(!_6f){
continue;
}
var _70=objj_msgSend(_65,"_dequeueDisclosureControl"),_71=objj_msgSend(_70,"frame"),_72=objj_msgSend(_65,"frameOfDataViewAtColumn:row:",_69,row);
_71.origin.x=_indentationMarkerFollowsDataView?(_72.origin.x)-(_71.size.width):0;
_71.origin.y=(_72.origin.y);
_71.size.height=(_72.size.height);
_disclosureControlsForRows[row]=_70;
objj_msgSend(_70,"setState:",objj_msgSend(_65,"isItemExpanded:",_6e)?CPOnState:CPOffState);
objj_msgSend(_70,"setFrame:",_71);
objj_msgSend(_65,"addSubview:",_70);
}
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(_73,_74,_75,_76){
with(_73){
objj_msgSendSuper({receiver:_73,super_class:objj_getClass("CPTableView")},"_unloadDataViewsInRows:columns:",_75,_76);
var _77=objj_msgSend(objj_msgSend(_73,"tableColumns"),"indexOfObjectIdenticalTo:",objj_msgSend(_73,"outlineTableColumn"));
if(!objj_msgSend(_76,"containsIndex:",_77)){
return;
}
var _78=[];
objj_msgSend(_75,"getIndexes:maxCount:inIndexRange:",_78,-1,nil);
var _79=0,_7a=_78.length;
for(;_79<_7a;++_79){
var row=_78[_79],_7c=_disclosureControlsForRows[row];
if(!_7c){
continue;
}
objj_msgSend(_7c,"removeFromSuperview");
objj_msgSend(_73,"_enqueueDisclosureControl:",_7c);
_disclosureControlsForRows[row]=nil;
}
}
}),new objj_method(sel_getUid("_toggleFromDisclosureControl:"),function(_7d,_7e,_7f){
with(_7d){
var _80=objj_msgSend(_7f,"frame"),_81=objj_msgSend(_7d,"itemAtRow:",objj_msgSend(_7d,"rowAtPoint:",{x:(_80.origin.x),y:(_80.origin.y+(_80.size.height)/2)}));
if(objj_msgSend(_7d,"isItemExpanded:",_81)){
objj_msgSend(_7d,"collapseItem:",_81);
}else{
objj_msgSend(_7d,"expandItem:",_81);
}
}
}),new objj_method(sel_getUid("_enqueueDisclosureControl:"),function(_82,_83,_84){
with(_82){
_disclosureControlQueue.push(_84);
}
}),new objj_method(sel_getUid("_dequeueDisclosureControl"),function(_85,_86){
with(_85){
if(_disclosureControlQueue.length){
return _disclosureControlQueue.pop();
}
if(!_disclosureControlData){
if(!_disclosureControlPrototype){
return nil;
}else{
_disclosureControlData=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_disclosureControlPrototype);
}
}
var _87=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_disclosureControlData);
objj_msgSend(_87,"setTarget:",_85);
objj_msgSend(_87,"setAction:",sel_getUid("_toggleFromDisclosureControl:"));
return _87;
}
}),new objj_method(sel_getUid("_noteSelectionIsChanging"),function(_88,_89){
with(_88){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewSelectionIsChangingNotification,_88,nil);
}
}),new objj_method(sel_getUid("_noteSelectionDidChange"),function(_8a,_8b){
with(_8a){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewSelectionDidChangeNotification,_8a,nil);
}
})]);
var _2d=function(_8c,_8d){
if(!_8d){
return;
}
var _8e=_8c._itemInfosForItems,_8f=_8c._outlineViewDataSource,_90=objj_msgSend(_8d,"UID"),_91=_8e[_90];
if(!_91){
return [];
}
var _92=_91.parent,_93=_92?_8e[objj_msgSend(_92,"UID")]:_8c._rootItemInfo,_94=_93.children,_95=objj_msgSend(_94,"indexOfObjectIdenticalTo:",_8d),_96=objj_msgSend(_8f,"outlineView:child:ofItem:",_8c,_95,_92);
if(_8d!==_96){
_8e[objj_msgSend(_8d,"UID")]=nil;
_8e[objj_msgSend(_96,"UID")]=_91;
_94[_95]=_96;
_8c._itemsForRows[_91.row]=_96;
}
_91.isExpandable=objj_msgSend(_8f,"outlineView:isItemExpandable:",_8c,_96);
_91.isExpanded=_91.isExpandable&&_91.isExpanded;
};
var _2c=function(_97,_98,_99){
var _9a=_97._itemInfosForItems,_9b=_97._outlineViewDataSource;
if(!_98){
var _9c=_97._rootItemInfo;
}else{
var _9d=objj_msgSend(_98,"UID"),_9c=_9a[_9d];
if(!_9c){
return [];
}
_9c.isExpandable=objj_msgSend(_9b,"outlineView:isItemExpandable:",_97,_98);
if(!_9c.isExpandable&&_9c.isExpanded){
_9c.isExpanded=NO;
_9c.children=[];
}
}
var _9e=_9c.weight,_9f=_98?[_98]:[];
if(_9c.isExpanded&&(!(_97._implementedOutlineViewDataSourceMethods&_2)||!objj_msgSend(_9b,"outlineView:shouldDeferDisplayingChildrenOfItem:",_97,_98))){
var _a0=0,_a1=objj_msgSend(_9b,"outlineView:numberOfChildrenOfItem:",_97,_98),_a2=_9c.level+1;
_9c.children=[];
for(;_a0<_a1;++_a0){
var _a3=objj_msgSend(_9b,"outlineView:child:ofItem:",_97,_a0,_98),_a4=_9a[objj_msgSend(_a3,"UID")];
if(!_a4){
_a4={isExpanded:NO,isExpandable:NO,children:[],weight:1};
_9a[objj_msgSend(_a3,"UID")]=_a4;
}
_9c.children[_a0]=_a3;
var _a5=_2c(_97,_a3,YES);
_a4.parent=_98;
_a4.level=_a2;
_9f=_9f.concat(_a5);
}
}
_9c.weight=_9f.length;
if(!_99){
var _a0=MAX(_9c.row,0),_a6=_97._itemsForRows;
_9f.unshift(_a0,_9e);
_a6.splice.apply(_a6,_9f);
var _a1=_a6.length;
for(;_a0<_a1;++_a0){
_9a[objj_msgSend(_a6[_a0],"UID")].row=_a0;
}
var _a7=_9c.weight-_9e;
if(_a7!==0){
var _a8=_9c.parent;
while(_a8){
var _a9=_9a[objj_msgSend(_a8,"UID")];
_a9.weight+=_a7;
_a8=_a9.parent;
}
if(_98){
_97._rootItemInfo.weight+=_a7;
}
}
}
return _9f;
};
var _b=objj_allocateClassPair(CPObject,"_CPOutlineViewTableViewDataSource"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_outlineView")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithOutlineView:"),function(_aa,_ab,_ac){
with(_aa){
_aa=objj_msgSendSuper({receiver:_aa,super_class:objj_getClass("CPObject")},"init");
if(_aa){
_outlineView=_ac;
}
return _aa;
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_ad,_ae,_af){
with(_ad){
return _outlineView._itemsForRows.length;
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_b0,_b1,_b2,_b3,_b4){
with(_b0){
return objj_msgSend(_outlineView._outlineViewDataSource,"outlineView:objectValueForTableColumn:byItem:",_outlineView,_b3,_outlineView._itemsForRows[_b4]);
}
})]);
var _b=objj_allocateClassPair(CPObject,"_CPOutlineViewTableViewDelegate"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_outlineView")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithOutlineView:"),function(_b5,_b6,_b7){
with(_b5){
_b5=objj_msgSendSuper({receiver:_b5,super_class:objj_getClass("CPObject")},"init");
if(_b5){
_outlineView=_b7;
}
return _b5;
}
})]);
var _b=objj_allocateClassPair(CPButton,"CPDisclosureButton"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_angle")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithFrame:"),function(_b8,_b9,_ba){
with(_b8){
_b8=objj_msgSendSuper({receiver:_b8,super_class:objj_getClass("CPButton")},"initWithFrame:",_ba);
if(_b8){
objj_msgSend(_b8,"setBordered:",NO);
}
return _b8;
}
}),new objj_method(sel_getUid("setState:"),function(_bb,_bc,_bd){
with(_bb){
objj_msgSendSuper({receiver:_bb,super_class:objj_getClass("CPButton")},"setState:",_bd);
if(objj_msgSend(_bb,"state")===CPOnState){
_angle=0;
}else{
_angle=-PI_2;
}
}
}),new objj_method(sel_getUid("drawRect:"),function(_be,_bf,_c0){
with(_be){
var _c1=objj_msgSend(_be,"bounds"),_c2=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(_c2);
CGContextTranslateCTM(_c2,(_c1.size.width)/2,(_c1.size.height)/2);
CGContextRotateCTM(_c2,_angle);
CGContextTranslateCTM(_c2,-(_c1.size.width)/2,-(_c1.size.height)/2);
CGContextTranslateCTM(_c2,FLOOR(((_c1.size.width)-9)/2),FLOOR(((_c1.size.height)-8)/2));
CGContextMoveToPoint(_c2,0,0);
CGContextAddLineToPoint(_c2,9,0);
CGContextAddLineToPoint(_c2,4.5,8);
CGContextAddLineToPoint(_c2,0,0);
CGContextClosePath(_c2);
CGContextSetFillColor(_c2,(objj_msgSend(_be,"themeState")&CPThemeState("highlighted"))?objj_msgSend(CPColor,"blackColor"):objj_msgSend(CPColor,"grayColor"));
CGContextFillPath(_c2);
}
})]);
