I;25;Foundation/CPDictionary.jI;21;Foundation/CPObject.jI;29;Foundation/CPSortDescriptor.jI;21;Foundation/CPString.ji;19;CPTableHeaderView.jc;8426;
CPTableColumnNoResizing=0;
CPTableColumnAutoresizingMask=1;
CPTableColumnUserResizingMask=2;
var _1=objj_allocateClassPair(CPObject,"CPTableColumn"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_tableView"),new objj_ivar("_headerView"),new objj_ivar("_dataView"),new objj_ivar("_dataViewData"),new objj_ivar("_width"),new objj_ivar("_minWidth"),new objj_ivar("_maxWidth"),new objj_ivar("_identifier"),new objj_ivar("_isEditable"),new objj_ivar("_sortDescriptorPrototype"),new objj_ivar("_isHidden"),new objj_ivar("_headerToolTip")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithIdentifier:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_dataViewData={};
_width=100;
_minWidth=10;
_maxWidth=1000000;
objj_msgSend(_3,"setIdentifier:",_5);
objj_msgSend(_3,"setHeaderView:",objj_msgSend(CPTextField,"new"));
objj_msgSend(_3,"setDataView:",objj_msgSend(CPTextField,"new"));
}
return _3;
}
}),new objj_method(sel_getUid("setTableView:"),function(_6,_7,_8){
with(_6){
_tableView=_8;
}
}),new objj_method(sel_getUid("tableView"),function(_9,_a){
with(_9){
return _tableView;
}
}),new objj_method(sel_getUid("setWidth:"),function(_b,_c,_d){
with(_b){
_d=+_d;
if(_width===_d){
return;
}
var _e=MIN(MAX(_d,objj_msgSend(_b,"minWidth")),objj_msgSend(_b,"maxWidth"));
if(_width===_e){
return;
}
var _f=_width;
_width=_e;
var _10=objj_msgSend(_b,"tableView");
if(_10){
var _11=objj_msgSend(objj_msgSend(_10,"tableColumns"),"indexOfObjectIdenticalTo:",_b);
_10._reloadAllRows=YES;
_10._dirtyTableColumnRangeIndex=_10._dirtyTableColumnRangeIndex<0?_11:MIN(_11,_10._dirtyTableColumnRangeIndex);
objj_msgSend(_10,"tile");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewColumnDidResizeNotification,_10,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_b,_f],["CPTableColumn","CPOldWidth"]));
}
}
}),new objj_method(sel_getUid("width"),function(_12,_13){
with(_12){
return _width;
}
}),new objj_method(sel_getUid("setMinWidth:"),function(_14,_15,_16){
with(_14){
_16=+_16;
if(_minWidth===_16){
return;
}
_minWidth=_16;
var _17=objj_msgSend(_14,"width"),_18=MAX(_17,objj_msgSend(_14,"minWidth"));
if(_17!==_18){
objj_msgSend(_14,"setWidth:",_18);
}
}
}),new objj_method(sel_getUid("minWidth"),function(_19,_1a){
with(_19){
return _minWidth;
}
}),new objj_method(sel_getUid("setMaxWidth:"),function(_1b,_1c,_1d){
with(_1b){
_1d=+_1d;
if(_maxWidth===_1d){
return;
}
_maxWidth=_1d;
var _1e=objj_msgSend(_1b,"width"),_1f=MAX(_1e,objj_msgSend(_1b,"maxWidth"));
if(_1e!==_1f){
objj_msgSend(_1b,"setWidth:",_1f);
}
}
}),new objj_method(sel_getUid("maxWidth"),function(_20,_21){
with(_20){
return _maxWidth;
}
}),new objj_method(sel_getUid("setResizingMask:"),function(_22,_23,_24){
with(_22){
_resizingMask=_24;
}
}),new objj_method(sel_getUid("resizingMask"),function(_25,_26){
with(_25){
return _resizingMask;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_27,_28){
with(_27){
var _29=_CGRectGetWidth(objj_msgSend(_headerView,"frame"));
if(_29<objj_msgSend(_27,"minWidth")){
objj_msgSend(_27,"setMinWidth:",_29);
}else{
if(_29>objj_msgSend(_27,"maxWidth")){
objj_msgSend(_27,"setMaxWidth:",_29);
}
}
if(_width!==_29){
objj_msgSend(_27,"setWidth:",_29);
}
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_2a,_2b,_2c){
with(_2a){
if(!_2c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Attempt to set nil header view on "+objj_msgSend(_2a,"description"));
}
_headerView=_2c;
}
}),new objj_method(sel_getUid("headerView"),function(_2d,_2e){
with(_2d){
return _headerView;
}
}),new objj_method(sel_getUid("setDataView:"),function(_2f,_30,_31){
with(_2f){
if(_dataView===_31){
return;
}
if(_dataView){
_dataViewData[objj_msgSend(_dataView,"UID")]=nil;
}
_dataView=_31;
_dataViewData[objj_msgSend(_31,"UID")]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_31);
}
}),new objj_method(sel_getUid("dataView"),function(_32,_33){
with(_32){
return _dataView;
}
}),new objj_method(sel_getUid("dataViewForRow:"),function(_34,_35,_36){
with(_34){
return objj_msgSend(_34,"dataView");
}
}),new objj_method(sel_getUid("_newDataViewForRow:"),function(_37,_38,_39){
with(_37){
var _3a=objj_msgSend(_37,"dataViewForRow:",_39),_3b=objj_msgSend(_3a,"UID");
var x=objj_msgSend(_37,"tableView")._cachedDataViews[_3b];
if(x&&x.length){
return x.pop();
}
if(!_dataViewData[_3b]){
_dataViewData[_3b]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_3a);
}
var _3d=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_dataViewData[_3b]);
_3d.identifier=_3b;
return _3d;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_3e,_3f,_40){
with(_3e){
_identifier=_40;
}
}),new objj_method(sel_getUid("identifier"),function(_41,_42){
with(_41){
return _identifier;
}
}),new objj_method(sel_getUid("setEditable:"),function(_43,_44,_45){
with(_43){
_isEditable=_45;
}
}),new objj_method(sel_getUid("isEditable"),function(_46,_47){
with(_46){
return _isEditable;
}
}),new objj_method(sel_getUid("setSortDescriptorPrototype:"),function(_48,_49,_4a){
with(_48){
_sortDescriptorPrototype=_4a;
}
}),new objj_method(sel_getUid("sortDescriptorPrototype"),function(_4b,_4c){
with(_4b){
return _sortDescriptorPrototype;
}
}),new objj_method(sel_getUid("setHidden:"),function(_4d,_4e,_4f){
with(_4d){
_isHidden=_4f;
}
}),new objj_method(sel_getUid("isHidden"),function(_50,_51){
with(_50){
return _isHidden;
}
}),new objj_method(sel_getUid("setHeaderToolTip:"),function(_52,_53,_54){
with(_52){
_headerToolTip=_54;
}
}),new objj_method(sel_getUid("headerToolTip"),function(_55,_56){
with(_55){
return _headerToolTip;
}
})]);
var _57="CPTableColumnIdentifierKey",_58="CPTableColumnHeaderViewKey",_59="CPTableColumnDataViewKey",_5a="CPTableColumnWidthKey",_5b="CPTableColumnMinWidthKey",_5c="CPTableColumnMaxWidthKey",_5d="CPTableColumnResizingMaskKey";
var _1=objj_getClass("CPTableColumn");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableColumn\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_5e,_5f,_60){
with(_5e){
_5e=objj_msgSendSuper({receiver:_5e,super_class:objj_getClass("CPObject")},"init");
if(_5e){
_dataViewData={};
_width=objj_msgSend(_60,"decodeFloatForKey:",_5a);
_minWidth=objj_msgSend(_60,"decodeFloatForKey:",_5b);
_maxWidth=objj_msgSend(_60,"decodeFloatForKey:",_5c);
objj_msgSend(_5e,"setIdentifier:",objj_msgSend(_60,"decodeObjectForKey:",_57));
objj_msgSend(_5e,"setHeaderView:",objj_msgSend(CPTextField,"new"));
objj_msgSend(_5e,"setDataView:",objj_msgSend(CPTextField,"new"));
}
return _5e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_63,"encodeObject:forKey:",_identifier,_57);
objj_msgSend(_63,"encodeObject:forKey:",_width,_5a);
objj_msgSend(_63,"encodeObject:forKey:",_minWidth,_5b);
objj_msgSend(_63,"encodeObject:forKey:",_maxWidth,_5c);
}
})]);
var _1=objj_getClass("CPTableColumn");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableColumn\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setHeaderCell:"),function(_64,_65,_66){
with(_64){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"setHeaderCell: is not supported. -setHeaderCell:aView instead.");
}
}),new objj_method(sel_getUid("headerCell"),function(_67,_68){
with(_67){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"headCell is not supported. -headerView instead.");
}
}),new objj_method(sel_getUid("setDataCell:"),function(_69,_6a,_6b){
with(_69){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"setDataCell: is not supported. Use -setHeaderCell:aView instead.");
}
}),new objj_method(sel_getUid("dataCell"),function(_6c,_6d){
with(_6c){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataCell is not supported. Use -dataCell instead.");
}
}),new objj_method(sel_getUid("dataCellForRow:"),function(_6e,_6f,row){
with(_6e){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataCellForRow: is not supported. Use -dataViewForRow:row instead.");
}
})]);
