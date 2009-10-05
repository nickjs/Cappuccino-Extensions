i;12;CGGeometry.ji;19;CGAffineTransform.jc;7354;
kCGPathElementMoveToPoint=0;
kCGPathElementAddLineToPoint=1;
kCGPathElementAddQuadCurveToPoint=2;
kCGPathElementAddCurveToPoint=3;
kCGPathElementCloseSubpath=4;
kCGPathElementAddArc=5;
kCGPathElementAddArcToPoint=6;
CGPathCreateMutable=function(){
return {count:0,start:NULL,current:NULL,elements:[]};
};
CGPathCreateMutableCopy=function(_1){
var _2=CGPathCreateMutable();
CGPathAddPath(_2,_1);
return _2;
};
CGPathCreateCopy=function(_3){
return CGPathCreateMutableCopy(_3);
};
CGPathRelease=function(_4){
};
CGPathRetain=function(_5){
return _5;
};
CGPathAddArc=function(_6,_7,x,y,_a,_b,_c,_d){
if(_7&&!(_7.a==1&&_7.b==0&&_7.c==0&&_7.d==1&&_7.tx==0&&_7.ty==0)){
var _e={x:x,y:y},_f={x:COS(_c),y:SIN(_c)},_10={x:COS(_b),y:SIN(_b)};
_f={x:_f.x*_7.a+_f.y*_7.c+_7.tx,y:_f.x*_7.b+_f.y*_7.d+_7.ty};
_10={x:_10.x*_7.a+_10.y*_7.c+_7.tx,y:_10.x*_7.b+_10.y*_7.d+_7.ty};
_e={x:_e.x*_7.a+_e.y*_7.c+_7.tx,y:_e.x*_7.b+_e.y*_7.d+_7.ty};
x=_e.x;
y=_e.y;
var _11=_c,_12=_b;
_c=ATAN2(_f.y-_7.ty,_f.x-_7.tx);
_b=ATAN2(_10.y-_7.ty,_10.x-_7.tx);
if(_c==_b&&_11!=_12){
if(_12>_11){
_c=_c-PI2;
}else{
_b=_b-PI2;
}
}
_a={width:_a,height:0};
_a={width:_a.width*_7.a+_a.height*_7.c,height:_a.width*_7.b+_a.height*_7.d};
_a=SQRT(_a.width*_a.width+_a.height*_a.height);
}
_6.current={x:x+_a*COS(_c),y:y+_a*SIN(_c)};
_6.elements[_6.count++]={type:kCGPathElementAddArc,x:x,y:y,radius:_a,startAngle:_b,endAngle:_c};
};
CGPathAddArcToPoint=function(_13,_14,x1,y1,x2,y2,_19){
};
CGPathAddCurveToPoint=function(_1a,_1b,_1c,_1d,_1e,_1f,x,y){
var cp1={x:_1c,y:_1d},cp2={x:_1e,y:_1f},end={x:x,y:y};
if(_1b){
cp1={x:cp1.x*_1b.a+cp1.y*_1b.c+_1b.tx,y:cp1.x*_1b.b+cp1.y*_1b.d+_1b.ty};
cp2={x:cp2.x*_1b.a+cp2.y*_1b.c+_1b.tx,y:cp2.x*_1b.b+cp2.y*_1b.d+_1b.ty};
end={x:end.x*_1b.a+end.y*_1b.c+_1b.tx,y:end.x*_1b.b+end.y*_1b.d+_1b.ty};
}
_1a.current=end;
_1a.elements[_1a.count++]={type:kCGPathElementAddCurveToPoint,cp1x:cp1.x,cp1y:cp1.y,cp2x:cp2.x,cp2y:cp2.y,x:end.x,y:end.y};
};
CGPathAddLines=function(_25,_26,_27,_28){
var i=1;
if(arguments["count"]==NULL){
var _28=_27.length;
}
if(!_25||_28<2){
return;
}
CGPathMoveToPoint(_25,_26,_27[0].x,_27[0].y);
for(;i<_28;++i){
CGPathAddLineToPoint(_25,_26,_27[i].x,_27[i].y);
}
};
CGPathAddLineToPoint=function(_2a,_2b,x,y){
var _2e={x:x,y:y};
if(_2b!=NULL){
_2e={x:_2e.x*_2b.a+_2e.y*_2b.c+_2b.tx,y:_2e.x*_2b.b+_2e.y*_2b.d+_2b.ty};
}
_2a.elements[_2a.count++]={type:kCGPathElementAddLineToPoint,x:_2e.x,y:_2e.y};
_2a.current=_2e;
};
CGPathAddPath=function(_2f,_30,_31){
for(var i=0,_33=_31.count;i<_33;++i){
var _34=_31.elements[i];
switch(_34.type){
case kCGPathElementAddLineToPoint:
CGPathAddLineToPoint(_2f,_30,_34.x,_34.y);
break;
case kCGPathElementAddCurveToPoint:
CGPathAddCurveToPoint(_2f,_30,_34.cp1x,_34.cp1y,_34.cp2x,_34.cp2y,_34.x,_34.y);
break;
case kCGPathElementAddArc:
CGPathAddArc(_2f,_30,_34.x,_34.y,_34.radius,_34.startAngle,_34.endAngle,_34.isClockwise);
break;
case kCGPathElementAddQuadCurveToPoint:
CGPathAddQuadCurveToPoint(_2f,_30,_34.cpx,_34.cpy,_34.x,_34.y);
break;
case kCGPathElementMoveToPoint:
CGPathMoveToPoint(_2f,_30,_34.x,_34.y);
break;
case kCGPathElementCloseSubpath:
CGPathCloseSubpath(_2f);
break;
}
}
};
CGPathAddQuadCurveToPoint=function(_35,_36,cpx,cpy,x,y){
var cp={x:cpx,y:cpy},end={x:x,y:y};
if(_36){
cp={x:control.x*_36.a+control.y*_36.c+_36.tx,y:control.x*_36.b+control.y*_36.d+_36.ty};
end={x:end.x*_36.a+end.y*_36.c+_36.tx,y:end.x*_36.b+end.y*_36.d+_36.ty};
}
_35.elements[_35.count++]={type:kCGPathElementAddQuadCurveToPoint,cpx:cp.x,cpy:cp.y,x:end.x,y:end.y};
_35.current=end;
};
CGPathAddRect=function(_3d,_3e,_3f){
CGPathAddRects(_3d,_3e,[_3f],1);
};
CGPathAddRects=function(_40,_41,_42,_43){
var i=0;
if(arguments["count"]==NULL){
var _43=_42.length;
}
for(;i<_43;++i){
var _45=_42[i];
CGPathMoveToPoint(_40,_41,(_45.origin.x),(_45.origin.y));
CGPathAddLineToPoint(_40,_41,(_45.origin.x+_45.size.width),(_45.origin.y));
CGPathAddLineToPoint(_40,_41,(_45.origin.x+_45.size.width),(_45.origin.y+_45.size.height));
CGPathAddLineToPoint(_40,_41,(_45.origin.x),(_45.origin.y+_45.size.height));
CGPathCloseSubpath(_40);
}
};
CGPathMoveToPoint=function(_46,_47,x,y){
var _4a={x:x,y:y},_4b=_46.count;
if(_47!=NULL){
_4a={x:_4a.x*_47.a+_4a.y*_47.c+_47.tx,y:_4a.x*_47.b+_4a.y*_47.d+_47.ty};
}
_46.start=_4a;
_46.current=_4a;
var _4c=_46.elements[_4b-1];
if(_4b!=0&&_4c.type==kCGPathElementMoveToPoint){
_4c.x=_4a.x;
_4c.y=_4a.y;
}else{
_46.elements[_46.count++]={type:kCGPathElementMoveToPoint,x:_4a.x,y:_4a.y};
}
};
var _4d=4*((SQRT2-1)/3);
CGPathWithEllipseInRect=function(_4e){
var _4f=CGPathCreateMutable();
if((_4e.size.width)==(_4e.size.height)){
CGPathAddArc(_4f,nil,(_4e.origin.x+(_4e.size.width)/2),(_4e.origin.y+(_4e.size.height)/2),(_4e.size.width)/2,0,2*PI,YES);
}else{
var _50={width:(_4e.size.width)/2,height:(_4e.size.height)/2},_51={x:(_4e.origin.x)+_50.width,y:(_4e.origin.y)+_50.height};
CGPathMoveToPoint(_4f,nil,_51.x,_51.y-_50.height);
CGPathAddCurveToPoint(_4f,nil,_51.x+(_4d*_50.width),_51.y-_50.height,_51.x+_50.width,_51.y-(_4d*_50.height),_51.x+_50.width,_51.y);
CGPathAddCurveToPoint(_4f,nil,_51.x+_50.width,_51.y+(_4d*_50.height),_51.x+(_4d*_50.width),_51.y+_50.height,_51.x,_51.y+_50.height);
CGPathAddCurveToPoint(_4f,nil,_51.x-(_4d*_50.width),_51.y+_50.height,_51.x-_50.width,_51.y+(_4d*_50.height),_51.x-_50.width,_51.y);
CGPathAddCurveToPoint(_4f,nil,_51.x-_50.width,_51.y-(_4d*_50.height),_51.x-(_4d*_50.width),_51.y-_50.height,_51.x,_51.y-_50.height);
}
CGPathCloseSubpath(_4f);
return _4f;
};
CGPathWithRoundedRectangleInRect=function(_52,_53,_54,ne,se,sw,nw){
var _59=CGPathCreateMutable(),_5a=(_52.origin.x),_5b=(_52.origin.x+_52.size.width),_5c=(_52.origin.y),_5d=(_52.origin.y+_52.size.height);
CGPathMoveToPoint(_59,nil,_5a+_53,_5c);
if(ne){
CGPathAddLineToPoint(_59,nil,_5b-_53,_5c);
CGPathAddCurveToPoint(_59,nil,_5b-_53,_5c,_5b,_5c,_5b,_5c+_53);
}else{
CGPathAddLineToPoint(_59,nil,_5b,_5c);
}
if(se){
CGPathAddLineToPoint(_59,nil,_5b,_5d-_53);
CGPathAddCurveToPoint(_59,nil,_5b,_5d-_53,_5b,_5d,_5b-_53,_5d);
}else{
CGPathAddLineToPoint(_59,nil,_5b,_5d);
}
if(sw){
CGPathAddLineToPoint(_59,nil,_5a+_53,_5d);
CGPathAddCurveToPoint(_59,nil,_5a+_53,_5d,_5a,_5d,_5a,_5d-_53);
}else{
CGPathAddLineToPoint(_59,nil,_5a,_5d);
}
if(nw){
CGPathAddLineToPoint(_59,nil,_5a,_5c+_53);
CGPathAddCurveToPoint(_59,nil,_5a,_5c+_53,_5a,_5c,_5a+_53,_5c);
}else{
CGPathAddLineToPoint(_59,nil,_5a,_5c);
}
CGPathCloseSubpath(_59);
return _59;
};
CGPathCloseSubpath=function(_5e){
var _5f=_5e.count;
if(_5f==0||_5e.elements[_5f-1].type==kCGPathElementCloseSubpath){
return;
}
_5e.elements[_5e.count++]={type:kCGPathElementCloseSubpath,points:[_5e.start]};
};
CGPathEqualToPath=function(_60,_61){
if(_60==_61){
return YES;
}
if(_60.count!=_61.count||!(_60.start.x==_61.start.x&&_60.start.y==_61.start.y)||!(_60.current.x==_61.current.x&&_60.current.y==_61.current.y)){
return NO;
}
var i=0,_63=_60.count;
for(;i<_63;++i){
var _64=_60[i],_65=_61[i];
if(_64.type!=_65.type){
return NO;
}
if((_64.type==kCGPathElementAddArc||_64.type==kCGPathElementAddArcToPoint)&&_64.radius!=_65.radius){
return NO;
}
var j=_64.points.length;
while(j--){
if(!(_64.points[j].x==_65.points[j].x&&_64.points[j].y==_65.points[j].y)){
return NO;
}
}
}
return YES;
};
CGPathGetCurrentPoint=function(_67){
return {x:_67.current.x,y:_67.current.y};
};
CGPathIsEmpty=function(_68){
return !_68||_68.count==0;
};
