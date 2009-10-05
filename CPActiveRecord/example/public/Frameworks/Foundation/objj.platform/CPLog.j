c;6885;
window.CPLogDisable=false;
var _1="Cappuccino";
var _2=["fatal","error","warn","info","debug","trace"];
var _3=_2[3];
var _4={};
for(var i=0;i<_2.length;i++){
_4[_2[i]]=i;
}
var _6={};
var _7=function(_8,_9,_a){
var _b=new Date();
_9=(_9==null?"":" ["+_9+"]");
if(typeof sprintf=="function"){
return sprintf("%4d-%02d-%02d %02d:%02d:%02d.%03d %s%s: %s",_b.getFullYear(),_b.getMonth(),_b.getDate(),_b.getHours(),_b.getMinutes(),_b.getSeconds(),_b.getMilliseconds(),_a,_9,_8);
}else{
return _b+" "+_a+_9+": "+_8;
}
};
CPLogRegister=function(_c,_d){
CPLogRegisterRange(_c,_2[0],_d||_2[_2.length-1]);
};
CPLogRegisterRange=function(_e,_f,_10){
var min=_4[_f];
var max=_4[_10];
if(min!=undefined&&max!=undefined){
for(var i=0;i<=max;i++){
CPLogRegisterSingle(_e,_2[i]);
}
}
};
CPLogRegisterSingle=function(_14,_15){
if(_6[_15]==undefined){
_6[_15]=[_14];
}else{
_6[_15].push(_14);
}
};
_CPLogDispatch=function(_16,_17,_18){
if(_18==undefined){
_18=_1;
}
if(_17==undefined){
_17=_3;
}
var _19=(typeof _16[0]=="string"&&_16.length>1)?sprintf.apply(null,_16):String(_16[0]);
if(_6[_17]){
for(var i=0;i<_6[_17].length;i++){
_6[_17][i](_19,_17,_18);
}
}
};
CPLog=function(){
_CPLogDispatch(arguments);
};
for(var i=0;i<_2.length;i++){
CPLog[_2[i]]=(function(_1b){
return function(){
_CPLogDispatch(arguments,_1b);
};
})(_2[i]);
}
ANSI_ESC=String.fromCharCode(27);
ANSI_CSI=ANSI_ESC+"[";
ANSI_TEXT_PROP="m";
ANSI_RESET="0";
ANSI_BOLD="1";
ANSI_FAINT="2";
ANSI_NORMAL="22";
ANSI_ITALIC="3";
ANSI_UNDER="4";
ANSI_UNDER_DBL="21";
ANSI_UNDER_OFF="24";
ANSI_BLINK="5";
ANSI_BLINK_FAST="6";
ANSI_BLINK_OFF="25";
ANSI_REVERSE="7";
ANSI_POSITIVE="27";
ANSI_CONCEAL="8";
ANSI_REVEAL="28";
ANSI_FG="3";
ANSI_BG="4";
ANSI_FG_INTENSE="9";
ANSI_BG_INTENSE="10";
ANSI_BLACK="0";
ANSI_RED="1";
ANSI_GREEN="2";
ANSI_YELLOW="3";
ANSI_BLUE="4";
ANSI_MAGENTA="5";
ANSI_CYAN="6";
ANSI_WHITE="7";
var _1c={"black":ANSI_BLACK,"red":ANSI_RED,"green":ANSI_GREEN,"yellow":ANSI_YELLOW,"blue":ANSI_BLUE,"magenta":ANSI_MAGENTA,"cyan":ANSI_CYAN,"white":ANSI_WHITE};
ANSIControlCode=function(_1d,_1e){
if(_1e==undefined){
_1e="";
}else{
if(typeof (_1e)=="object"&&(_1e instanceof Array)){
_1e=_1e.join(";");
}
}
return ANSI_CSI+String(_1e)+String(_1d);
};
ANSITextApplyProperties=function(_1f,_20){
return ANSIControlCode(ANSI_TEXT_PROP,_20)+String(_1f)+ANSIControlCode(ANSI_TEXT_PROP);
};
ANSITextColorize=function(_21,_22){
if(_1c[_22]==undefined){
return _21;
}
return ANSITextApplyProperties(_21,ANSI_FG+_1c[_22]);
};
var _23={"fatal":"red","error":"red","warn":"yellow","info":"green","debug":"cyan","trace":"blue"};
CPLogPrint=function(_24,_25,_26){
if(typeof print!="undefined"){
if(_25=="fatal"||_25=="error"||_25=="warn"){
var _27=ANSITextColorize(_7(_24,_25,_26),_23[_25]);
}else{
var _27=_7(_24,ANSITextColorize(_25,_23[_25]),_26);
}
print(_27);
}
};
CPLogAlert=function(_28,_29,_2a){
if(typeof alert!="undefined"&&!window.CPLogDisable){
var _2b=_7(_28,_29,_2a);
window.CPLogDisable=!confirm(_2b+"\n\n(Click cancel to stop log alerts)");
}
};
CPLogConsole=function(_2c,_2d,_2e){
if(typeof console!="undefined"){
var _2f=_7(_2c,_2d,_2e);
var _30={"fatal":"error","error":"error","warn":"warn","info":"info","debug":"debug","trace":"debug"}[_2d];
if(_30&&console[_30]){
console[_30](_2f);
}else{
if(console.log){
console.log(_2f);
}
}
}
};
var _31=null;
CPLogPopup=function(_32,_33,_34){
try{
if(window.CPLogDisable||window.open==undefined){
return;
}
if(!_31||!_31.document){
_31=window.open("","_blank","width=600,height=400,status=no,resizable=yes,scrollbars=yes");
if(!_31){
window.CPLogDisable=!confirm(_32+"\n\n(Disable pop-up blocking for CPLog window; Click cancel to stop log alerts)");
return;
}
_35(_31);
}
var _36=_31.document.createElement("div");
_36.setAttribute("class",_33||"fatal");
var _37=_7(_32,null,_34);
_36.appendChild(_31.document.createTextNode(_37));
_31.log.appendChild(_36);
if(_31.focusEnabled.checked){
_31.focus();
}
if(_31.blockEnabled.checked){
_31.blockEnabled.checked=_31.confirm(_37+"\nContinue blocking?");
}
if(_31.scrollEnabled.checked){
_31.scrollToBottom();
}
}
catch(e){
}
};
var _35=function(_38){
var doc=_38.document;
doc.writeln("<html><head><title></title></head><body></body></html>");
doc.title=_1+" Run Log";
var _3a=doc.getElementsByTagName("head")[0];
var _3b=doc.getElementsByTagName("body")[0];
var _3c=window.location.protocol+"//"+window.location.host+window.location.pathname;
_3c=_3c.substring(0,_3c.lastIndexOf("/")+1);
var _3d=doc.createElement("link");
_3d.setAttribute("type","text/css");
_3d.setAttribute("rel","stylesheet");
_3d.setAttribute("href",_3c+"Frameworks/Foundation/Resources/log.css");
_3d.setAttribute("media","screen");
_3a.appendChild(_3d);
var div=doc.createElement("div");
div.setAttribute("id","header");
_3b.appendChild(div);
var ul=doc.createElement("ul");
ul.setAttribute("id","enablers");
div.appendChild(ul);
for(var i=0;i<_2.length;i++){
var li=doc.createElement("li");
li.setAttribute("id","en"+_2[i]);
li.setAttribute("class",_2[i]);
li.setAttribute("onclick","toggle(this);");
li.setAttribute("enabled","yes");
li.appendChild(doc.createTextNode(_2[i]));
ul.appendChild(li);
}
var ul=doc.createElement("ul");
ul.setAttribute("id","options");
div.appendChild(ul);
var _42={"focus":["Focus",false],"block":["Block",false],"wrap":["Wrap",false],"scroll":["Scroll",true],"close":["Close",true]};
for(o in _42){
var li=doc.createElement("li");
ul.appendChild(li);
_38[o+"Enabled"]=doc.createElement("input");
_38[o+"Enabled"].setAttribute("id",o);
_38[o+"Enabled"].setAttribute("type","checkbox");
if(_42[o][1]){
_38[o+"Enabled"].setAttribute("checked","checked");
}
li.appendChild(_38[o+"Enabled"]);
var _43=doc.createElement("label");
_43.setAttribute("for",o);
_43.appendChild(doc.createTextNode(_42[o][0]));
li.appendChild(_43);
}
_38.log=doc.createElement("div");
_38.log.setAttribute("class","enerror endebug enwarn eninfo enfatal entrace");
_3b.appendChild(_38.log);
_38.toggle=function(_44){
var _45=(_44.getAttribute("enabled")=="yes")?"no":"yes";
_44.setAttribute("enabled",_45);
if(_45=="yes"){
_38.log.className+=" "+_44.id;
}else{
_38.log.className=_38.log.className.replace(new RegExp("[\\s]*"+_44.id,"g"),"");
}
};
_38.scrollToBottom=function(){
_38.scrollTo(0,_3b.offsetHeight);
};
_38.wrapEnabled.addEventListener("click",function(){
_38.log.setAttribute("wrap",_38.wrapEnabled.checked?"yes":"no");
},false);
_38.addEventListener("keydown",function(e){
var e=e||_38.event;
if(e.keyCode==75&&(e.ctrlKey||e.metaKey)){
while(_38.log.firstChild){
_38.log.removeChild(_38.log.firstChild);
}
e.preventDefault();
}
},"false");
window.addEventListener("unload",function(){
if(_38&&_38.closeEnabled&&_38.closeEnabled.checked){
window.CPLogDisable=true;
_38.close();
}
},false);
_38.addEventListener("unload",function(){
if(!window.CPLogDisable){
window.CPLogDisable=!confirm("Click cancel to stop logging");
}
},false);
};
