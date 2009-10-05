c;10117;window.CPLogDisable = false;
var CPLogDefaultTitle = "Cappuccino";
var CPLogLevels = ["fatal", "error", "warn", "info", "debug", "trace"];
var CPLogDefaultLevel = CPLogLevels[3];
var _CPLogLevelsInverted = {};
for (var i = 0; i < CPLogLevels.length; i++)
    _CPLogLevelsInverted[CPLogLevels[i]] = i;
var _CPLogRegistrations = {};
var _CPFormatLogMessage = function(aString, aLevel, aTitle)
{
    var now = new Date();
    aLevel = ( aLevel == null ? '' : ' [' + aLevel + ']' );
    if (typeof sprintf == "function")
        return sprintf("%4d-%02d-%02d %02d:%02d:%02d.%03d %s%s: %s",
            now.getFullYear(), now.getMonth(), now.getDate(),
            now.getHours(), now.getMinutes(), now.getSeconds(), now.getMilliseconds(),
            aTitle, aLevel, aString);
    else
        return now + " " + aTitle + aLevel + ": " + aString;
}
CPLogRegister= function(aProvider, aMaxLevel)
{
    CPLogRegisterRange(aProvider, CPLogLevels[0], aMaxLevel || CPLogLevels[CPLogLevels.length-1]);
}
CPLogRegisterRange= function(aProvider, aMinLevel, aMaxLevel)
{
    var min = _CPLogLevelsInverted[aMinLevel];
    var max = _CPLogLevelsInverted[aMaxLevel];
    if (min != undefined && max != undefined)
        for (var i = 0; i <= max; i++)
            CPLogRegisterSingle(aProvider, CPLogLevels[i]);
}
CPLogRegisterSingle= function(aProvider, aLevel)
{
    if (_CPLogRegistrations[aLevel] == undefined)
        _CPLogRegistrations[aLevel] = [aProvider];
    else
        _CPLogRegistrations[aLevel].push(aProvider);
}
_CPLogDispatch= function(parameters, aLevel, aTitle)
{
    if (aTitle == undefined)
        aTitle = CPLogDefaultTitle;
    if (aLevel == undefined)
        aLevel = CPLogDefaultLevel;
    var message = (typeof parameters[0] == "string" && parameters.length > 1) ? sprintf.apply(null, parameters) : String(parameters[0]);
    if (_CPLogRegistrations[aLevel])
        for (var i = 0; i < _CPLogRegistrations[aLevel].length; i++)
             _CPLogRegistrations[aLevel][i](message, aLevel, aTitle);
}
CPLog= function() { _CPLogDispatch(arguments); }
for (var i = 0; i < CPLogLevels.length; i++)
    CPLog[CPLogLevels[i]] = (function(level) { return function() { _CPLogDispatch(arguments, level); }; })(CPLogLevels[i]);
ANSI_ESC = String.fromCharCode(0x1B);
ANSI_CSI = ANSI_ESC + '[';
ANSI_TEXT_PROP = 'm';
ANSI_RESET = '0';
ANSI_BOLD = '1';
ANSI_FAINT = '2';
ANSI_NORMAL = '22';
ANSI_ITALIC = '3';
ANSI_UNDER = '4';
ANSI_UNDER_DBL = '21';
ANSI_UNDER_OFF = '24';
ANSI_BLINK = '5';
ANSI_BLINK_FAST = '6';
ANSI_BLINK_OFF = '25';
ANSI_REVERSE = '7';
ANSI_POSITIVE = '27';
ANSI_CONCEAL = '8';
ANSI_REVEAL = '28';
ANSI_FG = '3';
ANSI_BG = '4';
ANSI_FG_INTENSE = '9';
ANSI_BG_INTENSE = '10';
ANSI_BLACK = '0';
ANSI_RED = '1';
ANSI_GREEN = '2';
ANSI_YELLOW = '3';
ANSI_BLUE = '4';
ANSI_MAGENTA = '5';
ANSI_CYAN = '6';
ANSI_WHITE = '7';
var colorCodeMap = {
    "black" : ANSI_BLACK,
    "red" : ANSI_RED,
    "green" : ANSI_GREEN,
    "yellow" : ANSI_YELLOW,
    "blue" : ANSI_BLUE,
    "magenta" : ANSI_MAGENTA,
    "cyan" : ANSI_CYAN,
    "white" : ANSI_WHITE
}
ANSIControlCode = function(code, parameters)
{
    if (parameters == undefined)
        parameters = "";
    else if (typeof(parameters) == 'object' && (parameters instanceof Array))
        parameters = parameters.join(';');
    return ANSI_CSI + String(parameters) + String(code);
}
ANSITextApplyProperties = function(string, properties)
{
    return ANSIControlCode(ANSI_TEXT_PROP, properties) + String(string) + ANSIControlCode(ANSI_TEXT_PROP);
}
ANSITextColorize = function(string, color)
{
    if (colorCodeMap[color] == undefined)
        return string;
    return ANSITextApplyProperties(string, ANSI_FG + colorCodeMap[color]);
}
var levelColorMap = {
    "fatal": "red",
    "error": "red",
    "warn" : "yellow",
    "info" : "green",
    "debug": "cyan",
    "trace": "blue"
}
CPLogPrint= function(aString, aLevel, aTitle)
{
    if (typeof print != "undefined")
    {
        if (aLevel == "fatal" || aLevel == "error" || aLevel == "warn")
            var message = ANSITextColorize(_CPFormatLogMessage(aString, aLevel, aTitle), levelColorMap[aLevel]);
        else
            var message = _CPFormatLogMessage(aString, ANSITextColorize(aLevel, levelColorMap[aLevel]), aTitle);
        print(message);
    }
}
CPLogAlert= function(aString, aLevel, aTitle)
{
    if (typeof alert != "undefined" && !window.CPLogDisable)
    {
        var message = _CPFormatLogMessage(aString, aLevel, aTitle);
        window.CPLogDisable = !confirm(message + "\n\n(Click cancel to stop log alerts)");
    }
}
CPLogConsole= function(aString, aLevel, aTitle)
{
    if (typeof console != "undefined")
    {
        var message = _CPFormatLogMessage(aString, aLevel, aTitle);
        var logger = {
            "fatal": "error",
            "error": "error",
            "warn": "warn",
            "info": "info",
            "debug": "debug",
            "trace": "debug"
        }[aLevel];
        if (logger && console[logger])
            console[logger](message);
        else if (console.log)
            console.log(message);
    }
}
var CPLogWindow = null;
CPLogPopup = function(aString, aLevel, aTitle)
{
    try {
        if (window.CPLogDisable || window.open == undefined)
            return;
        if (!CPLogWindow || !CPLogWindow.document)
        {
            CPLogWindow = window.open("", "_blank", "width=600,height=400,status=no,resizable=yes,scrollbars=yes");
            if (!CPLogWindow) {
                window.CPLogDisable = !confirm(aString + "\n\n(Disable pop-up blocking for CPLog window; Click cancel to stop log alerts)");
                return;
            }
            _CPLogInitPopup(CPLogWindow);
        }
        var logDiv = CPLogWindow.document.createElement("div");
        logDiv.setAttribute("class", aLevel || "fatal");
        var message = _CPFormatLogMessage(aString, null, aTitle);
        logDiv.appendChild(CPLogWindow.document.createTextNode(message));
        CPLogWindow.log.appendChild(logDiv);
        if (CPLogWindow.focusEnabled.checked)
            CPLogWindow.focus();
        if (CPLogWindow.blockEnabled.checked)
            CPLogWindow.blockEnabled.checked = CPLogWindow.confirm(message+"\nContinue blocking?");
        if (CPLogWindow.scrollEnabled.checked)
            CPLogWindow.scrollToBottom();
    } catch(e) {
    }
}
var _CPLogInitPopup = function(logWindow)
{
    var doc = logWindow.document;
    doc.writeln("<html><head><title></title></head><body></body></html>");
    doc.title = CPLogDefaultTitle + " Run Log";
    var head = doc.getElementsByTagName("head")[0];
    var body = doc.getElementsByTagName("body")[0];
    var base = window.location.protocol + "//" + window.location.host + window.location.pathname;
    base = base.substring(0,base.lastIndexOf("/")+1);
    var link = doc.createElement("link");
    link.setAttribute("type", "text/css");
    link.setAttribute("rel", "stylesheet");
    link.setAttribute("href", base+"Frameworks/Foundation/Resources/log.css");
    link.setAttribute("media", "screen");
    head.appendChild(link);
    var div = doc.createElement("div");
    div.setAttribute("id", "header");
    body.appendChild(div);
    var ul = doc.createElement("ul");
    ul.setAttribute("id", "enablers");
    div.appendChild(ul);
    for (var i = 0; i < CPLogLevels.length; i++) {
        var li = doc.createElement("li");
        li.setAttribute("id", "en"+CPLogLevels[i]);
        li.setAttribute("class", CPLogLevels[i]);
        li.setAttribute("onclick", "toggle(this);");
        li.setAttribute("enabled", "yes");
        li.appendChild(doc.createTextNode(CPLogLevels[i]));
        ul.appendChild(li);
    }
    var ul = doc.createElement("ul");
    ul.setAttribute("id", "options");
    div.appendChild(ul);
    var options = {"focus":["Focus",false], "block":["Block",false], "wrap":["Wrap",false], "scroll":["Scroll",true], "close":["Close",true]};
    for (o in options) {
        var li = doc.createElement("li");
        ul.appendChild(li);
        logWindow[o+"Enabled"] = doc.createElement("input");
        logWindow[o+"Enabled"].setAttribute("id", o);
        logWindow[o+"Enabled"].setAttribute("type", "checkbox");
        if (options[o][1])
            logWindow[o+"Enabled"].setAttribute("checked", "checked");
        li.appendChild(logWindow[o+"Enabled"]);
        var label = doc.createElement("label");
        label.setAttribute("for", o);
        label.appendChild(doc.createTextNode(options[o][0]));
        li.appendChild(label);
    }
    logWindow.log = doc.createElement("div");
    logWindow.log.setAttribute("class", "enerror endebug enwarn eninfo enfatal entrace");
    body.appendChild(logWindow.log);
    logWindow.toggle = function(elem) {
        var enabled = (elem.getAttribute("enabled") == "yes") ? "no" : "yes";
        elem.setAttribute("enabled", enabled);
        if (enabled == "yes")
            logWindow.log.className += " " + elem.id
        else
            logWindow.log.className = logWindow.log.className.replace(new RegExp("[\\s]*"+elem.id, "g"), "");
    }
    logWindow.scrollToBottom = function() {
        logWindow.scrollTo(0, body.offsetHeight);
    }
    logWindow.wrapEnabled.addEventListener("click", function() {
        logWindow.log.setAttribute("wrap", logWindow.wrapEnabled.checked ? "yes" : "no");
    }, false);
    logWindow.addEventListener("keydown", function(e) {
        var e = e || logWindow.event;
        if (e.keyCode == 75 && (e.ctrlKey || e.metaKey)) {
            while (logWindow.log.firstChild) {
                logWindow.log.removeChild(logWindow.log.firstChild);
            }
            e.preventDefault();
        }
    }, "false");
    window.addEventListener("unload", function() {
        if (logWindow && logWindow.closeEnabled && logWindow.closeEnabled.checked) {
            window.CPLogDisable = true;
            logWindow.close();
        }
    }, false);
    logWindow.addEventListener("unload", function() {
        if (!window.CPLogDisable) {
            window.CPLogDisable = !confirm("Click cancel to stop logging");
        }
    }, false);
}

