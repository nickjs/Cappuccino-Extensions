i;8;CPView.jc;5848;
CPNoBorder=0;
CPLineBorder=1;
CPBezelBorder=2;
CPGrooveBorder=3;
var _1=objj_allocateClassPair(CPView,"CPBox"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_borderType"),new objj_ivar("_borderColor"),new objj_ivar("_fillColor"),new objj_ivar("_cornerRadius"),new objj_ivar("_borderWidth"),new objj_ivar("_contentMargin"),new objj_ivar("_contentView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5)){
_fillColor=objj_msgSend(CPColor,"clearColor");
_borderColor=objj_msgSend(CPColor,"blackColor");
_borderWidth=1;
_contentMargin=CGSizeMake(0,0);
_contentView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_3,"bounds"));
objj_msgSend(_3,"addSubview:",_contentView);
}
return _3;
}
}),new objj_method(sel_getUid("borderRect"),function(_6,_7){
with(_6){
return objj_msgSend(_6,"bounds");
}
}),new objj_method(sel_getUid("borderType"),function(_8,_9){
with(_8){
return _borderType;
}
}),new objj_method(sel_getUid("setBorderType:"),function(_a,_b,_c){
with(_a){
_borderType=_c;
objj_msgSend(_a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("borderColor"),function(_d,_e){
with(_d){
return _borderColor;
}
}),new objj_method(sel_getUid("setBorderColor:"),function(_f,_10,_11){
with(_f){
if(objj_msgSend(_11,"isEqual:",_borderColor)){
return;
}
_borderColor=_11;
objj_msgSend(_f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("borderWidth"),function(_12,_13){
with(_12){
return _borderWidth;
}
}),new objj_method(sel_getUid("setBorderWidth:"),function(_14,_15,_16){
with(_14){
if(_16===_borderWidth){
return;
}
_borderWidth=_16;
objj_msgSend(_14,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("cornerRadius"),function(_17,_18){
with(_17){
return _cornerRadius;
}
}),new objj_method(sel_getUid("setCornerRadius:"),function(_19,_1a,_1b){
with(_19){
if(_1b===_cornerRadius){
return;
}
_cornerRadius=_1b;
objj_msgSend(_19,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("fillColor"),function(_1c,_1d){
with(_1c){
return _fillColor;
}
}),new objj_method(sel_getUid("setFillColor:"),function(_1e,_1f,_20){
with(_1e){
if(objj_msgSend(_20,"isEqual:",_fillColor)){
return;
}
_fillColor=_20;
objj_msgSend(_1e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("contentView"),function(_21,_22){
with(_21){
return _contentView;
}
}),new objj_method(sel_getUid("setContentView:"),function(_23,_24,_25){
with(_23){
if(_25===_contentView){
return;
}
objj_msgSend(_25,"setFrame:",CGRectInset(objj_msgSend(_23,"bounds"),_contentMargin.width+_borderWidth,_contentMargin.height+_borderWidth));
objj_msgSend(_23,"replaceSubview:with:",_contentView,_25);
_contentView=_25;
}
}),new objj_method(sel_getUid("contentViewMargins"),function(_26,_27){
with(_26){
return _contentMargin;
}
}),new objj_method(sel_getUid("setContentViewMargins:"),function(_28,_29,_2a){
with(_28){
if(_2a.width<0||_2a.height<0){
objj_msgSend(CPException,"raise:reason:",CPGenericException,"Margins must be positive");
}
_contentMargin=CGSizeMakeCopy(_2a);
objj_msgSend(_28,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setFrameFromContentFrame:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_2b,"setFrame:",CGRectInset(_2d,-(_contentMargin.width+_borderWidth),-(_contentMargin.height+_borderWidth)));
objj_msgSend(_2b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("sizeToFit"),function(_2e,_2f){
with(_2e){
var _30=objj_msgSend(_contentView,"frame");
objj_msgSend(_2e,"setFrameSize:",CGSizeMake(_30.size.width+_contentMargin.width*2,_30.size.height+_contentMargin.height*2));
objj_msgSend(_contentView,"setFrameOrigin:",CGPointMake(_contentMargin.width,_contentMargin.height));
}
}),new objj_method(sel_getUid("drawRect:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_31,"bounds"),_35=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_36=_borderWidth/2,_37=CGRectMake(_34.origin.x+_36,_34.origin.y+_36,_34.size.width-_borderWidth,_34.size.height-_borderWidth),_38=CGRectMake(_34.origin.x+_36,_34.origin.y+_36,_34.size.width-_borderWidth,_34.size.height-_borderWidth);
CGContextSetFillColor(_35,objj_msgSend(_31,"fillColor"));
CGContextSetStrokeColor(_35,objj_msgSend(_31,"borderColor"));
CGContextSetLineWidth(_35,_borderWidth);
switch(_borderType){
case CPLineBorder:
CGContextFillRoundedRectangleInRect(_35,_38,_cornerRadius,YES,YES,YES,YES);
CGContextStrokeRoundedRectangleInRect(_35,_37,_cornerRadius,YES,YES,YES,YES);
break;
case CPBezelBorder:
CGContextFillRoundedRectangleInRect(_35,_38,_cornerRadius,YES,YES,YES,YES);
CGContextSetStrokeColor(_35,objj_msgSend(CPColor,"colorWithWhite:alpha:",190/255,1));
CGContextBeginPath(_35);
CGContextMoveToPoint(_35,_37.origin.x,_37.origin.y);
CGContextAddLineToPoint(_35,CGRectGetMinX(_37),CGRectGetMaxY(_37)),CGContextAddLineToPoint(_35,CGRectGetMaxX(_37),CGRectGetMaxY(_37)),CGContextAddLineToPoint(_35,CGRectGetMaxX(_37),CGRectGetMinY(_37)),CGContextStrokePath(_35);
CGContextSetStrokeColor(_35,objj_msgSend(CPColor,"colorWithWhite:alpha:",142/255,1));
CGContextBeginPath(_35);
CGContextMoveToPoint(_35,_34.origin.x,_37.origin.y);
CGContextAddLineToPoint(_35,CGRectGetMaxX(_34),CGRectGetMinY(_37));
CGContextStrokePath(_35);
break;
default:
break;
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("boxEnclosingView:"),function(_39,_3a,_3b){
with(_39){
var box=objj_msgSend(objj_msgSend(_39,"alloc"),"initWithFrame:",CGRectMakeZero()),_3d=objj_msgSend(_3b,"superview");
objj_msgSend(box,"setFrameFromContentFrame:",objj_msgSend(_3b,"frame"));
objj_msgSend(_3d,"replaceSubview:with:",_3b,box);
objj_msgSend(box,"setContentView:",_3b);
return box;
}
})]);
