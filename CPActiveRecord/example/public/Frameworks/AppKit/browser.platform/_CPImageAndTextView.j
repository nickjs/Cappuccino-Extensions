I;21;Foundation/CPString.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;13;CPTextField.ji;8;CPView.jc;12311;
CPTopVerticalTextAlignment=1,CPCenterVerticalTextAlignment=2,CPBottomVerticalTextAlignment=3;
var _1=1<<0,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4,_6=1<<5,_7=1<<6,_8=1<<7,_9=1<<8,_a=1<<9,_b=1<<10;
var _c=3,_d=5;
var _e=objj_allocateClassPair(CPView,"_CPImageAndTextView"),_f=_e.isa;
class_addIvars(_e,[new objj_ivar("_alignment"),new objj_ivar("_verticalAlignment"),new objj_ivar("_lineBreakMode"),new objj_ivar("_textColor"),new objj_ivar("_font"),new objj_ivar("_textShadowColor"),new objj_ivar("_textShadowOffset"),new objj_ivar("_imagePosition"),new objj_ivar("_imageScaling"),new objj_ivar("_image"),new objj_ivar("_text"),new objj_ivar("_textSize"),new objj_ivar("_flags"),new objj_ivar("_DOMImageElement"),new objj_ivar("_DOMTextElement"),new objj_ivar("_DOMTextShadowElement")]);
objj_registerClassPair(_e);
objj_addClassForBundle(_e,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_e,[new objj_method(sel_getUid("initWithFrame:control:"),function(_10,_11,_12,_13){
with(_10){
_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPView")},"initWithFrame:",_12);
if(_10){
_textShadowOffset={width:0,height:0};
objj_msgSend(_10,"setVerticalAlignment:",CPTopVerticalTextAlignment);
if(_13){
objj_msgSend(_10,"setLineBreakMode:",objj_msgSend(_13,"lineBreakMode"));
objj_msgSend(_10,"setTextColor:",objj_msgSend(_13,"textColor"));
objj_msgSend(_10,"setAlignment:",objj_msgSend(_13,"alignment"));
objj_msgSend(_10,"setVerticalAlignment:",objj_msgSend(_13,"verticalAlignment"));
objj_msgSend(_10,"setFont:",objj_msgSend(_13,"font"));
objj_msgSend(_10,"setImagePosition:",objj_msgSend(_13,"imagePosition"));
objj_msgSend(_10,"setImageScaling:",objj_msgSend(_13,"imageScaling"));
}else{
objj_msgSend(_10,"setLineBreakMode:",CPLineBreakByClipping);
objj_msgSend(_10,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_10,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_10,"setImagePosition:",CPNoImage);
objj_msgSend(_10,"setImageScaling:",CPScaleNone);
}
_textSize=NULL;
}
return _10;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_14,_15,_16){
with(_14){
return objj_msgSend(_14,"initWithFrame:control:",_16,nil);
}
}),new objj_method(sel_getUid("setAlignment:"),function(_17,_18,_19){
with(_17){
if(_alignment===_19){
return;
}
_alignment=_19;
switch(_alignment){
case CPLeftTextAlignment:
_DOMElement.style.textAlign="left";
break;
case CPRightTextAlignment:
_DOMElement.style.textAlign="right";
break;
case CPCenterTextAlignment:
_DOMElement.style.textAlign="center";
break;
case CPJustifiedTextAlignment:
_DOMElement.style.textAlign="justify";
break;
case CPNaturalTextAlignment:
_DOMElement.style.textAlign="";
break;
}
}
}),new objj_method(sel_getUid("alignment"),function(_1a,_1b){
with(_1a){
return _alignment;
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_1c,_1d,_1e){
with(_1c){
if(_verticalAlignment===_1e){
return;
}
_verticalAlignment=_1e;
_flags|=_5;
objj_msgSend(_1c,"setNeedsLayout");
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_1f,_20){
with(_1f){
return _verticalAlignment;
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_21,_22,_23){
with(_21){
if(_lineBreakMode===_23){
return;
}
_lineBreakMode=_23;
_flags|=_6;
objj_msgSend(_21,"setNeedsLayout");
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_24,_25){
with(_24){
return _lineBreakMode;
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_26,_27,_28){
with(_26){
if(_imagePosition==_28){
return;
}
_imagePosition=_28;
_flags|=_a;
objj_msgSend(_26,"setNeedsLayout");
}
}),new objj_method(sel_getUid("imagePosition"),function(_29,_2a){
with(_29){
return _imagePosition;
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_2b,_2c,_2d){
with(_2b){
if(_imageScaling==_2d){
return;
}
_imageScaling=_2d;
_flags|=_b;
objj_msgSend(_2b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("imageScaling"),function(_2e,_2f){
with(_2e){
return _imageScaling;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_30,_31,_32){
with(_30){
if(_textColor===_32){
return;
}
_textColor=_32;
_DOMElement.style.color=objj_msgSend(_textColor,"cssString");
}
}),new objj_method(sel_getUid("textColor"),function(_33,_34){
with(_33){
return _textColor;
}
}),new objj_method(sel_getUid("setFont:"),function(_35,_36,_37){
with(_35){
if(_font===_37){
return;
}
_font=_37;
_flags|=_8;
_textSize=NULL;
objj_msgSend(_35,"setNeedsLayout");
}
}),new objj_method(sel_getUid("font"),function(_38,_39){
with(_38){
return _font;
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_3a,_3b,_3c){
with(_3a){
if(_textShadowColor===_3c){
return;
}
_textShadowColor=_3c;
_flags|=_9;
objj_msgSend(_3a,"setNeedsLayout");
}
}),new objj_method(sel_getUid("textShadowColor"),function(_3d,_3e){
with(_3d){
return _textShadowColor;
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_3f,_40,_41){
with(_3f){
if((_textShadowOffset.width==_41.width&&_textShadowOffset.height==_41.height)){
return;
}
_textShadowOffset={width:_41.width,height:_41.height};
objj_msgSend(_3f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_42,_43){
with(_42){
return _textShadowOffset;
}
}),new objj_method(sel_getUid("setImage:"),function(_44,_45,_46){
with(_44){
if(_image==_46){
return;
}
_image=_46;
_flags|=_2;
objj_msgSend(_44,"setNeedsLayout");
}
}),new objj_method(sel_getUid("image"),function(_47,_48){
with(_47){
return _image;
}
}),new objj_method(sel_getUid("setText:"),function(_49,_4a,_4b){
with(_49){
if(_text===_4b){
return;
}
_text=_4b;
_flags|=_3;
_textSize=NULL;
objj_msgSend(_49,"setNeedsLayout");
}
}),new objj_method(sel_getUid("text"),function(_4c,_4d){
with(_4c){
return _text;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_4e,_4f){
with(_4e){
var _50=_imagePosition!==CPImageOnly&&(objj_msgSend(_text,"length")>0),_51=!!_DOMTextElement;
if(_50!==_51){
if(_51){
_DOMElement.removeChild(_DOMTextElement);
_DOMTextElement=NULL;
_51=NO;
}else{
_DOMTextElement=document.createElement("div");
var _52=_DOMTextElement.style;
_52.position="absolute";
_52.whiteSpace="pre";
_52.cursor="default";
_52.zIndex=200;
_52.overflow="hidden";
_DOMElement.appendChild(_DOMTextElement);
_51=YES;
_flags|=_3|_8|_6;
}
}
var _52=_51?_DOMTextElement.style:nil;
var _53=_51&&!!_textShadowColor,_54=!!_DOMTextShadowElement;
if(_53!==_54){
if(_54){
_DOMElement.removeChild(_DOMTextShadowElement);
_DOMTextShadowElement=NULL;
_54=NO;
}else{
_DOMTextShadowElement=document.createElement("div");
var _55=_DOMTextShadowElement.style;
_55.font=objj_msgSend(_font?_font:objj_msgSend(CPFont,"systemFontOfSize:",12),"cssString");
_55.position="absolute";
_55.whiteSpace=_52.whiteSpace;
_55.cursor="default";
_55.zIndex=150;
_55.textOverflow=_52.textOverflow;
if(document.attachEvent){
_55.overflow=_52.overflow;
_55.wordWrap=_52.wordWrap;
}else{
_55.overflowX=_52.overflowX;
_55.overflowY=_52.overflowY;
}
_DOMElement.appendChild(_DOMTextShadowElement);
_54=YES;
_flags|=_3;
}
}
var _55=_54?_DOMTextShadowElement.style:nil;
if(_51){
if(_flags&_3){
if(CPFeatureIsCompatible(CPJavascriptInnerTextFeature)){
_DOMTextElement.innerText=_text;
if(_DOMTextShadowElement){
_DOMTextShadowElement.innerText=_text;
}
}else{
if(CPFeatureIsCompatible(CPJavascriptTextContentFeature)){
_DOMTextElement.textContent=_text;
if(_DOMTextShadowElement){
_DOMTextShadowElement.textContent=_text;
}
}
}
}
if(_flags&_8){
var _56=objj_msgSend(_font?_font:objj_msgSend(CPFont,"systemFontOfSize:",12),"cssString");
_52.font=_56;
if(_55){
_55.font=_56;
}
}
if(_flags&_6){
switch(_lineBreakMode){
case CPLineBreakByClipping:
_52.overflow="hidden";
_52.textOverflow="clip";
_52.whiteSpace="pre";
if(document.attachEvent){
_52.wordWrap="normal";
}
break;
case CPLineBreakByTruncatingHead:
case CPLineBreakByTruncatingMiddle:
case CPLineBreakByTruncatingTail:
_52.textOverflow="ellipsis";
_52.whiteSpace="nowrap";
_52.overflow="hidden";
if(document.attachEvent){
_52.wordWrap="normal";
}
break;
case CPLineBreakByCharWrapping:
case CPLineBreakByWordWrapping:
if(document.attachEvent){
_52.whiteSpace="pre";
_52.wordWrap="break-word";
}else{
_52.whiteSpace="-o-pre-wrap";
_52.whiteSpace="-pre-wrap";
_52.whiteSpace="-moz-pre-wrap";
_52.whiteSpace="pre-wrap";
}
_52.overflow="hidden";
_52.textOverflow="clip";
break;
}
if(_55){
if(document.attachEvent){
_55.wordWrap=_52.wordWrap;
_55.overflow=_52.overflow;
}else{
_55.overflowX=_52.overflowX;
_55.overflowY=_52.overflowY;
}
_55.whiteSpace=_52.whiteSpace;
_55.textOverflow=_52.textOverflow;
}
}
}
var _57=_image!==nil&&_imagePosition!==CPNoImage,_58=!!_DOMImageElement;
if(_57!==_58){
if(_58){
_DOMElement.removeChild(_DOMImageElement);
_DOMImageElement=NULL;
_58=NO;
}else{
_DOMImageElement=document.createElement("img");
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMImageElement.setAttribute("draggable","true");
_DOMImageElement.style["-khtml-user-drag"]="element";
}
var _59=_DOMImageElement.style;
_59.top="0px";
_59.left="0px";
_59.position="absolute";
_59.zIndex=100;
_DOMElement.appendChild(_DOMImageElement);
_58=YES;
}
}
var _5a=objj_msgSend(_4e,"bounds").size,_5b={origin:{x:0,y:0},size:{width:_5a.width,height:_5a.height}};
if(_58){
if(!_59){
var _59=_DOMImageElement.style;
}
if(_flags&_2){
_DOMImageElement.src=objj_msgSend(_image,"filename");
}
var _5c=_5a.width/2,_5d=_5a.height/2,_5e=objj_msgSend(_image,"size"),_5f=_5e.width,_60=_5e.height;
if(_imageScaling===CPScaleToFit){
_5f=_5a.width;
_60=_5a.height;
}else{
if(_imageScaling===CPScaleProportionally){
var _61=MIN(MIN(_5a.width,_5f)/_5f,MIN(_5a.height,_60)/_60);
_5f*=_61;
_60*=_61;
}
}
_DOMImageElement.width=_5f;
_DOMImageElement.height=_60;
_59.width=_5f+"px";
_59.height=_60+"px";
if(_imagePosition===CPImageBelow){
_59.left=FLOOR(_5c-_5f/2)+"px";
_59.top=FLOOR(_5a.height-_60)+"px";
_5b.size.height=_5a.height-_60-_d;
}else{
if(_imagePosition===CPImageAbove){
if(NULL){
var _62=_CGPointApplyAffineTransform(CGPointMake(FLOOR(_5c-_5f/2),0),NULL);
}else{
var _62={x:FLOOR(_5c-_5f/2),y:0};
}
_DOMImageElement.style.left=ROUND(_62.x)+"px";
_DOMImageElement.style.top=ROUND(_62.y)+"px";
_5b.origin.y+=_60+_d;
_5b.size.height=_5a.height-_60-_d;
}else{
if(_imagePosition===CPImageLeft){
_59.top=FLOOR(_5d-_60/2)+"px";
_59.left="0px";
_5b.origin.x=_5f+_c;
_5b.size.width-=_5f+_c;
}else{
if(_imagePosition===CPImageRight){
_59.top=FLOOR(_5d-_60/2)+"px";
_59.left=FLOOR(_5a.width-_5f)+"px";
_5b.size.width-=_5f+_c;
}else{
if(_imagePosition===CPImageOnly){
_59.top=FLOOR(_5d-_60/2)+"px";
_59.left=FLOOR(_5c-_5f/2)+"px";
}
}
}
}
}
}
if(_51){
var _63=(_5b.origin.x),_64=(_5b.origin.y),_65=(_5b.size.width),_66=(_5b.size.height);
if(_verticalAlignment!==CPTopVerticalTextAlignment){
if(!_textSize){
if(_lineBreakMode===CPLineBreakByCharWrapping||_lineBreakMode===CPLineBreakByWordWrapping){
_textSize=objj_msgSend(_text,"sizeWithFont:inWidth:",_font,_65);
}else{
_textSize=objj_msgSend(_text,"sizeWithFont:",_font);
}
}
if(_verticalAlignment===CPCenterVerticalTextAlignment){
_64=_64+(_66-_textSize.height)/2;
_66=_textSize.height;
}else{
_64=_64+_66-_textSize.height;
_66=_textSize.height;
}
}
_52.top=ROUND(_64)+"px";
_52.left=ROUND(_63)+"px";
_52.width=ROUND(_65)+"px";
_52.height=ROUND(_66)+"px";
if(_55){
if(_flags&_9){
_55.color=objj_msgSend(_textShadowColor,"cssString");
}
_55.top=ROUND(_64+_textShadowOffset.height)+"px";
_55.left=ROUND(_63+_textShadowOffset.width)+"px";
_55.width=ROUND(_65)+"px";
_55.height=ROUND(_66)+"px";
}
}
_flags=0;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_67,_68){
with(_67){
var _69=CGSizeMakeZero();
if((_imagePosition!==CPNoImage)&&_image){
var _6a=objj_msgSend(_image,"size");
_69.width+=_6a.width;
_69.height+=_6a.height;
}
if((_imagePosition!==CPImageOnly)&&objj_msgSend(_text,"length")>0){
if(!_textSize){
_textSize=objj_msgSend(_text,"sizeWithFont:",_font?_font:objj_msgSend(CPFont,"systemFontOfSize:",12));
}
if(_imagePosition===CPImageLeft||_imagePosition===CPImageRight){
_69.width+=_textSize.width+_c;
_69.height=MAX(_69.height,_textSize.height);
}else{
if(_imagePosition===CPImageAbove||_imagePosition===CPImageBelow){
_69.width=MAX(_69.width,_textSize.width);
_69.height+=_textSize.height+_d;
}else{
_69.width=MAX(_69.width,_textSize.width);
_69.height=MAX(_69.height,_textSize.height);
}
}
}
objj_msgSend(_67,"setFrameSize:",_69);
}
})]);
