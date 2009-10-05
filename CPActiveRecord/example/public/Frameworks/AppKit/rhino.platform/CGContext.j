i;12;CGGeometry.ji;19;CGAffineTransform.ji;8;CGPath.jc;20472;
kCGLineCapButt=0;
kCGLineCapRound=1;
kCGLineCapSquare=2;
kCGLineJoinMiter=0;
kCGLineJoinRound=1;
kCGLineJoinBevel=2;
kCGPathFill=0;
kCGPathEOFill=1;
kCGPathStroke=2;
kCGPathFillStroke=3;
kCGPathEOFillStroke=4;
kCGBlendModeNormal=0;
kCGBlendModeMultiply=1;
kCGBlendModeScreen=2;
kCGBlendModeOverlay=3;
kCGBlendModeDarken=4;
kCGBlendModeLighten=5;
kCGBlendModeColorDodge=6;
kCGBlendModeColorBurn=7;
kCGBlendModeSoftLight=8;
kCGBlendModeHardLight=9;
kCGBlendModeDifference=10;
kCGBlendModeExclusion=11;
kCGBlendModeHue=12;
kCGBlendModeSaturation=13;
kCGBlendModeColor=14;
kCGBlendModeLuminosity=15;
kCGBlendModeClear=16;
kCGBlendModeCopy=17;
kCGBlendModeSourceIn=18;
kCGBlendModeSourceOut=19;
kCGBlendModeSourceAtop=20;
kCGBlendModeDestinationOver=21;
kCGBlendModeDestinationIn=22;
kCGBlendModeDestinationOut=23;
kCGBlendModeDestinationAtop=24;
kCGBlendModeXOR=25;
kCGBlendModePlusDarker=26;
kCGBlendModePlusLighter=27;
CGContextRelease=function(){
};
CGContextRetain=function(_1){
return _1;
};
if(!CPFeatureIsCompatible(CPHTMLCanvasFeature)){
CGGStateCreate=function(){
return {alpha:1,strokeStyle:"#000",fillStyle:"#ccc",lineWidth:1,lineJoin:kCGLineJoinMiter,lineCap:kCGLineCapButt,miterLimit:10,globalAlpha:1,blendMode:kCGBlendModeNormal,shadowOffset:{width:0,height:0},shadowBlur:0,shadowColor:NULL,CTM:{a:1,b:0,c:0,d:1,tx:0,ty:0}};
};
CGGStateCreateCopy=function(_2){
return {alpha:_2.alpha,strokeStyle:_2.strokeStyle,fillStyle:_2.fillStyle,lineWidth:_2.lineWidth,lineJoin:_2.lineJoin,lineCap:_2.lineCap,miterLimit:_2.miterLimit,globalAlpha:_2.globalAlpha,blendMode:_2.blendMode,shadowOffset:_2.shadowOffset,shadowBlur:_2.shadowBlur,shadowColor:_2.shadowColor,CTM:{a:_2.CTM.a,b:_2.CTM.b,c:_2.CTM.c,d:_2.CTM.d,tx:_2.CTM.tx,ty:_2.CTM.ty}};
};
CGBitmapGraphicsContextCreate=function(){
return {DOMElement:document.createElement("div"),path:NULL,gState:CGGStateCreate(),gStateStack:[]};
};
CGContextSaveGState=function(_3){
_3.gStateStack.push(CGGStateCreateCopy(_3.gState));
};
CGContextRestoreGState=function(_4){
_4.gState=_4.gStateStack.pop();
};
CGContextSetLineCap=function(_5,_6){
_5.gState.lineCap=_6;
};
CGContextSetLineJoin=function(_7,_8){
_7.gState.lineJoin=_8;
};
CGContextSetLineWidth=function(_9,_a){
_9.gState.lineWidth=_a;
};
CGContextSetMiterLimit=function(_b,_c){
_b.gState.miterLimit=_c;
};
CGContextSetBlendMode=function(_d,_e){
_d.gState.blendMode=_e;
};
CGContextAddArc=function(_f,x,y,_12,_13,_14,_15){
CGPathAddArc(_f.path,_f.gState.CTM,x,y,_12,_13,_14,_15);
};
CGContextAddArcToPoint=function(_16,x1,y1,x2,y2,_1b){
CGPathAddArcToPoint(_16.path,_16.gState.CTM,x1,y1,x2,y2,_1b);
};
CGContextAddCurveToPoint=function(_1c,_1d,_1e,_1f,_20,x,y){
CGPathAddCurveToPoint(_1c.path,_1c.gState.CTM,_1d,_1e,_1f,_20,x,y);
};
CGContextAddLines=function(_23,_24,_25){
CGPathAddLines(_23.path,_23.gState.CTM,_24,_25);
};
CGContextAddLineToPoint=function(_26,x,y){
CGPathAddLineToPoint(_26.path,_26.gState.CTM,x,y);
};
CGContextAddPath=function(_29,_2a){
if(!_29||CGPathIsEmpty(_2a)){
return;
}
if(!_29.path){
_29.path=CGPathCreateMutable();
}
CGPathAddPath(_29.path,_29.gState.CTM,_2a);
};
CGContextAddQuadCurveToPoint=function(_2b,cpx,cpy,x,y){
CGPathAddQuadCurveToPoint(_2b.path,_2b.gState.CTM,cpx,cpy,x,y);
};
CGContextAddRect=function(_30,_31){
CGPathAddRect(_30.path,_30.gState.CTM,_31);
};
CGContextAddRects=function(_32,_33,_34){
CGPathAddRects(_32.path,_32.gState.CTM,_33,_34);
};
CGContextBeginPath=function(_35){
_35.path=CGPathCreateMutable();
};
CGContextClosePath=function(_36){
CGPathCloseSubpath(_36.path);
};
CGContextMoveToPoint=function(_37,x,y){
if(!_37.path){
_37.path=CGPathCreateMutable();
}
CGPathMoveToPoint(_37.path,_37.gState.CTM,x,y);
};
CGContextFillRect=function(_3a,_3b){
CGContextFillRects(_3a,[_3b],1);
};
CGContextFillRects=function(_3c,_3d,_3e){
if(arguments[2]===undefined){
var _3e=_3d.length;
}
CGContextBeginPath(_3c);
CGContextAddRects(_3c,_3d,_3e);
CGContextClosePath(_3c);
CGContextDrawPath(_3c,kCGPathFill);
};
CGContextStrokeRect=function(_3f,_40){
CGContextBeginPath(_3f);
CGContextAddRect(_3f,_40);
CGContextClosePath(_3f);
CGContextDrawPath(_3f,kCGPathStroke);
};
CGContextStrokeRectWithWidth=function(_41,_42,_43){
CGContextSaveGState(_41);
CGContextSetLineWidth(_41,_43);
CGContextStrokeRect(_41,_42);
CGContextRestoreGState(_41);
};
CGContextConcatCTM=function(_44,_45){
var CTM=_44.gState.CTM;
var tx=CTM.tx*_45.a+CTM.ty*_45.c+_45.tx;
CTM.ty=CTM.tx*_45.b+CTM.ty*_45.d+_45.ty;
CTM.tx=tx;
var a=CTM.a*_45.a+CTM.b*_45.c,b=CTM.a*_45.b+CTM.b*_45.d,c=CTM.c*_45.a+CTM.d*_45.c;
CTM.d=CTM.c*_45.b+CTM.d*_45.d;
CTM.a=a;
CTM.b=b;
CTM.c=c;
};
CGContextGetCTM=function(_4b){
return _4b.gState.CTM;
};
CGContextRotateCTM=function(_4c,_4d){
var _4e=_4c.gState;
_4e.CTM=CGAffineTransformRotate(_4e.CTM,_4d);
};
CGContextScaleCTM=function(_4f,sx,sy){
var _52=_4f.gState;
_52.CTM={a:_52.CTM.a*sx,b:_52.CTM.b*sx,c:_52.CTM.c*sy,d:_52.CTM.d*sy,tx:_52.CTM.tx,ty:_52.CTM.ty};
};
CGContextTranslateCTM=function(_53,tx,ty){
var _56=_53.gState;
_56.CTM={a:_56.CTM.a,b:_56.CTM.b,c:_56.CTM.c,d:_56.CTM.d,tx:_56.CTM.tx+_56.CTM.a*tx+_56.CTM.c*ty,ty:_56.CTM.ty+_56.CTM.b*tx+_56.CTM.d*ty};
};
CGContextSetShadow=function(_57,_58,_59){
var _5a=_57.gState;
_5a.shadowOffset={width:_58.width,height:_58.height};
_5a.shadowBlur=_59;
_5a.shadowColor=objj_msgSend(CPColor,"shadowColor");
};
CGContextSetShadowWithColor=function(_5b,_5c,_5d,_5e){
var _5f=_5b.gState;
_5f.shadowOffset={width:_5c.width,height:_5c.height};
_5f.shadowBlur=_5d;
_5f.shadowColor=_5e;
};
CGContextSetAlpha=function(_60,_61){
_60.gState.alpha=MAX(MIN(_61,1),0);
};
}
CGContextEOFillPath=function(_62){
CGContextDrawPath(_62,kCGPathEOFill);
};
CGContextFillPath=function(_63){
CGContextDrawPath(_63,kCGPathFill);
};
var _64=4*((SQRT2-1)/3);
CGContextAddEllipseInRect=function(_65,_66){
CGContextBeginPath(_65);
CGContextAddPath(_65,CGPathWithEllipseInRect(_66));
CGContextClosePath(_65);
};
CGContextFillEllipseInRect=function(_67,_68){
CGContextBeginPath(_67);
CGContextAddEllipseInRect(_67,_68);
CGContextClosePath(_67);
CGContextFillPath(_67);
};
CGContextStrokeEllipseInRect=function(_69,_6a){
CGContextBeginPath(_69);
CGContextAddEllipseInRect(_69,_6a);
CGContextClosePath(_69);
CGContextStrokePath(_69);
};
CGContextStrokePath=function(_6b){
CGContextDrawPath(_6b,kCGPathStroke);
};
CGContextStrokeLineSegments=function(_6c,_6d,_6e){
var i=0;
if(arguments["count"]==NULL){
var _6e=_6d.length;
}
CGContextBeginPath(_6c);
for(;i<_6e;i+=2){
CGContextMoveToPoint(_6c,_6d[i].x,_6d[i].y);
CGContextAddLineToPoint(_6c,_6d[i+1].x,_6d[i+1].y);
}
CGContextStrokePath(_6c);
};
CGContextSetFillColor=function(_70,_71){
if(_71){
_70.gState.fillStyle=objj_msgSend(_71,"cssString");
}
};
CGContextSetStrokeColor=function(_72,_73){
if(_73){
_72.gState.strokeStyle=objj_msgSend(_73,"cssString");
}
};
CGContextFillRoundedRectangleInRect=function(_74,_75,_76,ne,se,sw,nw){
CGContextBeginPath(_74);
CGContextAddPath(_74,CGPathWithRoundedRectangleInRect(_75,_76,_76,ne,se,sw,nw));
CGContextClosePath(_74);
CGContextFillPath(_74);
};
CGContextStrokeRoundedRectangleInRect=function(_7b,_7c,_7d,ne,se,sw,nw){
CGContextBeginPath(_7b);
CGContextAddPath(_7b,CGPathWithRoundedRectangleInRect(_7c,_7d,_7d,ne,se,sw,nw));
CGContextClosePath(_7b);
CGContextStrokePath(_7b);
};
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)){
var _82=["butt","round","square"],_83=["miter","round","bevel"],_84=["source-over","source-over","source-over","source-over","darker","lighter","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","copy","source-in","source-out","source-atop","destination-over","destination-in","destination-out","destination-atop","xor","source-over","source-over"];
CGContextSaveGState=function(_85){
_85.save();
};
CGContextRestoreGState=function(_86){
_86.restore();
};
CGContextSetLineCap=function(_87,_88){
_87.lineCap=_82[_88];
};
CGContextSetLineJoin=function(_89,_8a){
_89.lineJoin=_83[_8a];
};
CGContextSetLineWidth=function(_8b,_8c){
_8b.lineWidth=_8c;
};
CGContextSetMiterLimit=function(_8d,_8e){
_8d.miterLimit=_8e;
};
CGContextSetBlendMode=function(_8f,_90){
_8f.globalCompositeOperation=_84[_90];
};
CGContextAddArc=function(_91,x,y,_94,_95,_96,_97){
_91.arc(x,y,_94,_95,_96,!_97);
};
CGContextAddArcToPoint=function(_98,x1,y1,x2,y2,_9d){
_98.arcTo(x1,y1,x2,y2,_9d);
};
CGContextAddCurveToPoint=function(_9e,_9f,_a0,_a1,_a2,x,y){
_9e.bezierCurveTo(_9f,_a0,_a1,_a2,x,y);
};
CGContextAddLineToPoint=function(_a5,x,y){
_a5.lineTo(x,y);
};
CGContextAddPath=function(_a8,_a9){
if(!_a8||CGPathIsEmpty(_a9)){
return;
}
var _aa=_a9.elements,i=0,_ac=_a9.count;
for(;i<_ac;++i){
var _ad=_aa[i],_ae=_ad.type;
switch(_ae){
case kCGPathElementMoveToPoint:
_a8.moveTo(_ad.x,_ad.y);
break;
case kCGPathElementAddLineToPoint:
_a8.lineTo(_ad.x,_ad.y);
break;
case kCGPathElementAddQuadCurveToPoint:
_a8.quadraticCurveTo(_ad.cpx,_ad.cpy,_ad.x,_ad.y);
break;
case kCGPathElementAddCurveToPoint:
_a8.bezierCurveTo(_ad.cp1x,_ad.cp1y,_ad.cp2x,_ad.cp2y,_ad.x,_ad.y);
break;
case kCGPathElementCloseSubpath:
_a8.closePath();
break;
case kCGPathElementAddArc:
_a8.arc(_ad.x,_ad.y,_ad.radius,_ad.startAngle,_ad.endAngle,_ad.clockwise);
break;
case kCGPathElementAddArcTo:
break;
}
}
};
CGContextAddRect=function(_af,_b0){
_af.rect((_b0.origin.x),(_b0.origin.y),(_b0.size.width),(_b0.size.height));
};
CGContextAddRects=function(_b1,_b2,_b3){
var i=0;
if(arguments["count"]==NULL){
var _b3=_b2.length;
}
for(;i<_b3;++i){
var _b5=_b2[i];
_b1.rect((_b5.origin.x),(_b5.origin.y),(_b5.size.width),(_b5.size.height));
}
};
CGContextBeginPath=function(_b6){
_b6.beginPath();
};
CGContextClosePath=function(_b7){
_b7.closePath();
};
CGContextMoveToPoint=function(_b8,x,y){
_b8.moveTo(x,y);
};
CGContextClearRect=function(_bb,_bc){
_bb.clearRect((_bc.origin.x),(_bc.origin.y),(_bc.size.width),(_bc.size.height));
};
CGContextDrawPath=function(_bd,_be){
if(_be==kCGPathFill||_be==kCGPathFillStroke){
_bd.fill();
}else{
if(_be==kCGPathEOFill||_be==kCGPathEOFillStroke){
alert("not implemented!!!");
}
}
if(_be==kCGPathStroke||_be==kCGPathFillStroke||_be==kCGPathEOFillStroke){
_bd.stroke();
}
};
CGContextFillRect=function(_bf,_c0){
_bf.fillRect((_c0.origin.x),(_c0.origin.y),(_c0.size.width),(_c0.size.height));
};
CGContextFillRects=function(_c1,_c2,_c3){
var i=0;
if(arguments["count"]==NULL){
var _c3=_c2.length;
}
for(;i<_c3;++i){
var _c5=_c2[i];
_c1.fillRect((_c5.origin.x),(_c5.origin.y),(_c5.size.width),(_c5.size.height));
}
};
CGContextStrokeRect=function(_c6,_c7){
_c6.strokeRect((_c7.origin.x),(_c7.origin.y),(_c7.size.width),(_c7.size.height));
};
CGContextClip=function(_c8){
_c8.clip();
};
CGContextClipToRect=function(_c9,_ca){
_c9.beginPath();
_c9.rect((_ca.origin.x),(_ca.origin.y),(_ca.size.width),(_ca.size.height));
_c9.closePath();
_c9.clip();
};
CGContextClipToRects=function(_cb,_cc,_cd){
if(arguments["count"]==NULL){
var _cd=_cc.length;
}
_cb.beginPath();
CGContextAddRects(_cb,_cc,_cd);
_cb.clip();
};
CGContextSetAlpha=function(_ce,_cf){
_ce.globalAlpha=_cf;
};
CGContextSetFillColor=function(_d0,_d1){
_d0.fillStyle=objj_msgSend(_d1,"cssString");
};
CGContextSetStrokeColor=function(_d2,_d3){
_d2.strokeStyle=objj_msgSend(_d3,"cssString");
};
CGContextSetShadow=function(_d4,_d5,_d6){
_d4.shadowOffsetX=_d5.width;
_d4.shadowOffsetY=_d5.height;
_d4.shadowBlur=_d6;
};
CGContextSetShadowWithColor=function(_d7,_d8,_d9,_da){
_d7.shadowOffsetX=_d8.width;
_d7.shadowOffsetY=_d8.height;
_d7.shadowBlur=_d9;
_d7.shadowColor=objj_msgSend(_da,"cssString");
};
CGContextRotateCTM=function(_db,_dc){
_db.rotate(_dc);
};
CGContextScaleCTM=function(_dd,sx,sy){
_dd.scale(sx,sy);
};
CGContextTranslateCTM=function(_e0,tx,ty){
_e0.translate(tx,ty);
};
eigen=function(_e3){
alert("IMPLEMENT ME!");
};
if(CPFeatureIsCompatible(CPJavaScriptCanvasTransformFeature)){
CGContextConcatCTM=function(_e4,_e5){
_e4.transform(_e5.a,_e5.b,_e5.c,_e5.d,_e5.tx,_e5.ty);
};
}else{
CGContextConcatCTM=function(_e6,_e7){
var a=_e7.a,b=_e7.b,c=_e7.c,d=_e7.d,tx=_e7.tx,ty=_e7.ty,sx=1,sy=1,a1=0,a2=0;
if(b==0&&c==0){
sx=a;
sy=d;
}else{
if(a*b==-c*d){
var _f2=(a*d<0||b*c>0)?-1:1,a2=(ATAN2(b,d)+ATAN2(-_f2*c,_f2*a))/2,cos=COS(a2),sin=SIN(a2);
if(cos==0){
sx=-c/sin;
sy=b/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
}
}
}else{
if(a*c==-b*d){
var _f2=(a*d<0||b*c>0)?-1:1;
a1=(Math.atan2(_f2*b,_f2*a)+Math.atan2(-c,d))/2,cos=COS(a1),sin=SIN(a1);
if(cos==0){
sx=b/sin;
sy=-c/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
}
}
}else{
var _f5=CGAffineTransformMake(a,c,b,d,0,0),u=eigen(CGAffineTransformConcat(_e7,_f5)),v=eigen(CGAffineTransformConcat(_f5,_e7)),U=CGAffineTransformMake(u.vector_1.x,u.vector_2.x,u.vector_1.y,u.vector_2.y,0,0),VT=CGAffineTransformMake(v.vector_1.x,v.vector_1.y,v.vector_2.x,v.vector_2.y,0,0),S=CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformInvert(U),_e7),CGAffineTransformInvert(VT));
a=VT.a;
b=VT.b;
c=VT.c;
d=VT.d;
var _f2=(a*d<0||b*c>0)?-1:1,a2=(ATAN2(b,d)+ATAN2(-_f2*c,_f2*a))/2,cos=COS(a2),sin=SIN(a2);
if(cos==0){
sx=-c/sin;
sy=b/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
}
}
S.a*=sx;
S.d*=sy;
a=U.a;
b=U.b;
c=U.c;
d=U.d;
var _f2=(a*d<0||b*c>0)?-1:1;
a1=(Math.atan2(_f2*b,_f2*a)+Math.atan2(-c,d))/2,cos=COS(a1),sin=SIN(a1);
if(cos==0){
sx=b/sin;
sy=-c/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
}
}
sx=S.a*sx;
sy=S.d*sy;
}
}
}
if(tx!=0||ty!=0){
CGContextTranslateCTM(_e6,tx,ty);
}
if(a1!=0){
CGContextRotateCTM(_e6,a1);
}
if(sx!=1||sy!=1){
CGContextScaleCTM(_e6,sx,sy);
}
if(a2!=0){
CGContextRotateCTM(_e6,a2);
}
};
}
CGContextDrawImage=function(_fb,_fc,_fd){
_fb.drawImage(_fd._image,(_fc.origin.x),(_fc.origin.y),(_fc.size.width),(_fc.size.height));
};
to_string=function(_fe){
return "rgba("+ROUND(_fe.components[0]*255)+", "+ROUND(_fe.components[1]*255)+", "+ROUND(255*_fe.components[2])+", "+_fe.components[3]+")";
};
CGContextDrawLinearGradient=function(_ff,_100,_101,_102,_103){
var _104=_100.colors,_105=_104.length,_106=_ff.createLinearGradient(_101.x,_101.y,_102.x,_102.y);
while(_105--){
_106.addColorStop(_100.locations[_105],to_string(_104[_105]));
}
_ff.fillStyle=_106;
_ff.fill();
};
CGBitmapGraphicsContextCreate=function(){
var _107=document.createElement("canvas"),_108=_107.getContext("2d");
_108.DOMElement=_107;
return _108;
};
}else{
if(CPFeatureIsCompatible(CPVMLFeature)){
var _109=["f","t"],_10a=["flat","round","square"],_10b=["miter","round","bevel"],_10c=[" m "," l ","qb"," c "," x ",[" at "," wa "]];
var _10d=CGBitmapGraphicsContextCreate;
CGBitmapGraphicsContextCreate=function(){
document.namespaces.add("cg_vml_","urn:schemas-microsoft-com:vml");
document.createStyleSheet().cssText="cg_vml_\\:*{behavior:url(#default#VML)}";
CGBitmapGraphicsContextCreate=_10d;
return _10d();
};
CGContextClearRect=function(_10e,_10f){
if(_10e.buffer!=nil){
_10e.buffer="";
}else{
_10e.DOMElement.innerHTML="";
}
_10e.path=NULL;
};
var W=10,H=10,Z=10,Z_2=Z/2;
CGContextDrawImage=function(_114,_115,_116){
var _117="";
if(_116.buffer!=nil){
_117=_116.buffer;
}else{
var ctm=_114.gState.CTM,_119=CGPointApplyAffineTransform(_115.origin,ctm),_11a=ctm.a==ctm.d&&ctm.b==-ctm.c,vml=["<cg_vml_:group coordsize=\"1,1\" coordorigin=\"0,0\" style=\"width:1;height:1;position:absolute"];
var _11c=CGRectApplyAffineTransform(_115,ctm);
vml.push(";padding:0 ",ROUND((_11c.origin.x+_11c.size.width)),"px ",ROUND((_11c.origin.y+_11c.size.height)),"px 0;filter:progid:DXImageTransform.Microsoft.Matrix(","M11='",ctm.a,"',M12='",ctm.c,"',M21='",ctm.b,"',M22='",ctm.d,"',","Dx='",ROUND(_119.x),"', Dy='",ROUND(_119.y),"', sizingmethod='clip');");
vml.push("\"><cg_vml_:image src=\"",_116._image.src,"\" style=\"width:",(_115.size.width),"px;height:",(_115.size.height),"px;\"/></g_vml_:group>");
_117=vml.join("");
}
if(_114.buffer!=nil){
_114.buffer+=_117;
}else{
_114.DOMElement.insertAdjacentHTML("BeforeEnd",_117);
}
};
CGContextDrawPath=function(_11d,_11e){
if(!_11d||CGPathIsEmpty(_11d.path)){
return;
}
var _11f=_11d.path.elements,i=0,_121=_11d.path.count,_122=_11d.gState,fill=(_11e==kCGPathFill||_11e==kCGPathFillStroke)?1:0,_124=(_11e==kCGPathStroke||_11e==kCGPathFillStroke)?1:0,_125=_122.alpha,vml=["<cg_vml_:shape"," fillcolor=\"",_122.fillStyle,"\" filled=\"",_109[fill],"\" style=\"position:absolute;width:",W,";height:",H,";\" coordorigin=\"0 0\" coordsize=\"",Z*W," ",Z*H,"\" stroked=\"",_109[_124],"\" strokeweight=\"",_122.lineWidth,"\" strokecolor=\"",_122.strokeStyle,"\" path=\""];
for(;i<_121;++i){
var _127=_11f[i],type=_127.type;
switch(type){
case kCGPathElementMoveToPoint:
case kCGPathElementAddLineToPoint:
vml.push(_10c[type],(ROUND(Z*(_127.x)-Z_2)),",",(ROUND(Z*(_127.y)-Z_2)));
break;
case kCGPathElementAddQuadCurveToPoint:
vml.push(_10c[type],(ROUND(Z*(_127.cpx)-Z_2)),",",(ROUND(Z*(_127.cpy)-Z_2)),",",(ROUND(Z*(_127.x)-Z_2)),",",(ROUND(Z*(_127.y)-Z_2)));
break;
case kCGPathElementAddCurveToPoint:
vml.push(_10c[type],(ROUND(Z*(_127.cp1x)-Z_2)),",",(ROUND(Z*(_127.cp1y)-Z_2)),",",(ROUND(Z*(_127.cp2x)-Z_2)),",",(ROUND(Z*(_127.cp2y)-Z_2)),",",(ROUND(Z*(_127.x)-Z_2)),",",(ROUND(Z*(_127.y)-Z_2)));
break;
case kCGPathElementCloseSubpath:
vml.push(_10c[type]);
break;
case kCGPathElementAddArc:
var x=_127.x,y=_127.y,_12b=_127.radius,_12c=_127.clockwise?1:0,_12d=_127.endAngle,_12e=_127.startAngle,_12f={x:x+_12b*COS(_12e),y:y+_12b*SIN(_12e)};
if(_12e==_12d&&!_12c){
vml.push(_10c[kCGPathElementMoveToPoint],(ROUND(Z*(_12f.x)-Z_2)),",",(ROUND(Z*(_12f.y)-Z_2)));
continue;
}
var end={x:x+_12b*COS(_12d),y:y+_12b*SIN(_12d)};
if(_12c&&_12e!=_12d&&(_12f.x==end.x&&_12f.y==end.y)){
if(_12f.x>=x){
if(_12f.y<y){
_12f.x+=0.125;
}else{
_12f.y+=0.125;
}
}else{
if(end.y<=y){
end.x+=0.125;
}else{
end.y+=0.125;
}
}
}
vml.push(_10c[type][_12c],(ROUND(Z*(x-_12b)-Z_2)),",",(ROUND(Z*(y-_12b)-Z_2))," ",(ROUND(Z*(x+_12b)-Z_2)),",",(ROUND(Z*(y+_12b)-Z_2))," ",(ROUND(Z*(_12f.x)-Z_2)),",",(ROUND(Z*(_12f.y)-Z_2))," ",(ROUND(Z*(end.x)-Z_2)),",",(ROUND(Z*(end.y)-Z_2)));
break;
case kCGPathElementAddArcTo:
break;
}
}
vml.push("\">");
if(_122.gradient){
vml.push(_122.gradient);
}else{
if(fill){
vml.push("<cg_vml_:fill color=\"",_122.fillStyle,"\" opacity=\"",_125,"\" />");
}
}
if(_124){
vml.push("<cg_vml_:stroke opacity=\"",_125,"\" joinstyle=\"",_10b[_122.lineJoin],"\" miterlimit=\"",_122.miterLimit,"\" endcap=\"",_10a[_122.lineCap],"\" weight=\"",_122.lineWidth,"","px\" color=\"",_122.strokeStyle,"\" />");
}
var _131=_122.shadowColor;
if(_131){
var _132=_122.shadowOffset;
vml.push("<cg_vml_:shadow on=\"t\" offset=\"",_132.width,"pt ",_132.height,"pt\" opacity=\"",objj_msgSend(_131,"alphaComponent"),"\" color=black />");
}
vml.push("</cg_vml_:shape>");
_11d.path=NULL;
if(_11d.buffer!=nil){
_11d.buffer+=vml.join("");
}else{
_11d.DOMElement.insertAdjacentHTML("BeforeEnd",vml.join(""));
}
};
to_string=function(_133){
return "rgb("+ROUND(_133.components[0]*255)+", "+ROUND(_133.components[1]*255)+", "+ROUND(255*_133.components[2])+")";
};
CGContextDrawLinearGradient=function(_134,_135,_136,_137,_138){
if(!_134||!_135){
return;
}
var vml=nil;
if(_135.vml_gradient){
var _13a=objj_msgSend(objj_msgSend(_135.vml_gradient,"stops"),"sortedArrayUsingSelector:",sel_getUid("comparePosition:")),_13b=objj_msgSend(_13a,"count");
vml=["<cg_vml_:fill type=\"gradient\" method=\"linear sigma\" "];
vml.push("angle=\""+(objj_msgSend(_135.vml_gradient,"angle")+90)+"\" ");
vml.push("colors=\"");
for(var i=0;i<_13b;i++){
vml.push((objj_msgSend(_13a[i],"position")*100).toFixed(0)+"% ");
vml.push(objj_msgSend(objj_msgSend(objj_msgSend(_13a[i],"color"),"colorForSlideBase:",nil),"cssString"));
if(i<_13b-1){
vml.push(",");
}
}
vml.push("\" />");
}else{
var _13d=_135.colors,_13b=_13d.length;
vml=["<cg_vml_:fill type=\"gradient\" "];
vml.push("colors=\"");
for(var i=0;i<_13b;i++){
vml.push((_135.locations[i]*100).toFixed(0)+"% "+to_string(_13d[i])+(i<_13b-1?",":""));
}
vml.push("\" />");
}
_134.gState.gradient=vml.join("");
console.log(vml.join(""));
};
}
}
