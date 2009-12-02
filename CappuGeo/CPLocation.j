/*
 * CPLocation.j
 * CappuGeo
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


LocationDidGeocode = @"LocationDidGeocode";

@implementation CPLocation : CPObject // Could just as easily be CPActiveRecord
{
    CPString            name            @accessors;
    
    float               lat             @accessors;
    float               lon             @accessors;
    float               _sensorLat      @accessors;
    float               _sensorLon      @accessors;
    
    CPString            street          @accessors;
    CPString            area            @accessors;
    CPString            city            @accessors;
    CPString            region          @accessors;
    CPString            country         @accessors;
    CPString            postal          @accessors;
    
    CPJSONPConnection   _geocodeConnection;
    CPJSONPConnection   _reverseGeocodeConnection;
}

- (void)probe
{
    if (lat && lon)
    {
        if (!city || !region)
            [self reverseGeocode];
    }
    else
    {
        if (street || area || city || region || country || postal)
            [self geocode];
    }
}

- (void)geocode
{
    if (!(street || area || city || region || country || postal))
        return [CPException raise:@"NoAddress" reason:@"Tried to geocode without an address."];
    
    if (_geocodeConnection)
    {
        [_geocodeConnection cancel];
        _geocodeConnection = nil;
    }
    
    var addressArray = [street, area, city, region, country, postal],
        query = encodeURIComponent([addressArray componentsJoinedByString:@","]),
        request = [CPURLRequest requestWithURL:@"http://tinygeocoder.com/create-api.php?q=" + query];
    
    _geocodeConnection = [CPJSONPConnection connectionWithRequest:request callback:@"callback" delegate:self];
}

- (void)reverseGeocode
{
    if (!lat || !lon)
        return [CPException raise:@"NoCoordinates" reason:@"Tried to reverse geocode without coordinates."];
    
    if (_reverseGeocodeConnection)
    {
        [_reverseGeocodeConnection cancel];
        _reverseGeocodeConnection = nil;
    }
    
    var coordinatesArray = [lat, lon],
        query = encodeURIComponent([coordinatesArray componentsJoinedByString:@","]),
        request = [CPURLRequest requestWithURL:@"http://tinygeocoder.com/create-api.php?g=" + query];
    
    _reverseGeocodeConnection = [CPJSONPConnection connectionWithRequest:request callback:@"callback" delegate:self];
}

- (CPString)displayArea
{
    return city + @", " + region;
}

- (CPString)coords
{
    return lat + @"," + lon;
}

- (CPString)_sensorCoords
{
    return _sensorLat + @"," + _sensorLon;
}

@end

@implementation CPLocation (CPJSONPConnection)

- (void)connection:(CPJSONPConnection)aConnection didReceiveData:(id)anObject
{
    if (_geocodeConnection === aConnection)
    {
        [self setLat:anObject[0]];
        [self setLon:anObject[1]];
    }
    else if (_reverseGeocodeConnection === aConnection)
    {
        // Wrong! Results returned by tinygeocoder are inconsistent!
        var components = [anObject componentsSeparatedByString:@", "],
            regionality = [components[2] componentsSeparatedByString:@" "];
        
        [self setStreet:components[0]];
        [self setCity:components[1]];
        [self setRegion:regionality[0]];
        [self setPostal:regionality[1]];
        [self setCountry:components[3]];
    }
    else
        return;
    
    [[CPNotificationCenter defaultCenter] postNotificationName:LocationDidGeocode object:self];
}

- (void)connection:(CPJSONPConnection)aConnection didFailWithError:(CPString)anError
{
    
}

@end

@implementation CPLocation (CPCoding)

- (id)initWithCoder:(CPCoder)aCoder
{
    self = [self init];
    
    if (self)
    {
        lat = [aCoder decodeFloatForKey:@"lat"];
        lon = [aCoder decodeFloatForKey:@"lon"];
        _sensorLat = [aCoder decodeFloatForKey:@"sensorLat"];
        _sensorLon = [aCoder decodeFloatForKey:@"sensorLon"];
        
        street = [aCoder decodeObjectForKey:@"street"];
        area = [aCoder decodeObjectForKey:@"area"];
        city = [aCoder decodeObjectForKey:@"city"];
        region = [aCoder decodeObjectForKey:@"region"];
        country = [aCoder decodeObjectForKey:@"country"];
        postal = [aCoder decodeObjectForKey:@"postal"];
    }
    
    return self;
}

- (void)encodeWithCoder:(CPCoder)aCoder
{
    [aCoder encodeFloat:lat forKey:@"lat"];
    [aCoder encodeFloat:lon forKey:@"lon"];
    [aCoder encodeFloat:_sensorLat forKey:@"sensorLat"];
    [aCoder encodeFloat:_sensorLon forKey:@"sensorLon"];
    
    [aCoder encodeObject:street forKey:@"street"];
    [aCoder encodeObject:area forKey:@"area"];
    [aCoder encodeObject:city forKey:@"city"];
    [aCoder encodeObject:region forKey:@"region"];
    [aCoder encodeObject:country forKey:@"country"];
    [aCoder encodeObject:postal forKey:@"postal"];
}

@end
