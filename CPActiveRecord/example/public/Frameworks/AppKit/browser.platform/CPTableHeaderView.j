i;15;CPTableColumn.ji;13;CPTableView.ji;8;CPView.jc;3366;
var _1=objj_allocateClassPair(CPView,"CPTableHeaderView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_resizedColumn"),new objj_ivar("_draggedColumn"),new objj_ivar("_draggedDistance"),new objj_ivar("_tableView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("resizedColumn"),function(_3,_4){
with(_3){
return _resizedColumn;
}
}),new objj_method(sel_getUid("draggedColumn"),function(_5,_6){
with(_5){
return _draggedColumn;
}
}),new objj_method(sel_getUid("draggedDistance"),function(_7,_8){
with(_7){
return _draggedDistance;
}
}),new objj_method(sel_getUid("tableView"),function(_9,_a){
with(_9){
return _tableView;
}
}),new objj_method(sel_getUid("setTableView:"),function(_b,_c,_d){
with(_b){
_tableView=_d;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPView")},"initWithFrame:",_10);
if(_e){
_resizedColumn=CPNotFound;
_draggedColumn=CPNotFound;
_draggedDistance=0;
}
return _e;
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_11,_12,_13){
with(_11){
if(!CGRectContainsPoint(objj_msgSend(_11,"bounds"),_13)){
return CPNotFound;
}
var _14=0,_15=objj_msgSend(objj_msgSend(_tableView,"tableColumns"),"count"),_16=objj_msgSend(_tableView,"intercellSpacing"),_17=objj_msgSend(_tableView,"tableColumns"),_18=0,_19=_13.x;
for(;_14<_15;_14++){
var _1a=objj_msgSend(_17[_14],"width")+_16.width;
if(_19>=_18&&_19<_18+_1a){
return _14;
}
_18+=_1a;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("headerRectOfColumn:"),function(_1b,_1c,_1d){
with(_1b){
var _1e=objj_msgSend(_tableView,"tableColumns"),_1f=objj_msgSend(_tableView,"intercellSpacing"),_20=objj_msgSend(_1b,"bounds");
if(_1d<0||_1d>objj_msgSend(_1e,"count")){
objj_msgSend(CPException,"raise:reason:","invalid","tried to get headerRectOfColumn: on invalid column");
}
_20.size.width=objj_msgSend(_1e[_1d],"width")+_1f.width;
while(--_1d>=0){
_20.origin.x+=objj_msgSend(_1e[_1d],"width")+_1f.width;
}
return _20;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_21,_22){
with(_21){
var _23=objj_msgSend(_tableView,"tableColumns"),_24=objj_msgSend(_23,"count"),_25=objj_msgSend(_21,"bounds"),_26=objj_msgSend(_tableView,"intercellSpacing");
for(i=0;i<_24;++i){
var _27=objj_msgSend(_23,"objectAtIndex:",i),_28=objj_msgSend(_27,"headerView");
_25.size.width=objj_msgSend(_27,"width")+_26.width;
objj_msgSend(_28,"setFrame:",_25);
_25.origin.x+=objj_msgSend(_27,"width")+_26.width;
objj_msgSend(_21,"addSubview:",_28);
}
}
}),new objj_method(sel_getUid("drawRect:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(objj_msgSend(_tableView,"gridColor"),"setStroke");
var _2c=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_2d=_2d=objj_msgSend(_tableView,"columnIndexesInRect:",_2b),_2e=[];
objj_msgSend(_2d,"getIndexes:maxCount:inIndexRange:",_2e,-1,nil);
var _2f=0,_30=_2e.length;
for(;_2f<_30;++_2f){
var _31=objj_msgSend(_29,"headerRectOfColumn:",_2f);
CGContextBeginPath(_2c);
CGContextMoveToPoint(_2c,ROUND(_31.origin.x+_31.size.width)-0.5,ROUND(_31.origin.y)-0.5);
CGContextAddLineToPoint(_2c,ROUND(_31.origin.x+_31.size.width)-0.5,ROUND(_31.origin.y+_31.size.height)-0.5);
CGContextSetLineWidth(_2c,1);
CGContextStrokePath(_2c);
}
}
})]);
