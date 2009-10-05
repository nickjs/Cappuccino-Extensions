I;26;AppKit/CPGraphicsContext.jI;21;Foundation/CPObject.jc;4365;
var _1=1;
var _2=objj_allocateClassPair(CPObject,"CPBezierPath"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_path"),new objj_ivar("_lineWidth")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init")){
_path=CGPathCreateMutable();
_lineWidth=objj_msgSend(objj_msgSend(_4,"class"),"defaultLineWidth");
}
return _4;
}
}),new objj_method(sel_getUid("moveToPoint:"),function(_6,_7,_8){
with(_6){
CGPathMoveToPoint(_path,nil,_8.x,_8.y);
}
}),new objj_method(sel_getUid("lineToPoint:"),function(_9,_a,_b){
with(_9){
CGPathAddLineToPoint(_path,nil,_b.x,_b.y);
}
}),new objj_method(sel_getUid("curveToPoint:controlPoint1:controlPoint2:"),function(_c,_d,_e,_f,_10){
with(_c){
CGPathAddCurveToPoint(_path,nil,_f.x,_f.y,_10.x,_10.y,_e.x,_e.y);
}
}),new objj_method(sel_getUid("closePath"),function(_11,_12){
with(_11){
CGPathCloseSubpath(_path);
}
}),new objj_method(sel_getUid("stroke"),function(_13,_14){
with(_13){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(ctx);
CGContextAddPath(ctx,_path);
CGContextSetLineWidth(ctx,objj_msgSend(_13,"lineWidth"));
CGContextClosePath(ctx);
CGContextStrokePath(ctx);
}
}),new objj_method(sel_getUid("fill"),function(_16,_17){
with(_16){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(ctx);
CGContextAddPath(ctx,_path);
CGContextSetLineWidth(ctx,objj_msgSend(_16,"lineWidth"));
CGContextClosePath(ctx);
CGContextFillPath(ctx);
}
}),new objj_method(sel_getUid("lineWidth"),function(_19,_1a){
with(_19){
return _lineWidth;
}
}),new objj_method(sel_getUid("setLineWidth:"),function(_1b,_1c,_1d){
with(_1b){
_lineWidth=_1d;
}
}),new objj_method(sel_getUid("elementCount"),function(_1e,_1f){
with(_1e){
return _path.count;
}
}),new objj_method(sel_getUid("isEmpty"),function(_20,_21){
with(_20){
return CGPathIsEmpty(_path);
}
}),new objj_method(sel_getUid("currentPoint"),function(_22,_23){
with(_22){
return CGPathGetCurrentPoint(_path);
}
}),new objj_method(sel_getUid("appendBezierPathWithPoints:count:"),function(_24,_25,_26,_27){
with(_24){
CGPathAddLines(_path,nil,_26,_27);
}
}),new objj_method(sel_getUid("appendBezierPathWithRect:"),function(_28,_29,_2a){
with(_28){
CGPathAddRect(_path,nil,_2a);
}
}),new objj_method(sel_getUid("appendBezierPathWithOvalInRect:"),function(_2b,_2c,_2d){
with(_2b){
CGPathAddPath(_path,nil,CGPathWithEllipseInRect(_2d));
}
}),new objj_method(sel_getUid("appendBezierPathWithRoundedRect:xRadius:yRadius:"),function(_2e,_2f,_30,_31,_32){
with(_2e){
CGPathAddPath(_path,nil,CGPathWithRoundedRectangleInRect(_30,_31,_32,YES,YES,YES,YES));
}
}),new objj_method(sel_getUid("appendBezierPath:"),function(_33,_34,_35){
with(_33){
CGPathAddPath(_path,nil,_35._path);
}
}),new objj_method(sel_getUid("removeAllPoints"),function(_36,_37){
with(_36){
_path=CGPathCreateMutable();
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("bezierPath"),function(_38,_39){
with(_38){
return objj_msgSend(objj_msgSend(_38,"alloc"),"init");
}
}),new objj_method(sel_getUid("bezierPathWithOvalInRect:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=objj_msgSend(_3a,"bezierPath");
objj_msgSend(_3d,"appendBezierPathWithOvalInRect:",_3c);
return _3d;
}
}),new objj_method(sel_getUid("bezierPathWithRect:"),function(_3e,_3f,_40){
with(_3e){
var _41=objj_msgSend(_3e,"bezierPath");
objj_msgSend(_41,"appendBezierPathWithRect:",_40);
return _41;
}
}),new objj_method(sel_getUid("defaultLineWidth"),function(_42,_43){
with(_42){
return _1;
}
}),new objj_method(sel_getUid("setDefaultLineWidth:"),function(_44,_45,_46){
with(_44){
_1=_46;
}
}),new objj_method(sel_getUid("fillRect:"),function(_47,_48,_49){
with(_47){
objj_msgSend(objj_msgSend(_47,"bezierPathWithRect:",_49),"fill");
}
}),new objj_method(sel_getUid("strokeRect:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSend(objj_msgSend(_4a,"bezierPathWithRect:",_4c),"stroke");
}
}),new objj_method(sel_getUid("strokeLineFromPoint:toPoint:"),function(_4d,_4e,_4f,_50){
with(_4d){
var _51=objj_msgSend(_4d,"bezierPath");
objj_msgSend(_51,"moveToPoint:",_4f);
objj_msgSend(_51,"lineToPoint:",_50);
objj_msgSend(_51,"stroke");
}
})]);
