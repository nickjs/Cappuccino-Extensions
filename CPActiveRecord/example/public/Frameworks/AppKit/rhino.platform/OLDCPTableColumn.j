I;23;Foundation/Foundation.jc;7151;
CPTableColumnNoResizing=0;
CPTableColumnAutoresizingMask=1;
CPTableColumnUserResizingMask=2;
var _1=objj_allocateClassPair(CPObject,"CPTableColumn"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier"),new objj_ivar("_headerView"),new objj_ivar("_tableView"),new objj_ivar("_width"),new objj_ivar("_minWidth"),new objj_ivar("_maxWidth"),new objj_ivar("_resizingMask"),new objj_ivar("_dataView"),new objj_ivar("_dataViewData"),new objj_ivar("_dataViewForView"),new objj_ivar("_purgableInfosForDataView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithIdentifier:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
objj_msgSend(_3,"_init");
_identifier=_5;
_width=40;
_minWidth=8;
_maxWidth=1000;
var _6=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMakeZero());
objj_msgSend(_6,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"whiteColor"),"text-color",CPThemeStateHighlighted);
objj_msgSend(_3,"setDataView:",_6);
_headerView=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMakeZero());
objj_msgSend(_headerView,"setBackgroundColor:",objj_msgSend(CPColor,"greenColor"));
}
return _3;
}
}),new objj_method(sel_getUid("_init"),function(_7,_8){
with(_7){
_dataViewData={};
_dataViewForView={};
_purgableInfosForDataView={};
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_9,_a,_b){
with(_9){
_identifier=_b;
}
}),new objj_method(sel_getUid("identifier"),function(_c,_d){
with(_c){
return _identifier;
}
}),new objj_method(sel_getUid("setTableView:"),function(_e,_f,_10){
with(_e){
_tableView=_10;
}
}),new objj_method(sel_getUid("tableView"),function(_11,_12){
with(_11){
return _tableView;
}
}),new objj_method(sel_getUid("setWidth:"),function(_13,_14,_15){
with(_13){
_width=_15;
}
}),new objj_method(sel_getUid("width"),function(_16,_17){
with(_16){
return _width;
}
}),new objj_method(sel_getUid("setMinWidth:"),function(_18,_19,_1a){
with(_18){
if(_width<(_minWidth=_1a)){
objj_msgSend(_18,"setWidth:",_minWidth);
}
}
}),new objj_method(sel_getUid("minWidth"),function(_1b,_1c){
with(_1b){
return _minWidth;
}
}),new objj_method(sel_getUid("setMaxWidth:"),function(_1d,_1e,_1f){
with(_1d){
if(_width>(_maxmimumWidth=_1f)){
objj_msgSend(_1d,"setWidth:",_maxWidth);
}
}
}),new objj_method(sel_getUid("setResizingMask:"),function(_20,_21,_22){
with(_20){
_resizingMask=_22;
}
}),new objj_method(sel_getUid("resizingMask"),function(_23,_24){
with(_23){
return _resizingMask;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_25,_26){
with(_25){
var _27=CPRectGetWidth(objj_msgSend(_headerView,"frame"));
if(_27<_minWidth){
objj_msgSend(_25,"setMinWidth:",_27);
}else{
if(_27>_maxWidth){
objj_msgSend(_25,"setMaxWidth:",_27);
}
}
if(_width!=_27){
objj_msgSend(_25,"setWidth:",_27);
}
}
}),new objj_method(sel_getUid("setEditable:"),function(_28,_29,_2a){
with(_28){
_isEditable=_2a;
}
}),new objj_method(sel_getUid("isEditable"),function(_2b,_2c){
with(_2b){
return _isEditable;
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_2d,_2e,_2f){
with(_2d){
_headerView=_2f;
}
}),new objj_method(sel_getUid("headerView"),function(_30,_31){
with(_30){
return _headerView;
}
}),new objj_method(sel_getUid("setDataCell:"),function(_32,_33,_34){
with(_32){
objj_msgSend(_32,"setDataView:",_34);
}
}),new objj_method(sel_getUid("setDataView:"),function(_35,_36,_37){
with(_35){
if(_dataView){
_dataViewData[objj_msgSend(_dataView,"UID")]=nil;
}
_dataView=_37;
_dataViewData[objj_msgSend(_37,"UID")]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_37);
}
}),new objj_method(sel_getUid("dataCell"),function(_38,_39){
with(_38){
return _dataView;
}
}),new objj_method(sel_getUid("dataView"),function(_3a,_3b){
with(_3a){
return objj_msgSend(_3a,"dataCell");
}
}),new objj_method(sel_getUid("dataCellForRow:"),function(_3c,_3d,_3e){
with(_3c){
return objj_msgSend(_3c,"dataView");
}
}),new objj_method(sel_getUid("dataViewForRow:"),function(_3f,_40,_41){
with(_3f){
return objj_msgSend(_3f,"dataCellForRow:",_41);
}
}),new objj_method(sel_getUid("_markView:inRow:asPurgable:"),function(_42,_43,_44,_45,_46){
with(_42){
var _47=objj_msgSend(_44,"UID"),_48=objj_msgSend(_dataViewForView[_47],"UID");
if(!_purgableInfosForDataView[_48]){
if(!_46){
return;
}
_purgableInfosForDataView[_48]={};
}
if(!_46){
if(_purgableInfosForDataView[_48][_47]){
CPLog.warn("removing unpurgable "+_purgableInfosForDataView[_48][_47]);
}
delete _purgableInfosForDataView[_48][_47];
}else{
_purgableInfosForDataView[_48][_47]={view:(_44),row:(_45)};
}
}
}),new objj_method(sel_getUid("_newDataViewForRow:avoidingRows:"),function(_49,_4a,_4b,_4c){
with(_49){
var _4d=objj_msgSend(_49,"dataViewForRow:",_4b),_4e=objj_msgSend(_4d,"UID"),_4f=_purgableInfosForDataView[_4e];
if(_4f){
for(var key in _4f){
var _51=_4f[key];
delete _4f[key];
return ((_51).view);
}
}
if(!_dataViewData[_4e]){
_dataViewData[_4e]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_4d);
}
var _52=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_dataViewData[_4e]);
_dataViewForView[objj_msgSend(_52,"UID")]=_4d;
CPLog.warn("creating cell: %s",_52);
return _52;
}
}),new objj_method(sel_getUid("_purge"),function(_53,_54){
with(_53){
for(var _55 in _purgableInfosForDataView){
var _56=_purgableInfosForDataView[_55];
for(var key in _56){
var _58=((_56[key]).view);
if(!_58){
CPLog.info("key="+key+" view="+_58+" purgableInfos[key]="+_56[key]);
}else{
if(_58._superview){
objj_msgSend(_58,"setHidden:",YES);
}
}
}
}
}
})]);
var _59="CPTableColumnIdentifierKey",_5a="CPTableColumnHeaderViewKey",_5b="CPTableColumnDataViewKey",_5c="CPTableColumnWidthKey",_5d="CPTableColumnMinWidthKey",_5e="CPTableColumnMaxWidthKey",_5f="CPTableColumnResizingMaskKey";
var _1=objj_getClass("CPTableColumn");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableColumn\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_60,_61,_62){
with(_60){
objj_msgSend(_60,"_init");
_identifier=objj_msgSend(_62,"decodeObjectForKey:",_59);
objj_msgSend(_60,"setHeaderView:",objj_msgSend(_62,"decodeObjectForKey:",_5a));
objj_msgSend(_60,"setDataView:",objj_msgSend(_62,"decodeObjectForKey:",_5b));
_width=objj_msgSend(_62,"decodeFloatForKey:",_5c);
_minWidth=objj_msgSend(_62,"decodeFloatForKey:",_5d);
_maxWidth=objj_msgSend(_62,"decodeFloatForKey:",_5e);
_resizingMask=objj_msgSend(_62,"decodeBoolForKey:",_5f);
return _60;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_63,_64,_65){
with(_63){
objj_msgSend(_65,"encodeObject:forKey:",_identifier,_59);
objj_msgSend(_65,"encodeObject:forKey:",_headerView,_5a);
objj_msgSend(_65,"encodeObject:forKey:",_dataView,_5b);
objj_msgSend(_65,"encodeObject:forKey:",_width,_5c);
objj_msgSend(_65,"encodeObject:forKey:",_minWidth,_5d);
objj_msgSend(_65,"encodeObject:forKey:",_maxWidth,_5e);
objj_msgSend(_65,"encodeObject:forKey:",_resizingMask,_5f);
}
})]);
