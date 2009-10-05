c;5677;
CGPointMake=function(x,y){
return {x:x,y:y};
};
CGPointMakeZero=function(){
return {x:0,y:0};
};
CGPointMakeCopy=function(_3){
return {x:_3.x,y:_3.y};
};
CGPointCreateCopy=function(_4){
return {x:_4.x,y:_4.y};
};
CGPointEqualToPoint=function(_5,_6){
return (_5.x==_6.x&&_5.y==_6.y);
};
CGStringFromPoint=function(_7){
return ("{"+_7.x+", "+_7.y+"}");
};
CGSizeMake=function(_8,_9){
return {width:_8,height:_9};
};
CGSizeMakeZero=function(){
return {width:0,height:0};
};
CGSizeMakeCopy=function(_a){
return {width:_a.width,height:_a.height};
};
CGSizeCreateCopy=function(_b){
return {width:_b.width,height:_b.height};
};
CGSizeEqualToSize=function(_c,_d){
return (_c.width==_d.width&&_c.height==_d.height);
};
CGStringFromSize=function(_e){
return ("{"+_e.width+", "+_e.height+"}");
};
CGRectMake=function(x,y,_11,_12){
return {origin:{x:x,y:y},size:{width:_11,height:_12}};
};
CGRectMakeZero=function(){
return {origin:{x:0,y:0},size:{width:0,height:0}};
};
CGRectMakeCopy=function(_13){
return {origin:{x:_13.origin.x,y:_13.origin.y},size:{width:_13.size.width,height:_13.size.height}};
};
CGRectCreateCopy=function(_14){
return {origin:{x:_14.origin.x,y:_14.origin.y},size:{width:_14.size.width,height:_14.size.height}};
};
CGRectEqualToRect=function(_15,_16){
return ((_15.origin.x==_16.origin.x&&_15.origin.y==_16.origin.y)&&(_15.size.width==_16.size.width&&_15.size.height==_16.size.height));
};
CGStringFromRect=function(_17){
return ("{"+("{"+_17.origin.x+", "+_17.origin.y+"}")+", "+("{"+_17.size.width+", "+_17.size.height+"}")+"}");
};
CGRectOffset=function(_18,dX,dY){
return {origin:{x:_18.origin.x+dX,y:_18.origin.y+dY},size:{width:_18.size.width,height:_18.size.height}};
};
CGRectInset=function(_1b,dX,dY){
return {origin:{x:_1b.origin.x+dX,y:_1b.origin.y+dY},size:{width:_1b.size.width-2*dX,height:_1b.size.height-2*dY}};
};
CGRectGetHeight=function(_1e){
return (_1e.size.height);
};
CGRectGetMaxX=function(_1f){
return (_1f.origin.x+_1f.size.width);
};
CGRectGetMaxY=function(_20){
return (_20.origin.y+_20.size.height);
};
CGRectGetMidX=function(_21){
return (_21.origin.x+(_21.size.width)/2);
};
CGRectGetMidY=function(_22){
return (_22.origin.y+(_22.size.height)/2);
};
CGRectGetMinX=function(_23){
return (_23.origin.x);
};
CGRectGetMinY=function(_24){
return (_24.origin.y);
};
CGRectGetWidth=function(_25){
return (_25.size.width);
};
CGRectIsEmpty=function(_26){
return (_26.size.width<=0||_26.size.height<=0);
};
CGRectIsNull=function(_27){
return (_27.size.width<=0||_27.size.height<=0);
};
CGRectContainsPoint=function(_28,_29){
return (_29.x>=(_28.origin.x)&&_29.y>=(_28.origin.y)&&_29.x<(_28.origin.x+_28.size.width)&&_29.y<(_28.origin.y+_28.size.height));
};
CGInsetMake=function(top,_2b,_2c,_2d){
return {top:(top),right:(_2b),bottom:(_2c),left:(_2d)};
};
CGInsetMakeZero=function(){
return {top:(0),right:(0),bottom:(0),left:(0)};
};
CGInsetMakeCopy=function(_2e){
return {top:(_2e.top),right:(_2e.right),bottom:(_2e.bottom),left:(_2e.left)};
};
CGInsetIsEmpty=function(_2f){
return ((_2f).top===0&&(_2f).right===0&&(_2f).bottom===0&&(_2f).left===0);
};
CGRectContainsRect=function(_30,_31){
var _32=CGRectUnion(_30,_31);
return ((_32.origin.x==_30.origin.x&&_32.origin.y==_30.origin.y)&&(_32.size.width==_30.size.width&&_32.size.height==_30.size.height));
};
CGRectIntersectsRect=function(_33,_34){
var _35=CGRectIntersection(_33,_34);
return !(_35.size.width<=0||_35.size.height<=0);
};
CGRectIntegral=function(_36){
_36=CGRectStandardize(_36);
var x=FLOOR((_36.origin.x)),y=FLOOR((_36.origin.y));
_36.size.width=CEIL((_36.origin.x+_36.size.width))-x;
_36.size.height=CEIL((_36.origin.y+_36.size.height))-y;
_36.origin.x=x;
_36.origin.y=y;
return _36;
};
CGRectIntersection=function(_39,_3a){
var _3b={origin:{x:MAX((_39.origin.x),(_3a.origin.x)),y:MAX((_39.origin.y),(_3a.origin.y))},size:{width:0,height:0}};
_3b.size.width=MIN((_39.origin.x+_39.size.width),(_3a.origin.x+_3a.size.width))-(_3b.origin.x);
_3b.size.height=MIN((_39.origin.y+_39.size.height),(_3a.origin.y+_3a.size.height))-(_3b.origin.y);
return (_3b.size.width<=0||_3b.size.height<=0)?{origin:{x:0,y:0},size:{width:0,height:0}}:_3b;
};
CGRectStandardize=function(_3c){
var _3d=(_3c.size.width),_3e=(_3c.size.height),_3f={origin:{x:_3c.origin.x,y:_3c.origin.y},size:{width:_3c.size.width,height:_3c.size.height}};
if(_3d<0){
_3f.origin.x+=_3d;
_3f.size.width=-_3d;
}
if(_3e<0){
_3f.origin.y+=_3e;
_3f.size.height=-_3e;
}
return _3f;
};
CGRectUnion=function(_40,_41){
var _42=MIN((_40.origin.x),(_41.origin.x)),_43=MIN((_40.origin.y),(_41.origin.y)),_44=MAX((_40.origin.x+_40.size.width),(_41.origin.x+_41.size.width)),_45=MAX((_40.origin.y+_40.size.height),(_41.origin.y+_41.size.height));
return {origin:{x:_42,y:_43},size:{width:_44-_42,height:_45-_43}};
};
CGPointFromString=function(_46){
var _47=_46.indexOf(",");
return {x:parseInt(_46.substr(1,_47-1)),y:parseInt(_46.substring(_47+1,_46.length))};
};
CGSizeFromString=function(_48){
var _49=_48.indexOf(",");
return {width:parseInt(_48.substr(1,_49-1)),height:parseInt(_48.substring(_49+1,_48.length))};
};
CGRectFromString=function(_4a){
var _4b=_4a.indexOf(",",_4a.indexOf(",")+1);
return {origin:CGPointFromString(_4a.substr(1,_4b-1)),size:CGSizeFromString(_4a.substring(_4b+2,_4a.length))};
};
CGPointFromEvent=function(_4c){
return {x:_4c.clientX,y:_4c.clientY};
};
CGInsetFromString=function(_4d){
var _4e=_4d.substr(1,_4d.length-2).split(",");
return {top:(parseFloat(_4e[0])),right:(parseFloat(_4e[1])),bottom:(parseFloat(_4e[2])),left:(parseFloat(_4e[3]))};
};
CGInsetFromCPString=CGInsetFromString;
CPStringFromCGInset=function(_4f){
return "{"+_4f.top+", "+_4f.left+", "+_4f.bottom+", "+_4f.right+"}";
};
