/*
 * CPActiveRecord.j
 * AppKit
 *
 * Created by Nicholas Small.
 * Copyright 2009, 280 North, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

@import <Foundation/CPObject.j>

@import "CPURLRequest-CPActiveRecordAdditions.j"


CPActiveRecordCollectionWillLoad = @"CPActiveRecordCollectionWillLoad";
CPActiveRecordCollectionDidLoad = @"CPActiveRecordCollectionDidLoad";
CPActiveRecordRecordWillLoad = @"CPActiveRecordRecordWillLoad";
CPActiveRecordRecordDidLoad = @"CPActiveRecordRecordDidLoad";
CPActiveRecordRecordWillSave = @"CPActiveRecordRecordWillSave";
CPActiveRecordRecordDidSave = @"CPActiveRecordRecordDidSave";
CPActiveRecordRecordWillDestroy = @"CPActiveRecordRecordWillDestroy";
CPActiveRecordRecordDidDestroy = @"CPActiveRecordRecordDidDestroy";

var CPActiveRecordModels;

@implementation CPActiveRecord : CPObject
{
    CPString        identifier      @accessors;
    
    JSObject        _lastSync;
}

+ (void)initialize
{
    self._CPActiveRecordLastSync = 0;
}

+ (CPDictionary)_recordsForClass:(Class)aModel
{
    if (!CPActiveRecordModels)
        CPActiveRecordModels = [CPDictionary dictionary];
    
    var records = [CPActiveRecordModels objectForKey:[aModel className]];
    
    if (!records)
    {
        records = [CPDictionary dictionary];
        [CPActiveRecordModels setObject:records forKey:[aModel className]];
    }
    
    return records;
}

+ (id)_recordForClass:(Class)aModel identifier:(CPString)anIdentifier
{
    if (!anIdentifier)
        return [[aModel alloc] init];
    
    var records = [CPActiveRecord _recordsForClass:aModel],
        record = [records objectForKey:anIdentifier];
    
    if (!record)
    {
        record = [[aModel alloc] init];
        [record setIdentifier:anIdentifier];
        [records setObject:record forKey:anIdentifier];
    }
    
    return record;
}

+ (id)new
{
    return [self new:nil];
}

+ (id)new:(JSObject)attributes
{
    if (!attributes)
        attributes = {};
    
    var record = [CPActiveRecord _recordForClass:self identifier:attributes.id];
    
    for (var attribute in attributes)
    {
        if (attribute == 'id')
            continue;
        
        try
        {
            [record setValue:attributes[attribute] forKey:attribute];
        }
        catch (anException)
        {
            if ([anException name] === CPUndefinedKeyException)
                CPLog.info(@"Could not connect the remote property " + attribute + @" of record of model " + [record className]);
            else
                throw anException;
        }
    }
    
    return record;
}

+ (CPURL)resourcePath
{
    return [CPURL URLWithString:@"/" + [[self className] lowercaseString] + @"s"];
}

- (void)setIdentifier:(CPString)anIdentifier
{
    if (identifier === anIdentifier)
        return;
    
    var records = [CPActiveRecord _recordsForClass:[self class]];
    
    if (identifier)
        [records removeObjectForKey:identifier];
    
    identifier = anIdentifier;
    
    if (identifier)
        [records setObject:self forKey:identifier];
}

- (JSObject)attributes:(JSObject)attr
{
    var ret = {};
    
    if ([self identifier])
        ret['id'] = [self identifier];
    
    ret[[[self className] lowercaseString]] = attr;
    
    return ret;
}

@end

@implementation CPActiveRecord (Finders)

+ (CPArray)all
{
    return [self findAll];
}

+ (id)first
{
    return [self findFirst];
}

+ (id)last
{
    return [self findLast];
}

+ (id)find:(JSObject)options
{
    // Do we want to do this?
    // [self loadIfNeeded];
    
    if (options.isa)
        return [self _find_by_ids:options];
    
    var records = [[CPActiveRecord _recordsForClass:self] allValues],
        count = [records count];
    
    if (options.conditions)
    {
        var matches = [];
        
        for (var i = 0; i < count; i++)
        {
            var record = records[i],
                matched = NO;
            
            for (conditionName in options.conditions)
            {
                var conditionValue = options.conditions[conditionName];
                if (conditionValue.isa && [conditionValue class] === CPArray)
                {
                    if (![conditionValue containsObject:[record valueForKey:conditionName]])
                        break;
                }
                else if ([record valueForKey:conditionName] != conditionValue)
                    break;
                
                [matches addObject:record];
                matched = YES;
            }
            
            if (matched && options.first)
                break;
        }
    }
    else
        var matches = records;
    
    if (!options.all)
    {
        var first = matches[0],
            last = matches[0];
        
        var count = [matches count];
        for (var i = 0; i < count; i++)
        {
            var record = matches[i];
            if ([record identifier] < [first identifier])
                first = record;
            if ([record identifier] > [last identifier])
                last = record;
        }
    }
    
    if (options.last)
        return last;
    else if (options.all)
        return matches;
    else
        return first;
}

+ (id)_find_by_ids:(id)ids
{
    var records = [CPActiveRecord _recordsForClass:self];
    
    switch ([ids class])
    {
        case CPNumber:
        case CPString:
                        var record = [records objectForKey:ids];
                        if (!record)
                            [self new:{'id':ids}];
                        
                        return record;
        case CPArray:
                        var count = [ids count], found = [];
                        for (var i = 0; i < count; i++)
                        {
                            var record = [records objectForKey:ids[i]];
                            if (record)
                                [found addObject:record];
                        }
                        return found;
    }
}

// Finder options builder for custom finder methods
+ (void)forwardInvocation:(CPInvocation)anInvocation
{
    var selector = [[anInvocation selector] substringFromIndex:4],
        options = {};
    
    var scope;
    if ([selector hasPrefix:@"All"])
        scope = @"all";
    else if ([selector hasPrefix:@"First"])
        scope = @"first";
    else if ([selector hasPrefix:@"Last"])
        scope = @"last";
    
    if (scope)
        options[scope] = YES;
    
    selector = [selector substringFromIndex:[scope length]];
    
    var attributes = [selector componentsSeparatedByString:@":"];
    [attributes removeLastObject];
    
    var count = [attributes count];
    for (var i = 0; i < count; i++)
    {
        var attribute = attributes[i],
            passedOption = [anInvocation argumentAtIndex:i+2];
        
        if ([attribute hasPrefix:@"By"] || [attribute hasPrefix:@"by"])
        {
            attribute = [attribute substringFromIndex:2];
            attribute = [[attribute characterAtIndex:0] lowercaseString] + [attribute substringFromIndex:1];
            
            if (!options.conditions)
                options.conditions = {};
            
            options.conditions[attribute] = passedOption;
        }
        else if ([attribute length] === 0)
        {
            for (var option in passedOption)
                options[option] = passedOption[option];
        }
    }
    
    [anInvocation setSelector:@selector(find:)];
    [anInvocation setArgument:options atIndex:2];
    [anInvocation invoke];
}

// Forward invocation for custom finders
+ (int)methodSignatureForSelector:(SEL)aSelector
{
    return [aSelector hasPrefix:@selector(find)];
}

@end

@implementation CPActiveRecord (Observers)

+ (void)addObserver:(id)anObserver selector:(SEL)aSelector
{
    [[CPNotificationCenter defaultCenter] addObserver:anObserver selector:aSelector name:CPActiveRecordCollectionDidLoad object:self];
    
    if (![self loadIfNeeded])
        objj_msgSend(anObserver, aSelector, [CPNotification notificationWithName:CPActiveRecordCollectionDidLoad object:self]);
}

- (void)addObserver:(id)anObserver selector:(SEL)aSelector
{
    [[CPNotificationCenter defaultCenter] addObserver:anObserver selector:aSelector name:CPActiveRecordRecordDidLoad object:self];
    
    if (![self loadIfNeeded])
        objj_msgSend(anObserver, aSelector, [CPNotification notificationWithName:CPActiveRecordRecordDidLoad object:self]);
}

+ (void)setAutoRefresh:(BOOL)shouldRefresh
{
    if (self._CPActiveRecordAutoRefresh)
        window.clearInterval(self._CPActiveRecordAutoRefresh);
    
    if (shouldRefresh)
        self._CPActiveRecordAutoRefresh = window.setInterval(function(){
            [self loadIfNeeded];
        }, [self syncFrequency]+1);
}

+ (BOOL)autoRefresh
{
    return self._CPActiveRecordAutoRefresh;
}

@end

@implementation CPActiveRecord (Loaders)

+ (float)syncFrequency
{
    return 5000;
}

+ (BOOL)loadIfNeeded
{
    var now = (new Date()).getTime();
    
    if (now > self._CPActiveRecordLastSync + [self syncFrequency])
    {
        self._CPActiveRecordLastSync = now;
        
        var request = [self collectionWillLoad];
        if (!request)
            return;
        
        var connection = [CPURLConnection connectionWithRequest:request delegate:self];
        connection.postTarget = self;
        connection.postAction = @selector(collectionDidLoad);
        
        return true;
    }
}

- (BOOL)loadIfNeeded
{
    if (!identifier)
        return;
    
    var now = (new Date()).getTime();
    
    if (now > _lastSync + [[self class] syncFrequency])
    {
        _lastSync = now;
        
        var request = [self recordWillLoad];
        if (!request)
            return;
        
        var connection = [CPURLConnection connectionWithRequest:request delegate:[self class]];
        connection.postTarget = self;
        connection.postAction = @selector(recordDidLoad);
        
        return true;
    }
}

+ (void)reload
{
    self._CPActiveRecordLastSync = 0;
    [self loadIfNeeded];
}

- (void)reload
{
    _lastSync = 0;
    [self loadIfNeeded];
}

- (void)save
{
    var request = [self recordWillSave];
    if (!request)
        return;
    
    var connection = [CPURLConnection connectionWithRequest:request delegate:[self class]];
    connection.postTarget = self;
    connection.postAction = @selector(recordDidSave);
}

- (void)destroy:(BOOL)confirm
{
    if (!confirm)
        return;
    
    var request = [self recordWillDestroy];
    if (!request)
        return;
    
    var connection = [CPURLConnection connectionWithRequest:request delegate:[self class]];
    connection.postTarget = self;
    connection.postAction = @selector(recordDidDestroy);
}

+ (BOOL)destroyPostsLoadNotification
{
    return NO;
}

+ (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)aResponse
{
    try
    {
        var data = [CPURLRequest parseJSON:aResponse];
    }
    catch (anException)
    {
        CPLog.info(@"Could not load resource");
        return;
    }
    
    [CPActiveRecord parseData:data];

    if (aConnection.postTarget && aConnection.postAction && [aConnection.postTarget respondsToSelector:aConnection.postAction])
        objj_msgSend(aConnection.postTarget, aConnection.postAction);
}

+ (void)parseData:(CPString)data
{
    if (!data)
        return;
    
    if (data.isa)
    {
        if ([data class] === CPArray)
        {
            var count = [data count];
            for (var i = 0; i < count; i++)
                [CPActiveRecord parseData:data[i]];
        }
    }
    else
    {
        for (var key in data)
        {
            var model = objj_getClass([key capitalizedString]);
            [model new:data[key]];
        }
    }
}

// Override these methods if you don't want to post notifications.

+ (CPURLRequest)collectionWillLoad
{
    [[CPNotificationCenter defaultCenter] postNotificationName:CPActiveRecordCollectionWillLoad object:self];
    
    return [CPURLRequest requestJSONWithURL:[self resourcePath]];
}

+ (void)collectionDidLoad
{
    [[CPNotificationCenter defaultCenter] postNotificationName:CPActiveRecordCollectionDidLoad object:self];
}

- (CPURLRequest)recordWillLoad
{
    [[CPNotificationCenter defaultCenter] postNotificationName:CPActiveRecordRecordWillLoad object:self];
    
    var path = [CPURL URLWithString:[[[self class] resourcePath] absoluteString] + @"/" + identifier],
        request = [CPURLRequest requestJSONWithURL:path];
    
    return request;
}

- (void)recordDidLoad
{
    [[CPNotificationCenter defaultCenter] postNotificationName:CPActiveRecordRecordDidLoad object:self];
}

- (CPURLRequest)recordWillSave
{
    [[CPNotificationCenter defaultCenter] postNotificationName:CPActiveRecordRecordWillSave object:self];
    
    var request = [CPURLRequest requestJSONWithURL:[[self class] resourcePath] + (identifier ? @"/" + [self identifier] : @"")];
    
    [request setHTTPMethod:identifier ? @"PUT" : @"POST"];
    [request setHTTPBody:[CPURLRequest stringifyJSON:[self attributes]]];
    
    return request;
}

- (void)recordDidSave
{
    [[CPNotificationCenter defaultCenter] postNotificationName:CPActiveRecordRecordDidSave object:self];
    
    [self recordDidLoad];
}

- (CPURLRequest)recordWillDestroy
{
    if (!identifier)
        return;
    
    [[CPNotificationCenter defaultCenter] postNotificationName:CPActiveRecordRecordWillDestroy object:self];
    
    var request = [CPURLRequest requestJSONWithURL:[[self class] resourcePath] + @"/" + identifier];
    [request setHTTPMethod:@"DELETE"];
    
    return request;
}

- (void)recordDidDestroy
{
    [[CPActiveRecord _recordsForClass:[self class]] removeObjectForKey:identifier];
    identifier = nil;
    
    [[CPNotificationCenter defaultCenter] postNotificationName:CPActiveRecordRecordDidDestroy object:self];
    
    if ([[self class] destroyPostsLoadNotification])
        [self recordDidLoad];
}

@end
