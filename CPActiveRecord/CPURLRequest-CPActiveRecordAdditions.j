/*
 * CPURLRequest+CPActiveRecordAdditions.j
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

@import <Foundation/CPURLRequest.j>


@implementation CPURLRequest (JSONRequest)

+ (id)requestJSONWithURL:(CPURL)aURL
{
    var request = [self requestWithURL:aURL];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    return request;
}

+ (JSObject)parseJSON:(CPString)aString
{
    try
    {
        var obj = JSON.parse(aString);
    }
    catch (anException)
    {
        CPLog.info(@"Could not parse JSON: " + aString);
    }
    
    if (obj)
        return obj;
}

+ (CPString)stringifyJSON:(JSObject)anObject
{
    try
    {
        var string = JSON.stringify(anObject);
    }
    catch (anException)
    {
        CPLog.info(@"Could not stringify JSON.");
    }
    
    if (string)
        return string;
}

@end


@import <Foundation/CPURLRequest.j>


@implementation CPURLRequest (JSONRequest)

+ (id)requestJSONWithURL:(CPURL)aURL
{
    var request = [self requestWithURL:aURL];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    return request;
}

+ (JSObject)parseJSON:(CPString)aString
{
    try
    {
        var obj = JSON.parse(aString);
    }
    catch (anException)
    {
        CPLog.info(@"Could not parse JSON: " + aString);
    }
    
    if (obj)
        return obj;
}

+ (CPString)stringifyJSON:(JSObject)anObject
{
    try
    {
        var string = JSON.stringify(anObject);
    }
    catch (anException)
    {
        CPLog.info(@"Could not stringify JSON.");
    }
    
    if (string)
        return string;
}

@end
