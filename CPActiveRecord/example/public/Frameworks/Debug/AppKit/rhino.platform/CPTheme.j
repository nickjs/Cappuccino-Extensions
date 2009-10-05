I;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;17438;
var CPThemesByName = { },
    CPThemeDefaultTheme = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPTheme"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_attributes")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:"), function $CPTheme__initWithName_(self, _cmd, aName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _name = aName;
        _attributes = objj_msgSend(CPDictionary, "dictionary");
        CPThemesByName[_name] = self;
    }
    return self;
}
},["id","CPString"]), new objj_method(sel_getUid("name"), function $CPTheme__name(self, _cmd)
{ with(self)
{
    return _name;
}
},["CPString"]), new objj_method(sel_getUid("_attributeWithName:forClass:"), function $CPTheme___attributeWithName_forClass_(self, _cmd, aName, aClass)
{ with(self)
{
    var attributes = objj_msgSend(_attributes, "objectForKey:", aClass);
    if (!attributes)
        return nil;
    return objj_msgSend(attributes, "objectForKey:", aName);
}
},["_CPThemeAttribute","CPString","CPString"]), new objj_method(sel_getUid("takeThemeFromObject:"), function $CPTheme__takeThemeFromObject_(self, _cmd, anObject)
{ with(self)
{
    var attributes = objj_msgSend(anObject, "_themeAttributeDictionary"),
        attributeName = nil,
        attributeNames = objj_msgSend(attributes, "keyEnumerator"),
        objectThemeClass = objj_msgSend(objj_msgSend(anObject, "class"), "themeClass");
    while (attributeName = objj_msgSend(attributeNames, "nextObject"))
        objj_msgSend(self, "_recordAttribute:forClass:", objj_msgSend(attributes, "objectForKey:", attributeName), objectThemeClass);
}
},["void","id"]), new objj_method(sel_getUid("_recordAttribute:forClass:"), function $CPTheme___recordAttribute_forClass_(self, _cmd, anAttribute, aClass)
{ with(self)
{
    if (!objj_msgSend(anAttribute, "hasValues"))
        return;
    var attributes = objj_msgSend(_attributes, "objectForKey:", aClass);
    if (!attributes)
    {
        attributes = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(_attributes, "setObject:forKey:", attributes, aClass);
    }
    var name = objj_msgSend(anAttribute, "name"),
        existingAttribute = objj_msgSend(attributes, "objectForKey:", name);
    if (existingAttribute)
        objj_msgSend(attributes, "setObject:forKey:", objj_msgSend(existingAttribute, "attributeMergedWithAttribute:", anAttribute), name);
    else
        objj_msgSend(attributes, "setObject:forKey:", anAttribute, name);
}
},["void","_CPThemeAttribute","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("setDefaultTheme:"), function $CPTheme__setDefaultTheme_(self, _cmd, aTheme)
{ with(self)
{
    CPThemeDefaultTheme = aTheme;
}
},["void","CPTheme"]), new objj_method(sel_getUid("defaultTheme"), function $CPTheme__defaultTheme(self, _cmd)
{ with(self)
{
    return CPThemeDefaultTheme;
}
},["CPTheme"]), new objj_method(sel_getUid("themeNamed:"), function $CPTheme__themeNamed_(self, _cmd, aName)
{ with(self)
{
    return CPThemesByName[aName];
}
},["CPTheme","CPString"])]);
}
var CPThemeNameKey = "CPThemeNameKey",
    CPThemeAttributesKey = "CPThemeAttributesKey";
{
var the_class = objj_getClass("CPTheme")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTheme\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTheme__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _name = objj_msgSend(aCoder, "decodeObjectForKey:", CPThemeNameKey);
        _attributes = objj_msgSend(aCoder, "decodeObjectForKey:", CPThemeAttributesKey);
        CPThemesByName[_name] = self;
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTheme__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _name, CPThemeNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _attributes, CPThemeAttributesKey);
}
},["void","CPCoder"])]);
}
{var the_class = objj_allocateClassPair(CPKeyedUnarchiver, "_CPThemeKeyedUnarchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithData:bundle:"), function $_CPThemeKeyedUnarchiver__initForReadingWithData_bundle_(self, _cmd, data, aBundle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyedUnarchiver") }, "initForReadingWithData:", data);
    if (self)
        _bundle = aBundle;
    return self;
}
},["id","CPData","CPBundle"]), new objj_method(sel_getUid("bundle"), function $_CPThemeKeyedUnarchiver__bundle(self, _cmd)
{ with(self)
{
    return _bundle;
}
},["CPBundle"]), new objj_method(sel_getUid("awakenCustomResources"), function $_CPThemeKeyedUnarchiver__awakenCustomResources(self, _cmd)
{ with(self)
{
    return YES;
}
},["BOOL"])]);
}
var CPThemeStates = {},
    CPThemeStateNames = {},
    CPThemeStateCount = 0;
CPThemeState= function(aStateName)
{
    var state = CPThemeStates[aStateName];
    if (state === undefined)
    {
        if (aStateName.indexOf('+') === -1)
            state = 1 << CPThemeStateCount++;
        else
        {
            var state = 0,
                states = aStateName.split('+'),
                count = states.length;
            while (count--)
            {
                var stateName = states[count],
                    individualState = CPThemeStates[stateName];
                if (individualState === undefined)
                {
                    individualState = 1 << CPThemeStateCount++;
                    CPThemeStates[stateName] = individualState;
                    CPThemeStateNames[individualState] = stateName;
                }
                state |= individualState;
            }
        }
        CPThemeStates[aStateName] = state;
        CPThemeStateNames[state] = aStateName;
    }
    return state;
}
CPThemeStateName= function(aState)
{
    var name = CPThemeStateNames[aState];
    if (name !== undefined)
        return name;
    if (!(aState & (aState - 1)))
        return "";
    var state = 1,
        name = "";
    for (; state < aState; state <<= 1)
        if (aState & state)
            name += (name.length === 0 ? '' : '+') + CPThemeStateNames[state];
    CPThemeStateNames[aState] = name;
    return name;
}
CPThemeStateNames[0] = "normal";
CPThemeStateNormal = CPThemeStates["normal"] = 0;
CPThemeStateDisabled = CPThemeState("disabled");
CPThemeStateHighlighted = CPThemeState("highlighted");
CPThemeStateSelected = CPThemeState("selected");
CPThemeStateBezeled = CPThemeState("bezeled");
CPThemeStateBordered = CPThemeState("bordered");
CPThemeStateEditable = CPThemeState("editable");
CPThemeStateEditing = CPThemeState("editing");
CPThemeStateVertical = CPThemeState("vertical");
CPThemeStateDefault = CPThemeState("default");
CPThemeStateCircular = CPThemeState("circular");
{var the_class = objj_allocateClassPair(CPObject, "_CPThemeAttribute"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_defaultValue"), new objj_ivar("_values"), new objj_ivar("_cache"), new objj_ivar("_parentAttribute")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:defaultValue:"), function $_CPThemeAttribute__initWithName_defaultValue_(self, _cmd, aName, aDefaultValue)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _cache = { };
        _name = aName;
        _defaultValue = aDefaultValue;
        _values = objj_msgSend(CPDictionary, "dictionary");
    }
    return self;
}
},["id","CPString","id"]), new objj_method(sel_getUid("name"), function $_CPThemeAttribute__name(self, _cmd)
{ with(self)
{
    return _name;
}
},["CPString"]), new objj_method(sel_getUid("defaultValue"), function $_CPThemeAttribute__defaultValue(self, _cmd)
{ with(self)
{
    return _defaultValue;
}
},["id"]), new objj_method(sel_getUid("hasValues"), function $_CPThemeAttribute__hasValues(self, _cmd)
{ with(self)
{
    return objj_msgSend(_values, "count") > 0;
}
},["BOOL"]), new objj_method(sel_getUid("isTrivial"), function $_CPThemeAttribute__isTrivial(self, _cmd)
{ with(self)
{
    return (objj_msgSend(_values, "count") === 1) && (Number(objj_msgSend(_values, "allKeys")[0]) === CPThemeStateNormal);
}
},["BOOL"]), new objj_method(sel_getUid("setValue:"), function $_CPThemeAttribute__setValue_(self, _cmd, aValue)
{ with(self)
{
    _cache = {};
    if (aValue === undefined || aValue === nil)
        _values = objj_msgSend(CPDictionary, "dictionary");
    else
        _values = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", aValue, String(CPThemeStateNormal));
}
},["void","id"]), new objj_method(sel_getUid("setValue:forState:"), function $_CPThemeAttribute__setValue_forState_(self, _cmd, aValue, aState)
{ with(self)
{
    _cache = { };
    if ((aValue === undefined) || (aValue === nil))
        objj_msgSend(_values, "removeObjectForKey:", String(aState));
    else
        objj_msgSend(_values, "setObject:forKey:", aValue, String(aState));
}
},["void","id","CPThemeState"]), new objj_method(sel_getUid("value"), function $_CPThemeAttribute__value(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "valueForState:", CPThemeStateNormal);
}
},["id"]), new objj_method(sel_getUid("valueForState:"), function $_CPThemeAttribute__valueForState_(self, _cmd, aState)
{ with(self)
{
    var value = _cache[aState];
    if (value !== undefined)
        return value;
    value = objj_msgSend(_values, "objectForKey:", String(aState));
    if ((value === undefined || value === nil) && aState !== CPThemeStateNormal)
    {
        if (aState & (aState - 1))
        {
            var highestOneCount = 0,
                states = objj_msgSend(_values, "allKeys"),
                count = states.length;
            while (count--)
            {
                var state = Number(states[count]);
                if ((state & aState) === state)
                {
                    var oneCount = cachedNumberOfOnes[state];
                    if (oneCount === undefined)
                        oneCount = numberOfOnes(state);
                    if (oneCount > highestOneCount)
                    {
                        highestOneCount = oneCount;
                        value = objj_msgSend(_values, "objectForKey:", String(state));
                    }
                }
            }
        }
        if (value === undefined || value === nil)
            value = objj_msgSend(_values, "objectForKey:", String(CPThemeStateNormal));
    }
    if (value === undefined || value === nil)
        value = objj_msgSend(_parentAttribute, "valueForState:", aState);
    if (value === undefined || value === nil)
        value = _defaultValue;
    _cache[aState] = value;
    return value;
}
},["id","CPThemeState"]), new objj_method(sel_getUid("setParentAttribute:"), function $_CPThemeAttribute__setParentAttribute_(self, _cmd, anAttribute)
{ with(self)
{
    if (_parentAttribute === anAttribute)
        return;
    _cache = { };
    _parentAttribute = anAttribute;
}
},["void","CPThemeAttribute"]), new objj_method(sel_getUid("attributeMergedWithAttribute:"), function $_CPThemeAttribute__attributeMergedWithAttribute_(self, _cmd, anAttribute)
{ with(self)
{
    var mergedAttribute = objj_msgSend(objj_msgSend(_CPThemeAttribute, "alloc"), "initWithName:defaultValue:", _name, _defaultValue);
    mergedAttribute._values = objj_msgSend(_values, "copy");
    objj_msgSend(mergedAttribute._values, "addEntriesFromDictionary:", anAttribute._values);
    return mergedAttribute;
}
},["CPThemeAttribute","_CPThemeAttribute"])]);
}
{
var the_class = objj_getClass("_CPThemeAttribute")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPThemeAttribute\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPThemeAttribute__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _cache = {};
        _name = objj_msgSend(aCoder, "decodeObjectForKey:", "name");
        _values = objj_msgSend(CPDictionary, "dictionary");
        if (objj_msgSend(aCoder, "containsValueForKey:", "value"))
        {
            var state = CPThemeStateNormal;
            if (objj_msgSend(aCoder, "containsValueForKey:", "state"))
                state = CPThemeState(objj_msgSend(aCoder, "decodeObjectForKey:", "state"));
            objj_msgSend(_values, "setObject:forKey:", objj_msgSend(aCoder, "decodeObjectForKey:", "value"), state);
        }
        else
        {
            var encodedValues = objj_msgSend(aCoder, "decodeObjectForKey:", "values"),
                keys = objj_msgSend(encodedValues, "allKeys"),
                count = keys.length;
            while (count--)
            {
                var key = keys[count];
                objj_msgSend(_values, "setObject:forKey:", objj_msgSend(encodedValues, "objectForKey:", key), CPThemeState(key));
            }
        }
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPThemeAttribute__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _name, "name");
    var keys = objj_msgSend(_values, "allKeys"),
        count = keys.length;
    if (count === 1)
    {
        var onlyKey = keys[0];
        if (Number(onlyKey) !== CPThemeStateNormal)
            objj_msgSend(aCoder, "encodeObject:forKey:", CPThemeStateName(Number(onlyKey)), "state");
        objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(_values, "objectForKey:", onlyKey), "value");
    }
    else
    {
        var encodedValues = objj_msgSend(CPDictionary, "dictionary");
        while (count--)
        {
            var key = keys[count];
            objj_msgSend(encodedValues, "setObject:forKey:", objj_msgSend(_values, "objectForKey:", key), CPThemeStateName(Number(key)));
        }
        objj_msgSend(aCoder, "encodeObject:forKey:", encodedValues, "values");
    }
}
},["void","CPCoder"])]);
}
var cachedNumberOfOnes = [ 0 , 1 , 1 , 2 , 1 , 2 , 2 ,
                            3 , 1 , 2 , 2 , 3 , 2 , 3 ,
                            3 , 4 , 1 , 2 , 2 , 3 , 2 ,
                            3 , 3 , 4 , 2 , 3 , 3 , 4 ,
                            3 , 4 , 4 , 5 , 1 , 2 , 2 ,
                            3 , 2 , 3 , 3 , 4 , 2 , 3 ,
                            3 , 4 , 3 , 4 , 4 , 5 , 2 ,
                            3 , 3 , 4 , 3 , 4 , 4 , 5 ,
                            3 , 4 , 4 , 5 , 4 , 5 , 5 ,
                            6 ];
var numberOfOnes = function(aNumber)
{
    var count = 0,
        slot = aNumber;
    while (aNumber)
    {
        ++count;
        aNumber &= (aNumber - 1);
    }
    cachedNumberOfOnes[slot] = count;
    return count;
}
numberOfOnes.displayName = "numberOfOnes";
CPThemeAttributeEncode= function(aCoder, aThemeAttribute)
{
    var values = aThemeAttribute._values,
        count = objj_msgSend(values, "count"),
        key = "$a" + objj_msgSend(aThemeAttribute, "name");
    if (count === 1)
    {
        var state = objj_msgSend(values, "allKeys")[0];
        if (Number(state) === 0)
        {
            objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(values, "objectForKey:", state), key);
            return YES;
        }
    }
    if (count >= 1)
    {
        objj_msgSend(aCoder, "encodeObject:forKey:", aThemeAttribute, key);
        return YES;
    }
    return NO;
}
CPThemeAttributeDecode= function(aCoder, anAttributeName, aDefaultValue, aTheme, aClass)
{
    var key = "$a" + anAttributeName;
    if (!objj_msgSend(aCoder, "containsValueForKey:", key))
        var attribute = objj_msgSend(objj_msgSend(_CPThemeAttribute, "alloc"), "initWithName:defaultValue:", anAttributeName, aDefaultValue);
    else
    {
        var attribute = objj_msgSend(aCoder, "decodeObjectForKey:", key);
        if (!attribute.isa || !objj_msgSend(attribute, "isKindOfClass:", objj_msgSend(_CPThemeAttribute, "class")))
        {
            var themeAttribute = objj_msgSend(objj_msgSend(_CPThemeAttribute, "alloc"), "initWithName:defaultValue:", anAttributeName, aDefaultValue);
            objj_msgSend(themeAttribute, "setValue:", attribute);
            attribute = themeAttribute;
        }
    }
    if (aTheme && aClass)
        objj_msgSend(attribute, "setParentAttribute:", objj_msgSend(aTheme, "_attributeWithName:forClass:", anAttributeName, aClass));
    return attribute;
}

