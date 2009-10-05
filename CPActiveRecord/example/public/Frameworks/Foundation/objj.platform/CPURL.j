I;21;Foundation/CPObject.jc;11349;
CPURLNameKey="CPURLNameKey";
CPURLLocalizedNameKey="CPURLLocalizedNameKey";
CPURLIsRegularFileKey="CPURLIsRegularFileKey";
CPURLIsDirectoryKey="CPURLIsDirectoryKey";
CPURLIsSymbolicLinkKey="CPURLIsSymbolicLinkKey";
CPURLIsVolumeKey="CPURLIsVolumeKey";
CPURLIsPackageKey="CPURLIsPackageKey";
CPURLIsSystemImmutableKey="CPURLIsSystemImmutableKey";
CPURLIsUserImmutableKey="CPURLIsUserImmutableKey";
CPURLIsHiddenKey="CPURLIsHiddenKey";
CPURLHasHiddenExtensionKey="CPURLHasHiddenExtensionKey";
CPURLCreationDateKey="CPURLCreationDateKey";
CPURLContentAccessDateKey="CPURLContentAccessDateKey";
CPURLContentModificationDateKey="CPURLContentModificationDateKey";
CPURLAttributeModificationDateKey="CPURLAttributeModificationDateKey";
CPURLLinkCountKey="CPURLLinkCountKey";
CPURLParentDirectoryURLKey="CPURLParentDirectoryURLKey";
CPURLVolumeURLKey="CPURLTypeIdentifierKey";
CPURLTypeIdentifierKey="CPURLTypeIdentifierKey";
CPURLLocalizedTypeDescriptionKey="CPURLLocalizedTypeDescriptionKey";
CPURLLabelNumberKey="CPURLLabelNumberKey";
CPURLLabelColorKey="CPURLLabelColorKey";
CPURLLocalizedLabelKey="CPURLLocalizedLabelKey";
CPURLEffectiveIconKey="CPURLEffectiveIconKey";
CPURLCustomIconKey="CPURLCustomIconKey";
var _1=objj_allocateClassPair(CPObject,"CPURL"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_base"),new objj_ivar("_relative"),new objj_ivar("_resourceValues")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("baseURL"),function(_3,_4){
with(_3){
return _base;
}
}),new objj_method(sel_getUid("relativeString"),function(_5,_6){
with(_5){
return _relative;
}
}),new objj_method(sel_getUid("initWithScheme:host:path:"),function(_7,_8,_9,_a,_b){
with(_7){
var _c=new _d();
_c.scheme=_9;
_c.authority=_a;
_c.path=_b;
objj_msgSend(_7,"initWithString:",_c.toString());
}
}),new objj_method(sel_getUid("initWithString:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(_e,"initWithString:relativeToURL:",_10,nil);
}
}),new objj_method(sel_getUid("initWithString:relativeToURL:"),function(_11,_12,_13,_14){
with(_11){
if(!_15.test(_13)){
return nil;
}
if(_11){
_base=_14;
_relative=_13;
_resourceValues=objj_msgSend(CPDictionary,"dictionary");
}
return _11;
}
}),new objj_method(sel_getUid("absoluteURL"),function(_16,_17){
with(_16){
var _18=objj_msgSend(_16,"absoluteString");
if(_18!==_relative){
return objj_msgSend(objj_msgSend(CPURL,"alloc"),"initWithString:",_18);
}
return _16;
}
}),new objj_method(sel_getUid("absoluteString"),function(_19,_1a){
with(_19){
return _1b(objj_msgSend(_base,"absoluteString")||"",_relative);
}
}),new objj_method(sel_getUid("relativeString"),function(_1c,_1d){
with(_1c){
return _relative;
}
}),new objj_method(sel_getUid("path"),function(_1e,_1f){
with(_1e){
var str=objj_msgSend(_1e,"absoluteString");
return _15.test(str)?(_21(str).path||nil):nil;
}
}),new objj_method(sel_getUid("relativePath"),function(_22,_23){
with(_22){
return _15.test(_relative)?(_21(_relative).path||nil):nil;
}
}),new objj_method(sel_getUid("scheme"),function(_24,_25){
with(_24){
var str=objj_msgSend(_24,"absoluteString");
return _15.test(str)?(_21(str).protocol||nil):nil;
}
}),new objj_method(sel_getUid("user"),function(_27,_28){
with(_27){
var str=objj_msgSend(_27,"absoluteString");
return _15.test(str)?(_21(str).user||nil):nil;
}
}),new objj_method(sel_getUid("password"),function(_2a,_2b){
with(_2a){
var str=objj_msgSend(_2a,"absoluteString");
return _15.test(str)?(_21(str).password||nil):nil;
}
}),new objj_method(sel_getUid("host"),function(_2d,_2e){
with(_2d){
var str=objj_msgSend(_2d,"absoluteString");
return _15.test(str)?(_21(str).domain||nil):nil;
}
}),new objj_method(sel_getUid("port"),function(_30,_31){
with(_30){
var str=objj_msgSend(_30,"absoluteString");
if(_15.test(str)){
var _33=_21(str).port;
if(_33){
return parseInt(_33,10);
}
}
return nil;
}
}),new objj_method(sel_getUid("parameterString"),function(_34,_35){
with(_34){
var str=objj_msgSend(_34,"absoluteString");
return _15.test(str)?(_21(str).query||nil):nil;
}
}),new objj_method(sel_getUid("fragment"),function(_37,_38){
with(_37){
var str=objj_msgSend(_37,"absoluteString");
return _15.test(str)?(_21(str).anchor||nil):nil;
}
}),new objj_method(sel_getUid("isEqual:"),function(_3a,_3b,_3c){
with(_3a){
return objj_msgSend(_3a,"relativeString")===objj_msgSend(_3c,"relativeString")&&(objj_msgSend(_3a,"baseURL")===objj_msgSend(_3c,"baseURL")||objj_msgSend(objj_msgSend(_3a,"baseURL"),"isEqual:",objj_msgSend(_3c,"baseURL")));
}
}),new objj_method(sel_getUid("lastPathComponent"),function(_3d,_3e){
with(_3d){
var _3f=objj_msgSend(_3d,"path");
return _3f?_3f.split("/").pop():nil;
}
}),new objj_method(sel_getUid("pathExtension"),function(_40,_41){
with(_40){
var _42=objj_msgSend(_40,"path"),ext=_42.match(/\.(\w+)$/);
return ext?ext[1]:"";
}
}),new objj_method(sel_getUid("standardizedURL"),function(_44,_45){
with(_44){
return objj_msgSend(CPURL,"URLWithString:relativeToURL:",_46(_21(_relative)),_base);
}
}),new objj_method(sel_getUid("isFileURL"),function(_47,_48){
with(_47){
return objj_msgSend(_47,"scheme")==="file";
}
}),new objj_method(sel_getUid("description"),function(_49,_4a){
with(_49){
return objj_msgSend(_49,"absoluteString");
}
}),new objj_method(sel_getUid("resourceValueForKey:"),function(_4b,_4c,_4d){
with(_4b){
return objj_msgSend(_resourceValues,"objectForKey:",_4d);
}
}),new objj_method(sel_getUid("setResourceValue:forKey:"),function(_4e,_4f,_50,_51){
with(_4e){
objj_msgSend(_resourceValues,"setObject:forKey:",_50,_51);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("URLWithString:"),function(_52,_53,_54){
with(_52){
return objj_msgSend(objj_msgSend(_52,"alloc"),"initWithString:",_54);
}
}),new objj_method(sel_getUid("URLWithString:relativeToURL:"),function(_55,_56,_57,_58){
with(_55){
return objj_msgSend(objj_msgSend(_55,"alloc"),"initWithString:relativeToURL:",_57,_58);
}
})]);
var _1=objj_getClass("CPURL");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPURL\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_59,_5a,_5b){
with(_59){
_base=objj_msgSend(_5b,"decodeObjectForKey:","CPURLBaseKey");
_relative=objj_msgSend(_5b,"decodeObjectForKey:","CPURLRelativeKey");
return _59;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5c,_5d,_5e){
with(_5c){
objj_msgSend(_5e,"encodeObject:forKey:",_base,"CPURLBaseKey");
objj_msgSend(_5e,"encodeObject:forKey:",_relative,"CPURLRelativeKey");
}
})]);
var _15=/^(?:([^:\/?\#]+):)?(?:\/\/([^\/?\#]*))?([^?\#]*)(?:\?([^\#]*))?(?:\#(.*))?/;
var _d=function(str){
if(!str){
str="";
}
var _60=str.match(_15);
this.scheme=_60[1]||null;
this.authority=_60[2]||null;
this.path=_60[3]||null;
this.query=_60[4]||null;
this.fragment=_60[5]||null;
};
_d.prototype.toString=function(){
var str="";
if(this.scheme){
str+=this.scheme+":";
}
if(this.authority){
str+="//"+this.authority;
}
if(this.path){
str+=this.path;
}
if(this.query){
str+="?"+this.query;
}
if(this.fragment){
str+="#"+this.fragment;
}
return str;
};
var _21=function(uri){
return new _d(uri);
};
var _63=function(str,_65){
return decodeURI(str).replace(/\+/g," ");
};
var _66=function(str,_68){
return decodeURIComponent(str).replace(/\+/g," ");
};
var _69=["url","protocol","authorityRoot","authority","userInfo","user","password","domain","domains","port","path","root","directory","directories","file","query","anchor"];
var _6a=["url","protocol","authorityRoot","authority","userInfo","user","password","domain","port","path","root","directory","file","query","anchor"];
var _6b=new RegExp("^"+"(?:"+"([^:/?#]+):"+")?"+"(?:"+"(//)"+"("+"(?:"+"("+"([^:@]*)"+":?"+"([^:@]*)"+")?"+"@"+")?"+"([^:/?#]*)"+"(?::(\\d*))?"+")"+")?"+"("+"(/?)"+"((?:[^?#/]*/)*)"+"([^?#]*)"+")"+"(?:\\?([^#]*))?"+"(?:#(.*))?");
var _6c=function(_6d){
return function(url){
if(typeof url=="undefined"){
throw new Error("HttpError: URL is undefined");
}
if(typeof url!="string"){
return new Object(url);
}
var _6f={};
var _70=_6d.exec(url);
for(var i=0;i<_70.length;i++){
_6f[_6a[i]]=_70[i]?_70[i]:"";
}
_6f.root=(_6f.root||_6f.authorityRoot)?"/":"";
_6f.directories=_6f.directory.split("/");
if(_6f.directories[_6f.directories.length-1]==""){
_6f.directories.pop();
}
var _72=[];
for(var i=0;i<_6f.directories.length;i++){
var _73=_6f.directories[i];
if(_73=="."){
}else{
if(_73==".."){
if(_72.length&&_72[_72.length-1]!=".."){
_72.pop();
}else{
_72.push("..");
}
}else{
_72.push(_73);
}
}
}
_6f.directories=_72;
_6f.domains=_6f.domain.split(".");
return _6f;
};
};
var _21=_6c(_6b);
var _46=function(_74){
if(typeof (_74)=="undefined"){
throw new Error("UrlError: URL undefined for urls#format");
}
if(_74 instanceof String||typeof (_74)=="string"){
return _74;
}
var _75=_74.domains?_74.domains.join("."):_74.domain;
var _76=(_74.user||_74.password)?((_74.user||"")+(_74.password?":"+_74.password:"")):_74.userInfo;
var _77=(_76||_75||_74.port)?((_76?_76+"@":"")+(_75||"")+(_74.port?":"+_74.port:"")):_74.authority;
var _78=_74.directories?_74.directories.join("/"):_74.directory;
var _79=_78||_74.file?((_78?_78+"/":"")+(_74.file||"")):_74.path;
return ((_74.protocol?_74.protocol+":":"")+(_77?"//"+_77:"")+(_74.root||(_77&&_79)?"/":"")+(_79?_79:"")+(_74.query?"?"+_74.query:"")+(_74.anchor?"#"+_74.anchor:""))||_74.url||"";
};
var _7a=function(_7b,_7c){
if(!_7b){
return _7c;
}
_7b=_21(_7b);
_7c=_21(_7c);
if(_7c.url==""){
return _7b;
}
delete _7b.url;
delete _7b.authority;
delete _7b.domain;
delete _7b.userInfo;
delete _7b.path;
delete _7b.directory;
if(_7c.protocol&&_7c.protocol!=_7b.protocol||_7c.authority&&_7c.authority!=_7b.authority){
_7b=_7c;
}else{
if(_7c.root){
_7b.directories=_7c.directories;
}else{
var _7d=_7c.directories;
for(var i=0;i<_7d.length;i++){
var _7f=_7d[i];
if(_7f=="."){
}else{
if(_7f==".."){
if(_7b.directories.length){
_7b.directories.pop();
}else{
_7b.directories.push("..");
}
}else{
_7b.directories.push(_7f);
}
}
}
if(_7c.file=="."){
_7c.file="";
}else{
if(_7c.file==".."){
_7b.directories.pop();
_7c.file="";
}
}
}
}
if(_7c.root){
_7b.root=_7c.root;
}
if(_7c.protcol){
_7b.protocol=_7c.protocol;
}
if(!(!_7c.path&&_7c.anchor)){
_7b.file=_7c.file;
}
_7b.query=_7c.query;
_7b.anchor=_7c.anchor;
return _7b;
};
var _80=function(_81,_82){
_82=_21(_82);
_81=_21(_81);
delete _82.url;
if(_82.protocol==_81.protocol&&_82.authority==_81.authority){
delete _82.protocol;
delete _82.authority;
delete _82.userInfo;
delete _82.user;
delete _82.password;
delete _82.domain;
delete _82.domains;
delete _82.port;
if(!!_82.root==!!_81.root&&!(_82.root&&_82.directories[0]!=_81.directories[0])){
delete _82.path;
delete _82.root;
delete _82.directory;
while(_81.directories.length&&_82.directories.length&&_82.directories[0]==_81.directories[0]){
_82.directories.shift();
_81.directories.shift();
}
while(_81.directories.length){
_81.directories.shift();
_82.directories.unshift("..");
}
if(!_82.root&&!_82.directories.length&&!_82.file&&_81.file){
_82.directories.push(".");
}
if(_81.file==_82.file){
delete _82.file;
}
if(_81.query==_82.query){
delete _82.query;
}
if(_81.anchor==_82.anchor){
delete _82.anchor;
}
}
}
return _82;
};
var _1b=function(_83,_84){
return _46(_7a(_83,_84));
};
var _85=function(_86,_87){
return _46(_80(_86,_87));
};
