i;8;CPView.ji;12;CPClipView.ji;12;CPScroller.jc;17135;
var _1=objj_allocateClassPair(CPView,"CPScrollView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contentView"),new objj_ivar("_headerClipView"),new objj_ivar("_cornerView"),new objj_ivar("_hasVerticalScroller"),new objj_ivar("_hasHorizontalScroller"),new objj_ivar("_autohidesScrollers"),new objj_ivar("_verticalScroller"),new objj_ivar("_horizontalScroller"),new objj_ivar("_recursionCount"),new objj_ivar("_verticalLineScroll"),new objj_ivar("_verticalPageScroll"),new objj_ivar("_horizontalLineScroll"),new objj_ivar("_horizontalPageScroll")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_verticalLineScroll=10;
_verticalPageScroll=10;
_horizontalLineScroll=10;
_horizontalPageScroll=10;
_contentView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",objj_msgSend(_3,"bounds"));
objj_msgSend(_3,"addSubview:",_contentView);
_headerClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"init");
objj_msgSend(_3,"addSubview:",_headerClipView);
objj_msgSend(_3,"setHasVerticalScroller:",YES);
objj_msgSend(_3,"setHasHorizontalScroller:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("contentSize"),function(_6,_7){
with(_6){
return objj_msgSend(_contentView,"frame").size;
}
}),new objj_method(sel_getUid("documentView"),function(_8,_9){
with(_8){
return objj_msgSend(_contentView,"documentView");
}
}),new objj_method(sel_getUid("setContentView:"),function(_a,_b,_c){
with(_a){
if(_contentView!==_c||!_c){
return;
}
var _d=objj_msgSend(_c,"documentView");
if(_d){
objj_msgSend(_d,"removeFromSuperview");
}
objj_msgSend(_contentView,"removeFromSuperview");
_contentView=_c;
objj_msgSend(_contentView,"setDocumentView:",_d);
objj_msgSend(_a,"addSubview:",_contentView);
objj_msgSend(_a,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_e,_f){
with(_e){
return _contentView;
}
}),new objj_method(sel_getUid("setDocumentView:"),function(_10,_11,_12){
with(_10){
objj_msgSend(_contentView,"setDocumentView:",_12);
objj_msgSend(_10,"_updateCornerAndHeaderView");
objj_msgSend(_10,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(_13,_14,_15){
with(_13){
if(_contentView!==_15){
return;
}
if(_recursionCount>5){
return;
}
++_recursionCount;
var _16=objj_msgSend(_13,"documentView");
if(!_16){
if(_autohidesScrollers){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_horizontalScroller,"setHidden:",YES);
}else{
}
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_13,"bounds"));
objj_msgSend(_headerClipView,"setFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
--_recursionCount;
return;
}
var _17=objj_msgSend(_16,"frame"),_18=objj_msgSend(_13,"bounds"),_19=objj_msgSend(_13,"_headerClipViewFrame"),_1a=(_19.size.height);
_18.origin.y+=_1a;
_18.size.height-=_1a;
var _1b={width:(_17.size.width)-(_18.size.width),height:(_17.size.height)-(_18.size.height)},_1c=(objj_msgSend(_verticalScroller,"frame").size.width),_1d=(objj_msgSend(_horizontalScroller,"frame").size.height),_1e=_1b.height>0,_1f=_1b.width>0,_20=_hasVerticalScroller&&(!_autohidesScrollers||_1e),_21=_hasHorizontalScroller&&(!_autohidesScrollers||_1f);
if(_20){
_1b.width+=_1c;
_1f=_1b.width>0;
_21=_hasHorizontalScroller&&(!_autohidesScrollers||_1f);
}
if(_21){
_1b.height+=_1d;
_1e=_1b.height>0;
_20=_hasVerticalScroller&&(!_autohidesScrollers||_1e);
}
objj_msgSend(_verticalScroller,"setHidden:",!_20);
objj_msgSend(_verticalScroller,"setEnabled:",_1e);
objj_msgSend(_horizontalScroller,"setHidden:",!_21);
objj_msgSend(_horizontalScroller,"setEnabled:",_1f);
if(_20){
_18.size.width-=_1c;
}
if(_21){
_18.size.height-=_1d;
}
var _22=objj_msgSend(_contentView,"bounds").origin,_23=!objj_msgSend(_verticalScroller,"isHidden"),_24=!objj_msgSend(_horizontalScroller,"isHidden");
if(_20){
var _25=MAX((objj_msgSend(_13,"_cornerViewFrame").size.height),_1a),_26=(objj_msgSend(_13,"bounds").size.height)-_25;
if(_21){
_26-=_1d;
}
objj_msgSend(_verticalScroller,"setFloatValue:",(_1b.height<=0)?0:_22.y/_1b.height);
objj_msgSend(_verticalScroller,"setKnobProportion:",(_18.size.height)/(_17.size.height));
objj_msgSend(_verticalScroller,"setFrame:",{origin:{x:(_18.origin.x+_18.size.width),y:_25},size:{width:_1c,height:_26}});
}else{
if(_23){
objj_msgSend(_verticalScroller,"setFloatValue:",0);
objj_msgSend(_verticalScroller,"setKnobProportion:",1);
}
}
if(_21){
objj_msgSend(_horizontalScroller,"setFloatValue:",(_1b.width<=0)?0:_22.x/_1b.width);
objj_msgSend(_horizontalScroller,"setKnobProportion:",(_18.size.width)/(_17.size.width));
objj_msgSend(_horizontalScroller,"setFrame:",{origin:{x:0,y:(_18.origin.y+_18.size.height)},size:{width:(_18.size.width),height:_1d}});
}else{
if(_24){
objj_msgSend(_horizontalScroller,"setFloatValue:",0);
objj_msgSend(_horizontalScroller,"setKnobProportion:",1);
}
}
objj_msgSend(_contentView,"setFrame:",_18);
objj_msgSend(_headerClipView,"setFrame:",_19);
objj_msgSend(_cornerView,"setFrame:",objj_msgSend(_13,"_cornerViewFrame"));
--_recursionCount;
}
}),new objj_method(sel_getUid("setHorizontalScroller:"),function(_27,_28,_29){
with(_27){
if(_horizontalScroller===_29){
return;
}
objj_msgSend(_horizontalScroller,"removeFromSuperview");
objj_msgSend(_horizontalScroller,"setTarget:",nil);
objj_msgSend(_horizontalScroller,"setAction:",nil);
_horizontalScroller=_29;
objj_msgSend(_horizontalScroller,"setTarget:",_27);
objj_msgSend(_horizontalScroller,"setAction:",sel_getUid("_horizontalScrollerDidScroll:"));
objj_msgSend(_27,"addSubview:",_horizontalScroller);
objj_msgSend(_27,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("horizontalScroller"),function(_2a,_2b){
with(_2a){
return _horizontalScroller;
}
}),new objj_method(sel_getUid("setHasHorizontalScroller:"),function(_2c,_2d,_2e){
with(_2c){
if(_hasHorizontalScroller===_2e){
return;
}
_hasHorizontalScroller=_2e;
if(_hasHorizontalScroller&&!_horizontalScroller){
objj_msgSend(_2c,"setHorizontalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,(objj_msgSend(_2c,"bounds").size.width),objj_msgSend(CPScroller,"scrollerWidth"))));
}else{
if(!_hasHorizontalScroller&&_horizontalScroller){
objj_msgSend(_horizontalScroller,"setHidden:",YES);
objj_msgSend(_2c,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasHorizontalScroller"),function(_2f,_30){
with(_2f){
return _hasHorizontalScroller;
}
}),new objj_method(sel_getUid("setVerticalScroller:"),function(_31,_32,_33){
with(_31){
if(_verticalScroller===_33){
return;
}
objj_msgSend(_verticalScroller,"removeFromSuperview");
objj_msgSend(_verticalScroller,"setTarget:",nil);
objj_msgSend(_verticalScroller,"setAction:",nil);
_verticalScroller=_33;
objj_msgSend(_verticalScroller,"setTarget:",_31);
objj_msgSend(_verticalScroller,"setAction:",sel_getUid("_verticalScrollerDidScroll:"));
objj_msgSend(_31,"addSubview:",_verticalScroller);
objj_msgSend(_31,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("verticalScroller"),function(_34,_35){
with(_34){
return _verticalScroller;
}
}),new objj_method(sel_getUid("setHasVerticalScroller:"),function(_36,_37,_38){
with(_36){
if(_hasVerticalScroller===_38){
return;
}
_hasVerticalScroller=_38;
if(_hasVerticalScroller&&!_verticalScroller){
objj_msgSend(_36,"setVerticalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:objj_msgSend(CPScroller,"scrollerWidth"),height:(objj_msgSend(_36,"bounds").size.height)}}));
}else{
if(!_hasVerticalScroller&&_verticalScroller){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_36,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasVerticalScroller"),function(_39,_3a){
with(_39){
return _hasVerticalScroller;
}
}),new objj_method(sel_getUid("setAutohidesScrollers:"),function(_3b,_3c,_3d){
with(_3b){
if(_autohidesScrollers==_3d){
return;
}
_autohidesScrollers=_3d;
objj_msgSend(_3b,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("autohidesScrollers"),function(_3e,_3f){
with(_3e){
return _autohidesScrollers;
}
}),new objj_method(sel_getUid("_updateCornerAndHeaderView"),function(_40,_41){
with(_40){
var _42=objj_msgSend(_40,"documentView"),_43=objj_msgSend(_40,"_headerView"),_44=objj_msgSend(_42,"respondsToSelector:",sel_getUid("headerView"))?objj_msgSend(_42,"headerView"):nil;
if(_43!==_44){
objj_msgSend(_43,"removeFromSuperview");
objj_msgSend(_headerClipView,"setDocumentView:",_44);
}
var _45=objj_msgSend(_42,"respondsToSelector:",sel_getUid("cornerView"))?objj_msgSend(_42,"cornerView"):nil;
if(_cornerView!==_45){
objj_msgSend(_cornerView,"removeFromSuperview");
_cornerView=_45;
if(_cornerView){
objj_msgSend(_40,"addSubview:",_cornerView);
}
}
objj_msgSend(_40,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("_headerView"),function(_46,_47){
with(_46){
var _48=objj_msgSend(_headerClipView,"subviews");
return objj_msgSend(_48,"count")?_48[0]:nil;
}
}),new objj_method(sel_getUid("_cornerViewFrame"),function(_49,_4a){
with(_49){
if(!_cornerView){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _4b=objj_msgSend(_49,"bounds"),_4c=objj_msgSend(_cornerView,"frame");
_4c.origin.x=(_4b.origin.x+_4b.size.width)-(_4c.size.width);
_4c.origin.y=0;
return _4c;
}
}),new objj_method(sel_getUid("_headerClipViewFrame"),function(_4d,_4e){
with(_4d){
var _4f=objj_msgSend(_4d,"_headerView");
if(!_4f){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _50=objj_msgSend(_4d,"bounds");
_50.size.height=(objj_msgSend(_4f,"frame").size.height);
_50.size.width-=(objj_msgSend(_4d,"_cornerViewFrame").size.width);
return _50;
}
}),new objj_method(sel_getUid("_verticalScrollerDidScroll:"),function(_51,_52,_53){
with(_51){
var _54=objj_msgSend(_53,"floatValue"),_55=objj_msgSend(objj_msgSend(_contentView,"documentView"),"frame");
contentBounds=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_verticalScroller,"hitPart")){
case CPScrollerDecrementLine:
contentBounds.origin.y-=_verticalLineScroll;
break;
case CPScrollerIncrementLine:
contentBounds.origin.y+=_verticalLineScroll;
break;
case CPScrollerDecrementPage:
contentBounds.origin.y-=(contentBounds.size.height)-_verticalPageScroll;
break;
case CPScrollerIncrementPage:
contentBounds.origin.y+=(contentBounds.size.height)-_verticalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
contentBounds.origin.y=ROUND(_54*((_55.size.height)-(contentBounds.size.height)));
}
objj_msgSend(_contentView,"scrollToPoint:",contentBounds.origin);
}
}),new objj_method(sel_getUid("_horizontalScrollerDidScroll:"),function(_56,_57,_58){
with(_56){
var _59=objj_msgSend(_58,"floatValue"),_5a=objj_msgSend(objj_msgSend(_56,"documentView"),"frame"),_5b=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_horizontalScroller,"hitPart")){
case CPScrollerDecrementLine:
_5b.origin.x-=_horizontalLineScroll;
break;
case CPScrollerIncrementLine:
_5b.origin.x+=_horizontalLineScroll;
break;
case CPScrollerDecrementPage:
_5b.origin.x-=(_5b.size.width)-_horizontalPageScroll;
break;
case CPScrollerIncrementPage:
_5b.origin.x+=(_5b.size.width)-_horizontalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
_5b.origin.x=ROUND(_59*((_5a.size.width)-(_5b.size.width)));
}
objj_msgSend(_contentView,"scrollToPoint:",_5b.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_5b.origin.x,0));
}
}),new objj_method(sel_getUid("tile"),function(_5c,_5d){
with(_5c){
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_5e,_5f,_60){
with(_5e){
objj_msgSend(_5e,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("setLineScroll:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_61,"setHorizonalLineScroll:",_63);
objj_msgSend(_61,"setVerticalLineScroll:",_63);
}
}),new objj_method(sel_getUid("lineScroll"),function(_64,_65){
with(_64){
return objj_msgSend(_64,"horizontalLineScroll");
}
}),new objj_method(sel_getUid("setHorizontalLineScroll:"),function(_66,_67,_68){
with(_66){
_horizontalLineScroll=_68;
}
}),new objj_method(sel_getUid("horizontalLineScroll"),function(_69,_6a){
with(_69){
return _horizontalLineScroll;
}
}),new objj_method(sel_getUid("setVerticalLineScroll:"),function(_6b,_6c,_6d){
with(_6b){
_verticalLineScroll=_6d;
}
}),new objj_method(sel_getUid("verticalLineScroll"),function(_6e,_6f){
with(_6e){
return _verticalLineScroll;
}
}),new objj_method(sel_getUid("setPageScroll:"),function(_70,_71,_72){
with(_70){
objj_msgSend(_70,"setHorizontalPageScroll:",_72);
objj_msgSend(_70,"setVerticalPageScroll:",_72);
}
}),new objj_method(sel_getUid("pageScroll"),function(_73,_74){
with(_73){
return objj_msgSend(_73,"horizontalPageScroll");
}
}),new objj_method(sel_getUid("setHorizontalPageScroll:"),function(_75,_76,_77){
with(_75){
_horizontalPageScroll=_77;
}
}),new objj_method(sel_getUid("horizontalPageScroll"),function(_78,_79){
with(_78){
return _horizontalPageScroll;
}
}),new objj_method(sel_getUid("setVerticalPageScroll:"),function(_7a,_7b,_7c){
with(_7a){
_verticalPageScroll=_7c;
}
}),new objj_method(sel_getUid("verticalPageScroll"),function(_7d,_7e){
with(_7d){
return _verticalPageScroll;
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(objj_msgSend(_7f,"documentView"),"frame"),_83=objj_msgSend(_contentView,"bounds");
_83.origin.x=ROUND(_83.origin.x+objj_msgSend(_81,"deltaX")*_horizontalLineScroll);
_83.origin.y=ROUND(_83.origin.y+objj_msgSend(_81,"deltaY")*_verticalLineScroll);
objj_msgSend(_contentView,"scrollToPoint:",_83.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_83.origin.x,0));
}
}),new objj_method(sel_getUid("keyDown:"),function(_84,_85,_86){
with(_84){
var _87=objj_msgSend(_86,"keyCode"),_88=objj_msgSend(objj_msgSend(_84,"documentView"),"frame"),_89=objj_msgSend(_contentView,"bounds");
switch(_87){
case 33:
_89.origin.y-=(_89.size.height)-_verticalPageScroll;
break;
case 34:
_89.origin.y+=(_89.size.height)-_verticalPageScroll;
break;
case 38:
_89.origin.y-=_verticalLineScroll;
break;
case 40:
_89.origin.y+=_verticalLineScroll;
break;
case 37:
_89.origin.x-=_horizontalLineScroll;
break;
case 49:
_89.origin.x+=_horizontalLineScroll;
break;
default:
return objj_msgSendSuper({receiver:_84,super_class:objj_getClass("CPView")},"keyDown:",_86);
}
objj_msgSend(_contentView,"scrollToPoint:",_89.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_89.origin,0));
}
})]);
var _8a="CPScrollViewContentView",_8b="CPScrollViewVLineScroll",_8c="CPScrollViewHLineScroll",_8d="CPScrollViewVPageScroll",_8e="CPScrollViewHPageScroll",_8f="CPScrollViewHasVScroller",_90="CPScrollViewHasHScroller",_91="CPScrollViewVScroller",_92="CPScrollViewHScroller",_93="CPScrollViewAutohidesScroller";
var _1=objj_getClass("CPScrollView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPScrollView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_94,_95,_96){
with(_94){
if(_94=objj_msgSendSuper({receiver:_94,super_class:objj_getClass("CPView")},"initWithCoder:",_96)){
_verticalLineScroll=objj_msgSend(_96,"decodeFloatForKey:",_8b);
_verticalPageScroll=objj_msgSend(_96,"decodeFloatForKey:",_8d);
_horizontalLineScroll=objj_msgSend(_96,"decodeFloatForKey:",_8c);
_horizontalPageScroll=objj_msgSend(_96,"decodeFloatForKey:",_8e);
_contentView=objj_msgSend(_96,"decodeObjectForKey:",_8a);
_verticalScroller=objj_msgSend(_96,"decodeObjectForKey:",_91);
_horizontalScroller=objj_msgSend(_96,"decodeObjectForKey:",_92);
_hasVerticalScroller=objj_msgSend(_96,"decodeBoolForKey:",_8f);
_hasHorizontalScroller=objj_msgSend(_96,"decodeBoolForKey:",_90);
_autohidesScrollers=objj_msgSend(_96,"decodeBoolForKey:",_93);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("reflectScrolledClipView:"),_94,_contentView,0,[CPDefaultRunLoopMode]);
}
return _94;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_97,_98,_99){
with(_97){
objj_msgSendSuper({receiver:_97,super_class:objj_getClass("CPView")},"encodeWithCoder:",_99);
objj_msgSend(_99,"encodeObject:forKey:",_contentView,_8a);
objj_msgSend(_99,"encodeObject:forKey:",_verticalScroller,_91);
objj_msgSend(_99,"encodeObject:forKey:",_horizontalScroller,_92);
objj_msgSend(_99,"encodeFloat:forKey:",_verticalLineScroll,_8b);
objj_msgSend(_99,"encodeFloat:forKey:",_verticalPageScroll,_8d);
objj_msgSend(_99,"encodeFloat:forKey:",_horizontalLineScroll,_8c);
objj_msgSend(_99,"encodeFloat:forKey:",_horizontalPageScroll,_8e);
objj_msgSend(_99,"encodeBool:forKey:",_hasVerticalScroller,_8f);
objj_msgSend(_99,"encodeBool:forKey:",_hasHorizontalScroller,_90);
objj_msgSend(_99,"encodeBool:forKey:",_autohidesScrollers,_93);
}
})]);
