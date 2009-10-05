I;21;Foundation/CPObject.ji;9;CGColor.ji;17;CPCompatibility.ji;9;CPImage.jc;14542;
var _1=0,_2=1,_3=2,_4=3;
var _5=0,_6=1,_7=2;
var _8,_9,_a,_b,_c,_d,_e,_f,_10,_11,_12,_13,_14,_15,_16,_17;
var _18=objj_allocateClassPair(CPObject,"CPColor"),_19=_18.isa;
class_addIvars(_18,[new objj_ivar("_components"),new objj_ivar("_patternImage"),new objj_ivar("_cssString")]);
objj_registerClassPair(_18);
objj_addClassForBundle(_18,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_18,[new objj_method(sel_getUid("_initWithCSSString:"),function(_1a,_1b,_1c){
with(_1a){
if(_1c.indexOf("rgb")==CPNotFound){
return nil;
}
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPObject")},"init");
var _1d=_1c.indexOf("(");
var _1e=_1c.substring(_1d+1).split(",");
_components=[parseInt(_1e[0],10)/255,parseInt(_1e[1],10)/255,parseInt(_1e[2],10)/255,_1e[3]?parseInt(_1e[3],10)/255:1];
_cssString=_1c;
return _1a;
}
}),new objj_method(sel_getUid("_initWithRGBA:"),function(_1f,_20,_21){
with(_1f){
_1f=objj_msgSendSuper({receiver:_1f,super_class:objj_getClass("CPObject")},"init");
if(_1f){
_components=_21;
if(!CPFeatureIsCompatible(CPCSSRGBAFeature)&&_components[3]!=1&&window.Base64&&window.CRC32){
var _22=[137,80,78,71,13,10,26,10,0,0,0,13,73,72,68,82,0,0,0,1,0,0,0,1,8,3,0,0,0,40,203,52,187,0,0,3,0,80,76,84,69,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23,137,153,85,0,0,0,1,116,82,78,83,0,64,230,216,102,0,0,0,16,73,68,65,84,120,218,98,96,0,0,0,0,255,255,3,0,0,2,0,1,36,127,36,241,0,0,0,0,73,69,78,68,174,66,96,130,255];
var _23=41;
var _24=42;
var _25=43;
var _26=821;
var _27=809;
var _28=822;
var _29=37;
var _2a=817;
_22[_23]=Math.round(_components[0]*255);
_22[_24]=Math.round(_components[1]*255);
_22[_25]=Math.round(_components[2]*255);
_22[_26]=Math.round(_components[3]*255);
var _2b=integerToBytes(CRC32.getCRC(_22,_29,4+768),4);
var _2c=integerToBytes(CRC32.getCRC(_22,_2a,4+1),4);
for(var i=0;i<4;i++){
_22[_27+i]=_2b[i];
_22[_28+i]=_2c[i];
}
var _2e=Base64.encode(_22);
_cssString="url(\"data:image/png;base64,"+_2e+"\")";
}else{
var _2f=CPFeatureIsCompatible(CPCSSRGBAFeature)&&_components[3]!=1;
_cssString=(_2f?"rgba(":"rgb(")+parseInt(_components[0]*255)+", "+parseInt(_components[1]*255)+", "+parseInt(_components[2]*255)+(_2f?(", "+_components[3]):"")+")";
}
}
return _1f;
}
}),new objj_method(sel_getUid("_initWithPatternImage:"),function(_30,_31,_32){
with(_30){
_30=objj_msgSendSuper({receiver:_30,super_class:objj_getClass("CPObject")},"init");
if(_30){
_patternImage=_32;
_cssString="url(\""+objj_msgSend(_patternImage,"filename")+"\")";
}
return _30;
}
}),new objj_method(sel_getUid("patternImage"),function(_33,_34){
with(_33){
return _patternImage;
}
}),new objj_method(sel_getUid("alphaComponent"),function(_35,_36){
with(_35){
return _components[3];
}
}),new objj_method(sel_getUid("blueComponent"),function(_37,_38){
with(_37){
return _components[2];
}
}),new objj_method(sel_getUid("greenComponent"),function(_39,_3a){
with(_39){
return _components[1];
}
}),new objj_method(sel_getUid("redComponent"),function(_3b,_3c){
with(_3b){
return _components[0];
}
}),new objj_method(sel_getUid("components"),function(_3d,_3e){
with(_3d){
return _components;
}
}),new objj_method(sel_getUid("colorWithAlphaComponent:"),function(_3f,_40,_41){
with(_3f){
var _42=_components.slice();
_42[_42.length-1]=_41;
return objj_msgSend(objj_msgSend(objj_msgSend(_3f,"class"),"alloc"),"_initWithRGBA:",_42);
}
}),new objj_method(sel_getUid("hsbComponents"),function(_43,_44){
with(_43){
var red=ROUND(_components[_1]*255),_46=ROUND(_components[_2]*255),_47=ROUND(_components[_3]*255);
var max=MAX(red,_46,_47),min=MIN(red,_46,_47),_4a=max-min;
var _4b=max/255,_4c=(max!=0)?_4a/max:0;
var hue;
if(_4c==0){
hue=0;
}else{
var rr=(max-red)/_4a;
var gr=(max-_46)/_4a;
var br=(max-_47)/_4a;
if(red==max){
hue=br-gr;
}else{
if(_46==max){
hue=2+rr-br;
}else{
hue=4+gr-rr;
}
}
hue/=6;
if(hue<0){
hue++;
}
}
return [ROUND(hue*360),ROUND(_4c*100),ROUND(_4b*100)];
}
}),new objj_method(sel_getUid("cssString"),function(_51,_52){
with(_51){
return _cssString;
}
}),new objj_method(sel_getUid("hexString"),function(_53,_54){
with(_53){
return rgbToHex(objj_msgSend(_53,"redComponent"),objj_msgSend(_53,"greenComponent"),objj_msgSend(_53,"blueComponent"));
}
}),new objj_method(sel_getUid("isEqual:"),function(_55,_56,_57){
with(_55){
if(!_57){
return NO;
}
if(_57===_55){
return YES;
}
return objj_msgSend(_57,"isKindOfClass:",CPColor)&&objj_msgSend(_57,"cssString")===objj_msgSend(_55,"cssString");
}
}),new objj_method(sel_getUid("description"),function(_58,_59){
with(_58){
return objj_msgSendSuper({receiver:_58,super_class:objj_getClass("CPObject")},"description")+" "+objj_msgSend(_58,"cssString");
}
})]);
class_addMethods(_19,[new objj_method(sel_getUid("colorWithRed:green:blue:alpha:"),function(_5a,_5b,red,_5d,_5e,_5f){
with(_5a){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[red,_5d,_5e,_5f]);
}
}),new objj_method(sel_getUid("colorWithCalibratedRed:green:blue:alpha:"),function(_60,_61,red,_63,_64,_65){
with(_60){
return objj_msgSend(_60,"colorWithRed:green:blue:alpha:",red,_63,_64,_65);
}
}),new objj_method(sel_getUid("colorWithWhite:alpha:"),function(_66,_67,_68,_69){
with(_66){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[_68,_68,_68,_69]);
}
}),new objj_method(sel_getUid("colorWithCalibratedWhite:alpha:"),function(_6a,_6b,_6c,_6d){
with(_6a){
return objj_msgSend(_6a,"colorWithWhite:alpha:",_6c,_6d);
}
}),new objj_method(sel_getUid("colorWithHue:saturation:brightness:"),function(_6e,_6f,hue,_71,_72){
with(_6e){
return objj_msgSend(_6e,"colorWithHue:saturation:brightness:alpha:",hue,_71,_72,1);
}
}),new objj_method(sel_getUid("colorWithHue:saturation:brightness:alpha:"),function(_73,_74,hue,_76,_77,_78){
with(_73){
if(_76===0){
return objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",_77/100,_78);
}
var f=hue%60,p=(_77*(100-_76))/10000,q=(_77*(6000-_76*f))/600000,t=(_77*(6000-_76*(60-f)))/600000,b=_77/100;
switch(FLOOR(hue/60)){
case 0:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,t,p,_78);
case 1:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",q,b,p,_78);
case 2:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,b,t,_78);
case 3:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,q,b,_78);
case 4:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",t,p,b,_78);
case 5:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,p,q,_78);
}
}
}),new objj_method(sel_getUid("colorWithHexString:"),function(_7e,_7f,hex){
with(_7e){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",hexToRGB(hex));
}
}),new objj_method(sel_getUid("blackColor"),function(_81,_82){
with(_81){
if(!_8){
_8=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1]);
}
return _8;
}
}),new objj_method(sel_getUid("blueColor"),function(_83,_84){
with(_83){
if(!_b){
_b=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,1,1]);
}
return _b;
}
}),new objj_method(sel_getUid("darkGrayColor"),function(_85,_86){
with(_85){
if(!_f){
_f=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1/3,1);
}
return _f;
}
}),new objj_method(sel_getUid("grayColor"),function(_87,_88){
with(_87){
if(!_d){
_d=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0.5,1);
}
return _d;
}
}),new objj_method(sel_getUid("greenColor"),function(_89,_8a){
with(_89){
if(!_a){
_a=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,1,0,1]);
}
return _a;
}
}),new objj_method(sel_getUid("lightGrayColor"),function(_8b,_8c){
with(_8b){
if(!_e){
_e=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",2/3,1);
}
return _e;
}
}),new objj_method(sel_getUid("redColor"),function(_8d,_8e){
with(_8d){
if(!_9){
_9=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0,0,1]);
}
return _9;
}
}),new objj_method(sel_getUid("whiteColor"),function(_8f,_90){
with(_8f){
if(!_10){
_10=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,1,1]);
}
return _10;
}
}),new objj_method(sel_getUid("yellowColor"),function(_91,_92){
with(_91){
if(!_c){
_c=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,0,1]);
}
return _c;
}
}),new objj_method(sel_getUid("brownColor"),function(_93,_94){
with(_93){
if(!_11){
_11=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.6,0.4,0.2,1]);
}
return _11;
}
}),new objj_method(sel_getUid("cyanColor"),function(_95,_96){
with(_95){
if(!_12){
_12=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,1,1,1]);
}
return _12;
}
}),new objj_method(sel_getUid("magentaColor"),function(_97,_98){
with(_97){
if(!_13){
_13=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0,1,1]);
}
return _13;
}
}),new objj_method(sel_getUid("orangeColor"),function(_99,_9a){
with(_99){
if(!_14){
_14=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0.5,0,1]);
}
return _14;
}
}),new objj_method(sel_getUid("purpleColor"),function(_9b,_9c){
with(_9b){
if(!_15){
_15=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.5,0,0.5,1]);
}
return _15;
}
}),new objj_method(sel_getUid("shadowColor"),function(_9d,_9e){
with(_9d){
if(!_16){
_16=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1/3]);
}
return _16;
}
}),new objj_method(sel_getUid("clearColor"),function(_9f,_a0){
with(_9f){
if(!_17){
_17=objj_msgSend(_9f,"colorWithCalibratedWhite:alpha:",0,0);
}
return _17;
}
}),new objj_method(sel_getUid("alternateSelectedControlColor"),function(_a1,_a2){
with(_a1){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.22,0.46,0.84,1]);
}
}),new objj_method(sel_getUid("secondarySelectedControlColor"),function(_a3,_a4){
with(_a3){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.83,0.83,0.83,1]);
}
}),new objj_method(sel_getUid("colorWithPatternImage:"),function(_a5,_a6,_a7){
with(_a5){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithPatternImage:",_a7);
}
}),new objj_method(sel_getUid("colorWithCSSString:"),function(_a8,_a9,_aa){
with(_a8){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithCSSString:",_aa);
}
})]);
var _18=objj_getClass("CPColor");
if(!_18){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _19=_18.isa;
class_addMethods(_18,[new objj_method(sel_getUid("set"),function(_ab,_ac){
with(_ab){
objj_msgSend(_ab,"setFill");
objj_msgSend(_ab,"setStroke");
}
}),new objj_method(sel_getUid("setFill"),function(_ad,_ae){
with(_ad){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetFillColor(ctx,_ad);
}
}),new objj_method(sel_getUid("setStroke"),function(_b0,_b1){
with(_b0){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(ctx,_b0);
}
})]);
var _18=objj_getClass("CPColor");
if(!_18){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _19=_18.isa;
class_addMethods(_19,[new objj_method(sel_getUid("randomColor"),function(_b3,_b4){
with(_b3){
return objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",RAND(),RAND(),RAND(),1);
}
})]);
var _b5="CPColorComponentsKey",_b6="CPColorPatternImageKey";
var _18=objj_getClass("CPColor");
if(!_18){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _19=_18.isa;
class_addMethods(_18,[new objj_method(sel_getUid("initWithCoder:"),function(_b7,_b8,_b9){
with(_b7){
if(objj_msgSend(_b9,"containsValueForKey:",_b6)){
return objj_msgSend(_b7,"_initWithPatternImage:",objj_msgSend(_b9,"decodeObjectForKey:",_b6));
}
return objj_msgSend(_b7,"_initWithRGBA:",objj_msgSend(_b9,"decodeObjectForKey:",_b5));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_ba,_bb,_bc){
with(_ba){
if(_patternImage){
objj_msgSend(_bc,"encodeObject:forKey:",_patternImage,_b6);
}else{
objj_msgSend(_bc,"encodeObject:forKey:",_components,_b5);
}
}
})]);
var _bd="0123456789ABCDEF";
hexToRGB=function(hex){
if(hex.length==3){
hex=hex.charAt(0)+hex.charAt(0)+hex.charAt(1)+hex.charAt(1)+hex.charAt(2)+hex.charAt(2);
}
if(hex.length!=6){
return null;
}
hex=hex.toUpperCase();
for(var i=0;i<hex.length;i++){
if(_bd.indexOf(hex.charAt(i))==-1){
return null;
}
}
var red=(_bd.indexOf(hex.charAt(0))*16+_bd.indexOf(hex.charAt(1)))/255;
var _c1=(_bd.indexOf(hex.charAt(2))*16+_bd.indexOf(hex.charAt(3)))/255;
var _c2=(_bd.indexOf(hex.charAt(4))*16+_bd.indexOf(hex.charAt(5)))/255;
return [red,_c1,_c2,1];
};
integerToBytes=function(_c3,_c4){
if(!_c4){
_c4=(_c3==0)?1:Math.round((Math.log(_c3)/Math.log(2))/8+0.5);
}
var _c5=new Array(_c4);
for(var i=_c4-1;i>=0;i--){
_c5[i]=_c3&255;
_c3=_c3>>8;
}
return _c5;
};
rgbToHex=function(r,g,b){
return byteToHex(r)+byteToHex(g)+byteToHex(b);
};
byteToHex=function(n){
if(!n||isNaN(n)){
return "00";
}
n=ROUND(MIN(255,MAX(0,256*n)));
return _bd.charAt((n-n%16)/16)+_bd.charAt(n%16);
};
